//-----------------------------------------------------------------------------
// wxD/Samples - Splitter.d
//
// A wxD version of the wxWidgets "splitter" sample.
//
// Written by Jason Perkins (jason@379.com)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Splitter.d,v 1.9 2006/11/17 15:20:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	enum Cmd
	{
		Quit,
		SplitHorizontal,
		SplitVertical,
		Unsplit,
		SplitLive,
		SetPosition,
		SetMinSize
	}


	public class SplitterApp : Прил
	{
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame();
			frame.Show(да);
			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			SplitterApp прил = new SplitterApp();
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}


	public class MyFrame : Frame
	{
		private MySplitterWindow splitter;
		private MyCanvas         left, right;

		//---------------------------------------------------------------------

		public this()
		{
			super("wxSplitterWindow Sample",
			       wxDefaultPosition, Размер(420,300),
			       wxDEFAULT_FRAME | wxNO_FULL_REPAINT_ON_RESIZE);
			Меню splitMenu = new Меню();
			splitMenu.Append(Cmd.SplitVertical, "Split &Vertically\tCtrl-V", "Split vertically");
			splitMenu.Append(Cmd.SplitHorizontal, "Split &Horizontally\tCtrl-H", "Split горизонтально");
			splitMenu.Append(Cmd.Unsplit, "&Unsplit\tCtrl-U", "Unsplit");
			splitMenu.AppendSeparator();
			splitMenu.AppendCheckItem(Cmd.SplitLive, "&Live Обнови\tCtrl-L", "Toggle live update mode");
			splitMenu.Append(Cmd.SetPosition, "Установи &Положение\tCtrl-P", "Установи the splitter position");
			splitMenu.Append(Cmd.SetMinSize, "Установи &Minimum Размер\tCtrl-M", "Установи the minimum pane size");
			splitMenu.AppendSeparator();
			splitMenu.Append(Cmd.Quit, "E&xit\tAlt-X", "Exit");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(splitMenu, "&Splitter");
			this.menuBar = menuBar;

			menuBar.Check(Cmd.SplitLive, да);

			CreateStatusBar(2);
			SetStatusText("Min pane size = 0", 1);

			splitter = new MySplitterWindow(this);

			left = new MyCanvas(splitter);
			left.ЦветЗП = new Цвет("RED");
			left.SetScrollbars(20, 20, 50, 50);
			left.cursor = new Cursor(StockCursor.wxCURSOR_MAGNIFIER);

			right = new MyCanvas(splitter);
			right.ЦветЗП = new Цвет("CYAN");
			right.SetScrollbars(20, 20, 50, 50);

			splitter.SplitVertically(left, right, 100);

			// Установи up the event table

			EVT_MENU(Cmd.SplitVertical,    &SplitVertical);
			EVT_MENU(Cmd.SplitHorizontal,  &SplitHorizontal);
			EVT_MENU(Cmd.Unsplit,          &Unsplit);
			EVT_MENU(Cmd.SplitLive,        &ToggleLive);
			EVT_MENU(Cmd.SetPosition,      &SetPosition);
			EVT_MENU(Cmd.SetMinSize,       &SetMinSize);

			EVT_MENU(Cmd.Quit,             &OnQuit);

			EVT_UPDATE_UI(Cmd.SplitVertical,   &UpdateUIVertical);
			EVT_UPDATE_UI(Cmd.SplitHorizontal, &UpdateUIHorizontal);
			EVT_UPDATE_UI(Cmd.Unsplit,         &UpdateUIUnsplit);
		}

		//---------------------------------------------------------------------

		public проц SplitHorizontal(Объект sender, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();

			left.Show(да);
			right.Show(да);

			splitter.SplitHorizontally(left, right);

			SetStatusText("Splitter split горизонтально", 1);
		}

		public проц SplitVertical(Объект sender, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();

			left.Show(да);
			right.Show(да);

			splitter.SplitVertically(left, right);

			SetStatusText("Splitter split vertically", 1);
		}

		public проц Unsplit(Объект sender, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();
			SetStatusText("No splitter", 1);
		}

		public проц ToggleLive(Объект sender, Событие e)
		{
			CommandEvent ce = cast(CommandEvent)e;
			if (ce.IsChecked)
				splitter.StyleFlags = splitter.StyleFlags | SplitterWindow.wxSP_LIVE_UPDATE;
			else
				splitter.StyleFlags = splitter.StyleFlags & ~SplitterWindow.wxSP_LIVE_UPDATE;
		}

		public проц SetPosition(Объект sender, Событие e)
		{
		}

		public проц SetMinSize(Объект sender, Событие e)
		{
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект sender, Событие e)
		{
			Закрой(да);
		}

		public проц UpdateUIHorizontal(Объект sender, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Enabled = (!splitter.IsSplit || splitter.splitMode != SplitMode.wxSPLIT_HORIZONTAL);
		}

		public проц UpdateUIVertical(Объект sender, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Enabled = (!splitter.IsSplit || splitter.splitMode != SplitMode.wxSPLIT_VERTICAL);
		}

		public проц UpdateUIUnsplit(Объект sender, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Enabled = splitter.IsSplit;
		}

		//---------------------------------------------------------------------
	}



	public class MySplitterWindow : SplitterWindow
	{
		private Frame родитель;

		//---------------------------------------------------------------------

		public this(Frame родитель)
		{
			super(родитель, -1,
			       wxDefaultPosition, wxDefaultSize,
			       wxSP_3D | wxSP_LIVE_UPDATE | wxCLIP_CHILDREN);
			this.родитель = родитель;
		}

		//---------------------------------------------------------------------

		public проц OnPositionChanged(Объект sender, Событие e)
		{
		}

		public проц OnPositionChanging(Объект sender, Событие e)
		{
		}

		public проц OnDoubleClick(Объект sender, Событие e)
		{
		}

		public проц OnUnsplit(Объект sender, Событие e)
		{
		}

		//---------------------------------------------------------------------
	}


	public class MyCanvas : ScrolledWindow
	{
		//---------------------------------------------------------------------

		public this(Окно родитель)
		{
			super(родитель);
		}

		//---------------------------------------------------------------------

		public override проц OnDraw(DC dc)
		{
			dc.перо = new Перо("BLACK", 1, СтильЗаливки.wxSOLID);
			dc.РисуйЛинию(0, 0, 100, 100);

			dc.ФоновыйРежим = СтильЗаливки.wxTRANSPARENT;
			dc.РисуйТекст("Testing", 50, 50);

			dc.перо = new Перо("RED", 1, СтильЗаливки.wxSOLID);
			dc.кисть = new Кисть("GREEN", СтильЗаливки.wxSOLID);
			dc.РисуйПрям(120, 120, 100, 80);
		}

		//---------------------------------------------------------------------
	}


проц main()
{
	SplitterApp.Main();
}
