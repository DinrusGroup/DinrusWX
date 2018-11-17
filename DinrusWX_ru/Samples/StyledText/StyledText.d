//-----------------------------------------------------------------------------
// wxD/Samples - StyledText.d
//
// A wxD version of the wxWidgets "contrib/stc/stctest" sample.
//
// (C) 2003 Otto Wyss
// (C) 2006 afb <afb.sourceforge.net>
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StyledText.d,v 1.5 2008/09/26 11:37:06 afb Exp $
//-----------------------------------------------------------------------------

module StyledText;

version (Tango)
static assert(0);
else // Phobos
import std.c : fmin; // for DeterminePrintSize


import wx.wx;
import wx.Display;     // to calculate print Размер

import defsext;	       // Additional definitions
import Edit;	       // Edit module
import Prefs;	       // Prefs
import FileNameFunc;   // Normalize file path.

ткст mondrian = "../Samples/StyledText/mondrian.png";

//============================================================================
// declarations
//============================================================================

ткст APP_NAME = "STC-Test";
ткст APP_DESCR = "See http://wxguide.sourceforge.net/";

ткст APP_MAINT = "Otto Wyss";
ткст APP_VENDOR = "wxWidgets";
ткст APP_COPYRIGHT = "(C) 2003 Otto Wyss";
ткст APP_LICENCE = "wxWidgets";

ткст APP_VERSION = "0.1.alpha";
ткст APP_BUILD = __DATE__;

ткст APP_WEBSITE = "http://www.wxWidgets.org";
ткст APP_MAIL = "mailto://???";

ткст NONAME = "<untitled>";

//----------------------------------------------------------------------------
// global application имя
ткст g_appname = null;

// global print data, to remember settings during the session
PrintData g_printData = null;
PageУстupDialogData g_pageУстupData = null;

//============================================================================
// implementations
//============================================================================

проц main()
{
	StyledTextApp app = new StyledTextApp();
	app.Пуск();
}


//----------------------------------------------------------------------------
// StyledTextApp
//----------------------------------------------------------------------------

public class StyledTextApp : Апп {

	private AppFrame frame;

	// the main function called durning application start
	public override бул ПоИниц () {

		Рисунок.InitAllHandlers();

		// set application and vendor имя
		ИмяАпп = (APP_NAME);
		ИмяВендора = (APP_VENDOR);
		g_appname = APP_VENDOR ~ "-" ~ APP_NAME;

		// initialize print data and setup
		g_printData = new PrintData;
		g_pageУстupData = new PageУстupDialogData;

		// create application frame
		frame = new AppFrame (assumeUnique(g_appname));

		// open application frame
		frame.Раскладка ();
		frame.Покажи (да);
		ТопОкно = (frame);

		return да;
	}
}

//----------------------------------------------------------------------------
// AppFrame
//----------------------------------------------------------------------------

public class AppFrame : Frame
{

	private Edit edit;
	private MenuBar m_menuBar;

