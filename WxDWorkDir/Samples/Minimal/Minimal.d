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
			Диалог = MenuIDs.wxID_HIGHEST + 1
		}

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер size)
		{
			super(title, поз, size);
			// Установи the окно иконка

			version (__WXMAC_XCODE__)
			иконка = new Icon("Minimal.прил/Contents/Resources/mondrian.png");
			else
			иконка = new Icon("../Samples/Minimal/mondrian.png");

			// Установи up a меню

			Меню fileMenu = new Меню();
			fileMenu.Append(Cmd.Диалог, "&Show dialog\tAlt-D", "Show test dialog");
			fileMenu.Append(Cmd.Quit, "E&xit\tAlt-X", "Quit this program");

			Меню helpMenu = new Меню();
			helpMenu.Append(Cmd.About, "&About...\tF1", "Show about dialog");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(fileMenu, "&File");
			menuBar.Append(helpMenu, "&Справка");

			this.menuBar = menuBar;

			// Установи up a status bar

			CreateStatusBar(2);
			StatusText = "Welcome to wxWidgets!";

			// Установи up the event table

			EVT_MENU(Cmd.Quit,    &OnQuit);
			EVT_MENU(Cmd.Диалог,  &OnДиалог);
			EVT_MENU(Cmd.About,   &OnAbout);
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект sender, Событие e)
		{
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnДиалог(Объект sender, Событие e)
		{
            Диалог dialog = new Диалог( this, -1, "Test dialog", Точка(50,50), Размер(450,340) );
            BoxSizer main_sizer = new BoxSizer( Ориентация.wxVERTICAL );

            StaticBoxSizer top_sizer = new StaticBoxSizer( new StaticBox( dialog, -1, "Bitmaps" ), Ориентация.wxHORIZONTAL );
            main_sizer.Добавь( top_sizer, 0, Direction.wxALL, 5 );

            BitmapButton bb = new BitmapButton( dialog, -1, new Битмап("../Samples/Minimal/mondrian.png") );
            top_sizer.Добавь( bb, 0, Direction.wxALL, 10 );

            StaticBitmap sb = new StaticBitmap( dialog, -1, new Битмап("../Samples/Minimal/mondrian.png") );
            top_sizer.Добавь( sb, 0, Direction.wxALL, 10 );

            Кнопка button = new Кнопка( dialog, 5100, "OK" );
            main_sizer.Добавь( button, 0, Direction.wxALL|Alignment.wxALIGN_CENTER, 5 );

            dialog.SetSizer( main_sizer, да );
            main_sizer.Fit( dialog );
            main_sizer.SetSizeHints( dialog );

            dialog.CentreOnParent();
            dialog.ShowModal();
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект sender, Событие e)
		{
			ткст msg = "This is the About dialog of the minimal sample.\nWelcome to " ~ wxVERSION_STRING;
			MessageBox(this, msg, "About Minimal", Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------
	}



	public class Minimal : Прил
	{
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame("Minimal wxWidgets Прил", Точка(50,50), Размер(450,340));
			frame.Show(да);

			return да;
		}

		//---------------------------------------------------------------------

		static проц Main()
		{
			Minimal прил = new Minimal();
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	Minimal.Main();
	return 0;
}
