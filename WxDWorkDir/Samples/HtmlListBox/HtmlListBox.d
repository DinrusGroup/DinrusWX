//-----------------------------------------------------------------------------
// wxD/Samples - HtmlListBox.d
//
// wxD "HtmlListBox" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HtmlListBox.d,v 1.10 2008/04/24 07:18:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.ткст;


	public class MyHtmlListBox : HtmlListBox
	{
		//---------------------------------------------------------------------
		
		protected бул m_change;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель )
			{ this( родитель, нет ); }
			
		public this( Окно родитель, бул multi )
		{
			super( родитель, -1, wxDefaultPosition, wxDefaultSize, multi ? ListBox.wxLB_MULTIPLE : 0 );
			m_change = да;
			
			SetMargins( 5, 5 );
			
			ItemCount = 1000;
			
			Selection = 3;			
		}
		
		//---------------------------------------------------------------------
		
		public проц ChangeSelFg(бул значение)
		{
			m_change = значение;
		}
		
		//---------------------------------------------------------------------
		
		private static сим[] tohex(ббайт значение) {
			сим buf[2];
			buf[0] = hexdigits[значение/16];
			buf[1] = hexdigits[значение%16];
			return buf.dup;
		}
		
		private static бцел abs(цел значение) { return значение<0?-значение:значение; }
		
		protected override ткст OnGetItem( цел n )
		{
			цел level = ( n % 6 ) + 1;
		
			return std.ткст.format("<h%d><шрифт color=#%02x%02x%02x>Элемент</шрифт> <с>%d</с></h%d>",
				level,
				abs(n - 192) % 256,
				abs(n - 256) % 256,
				abs(n - 128) % 256,
				n,level
			);
		}
		
		//---------------------------------------------------------------------
		
		protected override проц OnDrawSeparator( DC dc, Прямоугольник прям, цел n )   
		{	
			MyFrame mp = cast(MyFrame)Parent;
			
			if ( mp.menuBar.IsChecked( MyFrame.Cmd.HtmlLbox_DrawSeparator ) )
			{
				dc.перо = Перо.wxBLACK_DASHED_PEN;
				dc.РисуйЛинию( прям.X, прям.Y, прям.Right - 1, прям.Y );
				dc.РисуйЛинию( прям.X, прям.Bottom - 1, прям.Right - 1, прям.Bottom - 1 );
			}
			
		}
		
		//---------------------------------------------------------------------
		
		protected override Цвет GetSelectedTextColour( Цвет цветПП )
		{
			return m_change ? super.GetSelectedTextColour( цветПП ) : цветПП;
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyFrame : Frame
	{
		public enum Cmd { HtmlLbox_Quit,
			HtmlLbox_SetMargins,
			HtmlLbox_DrawSeparator,
			HtmlLbox_ToggleMulti,
			HtmlLbox_SelectAll,

			HtmlLbox_SetBgCol,
			HtmlLbox_SetSelBgCol,
			HtmlLbox_SetSelFgCol,

			HtmlLbox_About = wxID_ABOUT }
		
		//---------------------------------------------------------------------
		
		private MyHtmlListBox m_hlbox;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель, ткст title, Точка поз, Размер size ) 
		{
			super( родитель, -1, title, поз, size );
			иконка = new Icon( "../Samples/HtmlListBox/mondrian.png" );
			
			Меню menuFile = new Меню();
			menuFile.Append( Cmd.HtmlLbox_Quit, "E&xit\tAlt-X", "Quit this program" );
			
			Меню menuHLbox = new Меню();
			menuHLbox.Append( Cmd.HtmlLbox_SetMargins, "Установи &margins...\tCtrl-G", "Change the margins around the items" );
			menuHLbox.AppendCheckItem( Cmd.HtmlLbox_DrawSeparator, "&Draw separators\tCtrl-D", "Toggle drawing separators between cells" );
			menuHLbox.AppendSeparator();
			menuHLbox.AppendCheckItem( Cmd.HtmlLbox_ToggleMulti, "&Multiple selection\tCtrl-M", "Toggle multiple selection on/off" );
			menuHLbox.AppendSeparator();
			menuHLbox.Append( Cmd.HtmlLbox_SelectAll, "Select &all items\tCtrl-A" );
			menuHLbox.AppendSeparator();
			menuHLbox.Append( Cmd.HtmlLbox_SetBgCol, "Установи &background...\tCtrl-B" );
			menuHLbox.Append( Cmd.HtmlLbox_SetSelBgCol, "Установи &selection background...\tCtrl-S" );
			menuHLbox.AppendCheckItem( Cmd.HtmlLbox_SetSelFgCol, "Keep &foreground in selection\tCtrl-F" );
			
			Меню helpMenu = new Меню();
			helpMenu.Append( Cmd.HtmlLbox_About, "&About...\tF1", "Show about dialog" );
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			menuBar.Append( menuHLbox, "&Listbox" );
			menuBar.Append( helpMenu, "&Справка" );
			
			menuBar.Check( Cmd.HtmlLbox_DrawSeparator, да );
			
			this.menuBar = menuBar;
			
			CreateStatusBar( 2 );
			StatusText = "Welcome to wxWidgets!";
			
			m_hlbox = new MyHtmlListBox( this );
			TextCtrl текст = new TextCtrl( this, -1, "", wxDefaultPosition, wxDefaultSize, TextCtrl.wxTE_MULTILINE );
			
			Log.SetActiveTarget( текст ); 
			
			BoxSizer sizer = new BoxSizer( Ориентация.wxHORIZONTAL );
			sizer.Добавь( m_hlbox, 1, Stretch.wxGROW );
			sizer.Добавь( текст, 1, Stretch.wxGROW );
			
			this.sizer = sizer;
			
			EVT_MENU( Cmd.HtmlLbox_Quit,  & OnQuit ) ;
			EVT_MENU( Cmd.HtmlLbox_SetMargins,  & OnSetMargins ) ;
			EVT_MENU( Cmd.HtmlLbox_DrawSeparator, & OnDrawSeparator ) ;
			EVT_MENU( Cmd.HtmlLbox_ToggleMulti, & OnToggleMulti ) ;
			EVT_MENU( Cmd.HtmlLbox_SelectAll, & OnSelectAll ) ;

			EVT_MENU( Cmd.HtmlLbox_About, & OnAbout ) ;

			EVT_MENU( Cmd.HtmlLbox_SetBgCol, & OnSetBgCol ) ;
			EVT_MENU( Cmd.HtmlLbox_SetSelBgCol, & OnSetSelBgCol ) ;
			EVT_MENU( Cmd.HtmlLbox_SetSelFgCol, & OnSetSelFgCol ) ;

			EVT_UPDATE_UI( Cmd.HtmlLbox_SelectAll, & OnUpdateUISelectAll ) ;


			EVT_LISTBOX( wxID_ANY, & OnLboxSelect ) ;
			EVT_LISTBOX_DCLICK( wxID_ANY, & OnLboxDClick ) ;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект sender, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект sender, Событие e )
		{
			MessageBox( this, "This sample shows wxHtmlListBox class.\n" 
				"\n" 
				"(c) 2003 Vadim Zeitlin\n" 
				"Ported to wxD by BERO", "About HtmlLbox", Диалог.wxOK | Диалог.wxICON_INFORMATION );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetMargins( Объект sender, Событие e )
		{
			long margin = GetNumberFromUser(
				"Enter the margins to use for the listbox items.",
				"Margin: ",
				"HtmlLbox: Установи the margins",
				0, 0, 20,
				this
			);
			
			if ( margin != -1 )
			{
				m_hlbox.SetMargins( margin, margin );
				m_hlbox.RefreshAll();
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDrawSeparator( Объект sender, Событие e )
		{
			m_hlbox.RefreshAll();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnToggleMulti( Объект sender, Событие e )
		{
			CommandEvent evt = cast(CommandEvent) e;
			
			Sizer sizer = this.sizer;
			sizer.Detach( m_hlbox );
			
			m_hlbox = new MyHtmlListBox( this, evt.IsChecked );
			sizer.Prepend( m_hlbox, 1, Stretch.wxGROW, 0, пусто );
			
			sizer.Layout();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelectAll( Объект sender, Событие e )
		{
			m_hlbox.SelectAll();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetBgCol( Объект sender, Событие e )
		{
			ColourData данные = new ColourData();

			данные.colour = m_hlbox.ЦветЗП;
			данные.ChooseFull = да;
			
			ColourДиалог cd = new ColourДиалог( this, данные );
			cd.Title = "Choose the background colour";
			
			if ( cd.ShowModal() == wxID_OK )
			{
				Цвет col = cd.colourData.colour;
			
				if ( col.Ок() )
				{
					m_hlbox.ЦветЗП = col;
					m_hlbox.Refresh();
				
					StatusText = "Фон colour changed.";
				}
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetSelBgCol( Объект sender, Событие e )
		{
			ColourData данные = new ColourData();

			данные.colour = m_hlbox.ЦветЗП;
			данные.ChooseFull = да;
			
			ColourДиалог cd = new ColourДиалог( this, данные );
			cd.Title = "Choose the selection background colour";
			
			if ( cd.ShowModal() == wxID_OK )
			{
				Цвет col = cd.colourData.colour;
			
			
				if ( col.Ок() )
				{
					m_hlbox.SelectionBackground = col;
					m_hlbox.Refresh();
				
					StatusText = "Selection background colour changed.";
				}
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetSelFgCol( Объект sender, Событие e )
		{
			CommandEvent evt = cast(CommandEvent) e;
			
			m_hlbox.ChangeSelFg = !evt.IsChecked;
			m_hlbox.Refresh();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnUpdateUISelectAll( Объект sender, Событие e )
		{
			UpdateUIEvent evt = cast(UpdateUIEvent) e;
			
			evt.Enabled = m_hlbox && m_hlbox.HasMultipleSelection;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnLboxSelect( Объект sender, Событие e )
		{
			CommandEvent evt = cast(CommandEvent) e;
			
			Log.LogMessage( "Listbox selection is now {0}.", evt.Int );
			
			if ( m_hlbox.HasMultipleSelection )
			{
				ткст s = "";
				бул first = да;
				бцел cookie = 0;
				
				for ( цел элемент = m_hlbox.GetFirstSelected( cookie ); элемент != -1/*wxNOT_FOUND*/; элемент = m_hlbox.GetNextSelected( cookie ) )
				{
					if ( first )
					{
						first = нет;
					}
					else
					{
						s ~= ", ";
					}
					
					s ~= std.ткст.toString(элемент);
					
				}
				
				if ( s.length > 0 )
					Log.LogMessage( "Selected items: {0}", s );
			}
			
			StatusText = "# items selected = " ~ .toString(m_hlbox.SelectedCount);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnLboxDClick( Объект sender, Событие e )
		{
			CommandEvent evt = cast(CommandEvent) e;
			
			Log.LogMessage( "Listbox элемент {0} дво clicked.", evt.Int );
		}
	}
	
	//---------------------------------------------------------------------

	public class HTLBox : Прил
	{
		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame( пусто, "HtmListBox sample", Точка( -1, -1 ), Размер( 400, 500 ) );
			frame.Show( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			HTLBox прил = new HTLBox();
			прил.Пуск();
		}
	}	


проц main()
{
	HTLBox.Main();
}