	// constructor
	public this (ткст title)
	{
		super(null, wxID_ANY, title, вхДефПоз, Размер(750,550),
					wxDEFAULT_FRAME_STYLE | wxNO_FULL_REPAINT_ON_RESIZE);

		// about box shown for 1 seconds
		// Note: moved here, since otherwise it crashes on wxMac...
		AppAbout dlg = new AppAbout(this, 1000);

		// set пиктограмма and background
		Титул = g_appname;
		пиктограмма = new Пиктограмма(mondrian);
		ЦветФона = new Цвет("WHITE");

		// create меню
		m_menuBar = new MenuBar;
		CreateMenu ();

		// open first page
		edit = new Edit (this, wxID_ANY);
		edit.УстФокус();

		FileOpen ("../Samples/StyledText/StyledText.d");

		// common
		EVT_CLOSE (                         cast(ДатчикСобытий)&OnClose);
		// file
		EVT_MENU (MenuIDs.wxID_OPEN,        &OnFileOpen);
		EVT_MENU (MenuIDs.wxID_SAVE,        &OnFileSave);
		EVT_MENU (MenuIDs.wxID_SAVEAS,      &OnFileSaveAs);
		EVT_MENU (MenuIDs.wxID_CLOSE,       &OnFileClose);
		// properties
		EVT_MENU (myID_PROPERTIES,          &OnProperties);
		// print and exit
		EVT_MENU (MenuIDs.wxID_PRINT_SETUP, &OnPrintУстup);
		EVT_MENU (MenuIDs.wxID_PREVIEW,     &OnPrintPreview);
		EVT_MENU (MenuIDs.wxID_PRINT,       &OnPrint);
		EVT_MENU (MenuIDs.wxID_EXIT,        &ПоВыходу);
		// edit
		EVT_MENU (MenuIDs.wxID_CLEAR,       &OnEdit);
		EVT_MENU (MenuIDs.wxID_CUT,         &OnEdit);
		EVT_MENU (MenuIDs.wxID_COPY,        &OnEdit);
		EVT_MENU (MenuIDs.wxID_PASTE,       &OnEdit);
		EVT_MENU (myID_INDENTINC,           &OnEdit);
		EVT_MENU (myID_INDENTRED,           &OnEdit);
		EVT_MENU (MenuIDs.wxID_SELECTALL,   &OnEdit);
		EVT_MENU (myID_SELECTLINE,          &OnEdit);
		EVT_MENU (MenuIDs.wxID_REDO,        &OnEdit);
		EVT_MENU (MenuIDs.wxID_UNDO,        &OnEdit);
		// find
		EVT_MENU (MenuIDs.wxID_FIND,        &OnEdit);
		EVT_MENU (myID_FINDNEXT,            &OnEdit);
		EVT_MENU (myID_REPLACE,             &OnEdit);
		EVT_MENU (myID_REPLACENEXT,         &OnEdit);
		EVT_MENU (myID_BRACEMATCH,          &OnEdit);
		EVT_MENU (myID_GOTO,                &OnEdit);
		// view
		EVT_MENU_RANGE (myID_HILIGHTFIRST, myID_HILIGHTLAST,
		                                    &OnEdit);
		EVT_MENU (myID_DISPLAYEOL,          &OnEdit);
		EVT_MENU (myID_INDENTGUIDE,         &OnEdit);
		EVT_MENU (myID_LINENUMBER,          &OnEdit);
		EVT_MENU (myID_LONGLINEON,          &OnEdit);
		EVT_MENU (myID_WHITESPACE,          &OnEdit);
		EVT_MENU (myID_FOLDTOGGLE,          &OnEdit);
		EVT_MENU (myID_OVERTYPE,            &OnEdit);
		EVT_MENU (myID_READONLY,            &OnEdit);
		EVT_MENU (myID_WRAPMODEON,          &OnEdit);
		// extra
		EVT_MENU (myID_CHANGELOWER,         &OnEdit);
		EVT_MENU (myID_CHANGEUPPER,         &OnEdit);
		EVT_MENU (myID_CONVERTCR,           &OnEdit);
		EVT_MENU (myID_CONVERTCRLF,         &OnEdit);
		EVT_MENU (myID_CONVERTLF,           &OnEdit);
		EVT_MENU (myID_CHARSETANSI,         &OnEdit);
		EVT_MENU (myID_CHARSETMAC,          &OnEdit);
		// help
		EVT_MENU (MenuIDs.wxID_ABOUT,       &OnAbout);
	}

	// common event handlers
	public проц OnClose (Объект отправитель, CloseEvent event)
	{
		СобытиеКоманда evt;
		OnFileClose (this, evt);

		if (edit && edit.Modified()) {
			if (event.CanVeto())
				event.Veto (да);
			return;
		}
		Разрушь();
	}

	public проц OnAbout (Объект отправитель, Событие event)
	{
		scope AppAbout dlg = new AppAbout(this);
	}

	public проц ПоВыходу (Объект отправитель, Событие event)
	{
		Закрой (да);
	}

	// file event handlers
	public проц OnFileOpen (Объект отправитель, Событие event)
	{
		if (!edit) return;
		
		ткст fname;
		scope FileDialog dlg = new FileDialog(this, "Open file", "", "", "Any file (*)|*",
			FileDialog.wxOPEN | FileDialog.wxFILE_MUST_EXIST | FileDialog.wxCHANGE_DIR);
		
		if (dlg.ShowModal() != wxID_OK) return;

		fname = dlg.Path;
		FileOpen (fname);
	}

	public проц OnFileSave (Объект отправитель, Событие event)
	{
		if (!edit) return;

		if (!edit.Modified()) {
			MessageBox("There is nothing to save!", "Save file", Dialog.wxOK | Dialog.wxICON_EXCLAMATION);
			return;
		}
		edit.СохраниФайл ();
	}

	public проц OnFileSaveAs (Объект отправитель, Событие event)
	{
		if (!edit) return;

		ткст filename;
		scope FileDialog dlg = new FileDialog(this, "Save file", "", "", "Any file (*)|*",
		
			FileDialog.wxSAVE | FileDialog.wxOVERWRITE_PROMPT);

		if (dlg.ShowModal() != wxID_OK) return;

		filename = dlg.Path;
		edit.СохраниФайл (filename);
	}

