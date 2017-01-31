// Generated with wxg2wxnet
// (C) 2004 by Alexander Olk (xenomorph2@onlinehome.de)

//-----------------------------------------------------------------------------
// NET/Samples - EventDemo.d
//
// A wxD sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: EventDemo.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------
 
import wx.wx;

pragma(lib,"wxd.lib");

	public class EventDemoApp : Прил 
	{
		public override бул ПриИниц()
		{
			EventDemoFrame _eventdemoframe = new EventDemoFrame( пусто, -1, "" );
			_eventdemoframe.Show( да );
 
			return да;
		}
 
		//---------------------------------------------------------------------
 
		
		static проц Main()
		{
			EventDemoApp прил = new EventDemoApp();
			прил.Пуск();
		}
	}
 
	//---------------------------------------------------------------------
 
	public class EventDemoFrame : Frame
	{
		// Do not change the code between region and endregion ( incl. region and endregion )...
		//#region Wxg2wxnet IDS: EventDemoFrame
		public enum Cmd {
			ID_MAINBUTTON,
			ID_MENU_ABOUT,
			ID_MENU_ABOUT2,
			ID_MENU_EXIT,
			ID_MENU_EVENT_1,
			ID_MENU_EVENT_2
		}
		//#endregion

		//---------------------------------------------------------------------
 
		// Do not change the code between region and endregion ( incl. region and endregion )...
		//#region Wxg2wxnet Objects: EventDemoFrame
		protected Кнопка mainbutton;
		//#endregion
		
		protected ЭлементМеню menuItemExit;
		protected ЭлементМеню menuItemAbout;
		
		DummyClass1 dc1;
		DummyClass2 dc2;
 
		//---------------------------------------------------------------------
 
		public this( Окно родитель, цел ид, ткст title )
		{
			super( родитель, ид , "Нов Событие Demo", wxDefaultPosition, wxDefaultSize, wxDEFAULT_FRAME_STYLE );
			dc1 = new DummyClass1();
			dc2 = new DummyClass2();
 

			// Do not change the code between region and endregion ( incl. region and endregion )...
			//#region Wxg2wxnet CTOR: EventDemoFrame
			mainbutton = new Кнопка( this, Cmd.ID_MAINBUTTON, "Press Me" );
			//#endregion
			
			Меню fileMenu = new Меню();
			
			menuItemExit = new ЭлементМеню( fileMenu, Cmd.ID_MENU_EXIT, "E&xit" );
			menuItemAbout = new ЭлементМеню( fileMenu, Cmd.ID_MENU_ABOUT, "&About..." );
			
			fileMenu.Append( menuItemAbout );
			
			fileMenu.AppendWL( Cmd.ID_MENU_ABOUT2, "&About2...", & OnMenuAboutClicked ) ;
			
			fileMenu.Append( menuItemExit );     
			
			Меню eventMenu = new Меню();
			
			eventMenu.AppendWL( Cmd.ID_MENU_EVENT_1, "&Remove 2. mainbutton handler", & OnMenuRemoveHandler ) ;
			eventMenu.AppendWL( Cmd.ID_MENU_EVENT_2, "&Readd 2. mainbutton handler", & OnMenuReaddHandler ) ;
			
			MenuBar menu_bar = new MenuBar();
			menu_bar.Append( fileMenu, "&File" );
			menu_bar.Append( eventMenu, "&Events" );

			this.menuBar = menu_bar;
			
			SetWxProperties();
			DoWxLayout();
			
			mainbutton.Click_Add(& OnButtonClicked );
			mainbutton.Click_Add(& dc1.OnButtonClicked );
			mainbutton.Click_Add(& dc2.OnButtonClicked );
			
			menuItemExit.Click_Add(& OnMenuExitClicked );
			menuItemAbout.Click_Add(& OnMenuAboutClicked );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnButtonClicked( Объект sender, Событие e )
		{
			MessageBox("I get called first", "Message dialog EventDemoFrame",
							Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuExitClicked( Объект sender, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuAboutClicked( Объект sender, Событие e )
		{
			MessageBox("This is the about Box...", "EventDemoFrame About...",
							Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuRemoveHandler( Объект sender, Событие e )
		{
			mainbutton.Click_Remove(&dc1.OnButtonClicked) ;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuReaddHandler( Объект sender, Событие e )
		{
			mainbutton.Click_Add(& dc1.OnButtonClicked );
		}
 
		//---------------------------------------------------------------------
 
		public проц SetWxProperties()
		{
			// Do not change the code between region and endregion ( incl. region and endregion )...
			//#region Wxg2wxnet PROPERTIES: EventDemoFrame
			Title = "Нов Событие Demo";
			mainbutton.SetDefault();
			//#endregion
		}
 
		//---------------------------------------------------------------------
 
		public проц DoWxLayout()
		{
			// Do not change the code between region and endregion ( incl. region and endregion )...
			//#region Wxg2wxnet LAYOUT: EventDemoFrame
 
			BoxSizer sizer_1 = new BoxSizer( Ориентация.wxVERTICAL );
			sizer_1.Добавь( mainbutton, 1, Direction.wxALL|Stretch.wxEXPAND, 2 );
			sizer_1.Fit( this );
			sizer_1.SetSizeHints( this );
			AutoLayout = да;
			SetSizer( sizer_1 );
			Layout();
			//#endregion
		}
	}
	
	//---------------------------------------------------------------------
	
	public class DummyClass1
	{
		public проц OnButtonClicked( Объект sender, Событие e )
		{
			MessageBox("I am second", "Message dialog DummyClass1",
							Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}
	}
	
	//---------------------------------------------------------------------
 
	public class DummyClass2
	{
		public проц OnButtonClicked( Объект sender, Событие e )
		{
			MessageBox("And I am the third", "Message dialog DummyClass2",
							Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}
	}

 

проц main()
{
	EventDemoApp.Main();
}
