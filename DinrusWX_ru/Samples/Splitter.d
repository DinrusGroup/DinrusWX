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
		УстPosition,
		УстMinSize
	}


	public class SplitterApp : Апп
	{
		//---------------------------------------------------------------------

		public override бул ПоИниц()
		{
			MyFrame frame = new MyFrame();
			frame.Покажи(да);
			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			SplitterApp app = new SplitterApp();
			app.Пуск();
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
			       вхДефПоз, Размер(420,300),
			       wxDEFAULT_FRAME | wxNO_FULL_REPAINT_ON_RESIZE);
			Меню splitMenu = new Меню();
			splitMenu.Append(Cmd.SplitVertical, "Split &Vertically\tCtrl-V", "Split vertically");
			splitMenu.Append(Cmd.SplitHorizontal, "Split &Horizontally\tCtrl-H", "Split horizontally");
			splitMenu.Append(Cmd.Unsplit, "&Unsplit\tCtrl-U", "Unsplit");
			splitMenu.AppendSeparator();
			splitMenu.AppendCheckItem(Cmd.SplitLive, "&Live Обнови\tCtrl-L", "Toggle live update mode");
			splitMenu.Append(Cmd.УстPosition, "Уст &Позиция\tCtrl-P", "Уст the splitter position");
			splitMenu.Append(Cmd.УстMinSize, "Уст &Minimum Размер\tCtrl-M", "Уст the minimum pane Размер");
			splitMenu.AppendSeparator();
			splitMenu.Append(Cmd.Quit, "E&xit\tAlt-X", "Exit");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(splitMenu, "&Splitter");
			this.menuBar = menuBar;

			menuBar.Check(Cmd.SplitLive, да);

			CreateStatusBar(2);
			УстStatusText("Min pane Размер = 0", 1);

			splitter = new MySplitterWindow(this);

			left = new MyCanvas(splitter);
			left.ЦветФона = new Цвет("RED");
			left.УстScrollbars(20, 20, 50, 50);
			left.курсор = new Курсор(StockCursor.wxCURSOR_MAGNIFIER);

			right = new MyCanvas(splitter);
			right.ЦветФона = new Цвет("CYAN");
			right.УстScrollbars(20, 20, 50, 50);

			splitter.SplitVertically(left, right, 100);

			// Уст up the event table

			EVT_MENU(Cmd.SplitVertical,    &SplitVertical);
			EVT_MENU(Cmd.SplitHorizontal,  &SplitHorizontal);
			EVT_MENU(Cmd.Unsplit,          &Unsplit);
			EVT_MENU(Cmd.SplitLive,        &ToggleLive);
			EVT_MENU(Cmd.УстPosition,      &УстPosition);
			EVT_MENU(Cmd.УстMinSize,       &УстMinSize);

			EVT_MENU(Cmd.Quit,             &OnQuit);

			EVT_UPDATE_UI(Cmd.SplitVertical,   &UpdateUIVertical);
			EVT_UPDATE_UI(Cmd.SplitHorizontal, &UpdateUIHorizontal);
			EVT_UPDATE_UI(Cmd.Unsplit,         &UpdateUIUnsplit);
		}

		//---------------------------------------------------------------------

		public проц SplitHorizontal(Объект отправитель, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();

			left.Покажи(да);
			right.Покажи(да);

			splitter.SplitHorizontally(left, right);

			УстStatusText("Splitter split horizontally", 1);
		}

		public проц SplitVertical(Объект отправитель, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();

			left.Покажи(да);
			right.Покажи(да);

			splitter.SplitVertically(left, right);

			УстStatusText("Splitter split vertically", 1);
		}

		public проц Unsplit(Объект отправитель, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();
			УстStatusText("No splitter", 1);
		}

		public проц ToggleLive(Объект отправитель, Событие e)
		{
			СобытиеКоманда ce = cast(СобытиеКоманда)e;
			if (ce.IsChecked)
				splitter.ФлагиСтиля = splitter.ФлагиСтиля | SplitterWindow.wxSP_LIVE_UPDATE;
			else
				splitter.ФлагиСтиля = splitter.ФлагиСтиля & ~SplitterWindow.wxSP_LIVE_UPDATE;
		}

		public проц УстPosition(Объект отправитель, Событие e)
		{
		}

		public проц УстMinSize(Объект отправитель, Событие e)
		{
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект отправитель, Событие e)
		{
			Закрой(да);
		}

		public проц UpdateUIHorizontal(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Активен = (!splitter.IsSplit || splitter.splitMode != SplitMode.wxSPLIT_HORIZONTAL);
		}

		public проц UpdateUIVertical(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Активен = (!splitter.IsSplit || splitter.splitMode != SplitMode.wxSPLIT_VERTICAL);
		}

		public проц UpdateUIUnsplit(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Активен = splitter.IsSplit;
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
			       вхДефПоз, вхДефРазм,
			       wxSP_3D | wxSP_LIVE_UPDATE | wxCLIP_CHILDREN);
			this.родитель = родитель;
		}

		//---------------------------------------------------------------------

		public проц OnPositionChanged(Объект отправитель, Событие e)
		{
		}

		public проц OnPositionChanging(Объект отправитель, Событие e)
		{
		}

		public проц OnDoubleClick(Объект отправитель, Событие e)
		{
		}

		public проц OnUnsplit(Объект отправитель, Событие e)
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
			dc.pen = new Pen("BLACK", 1, FillStyle.wxSOLID);
			dc.DrawLine(0, 0, 100, 100);

			dc.BackgroundMode = FillStyle.wxTRANSPARENT;
			dc.DrawText("Testing", 50, 50);

			dc.pen = new Pen("RED", 1, FillStyle.wxSOLID);
			dc.brush = new Кисть("GREEN", FillStyle.wxSOLID);
			dc.DrawRectangle(120, 120, 100, 80);
		}

		//---------------------------------------------------------------------
	}


проц main()
{
	SplitterApp.Main();
}
