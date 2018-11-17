//-----------------------------------------------------------------------------
// wxD/Samples - ListCtrl.d
//
// A wxD version of the wxWidgets "listctrl" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ListCtrl.d,v 1.11 2008/04/24 07:22:14 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;

	public enum Cmd
	{
		LIST_ABOUT,
		LIST_QUIT,
		
		LIST_LIST_VIEW,
		LIST_ICON_VIEW,
		LIST_ICON_TEXT_VIEW,
		LIST_SMALL_ICON_VIEW,
		LIST_SMALL_ICON_TEXT_VIEW,
		LIST_REPORT_VIEW,
		LIST_VIRTUAL_VIEW,
		
		LIST_DESELECT_ALL,
		LIST_SELECT_ALL,
		LIST_DELETE_ALL,
		LIST_DELETE,
		LIST_ADD,
		LIST_EDIT,
		LIST_SORT,
		LIST_SET_FG_COL,
		LIST_SET_BG_COL,
		LIST_TOGGLE_MULTI_SEL,
		LIST_TOGGLE_FIRST,
		LIST_SHOW_COL_INFO,
		LIST_SHOW_SEL_INFO,
		LIST_FOCUS_LAST,
		LIST_FREEZE,
		LIST_THAW,
		LIST_TOGGLE_LINES,
		
		LIST_CTRL                   = 1000
	};
	
	//---------------------------------------------------------------------

	public class MyFrame : Frame
	{
		public ImageList m_imageListNormal;
		public ImageList m_imageListSmall;

		public TextCtrl m_logWindow;
		public MyListCtrl m_listCtrl;
		public Panel m_panel;
		
		public static цел NUM_ITEMS = 30;
		
		public static цел NUM_ICONS = 9;

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер Размер)
		{
			super(title, поз, Размер);
			// Уст the окно пиктограмма and status bar

			пиктограмма = new Пиктограмма("./data/mondrian.png");
			
			// Make an рисунок list containing large icons
			m_imageListNormal = new ImageList(32, 32, да);
			m_imageListSmall = new ImageList(16, 16, да);
			
			Битмап bmp = new Битмап( "./data/bitmaps/toolbrai.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/toolchar.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/tooldata.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/toolnote.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/tooltodo.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/toolchec.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/toolgame.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/tooltime.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "./data/bitmaps/toolword.xpm" );
			m_imageListNormal.Добавь( bmp );
			
			bmp = new Битмап( "./data/bitmaps/small1.xpm" );
			m_imageListSmall.Добавь( bmp );

			// Make a menubar
			Меню menuFile = new Меню();
			menuFile.Append(Cmd.LIST_ABOUT, _("&About"));
			menuFile.AppendSeparator();
			menuFile.Append(Cmd.LIST_QUIT, _("E&xit\tAlt-X"));

			Меню menuView = new Меню();
			menuView.Append(Cmd.LIST_LIST_VIEW, _("&List view\tF1"));
			menuView.Append(Cmd.LIST_REPORT_VIEW, _("&Report view\tF2"));
			menuView.Append(Cmd.LIST_ICON_VIEW, _("&Пиктограмма view\tF3"));
			menuView.Append(Cmd.LIST_ICON_TEXT_VIEW, _("Пиктограмма view with &текст\tF4"));
			menuView.Append(Cmd.LIST_SMALL_ICON_VIEW, _("&Small пиктограмма view\tF5"));
			menuView.Append(Cmd.LIST_SMALL_ICON_TEXT_VIEW, _("Small пиктограмма &view with текст\tF6"));
			menuView.Append(Cmd.LIST_VIRTUAL_VIEW, _("Virtual view\tF7"));

			Меню menuList = new Меню();
			menuList.Append(Cmd.LIST_FOCUS_LAST, _("&Make last элт current\tCtrl-L"));
			menuList.Append(Cmd.LIST_TOGGLE_FIRST, _("To&ggle first элт\tCtrl-G"));
			menuList.Append(Cmd.LIST_DESELECT_ALL, _("&Deselect All\tCtrl-D"));
			menuList.Append(Cmd.LIST_SELECT_ALL, _("S&elect All\tCtrl-A"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_SHOW_COL_INFO, _("Покажи &column info\tCtrl-C"));
			menuList.Append(Cmd.LIST_SHOW_SEL_INFO, _("Покажи &selected элтs\tCtrl-S"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_SORT, _("&Sort\tCtrl-S"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_ADD, _("&Append an элт\tCtrl-P"));
			menuList.Append(Cmd.LIST_EDIT, _("&Edit the элт\tCtrl-E"));
			menuList.Append(Cmd.LIST_DELETE, _("&Delete first элт\tCtrl-X"));
			menuList.Append(Cmd.LIST_DELETE_ALL, _("Delete &all элтs"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_FREEZE, _("Free&ze\tCtrl-Z"));
			menuList.Append(Cmd.LIST_THAW, _("Tha&w\tCtrl-W"));
			menuList.AppendSeparator();
			menuList.AppendCheckItem(Cmd.LIST_TOGGLE_LINES, _("Toggle &строки\tCtrl-I"));
			menuList.AppendCheckItem(Cmd.LIST_TOGGLE_MULTI_SEL, _("&Multiple selection\tCtrl-M"), _("Toggle multiple selection"));

			Меню menuCol = new Меню();
			menuCol.Append(Cmd.LIST_SET_FG_COL, _("&Foreground цвет..."));
			menuCol.Append(Cmd.LIST_SET_BG_COL, _("&Background цвет..."));

			MenuBar menubar = new MenuBar();
			menubar.Append(menuFile, _("&File"));
			menubar.Append(menuView, _("&View"));
			menubar.Append(menuList, _("&List"));
			menubar.Append(menuCol, _("&Цвет"));
			
			this.menuBar = menubar;

			m_panel = new Panel(this, wxID_ANY);
			m_logWindow = new TextCtrl(m_panel, wxID_ANY, "",
					вхДефПоз, вхДефРазм,
					TextCtrl.wxTE_MULTILINE | Окно.wxSUNKEN_BORDER);

			Log.УстActiveTarget(m_logWindow);

			RecreateList(ListCtrl.wxLC_REPORT | ListCtrl.wxLC_SINGLE_SEL);

			CreateStatusBar(3);
			
			EVT_SIZE(&OnSize);

			EVT_MENU(Cmd.LIST_QUIT, &OnQuit);
			EVT_MENU(Cmd.LIST_ABOUT, &OnAbout);
			EVT_MENU(Cmd.LIST_LIST_VIEW, &OnListView);
			EVT_MENU(Cmd.LIST_REPORT_VIEW, &OnReportView);
			EVT_MENU(Cmd.LIST_ICON_VIEW, &OnIconView);
			EVT_MENU(Cmd.LIST_ICON_TEXT_VIEW, &OnIconTextView);
			EVT_MENU(Cmd.LIST_SMALL_ICON_VIEW, &OnSmallIconView);
			EVT_MENU(Cmd.LIST_SMALL_ICON_TEXT_VIEW, &OnSmallIconTextView);
			EVT_MENU(Cmd.LIST_VIRTUAL_VIEW, &OnVirtualView);
			
			EVT_MENU(Cmd.LIST_FOCUS_LAST, &OnFocusLast);
			EVT_MENU(Cmd.LIST_TOGGLE_FIRST, &OnToggleFirstSel);
			EVT_MENU(Cmd.LIST_DESELECT_ALL, &OnDeselectAll);
			EVT_MENU(Cmd.LIST_SELECT_ALL, &OnSelectAll);
			EVT_MENU(Cmd.LIST_DELETE, &OnDelete);
			EVT_MENU(Cmd.LIST_ADD, &OnAdd);
			EVT_MENU(Cmd.LIST_EDIT, &OnEdit);
			EVT_MENU(Cmd.LIST_DELETE_ALL, &OnDeleteAll);
			EVT_MENU(Cmd.LIST_SORT, &OnSort);
			EVT_MENU(Cmd.LIST_SET_FG_COL, &OnУстFgColour);
			EVT_MENU(Cmd.LIST_SET_BG_COL, &OnУстBgColour);
			EVT_MENU(Cmd.LIST_TOGGLE_MULTI_SEL, &OnToggleMultiSel);
			EVT_MENU(Cmd.LIST_SHOW_COL_INFO, &OnShowColInfo);
			EVT_MENU(Cmd.LIST_SHOW_SEL_INFO, &OnShowSelInfo);
			EVT_MENU(Cmd.LIST_FREEZE, &OnFreeze);
			EVT_MENU(Cmd.LIST_THAW, &OnThaw);
			EVT_MENU(Cmd.LIST_TOGGLE_LINES, &OnToggleLines);
			
			EVT_UPDATE_UI(Cmd.LIST_SHOW_COL_INFO, &OnUpdateShowColInfo);
			EVT_UPDATE_UI(Cmd.LIST_TOGGLE_MULTI_SEL, &OnUpdateToggleMultiSel);
			
			Closing_Add(&OnClosing);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnClosing(Объект отправитель, Событие e)
		{
			Log.УстActiveTarget(null);
			e.Skip();
		}

		//---------------------------------------------------------------------	

		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( "List test sample\nJulian Smart (c) 1997\nPorted to wxD by BERO", "About",
				Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}

		//---------------------------------------------------------------------	

		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnSize( Объект отправитель, Событие e )
		{
			DoSize();

			e.Skip();
		}
		
		//---------------------------------------------------------------------	

		public проц DoSize()
		{
			if ( !m_logWindow ) return;

			Размер Размер = РазмерКлиента;
			цел y = (2*Размер.Высь)/3;
			m_listCtrl.УстРазм(0, 0, Размер.Ширь, y);
			m_logWindow.УстРазм(0, y + 1, Размер.Ширь, Размер.Высь - y);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnFreeze( Объект отправитель, Событие e )
		{
			Log.LogMessage(_("Freezing the control"));

			m_listCtrl.Заморозь();
		}

		//---------------------------------------------------------------------	

		public проц OnThaw( Объект отправитель, Событие e )
		{
			Log.LogMessage(_("Thawing the control"));

			m_listCtrl.Оттай();
		}

		//---------------------------------------------------------------------	

		public проц OnToggleLines( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда)e;
		
			m_listCtrl.УстSingleStyle(ListCtrl.wxLC_HRULES | ListCtrl.wxLC_VRULES, ce.IsChecked);
		}

		//---------------------------------------------------------------------	

		public проц OnFocusLast( Объект отправитель, Событие e )
		{
			long index = m_listCtrl.ItemCount - 1;
			if ( index == -1 )
			{
				return;
			}

			m_listCtrl.УстItemState(index, ListCtrl.wxLIST_STATE_FOCUSED, ListCtrl.wxLIST_STATE_FOCUSED);
			m_listCtrl.EnsureVisible(index);
		}

		//---------------------------------------------------------------------	

		public проц OnToggleFirstSel( Объект отправитель, Событие e )
		{
			m_listCtrl.УстItemState(0, (~m_listCtrl.GetItemState(0, ListCtrl.wxLIST_STATE_SELECTED) ) & ListCtrl.wxLIST_STATE_SELECTED, ListCtrl.wxLIST_STATE_SELECTED);
		}

		//---------------------------------------------------------------------	

		public проц OnDeselectAll( Объект отправитель, Событие e )
		{
			if ( !CheckNonVirtual() )
				return;

			цел n = m_listCtrl.ItemCount;
			for (цел i = 0; i < n; i++)
				m_listCtrl.УстItemState(i,0,ListCtrl.wxLIST_STATE_SELECTED);
		}

		//---------------------------------------------------------------------	

		public проц OnSelectAll( Объект отправитель, Событие e )
		{
			if ( !CheckNonVirtual() )
				return;

			цел n = m_listCtrl.ItemCount;
			for (цел i = 0; i < n; i++)
				m_listCtrl.УстItemState(i,ListCtrl.wxLIST_STATE_SELECTED, ListCtrl.wxLIST_STATE_SELECTED);
		}

		//---------------------------------------------------------------------	

		public бул CheckNonVirtual()
		{
			if ( !m_listCtrl.ЕстьФлаг(ListCtrl.wxLC_VIRTUAL) )
				return да;

			Log.LogWarning("Can't do this in virtual view, sorry.");

			return false;
		}
		
		//---------------------------------------------------------------------	
		
		public проц RecreateList(long флаги)
		{
			RecreateList(флаги, да);
		}
		
		public проц RecreateList(long флаги, бул withText)
		{
			//delete m_listCtrl;

			m_listCtrl = new MyListCtrl(m_panel, Cmd.LIST_CTRL,
					вхДефПоз, вхДефРазм,
					флаги |
					wxSUNKEN_BORDER | ListCtrl.wxLC_EDIT_LABELS);

			switch ( флаги & ListCtrl.wxLC_MASK_TYPE )
			{
				case ListCtrl.wxLC_LIST:
					InitWithListItems();
				break;

				case ListCtrl.wxLC_ICON:
					InitWithIconItems(withText);
				break;

				case ListCtrl.wxLC_SMALL_ICON:
					InitWithIconItems(withText, да);
				break;

				case ListCtrl.wxLC_REPORT:
					if ( (флаги & ListCtrl.wxLC_VIRTUAL) > 0 )
						InitWithVirtualItems();
					else
						InitWithReportItems();
				break;

				default:
					пишифнс("unknown listctrl mode");
				break;
			}

			DoSize();

			m_logWindow.Clear();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnListView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_LIST);
		}
		
		//---------------------------------------------------------------------	

		public проц InitWithListItems()
		{
			for ( цел i = 0; i < NUM_ITEMS; i++ )
			{
				m_listCtrl.InsertItem(i, "Элемент " ~ .вТкст(i));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnReportView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_REPORT);
		}
		
		//---------------------------------------------------------------------	

		public проц InitWithReportItems()
		{
			m_listCtrl.УстImageList(m_imageListSmall, wxIMAGE_LIST_SMALL);

			ListItem элтCol = new ListItem();
			элтCol.Text = "Column 1";
			элтCol.Рисунок = -1;
			m_listCtrl.InsertColumn(0, элтCol);
			
			элтCol.Text = "Column 2";
			элтCol.Align = ListCtrl.wxLIST_FORMAT_CENTRE;
			m_listCtrl.InsertColumn(1, элтCol);
			
			элтCol.Text = "Column 3";
			элтCol.Align = ListCtrl.wxLIST_FORMAT_RIGHT;
			m_listCtrl.InsertColumn(2, элтCol);
			
			m_listCtrl.Спрячь();
			
			for ( цел i = 0; i < NUM_ITEMS; i++ )
			{
				m_listCtrl.InsertItemInReportView(i);
			}
			
			m_logWindow.WriteText(.вТкст(NUM_ITEMS) ~ " элтs inserted");
			m_listCtrl.Покажи();
			
			ListItem элт = new ListItem();
			элт.Ид = 0;
			элт.ЦветТекста = Цвет.wxRED;
			m_listCtrl.УстItem( элт );
			
			элт.Ид = 2;
			элт.ЦветТекста = Цвет.wxGREEN;
			m_listCtrl.УстItem( элт );
			элт.Ид = 4;
			элт.ЦветТекста = Цвет.wxLIGHT_GREY;
			элт.шрифт = Шрифт.wxITALIC_FONT;
			элт.ЦветФона = Цвет.wxRED;
			m_listCtrl.УстItem( элт );
			
			m_listCtrl.ЦветТекста = Цвет.wxBLUE;
			m_listCtrl.ЦветФона = Цвет.wxLIGHT_GREY;
			
			m_listCtrl.УстColumnWidth( 0, ListCtrl.wxLIST_AUTOSIZE );
			m_listCtrl.УстColumnWidth( 1, ListCtrl.wxLIST_AUTOSIZE );
			m_listCtrl.УстColumnWidth( 2, ListCtrl.wxLIST_AUTOSIZE );
		}
		
		//---------------------------------------------------------------------	
		
		public проц InitWithIconItems(бул withText)
		{
			InitWithIconItems(withText, false);
		}

		public проц InitWithIconItems(бул withText, бул sameIcon)
		{
			m_listCtrl.УстImageList(m_imageListNormal, wxIMAGE_LIST_NORMAL);
			m_listCtrl.УстImageList(m_imageListSmall, wxIMAGE_LIST_SMALL);

			for ( цел i = 0; i < NUM_ICONS; i++ )
			{
				цел рисунок = sameIcon ? 0 : i;

				if ( withText )
				{
					m_listCtrl.InsertItem(i, "Ярлык " ~ .вТкст(i), рисунок);
				}
				else
				{
					m_listCtrl.InsertItem(i, рисунок);
				}
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnIconView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_ICON, false);
		}
		
		//---------------------------------------------------------------------	

		public проц OnIconTextView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_ICON);
		}
		
		//---------------------------------------------------------------------	

		public проц OnSmallIconView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_SMALL_ICON, false);
		}
		
		//---------------------------------------------------------------------	

		public проц OnSmallIconTextView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_SMALL_ICON);
		}
		
		//---------------------------------------------------------------------	

		public проц OnVirtualView(Объект отправитель, Событие e)
		{
			RecreateList(ListCtrl.wxLC_REPORT | ListCtrl.wxLC_VIRTUAL);
		}
		
		//---------------------------------------------------------------------	

		public проц InitWithVirtualItems()
		{
			m_listCtrl.УстImageList(m_imageListSmall, wxIMAGE_LIST_SMALL);

			m_listCtrl.InsertColumn(0, _("First Column"));
			m_listCtrl.InsertColumn(1, _("Second Column"));
			m_listCtrl.УстColumnWidth(0, 150);
			m_listCtrl.УстColumnWidth(1, 150);

			m_listCtrl.ItemCount = 1000000;
		}
		
		//---------------------------------------------------------------------	
		
		public static extern(C) цел MyCompareFunction(цел элт1, цел элт2, цел sortData)
		{
			// inverse the order
			if (элт1 < элт2)
				return -1;
			if (элт1 > элт2)
				return 1;

			return 0;
		}
		
		//---------------------------------------------------------------------	

		public проц OnSort(Объект отправитель, Событие e)
		{
			m_listCtrl.SortItems(&MyCompareFunction,0);
 
			m_logWindow.WriteText("Sorting " ~ .вТкст(m_listCtrl.ItemCount) ~ " элтs");
		}
		
		//---------------------------------------------------------------------	

		public проц OnShowSelInfo(Объект отправитель, Событие e)
		{
			цел selCount = m_listCtrl.SelectedItemCount;
			Log.LogMessage(.вТкст(selCount) ~" элтs selected:");

			цел shownCount = 0;

			цел элт = m_listCtrl.GetNextItem(-1, ListCtrl.wxLIST_NEXT_ALL,
						ListCtrl.wxLIST_STATE_SELECTED);
			while ( элт != -1 )
			{
				Log.LogMessage("\t" ~ .вТкст(элт) ~ "d (" ~ m_listCtrl.GetItemText(элт) ~ ")");

				if ( ++shownCount > 10 )
				{
					Log.LogMessage(_("\t... more selected элтs snipped..."));
					break;
				}

				элт = m_listCtrl.GetNextItem(элт, ListCtrl.wxLIST_NEXT_ALL,
					ListCtrl.wxLIST_STATE_SELECTED);
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnShowColInfo(Объект отправитель, Событие e)
		{
			цел count = m_listCtrl.ColumnCount;
			Log.LogMessage(.вТкст(count) ~ " columns:");
			for ( цел c = 0; c < count; c++ )
			{
				Log.LogMessage("\tcolumn " ~ .вТкст(c) ~ " has ширь " ~ .вТкст(m_listCtrl.GetColumnWidth(c)));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnUpdateShowColInfo(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
		
			ue.Активен =(m_listCtrl.ФлагиСтиля & ListCtrl.wxLC_REPORT) != 0;
		}
		
		//---------------------------------------------------------------------	

		public проц OnToggleMultiSel(Объект отправитель, Событие e)
		{
			long флаги = m_listCtrl.ФлагиСтиля;
			if ( (флаги & ListCtrl.wxLC_SINGLE_SEL) > 0 )
				флаги &= ~ListCtrl.wxLC_SINGLE_SEL;
			else
				флаги |= ListCtrl.wxLC_SINGLE_SEL;

			m_logWindow.WriteText("Current selection mode: " ~ 
				( ( (флаги & ListCtrl.wxLC_SINGLE_SEL) > 0 ) ? "sing" : "multip" ) ~ "le\n");

			RecreateList(флаги);
		}
		
		//---------------------------------------------------------------------	

		public проц OnUpdateToggleMultiSel(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			
			ue.Check = (m_listCtrl.ФлагиСтиля & ListCtrl.wxLC_SINGLE_SEL) == 0;
		}
		
		//---------------------------------------------------------------------	

		public проц OnУстFgColour(Объект отправитель, Событие e)
		{
			m_listCtrl.ЦветПП = GetColourFromUser(this);
			m_listCtrl.Освежи();
		}
		
		//---------------------------------------------------------------------	

		public проц OnУстBgColour(Объект отправитель, Событие e)
		{
			m_listCtrl.ЦветФона = GetColourFromUser(this);
			m_listCtrl.Освежи();
		}
		
		//---------------------------------------------------------------------	

		public проц OnAdd(Объект отправитель, Событие e)
		{
			m_listCtrl.InsertItem(m_listCtrl.ItemCount, _("Appended элт"));
		}
		
		//---------------------------------------------------------------------	

		public проц OnEdit(Объект отправитель, Событие e)
		{
			цел элтCur = m_listCtrl.GetNextItem(-1, ListCtrl.wxLIST_NEXT_ALL,
						ListCtrl.wxLIST_STATE_FOCUSED);

			if ( элтCur != -1 )
			{
				m_listCtrl.EditLabel(элтCur);
			}
			else
			{
				m_logWindow.WriteText(_("No элт to edit"));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnDelete(Объект отправитель, Событие e)
		{
			if ( m_listCtrl.ItemCount > 0 )
			{
				m_listCtrl.DeleteItem(0);
			}
			else
			{
				m_logWindow.WriteText(_("Nothing to delete"));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeleteAll(Объект отправитель, Событие e)
		{

			m_listCtrl.DeleteAllItems();

			m_logWindow.WriteText("Deleted " ~ .вТкст(m_listCtrl.ItemCount) ~ " элтs\n");
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class MyListCtrl : ListCtrl
	{
		private ListItemAttr m_attr;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель, цел ид, Точка поз, Размер Размер, long стиль )
		{
			super( родитель, ид, поз, Размер, стиль );
			EVT_LIST_BEGIN_DRAG(Cmd.LIST_CTRL, &OnBeginDrag);
			EVT_LIST_BEGIN_RDRAG(Cmd.LIST_CTRL, &OnBeginRDrag);
			EVT_LIST_BEGIN_LABEL_EDIT(Cmd.LIST_CTRL, &OnBeginLabelEdit);
			EVT_LIST_END_LABEL_EDIT(Cmd.LIST_CTRL, &OnEndLabelEdit);
			EVT_LIST_DELETE_ITEM(Cmd.LIST_CTRL, &OnDeleteItem);
			EVT_LIST_DELETE_ALL_ITEMS(Cmd.LIST_CTRL, &OnDeleteAllItems);
			EVT_LIST_ITEM_SELECTED(Cmd.LIST_CTRL, &OnSelected);
			EVT_LIST_ITEM_DESELECTED(Cmd.LIST_CTRL, &OnDeselected);
			EVT_LIST_KEY_DOWN(Cmd.LIST_CTRL, &OnListKeyDown);
			EVT_LIST_ITEM_ACTIVATED(Cmd.LIST_CTRL, &OnActivated);
			EVT_LIST_ITEM_FOCUSED(Cmd.LIST_CTRL, &OnFocused);
			
			EVT_LIST_COL_CLICK(Cmd.LIST_CTRL, &OnColClick);
			EVT_LIST_COL_RIGHT_CLICK(Cmd.LIST_CTRL, &OnColRightClick);
			EVT_LIST_COL_BEGIN_DRAG(Cmd.LIST_CTRL, &OnColBeginDrag);
			EVT_LIST_COL_DRAGGING(Cmd.LIST_CTRL, &OnColDragging);
			EVT_LIST_COL_END_DRAG(Cmd.LIST_CTRL, &OnColEndDrag);
			
			EVT_LIST_CACHE_HINT(Cmd.LIST_CTRL, &OnCacheHint);
			
			EVT_CHAR(&OnChar);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnCacheHint(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "OnCacheHint: cache элтs " ~ .вТкст(le.CacheFrom) ~ ".." ~ .вТкст(le.CacheTo) );
		}
		
		//---------------------------------------------------------------------	

		public проц УстColumnImage(цел col, цел рисунок)
		{
			ListItem элт = new ListItem();
			элт.Маска = ListCtrl.wxLIST_MASK_IMAGE;
			элт.Рисунок = рисунок;
			УстColumn(col, элт);
		}
		
		//---------------------------------------------------------------------	

		public проц OnColClick(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
			
			цел col = le.Column;
			УстColumnImage(col, 0);

			Log.LogMessage( "OnColumnClick at " ~ .вТкст(col) ~ "." );
		}
		
		//---------------------------------------------------------------------	

		public проц OnColRightClick(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			цел col = le.Column;
			if ( col != -1 )
			{
				УстColumnImage(col, -1);
			}

			Меню меню = new Меню("Test");
			меню.Append(Cmd.LIST_ABOUT, _("&About"));
			ВсплывающееМеню(меню, le.Точка); 

			Log.LogMessage( "OnColumnRightClick at " ~ .вТкст(le.Column) ~ "." );
		}
		
		//---------------------------------------------------------------------	

		public проц LogColEvent(Объект отправитель, Событие e, ткст имя)
		{
			ListEvent le = cast(ListEvent)e;
		
			цел col = le.Column;
			
			ткст msg = имя ~ ": column ";
			msg ~= .вТкст(col) ~ "(ширь = ";
			msg ~= .вТкст(le.Элемент.Ширь) ~ " or ";
			msg ~= .вТкст(GetColumnWidth(col)) ~ ".";

			Log.LogMessage( msg );
		}
		
		//---------------------------------------------------------------------	

		public проц OnColBeginDrag(Объект отправитель, Событие e)
		{
			LogColEvent( отправитель, e, "OnColBeginDrag" );
			
			ListEvent le = cast(ListEvent)e;

			if ( le.Column == 0 )
			{
				Log.LogMessage("Resizing this column shouldn't work.");

				le.Veto();
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnColDragging(Объект отправитель, Событие e)
		{
			LogColEvent( отправитель, e, "OnColDragging" );
		}
		
		//---------------------------------------------------------------------	

		public проц OnColEndDrag(Объект отправитель, Событие e)
		{
			LogColEvent( отправитель, e, "OnColEndDrag" );
		}
		
		//---------------------------------------------------------------------	

		public проц OnBeginDrag(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			Точка тчк = le.Точка;

			цел флаги = 0;
			Log.LogMessage( "OnBeginDrag at (" ~ .вТкст(тчк.X) ~ ", " ~ .вТкст(тчк.Y) ~ "), элт " ~ .вТкст(ТестНажатия(тчк, флаги)) ~ ".");
		}
		
		//---------------------------------------------------------------------	

		public проц OnBeginRDrag(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			Log.LogMessage( "OnBeginRDrag at " ~ .вТкст(le.Точка.X) ~ "," ~ .вТкст(le.Точка.Y) ~ ".");
		}
		
		//---------------------------------------------------------------------	

		public проц OnBeginLabelEdit(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
				
			Log.LogMessage( "OnBeginLabelEdit: " ~ le.Элемент.Text);
		}
		
		//---------------------------------------------------------------------	

		public проц OnEndLabelEdit(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			Log.LogMessage( "OnEndLabelEdit: " ~
				(le.EditCancelled ? "[cancelled]" : le.Элемент.Text) );
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeleteItem(Объект отправитель, Событие e)
		{
			LogEvent(отправитель, e, "OnDeleteItem");
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeleteAllItems(Объект отправитель, Событие e)
		{
			LogEvent(отправитель, e, "OnDeleteAllItems");
		}
	
		//---------------------------------------------------------------------	

		public проц OnSelected(Объект отправитель, Событие e)
		{
			LogEvent(отправитель, e, "OnSelected");
			
			ListEvent le = cast(ListEvent)e;

			if ( (ФлагиСтиля & ListCtrl.wxLC_REPORT) > 0 )
			{
				ListItem info = new ListItem();
				info.Ид = le.Index;
				info.Column = 1;
				info.Маска = ListCtrl.wxLIST_MASK_TEXT;
				if ( GetItem(info) )
				{
					Log.LogMessage("Value of the 2nd field of the selected элт: " ~
						info.Text);
				}
				else
				{
					пишифнс("wxListCtrl::GetItem() failed");
				}
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeselected(Объект отправитель, Событие e)
		{
			LogEvent(отправитель, e, "OnDeselected");
		}
		
		//---------------------------------------------------------------------	

		public проц OnActivated(Объект отправитель, Событие e)
		{
			LogEvent(отправитель, e, "OnActivated");
		}
		
		//---------------------------------------------------------------------	

		public проц OnFocused(Объект отправитель, Событие e)
		{
			LogEvent(отправитель, e, "OnFocused");

			e.Skip();
		}
		
		//---------------------------------------------------------------------	

		public проц OnListKeyDown(Объект отправитель, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			switch ( le.КодКл )
			{
				case 'c': // colorize
				case 'C':
				{
					ListItem info = new ListItem();
					info.Ид = le.Index;
					GetItem(info);

					ListItemAttr attr = info.Attributes;
					if ( !attr || !attr.ЕстьЦветТекста )
					{
						info.ЦветТекста = Цвет.wxCYAN;

						УстItem(info);

						RefreshItem(info.Ид);
					}
				}
				break;

				case 'n': // next
				case 'N':
				{
					цел элт = GetNextItem(-1,
						ListCtrl.wxLIST_NEXT_ALL, ListCtrl.wxLIST_STATE_FOCUSED);
					if ( элт++ == ItemCount - 1 )
					{
						элт = 0;
					}

					Log.LogMessage("Focusing элт " ~ .вТкст(элт));

					УстItemState(элт, ListCtrl.wxLIST_STATE_FOCUSED, ListCtrl.wxLIST_STATE_FOCUSED);
					EnsureVisible(элт);
				}
				break;

				case КодКл.WXK_DELETE:
				{
					цел элт = GetNextItem(-1,
						ListCtrl.wxLIST_NEXT_ALL, ListCtrl.wxLIST_STATE_SELECTED);
					while ( элт != -1 )
					{
						DeleteItem(элт);

						Log.LogMessage("Элемент " ~ .вТкст(элт) ~ " deleted");

						// -1 because the indices were shifted by DeleteItem()
						элт = GetNextItem(элт - 1,
							ListCtrl.wxLIST_NEXT_ALL, ListCtrl.wxLIST_STATE_SELECTED);
					}
				}
				break;

				case КодКл.WXK_INSERT:
					if ( (ФлагиСтиля & ListCtrl.wxLC_REPORT) > 0 )
					{
						if ( (ФлагиСтиля & ListCtrl.wxLC_VIRTUAL) > 0 )
						{
							ItemCount = ItemCount + 1;
						}
						else // !virtual
						{
							InsertItemInReportView(le.Index);
						}
					}
					//else: fall through
				break; //???

				default:
					LogEvent(отправитель, e, "OnListKeyDown");

					le.Skip();
				break;
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnChar(Объект отправитель, Событие e)
		{
			KeyEvent ke = cast(KeyEvent)e;
		
			Log.LogMessage("Got char event.");
	
			switch ( ke.КодКл )
			{
				case 'n':
				case 'N':
				case 'c':
				case 'C':
				// these are the keys we process ourselves
				break;

				default:
					e.Skip();
				break;
			}
		}
	
		//---------------------------------------------------------------------	

		public проц LogEvent(Объект отправитель, Событие e, ткст eventName)
		{
			ListEvent le = cast(ListEvent)e;
		
			Log.LogMessage("Элемент " ~ .вТкст(le.Index) ~ ": " ~ eventName ~ " (элт текст = " ~ le.Text ~
				 ", data = " ~ .вТкст(le.Data) ~ ")");
		}
		
		//---------------------------------------------------------------------	

		public ткст OnGetItemText(long элт, long column)
		{
			ткст s = "Column " ~ .вТкст(column) ~ " of элт " ~ .вТкст(элт);
			return s;
		}
		
		//---------------------------------------------------------------------	

		public цел OnGetItemImage(long элт)
		{
			return 0;
		}
		
		//---------------------------------------------------------------------	

		public ListItemAttr OnGetItemAttr(long элт)
		{
			return (элт % 2) > 0 ? null : m_attr;
		}
		
		//---------------------------------------------------------------------	
		
		public проц InsertItemInReportView(цел i)
		{
			ткст buf = "This is элт " ~ .вТкст(i);
			цел tmp = InsertItem(i, buf, 0);
			УстItemData(tmp, i);

			buf = "Col 1, элт " ~ .вТкст(i);
			УстItem(i, 1, buf);

			buf = "Элемент " ~ .вТкст(i) ~ " in column 2";
			УстItem(i, 2, buf);
		}
	}
	
	//---------------------------------------------------------------------	

	public class ListCtrlApp : Апп
	{
		public override бул ПоИниц()
		{
			MyFrame frame = new MyFrame("ListCtrl Test", Точка(50, 50), Размер(450,340));
			frame.Покажи(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			ListCtrlApp app = new ListCtrlApp();
			app.Пуск();
		}
	}


проц main()
{
	ListCtrlApp.Main();
}
