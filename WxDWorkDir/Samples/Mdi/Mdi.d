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
private import std.stdio;
private import std.ткст;

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
		
		public static MyFrame frame = пусто;

		public static ArrayList my_children;

		//---------------------------------------------------------------------

		public this( Окно родитель, ткст title, Точка поз, Размер size )
		{
			super( родитель, -1, title, поз, size );
			иконка = new Icon( "../Samples/Mdi/mondrian.png" );

			// Make a menubar
			Меню file_menu = new Меню();

			file_menu.Append( Cmd.MDI_NEW_WINDOW, "&Нов окно\tCtrl-N", "Create a new child окно" );
			file_menu.Append( Cmd.MDI_QUIT, "&Exit\tAlt-X", "Quit the program" );

			Меню help_menu = new Меню();
			help_menu.Append( Cmd.MDI_ABOUT, "&About\tF1" );

			MenuBar menu_bar = new MenuBar();

			menu_bar.Append( file_menu, "&File" );
			menu_bar.Append( help_menu, "&Справка" );

			this.menuBar = menu_bar;
			
			textWindow = new TextCtrl( this, -1, "A справка окно", wxDefaultPosition, wxDefaultSize, TextCtrl.wxTE_MULTILINE | TextCtrl.wxSUNKEN_BORDER );
			
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
		
		public проц OnAbout( Объект sender, Событие e )
		{
			MessageДиалог md = new MessageДиалог( this, "wxWidgets 2.0 MDI Demo\nPorted to wxD by Alexander Olk 2004\n", "About MDI Demo" );
			md.ShowModal();
		}

		//---------------------------------------------------------------------
		
		public проц OnNewWindow( Объект sender, Событие e )
		{
			writefln( "MyFrame: OnNewWindow");
			MyChild subframe = new MyChild( this, "Canvas Frame", Точка( -1, -1 ),
					Размер( -1, -1 ), wxDEFAULT_FRAME_STYLE );

			subframe.Show( да );	
		}

		//---------------------------------------------------------------------

		public проц OnQuit( Объект sender, Событие e )
		{
			writefln( "MyFrame: OnQuit" );
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnClose( Объект sender, Событие e )
		{
			writefln( "MyFrame: OnClose" );
			CloseEvent ce = cast(CloseEvent) e;
			
			if ( ce.CanVeto && MyFrame.gs_nFrames > 0 )
			{
				ткст msg = .toString(gs_nFrames) ~ " windows still open, close anyhow?";
				MessageДиалог md = new MessageДиалог( this, msg, "Please confirm", Диалог.wxICON_QUESTION | Диалог.wxYES_NO );
				if ( md.ShowModal() != wxID_YES )
				{
					ce.Veto();
					return;
				}
			}
			ce.Пропусти();
		}

		//---------------------------------------------------------------------
		
		public проц OnSize( Объект sender, Событие e )
		{
			Размер cs = ClientSize;
			
			textWindow.УстРазм( 0, 0, 200, cs.Высота );
			GetClientWindow().УстРазм( 200, 0, cs.Ширина - 200, cs.Высота );
		}

		//---------------------------------------------------------------------
		
		public проц InitToolBar( ToolBar toolBar )
		{
			Битмап[] bitmaps = new Битмап[8];
			
			bitmaps[0] = new Битмап( "../Samples/Mdi/bitmaps/new.xpm" );
			bitmaps[1] = new Битмап( "../Samples/Mdi/bitmaps/open.xpm" );
			bitmaps[2] = new Битмап( "../Samples/Mdi/bitmaps/save.xpm" );
			bitmaps[3] = new Битмап( "../Samples/Mdi/bitmaps/copy.xpm" );
			bitmaps[4] = new Битмап( "../Samples/Mdi/bitmaps/cut.xpm" );
			bitmaps[5] = new Битмап( "../Samples/Mdi/bitmaps/paste.xpm" );
			bitmaps[6] = new Битмап( "../Samples/Mdi/bitmaps/print.xpm" );
			bitmaps[7] = new Битмап( "../Samples/Mdi/bitmaps/справка.xpm" );
			
			цел ширина = 24;
			цел currentX = 5;
			
			toolBar.AddTool( Cmd.MDI_NEW_WINDOW, bitmaps[0], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Нов File", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 100, bitmaps[1], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Открой file", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 200, bitmaps[2], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Save file", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 300, bitmaps[3], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Копируй", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 400, bitmaps[4], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Cut", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 500, bitmaps[5], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Вставь", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 600, bitmaps[6], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Print", "" );
			currentX += ширина + 5;
			toolBar.AddTool( 700, bitmaps[7], Битмап.wxNullBitmap, нет, currentX, -1, пусто, "Справка", "" );
			
			toolBar.Realize();
		}
	}
			
	//---------------------------------------------------------------------
	
	public class MyCanvas : ScrolledWindow
	{
		private бул m_dirty = нет;
		private бул drawing = нет;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель, Точка поз, Размер size )
		{
			super( родитель, -1, поз, size,  /*Border.*/wxSUNKEN_BORDER | wxNO_FULL_REPAINT_ON_RESIZE | wxVSCROLL | wxHSCROLL );
			ЦветЗП = new Цвет( "WHITE" );
			
			this.EVT_MOUSE_EVENTS( & OnEvent ) ;
		}
		
		//---------------------------------------------------------------------
		
		public override проц OnDraw( DC dc )
		{
			dc.шрифт = Шрифт.wxSWISS_FONT;
			dc.перо = Перо.wxGREEN_PEN;
			
			dc.РисуйЛинию( 0, 0, 200, 200 );
			dc.РисуйЛинию( 200, 0, 0, 200 );
			
			dc.кисть = Кисть.wxCYAN_BRUSH;
			dc.перо = Перо.wxRED_PEN;
			dc.РисуйПрям( 100, 100, 100, 50 );
			dc.РисуйОкруглыйПрям( 150, 150, 100, 50, 20 );
			
			dc.РисуйЭллипс( 250, 250, 100, 50 );
			//dc.DrawSpline( 50, 200, 50, 100, 200, 10 );
			dc.РисуйЛинию( 50, 230, 200, 230 );
			dc.РисуйТекст( "This is a test ткст", 50, 230 );
			
			Точка[3] points;
			points[0].X = 200; points[0].Y = 300;
			points[1].X = 100; points[1].Y = 400;
			points[2].X = 300; points[2].Y = 400;
			
			dc.РисуйМногоуг( 3, points );
			dc.Dispose();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEvent( Объект sender, Событие e)
		{
			MouseEvent me = cast(MouseEvent) e;

			if ( e.ТипСоб == Событие.wxEVT_LEFT_DOWN )
			{
				drawing = да;
			}

			if ( e.ТипСоб == Событие.wxEVT_LEFT_UP )
			{
				drawing = нет;
			}

			if ( drawing )
			{
				ClientDC dc = new ClientDC( this );
				PrepareDC( dc );
			
				Точка pt = me.LogicalPosition( dc );

				if ( MyFrame.xpos > -1 && MyFrame.ypos > -1 && me.Dragging )
				{
					dc.перо = Перо.wxBLACK_PEN;
					dc.РисуйЛинию( MyFrame.xpos, MyFrame.ypos, pt.X, pt.Y );

					m_dirty = да;
				}

				dc.Dispose();
			
				MyFrame.xpos = pt.X;
				MyFrame.ypos = pt.Y;
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
		
		private MyCanvas canvas = пусто;
		
		public static ткст s_title = "Canvas Frame";
		
		//---------------------------------------------------------------------
		
		public this( MDIParentFrame родитель, ткст title, Точка поз, Размер size, long стиль )
		{
			super( родитель, -1, title, поз, size, стиль | wxNO_FULL_REPAINT_ON_RESIZE );
			MyFrame.my_children.Добавь( this );

			иконка = new Icon( "../Samples/Mdi/mondrian.png" );
			
			SetSizeHints( 100, 100 );
			
			ткст atitle = "Canvas Frame " ~ .toString( ++MyFrame.gs_nFrames );
			
			Title = atitle;
			
			Меню file_menu = new Меню();

			file_menu.Append( Cmd.MDI_NEW_WINDOW, "&Нов окно" );
			file_menu.Append( Cmd.MDI_CHILD_QUIT, "&Закрой child", "Закрой this окно" );
			file_menu.Append( Cmd.MDI_QUIT, "&Exit" );

			Меню option_menu = new Меню();

			option_menu.Append( Cmd.MDI_REFRESH, "&Refresh picture" );
			option_menu.Append( Cmd.MDI_CHANGE_TITLE, "Change &title...\tCtrl-T" );
			option_menu.AppendSeparator();
			option_menu.Append( Cmd.MDI_CHANGE_POSITION, "Move frame\tCtrl-M" );
			option_menu.Append( Cmd.MDI_CHANGE_SIZE, "Resize frame\tCtrl-S" );

			Меню help_menu = new Меню();
			help_menu.Append( Cmd.MDI_ABOUT, "&About" );

			MenuBar menu_bar = new MenuBar();

			menu_bar.Append( file_menu, "&File" );
			menu_bar.Append( option_menu, "&Child" );
			menu_bar.Append( help_menu, "&Справка" );

			this.menuBar = menu_bar;

			//CreateStatusBar();
			MyFrame.frame.StatusText = title;

			Размер cs = ClientSize;
			canvas = new MyCanvas( this, Точка( 0, 0 ), Размер( cs.Ширина, cs.Высота ) );
			canvas.cursor = new Cursor( StockCursor.wxCURSOR_PENCIL );

			canvas.SetScrollbars(20, 20, 50, 50);
			
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
		
		public проц OnQuit( Объект sender, Событие e )
		{
			writefln( "MyChild: OnQuit" );
			MyFrame.my_children.Remove( this );
			Закрой( да );
		}

		//---------------------------------------------------------------------
		
		public проц OnRefresh( Объект sender, Событие e )
		{
			if ( canvas ) 
				canvas.Refresh();
		}

		//---------------------------------------------------------------------
		
		public проц OnChangeTitle( Объект sender, Событие e )
		{
			ткст title = GetTextFromUser( "Enter the new title for MDI child", "MDI sample question", s_title, Parent.Parent );
			
			if ( title.length == 0 )
				return;
				
			s_title = title;
			Title = s_title;
		}

		//---------------------------------------------------------------------
		
		public проц OnChangePosition( Объект sender, Событие e )
		{
			Move( 10, 10, 0 );
		}

		//---------------------------------------------------------------------

		public проц OnChangeSize( Объект sender, Событие e )
		{
			ClientSize = Размер( 100, 100 );
		}

		//---------------------------------------------------------------------
		
		public проц OnSize( Объект sender, Событие e )
		{
			SizeEvent se = cast(SizeEvent) e;
			Размер size1 = se.size;
			Размер size2 = size;
			Размер size3 = ClientSize;
			
			Log.LogStatus( "size from event: %dx%d, from frame %dx%d, client %dx%d",
					size1.Ширина, size1.Высота, size2.Ширина, size2.Высота, size3.Ширина, size3.Высота );
			se.Пропусти();
		}

		//---------------------------------------------------------------------
		
		public проц OnMove( Объект sender, Событие e )
		{
			MoveEvent me = cast(MoveEvent) e;
			Точка pos1 = me.Положение;
			Точка pos2 = Положение;

			Log.LogStatus( "position from event: ({0}, {1}), from frame ({2}, {3})",
					pos1.X, pos1.Y, pos2.X, pos2.Y );
			
			me.Пропусти();
		}

		//---------------------------------------------------------------------
		
		public проц OnClose( Объект sender, Событие e )
		{
			writefln( "MyChild: OnClose" );
			CloseEvent ce = cast(CloseEvent) e;

			if ( canvas && canvas.IsDirty )
			{
				MessageДиалог md = new MessageДиалог( пусто, "Really close ?", "Please confirm", 
						Диалог.wxICON_QUESTION | Диалог.wxYES_NO );
				if ( md.ShowModal() != wxID_YES )
				{
					ce.Veto();
					return;
				}
			}
			
			MyFrame.gs_nFrames--;
			
			e.Пропусти();
		}
	
		//---------------------------------------------------------------------
		
		public override проц OnActivate( Объект sender, Событие e )
		{
			СобАктивирования ae = cast(СобАктивирования) e;
			if ( ae.Активен && canvas )
				canvas.SetFocus();
		}
	}
	
	//---------------------------------------------------------------------

	public class MDI : Прил
	{
		public override бул ПриИниц()
		{
			MyFrame.frame = new MyFrame( пусто, "MDI Demo", Точка( -1, -1 ), Размер( 500, 400 ) );
			MyFrame.frame.Show( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			MDI прил = new MDI();
			прил.Пуск();
		}
	}	


проц main()
{
	MDI.Main();
}
