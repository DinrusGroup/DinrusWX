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
private import std.ткст;

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

		public this(ткст title, Точка поз, Размер size)
		{
			super(title, поз, size);
			// Установи the окно иконка and status bar

			this.иконка = new Icon("../Samples/ListView/mondrian.png");

			CreateStatusBar();
			StatusText = "Welcome to the ListView Sample!";	
			
			Меню menuFile = new Меню();
			menuFile.AppendWL( Cmd.About, "&About", & OnAbout ) ;
			menuFile.AppendSeparator();
			menuFile.AppendWL( Cmd.Quit, "E&xit\tAlt-X", "Quit this program", & OnQuit) ;
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			this.menuBar = menuBar;

			textCtrl = new TextCtrl(this, -1, "", wxDefaultPosition, wxDefaultSize, 
				TextCtrl.wxTE_MULTILINE | TextCtrl.wxTE_READONLY | TextCtrl.wxSUNKEN_BORDER );

			Log.SetActiveTarget( textCtrl );
			
			MyListView mlv = new MyListView( this );

			BoxSizer bSizer = new BoxSizer( Ориентация.wxVERTICAL );
			bSizer.Добавь( mlv, 1, Stretch.wxGROW );
			bSizer.Добавь( textCtrl, 0, Stretch.wxGROW );

			this.sizer = bSizer;
		}

		//---------------------------------------------------------------------	

		public проц OnAbout( Объект sender, Событие e )
		{
			MessageBox( "wxD ListView sample\n2004 by Alexander Olk", "About",
				Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}

		//---------------------------------------------------------------------	

		public проц OnQuit( Объект sender, Событие e )
		{
			Закрой();
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class MyListView : ListView
	{
		public this( Окно родитель )
		{
			super( родитель, -1, wxDefaultPosition, wxDefaultSize, ListCtrl.wxLC_REPORT | ListCtrl.wxLC_EDIT_LABELS  );
		
			InsertColumn( 0, "First Column" );
			SetColumnWidth( 0, 200 );
			
			ListItem itemCol = new ListItem();
			itemCol.Текст = "Second Column";
			itemCol.Align = ListCtrl.wxLIST_FORMAT_CENTER;
			itemCol.Ширина = 300;
			InsertColumn( 1, itemCol );
		
			for ( цел i = 0; i < 200; ++i )
			{
				ткст buf = "Col 1 Элемент " ~ .toString(i);
				цел tmp = InsertItem( i, buf, 0);
				SetItemData( tmp, i );
				
				buf = "Col 2 Элемент " ~ .toString(i);
				SetItem( i, 1, buf );
			}
				
			Log.LogMessage( "Items created..." );
			
			ColumnClick_Add(& OnColumnClick );
			ItemSelect_Add(& OnItemSelect );
			ColumnRightClick_Add(& OnColumnRightClick );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnColumnClick( Объект sender, Событие e )
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "Clicked column header " ~ .toString(le.Column) );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnItemSelect( Объект sender, Событие e )
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "Value 1st field of selected элемент: " ~ le.Текст );
			
			ListItem info = new ListItem();
			info.Ид = le.Index;
			info.Column = 1;
			info.Маска = ListCtrl.wxLIST_MASK_TEXT;
			
			GetItem( info );
			
			Log.LogMessage( "Value of 2nd field of selected элемент: " ~ info.Текст );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnColumnRightClick( Объект sender, Событие e )
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "Right clicked column header " ~ .toString(le.Column) );
		}
	}
	
	//---------------------------------------------------------------------	

	public class ListViewApp : Прил
	{
		public override бул ПриИниц()
		{
			ListViewFrame frame = new ListViewFrame("ListView wxWidgets Sample", Точка(10, 100), Размер(650,340));
			frame.Show(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			ListViewApp прил = new ListViewApp();
			прил.Пуск();
		}
	}

проц main(сим[][] argv)
{
	ListViewApp.Main();
}
