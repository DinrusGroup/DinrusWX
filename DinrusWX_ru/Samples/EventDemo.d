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


	public class EventDemoApp : Апп 
	{
		public override бул ПоИниц()
		{
			EventDemoFrame _eventdemoframe = new EventDemoFrame( null, -1, "" );
			_eventdemoframe.Покажи( да );
 
			return да;
		}
 
		//---------------------------------------------------------------------
 
		
		static проц Main()
		{
			EventDemoApp app = new EventDemoApp();
			app.Пуск();
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
		
		protected ЭлтМеню элтМенюExit;
		protected ЭлтМеню элтМенюAbout;
		
		DummyClass1 dc1;
		DummyClass2 dc2;
 
		//---------------------------------------------------------------------
 
		public this( Окно родитель, цел ид, ткст title )
		{
			super( родитель, ид , "Нов Событие Demo", вхДефПоз, вхДефРазм, wxDEFAULT_FRAME_STYLE );
			dc1 = new DummyClass1();
			dc2 = new DummyClass2();
 

			// Do not change the code between region and endregion ( incl. region and endregion )...
			//#region Wxg2wxnet CTOR: EventDemoFrame
			mainbutton = new Кнопка( this, Cmd.ID_MAINBUTTON, "Press Me" );
			//#endregion
			
			Меню fileMenu = new Меню();
			
			элтМенюExit = new ЭлтМеню( fileMenu, Cmd.ID_MENU_EXIT, "E&xit" );
			элтМенюAbout = new ЭлтМеню( fileMenu, Cmd.ID_MENU_ABOUT, "&About..." );
			
			fileMenu.Append( элтМенюAbout );
			
			fileMenu.AppendWL( Cmd.ID_MENU_ABOUT2, "&About2...", & OnMenuAboutClicked ) ;
			
			fileMenu.Append( элтМенюExit );     
			
			Меню eventMenu = new Меню();
			
			eventMenu.AppendWL( Cmd.ID_MENU_EVENT_1, "&Remove 2. mainbutton обработчик", & OnMenuRemoveHandler ) ;
			eventMenu.AppendWL( Cmd.ID_MENU_EVENT_2, "&Readd 2. mainbutton обработчик", & OnMenuReaddHandler ) ;
			
			MenuBar menu_bar = new MenuBar();
			menu_bar.Append( fileMenu, "&File" );
			menu_bar.Append( eventMenu, "&Events" );

			this.menuBar = menu_bar;
			
			УстWxProperties();
			DoWxLayout();
			
			mainbutton.Click_Add(& OnButtonClicked );
			mainbutton.Click_Add(& dc1.OnButtonClicked );
			mainbutton.Click_Add(& dc2.OnButtonClicked );
			
			элтМенюExit.Click_Add(& OnMenuExitClicked );
			элтМенюAbout.Click_Add(& OnMenuAboutClicked );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnButtonClicked( Объект отправитель, Событие e )
		{
			MessageBox("I get called first", "Message dialog EventDemoFrame",
							Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuExitClicked( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuAboutClicked( Объект отправитель, Событие e )
		{
			MessageBox("This is the about Box...", "EventDemoFrame About...",
							Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuRemoveHandler( Объект отправитель, Событие e )
		{
			mainbutton.Click_Remove(&dc1.OnButtonClicked) ;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnMenuReaddHandler( Объект отправитель, Событие e )
		{
			mainbutton.Click_Add(& dc1.OnButtonClicked );
		}
 
		//---------------------------------------------------------------------
 
		public проц УстWxProperties()
		{
			// Do not change the code between region and endregion ( incl. region and endregion )...
			//#region Wxg2wxnet PROPERTIES: EventDemoFrame
			Титул = "Нов Событие Demo";
			mainbutton.УстДеф();
			//#endregion
		}
 
		//---------------------------------------------------------------------
 
		public проц DoWxLayout()
		{
			// Do not change the code between region and endregion ( incl. region and endregion )...
			//#region Wxg2wxnet LAYOUT: EventDemoFrame
 
			БоксСайзер sizer_1 = new БоксСайзер( Ориентация.wxVERTICAL );
			sizer_1.Добавь( mainbutton, 1, Direction.wxALL|Stretch.wxEXPAND, 2 );
			sizer_1.Встрой( this );
			sizer_1.УстРазмПодсказ( this );
			АвтоРаскладка = да;
			УстСайзер( sizer_1 );
			Раскладка();
			//#endregion
		}
	}
	
	//---------------------------------------------------------------------
	
	public class DummyClass1
	{
		public проц OnButtonClicked( Объект отправитель, Событие e )
		{
			MessageBox("I am second", "Message dialog DummyClass1",
							Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}
	}
	
	//---------------------------------------------------------------------
 
	public class DummyClass2
	{
		public проц OnButtonClicked( Объект отправитель, Событие e )
		{
			MessageBox("And I am the third", "Message dialog DummyClass2",
							Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}
	}

 

проц main()
{
	EventDemoApp.Main();
}