	public проц OnFileClose (Объект отправитель, Событие event)
	{
		if (!edit) return;

		if (edit.Modified()) {
			if (MessageBox("Text is not saved, save before closing?", "Закрой",
					Dialog.wxYES_NO | Dialog.wxICON_QUESTION) == Dialog.wxYES) {
				edit.СохраниФайл();
				if (edit.Modified()) {
					MessageBox("Text could not be saved!", "Закрой abort",
							Dialog.wxOK | Dialog.wxICON_EXCLAMATION);
					return;
				}
			}
		}

		edit.УстFilename ("");
		edit.ClearAll();
		edit.УстSavePoint();
	}

	// properties event handlers
	public проц OnProperties (Объект отправитель, Событие event)
	{
		if (!edit) return;

		scope EditProperties dlg = new EditProperties(edit, 0);
	}

	// print event handlers
	public проц OnPrintУстup (Объект отправитель, Событие event)
	{
		g_pageУстupData.printData = g_printData;
		PageУстupDialog pageУстupDialog = new PageУстupDialog(this, g_pageУстupData);
		pageУстupDialog.ShowModal();
		g_printData = pageУстupDialog.PageУстupData.printData;
		g_pageУстupData = pageУстupDialog.PageУстupData;
	}

	public проц OnPrintPreview (Объект отправитель, Событие event)
	{
		PrintDialogData printDialogData = new PrintDialogData(g_printData);
		PrintPreview preview = new PrintPreview (new EditPrint (edit),
			new EditPrint (edit), printDialogData);
		
		if (!preview.Ок()) {
			MessageBox ("There was a problem with previewing.\n" ~
							 "Perhaps your current printer is not correctly?",
						  "Previewing", Dialog.wxOK);
			return;
		}

		Прямоугольник прям = DeterminePrintSize();
		PreviewFrame frame = new PreviewFrame (preview, this, "Print Preview");
		frame.УстРазм (прям);
		frame.Центр(Ориентация.wxBOTH);
		frame.Инициализируй();
		frame.Покажи(да);
	}

	public проц OnPrint (Объект отправитель, Событие event)
	{
		PrintDialogData printDialogData = new PrintDialogData(g_printData);
		Printer printer = new Printer(printDialogData);
		EditPrint printout = new EditPrint(edit);
		if (!printer.Print (this, printout, да)) {
			if (printer.LastError() == PrinterError.wxPRINTER_ERROR) {
			MessageBox ("There was a problem with printing.\n" ~
						  "Perhaps your current printer is not correctly?",
						  "Previewing", Dialog.wxOK);
				return;
			}
		}
		g_printData = printer.printDialogData.printData;
	}

	// edit events
	public проц OnEdit (Объект отправитель, Событие event)
	{
		if (edit) edit.ProcessEvent (event);
	}

	// private functions

