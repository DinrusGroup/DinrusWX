//-----------------------------------------------------------------------------
// wxD/Samples - Диалогs.d
//
// A wxD version of the wxWidgets "dialogs" sample.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Диалогs.d,v 1.12 2009/01/16 14:38:22 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
pragma(lib, "wxd.lib");
version (Tango)
{
import tango.core.Version;
private import tango.текст.convert.Integer;
static if (Tango.Major == 0 && Tango.Minor < 994)
alias tango.текст.convert.Integer.toUtf8 toString;
else
alias tango.текст.convert.Integer.toString toString;
private import tango.текст.Util;
ptrdiff_t indexOf(ткст a, ткст с) { return 0 /*TODO*/; }
ptrdiff_t LastIndexOf(ткст a, ткст с) { return 0 /*TODO*/; }
private import tango.math.Random;
private import tango.io.FileSystem;
alias FileSystem.getDirectory GETCWD;
бцел RAND() { return 0 /*Random.shared.next*/; }
}
else // Phobos
{
private import std.string;
private import std.random;
alias std.string.find indexOf;
alias std.string.rfind LastIndexOf;
alias std.file.getcwd GETCWD;
alias std.random.rand RAND;
}

	public class MyFrame : Фрейм
	{
		enum Cmd 
		{
			ChooseColour = 1, ChooseFont,
			MessageBox, SingleChoice, MultiChoice,
			TextEntry, PasswordEntry,
			FileOpen, FileOpen2, FilesOpen, FileSave,
			DirChoose, DirNewChoose,
			Tip, NumEntry, LogДиалог,
			Modal, Modeless, ModelessBtn,
			Progress, Busyinfo,
			Find, Замени,
			Exit
		}

		// for FileOpen2
		public static ткст s_extDef="";

		// for Find and Замени
		public FindReplaceData m_findData;
		public ДиалогПоискЗамена m_dlgFind;
		public ДиалогПоискЗамена m_dlgReplace;

		public MyModelessДиалог m_dialog;

		private MyCanvas canvas;

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер size)
		{
			super(title, поз, size);
			// Установи the окно иконка
			иконка = new Icon("../Samples/Диалогs/mondrian.png");

			// Установи up a меню
			Меню fileMenu = new Меню();
			fileMenu.Append(Cmd.ChooseColour,	"&Choose Цвет");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.ChooseFont, 	"Choose &Шрифт");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.LogДиалог, 	"&Log dialog\tCtrl-L");
			fileMenu.Append(Cmd.MessageBox, 	"&Message Box\tCtrl-M");
			fileMenu.Append(Cmd.TextEntry, 	"Текст &entry\tCtrl-E");
			fileMenu.Append(Cmd.PasswordEntry, 	"&Password entry\tCtrl-P");
			fileMenu.Append(Cmd.NumEntry, 		"&Numeric entry\tCtrl-N");
			fileMenu.Append(Cmd.SingleChoice, 	"&Single choice\tCtrl-C");
			fileMenu.Append(Cmd.MultiChoice, 	"M&ultiple choice\tCtrl-U");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.Tip,		"&Tip of the day\tCtrl-T");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.FileOpen, 		"&Открой file\tCtrl-O");
			fileMenu.Append(Cmd.FileOpen2, 	"&Second open file\tCtrl-2");
			fileMenu.Append(Cmd.FilesOpen, 	"Открой &files\tCtrl-3");
			fileMenu.Append(Cmd.FileSave, 		"Sa&ve file\tCtrl-S");
			fileMenu.Append(Cmd.DirChoose, 	"Choose &Directory\tCtrl-D");
			fileMenu.Append(Cmd.Progress, 		"Pro&gress dialog\tCtrl-G");
			fileMenu.Append(Cmd.Busyinfo, 		"&Busy info dialog\tCtrl-B");
			fileMenu.AppendCheckItem(Cmd.Find,	"&Find dialog\tCtrl-F", "");
			fileMenu.AppendCheckItem(Cmd.Замени,	"Find and &replace dialog\tShift-Ctrl-F", "");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.Modal,	"Mo&dal dialog\tCtrl-W");
			fileMenu.AppendCheckItem(Cmd.Modeless,	"Modeless &dialog\tCtrl-Z", "");

			fileMenu.AppendSeparator();

			fileMenu.Append(Cmd.Exit, "E&xit\tAlt-X");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(fileMenu, "&File");

			this.menuBar = menuBar;

			// Установи up a status bar
			CreateStatusBar();

			// Create the canvas for drawing
			canvas = new MyCanvas(this);

			// Установи up the event table
			EVT_MENU(Cmd.ChooseColour,     &OnChooseColour);
			EVT_MENU(Cmd.ChooseFont,       &OnChooseFont);

			EVT_MENU(Cmd.DirChoose,        &OnDirChoose);

			EVT_MENU(Cmd.LogДиалог,	&OnLogДиалог);
			EVT_MENU(Cmd.MessageBox,	&OnMessageBox);
			EVT_MENU(Cmd.TextEntry,	&OnTextEntry);
			EVT_MENU(Cmd.PasswordEntry,	&OnPasswordEntry);
			EVT_MENU(Cmd.NumEntry,		&OnNumericEntry);
			EVT_MENU(Cmd.SingleChoice,	&OnSingleChoice);
			EVT_MENU(Cmd.MultiChoice,	&OnMultiChoice);

			EVT_MENU(Cmd.Tip,		&OnTip);

			EVT_MENU(Cmd.FileOpen,		&OnFileOpen);
			EVT_MENU(Cmd.FileOpen2,	&OnFileOpen2);
			EVT_MENU(Cmd.FilesOpen,	&OnFilesOpen);
			EVT_MENU(Cmd.FileSave,		&OnFileSave);
			EVT_MENU(Cmd.Progress,		&OnProgress);
			EVT_MENU(Cmd.Busyinfo,		&OnBusyinfo);
			EVT_MENU(Cmd.Find,		&OnFind);
			EVT_MENU(Cmd.Замени,		&OnReplace);
			EVT_MENU(Cmd.Modal,		&OnModal);
			EVT_MENU(Cmd.Modeless,		&OnModeless);

			EVT_FIND(-1,			&OnFindEvent);
			EVT_FIND_NEXT(-1,			&OnFindEvent);
			EVT_FIND_REPLACE(-1,		&OnFindEvent);
			EVT_FIND_REPLACE_ALL(-1,		&OnFindEvent);
			EVT_FIND_CLOSE(-1,			&OnFindEvent);

			EVT_MENU(Cmd.Exit,             &ПриВыходе);

			m_findData = new FindReplaceData();
		}

		//---------------------------------------------------------------------

		public проц OnChooseColour(Объект sender, Событие e)
		{
			ColourData данные = new ColourData();

			данные.colour = canvas.ЦветЗП;
			данные.ChooseFull = да;

			for(цел i = 0; i < 16; i++) 
			{
				ббайт rgb = cast(ббайт)(i * 16);
				Цвет col = new Цвет(rgb, rgb, rgb);
				данные.SetCustomColour(i, col);
			}

			ColourДиалог cd = new ColourДиалог(this, данные);
			cd.Title = "Choose the background colour";

			if (cd.ShowModal() == wxID_OK) 
			{
				canvas.ЦветЗП = cd.colourData.colour;
				//canvas.Очисть();
				canvas.Refresh();
			}
		}

		public проц OnChooseFont(Объект sender, Событие e)
		{
			FontData данные = new FontData();
			данные.InitialFont = canvas.шрифт;
			данные.colour = canvas.textColour;

			FontДиалог fd = new FontДиалог(this, данные);

			if (fd.ShowModal() == wxID_OK) 
			{
				canvas.шрифт = fd.fontData.ChosenFont;
				canvas.textColour = fd.fontData.colour;
				canvas.Refresh();
			}
		}

		public проц OnDirChoose(Объект sender, Событие e)
		{
			ткст dirHome = GETCWD();
			DirДиалог dlg = new DirДиалог(this, "Testing directory picker",
				dirHome);

			if (dlg.ShowModal() == Диалог.wxID_OK) 
			{
				Log.LogMessage("Selected путь: " ~ dlg.Путь);
			}
		}

		public проц OnLogДиалог(Объект sender, Событие e)
		{
		{
			BusyCursor bc = new BusyCursor();
			Log.LogMessage("This is some message - everything is ok so far.");
			Log.LogMessage("Another message...\n... this one is on multiple lines");
			Log.LogWarning("And then something went wrong!");

			//wxYield();
			bc.Dispose();
		}

			Log.LogError("Intermediary error handler decided to abort.");
			Log.LogError("The top level caller detected an unrecoverable error.");

			Log.FlushActive();

			Log.LogMessage("And this is the same dialog but with only one message.");
		}

		public проц OnMessageBox(Объект sender, Событие e)
		{
			MessageДиалог md = new MessageДиалог(this, "This is a message box\nA long, long ткст to test out the message box properly",
				"Message box текст", Диалог.wxNO_DEFAULT|Диалог.wxYES_NO|Диалог.wxCANCEL|Диалог.wxICON_INFORMATION);

			switch (md.ShowModal())
			{
				case Диалог.wxID_YES:		Log.LogStatus("You pressed \"Yes\"");
					break;
				case Диалог.wxID_NO:		Log.LogStatus("You pressed \"No\"");
					break;
				case Диалог.wxID_CANCEL:	Log.LogStatus("You pressed \"Cancel\"");
					break;
				default:			Log.LogStatus("Unexpected wxMessageДиалог return code!");
					break;
			}
		}

		public проц OnTextEntry(Объект sender, Событие e)
		{
			TextEntryДиалог ted = new TextEntryДиалог(this,
				"This is a small sample\n" ~
				"A long, long ткст to test out the текст entrybox",
				"Please enter a ткст",
				"Default значение",
				Диалог.wxOK | Диалог.wxCANCEL);

			if (ted.ShowModal() == Диалог.wxID_OK)
			{
				MessageДиалог md = new MessageДиалог(this, ted.Value, "Got ткст");
				md.ShowModal();
			}
		}

		public проц OnPasswordEntry(Объект sender, Событие e)
		{
			ткст pwd = GetPasswordFromUser("Enter password:",
				"Password entry dialog",
				"",
				this);

			if (pwd.length > 0)
			{
				MessageДиалог md = new MessageДиалог(this, "Your password is " ~ pwd, "Got password");
				md.ShowModal();
			}
		}

		public проц OnNumericEntry(Объект sender, Событие e)
		{
			цел res = GetNumberFromUser( "This is some текст, actually a lot of текст.\n" ~
				"Even two rows of текст.",
				"Enter a number:",
				"Numeric input test",
				50, 0, 100, this );

			ткст msg;
			цел иконка;
			if ( res == -1 )
			{
				msg = "Invalid number entered or dialog cancelled.";
				иконка = Диалог.wxICON_HAND;
			}
			else
			{
				msg = "You've entered " ~ .toString(res);
				иконка = Диалог.wxICON_INFORMATION;
			}

			MessageДиалог md = new MessageДиалог(this, msg, "Numeric test result", Диалог.wxOK | иконка);
			md.ShowModal();
		}

		public проц OnSingleChoice(Объект sender, Событие e)
		{
			ткст[] choices = [ "One", "Two", "Three", "Four", "Five"];

			SingleChoiceДиалог scd = new SingleChoiceДиалог(this,"This is a small sample\n" ~
				"A single-choice dialog",
				"Please select a значение",
				choices);
			scd.Selection = 2;

			if (scd.ShowModal() == wxID_OK)
			{
				MessageДиалог md = new MessageДиалог(this, scd.StringSelection(), "Got ткст");
				md.ShowModal();
			}
		}

		public проц OnMultiChoice(Объект sender, Событие e)
		{
			// OnMultiChoice uses MultiChoiceДиалог instead of GetMultipleChoices which isn't implemented yet
			ткст[] choices = [
														  "One", "Two", "Three", "Four", "Five",
														  "Six", "Seven", "Eight", "Nine", "Ten",
														  "Eleven", "Twelve", "Seventeen" ];

			MultiChoiceДиалог mcd = new MultiChoiceДиалог(this, "This is a small sample\n" ~
				"A multi-choice convenience dialog",
				"Please select a значение",
				choices);
			if (mcd.ShowModal() == wxID_OK)
			{
				цел[] selections = mcd.GetSelections();
				цел счёт = selections.length;
				ткст msg;
				msg = "You selected " ~ .toString(счёт) ~ " items:\n";
				for (цел n = 0; n < счёт; n++)
				{
					msg ~= "\t" ~ .toString(n) ~ ": " ~ .toString(selections[n]) ~ " (" ~ choices[selections[n]] ~ ")\n";
				}

				MessageДиалог md = new MessageДиалог(this, msg, "Information");
				md.ShowModal();
			}

		}

		public проц OnTip(Объект sender, Событие e)
		{
			// we have to use a ЦУк, class wxTipProvider is abstract and wxFileTipProvider private
			ЦУк tp = TipProvider.CreateFileTipProvider("../Samples/Диалогs/tips.txt", RAND());

			бул showAtStartup = TipProvider.ShowTip(this, tp);

			if ( showAtStartup )
			{
				MessageBox(this, "Will show tips on startup", "Tips dialog",
					Диалог.wxOK | Диалог.wxICON_INFORMATION);
			}

			// does nothing, only for example
			цел s_index = TipProvider.CurrentTip;
		}

		public проц OnFileOpen(Объект sender, Событие e)
		{
			ФайлДиалог fd = new ФайлДиалог(this,
				"Testing open file dialog",
				"",
				"",
				"cs files (*.cs)|*.cs");

			fd.Directory = GetHomeDir();

			if (fd.ShowModal() == wxID_OK)
			{
				ткст info = "Full file имя: " ~ fd.Путь ~ "\n" ~
					"Путь: " ~ fd.Directory ~ "\n" ~
					"Имя: " ~ fd.Filename;
				MessageДиалог md = new MessageДиалог(this, info, "Selected file");
				md.ShowModal();
			}
		}

		public проц OnFileOpen2(Объект sender, Событие e)
		{
			ткст путь = FileSelector( "Select the file to load",
				"", "", s_extDef,
				"Waveform (*.wav)|*.wav|Plain текст (*.txt)|*.txt|All files (*.*)|*.*",
				ФайлДиалог.wxCHANGE_DIR,
				this );
			if (путь.length == 0) return;

			s_extDef = путь[путь.LastIndexOf(".") + 1..путь.length];

			MessageДиалог md = new MessageДиалог(this,
				"You selected the file '" ~ путь ~
				"', remembered extension '" ~ s_extDef ~ "'",
				"FileOpen2");
			md.ShowModal();
		}

		public проц OnFilesOpen(Объект sender, Событие e)
		{
			ФайлДиалог fd = new ФайлДиалог(this,
				"Testing open multiple file dialog",
				"", "", "*",
				ФайлДиалог.wxMULTIPLE);

			if (fd.ShowModal() == wxID_OK)
			{
				ткст[] paths, filenames;
				paths = fd.Paths;
				filenames = fd.Именаф;

				ткст msg = "";
				for (цел n = 0; n < paths.length; n++)
				{
					msg ~= "File " ~ .toString(n) ~ ": " ~ paths[n] ~ " " ~
						" (" ~ filenames[n] ~ ")\n";
				}

				MessageДиалог md = new MessageДиалог(this, msg, "Selected files");
				md.ShowModal();
			}
		}

		public проц OnFileSave(Объект sender, Событие e)
		{
			ФайлДиалог fd = new ФайлДиалог(this,
				"Testing save file dialog",
				"",
				"myletter.doc",
				"Текст files (*.txt)|*.txt|Document files (*.doc)|*.doc",
				ФайлДиалог.wxSAVE | ФайлДиалог.wxOVERWRITE_PROMPT);

			fd.FilterIndex = 1;

			if (fd.ShowModal() == wxID_OK)
			{
				MessageДиалог md = new MessageДиалог(this, fd.Путь ~ ", filter " ~ .toString(fd.FilterIndex), "FileSave");
				md.ShowModal();
			}
		}

		public проц OnProgress(Объект sender, Событие e)
		{
			цел max = 10;

			ProgressДиалог pd = new ProgressДиалог(
				"Progress dialog example",
				"An informative message",
				max,
				this,
				ProgressДиалог.wxPD_CAN_ABORT |
				ProgressДиалог.wxPD_APP_MODAL |
				// ProgressДиалог.wxPD_AUTO_HIDE | -- try cast(well)this
				ProgressДиалог.wxPD_ELAPSED_TIME |
				ProgressДиалог.wxPD_ESTIMATED_TIME |
				ProgressДиалог.wxPD_REMAINING_TIME);

			бул cont = да;
			for ( цел i = 0; i <= max; i++)
			{
				wxSleep(1);
				if ( i == max )
				{
					cont = pd.Обнови(i, "That's all, folks!");
				}
				else if ( i == max / 2 )
				{
					cont = pd.Обнови(i, "Only a half left (very long message)!");
				}
				else
				{
					cont = pd.Обнови(i);
				}
				if ( !cont )
				{
					MessageДиалог md = new MessageДиалог(this,
						"Do you really want to cancel?",
						"Progress dialog question",
						Диалог.wxYES_NO | Диалог.wxICON_QUESTION);
					if (md.ShowModal() == wxID_YES)
					{
						// use Dispose() or Show(нет) to close the ProgressДиалог
						// otherwise the dialog won't get closed and the прил hangs
						//pd.Dispose();
						pd.Show(нет);					
						break;
					}
					pd.Resume();
				}
			}
		
			pd.Dispose();
		}

		public проц OnBusyinfo(Объект sender, Событие e)
		{
			auto WindowDisabler disableAll = new WindowDisabler();

			auto BusyInfo info = new BusyInfo("Working, please wait...", this);

			for ( цел i = 0; i < 18; i++ )
			{
				Прил.ДайПрил().Yield();
				// or wxYield();
			}

			wxSleep(1);

		}

		public проц OnFind(Объект sender, Событие e)
		{
			m_dlgFind = new ДиалогПоискЗамена(
				this,
				m_findData,
				"Find Диалог",
				ДиалогПоискЗамена.wxFR_NOWHOLEWORD);
			m_dlgFind.Show(да);
		}

		public проц OnReplace(Объект sender, Событие e)
		{
			m_dlgReplace = new ДиалогПоискЗамена(
				this,
				m_findData,
				"Find and replace dialog",
				ДиалогПоискЗамена.wxFR_REPLACEDIALOG);
			m_dlgReplace.Show(да);
		}

		public ткст DecodeFindДиалогEventFlags(цел флаги)
		{
			ткст 	str = (((флаги & ДиалогПоискЗамена.wxFR_DOWN) != 0) ? "down" : "up") ~ ", " ~
				(((флаги & ДиалогПоискЗамена.wxFR_WHOLEWORD) != 0) ? "whole words only, " : "") ~
				(((флаги & ДиалогПоискЗамена.wxFR_MATCHCASE) != 0) ? "" : "not ") ~
				"case sensitive";

			return str;
		}

		public проц OnFindEvent(Объект sender, Событие e)
		{
			FindДиалогEvent fre= cast(FindДиалогEvent)e;
			цел etype = fre.ТипСоб;

			if ( etype == Событие.wxEVT_COMMAND_FIND   || etype == Событие.wxEVT_COMMAND_FIND_NEXT )
			{
				Log.LogMessage("Find %s'%s' (флаги: {%s})",
					etype == Событие.wxEVT_COMMAND_FIND_NEXT ? "next " : "",
					fre.FindString,
					DecodeFindДиалогEventFlags(fre.Флаги));
			}
			else if ( etype == Событие.wxEVT_COMMAND_FIND_REPLACE ||
				etype == Событие.wxEVT_COMMAND_FIND_REPLACE_ALL )
			{
				Log.LogMessage("Замени %s'%s' with '%s' (флаги: %s)",
					etype == Событие.wxEVT_COMMAND_FIND_REPLACE_ALL ? "all " : "",
					fre.FindString,
					fre.ReplaceString,
					DecodeFindДиалогEventFlags(fre.Флаги));
			}
			else if ( etype == Событие.wxEVT_COMMAND_FIND_CLOSE )
			{
				ДиалогПоискЗамена dlg = fre.Диалог;

				цел idMenu;
				ткст txt;
				if ( dlg == m_dlgFind )
				{
					txt = "Find";
					idMenu = Cmd.Find;
					m_dlgFind = пусто;
				}
				else if ( dlg == m_dlgReplace )
				{
					txt = "Замени";
					idMenu = Cmd.Замени;
					m_dlgReplace = пусто;
				}
				else
				{
					txt = "Unknown";
					idMenu = -1;

					// wxFAIL_MSG...
					Log.LogError("unexpected event");
				}

				Log.LogMessage("%s dialog is being closed.", txt);

				if ( idMenu != -1 )
				{
					menuBar.Check(idMenu, нет);
				}

				dlg.Разрушь();
			}
			else
			{
				Log.LogError("Unknown find dialog event!");
			}
		}

		public проц OnModal(Объект sender, Событие e)
		{
			MyModalДиалог dlg = new MyModalДиалог(this);
			dlg.ShowModal();
		}

		public проц OnModeless(Объект sender, Событие e)
		{
			CommandEvent ce = cast(CommandEvent) e;
			бул show = menuBar.IsChecked(ce.ИД);

			if ( show )
			{
				m_dialog = new MyModelessДиалог(this);
				m_dialog.Show(да);
			}
			else
			{
				m_dialog.Hide();
			}
		}

		//---------------------------------------------------------------------

		public проц ПриВыходе(Объект sender, Событие e)
		{
			Закрой(да);
		}

		//---------------------------------------------------------------------
	}

	public class MyCanvas : ScrolledWindow
	{
		public Шрифт шрифт;
		public Цвет textColour;

		public this(Окно родитель)
		{
			super(родитель);
			шрифт = Шрифт.wxNORMAL_FONT;
			textColour = new Цвет(0, 0, 0);
			
			EVT_PAINT(&OnPaint);
		}

		public проц OnPaint(Объект sender, Событие e)
		{
			PaintDC dc = new PaintDC(this);
			dc.шрифт = шрифт;
			dc.ППланТекста = textColour;
			dc.ФоновыйРежим = СтильЗаливки.wxTRANSPARENT;
			dc.РисуйТекст("wxWidgets common dialogs test application", 10, 10);
			dc.Dispose(); //needed
		}
	}

	//---------------------------------------------------------------------

	public class MyModelessДиалог : Диалог
	{
		enum Ид 
		{
			DIALOG_MODELESS_BTN = 1
		}

		public this(Окно родитель)
		{
			super(родитель, -1, "Modeless dialog");
			BoxSizer sizerTop = new BoxSizer(Ориентация.wxVERTICAL);

			Кнопка btn = new Кнопка(this, Ид.DIALOG_MODELESS_BTN, "Press me");
			CheckBox check = new CheckBox(this, -1, "Should be disabled");
			check.Disable();

			sizerTop.Добавь(btn, 1, Stretch.wxEXPAND | Direction.wxALL, 5);
			sizerTop.Добавь(check, 1, Stretch.wxEXPAND | Direction.wxALL, 5);

			AutoLayout = да;
			SetSizer(sizerTop);

			sizerTop.SetSizeHints(this);
			sizerTop.Fit(this);

			EVT_BUTTON(Ид.DIALOG_MODELESS_BTN, &OnButton);
			EVT_CLOSE(&OnClose);
		}

		public проц OnButton(Объект sender, Событие e)
		{
			MessageBox(this, "Кнопка pressed in modeless dialog", "Info",
				Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}

		public проц OnClose(Объект sender, Событие e)
		{
			// must add CloseEvent...
			// must add Событие.Veto
		}
	}

	//---------------------------------------------------------------------

	public class MyModalДиалог : Диалог
	{
		public Кнопка m_btnFocused;
		public Кнопка m_btnDelete;

		public this(Окно родитель)
		{
			super(родитель, -1, "Modal dialog");
			BoxSizer sizerTop = new BoxSizer(Ориентация.wxHORIZONTAL);

			m_btnFocused = new Кнопка(this, -1, "Default button");
			m_btnDelete = new Кнопка(this, -1, "&Delete button");
			Кнопка btnOk = new Кнопка(this, wxID_CANCEL, "&Закрой");
			sizerTop.Добавь(m_btnFocused, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
			sizerTop.Добавь(m_btnDelete, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
			sizerTop.Добавь(btnOk, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 5);

			AutoLayout = да;
			SetSizer(sizerTop);

			sizerTop.SetSizeHints(this);
			sizerTop.Fit(this);

			m_btnFocused.SetFocus();
			m_btnFocused.SetDefault();

			EVT_BUTTON(-1, &OnButton);
		}

		public проц OnButton(Объект sender, Событие e)
		{
			CommandEvent ce = cast(CommandEvent) e;

			if ( ce.ОбъСоб == m_btnDelete )
			{
				//m_btnFocused = пусто;
				m_btnDelete.Disable();
				m_btnFocused.Hide();
			}
			else if (ce.ОбъСоб == m_btnFocused )
			{
				GetTextFromUser("Dummy prompt",
					"Modal dialog called from dialog",
					"", this);
			}
			else
			{
				e.Пропусти();
			}
		}
	}

	public class Диалогs : Прил
	{
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame("wxWidgets Диалогs Example",
				Точка(50,50), Размер(450,340));
			frame.Show(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			Диалогs прил = new Диалогs();
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}

проц main()
{
	Диалогs.Main();
}
