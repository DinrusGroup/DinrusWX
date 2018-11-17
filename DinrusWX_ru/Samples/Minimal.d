//-----------------------------------------------------------------------------
// wxD/Samples - Minimal.d
// based on
// wx.NET/Samples - Minimal.cs
//
// A wx.NET version of the wxWidgets "minimal" sample.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Minimal.d,v 1.11 2008/04/07 22:12:49 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	public class MyFrame : Frame
	{
		enum Cmd
		{
			About = MenuIDs.wxID_ABOUT,
			Quit = MenuIDs.wxID_EXIT,
			Dialog = MenuIDs.wxID_HIGHEST + 1
		}

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер Размер)
		{
			super(title, поз, Размер);
			// Уст the окно пиктограмма

			version (__WXMAC_XCODE__)
			пиктограмма = new Пиктограмма("Minimal.app/Contents/Resources/mondrian.png");
			else
			пиктограмма = new Пиктограмма("./data/mondrian.png");

			// Уст up a меню

			Меню fileMenu = new Меню();
			fileMenu.Append(Cmd.Dialog, "&Паказать диалог\tAlt-D", "Показать тестовый диалог");
			fileMenu.Append(Cmd.Quit, "Вы&ход\tAlt-X", "Выйти из программы");

			Меню helpMenu = new Меню();
			helpMenu.Append(Cmd.About, "&О...\tF1", "Показать диалоговое окно \"О...\"");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(fileMenu, "&Файл");
			menuBar.Append(helpMenu, "&Справка");

			this.menuBar = menuBar;

			// Уст up a status bar

			CreateStatusBar(2);
			StatusText = "Добро пожаловать в wxWidgets!";

			// Уст up the event table

			EVT_MENU(Cmd.Quit,    &OnQuit);
			EVT_MENU(Cmd.Dialog,  &OnDialog);
			EVT_MENU(Cmd.About,   &OnAbout);
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект отправитель, Событие e)
		{
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnDialog(Объект отправитель, Событие e)
		{
            Dialog dialog = new Dialog( this, -1, "Тестировать диалог", Точка(50,50), Размер(450,340) );
            БоксСайзер main_sizer = new БоксСайзер( Ориентация.wxVERTICAL );

            StaticBoxSizer top_sizer = new StaticBoxSizer( new StaticBox( dialog, -1, "Bitmaps" ), Ориентация.wxHORIZONTAL );
            main_sizer.Добавь( top_sizer, 0, Direction.wxALL, 5 );

            КнопкаБитмап bb = new КнопкаБитмап( dialog, -1, new Битмап("./data/mondrian.png") );
            top_sizer.Добавь( bb, 0, Direction.wxALL, 10 );

            StaticBitmap sb = new StaticBitmap( dialog, -1, new Битмап("./data/mondrian.png") );
            top_sizer.Добавь( sb, 0, Direction.wxALL, 10 );

            Кнопка button = new Кнопка( dialog, 5100, "OK" );
            main_sizer.Добавь( button, 0, Direction.wxALL|Alignment.wxALIGN_CENTER, 5 );

            dialog.УстСайзер( main_sizer, да );
            main_sizer.Встрой( dialog );
            main_sizer.УстРазмПодсказ( dialog );

            dialog.ЦентрНаРодителе();
            dialog.ShowModal();
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект отправитель, Событие e)
		{
			ткст msg = "Это диалоговое окно \"О...\" минимальной программы.\nДобро пожаловать в " ~ wxVERSION_STRING;
			MessageBox(this, msg, "О Минимале", Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------
	}



	public class Minimal : Апп
	{
		//---------------------------------------------------------------------

		public override бул ПоИниц()
		{
			MyFrame frame = new MyFrame("Минимальное приложение  wxWidgets", Точка(50,50), Размер(450,340));
			frame.Покажи(да);

			return да;
		}

		//---------------------------------------------------------------------

		static проц Main()
		{
			Minimal app = new Minimal();
			app.Пуск();
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	Minimal.Main();
	return 0;
}