	// creates the application меню bar
	private проц CreateMenu ()
	{
		// File меню
		wxMenu menuFile = new wxMenu;
		menuFile.Append (MenuIDs.wxID_OPEN, "&Open ..\tCtrl+O");
		menuFile.Append (MenuIDs.wxID_SAVE, "&Save\tCtrl+S");
		menuFile.Append (MenuIDs.wxID_SAVEAS, "Save &as ..\tCtrl+Shift+S");
		menuFile.Append (MenuIDs.wxID_CLOSE, "&Закрой\tCtrl+W");
		menuFile.AppendSeparator();
		menuFile.Append (myID_PROPERTIES, "Proper&ties ..\tCtrl+I");
		menuFile.AppendSeparator();
		menuFile.Append (MenuIDs.wxID_PRINT_SETUP, "Print Уст&up ..");
		menuFile.Append (MenuIDs.wxID_PREVIEW, "Print Pre&view\tCtrl+Shift+P");
		menuFile.Append (MenuIDs.wxID_PRINT, "&Print ..\tCtrl+P");
		menuFile.AppendSeparator();
		menuFile.Append (MenuIDs.wxID_EXIT, "&Quit\tCtrl+Q");

		// Edit меню
		Меню menuEdit = new Меню;
		menuEdit.Append (MenuIDs.wxID_UNDO, "&Undo\tCtrl+Z");
		menuEdit.Append (MenuIDs.wxID_REDO, "&Redo\tCtrl+Shift+Z");
		menuEdit.AppendSeparator();
		menuEdit.Append (MenuIDs.wxID_CUT, "Cu&t\tCtrl+X");
		menuEdit.Append (MenuIDs.wxID_COPY, "&Copy\tCtrl+C");
		menuEdit.Append (MenuIDs.wxID_PASTE, "&Paste\tCtrl+V");
		menuEdit.Append (MenuIDs.wxID_CLEAR, "&Delete\tDel");
		menuEdit.AppendSeparator();
		menuEdit.Append (MenuIDs.wxID_FIND, "&Find\tCtrl+F");
		menuEdit.Включи (MenuIDs.wxID_FIND, false);
		menuEdit.Append (myID_FINDNEXT, "Find &next\tF3");
		menuEdit.Включи (myID_FINDNEXT, false);
		menuEdit.Append (myID_REPLACE, "&Replace\tCtrl+H");
		menuEdit.Включи (myID_REPLACE, false);
		menuEdit.Append (myID_REPLACENEXT, "Replace &again\tShift+F4");
		menuEdit.Включи (myID_REPLACENEXT, false);
		menuEdit.AppendSeparator();
		menuEdit.Append (myID_BRACEMATCH, "&Match brace\tCtrl+M");
		menuEdit.Append (myID_GOTO, "&Goto\tCtrl+G");
		menuEdit.Включи (myID_GOTO, false);
		menuEdit.AppendSeparator();
		menuEdit.Append (myID_INDENTINC, "&Indent increase\tTab");
		menuEdit.Append (myID_INDENTRED, "I&ndent reduce\tBksp");
		menuEdit.AppendSeparator();
		menuEdit.Append (MenuIDs.wxID_SELECTALL, "&Select all\tCtrl+A");
		menuEdit.Append (myID_SELECTLINE, "Select &line\tCtrl+L");

		// hilight submenu
		Меню menuHilight = new Меню;
		цел Nr;
		for (Nr = 0; Nr < g_LanguagePrefs.length; Nr++) {
			menuHilight.Append (myID_HILIGHTFIRST + Nr,
								 g_LanguagePrefs [Nr].имя);
		}

		// charset submenu
		Меню menuCharset = new Меню;
		menuCharset.Append (myID_CHARSETANSI, "&ANSI (Windows)");
		menuCharset.Append (myID_CHARSETMAC, "&MAC (Macintosh)");

		// View меню
		Меню menuView = new Меню;
		menuView.Append (myID_HILIGHTLANG, "&Hilight language ..", menuHilight);
		menuView.AppendSeparator();
		menuView.AppendCheckItem (myID_FOLDTOGGLE, "&Toggle current fold\tCtrl+T");
		menuView.AppendCheckItem (myID_OVERTYPE, "&Overwrite mode\tIns");
		menuView.AppendCheckItem (myID_WRAPMODEON, "&Wrap mode\tCtrl+U");
		menuView.AppendSeparator();
		menuView.AppendCheckItem (myID_DISPLAYEOL, "Покажи line &endings");
		menuView.AppendCheckItem (myID_INDENTGUIDE, "Покажи &indent guides");
		menuView.AppendCheckItem (myID_LINENUMBER, "Покажи line &numbers");
		menuView.AppendCheckItem (myID_LONGLINEON, "Покажи &long line marker");
		menuView.AppendCheckItem (myID_WHITESPACE, "Покажи white&space");
		menuView.AppendSeparator();
		menuView.Append (myID_USECHARSET, "Use &code page of ..", menuCharset);

		// change case submenu
		Меню menuChangeCase = new Меню;
		menuChangeCase.Append (myID_CHANGEUPPER, "&Upper case");
		menuChangeCase.Append (myID_CHANGELOWER, "&Понизь case");

		// convert EOL submenu
		Меню menuConvertEOL = new Меню;
		menuConvertEOL.Append (myID_CONVERTCR, "CR (&Linux)");
		menuConvertEOL.Append (myID_CONVERTCRLF, "CR+LF (&Windows)");
		menuConvertEOL.Append (myID_CONVERTLF, "LF (&Macintosh)");

		// Extra меню
		Меню menuExtra = new Меню;
		menuExtra.AppendCheckItem (myID_READONLY, "&Readonly mode");
		menuExtra.AppendSeparator();
		menuExtra.Append (myID_CHANGECASE, "Change &case to ..", menuChangeCase);
		menuExtra.AppendSeparator();
		menuExtra.Append (myID_CONVERTEOL, "Convert line &endings to ..", menuConvertEOL);

		// Окно меню
		Меню menuWindow = new Меню;
		menuWindow.Append (myID_PAGEPREV, "&Previous\tCtrl+Shift+Tab");
		menuWindow.Append (myID_PAGENEXT, "&Next\tCtrl+Tab");

		// Help меню
		Меню menuHelp = new Меню;
		menuHelp.Append (MenuIDs.wxID_ABOUT, "&About ..\tShift+F1");

		// construct меню
		m_menuBar.Append (menuFile, "&File");
		m_menuBar.Append (menuEdit, "&Edit");
		m_menuBar.Append (menuView, "&View");
		m_menuBar.Append (menuExtra, "E&xtra");
		m_menuBar.Append (menuWindow, "&Окно");
		m_menuBar.Append (menuHelp, "&Help");
		this.menuBar = m_menuBar;
	}

