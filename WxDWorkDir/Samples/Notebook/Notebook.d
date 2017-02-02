//-----------------------------------------------------------------------------
// wxD/Samples - Notebook.d
//
// wxD "Notebook" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Notebook.d,v 1.10 2008/03/03 19:50:10 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.string;
alias std.string.find indexOf;

	public class MyFrame : Фрейм
	{
		enum ID_CONTROLS 
		{
			ID_RADIO_ORIENT = 5999,
			ID_CHK_SHOWIMAGES,
			ID_BTN_ADD_PAGE,
			ID_BTN_INSERT_PAGE,
			ID_BTN_DELETE_CUR_PAGE,
			ID_BTN_DELETE_LAST_PAGE,
			ID_BTN_NEXT_PAGE,
			ID_NOTEBOOK
		}
		
		public const цел ORIENT_TOP = 0;
		public const цел ORIENT_BOTTOM = 1;
		public const цел ORIENT_LEFT = 2;
		public const цел ORIENT_RIGHT = 3;
		public const цел ORIENT_MAX = 4;		
		
		private Panel m_panel;
		private RadioBox m_radioOrient;
		private CheckBox m_chkShowImages;
		
		private Кнопка m_btnAddPage;
		private Кнопка m_btnInsertPage;
		private Кнопка m_btnDeleteCurPage;
		private Кнопка m_btnDeleteLastPage;
		private Кнопка m_btnNextPage;
		private Кнопка m_btnExit;
		
		private MyNotebook m_notebook;
		private TextCtrl m_text;
		
		private BoxSizer m_sizerFrame;
		private BoxSizer m_sizerTop;
		private NotebookSizer m_sizerNotebook;
		private ImageList m_imageList;
		
		public static цел s_pageAdded = 0;
		public static цел s_pageIns = 0;
		public static цел s_numNotebookEvents = 0;
		public static цел s_nPages = -1;
		public static цел s_nSel = -1;
		
		//---------------------------------------------------------------------

		public this( ткст title, Точка поз, Размер size )
		{
			super( title, поз, size );
			Размер imageSize = Размер( 32, 32 );
			
			m_imageList = new ImageList( imageSize.Ширина, imageSize.Высота );
			
			m_imageList.Добавь( ArtProvider.GetIcon( ArtID.wxART_INFORMATION, ArtClient.wxART_OTHER, imageSize ) );
			
			m_imageList.Добавь( ArtProvider.GetIcon( ArtID.wxART_QUESTION, ArtClient.wxART_OTHER, imageSize ) );
			
			m_imageList.Добавь( ArtProvider.GetIcon( ArtID.wxART_WARNING, ArtClient.wxART_OTHER, imageSize ) );
			
			m_imageList.Добавь( ArtProvider.GetIcon( ArtID.wxART_ERROR, ArtClient.wxART_OTHER, imageSize ) );
			
			m_panel = new Panel( this, -1, wxDefaultPosition, wxDefaultSize,
				wxTAB_TRAVERSAL | wxCLIP_CHILDREN | wxNO_BORDER );
			
			ткст[] strOrientations =
			[
				"&Top",
				"&Bottom",
				"&Left",
				"&Right"
			];
			
			m_radioOrient = new RadioBox(
				m_panel, ID_CONTROLS.ID_RADIO_ORIENT,
				"&Tab orientation",
				wxDefaultPosition, wxDefaultSize,
				strOrientations,
				1, RadioBox.wxRA_SPECIFY_COLS );
			
			m_chkShowImages = new CheckBox( m_panel, ID_CONTROLS.ID_CHK_SHOWIMAGES, "&Show images" );
			
			m_btnAddPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_ADD_PAGE, "&Добавь page" );
			
			m_btnInsertPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_INSERT_PAGE, "&Insert page" );
			
			m_btnDeleteCurPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_DELETE_CUR_PAGE, "&Delete current page" );
			
			m_btnDeleteLastPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_DELETE_LAST_PAGE, "Delete las&t page" );
			
			m_btnNextPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_NEXT_PAGE, "&Next page" );
			
			m_btnExit = new Кнопка( m_panel, wxID_OK, "&Exit" );
			m_btnExit.SetDefault();
			
			m_notebook = new MyNotebook( m_panel, ID_CONTROLS.ID_NOTEBOOK );
			
			m_text = new TextCtrl( m_panel, -1, "", wxDefaultPosition, wxDefaultSize, TextCtrl.wxTE_MULTILINE | TextCtrl.wxTE_READONLY );
			
			Log.SetActiveTarget( m_text );
			Log.AddTraceMask( "focus" );			
			
			m_notebook.CreateInitialPages();
			
			m_sizerFrame = new BoxSizer( Ориентация.wxVERTICAL );
			
			m_sizerTop = new BoxSizer( Ориентация.wxHORIZONTAL );
			
			BoxSizer sizerLeft = new BoxSizer( Ориентация.wxVERTICAL );
			
			sizerLeft.Добавь( m_radioOrient, 0, Stretch.wxEXPAND );
			sizerLeft.Добавь( m_chkShowImages, 0, Stretch.wxEXPAND | Direction.wxTOP, 4 );
			
			//sizerLeft.Добавь( 0, 0, 1 );
			
			sizerLeft.Добавь( m_btnAddPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnInsertPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnDeleteCurPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnDeleteLastPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnNextPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			
			//sizerLeft.Добавь( 0, 0, 1 );
			
			sizerLeft.Добавь( m_btnExit, 0, Stretch.wxEXPAND );
			
			m_sizerTop.Добавь( sizerLeft, 0, Stretch.wxEXPAND | Direction.wxALL, 4 );
			
			m_sizerFrame.Добавь( m_sizerTop, 1, Stretch.wxEXPAND );
			m_sizerFrame.Добавь( m_text, 0, Stretch.wxEXPAND );
			
			ReInitNotebook();
			
			m_panel.sizer = m_sizerFrame;
			
			m_panel.AutoLayout = да;
			
			m_sizerFrame.Fit( this );
			
			Centre( Ориентация.wxBOTH );
			
			EVT_RADIOBOX( ID_CONTROLS.ID_RADIO_ORIENT, & OnCheckOrRadioBox) ;
			EVT_CHECKBOX( ID_CONTROLS.ID_CHK_SHOWIMAGES, & OnCheckOrRadioBox ) ;

			EVT_BUTTON( ID_CONTROLS.ID_BTN_ADD_PAGE, & OnButtonAddPage ) ;
			EVT_BUTTON( ID_CONTROLS.ID_BTN_INSERT_PAGE, & OnButtonInsertPage ) ;
			EVT_BUTTON( ID_CONTROLS.ID_BTN_DELETE_CUR_PAGE, & OnButtonDeleteCurPage ) ;
			EVT_BUTTON( ID_CONTROLS.ID_BTN_DELETE_LAST_PAGE, & OnButtonDeleteLastPage ) ;
			EVT_BUTTON( ID_CONTROLS.ID_BTN_NEXT_PAGE, & OnButtonNextPage ) ;
			EVT_BUTTON( wxID_OK, & OnButtonExit ) ;

			EVT_UPDATE_UI( ID_CONTROLS.ID_BTN_DELETE_CUR_PAGE, & OnUpdateUIBtnDeleteCurPage ) ;
			EVT_UPDATE_UI( ID_CONTROLS.ID_BTN_DELETE_LAST_PAGE, & OnUpdateUIBtnDeleteLastPage ) ;

			EVT_NOTEBOOK_PAGE_CHANGED( ID_CONTROLS.ID_NOTEBOOK, & OnNotebook ) ;
			EVT_NOTEBOOK_PAGE_CHANGING( ID_CONTROLS.ID_NOTEBOOK, & OnNotebook ) ;

			EVT_IDLE( & OnIdle ) ;
		}
		
		public проц ReInitNotebook()
		{
			long флаги = 0;
			
			switch ( m_radioOrient.Selection )
			{
				default: Log.LogError( "unknown notebook orientation" ); break;
				case ORIENT_TOP :
					флаги = Notebook.wxNB_TOP;
					break;
				case ORIENT_BOTTOM :
					флаги = Notebook.wxNB_BOTTOM;
					break;
				case ORIENT_LEFT :
					флаги = Notebook.wxNB_LEFT;
					break;
				case ORIENT_RIGHT :
					флаги = Notebook.wxNB_RIGHT;
					break;
			}
			
			MyNotebook notebook = m_notebook;
			
			m_notebook = new MyNotebook( m_panel, ID_CONTROLS.ID_NOTEBOOK,
				wxDefaultPosition, wxDefaultSize, флаги );
			
			if ( m_chkShowImages.IsChecked )
			{
				m_notebook.Images = m_imageList;
			}
			
			if ( notebook )
			{
				цел sel = notebook.Selection;
				
				цел счёт = notebook.PageCount;
				
				for ( цел n = 0; n < счёт; n++ )
				{
					ткст str = notebook.GetPageText( n );
					
					Окно page = m_notebook.CreatePage( str );
					m_notebook.AddPage( page, str, нет, m_notebook.IconIndex );
				}
				
				if ( m_sizerNotebook )
				{
					m_sizerTop.Remove( m_sizerNotebook );
				}
				
				notebook.Dispose();
				notebook = пусто;
				
				if ( sel != -1 )
				{
					m_notebook.Selection = sel;
				}
			}
			
			m_sizerNotebook = new NotebookSizer( m_notebook );
			m_sizerTop.Добавь( m_sizerNotebook, 1, Stretch.wxEXPAND | Direction.wxALL, 4 );
			m_sizerTop.Layout();
		}
		
		public проц OnCheckOrRadioBox( Объект sender, Событие e )
		{
			ReInitNotebook();
		}
		
		public проц OnButtonAddPage( Объект sender, Событие e )
		{
			Panel panel = new Panel( m_notebook, -1 );
			new Кнопка( panel, -1, "First button", Точка( 10, 10 ), Размер( -1, -1 ) );
			new Кнопка( panel, -1, "Second button", Точка( 50, 100 ), Размер( -1, -1 ) );
			
			m_notebook.AddPage( panel, "Added " ~ .toString( ++s_pageAdded), да, m_notebook.IconIndex );
		}
		
		public проц OnButtonInsertPage( Объект sender, Событие e )
		{
			Panel panel = m_notebook.CreateUserCreatedPage();
			
			m_notebook.InsertPage( 0, panel, "Inserted " ~ .toString( ++s_pageIns), нет, m_notebook.IconIndex );
			
			m_notebook.Selection = 0;
		}
		
		public проц OnButtonDeleteCurPage( Объект sender, Событие e )
		{
			цел sel = m_notebook.Selection;
			
			if ( sel != -1 )
			{
				m_notebook.DeletePage( sel );
			}
		}
		
		public проц OnButtonDeleteLastPage( Объект sender, Событие e )
		{
			цел page = m_notebook.PageCount;
			
			if ( page != 0 )
			{
				m_notebook.DeletePage( page -1 );
			}
		}
		
		public проц OnButtonNextPage( Объект sender, Событие e )
		{
			m_notebook.AdvanceSelection( да );
		}
		
		public проц OnButtonExit( Объект sender, Событие e )
		{
			Закрой();
		}
		
		public проц OnNotebook( Объект sender, Событие e )
		{
			ткст str = "Unknown notebook event";
			
			NotebookEvent ne = cast(NotebookEvent) e;
			
			цел ТипСоб = ne.ТипСоб;
			
			if ( ТипСоб == Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED )
			{
				str = "Notebook changed";
			}
			else if ( ТипСоб == Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING )
			{
				цел idx = ne.OldSelection;
				
				if ( idx != -1 && m_notebook.GetPageText( idx ) == "Veto" )
				{
					MessageДиалог md = new MessageДиалог( this, "Are you sure you want to leave this notebook page?\n(This demonstrates veto-ing)",
							"Notebook sample", Диалог.wxICON_QUESTION | Диалог.wxYES_NO );
						
					if ( md.ShowModal() != wxID_YES )
					{
						ne.Veto();
						
						return;
					}		
				}
				
				str = "Notebook changing";
			}
			
			Log.LogMessage( "Notebook event #{0}: {1} ({2})", s_numNotebookEvents++, str, ТипСоб );
			
			m_text.SetInsertionPointEnd();
			
			ne.Пропусти();
		}
		
		public проц OnUpdateUIBtnDeleteCurPage( Объект sender, Событие e )
		{
			UpdateUIEvent ue = cast(UpdateUIEvent) e;
			ue.Enabled = m_notebook.Selection != -1;
		}
		
		public проц OnUpdateUIBtnDeleteLastPage( Объект sender, Событие e )
		{
			UpdateUIEvent ue = cast(UpdateUIEvent) e;
			ue.Enabled = m_notebook.PageCount != 0;
		}
		
		public проц OnIdle( Объект sender, Событие e )
		{
			цел nPages = m_notebook.PageCount;
			цел nSel = m_notebook.Selection;
			if ( nPages != s_nPages || nSel != s_nSel )
			{
				s_nPages = nPages;
				s_nSel = nSel;
				
				ткст title = "Notebook (" ~ .toString(nPages) ~ " pages, selection: " ~ .toString(nSel) ~ ")";
				
				Title = title;
			}
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyNotebook : Notebook
	{
		public this( Окно родитель, цел ид )
			{ this( родитель, ид, wxDefaultPosition, wxDefaultSize, 0 ); }
		
		public this( Окно родитель, цел ид, Точка поз, Размер size, long стиль )
		{
			super ( родитель, ид, поз, size, стиль );
		}
		
		public проц CreateInitialPages()
		{
			Panel panel = пусто;
			
			panel = CreateRadioButtonsPage();
			AddPage( panel, "Radiobuttons", нет, IconIndex );
			
			panel = CreateVetoPage();
			AddPage( panel, "Veto", нет, IconIndex );
			
			panel = CreateBigButtonPage();
			AddPage( panel, "Maximized button", нет, IconIndex );
			
			panel = CreateInsertPage();
			InsertPage( 0, panel, "Inserted", нет, IconIndex );
			
			Selection = 1;
		}
		
		public Panel CreatePage( ткст pageName )
		{
			if ( pageName.indexOf( "Inserted " ) != -1 || pageName.indexOf( "Added " ) != -1 )
			{
				return CreateUserCreatedPage();
			}
			
			if ( pageName == "Inserted" )
			{
				return CreateInsertPage();
			}
			
			if ( pageName == "Veto" )
			{
				return CreateVetoPage();
			}
			
			if ( pageName == "Radiobuttons" )
			{
				return CreateRadioButtonsPage();
			}
			
			if ( pageName == "Maximized button" )
			{
				return CreateBigButtonPage();
			}
			
			return CreateBigButtonPage();
		}
		
		public Panel CreateUserCreatedPage()
		{
			Panel panel = new Panel( this );
			
			new Кнопка( panel, -1, "Кнопка", Точка( 10, 10 ), Размер( -1, -1 ) );
			
			return panel;
		}
		
		public цел IconIndex()
		{
				if ( Images )
				{
					цел nImages = Images.ImageCount;
					if ( nImages > 0 )
					{
						return PageCount % nImages;
					}
				}
				return -1; 
		}
		
		private Panel CreateInsertPage()
		{
			Panel panel = new Panel( this );
			
			panel.ЦветЗП = new Цвет( "MAROON" );
			
			new StaticText( panel, -1, "This page has been inserted, not added.", Точка( 10, 10 ) );
			
			return panel;
		}
		
		private Panel CreateRadioButtonsPage()
		{
			Panel panel = new Panel( this );
			
			ткст[] animals = [ "Fox", "Hare", "Rabbit", "Sabre-toothed tiger", "Rex" ];
			
			RadioBox radiobox1 = new RadioBox( panel, -1, "Choose one", 
				wxDefaultPosition, wxDefaultSize, animals, 2, RadioBox.wxRA_SPECIFY_ROWS );
			
			ткст[] computers = [ "Amiga", "Commodore 64", "PET", "Another" ];
			
			RadioBox radiobox2 = new RadioBox( panel, -1, "Choose your favourite",
				wxDefaultPosition, wxDefaultSize, computers, 0, RadioBox.wxRA_SPECIFY_COLS );
			
			BoxSizer sizerPanel = new BoxSizer( Ориентация.wxVERTICAL );
			sizerPanel.Добавь( radiobox1, 2, Stretch.wxEXPAND );
			sizerPanel.Добавь( radiobox2, 1, Stretch.wxEXPAND );
			panel.sizer = sizerPanel;
			
			return panel;
		}
		
		private Panel CreateVetoPage()
		{
			Panel panel = new Panel( this );
			
			new StaticText( panel, -1, "This page intentionally left blank", Точка( 10, 10 ) );
			
			return panel;
		}
		
		private Panel CreateBigButtonPage()
		{
			Panel panel = new Panel( this );
			
			Кнопка buttonBig = new Кнопка( panel, -1, "Maximized button", Точка( 0, 0 ), Размер( 480, 360 ) );
			
			BoxSizer sizerPanel = new BoxSizer( Ориентация.wxVERTICAL );
			sizerPanel.Добавь( buttonBig, 1, Stretch.wxEXPAND );
			panel.sizer = sizerPanel;
			
			return panel;
		}
	}
	
	//---------------------------------------------------------------------

	public class NOTEBOOK : Прил
	{
		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame( "Notebook sample", Окно.wxDefaultPosition, Окно.wxDefaultSize );
			frame.Show( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			NOTEBOOK прил = new NOTEBOOK();
			прил.Пуск();
		}
	}


проц main()
{
	NOTEBOOK.Main();
}
