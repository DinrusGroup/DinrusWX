//-----------------------------------------------------------------------------
// wxD/Samples - TreeCtrl.d
//
// A wxD version of the wxWidgets "treectrl" sample.
//
// Written by Jason Perkins (jason@379.com)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TreeCtrl.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.ткст;

	public class TreeTestApp : Прил
	{
		static бул showImages = да;
// 		static бул showButtons = нет;

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			TreeTestApp прил = new TreeTestApp();
			прил.Пуск();
		}

		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame("TreeCtrl Test", Точка(50,50), Размер(450,600));
			frame.Show(да);
			return да;
		}

		//---------------------------------------------------------------------

		public static бул ShowImages() { return showImages; }
		public static проц ShowImages(бул значение) { showImages = значение; }
		
		//---------------------------------------------------------------------

// 		public static бул ShowButtons
// 		{
// 			get { return showButtons; }
// 			set { showButtons = значение; }
// 		}
	}

	//---------------------------------------------------------------------

	public class MyFrame : Frame
	{
		public enum Cmd 
		{
			TreeTest_Quit,
			TreeTest_About,
			TreeTest_TogButtons,
			TreeTest_TogTwist,
			TreeTest_TogLines,
			TreeTest_TogEdit,
			TreeTest_TogHideRoot,
			TreeTest_TogRootLines,
			TreeTest_TogBorder,
			TreeTest_TogFullHighlight,
			TreeTest_SetFgColour,
			TreeTest_SetBgColour,
			TreeTest_ResetStyle,
			TreeTest_Dump,
			TreeTest_DumpSelected,
			TreeTest_Count,
			TreeTest_CountRec,
			TreeTest_Sort,
			TreeTest_SortRev,
			TreeTest_SetBold,
			TreeTest_ClearBold,
			TreeTest_Rename,
			TreeTest_Delete,
			TreeTest_DeleteChildren,
			TreeTest_DeleteAll,
			TreeTest_Recreate,
			TreeTest_ToggleImages,
			TreeTest_ToggleButtons,
			TreeTest_SetImageSize,
			TreeTest_ToggleSel,
			TreeTest_CollapseAndReset,
			TreeTest_EnsureVisible,
			TreeTest_AddItem,
			TreeTest_InsertItem,
			TreeTest_IncIndent,
			TreeTest_DecIndent,
			TreeTest_IncSpacing,
			TreeTest_DecSpacing,
			TreeTest_ToggleIcon,
			TreeTest_Select,
			TreeTest_Unselect,
			TreeTest_SelectRoot,
			TreeTest_Ctrl = 1000
		}

		private MyTreeCtrl m_treeCtrl;
		
		public TextCtrl m_textCtrl;
		
		public static цел s_num = 0;

		//---------------------------------------------------------------------

		public this(ткст title, Точка поз, Размер size)
		{
			super(title, поз, size);
			ЦветЗП = new Цвет(255, 255, 255);
		
			иконка = new Icon("../Samples/TreeCtrl/mondrian.png");

			// Установи up a меню

			Меню fileMenu = new Меню();
			Меню style_menu = new Меню();
			Меню tree_menu = new Меню();
			Меню item_menu = new Меню();

			fileMenu.Append(Cmd.TreeTest_About, "&About...\tF1");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.TreeTest_Quit, "E&xit\tAlt-X");
			
			style_menu.AppendCheckItem(Cmd.TreeTest_TogButtons, "Toggle &normal buttons");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogTwist, "Toggle &twister buttons");
			style_menu.AppendCheckItem(Cmd.TreeTest_ToggleButtons, "Toggle рисунок &buttons");
			style_menu.AppendSeparator();
			style_menu.AppendCheckItem(Cmd.TreeTest_TogLines, "Toggle &connecting lines");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogRootLines, "Toggle &lines at root");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogHideRoot, "Toggle &hidden root");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogBorder, "Toggle &элемент border");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogFullHighlight, "Toggle &full row highlight");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogEdit, "Toggle &edit mode");
			style_menu.AppendCheckItem(Cmd.TreeTest_ToggleSel, "Toggle &selection mode");
			style_menu.AppendCheckItem(Cmd.TreeTest_ToggleImages, "Toggle show ima&ges");
			style_menu.Append(Cmd.TreeTest_SetImageSize, "Установи рисунок si&ze...");
			style_menu.AppendSeparator();
			style_menu.Append(Cmd.TreeTest_SetFgColour, "Установи &foreground colour...");
			style_menu.Append(Cmd.TreeTest_SetBgColour, "Установи &background colour...");
			style_menu.AppendSeparator();
			style_menu.Append(Cmd.TreeTest_ResetStyle, "&Reset to default\tF10");

			tree_menu.Append(Cmd.TreeTest_Recreate, "&Recreate the tree");
			tree_menu.Append(Cmd.TreeTest_CollapseAndReset, "C&ollapse and reset");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_AddItem, "Append a &new элемент");
			tree_menu.Append(Cmd.TreeTest_InsertItem, "&Insert a new элемент");
			tree_menu.Append(Cmd.TreeTest_Delete, "&Delete this элемент");
			tree_menu.Append(Cmd.TreeTest_DeleteChildren, "Delete &children");
			tree_menu.Append(Cmd.TreeTest_DeleteAll, "Delete &all items");
			tree_menu.Append(Cmd.TreeTest_SelectRoot, "Select root элемент");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_Count, "Счёт children of current элемент");
			tree_menu.Append(Cmd.TreeTest_CountRec, "Recursively счёт children of current элемент");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_Sort, "Sort children of current элемент");
			tree_menu.Append(Cmd.TreeTest_SortRev, "Sort in reversed order");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_EnsureVisible, "Make the last элемент &visible");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_IncIndent, "Добавь 5 points to indentation\tAlt-I");
			tree_menu.Append(Cmd.TreeTest_DecIndent, "Reduce indentation by 5 points\tAlt-R");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_IncSpacing, "Добавь 5 points to spacing\tCtrl-I");
			tree_menu.Append(Cmd.TreeTest_DecSpacing, "Reduce spacing by 5 points\tCtrl-R");

			item_menu.Append(Cmd.TreeTest_Dump, "&Dump элемент children");
			item_menu.Append(Cmd.TreeTest_Rename, "&Rename элемент...");

			item_menu.AppendSeparator();
			item_menu.Append(Cmd.TreeTest_SetBold, "Make элемент &bold");
			item_menu.Append(Cmd.TreeTest_ClearBold, "Make элемент &not bold");
			item_menu.AppendSeparator();
			item_menu.Append(Cmd.TreeTest_ToggleIcon, "Toggle the элемент's &иконка");

			item_menu.AppendSeparator();
			item_menu.Append(Cmd.TreeTest_DumpSelected, "Dump selected items\tAlt-D");
			item_menu.Append(Cmd.TreeTest_Select, "Select current элемент\tAlt-S");
			item_menu.Append(Cmd.TreeTest_Unselect, "Unselect everything\tAlt-U");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(fileMenu, "&File");
			menuBar.Append(style_menu, "&Style");
			menuBar.Append(tree_menu, "&Tree");
			menuBar.Append(item_menu, "&Элемент");
			this.menuBar = menuBar;
			
			m_textCtrl = new TextCtrl(this, -1, "", wxDefaultPosition, wxDefaultSize, 
				TextCtrl.wxTE_MULTILINE | TextCtrl.wxSUNKEN_BORDER);

			// Установи up a status bar

			CreateStatusBar(2);
			StatusText = "";

			// Create the default tree control

			CreateTreeWithDefaultStyle();
			
			menuBar.Check(Cmd.TreeTest_ToggleImages, да);
			
			Log.SetActiveTarget( m_textCtrl ); 

			// Установи up the event table

			EVT_MENU(Cmd.TreeTest_Quit,  &OnQuit);
			EVT_MENU(Cmd.TreeTest_About, &OnAbout);
			
			EVT_MENU(Cmd.TreeTest_TogButtons, &OnTogButtons);
			EVT_MENU(Cmd.TreeTest_Rename, &OnRename);
			EVT_MENU(Cmd.TreeTest_Count, &OnCount);
			EVT_MENU(Cmd.TreeTest_CountRec, &OnCountRec);
			EVT_MENU(Cmd.TreeTest_Dump, &OnDump);
			EVT_MENU(Cmd.TreeTest_ToggleSel, &OnToggleSel);
			EVT_MENU(Cmd.TreeTest_DumpSelected, &OnDumpSelected);
			EVT_MENU(Cmd.TreeTest_Select, &OnSelect);
			EVT_MENU(Cmd.TreeTest_SelectRoot, &OnSelectRoot);
			EVT_MENU(Cmd.TreeTest_Unselect, &OnUnselect);
			EVT_MENU(Cmd.TreeTest_SetBold, &OnSetBold);
			EVT_MENU(Cmd.TreeTest_ClearBold, &OnClearBold);
			EVT_MENU(Cmd.TreeTest_Delete, &OnDelete);
			EVT_MENU(Cmd.TreeTest_DeleteChildren, &OnDeleteChildren);
			EVT_MENU(Cmd.TreeTest_DeleteAll, &OnDeleteAll);
			EVT_MENU(Cmd.TreeTest_Recreate, &OnRecreate);
			EVT_MENU(Cmd.TreeTest_SetImageSize, &OnSetImageSize);
			EVT_MENU(Cmd.TreeTest_ToggleImages, &OnToggleImages);
			EVT_MENU(Cmd.TreeTest_CollapseAndReset, &OnCollapseAndReset);
			EVT_MENU(Cmd.TreeTest_EnsureVisible, &OnEnsureVisible);
			EVT_MENU(Cmd.TreeTest_InsertItem, &OnInsertItem);
			EVT_MENU(Cmd.TreeTest_AddItem, &OnAddItem);
			EVT_MENU(Cmd.TreeTest_IncIndent, &OnIncIndent);
			EVT_MENU(Cmd.TreeTest_DecIndent, &OnDecIndent);
			EVT_MENU(Cmd.TreeTest_IncSpacing, &OnIncSpacing);
			EVT_MENU(Cmd.TreeTest_DecSpacing, &OnDecSpacing);
			EVT_MENU(Cmd.TreeTest_ToggleIcon, &OnToggleIcon);
			EVT_MENU(Cmd.TreeTest_SetFgColour, &OnSetFgColour);
			EVT_MENU(Cmd.TreeTest_SetBgColour, &OnSetBgColour);
			
			EVT_MENU(Cmd.TreeTest_Sort, &OnSort);
			EVT_MENU(Cmd.TreeTest_SortRev, &OnSortRev);
			
			EVT_IDLE( &OnIdle) ;
			
			EVT_SIZE( &OnSize) ;
		}
		
		//---------------------------------------------------------------------
		
		~this()
		{
			Log.SetActiveTarget(пусто);
		}

		//---------------------------------------------------------------------

		public проц CreateTreeWithDefaultStyle()
		{
			long стиль = TreeCtrl.wxTR_DEFAULT_STYLE | TreeCtrl.wxTR_EDIT_LABELS;
			CreateTree(стиль | Border.wxBORDER_SUNKEN);
			
			MenuBar mbar = menuBar;
			
			mbar.Check(Cmd.TreeTest_TogButtons, (стиль & TreeCtrl.wxTR_HAS_BUTTONS) != 0);
			mbar.Check(Cmd.TreeTest_TogButtons, (стиль & TreeCtrl.wxTR_TWIST_BUTTONS) != 0);
			mbar.Check(Cmd.TreeTest_TogLines, (стиль & TreeCtrl.wxTR_NO_LINES) == 0);
			mbar.Check(Cmd.TreeTest_TogRootLines, (стиль & TreeCtrl.wxTR_LINES_AT_ROOT) != 0);
			mbar.Check(Cmd.TreeTest_TogHideRoot, (стиль & TreeCtrl.wxTR_HIDE_ROOT) != 0);
			mbar.Check(Cmd.TreeTest_TogEdit, (стиль & TreeCtrl.wxTR_EDIT_LABELS) != 0);
			mbar.Check(Cmd.TreeTest_TogBorder, (стиль & TreeCtrl.wxTR_ROW_LINES) != 0);
			mbar.Check(Cmd.TreeTest_TogFullHighlight, (стиль & TreeCtrl.wxTR_FULL_ROW_HIGHLIGHT) != 0);
		}

		//---------------------------------------------------------------------

		public проц CreateTree(long стиль)
		{
			m_treeCtrl = new MyTreeCtrl(this, Cmd.TreeTest_Ctrl, wxDefaultPosition, wxDefaultSize, стиль);
			Resize();
		}
		
		//---------------------------------------------------------------------
		
		public проц TogStyle(цел ид, long flag)
		{
			long стиль = m_treeCtrl.WindowStyle ^ flag;
			//delete m_treeCtrl;
			CreateTree(стиль);

			menuBar.Check(ид, (стиль & flag) != 0);
		}

		//---------------------------------------------------------------------
		
		public проц OnIdle(Объект sender, Событие e)
		{
			if (m_treeCtrl)
			{
				TreeItemId idRoot = m_treeCtrl.RootItem;
			
				ткст s = "Root/last элемент is ";
				s ~= m_treeCtrl.IsVisible(idRoot) ? "" : "not ";
				s ~= "visible/";
				s ~= m_treeCtrl.IsVisible(m_treeCtrl.GetLastChild(idRoot)) ? "" : "not ";
				s ~= "visible";
				
				SetStatusText(s, 1);
			}
		      
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------

		public проц OnQuit(Объект sender, Событие e)
		{
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект sender, Событие e)
		{
			ткст msg = "Tree test sample\n(c) Julian Smart 1997, Vadim Zeitlin 1998\nPorted to wxD by Jason Perkins and Alexander Olk";
			MessageBox(this, msg, "About Tree Test", Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------

		public проц Resize()
		{
			Размер size = ClientSize;
			m_treeCtrl.УстРазм(0, 0, size.Ширина, size.Высота * 2/3);
			m_textCtrl.УстРазм(0, 2 * size.Высота/3, size.Ширина, size.Высота/3);
		}

		//---------------------------------------------------------------------
		
		public проц OnTogButtons(Объект sender, Событие e)
		{
			TogStyle(e.ИД, TreeCtrl.wxTR_HAS_BUTTONS);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSize(Объект sender, Событие e)
		{
			if ( m_treeCtrl && m_textCtrl )
			{
				Resize();
			}

			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnRename(Объект sender, Событие e)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			m_treeCtrl.EditLabel(элемент);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnCount(Объект sender, Событие e)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			цел i = m_treeCtrl.GetChildrenCount( элемент, нет );

			Log.LogMessage(.toString(i) ~ " children");
		}
		
		//---------------------------------------------------------------------
		
		public проц OnCountRec(Объект sender, Событие e)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			цел i = m_treeCtrl.GetChildrenCount( элемент );

			Log.LogMessage(.toString(i) ~ " children");
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDump(Объект sender, Событие e)
		{
			TreeItemId root = m_treeCtrl.Selection;
			
			CHECK_ITEM( root );

			m_treeCtrl.GetItemsRecursively(root, ЦУк.init);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnToggleSel(Объект sender, Событие e)
		{
			TogStyle(e.ИД, TreeCtrl.wxTR_MULTIPLE);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDumpSelected(Объект sender, Событие e)
		{
			TreeItemId[] array = m_treeCtrl.Selections();

			цел счёт = array.length;
			
			Log.LogMessage(.toString(счёт) ~ " items selected");

			for ( цел n = 0; n < счёт; n++ )
			{
				Log.LogMessage(m_treeCtrl.GetItemText(array[n]));
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelect(Объект sender, Событие e)
		{
			m_treeCtrl.SelectItem(m_treeCtrl.Selection);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelectRoot(Объект sender, Событие e)
		{
			m_treeCtrl.SelectItem(m_treeCtrl.RootItem);
		}

		//---------------------------------------------------------------------

		public проц OnUnselect(Объект sender, Событие e)
		{
			m_treeCtrl.UnselectAll();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetBold(Объект sender, Событие e)
		{
			DoSetBold(да);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnClearBold(Объект sender, Событие e)
		{
			DoSetBold(нет);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoSetBold(бул bold)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			m_treeCtrl.SetItemBold(элемент, bold);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDelete(Объект sender, Событие e)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			m_treeCtrl.Delete(элемент);
		}

		//---------------------------------------------------------------------

		public проц OnDeleteChildren(Объект sender, Событие e)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			m_treeCtrl.DeleteChildren(элемент);
		}

		//---------------------------------------------------------------------

		public проц OnDeleteAll(Объект sender, Событие e)
		{
			m_treeCtrl.DeleteAllItems();
		}

		//---------------------------------------------------------------------

		public проц OnRecreate(Объект sender, Событие e)
		{
			OnDeleteAll(this, e);
			m_treeCtrl.AddTestItemsToTree(5, 2);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetImageSize(Объект sender, Событие e)
		{
			цел size = GetNumberFromUser("Enter the size for the images to use",
					"Размер: ",
					"TreeCtrl sample",
					m_treeCtrl.ImageSize);
			if ( size == -1 )
				return;

			m_treeCtrl.CreateImageList(size);
			TreeTestApp.ShowImages = да;
		}
		
		//---------------------------------------------------------------------

		public проц OnToggleImages(Объект sender, Событие e)
		{
			if ( TreeTestApp.ShowImages )
			{
				m_treeCtrl.CreateImageList(-1);
				TreeTestApp.ShowImages = нет;
			}
			else
			{
				m_treeCtrl.CreateImageList(0);
				TreeTestApp.ShowImages = да;
			}
		}
		
		//---------------------------------------------------------------------
		
// 		public проц OnToggleButtons(Объект sender, Событие e)
// 		{
// 			if ( TreeTestApp.ShowButtons )
// 			{
// 				m_treeCtrl.CreateButtonsImageList(-1);
// 				TreeTestApp.ShowButtons = нет;
// 			}
// 			else
// 			{
// 				m_treeCtrl.CreateButtonsImageList(15);
// 				TreeTestApp.ShowButtons = да;
// 			}
// 		}

		//---------------------------------------------------------------------
		
		public проц OnCollapseAndReset(Объект sender, Событие e)
		{
			m_treeCtrl.CollapseAndReset(m_treeCtrl.RootItem);
		}

		//---------------------------------------------------------------------

		public проц OnEnsureVisible(Объект sender, Событие e)
		{
			m_treeCtrl.DoEnsureVisible();
		}

		//---------------------------------------------------------------------

		public проц OnInsertItem(Объект sender, Событие e)
		{
			цел рисунок = TreeTestApp.ShowImages ? MyTreeCtrl.TreeIcon.File : -1;
			m_treeCtrl.InsertItem(m_treeCtrl.RootItem, рисунок, "2nd элемент");
		}

		//---------------------------------------------------------------------

		public проц OnAddItem(Объект sender, Событие e)
		{
			ткст текст = "Элемент #" ~ .toString(++s_num);

			m_treeCtrl.AppendItem(m_treeCtrl.RootItem, текст);
		}

		//---------------------------------------------------------------------

		public проц OnIncIndent(Объект sender, Событие e)
		{
			бцел indent = m_treeCtrl.Indent;
			if (indent < 100)
				m_treeCtrl.Indent = indent + 5;
		}

		//---------------------------------------------------------------------

		public проц OnDecIndent(Объект sender, Событие e)
		{
			бцел indent = m_treeCtrl.Indent;
			if (indent > 10)
				m_treeCtrl.Indent = indent-5;
		}

		//---------------------------------------------------------------------

		public проц OnIncSpacing(Объект sender, Событие e)
		{
			бцел indent = m_treeCtrl.Spacing;
			if (indent < 100)
				m_treeCtrl.Spacing = indent + 5;
		}

		//---------------------------------------------------------------------

		public проц OnDecSpacing(Объект sender, Событие e)
		{
			бцел indent = m_treeCtrl.Spacing;
			if (indent > 10)
				m_treeCtrl.Spacing = indent - 5;
		}

		//---------------------------------------------------------------------

		public проц OnToggleIcon(Объект sender, Событие e)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			m_treeCtrl.DoToggleIcon(элемент);
		}
		
		//---------------------------------------------------------------------

		public проц OnSetFgColour(Объект sender, Событие e)
		{
			Цвет col = GetColourFromUser(this, m_treeCtrl.ЦветПП);
			if ( col.Ок() )
				m_treeCtrl.ЦветПП = col;
		}

		//---------------------------------------------------------------------

		public проц OnSetBgColour(Объект sender, Событие e)
		{
			Цвет col = GetColourFromUser(this, m_treeCtrl.ЦветЗП);
			if ( col.Ок() )
				m_treeCtrl.ЦветЗП = col;
		}

		
		//---------------------------------------------------------------------
		
		public проц OnSort(Объект sender, Событие e)
		{
			DoSort(нет);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSortRev(Объект sender, Событие e)
		{
			DoSort(да);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoSort(бул reverse)
		{
			TreeItemId элемент = m_treeCtrl.Selection;

			CHECK_ITEM( элемент );

			m_treeCtrl.DoSortChildren(элемент, reverse);
		}
		
		//---------------------------------------------------------------------
		
		public проц CHECK_ITEM(TreeItemId элемент)
		{
			if ( !элемент.IsOk() ) 
			{                                 
				MessageBox(this, "Please select some элемент first!", 
						"Tree sample error",              
						Dialog.wxOK | Dialog.wxICON_EXCLAMATION);
				return;                                             
			}
		}
	}

	//---------------------------------------------------------------------

	public class MyTreeCtrl : TreeCtrl
	{
		public enum TreeIcon
		{
			File,
			FileSelected,
			Folder,
			FolderSelected,
			FolderOpened
		};

		TreeItemId m_lastItem;
		TreeItemId m_draggedItem;
		цел        imageSize;
		
		бул m_reverseSort;

		//---------------------------------------------------------------------

		public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль)
		{
			super(родитель, ид, поз, size, стиль);
			CreateImageList(16);
			AddTestItemsToTree(5, 2);
			
			EVT_TREE_BEGIN_DRAG(MyFrame.Cmd.TreeTest_Ctrl, &OnBeginDrag);
			EVT_TREE_BEGIN_RDRAG(MyFrame.Cmd.TreeTest_Ctrl, &OnBeginRDrag);
			EVT_TREE_END_DRAG(MyFrame.Cmd.TreeTest_Ctrl, &OnEndDrag);
			EVT_TREE_BEGIN_LABEL_EDIT(MyFrame.Cmd.TreeTest_Ctrl, &OnBeginLabelEdit);
			EVT_TREE_END_LABEL_EDIT(MyFrame.Cmd.TreeTest_Ctrl, &OnEndLabelEdit);
			EVT_TREE_DELETE_ITEM(MyFrame.Cmd.TreeTest_Ctrl, &OnDeleteItem);
			EVT_TREE_SET_INFO(MyFrame.Cmd.TreeTest_Ctrl, &OnSetInfo);
			EVT_TREE_ITEM_EXPANDED(MyFrame.Cmd.TreeTest_Ctrl, &OnItemExpanded);
			EVT_TREE_ITEM_EXPANDING(MyFrame.Cmd.TreeTest_Ctrl, &OnItemExpanding);
			EVT_TREE_ITEM_COLLAPSED(MyFrame.Cmd.TreeTest_Ctrl, &OnItemCollapsed);
			EVT_TREE_ITEM_COLLAPSING(MyFrame.Cmd.TreeTest_Ctrl, &OnItemCollapsing);

			EVT_CONTEXT_MENU(&OnContextMenu);
			EVT_TREE_SEL_CHANGED(MyFrame.Cmd.TreeTest_Ctrl, &OnSelChanged);
			EVT_TREE_SEL_CHANGING(MyFrame.Cmd.TreeTest_Ctrl, &OnSelChanging);
			EVT_TREE_KEY_DOWN(MyFrame.Cmd.TreeTest_Ctrl, &OnTreeKeyDown);
			EVT_TREE_ITEM_ACTIVATED(MyFrame.Cmd.TreeTest_Ctrl, &OnItemActivated);
			EVT_RIGHT_DCLICK(&OnRMouseDClick);
		}

		//---------------------------------------------------------------------

		public проц CreateImageList(цел size)
		{
			if (size == -1)      // signal to turn off images
			{
				SetImageList(пусто);
				return;
			}

			if (size == 0)       // signal to turn on images
				size = imageSize;
			else
				imageSize = size;

			/* wxBusyCursor wait; */

			ImageList images = new ImageList(size, size);

			for (цел i = 0; i < 5; ++i)
			{
				Рисунок рисунок = new Рисунок("../Samples/TreeCtrl/иконка" ~ .toString(i) ~ ".png");
				images.Добавь(new Битмап(рисунок.Ремасштабируй(size, size)));
			}

			AssignImageList(images);
		}

		//---------------------------------------------------------------------

		public проц AddItemsRecursively(TreeItemId idParent, цел numChildren, цел глубина, цел folder)
		{
			if (глубина > 0)
			{
				бул hasChildren = глубина > 1;

				for (цел n = 0; n < numChildren; ++n)
				{
					ткст str;

					// at глубина 1 elements won't have any more children
					if (hasChildren)
						str ~= format("%s child %d", "Folder", n + 1);
					else
						str ~= format("%s child %d.%d", "File", folder, n + 1);

					// here we pass to AppendItem() normal and selected элемент images (we
					// suppose that selected рисунок follows the normal one in the enum)

					цел рисунок, imageSel;
					if (TreeTestApp.ShowImages)
					{
						рисунок = (глубина == 1) ? TreeIcon.File : TreeIcon.Folder;
						imageSel = рисунок + 1;
					}
					else
					{
						рисунок = -1;
						imageSel = -1;
					}

					TreeItemId ид = AppendItem(idParent, str, рисунок, imageSel,
						new MyTreeItemData(str));

					// and now we also set the expanded one (only for the folders)

					if (hasChildren && TreeTestApp.ShowImages)
					{
						SetItemImage(ид, TreeIcon.FolderOpened, TreeItemIcon.wxTreeItemIcon_Expanded);
					}

					// remember the last child for OnEnsureVisible()

					if (!hasChildren && n == numChildren - 1)
					{
						m_lastItem = ид;
					}

					AddItemsRecursively(ид, numChildren, глубина - 1, n + 1);
				}
			}
		}

		//---------------------------------------------------------------------

		public проц AddTestItemsToTree(цел numChildren, цел глубина)
		{
			цел рисунок = TreeTestApp.ShowImages ? TreeIcon.Folder : -1;
			TreeItemId rootId = AddRoot("Root", рисунок, рисунок,
				new MyTreeItemData("Root элемент"));
			if (рисунок != -1)
				SetItemImage(rootId, TreeIcon.FolderOpened, TreeItemIcon.wxTreeItemIcon_Expanded);

			AddItemsRecursively(rootId, numChildren, глубина, 0);
			
			SetItemFont(rootId, Шрифт.wxITALIC_FONT);
			
			ЦУк cookie = ЦУк.init;
			TreeItemId ид = GetFirstChild(rootId, cookie);
			SetItemTextColour(ид, Цвет.wxBLUE);

			ид = GetNextChild(rootId, cookie);
			ид = GetNextChild(rootId, cookie);
			SetItemTextColour(ид, Цвет.wxRED);
			SetItemBackgroundColour(ид, Цвет.wxLIGHT_GREY);
		}
		
		//---------------------------------------------------------------------
		
		public проц GetItemsRecursively(TreeItemId idParent, ЦУк cookie)
		{
			TreeItemId ид;

			if ( cookie == ЦУк.init )
				ид = GetFirstChild(idParent, cookie);
			else
				ид = GetNextChild(idParent, cookie);

			if ( !ид.IsOk() )
				return;

			ткст текст = GetItemText(ид);
			Log.LogMessage(текст);

			if ( ItemHasChildren(ид) )
				GetItemsRecursively(ид, ЦУк.init);

			GetItemsRecursively(idParent, cookie);
		}
		
		//---------------------------------------------------------------------
		
		public цел ImageSize()
		{
			return imageSize;
		}
		
		//---------------------------------------------------------------------
		
		public проц DoEnsureVisible()
		{
			if (m_lastItem.IsOk()) 
				EnsureVisible(m_lastItem);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoToggleIcon(TreeItemId элемент)
		{
			цел рисунок = GetItemImage(элемент);
			рисунок = рисунок == TreeIcon.Folder ? TreeIcon.File
								: TreeIcon.Folder;

			SetItemImage(элемент, рисунок);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnBeginDrag(Объект sender, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			if ( te.Элемент != RootItem )
			{
				m_draggedItem = te.Элемент;

				Log.LogMessage("OnBeginDrag: started dragging " ~ GetItemText(m_draggedItem));

				te.Allow();
			}
			else
			{
				Log.LogMessage("OnBeginDrag: this элемент can't be dragged.");
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnBeginRDrag(Объект sender, Событие e)
		{
			Log.LogMessage("OnBeginRDrag");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEndDrag(Объект sender, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
			
			TreeItemId itemSrc = m_draggedItem;
			TreeItemId itemDst = te.Элемент;
			//m_draggedItem = (wxTreeItemId)0l;

			if ( itemDst.IsOk() && !ItemHasChildren(itemDst) )
			{
				itemDst = GetItemParent(itemDst);
			}

			if ( !itemDst.IsOk() )
			{
				Log.LogMessage("OnEndDrag: can't drop here.");

				return;
			}

			ткст текст = GetItemText(itemSrc);
			Log.LogMessage("OnEndDrag: '" ~ текст ~ "' copied to '" ~ GetItemText(itemDst) ~ "'.");

			цел рисунок = TreeTestApp.ShowImages ? TreeIcon.File : -1;
			AppendItem(itemDst, текст, рисунок);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnBeginLabelEdit(Объект sender, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
			
			Log.LogMessage("OnBeginLabelEdit");

			TreeItemId itemId = te.Элемент;
			if ( IsTestItem(itemId) )
			{
				MessageBox("You can't edit this элемент.");

				te.Veto();
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEndLabelEdit(Объект sender, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			Log.LogMessage("OnEndLabelEdit");

// 			if ( !te.Label.IsWord() )
// 			{
// 				MessageBox("The new надпись should be a single word.");
// 
// 				te.Veto();
// 			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDeleteItem(Объект sender, Событие e)
		{
// 			Log.LogMessage("OnDeleteItem");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSetInfo(Объект sender, Событие e)
		{
			Log.LogMessage("OnSetInfo");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemExpanded(Объект sender, Событие e)
		{
			Log.LogMessage("OnItemExpanded");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemExpanding(Объект sender, Событие e)
		{
			Log.LogMessage("OnItemExpanding");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemCollapsed(Объект sender, Событие e)
		{
			Log.LogMessage("OnItemCollapsed");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemCollapsing(Объект sender, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			Log.LogMessage("OnItemCollapsing");

			TreeItemId itemId = te.Элемент;
			if ( IsTestItem(itemId) )
			{
				MessageBox("You can't collapse this элемент.");

				te.Veto();
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnContextMenu(Объект sender, Событие e)
		{
			ContextMenuEvent ce = cast(ContextMenuEvent)e;
		
			Точка pt = ce.Положение;
			TreeItemId элемент = Selection;
			Log.LogMessage("OnContextMenu at screen coords (" ~ .toString(pt.X) ~ ", " ~ .toString(pt.Y) ~ ")");

			if (pt.X==-1 && pt.Y==-1) 
			{
				if (элемент.IsOk())
				{
					Прямоугольник прям = Прямоугольник(0, 0, 0, 0);
					GetBoundingRect(элемент, прям, да); 
					pt = Точка(прям.Left, прям.Top);
				}
				else
				{
					pt = Точка(0, 0);
				}
			}
			else
			{
				pt = ScreenToClient(pt);
			}

			ShowMenu(элемент, pt);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelChanged(Объект sender, Событие e)
		{
			Log.LogMessage("OnSelChanged");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelChanging(Объект sender, Событие e)
		{
			Log.LogMessage("OnSelChanging");
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnTreeKeyDown(Объект sender, Событие e)
		{
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemActivated(Объект sender, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			TreeItemId itemId = te.Элемент;
			MyTreeItemData элемент = cast(MyTreeItemData)GetItemData(itemId);

			if ( элемент )
			{
				элемент.ShowInfo(this);
			}

			Log.LogMessage("OnItemActivated");
		}
		
		//---------------------------------------------------------------------
		
		public проц OnRMouseDClick(Объект sender, Событие e)
		{
			MouseEvent me = cast(MouseEvent)e;
		
			цел флаги = 0;
			TreeItemId ид = HitTest(me.Положение, флаги);
			if ( ид is пусто )
				Log.LogMessage("No элемент under mouse");
			else
			{
				MyTreeItemData элемент = cast(MyTreeItemData)GetItemData(ид);
				if ( элемент )
					Log.LogMessage("Элемент '" ~ элемент.Desc ~ "' under mouse");
			}
		}
		
		//---------------------------------------------------------------------
		
		private бул IsTestItem(TreeItemId элемент)
		{
			return GetItemParent(элемент) == RootItem && (GetPrevSibling(элемент) is пусто);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetLastItem(TreeItemId ид)
		{
			m_lastItem = ид;
		}
		
		//---------------------------------------------------------------------
		
		public проц ShowMenu(TreeItemId ид, Точка pt)
		{
			ткст title = "";
			if ( ид.IsOk() )
			{
				title ~= "Меню for " ~ GetItemText(ид);
			}
			else
			{
				title = "Меню for no particular элемент";
			}

			Меню меню = new Меню(title);
			меню.Append(MyFrame.Cmd.TreeTest_About, "&About...");
			меню.Append(MyFrame.Cmd.TreeTest_Dump, "&Dump");

			PopupMenu(меню, pt);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoSortChildren(TreeItemId элемент, бул reverse)
		{
			m_reverseSort = reverse;
			super.SortChildren(элемент);
		}
		
		//---------------------------------------------------------------------
		
		public override цел OnCompareItems(TreeItemId item1, TreeItemId item2)
		{
			if ( m_reverseSort )
			{
				return super.OnCompareItems(item2, item1);
			}
			else
			{
				return super.OnCompareItems(item1, item2);
			}
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyTreeItemData : TreeItemData
	{
		private ткст m_desc;
		
		//---------------------------------------------------------------------
	
		public this(ткст desc)
		{
			super();
			m_desc = desc;
		}
		
		//---------------------------------------------------------------------
		
		public ткст Desc()
		{
			return m_desc;
		}
		
		protected ткст Bool2String(бул с)
		{
			return с ? "" : "not";
		}
		
		//---------------------------------------------------------------------
		
		public проц ShowInfo(TreeCtrl tree)
		{
			ткст msg = "Элемент '" ~ m_desc ~ "': ";
			msg ~= Bool2String(tree.IsSelected(Ид)) ~ "selected, ";
			msg ~= Bool2String(tree.IsExpanded(Ид)) ~ "expanded, ";
			msg ~= Bool2String(tree.IsBold(Ид)) ~ "bold,\n";
			msg ~= .toString(tree.GetChildrenCount(Ид)) ~ " children (";
			msg ~= .toString(tree.GetChildrenCount(Ид, нет)) ~ " immediately under this элемент).";
		
			Log.LogMessage(msg);
		}
	}


проц main()
{
	TreeTestApp.Main();
}
