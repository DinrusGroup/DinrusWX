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

	public class XrcFrame : Frame
	{
		public this()
			{ this( null ); }
			
		public this( Окно родитель )			
		{
			XmlResource.Get().LoadFrame( this, родитель, "main_frame" );
			
			пиктограмма = new Пиктограмма( "./data/rc/appicon.ico" );
			
			menuBar = XmlResource.Get().LoadMenuBar( "main_menu" );
			
			toolBar = XmlResource.Get().LoadToolBar( this, "main_toolbar" );
			
			CreateStatusBar( 1 );
			
			EVT_MENU( XmlResource.XRCID( "exit_tool_or_menuэлт" ), & OnExitToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "non_derived_dialog_tool_or_menuэлт" ), & OnNonDerivedDialogToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "derived_tool_or_menuэлт" ), & OnDerivedDialogToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "controls_tool_or_menuэлт" ), & OnControlsToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "uncentered_tool_or_menuэлт" ), & OnUncenteredToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "custom_class_tool_or_menuэлт" ), & OnCustomClassToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "platform_property_tool_or_menuэлт" ), & OnPlatformPropertyToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "art_provider_tool_or_menuэлт" ), & OnArtProviderToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "variable_expansion_tool_or_menuэлт" ), & OnVariableExpansionToolOrMenuКоманда ) ;
			EVT_MENU( XmlResource.XRCID( "wxglade_dialog_menuэлт" ), & OnWxGladeMenu ) ;
			EVT_MENU( XmlResource.XRCID( "about_tool_or_menuэлт" ), & OnAboutToolOrMenuКоманда ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnExitToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Закрой(да);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnNonDerivedDialogToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog(this, "non_derived_dialog" ); 
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnDerivedDialogToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			PreferencesDialog preferencesDialog = new PreferencesDialog( this );
			
			preferencesDialog.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnWxGladeMenu( Объект отправитель, Событие e )
		{
		
			/*Dialog dlg = XmlResource.Get().LoadDialog(this, "wxglade_dialog" ); 
			
			dlg.ShowModal();*/
			
			wxGladeDialog wxgladeDialog = new wxGladeDialog( this );
			
			wxgladeDialog.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnControlsToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog(this, "controls_dialog" );
			
			//ListCtrl lc = (ListCtrl)dlg.НайдиОкно( XmlResource.XRCID( "controls_listctrl" ), typeof( ListCtrl) );
			
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
		
		public проц OnUncenteredToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog( this, "uncentered_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnCustomClassToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog( this, "custom_class_dialog" );
			
			MyResizableListCtrl a_myResizableListCtrl = new MyResizableListCtrl( dlg,
									-1,
									вхДефПоз,
									вхДефРазм,
									ListCtrl.wxLC_REPORT,
									null );
									
			XmlResource.Get().AttachUnknownControl( "custom_control_placeholder", a_myResizableListCtrl );
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnPlatformPropertyToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog( this, "platform_property_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnArtProviderToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog( this, "art_provider_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnVariableExpansionToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.Get().LoadDialog( this, "variable_expansion_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnAboutToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			ткст msg = "This is the about dialog of XML resources demo.\n" 
					"Ported to D by BERO";
			MessageBox( this, msg, "About XML resources demo", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class PreferencesDialog : Dialog
	{
		public this( Окно родитель )
		{
			XmlResource.Get().LoadDialog( this, родитель, "derived_dialog" );
		
			EVT_BUTTON( XmlResource.XRCID( "my_button" ), & OnMyButtonClicked ) ;
			EVT_UPDATE_UI( XmlResource.XRCID( "my_checkbox" ), & OuUpdateUIMyCheckbox ) ;
			EVT_BUTTON( wxID_OK, & OnOK ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnMyButtonClicked( Объект отправитель, Событие e )
		{
			MessageBox( this, "You cliecked on My Кнопка", "", Dialog.wxOK  | Dialog.wxICON_INFORMATION );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OuUpdateUIMyCheckbox( Объект отправитель, Событие e )
		{
			 бул myCheckBoxIsChecked = ( cast(CheckBox)XmlResource.XRCCTRL(  this, "my_checkbox", &CheckBox.Нов ) ).IsChecked;
			 
			 ( cast(TextCtrl)XmlResource.XRCCTRL( this, "my_textctrl", &TextCtrl.Нов ) ).Включи( myCheckBoxIsChecked );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnOK( Объект отправитель, Событие e )
		{
			MessageDialog md = new MessageDialog( this, "Press OK to close Derived dialog, or Cancel to abort",
					"Overriding base class OK button обработчик", Dialog.wxOK | Dialog.wxCANCEL | Dialog.wxCENTER );
					
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
	
		public this( Окно родитель, цел ид, Точка поз, Размер Размер, long стиль, Оценщик оценщик)
		{
			super( родитель, ид, поз, Размер, стиль, оценщик, "myResizableListCtrl" );
			InsertColumn( COL.RECORD_COLUMN, "Record", ListCtrl.wxLIST_FORMAT_LEFT, 140 );
			InsertColumn( COL.ACTION_COLUMN, "Action", ListCtrl.wxLIST_FORMAT_LEFT, 70 );
			InsertColumn( COL.PRIORITY_COLUMN, "Priority", ListCtrl.wxLIST_FORMAT_LEFT, 70 );
			
			EVT_RIGHT_DOWN( & ContextSensitiveMenu ) ;
			EVT_SIZE( & OnSize ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц ContextSensitiveMenu( Объект отправитель, Событие e )
		{
			MouseEvent me = cast(MouseEvent) e;
		
			Меню a_menu = new Меню();
			
			a_menu.Append( Cmd.PU_ADD_RECORD, "Добавь a new record" );
			a_menu.Append( Cmd.PU_EDIT_RECORD, "Edit selected record..." );
			a_menu.Append( Cmd.PU_DELETE_RECORD, "Delete selected record" );
			
			if ( SelectedItemCount == 0 )
			{
				a_menu.Включи( Cmd.PU_EDIT_RECORD, false );
				a_menu.Включи( Cmd.PU_DELETE_RECORD, false );
			}
			
			ВсплывающееМеню( a_menu, me.Позиция );
		}
		
		//---------------------------------------------------------------------	
		
		protected проц OnSize( Объект отправитель, Событие e )
		{
			УстColumnWidths();
			e.Skip();
		}
		
		//---------------------------------------------------------------------	
		
		public проц УстColumnWidths()
		{
			//цел leftmostColumnWidth = Размер.Ширь;
			цел leftmostColumnWidth = Ширь;
			
			leftmostColumnWidth -= GetColumnWidth( COL.ACTION_COLUMN );
			leftmostColumnWidth -= GetColumnWidth( COL.PRIORITY_COLUMN );
			leftmostColumnWidth -= SystemУстtings.GetMetric( SystemMetric.wxSYS_VSCROLL_X );
			leftmostColumnWidth -= 5;
			
			УстColumnWidth( COL.RECORD_COLUMN, leftmostColumnWidth );
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class wxGladeDialog : Dialog
	{
		public this( Окно родитель )
		{
			XmlResource.Get().LoadDialog( this, родитель, "wxglade_dialog" );
		
			EVT_BUTTON( wxID_OK, & OnOK ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnOK( Объект отправитель, Событие e)
		{
			Закрой();
		}
	}
	
	//---------------------------------------------------------------------	

	public class Xrcdemo : Апп
	{
		//---------------------------------------------------------------------

		public override бул ПоИниц()
		{
			Рисунок.InitAllHandlers();
			
			XmlResource.Get().InitAllHandlers();
			
			XmlResource.Get().Load( "./data/rc/меню.xrc" );
			
			XmlResource.Get().Load( "./data/rc/toolbar.xrc" );
			
			XmlResource.Get().Load( "./data/rc/basicdlg.xrc" );
			
			XmlResource.Get().Load( "./data/rc/derivdlg.xrc" );
			
			XmlResource.Get().Load( "./data/rc/controls.xrc" );
			
			XmlResource.Get().Load( "./data/rc/frame.xrc" );
			
			XmlResource.Get().Load( "./data/rc/uncenter.xrc" );    
			
			XmlResource.Get().Load( "./data/rc/custclas.xrc" );
			
			XmlResource.Get().Load( "./data/rc/artprov.xrc" );
			
			XmlResource.Get().Load( "./data/rc/platform.xrc" );
			
			XmlResource.Get().Load( "./data/rc/variable.xrc" );
			
			XmlResource.Get().Load( "./data/rc/wxglade.xrc" );
			
			XrcFrame frame = new XrcFrame();
			frame.Покажи(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			Xrcdemo app = new Xrcdemo();			
			app.Пуск();
		}

		//---------------------------------------------------------------------
	}

проц main()
{
	Xrcdemo.Main();
}
