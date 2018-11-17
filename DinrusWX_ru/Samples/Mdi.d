//-----------------------------------------------------------------------------
// wxD/Samples - Mdi.d
//
// wxD "mdi" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Mdi.d,v 1.10 2008/04/24 07:23:54 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;

struct ArrayList /* for .NET compatibility */
{
	Объект[] array;

	проц Добавь(Объект o)
	{
		array ~= o;
	}
	проц Remove(Объект o)
	{
		бцел i;
		for(i=0;i<array.length;i++) {
			if (array[i] is o) break;
		}
		if (i==array.length) return;
		for(i++;i<array.length;i++) {
			array[i-1] = array[i];
		}
		array.length = array.length-1;
	}
}

	public class MyFrame : MDIParentFrame
	{
		public enum Cmd 
		{ 
		   MDI_NEW_WINDOW = 1, 
		   MDI_QUIT, 
		   MDI_ABOUT
		}
		
		public static цел gs_nFrames;
		public static цел xpos = -1;
		public static цел ypos = -1;		
		
		private TextCtrl textWindow;
		
		public static MyFrame frame = null;

		public static ArrayList my_children;

		//---------------------------------------------------------------------

		public this( Окно родитель, ткст title, Точка поз, Размер Размер )
		{
			super( родитель, -1, title, поз, Размер );
			пиктограмма = new Пиктограмма( "./data/mondrian.png" );

			// Make a menubar
			Меню file_menu = new Меню();

			file_menu.Append( Cmd.MDI_NEW_WINDOW, "&Нов окно\tCtrl-N", "Создай a new child окно" );
			file_menu.Append( Cmd.MDI_QUIT, "&Exit\tAlt-X", "Quit the program" );

			Меню help_menu = new Меню();
			help_menu.Append( Cmd.MDI_ABOUT, "&About\tF1" );

			MenuBar menu_bar = new MenuBar();

			menu_bar.Append( file_menu, "&File" );
			menu_bar.Append( help_menu, "&Help" );

			this.menuBar = menu_bar;
			
			textWindow = new TextCtrl( this, -1, "A help окно", вхДефПоз, вхДефРазм, TextCtrl.wxTE_MULTILINE | TextCtrl.wxSUNKEN_BORDER );
			
			ToolBar toolBar = CreateToolBar(ToolBar.wxTB_FLAT | ToolBar.wxTB_HORIZONTAL);
			InitToolBar(this.toolBar);	

			CreateStatusBar();

			frame = this;
			
			EVT_MENU( Cmd.MDI_ABOUT, & OnAbout ) ;
			EVT_MENU( Cmd.MDI_NEW_WINDOW, & OnNewWindow ) ;
			EVT_MENU( Cmd.MDI_QUIT, & OnQuit ) ;
			 
			EVT_CLOSE( & OnClose ) ;

			EVT_SIZE( & OnSize ) ;
		}

		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageDialog md = new MessageDialog( this, "wxWidgets 2.0 MDI Demo\nPorted to wxD by Alexander Olk 2004\n", "About MDI Demo" );
			md.ShowModal();
		}

		//---------------------------------------------------------------------
		
		public проц OnNewWindow( Объект отправитель, Событие e )
		{
			пишифнс( "MyFrame: OnNewWindow");
			MyChild subframe = new MyChild( this, "Canvas Frame", Точка( -1, -1 ),
					Размер( -1, -1 ), wxDEFAULT_FRAME_STYLE );

			subframe.Покажи( да );	
		}

		//---------------------------------------------------------------------

		public проц OnQuit( Объект отправитель, Событие e )
		{
			пишифнс( "MyFrame: OnQuit" );
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnClose( Объект отправитель, Событие e )
		{
			пишифнс( "MyFrame: OnClose" );
			CloseEvent ce = cast(CloseEvent) e;
			
			if ( ce.CanVeto && MyFrame.gs_nFrames > 0 )
			{
				ткст msg = .вТкст(gs_nFrames) ~ " windows still open, close anyhow?";
				MessageDialog md = new MessageDialog( this, msg, "Please confirm", Dialog.wxICON_QUESTION | Dialog.wxYES_NO );
				if ( md.ShowModal() != wxID_YES )
				{
					ce.Veto();
					return;
				}
			}
			ce.Skip();
		}

		//---------------------------------------------------------------------
		
		public проц OnSize( Объект отправитель, Событие e )
		{
			Размер cs = РазмерКлиента;
			
			textWindow.УстРазм( 0, 0, 200, cs.Высь );
			GetClientWindow().УстРазм( 200, 0, cs.Ширь - 200, cs.Высь );
		}

		//---------------------------------------------------------------------
		
		public проц InitToolBar( ToolBar toolBar )
		{
			Битмап[] bitmaps = new Битмап[8];
			
			bitmaps[0] = new Битмап( "./data/bitmaps/new.xpm" );
			bitmaps[1] = new Битмап( "./data/bitmaps/open.xpm" );
			bitmaps[2] = new Битмап( "./data/bitmaps/save.xpm" );
			bitmaps[3] = new Битмап( "./data/bitmaps/copy.xpm" );
			bitmaps[4] = new Битмап( "./data/bitmaps/cut.xpm" );
			bitmaps[5] = new Битмап( "./data/bitmaps/paste.xpm" );
			bitmaps[6] = new Битмап( "./data/bitmaps/print.xpm" );
			bitmaps[7] = new Битмап( "./data/bitmaps/help.xpm" );
			
			цел ширь = 24;
			цел currentX = 5;
			
			toolBar.AddTool( Cmd.MDI_NEW_WINDOW, bitmaps[0], Битмап.wxNullBitmap, false, currentX, -1, null, "Нов File", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 100, bitmaps[1], Битмап.wxNullBitmap, false, currentX, -1, null, "Open file", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 200, bitmaps[2], Битмап.wxNullBitmap, false, currentX, -1, null, "Save file", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 300, bitmaps[3], Битмап.wxNullBitmap, false, currentX, -1, null, "Copy", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 400, bitmaps[4], Битмап.wxNullBitmap, false, currentX, -1, null, "Cut", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 500, bitmaps[5], Битмап.wxNullBitmap, false, currentX, -1, null, "Paste", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 600, bitmaps[6], Битмап.wxNullBitmap, false, currentX, -1, null, "Print", "" );
			currentX += ширь + 5;
			toolBar.AddTool( 700, bitmaps[7], Битмап.wxNullBitmap, false, currentX, -1, null, "Help", "" );
			
			toolBar.Realize();
		}
	}
			
	//---------------------------------------------------------------------
	
	public class MyCanvas : ScrolledWindow
	{
		private бул m_dirty = false;
		private бул drawing = false;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель, Точка поз, Размер Размер )
		{
			super( родитель, -1, поз, Размер,  /*ПБордюр.*/wxSUNKEN_BORDER | wxNO_FULL_REPAINT_ON_RESIZE | wxVSCROLL | wxHSCROLL );
			ЦветФона = new Цвет( "WHITE" );
			
			//this.EVT_MOUSE_EVENTS( & OnEvent ) ;
		}
		
		//---------------------------------------------------------------------
		
		public override проц OnDraw( DC dc )
		{
			dc.шрифт = Шрифт.wxSWISS_FONT;
			dc.pen = Pen.wxGREEN_PEN;
			
			dc.DrawLine( 0, 0, 200, 200 );
			dc.DrawLine( 200, 0, 0, 200 );
			
			dc.brush = Кисть.wxCYAN_BRUSH;
			dc.pen = Pen.wxRED_PEN;
			dc.DrawRectangle( 100, 100, 100, 50 );
			dc.DrawRoundedRectangle( 150, 150, 100, 50, 20 );
			
			dc.DrawEllipse( 250, 250, 100, 50 );
			//dc.DrawSpline( 50, 200, 50, 100, 200, 10 );
			dc.DrawLine( 50, 230, 200, 230 );
			dc.DrawText( "This is a test ткст", 50, 230 );
			
			Точка[3] points;
			points[0].X = 200; points[0].Y = 300;
			points[1].X = 100; points[1].Y = 400;
			points[2].X = 300; points[2].Y = 400;
			
			dc.DrawPolygon( 3, points );
			dc.Dispose();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEvent( Объект отправитель, Событие e)
		{
			MouseEvent me = cast(MouseEvent) e;

			if ( e.eventType == Событие.wxEVT_LEFT_DOWN )
			{
				drawing = да;
			}

			if ( e.eventType == Событие.wxEVT_LEFT_UP )
			{
				drawing = false;
			}

			if ( drawing )
			{
				ClientDC dc = new ClientDC( this );
				ПодготовьКР( dc );
			
				Точка тчк = me.LogicalPosition( dc );

				if ( MyFrame.xpos > -1 && MyFrame.ypos > -1 && me.Dragging )
				{
					dc.pen = Pen.wxBLACK_PEN;
					dc.DrawLine( MyFrame.xpos, MyFrame.ypos, тчк.X, тчк.Y );

					m_dirty = да;
				}

				dc.Dispose();
			
				MyFrame.xpos = тчк.X;
				MyFrame.ypos = тчк.Y;
			}
		}

		//---------------------------------------------------------------------
		
		public бул IsDirty()
		{
			return m_dirty;
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyChild : MDIChildFrame
	{
		enum Cmd { MDI_ABOUT = 100, MDI_QUIT, MDI_NEW_WINDOW, MDI_CHILD_QUIT, MDI_REFRESH, MDI_CHANGE_TITLE, MDI_CHANGE_POSITION, MDI_CHANGE_SIZE }
		
		private MyCanvas canvas = null;
		
		public static ткст s_title = "Canvas Frame";
		
		//---------------------------------------------------------------------
		
		public this( MDIParentFrame родитель, ткст title, Точка поз, Размер Размер, long стиль )
		{
			super( родитель, -1, title, поз, Размер, стиль | wxNO_FULL_REPAINT_ON_RESIZE );
			MyFrame.my_children.Добавь( this );

			пиктограмма = new Пиктограмма( "./data/mondrian.png" );
			
			УстРазмПодсказ( 100, 100 );
			
			ткст atitle = "Canvas Frame " ~ .вТкст( ++MyFrame.gs_nFrames );
			
			Титул = atitle;
			
			Меню file_menu = new Меню();

			file_menu.Append( Cmd.MDI_NEW_WINDOW, "&Нов окно" );
			file_menu.Append( Cmd.MDI_CHILD_QUIT, "&Закрой child", "Закрой this окно" );
			file_menu.Append( Cmd.MDI_QUIT, "&Exit" );

			Меню option_menu = new Меню();

			option_menu.Append( Cmd.MDI_REFRESH, "&Освежи picture" );
			option_menu.Append( Cmd.MDI_CHANGE_TITLE, "Change &title...\tCtrl-T" );
			option_menu.AppendSeparator();
			option_menu.Append( Cmd.MDI_CHANGE_POSITION, "Сдвинь frame\tCtrl-M" );
			option_menu.Append( Cmd.MDI_CHANGE_SIZE, "Resize frame\tCtrl-S" );

			Меню help_menu = new Меню();
			help_menu.Append( Cmd.MDI_ABOUT, "&About" );

			MenuBar menu_bar = new MenuBar();

			menu_bar.Append( file_menu, "&File" );
			menu_bar.Append( option_menu, "&Child" );
			menu_bar.Append( help_menu, "&Help" );

			this.menuBar = menu_bar;

			//CreateStatusBar();
			MyFrame.frame.StatusText = title;

			Размер cs = РазмерКлиента;
			canvas = new MyCanvas( this, Точка( 0, 0 ), Размер( cs.Ширь, cs.Высь ) );
			canvas.курсор = new Курсор( StockCursor.wxCURSOR_PENCIL );

			canvas.УстScrollbars(20, 20, 50, 50);
			
			EVT_MENU( Cmd.MDI_CHILD_QUIT, & OnQuit ) ;
			EVT_MENU( Cmd.MDI_REFRESH,  & OnRefresh ) ;
			EVT_MENU( Cmd.MDI_CHANGE_TITLE, & OnChangeTitle ) ;
			EVT_MENU( Cmd.MDI_CHANGE_POSITION, & OnChangePosition ) ;
			EVT_MENU( Cmd.MDI_CHANGE_SIZE, & OnChangeSize ) ;
			
			EVT_MENU( Cmd.MDI_NEW_WINDOW, & MyFrame.frame.OnNewWindow ) ;
			EVT_MENU( Cmd.MDI_QUIT, & MyFrame.frame.OnQuit ) ;
			EVT_MENU( Cmd.MDI_ABOUT, & MyFrame.frame.OnAbout ) ;

			EVT_SIZE( & OnSize ) ;
			EVT_MOVE( & OnMove ) ;

			EVT_CLOSE( & OnClose ) ;			
		}

		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект отправитель, Событие e )
		{
			пишифнс( "MyChild: OnQuit" );
			MyFrame.my_children.Remove( this );
			Закрой( да );
		}

		//---------------------------------------------------------------------
		
		public проц OnRefresh( Объект отправитель, Событие e )
		{
			if ( canvas ) 
				canvas.Освежи();
		}

		//---------------------------------------------------------------------
		
		public проц OnChangeTitle( Объект отправитель, Событие e )
		{
			ткст title = GetTextFromUser( "Enter the new title for MDI child", "MDI sample question", s_title, родитель.родитель );
			
			if ( title.length == 0 )
				return;
				
			s_title = title;
			Титул = s_title;
		}

		//---------------------------------------------------------------------
		
		public проц OnChangePosition( Объект отправитель, Событие e )
		{
			Сдвинь( 10, 10, 0 );
		}

		//---------------------------------------------------------------------

		public проц OnChangeSize( Объект отправитель, Событие e )
		{
			РазмерКлиента = Размер( 100, 100 );
		}

		//---------------------------------------------------------------------
		
		public проц OnSize( Объект отправитель, Событие e )
		{
			SizeEvent se = cast(SizeEvent) e;
			Размер size1 = se.Размер;
			Размер size2 = Размер;
			Размер size3 = РазмерКлиента;
			
			Log.LogStatus( "Размер from event: %dx%d, from frame %dx%d, клиент %dx%d",
					size1.Ширь, size1.Высь, size2.Ширь, size2.Высь, size3.Ширь, size3.Высь );
			se.Skip();
		}

		//---------------------------------------------------------------------
		
		public проц OnMove( Объект отправитель, Событие e )
		{
			MoveEvent me = cast(MoveEvent) e;
			Точка pos1 = me.Позиция;
			Точка pos2 = Позиция;

			Log.LogStatus( "position from event: ({0}, {1}), from frame ({2}, {3})",
					pos1.X, pos1.Y, pos2.X, pos2.Y );
			
			me.Skip();
		}

		//---------------------------------------------------------------------
		
		public проц OnClose( Объект отправитель, Событие e )
		{
			пишифнс( "MyChild: OnClose" );
			CloseEvent ce = cast(CloseEvent) e;

			if ( canvas && canvas.IsDirty )
			{
				MessageDialog md = new MessageDialog( null, "Really close ?", "Please confirm", 
						Dialog.wxICON_QUESTION | Dialog.wxYES_NO );
				if ( md.ShowModal() != wxID_YES )
				{
					ce.Veto();
					return;
				}
			}
			
			MyFrame.gs_nFrames--;
			
			e.Skip();
		}
	
		//---------------------------------------------------------------------
		
		public override проц OnActivate( Объект отправитель, Событие e )
		{
			СобытиеАктивации ae = cast(СобытиеАктивации) e;
			if ( ae.Активен && canvas )
				canvas.УстФокус();
		}
	}
	
	//---------------------------------------------------------------------

	public class MDI : Апп
	{
		public override бул ПоИниц()
		{
			MyFrame.frame = new MyFrame( null, "MDI Demo", Точка( -1, -1 ), Размер( 500, 400 ) );
			MyFrame.frame.Покажи( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			MDI app = new MDI();
			app.Пуск();
		}
	}	


проц main()
{
	MDI.Main();
}