	private проц FileOpen (ткст fname)
	{
		fname = absPath(fname);
		edit.ЗагрузиФайл (fname);
	}

	// print preview position and Размер
	private Прямоугольник DeterminePrintSize ()
	{
		Display display = new Display(Display.GetFromPoint(this.Позиция));
		Прямоугольник scr = display.Geometry();

		// determine position and Размер (shifting 16 left and down)
		Прямоугольник прям = Прям();
		прям.X += 16;
		прям.Y += 16;
		прям.Ширь = cast(цел)fmin (прям.Ширь, (scr.X - прям.X));
		прям.Высь = cast(цел)fmin (прям.Высь, (scr.X - прям.Y));

		return прям;
	}
}

//----------------------------------------------------------------------------
// AppAbout
//----------------------------------------------------------------------------

public class AppAbout : Dialog
{
	private Timer timer;

	// constructor
	public this (Окно родитель,	цел milliseconds = 0,
					long стиль = wxDEFAULT_DIALOG_STYLE)
	{
		super(родитель, wxID_ANY, "",	вхДефПоз, вхДефРазм,
					стиль | wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER);

		// set timer if any
		if (milliseconds > 0) {
			timer = new Timer (this, myID_ABOUTTIMER);
			
			timer.УстOwner(this);
			
			timer.Start (milliseconds, wxTIMER_ONE_SHOT);
		}

		// sets the application title
		Титул ("About ..");

		// about info
		GridSizer aboutinfo = new GridSizer (2, 0, 2);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Written by: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_MAINT),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Version: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_VERSION),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Licence тип: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_LICENCE),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Copyright: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_COPYRIGHT),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);

		// about icontitle//info
		БоксСайзер aboutpane = new БоксСайзер (Ориентация.wxHORIZONTAL);
		Битмап битмап = new Битмап(new Пиктограмма(mondrian));
		aboutpane.Добавь (new StaticBitmap (this, wxID_ANY, битмап),
						0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT|Direction.wxRIGHT, 20);
		aboutpane.Добавь (aboutinfo, 1, Stretch.wxEXPAND);
		aboutpane.Добавь (60, 0);

		// about complete
		БоксСайзер totalpane = new БоксСайзер (Ориентация.wxVERTICAL);
		totalpane.Добавь (0, 20);
		StaticText appname = new StaticText(this, wxID_ANY, g_appname);
		appname.УстFont (new Шрифт (24, СемействоШрифтов.wxDEFAULT, СтильШрифта.wxNORMAL, ВесШрифта.wxBOLD));
		totalpane.Добавь (appname, 0, Alignment.wxALIGN_CENTER | Direction.wxLEFT | Direction.wxRIGHT, 40);
		totalpane.Добавь (0, 10);
		totalpane.Добавь (aboutpane, 0, Stretch.wxEXPAND | Direction.wxALL, 4);
		totalpane.Добавь (new StaticText(this, wxID_ANY, APP_DESCR),
						0, Alignment.wxALIGN_CENTER | Direction.wxALL, 10);
		Кнопка okButton = new Кнопка (this, wxID_OK, "OK");
		okButton.УстДеф();
		totalpane.Добавь (okButton, 0, Alignment.wxALIGN_CENTER | Direction.wxLEFT | Direction.wxRIGHT | Direction.wxBOTTOM, 10);

		УстСайзерИВстрой (totalpane, да);

		//Добавь event before ShowModal
		EVT_TIMER (myID_ABOUTTIMER, &OnTimerEvent);

		ЦентрируйНаЭкране();
		ShowModal();
	}

	// event handlers
	public проц OnTimerEvent (Объект отправитель, Событие event)
	{
	
		timer = null;
		EndModal (wxID_OK);
	}
}
