//-----------------------------------------------------------------------------
// wxD/Samples - ListView.cs
//
// wxD "ListView" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ListView.d,v 1.9 2006/11/17 15:20:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;

	public class ListViewFrame : Frame
	{
		enum Cmd 
		{
			About,
			Quit
		}

		//---------------------------------------------------------------------

		public TextCtrl textCtrl;

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер Размер)
		{
			super(title, поз, Размер);
			// Уст the окно пиктограмма and status bar

			this.пиктограмма = new Пиктограмма("./data/mondrian.png");

			CreateStatusBar();
			StatusText = "Welcome to the ListView Sample!";	
			
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
			
			MyListView mlv = new MyListView( this );

			БоксСайзер bSizer = new БоксСайзер( Ориентация.wxVERTICAL );
			bSizer.Добавь( mlv, 1, Stretch.wxGROW );
			bSizer.Добавь( textCtrl, 0, Stretch.wxGROW );

			this.сайзер = bSizer;
		}

		//---------------------------------------------------------------------	

		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( "wxD ListView sample\n2004 by Alexander Olk", "About",
				Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}

		//---------------------------------------------------------------------	

		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class MyListView : ListView
	{
		public this( Окно родитель )
		{
			super( родитель, -1, вхДефПоз, вхДефРазм, ListCtrl.wxLC_REPORT | ListCtrl.wxLC_EDIT_LABELS  );
		
			InsertColumn( 0, "First Column" );
			УстColumnWidth( 0, 200 );
			
			ListItem элтCol = new ListItem();
			элтCol.Text = "Second Column";
			элтCol.Align = ListCtrl.wxLIST_FORMAT_CENTER;
			элтCol.Ширь = 300;
			InsertColumn( 1, элтCol );
		
			for ( цел i = 0; i < 200; ++i )
			{
				ткст buf = "Col 1 Элемент " ~ .вТкст(i);
				цел tmp = InsertItem( i, buf, 0);
				УстItemData( tmp, i );
				
				buf = "Col 2 Элемент " ~ .вТкст(i);
				УстItem( i, 1, buf );
			}
				
			Log.LogMessage( "Items created..." );
			
			ColumnClick_Add(& OnColumnClick );
			ItemSelect_Add(& OnItemSelect );
			ColumnRightClick_Add(& OnColumnRightClick );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnColumnClick( Объект отправитель, Событие e )
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "Clicked column header " ~ .вТкст(le.Column) );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnItemSelect( Объект отправитель, Событие e )
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "Value 1st field of selected элт: " ~ le.Text );
			
			ListItem info = new ListItem();
			info.Ид = le.Index;
			info.Column = 1;
			info.Маска = ListCtrl.wxLIST_MASK_TEXT;
			
			GetItem( info );
			
			Log.LogMessage( "Value of 2nd field of selected элт: " ~ info.Text );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnColumnRightClick( Объект отправитель, Событие e )
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "Право clicked column header " ~ .вТкст(le.Column) );
		}
	}
	
	//---------------------------------------------------------------------	

	public class ListViewApp : Апп
	{
		public override бул ПоИниц()
		{
			ListViewFrame frame = new ListViewFrame("ListView wxWidgets Sample", Точка(10, 100), Размер(650,340));
			frame.Покажи(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			ListViewApp app = new ListViewApp();
			app.Пуск();
		}
	}

проц main(char[][] argv)
{
	ListViewApp.Main();
}
