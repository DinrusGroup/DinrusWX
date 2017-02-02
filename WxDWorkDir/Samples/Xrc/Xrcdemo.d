//-----------------------------------------------------------------------------
// wxD/Samples - Xrcdemo.d
//
// wxD "Xrcdemo" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Xrcdemo.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	public class XrcFrame : Фрейм
	{
		public this()
			{ this( пусто ); }
			
		public this( Окно родитель )			
		{
			XmlResource.Get().LoadFrame( this, родитель, "main_frame" );
			
			иконка = new Icon( "../Samples/Xrc/rc/appicon.ico" );
			
			menuBar = XmlResource.Get().LoadMenuBar( "main_menu" );
			
			toolBar = XmlResource.Get().LoadToolBar( this, "main_toolbar" );
			
			CreateStatusBar( 1 );
			
			EVT_MENU( XmlResource.XRCID( "exit_tool_or_menuitem" ), & OnExitToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "non_derived_dialog_tool_or_menuitem" ), & OnNonDerivedДиалогToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "derived_tool_or_menuitem" ), & OnDerivedДиалогToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "controls_tool_or_menuitem" ), & OnControlsToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "uncentered_tool_or_menuitem" ), & OnUncenteredToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "custom_class_tool_or_menuitem" ), & OnCustomClassToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "platform_property_tool_or_menuitem" ), & OnPlatformPropertyToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "art_provider_tool_or_menuitem" ), & OnArtProviderToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "variable_expansion_tool_or_menuitem" ), & OnVariableExpansionToolOrMenuCommand ) ;
			EVT_MENU( XmlResource.XRCID( "wxglade_dialog_menuitem" ), & OnWxGladeMenu ) ;
			EVT_MENU( XmlResource.XRCID( "about_tool_or_menuitem" ), & OnAboutToolOrMenuCommand ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnExitToolOrMenuCommand( Объект sender, Событие e )
		{
			Закрой(да);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnNonDerivedДиалогToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog(this, "non_derived_dialog" ); 
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnDerivedДиалогToolOrMenuCommand( Объект sender, Событие e )
		{
			PreferencesДиалог preferencesДиалог = new PreferencesДиалог( this );
			
			preferencesДиалог.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnWxGladeMenu( Объект sender, Событие e )
		{
		
			/*Диалог dlg = XmlResource.Get().LoadDialog(this, "wxglade_dialog" ); 
			
			dlg.ShowModal();*/
			
			wxGladeДиалог wxgladeДиалог = new wxGladeДиалог( this );
			
			wxgladeДиалог.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnControlsToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog(this, "controls_dialog" );
			
			//ListCtrl lc = (ListCtrl)dlg.FindWindow( XmlResource.XRCID( "controls_listctrl" ), typeof( ListCtrl) );
			
			ListCtrl lc = cast(ListCtrl)XmlResource.XRCCTRL( dlg, "controls_listctrl", &ListCtrl.Нов );
			
			lc.InsertColumn( 0, "Имя", ListCtrl.wxLIST_FORMAT_LEFT, 200);
			lc.InsertItem( 0, "Todd Hope" );
			lc.InsertItem( 1, "Kim Wynd" );
			lc.InsertItem( 2, "Leon Li" );
			
			TreeCtrl treectrl = cast(TreeCtrl)XmlResource.XRCCTRL(  dlg, "controls_treectrl", &TreeCtrl.Нов );
			
			treectrl.AddRoot( "Godfather" );
			
			treectrl.AppendItem( treectrl.RootItem, "Evil henchman 1" );
			treectrl.AppendItem( treectrl.RootItem, "Evil henchman 2" );
			treectrl.AppendItem( treectrl.RootItem, "Evil accountant" );
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnUncenteredToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog( this, "uncentered_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnCustomClassToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog( this, "custom_class_dialog" );
			
			MyResizableListCtrl a_myResizableListCtrl = new MyResizableListCtrl( dlg,
									-1,
									wxDefaultPosition,
									wxDefaultSize,
									ListCtrl.wxLC_REPORT,
									пусто );
									
			XmlResource.Get().AttachUnknownControl( "custom_control_placeholder", a_myResizableListCtrl );
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnPlatformPropertyToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog( this, "platform_property_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnArtProviderToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog( this, "art_provider_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnVariableExpansionToolOrMenuCommand( Объект sender, Событие e )
		{
			Диалог dlg = XmlResource.Get().LoadDialog( this, "variable_expansion_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnAboutToolOrMenuCommand( Объект sender, Событие e )
		{
			ткст msg = "This is the about dialog of XML resources demo.\n" 
					"Ported to D by BERO";
			MessageBox( this, msg, "About XML resources demo", Диалог.wxOK | Диалог.wxICON_INFORMATION );
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class PreferencesДиалог : Диалог
	{
		public this( Окно родитель )
		{
			XmlResource.Get().LoadDialog( this, родитель, "derived_dialog" );
		
			EVT_BUTTON( XmlResource.XRCID( "my_button" ), & OnMyButtonClicked ) ;
			EVT_UPDATE_UI( XmlResource.XRCID( "my_checkbox" ), & OuUpdateUIMyCheckbox ) ;
			EVT_BUTTON( wxID_OK, & OnOK ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnMyButtonClicked( Объект sender, Событие e )
		{
			MessageBox( this, "You cliecked on My Кнопка", "", Диалог.wxOK  | Диалог.wxICON_INFORMATION );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OuUpdateUIMyCheckbox( Объект sender, Событие e )
		{
			 бул myCheckBoxIsChecked = ( cast(CheckBox)XmlResource.XRCCTRL(  this, "my_checkbox", &CheckBox.Нов ) ).IsChecked;
			 
			 ( cast(TextCtrl)XmlResource.XRCCTRL( this, "my_textctrl", &TextCtrl.Нов ) ).Enable( myCheckBoxIsChecked );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnOK( Объект sender, Событие e )
		{
			MessageДиалог md = new MessageДиалог( this, "Press OK to close Derived dialog, or Cancel to abort",
					"Overriding base class OK button handler", Диалог.wxOK | Диалог.wxCANCEL | Диалог.wxCENTER );
					
			if ( md.ShowModal() == wxID_OK )
			{
				EndModal( wxID_OK );
			}
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class MyResizableListCtrl : ListCtrl
	{
		enum COL { RECORD_COLUMN = 0, ACTION_COLUMN, PRIORITY_COLUMN }
		
		enum Cmd { PU_ADD_RECORD, PU_EDIT_RECORD, PU_DELETE_RECORD }
		
		//---------------------------------------------------------------------	
	
		public this( Окно родитель, цел ид, Точка поз, Размер size, long стиль, Validator validator)
		{
			super( родитель, ид, поз, size, стиль, validator, "myResizableListCtrl" );
			InsertColumn( COL.RECORD_COLUMN, "Record", ListCtrl.wxLIST_FORMAT_LEFT, 140 );
			InsertColumn( COL.ACTION_COLUMN, "Action", ListCtrl.wxLIST_FORMAT_LEFT, 70 );
			InsertColumn( COL.PRIORITY_COLUMN, "Priority", ListCtrl.wxLIST_FORMAT_LEFT, 70 );
			
			EVT_RIGHT_DOWN( & ContextSensitiveMenu ) ;
			EVT_SIZE( & OnSize ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц ContextSensitiveMenu( Объект sender, Событие e )
		{
			MouseEvent me = cast(MouseEvent) e;
		
			Меню a_menu = new Меню();
			
			a_menu.Append( Cmd.PU_ADD_RECORD, "Добавь a new record" );
			a_menu.Append( Cmd.PU_EDIT_RECORD, "Edit selected record..." );
			a_menu.Append( Cmd.PU_DELETE_RECORD, "Delete selected record" );
			
			if ( SelectedItemCount == 0 )
			{
				a_menu.Enable( Cmd.PU_EDIT_RECORD, нет );
				a_menu.Enable( Cmd.PU_DELETE_RECORD, нет );
			}
			
			PopupMenu( a_menu, me.Положение );
		}
		
		//---------------------------------------------------------------------	
		
		protected проц OnSize( Объект sender, Событие e )
		{
			SetColumnWidths();
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------	
		
		public проц SetColumnWidths()
		{
			//цел leftmostColumnWidth = Размер.Ширина;
			цел leftmostColumnWidth = Ширина;
			
			leftmostColumnWidth -= GetColumnWidth( COL.ACTION_COLUMN );
			leftmostColumnWidth -= GetColumnWidth( COL.PRIORITY_COLUMN );
			leftmostColumnWidth -= SystemSettings.GetMetric( SystemMetric.wxSYS_VSCROLL_X );
			leftmostColumnWidth -= 5;
			
			SetColumnWidth( COL.RECORD_COLUMN, leftmostColumnWidth );
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class wxGladeДиалог : Диалог
	{
		public this( Окно родитель )
		{
			XmlResource.Get().LoadDialog( this, родитель, "wxglade_dialog" );
		
			EVT_BUTTON( wxID_OK, & OnOK ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnOK( Объект sender, Событие e)
		{
			Закрой();
		}
	}
	
	//---------------------------------------------------------------------	

	public class Xrcdemo : Прил
	{
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			Рисунок.ИницВсеОбработчики();
			
			XmlResource.Get().ИницВсеОбработчики();
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/меню.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/toolbar.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/basicdlg.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/derivdlg.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/controls.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/frame.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/uncenter.xrc" );    
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/custclas.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/artprov.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/platform.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/variable.xrc" );
			
			XmlResource.Get().Load( "../Samples/Xrc/rc/wxglade.xrc" );
			
			XrcFrame frame = new XrcFrame();
			frame.Show(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			Xrcdemo прил = new Xrcdemo();			
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}

проц main()
{
	Xrcdemo.Main();
}
