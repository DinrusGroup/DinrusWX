//-----------------------------------------------------------------------------
// wxD/Samples - Listbook.d
//
// wxD "Listbook" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Listbook.d,v 1.9 2006/11/17 15:20:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;

	public class ListbookFrame : Frame
	{
		enum Cmd 
		{
			About,
			Quit
		}

		//---------------------------------------------------------------------

		public TextCtrl textCtrl;
		public MyListbook listbook;

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер Размер)
		{
			super(title, поз, Размер);
			// Уст the окно пиктограмма and status bar

			пиктограмма = new Пиктограмма("./data/mondrian.png");

			CreateStatusBar();
			StatusText = "Welcome to the Listbook Sample!";	
			
			Меню menuFile = new Меню();
			menuFile.AppendWL( Cmd.About, "&About", & OnAbout ) ;
			menuFile.AppendSeparator();
			menuFile.AppendWL( Cmd.Quit, "E&xit\tAlt-X", "Quit this program", & OnQuit) ;
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			this.menuBar = menuBar;

			textCtrl = new TextCtrl(this, -1, "", вхДефПоз, вхДефРазм, 
				TextCtrl.wxTE_MULTILINE | TextCtrl.wxTE_READONLY | TextCtrl.wxSUNKEN_BORDER );

			Log.УстActiveTarget( textCtrl );

			listbook = new MyListbook( this, -1 );

			БоксСайзер bSizer = new БоксСайзер( Ориентация.wxVERTICAL );
			bSizer.Добавь( listbook, 1, Stretch.wxGROW );
			bSizer.Добавь( textCtrl, 0, Stretch.wxGROW );

			сайзер = bSizer;
		}

		//---------------------------------------------------------------------	

		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( "wxD Listbook sample\n2004 by Alexander Olk\nportred D by BERO", "About",
				Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------	

		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
	}   
	
	//---------------------------------------------------------------------	

	public class MyListbook : Listbook
	{
		public ImageList imageList;

		//---------------------------------------------------------------------	

		public this( Окно родитель, цел ид)
		{
			super( родитель, ид );
			imageList = new ImageList( 32, 32 );

			// load bitmaps
			for ( цел i = 1; i < 16; ++i )
			{
				Битмап bmp = new Битмап( фм( "./data/bmp/toblom%02d.png", 
					i ) );
				imageList.Добавь( bmp );
			}

			AssignImageList( imageList );

			for ( цел i = 1; i < 16; ++i )
			{
				ListbookPanel p = new ListbookPanel( this, -1, i );
				AddPage( p , фм( "Picture %d    ", i ), false, i - 1 );
			} 

			EVT_LISTBOOK_PAGE_CHANGED( -1, & OnPageChanged ) ;
			EVT_LISTBOOK_PAGE_CHANGING( -1, & OnPageChanging ) ;
		}

		//---------------------------------------------------------------------	

		public проц OnPageChanged( Объект отправитель, Событие e )
		{
			ListbookEvent le = cast(ListbookEvent) e;

			Log.LogMessage( "OnPageChanged, old: " ~ .вТкст(le.OldSelection) ~ ", " ~
				"new: " ~ .вТкст(le.Selection) ~ ", Selection: " ~ .вТкст(this.Selection) );

			e.Skip();
		}

		//---------------------------------------------------------------------	

		public проц OnPageChanging( Объект отправитель, Событие e )
		{
			ListbookEvent le = cast(ListbookEvent) e;

			Log.LogMessage( "OnPageChanging, old: " ~ .вТкст(le.OldSelection) ~ ", " ~
				"new: " ~ .вТкст(le.Selection) ~ ", Selection: " ~ .вТкст(this.Selection) );

			e.Skip();
		}
	}

	//---------------------------------------------------------------------	

	public class ListbookPanel : Panel
	{
		public HtmlWindow htmlWindow;
		
		//---------------------------------------------------------------------	

		public this( Окно родитель, цел ид, цел number )
		{
			super( родитель, ид );
			htmlWindow = new HtmlWindow( this );
			htmlWindow.AppendToPage( "<html><body><center><h1>This is HtmlWindow page " ~
				.вТкст(number) ~ ".</h1><br><br><br>" ~ 
				"<img высь=\"32\" ширь=\"32\" alt=\"\" " ~
				"src=\"" ~
				фм( "./data/bmp/toblom%02d.png", number ) ~
				"\">" ~
				"</center></body></html>" );

			БоксСайзер bSizer = new БоксСайзер( Ориентация.wxVERTICAL );
			bSizer.Добавь( htmlWindow, 1, Stretch.wxGROW );

			сайзер = bSizer;
		}
	}

	//---------------------------------------------------------------------	

	public class ListbookApp : Апп
	{
		//---------------------------------------------------------------------

		public override бул ПоИниц()
		{
			ListbookFrame frame = new ListbookFrame("Listbook wxWidgets Sample", Точка(10, 100), Размер(650,340));
			frame.Покажи(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			ListbookApp app = new ListbookApp();
			app.Пуск();
		}

		//---------------------------------------------------------------------
	}


проц main()
{
	ListbookApp.Main();
}
