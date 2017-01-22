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
private import std.stdio;
private import std.ткст;

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

		public this(ткст title, Точка поз, Размер size)
		{
			super(title, поз, size);
			// Установи the окно иконка and status bar

			иконка = new Icon("../Samples/ListCtrl/mondrian.png");
			
			// Make an рисунок list containing large icons
			m_imageListNormal = new ImageList(32, 32, да);
			m_imageListSmall = new ImageList(16, 16, да);
			
			Битмап bmp = new Битмап( "../Samples/ListCtrl/bitmaps/toolbrai.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/toolchar.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/tooldata.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/toolnote.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/tooltodo.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/toolchec.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/toolgame.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/tooltime.xpm" );
			m_imageListNormal.Добавь( bmp );
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/toolword.xpm" );
			m_imageListNormal.Добавь( bmp );
			
			bmp = new Битмап( "../Samples/ListCtrl/bitmaps/small1.xpm" );
			m_imageListSmall.Добавь( bmp );

			// Make a menubar
			Меню menuFile = new Меню();
			menuFile.Append(Cmd.LIST_ABOUT, _("&About"));
			menuFile.AppendSeparator();
			menuFile.Append(Cmd.LIST_QUIT, _("E&xit\tAlt-X"));

			Меню menuView = new Меню();
			menuView.Append(Cmd.LIST_LIST_VIEW, _("&List view\tF1"));
			menuView.Append(Cmd.LIST_REPORT_VIEW, _("&Report view\tF2"));
			menuView.Append(Cmd.LIST_ICON_VIEW, _("&Icon view\tF3"));
			menuView.Append(Cmd.LIST_ICON_TEXT_VIEW, _("Icon view with &текст\tF4"));
			menuView.Append(Cmd.LIST_SMALL_ICON_VIEW, _("&Small иконка view\tF5"));
			menuView.Append(Cmd.LIST_SMALL_ICON_TEXT_VIEW, _("Small иконка &view with текст\tF6"));
			menuView.Append(Cmd.LIST_VIRTUAL_VIEW, _("Virtual view\tF7"));

			Меню menuList = new Меню();
			menuList.Append(Cmd.LIST_FOCUS_LAST, _("&Make last элемент current\tCtrl-L"));
			menuList.Append(Cmd.LIST_TOGGLE_FIRST, _("To&ggle first элемент\tCtrl-G"));
			menuList.Append(Cmd.LIST_DESELECT_ALL, _("&Deselect All\tCtrl-D"));
			menuList.Append(Cmd.LIST_SELECT_ALL, _("S&elect All\tCtrl-A"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_SHOW_COL_INFO, _("Show &column info\tCtrl-C"));
			menuList.Append(Cmd.LIST_SHOW_SEL_INFO, _("Show &selected items\tCtrl-S"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_SORT, _("&Sort\tCtrl-S"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_ADD, _("&Append an элемент\tCtrl-P"));
			menuList.Append(Cmd.LIST_EDIT, _("&Edit the элемент\tCtrl-E"));
			menuList.Append(Cmd.LIST_DELETE, _("&Delete first элемент\tCtrl-X"));
			menuList.Append(Cmd.LIST_DELETE_ALL, _("Delete &all items"));
			menuList.AppendSeparator();
			menuList.Append(Cmd.LIST_FREEZE, _("Free&ze\tCtrl-Z"));
			menuList.Append(Cmd.LIST_THAW, _("Tha&w\tCtrl-W"));
			menuList.AppendSeparator();
			menuList.AppendCheckItem(Cmd.LIST_TOGGLE_LINES, _("Toggle &lines\tCtrl-I"));
			menuList.AppendCheckItem(Cmd.LIST_TOGGLE_MULTI_SEL, _("&Multiple selection\tCtrl-M"), _("Toggle multiple selection"));

			Меню menuCol = new Меню();
			menuCol.Append(Cmd.LIST_SET_FG_COL, _("&Foreground colour..."));
			menuCol.Append(Cmd.LIST_SET_BG_COL, _("&Фон colour..."));

			MenuBar menubar = new MenuBar();
			menubar.Append(menuFile, _("&File"));
			menubar.Append(menuView, _("&View"));
			menubar.Append(menuList, _("&List"));
			menubar.Append(menuCol, _("&Цвет"));
			
			this.menuBar = menubar;

			m_panel = new Panel(this, wxID_ANY);
			m_logWindow = new TextCtrl(m_panel, wxID_ANY, "",
					wxDefaultPosition, wxDefaultSize,
					TextCtrl.wxTE_MULTILINE | Окно.wxSUNKEN_BORDER);

			Log.SetActiveTarget(m_logWindow);

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
			EVT_MENU(Cmd.LIST_SET_FG_COL, &OnSetFgColour);
			EVT_MENU(Cmd.LIST_SET_BG_COL, &OnSetBgColour);
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
		
		public проц OnClosing(Объект sender, Событие e)
		{
			Log.SetActiveTarget(пусто);
			e.Пропусти();
		}

		//---------------------------------------------------------------------	

		public проц OnAbout( Объект sender, Событие e )
		{
			MessageBox( "List test sample\nJulian Smart (c) 1997\nPorted to wxD by BERO", "About",
				Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}

		//---------------------------------------------------------------------	

		public проц OnQuit( Объект sender, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnSize( Объект sender, Событие e )
		{
			DoSize();

			e.Пропусти();
		}
		
		//---------------------------------------------------------------------	

		public проц DoSize()
		{
			if ( !m_logWindow ) return;

			Размер size = ClientSize;
			цел y = (2*size.Высота)/3;
			m_listCtrl.УстРазм(0, 0, size.Ширина, y);
			m_logWindow.УстРазм(0, y + 1, size.Ширина, size.Высота - y);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnFreeze( Объект sender, Событие e )
		{
			Log.LogMessage(_("Freezing the control"));

			m_listCtrl.Freeze();
		}

		//---------------------------------------------------------------------	

		public проц OnThaw( Объект sender, Событие e )
		{
			Log.LogMessage(_("Thawing the control"));

			m_listCtrl.Thaw();
		}

		//---------------------------------------------------------------------	

		public проц OnToggleLines( Объект sender, Событие e )
		{
			CommandEvent ce = cast(CommandEvent)e;
		
			m_listCtrl.SetSingleStyle(ListCtrl.wxLC_HRULES | ListCtrl.wxLC_VRULES, ce.IsChecked);
		}

		//---------------------------------------------------------------------	

		public проц OnFocusLast( Объект sender, Событие e )
		{
			long индекс = m_listCtrl.ItemCount - 1;
			if ( индекс == -1 )
			{
				return;
			}

			m_listCtrl.SetItemState(индекс, ListCtrl.wxLIST_STATE_FOCUSED, ListCtrl.wxLIST_STATE_FOCUSED);
			m_listCtrl.EnsureVisible(индекс);
		}

		//---------------------------------------------------------------------	

		public проц OnToggleFirstSel( Объект sender, Событие e )
		{
			m_listCtrl.SetItemState(0, (~m_listCtrl.GetItemState(0, ListCtrl.wxLIST_STATE_SELECTED) ) & ListCtrl.wxLIST_STATE_SELECTED, ListCtrl.wxLIST_STATE_SELECTED);
		}

		//---------------------------------------------------------------------	

		public проц OnDeselectAll( Объект sender, Событие e )
		{
			if ( !CheckNonVirtual() )
				return;

			цел n = m_listCtrl.ItemCount;
			for (цел i = 0; i < n; i++)
				m_listCtrl.SetItemState(i,0,ListCtrl.wxLIST_STATE_SELECTED);
		}

		//---------------------------------------------------------------------	

		public проц OnSelectAll( Объект sender, Событие e )
		{
			if ( !CheckNonVirtual() )
				return;

			цел n = m_listCtrl.ItemCount;
			for (цел i = 0; i < n; i++)
				m_listCtrl.SetItemState(i,ListCtrl.wxLIST_STATE_SELECTED, ListCtrl.wxLIST_STATE_SELECTED);
		}

		//---------------------------------------------------------------------	

		public бул CheckNonVirtual()
		{
			if ( !m_listCtrl.HasFlag(ListCtrl.wxLC_VIRTUAL) )
				return да;

			Log.LogWarning("Can't do this in virtual view, sorry.");

			return нет;
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
					wxDefaultPosition, wxDefaultSize,
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
					writefln("unknown listctrl mode");
				break;
			}

			DoSize();

			m_logWindow.Очисть();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnListView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_LIST);
		}
		
		//---------------------------------------------------------------------	

		public проц InitWithListItems()
		{
			for ( цел i = 0; i < NUM_ITEMS; i++ )
			{
				m_listCtrl.InsertItem(i, "Элемент " ~ .toString(i));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnReportView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_REPORT);
		}
		
		//---------------------------------------------------------------------	

		public проц InitWithReportItems()
		{
			m_listCtrl.SetImageList(m_imageListSmall, wxIMAGE_LIST_SMALL);

			ListItem itemCol = new ListItem();
			itemCol.Текст = "Column 1";
			itemCol.Рисунок = -1;
			m_listCtrl.InsertColumn(0, itemCol);
			
			itemCol.Текст = "Column 2";
			itemCol.Align = ListCtrl.wxLIST_FORMAT_CENTRE;
			m_listCtrl.InsertColumn(1, itemCol);
			
			itemCol.Текст = "Column 3";
			itemCol.Align = ListCtrl.wxLIST_FORMAT_RIGHT;
			m_listCtrl.InsertColumn(2, itemCol);
			
			m_listCtrl.Hide();
			
			for ( цел i = 0; i < NUM_ITEMS; i++ )
			{
				m_listCtrl.InsertItemInReportView(i);
			}
			
			m_logWindow.WriteText(.toString(NUM_ITEMS) ~ " items inserted");
			m_listCtrl.Show();
			
			ListItem элемент = new ListItem();
			элемент.Ид = 0;
			элемент.TextColour = Цвет.wxRED;
			m_listCtrl.SetItem( элемент );
			
			элемент.Ид = 2;
			элемент.TextColour = Цвет.wxGREEN;
			m_listCtrl.SetItem( элемент );
			элемент.Ид = 4;
			элемент.TextColour = Цвет.wxLIGHT_GREY;
			элемент.шрифт = Шрифт.wxITALIC_FONT;
			элемент.ЦветЗП = Цвет.wxRED;
			m_listCtrl.SetItem( элемент );
			
			m_listCtrl.TextColour = Цвет.wxBLUE;
			m_listCtrl.ЦветЗП = Цвет.wxLIGHT_GREY;
			
			m_listCtrl.SetColumnWidth( 0, ListCtrl.wxLIST_AUTOSIZE );
			m_listCtrl.SetColumnWidth( 1, ListCtrl.wxLIST_AUTOSIZE );
			m_listCtrl.SetColumnWidth( 2, ListCtrl.wxLIST_AUTOSIZE );
		}
		
		//---------------------------------------------------------------------	
		
		public проц InitWithIconItems(бул withText)
		{
			InitWithIconItems(withText, нет);
		}

		public проц InitWithIconItems(бул withText, бул sameIcon)
		{
			m_listCtrl.SetImageList(m_imageListNormal, wxIMAGE_LIST_NORMAL);
			m_listCtrl.SetImageList(m_imageListSmall, wxIMAGE_LIST_SMALL);

			for ( цел i = 0; i < NUM_ICONS; i++ )
			{
				цел рисунок = sameIcon ? 0 : i;

				if ( withText )
				{
					m_listCtrl.InsertItem(i, "Label " ~ .toString(i), рисунок);
				}
				else
				{
					m_listCtrl.InsertItem(i, рисунок);
				}
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnIconView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_ICON, нет);
		}
		
		//---------------------------------------------------------------------	

		public проц OnIconTextView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_ICON);
		}
		
		//---------------------------------------------------------------------	

		public проц OnSmallIconView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_SMALL_ICON, нет);
		}
		
		//---------------------------------------------------------------------	

		public проц OnSmallIconTextView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_SMALL_ICON);
		}
		
		//---------------------------------------------------------------------	

		public проц OnVirtualView(Объект sender, Событие e)
		{
			RecreateList(ListCtrl.wxLC_REPORT | ListCtrl.wxLC_VIRTUAL);
		}
		
		//---------------------------------------------------------------------	

		public проц InitWithVirtualItems()
		{
			m_listCtrl.SetImageList(m_imageListSmall, wxIMAGE_LIST_SMALL);

			m_listCtrl.InsertColumn(0, _("First Column"));
			m_listCtrl.InsertColumn(1, _("Second Column"));
			m_listCtrl.SetColumnWidth(0, 150);
			m_listCtrl.SetColumnWidth(1, 150);

			m_listCtrl.ItemCount = 1000000;
		}
		
		//---------------------------------------------------------------------	
		
		public static extern(C) цел MyCompareFunction(цел item1, цел item2, цел sortData)
		{
			// inverse the order
			if (item1 < item2)
				return -1;
			if (item1 > item2)
				return 1;

			return 0;
		}
		
		//---------------------------------------------------------------------	

		public проц OnSort(Объект sender, Событие e)
		{
			m_listCtrl.SortItems(&MyCompareFunction,0);
 
			m_logWindow.WriteText("Sorting " ~ .toString(m_listCtrl.ItemCount) ~ " items");
		}
		
		//---------------------------------------------------------------------	

		public проц OnShowSelInfo(Объект sender, Событие e)
		{
			цел selCount = m_listCtrl.SelectedItemCount;
			Log.LogMessage(.toString(selCount) ~" items selected:");

			цел shownCount = 0;

			цел элемент = m_listCtrl.GetNextItem(-1, ListCtrl.wxLIST_NEXT_ALL,
						ListCtrl.wxLIST_STATE_SELECTED);
			while ( элемент != -1 )
			{
				Log.LogMessage("\t" ~ .toString(элемент) ~ "d (" ~ m_listCtrl.GetItemText(элемент) ~ ")");

				if ( ++shownCount > 10 )
				{
					Log.LogMessage(_("\t... more selected items snipped..."));
					break;
				}

				элемент = m_listCtrl.GetNextItem(элемент, ListCtrl.wxLIST_NEXT_ALL,
					ListCtrl.wxLIST_STATE_SELECTED);
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnShowColInfo(Объект sender, Событие e)
		{
			цел счёт = m_listCtrl.ColumnCount;
			Log.LogMessage(.toString(счёт) ~ " columns:");
			for ( цел c = 0; c < счёт; c++ )
			{
				Log.LogMessage("\tcolumn " ~ .toString(c) ~ " has ширина " ~ .toString(m_listCtrl.GetColumnWidth(c)));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnUpdateShowColInfo(Объект sender, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
		
			ue.Enabled =(m_listCtrl.StyleFlags & ListCtrl.wxLC_REPORT) != 0;
		}
		
		//---------------------------------------------------------------------	

		public проц OnToggleMultiSel(Объект sender, Событие e)
		{
			long флаги = m_listCtrl.StyleFlags;
			if ( (флаги & ListCtrl.wxLC_SINGLE_SEL) > 0 )
				флаги &= ~ListCtrl.wxLC_SINGLE_SEL;
			else
				флаги |= ListCtrl.wxLC_SINGLE_SEL;

			m_logWindow.WriteText("Current selection mode: " ~ 
				( ( (флаги & ListCtrl.wxLC_SINGLE_SEL) > 0 ) ? "sing" : "multip" ) ~ "le\n");

			RecreateList(флаги);
		}
		
		//---------------------------------------------------------------------	

		public проц OnUpdateToggleMultiSel(Объект sender, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			
			ue.Check = (m_listCtrl.StyleFlags & ListCtrl.wxLC_SINGLE_SEL) == 0;
		}
		
		//---------------------------------------------------------------------	

		public проц OnSetFgColour(Объект sender, Событие e)
		{
			m_listCtrl.ЦветПП = GetColourFromUser(this);
			m_listCtrl.Refresh();
		}
		
		//---------------------------------------------------------------------	

		public проц OnSetBgColour(Объект sender, Событие e)
		{
			m_listCtrl.ЦветЗП = GetColourFromUser(this);
			m_listCtrl.Refresh();
		}
		
		//---------------------------------------------------------------------	

		public проц OnAdd(Объект sender, Событие e)
		{
			m_listCtrl.InsertItem(m_listCtrl.ItemCount, _("Appended элемент"));
		}
		
		//---------------------------------------------------------------------	

		public проц OnEdit(Объект sender, Событие e)
		{
			цел itemCur = m_listCtrl.GetNextItem(-1, ListCtrl.wxLIST_NEXT_ALL,
						ListCtrl.wxLIST_STATE_FOCUSED);

			if ( itemCur != -1 )
			{
				m_listCtrl.EditLabel(itemCur);
			}
			else
			{
				m_logWindow.WriteText(_("No элемент to edit"));
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnDelete(Объект sender, Событие e)
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

		public проц OnDeleteAll(Объект sender, Событие e)
		{

			m_listCtrl.DeleteAllItems();

			m_logWindow.WriteText("Deleted " ~ .toString(m_listCtrl.ItemCount) ~ " items\n");
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class MyListCtrl : ListCtrl
	{
		private ListItemAttr m_attr;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель, цел ид, Точка поз, Размер size, long стиль )
		{
			super( родитель, ид, поз, size, стиль );
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
		
		public проц OnCacheHint(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
			
			Log.LogMessage( "OnCacheHint: cache items " ~ .toString(le.CacheFrom) ~ ".." ~ .toString(le.CacheTo) );
		}
		
		//---------------------------------------------------------------------	

		public проц SetColumnImage(цел col, цел рисунок)
		{
			ListItem элемент = new ListItem();
			элемент.Маска = ListCtrl.wxLIST_MASK_IMAGE;
			элемент.Рисунок = рисунок;
			SetColumn(col, элемент);
		}
		
		//---------------------------------------------------------------------	

		public проц OnColClick(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
			
			цел col = le.Column;
			SetColumnImage(col, 0);

			Log.LogMessage( "OnColumnClick at " ~ .toString(col) ~ "." );
		}
		
		//---------------------------------------------------------------------	

		public проц OnColRightClick(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			цел col = le.Column;
			if ( col != -1 )
			{
				SetColumnImage(col, -1);
			}

			Меню меню = new Меню("Test");
			меню.Append(Cmd.LIST_ABOUT, _("&About"));
			PopupMenu(меню, le.point); 

			Log.LogMessage( "OnColumnRightClick at " ~ .toString(le.Column) ~ "." );
		}
		
		//---------------------------------------------------------------------	

		public проц LogColEvent(Объект sender, Событие e, ткст имя)
		{
			ListEvent le = cast(ListEvent)e;
		
			цел col = le.Column;
			
			ткст msg = имя ~ ": column ";
			msg ~= .toString(col) ~ "(ширина = ";
			msg ~= .toString(le.Элемент.Ширина) ~ " or ";
			msg ~= .toString(GetColumnWidth(col)) ~ ".";

			Log.LogMessage( msg );
		}
		
		//---------------------------------------------------------------------	

		public проц OnColBeginDrag(Объект sender, Событие e)
		{
			LogColEvent( sender, e, "OnColBeginDrag" );
			
			ListEvent le = cast(ListEvent)e;

			if ( le.Column == 0 )
			{
				Log.LogMessage("Resizing this column shouldn't work.");

				le.Veto();
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnColDragging(Объект sender, Событие e)
		{
			LogColEvent( sender, e, "OnColDragging" );
		}
		
		//---------------------------------------------------------------------	

		public проц OnColEndDrag(Объект sender, Событие e)
		{
			LogColEvent( sender, e, "OnColEndDrag" );
		}
		
		//---------------------------------------------------------------------	

		public проц OnBeginDrag(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			Точка pt = le.point;

			цел флаги = 0;
			Log.LogMessage( "OnBeginDrag at (" ~ .toString(pt.X) ~ ", " ~ .toString(pt.Y) ~ "), элемент " ~ .toString(HitTest(pt, флаги)) ~ ".");
		}
		
		//---------------------------------------------------------------------	

		public проц OnBeginRDrag(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			Log.LogMessage( "OnBeginRDrag at " ~ .toString(le.point.X) ~ "," ~ .toString(le.point.Y) ~ ".");
		}
		
		//---------------------------------------------------------------------	

		public проц OnBeginLabelEdit(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
				
			Log.LogMessage( "OnBeginLabelEdit: " ~ le.Элемент.Текст);
		}
		
		//---------------------------------------------------------------------	

		public проц OnEndLabelEdit(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			Log.LogMessage( "OnEndLabelEdit: " ~
				(le.EditCancelled ? "[cancelled]" : le.Элемент.Текст) );
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeleteItem(Объект sender, Событие e)
		{
			LogEvent(sender, e, "OnDeleteItem");
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeleteAllItems(Объект sender, Событие e)
		{
			LogEvent(sender, e, "OnDeleteAllItems");
		}
	
		//---------------------------------------------------------------------	

		public проц OnSelected(Объект sender, Событие e)
		{
			LogEvent(sender, e, "OnSelected");
			
			ListEvent le = cast(ListEvent)e;

			if ( (StyleFlags & ListCtrl.wxLC_REPORT) > 0 )
			{
				ListItem info = new ListItem();
				info.Ид = le.Index;
				info.Column = 1;
				info.Маска = ListCtrl.wxLIST_MASK_TEXT;
				if ( GetItem(info) )
				{
					Log.LogMessage("Value of the 2nd field of the selected элемент: " ~
						info.Текст);
				}
				else
				{
					writefln("wxListCtrl::GetItem() failed");
				}
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnDeselected(Объект sender, Событие e)
		{
			LogEvent(sender, e, "OnDeselected");
		}
		
		//---------------------------------------------------------------------	

		public проц OnActivated(Объект sender, Событие e)
		{
			LogEvent(sender, e, "OnActivated");
		}
		
		//---------------------------------------------------------------------	

		public проц OnFocused(Объект sender, Событие e)
		{
			LogEvent(sender, e, "OnFocused");

			e.Пропусти();
		}
		
		//---------------------------------------------------------------------	

		public проц OnListKeyDown(Объект sender, Событие e)
		{
			ListEvent le = cast(ListEvent)e;
		
			switch ( le.КодКлавиши )
			{
				case 'c': // colorize
				case 'C':
				{
					ListItem info = new ListItem();
					info.Ид = le.Index;
					GetItem(info);

					ListItemAttr attr = info.Attributes;
					if ( !attr || !attr.HasTextColour )
					{
						info.TextColour = Цвет.wxCYAN;

						SetItem(info);

						RefreshItem(info.Ид);
					}
				}
				break;

				case 'n': // next
				case 'N':
				{
					цел элемент = GetNextItem(-1,
						ListCtrl.wxLIST_NEXT_ALL, ListCtrl.wxLIST_STATE_FOCUSED);
					if ( элемент++ == ItemCount - 1 )
					{
						элемент = 0;
					}

					Log.LogMessage("Focusing элемент " ~ .toString(элемент));

					SetItemState(элемент, ListCtrl.wxLIST_STATE_FOCUSED, ListCtrl.wxLIST_STATE_FOCUSED);
					EnsureVisible(элемент);
				}
				break;

				case КодКлавиши.WXK_DELETE:
				{
					цел элемент = GetNextItem(-1,
						ListCtrl.wxLIST_NEXT_ALL, ListCtrl.wxLIST_STATE_SELECTED);
					while ( элемент != -1 )
					{
						DeleteItem(элемент);

						Log.LogMessage("Элемент " ~ .toString(элемент) ~ " deleted");

						// -1 because the indices were shifted by DeleteItem()
						элемент = GetNextItem(элемент - 1,
							ListCtrl.wxLIST_NEXT_ALL, ListCtrl.wxLIST_STATE_SELECTED);
					}
				}
				break;

				case КодКлавиши.WXK_INSERT:
					if ( (StyleFlags & ListCtrl.wxLC_REPORT) > 0 )
					{
						if ( (StyleFlags & ListCtrl.wxLC_VIRTUAL) > 0 )
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
					LogEvent(sender, e, "OnListKeyDown");

					le.Пропусти();
				break;
			}
		}
		
		//---------------------------------------------------------------------	

		public проц OnChar(Объект sender, Событие e)
		{
			СобКлавиши ke = cast(СобКлавиши)e;
		
			Log.LogMessage("Got сим event.");
	
			switch ( ke.КодКлавиши )
			{
				case 'n':
				case 'N':
				case 'c':
				case 'C':
				// these are the keys we process ourselves
				break;

				default:
					e.Пропусти();
				break;
			}
		}
	
		//---------------------------------------------------------------------	

		public проц LogEvent(Объект sender, Событие e, ткст eventName)
		{
			ListEvent le = cast(ListEvent)e;
		
			Log.LogMessage("Элемент " ~ .toString(le.Index) ~ ": " ~ eventName ~ " (элемент текст = " ~ le.Текст ~
				 ", данные = " ~ .toString(le.Data) ~ ")");
		}
		
		//---------------------------------------------------------------------	

		public ткст OnGetItemText(long элемент, long column)
		{
			ткст s = "Column " ~ .toString(column) ~ " of элемент " ~ .toString(элемент);
			return s;
		}
		
		//---------------------------------------------------------------------	

		public цел OnGetItemImage(long элемент)
		{
			return 0;
		}
		
		//---------------------------------------------------------------------	

		public ListItemAttr OnGetItemAttr(long элемент)
		{
			return (элемент % 2) > 0 ? пусто : m_attr;
		}
		
		//---------------------------------------------------------------------	
		
		public проц InsertItemInReportView(цел i)
		{
			ткст buf = "This is элемент " ~ .toString(i);
			цел tmp = InsertItem(i, buf, 0);
			SetItemData(tmp, i);

			buf = "Col 1, элемент " ~ .toString(i);
			SetItem(i, 1, buf);

			buf = "Элемент " ~ .toString(i) ~ " in column 2";
			SetItem(i, 2, buf);
		}
	}
	
	//---------------------------------------------------------------------	

	public class ListCtrlApp : Прил
	{
		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame("ListCtrl Test", Точка(50, 50), Размер(450,340));
			frame.Show(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			ListCtrlApp прил = new ListCtrlApp();
			прил.Пуск();
		}
	}


проц main()
{
	ListCtrlApp.Main();
}
