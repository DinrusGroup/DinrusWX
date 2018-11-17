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
private import stdrus;

	public class TreeTestApp : Апп
	{
		static бул showImages = да;
// 		static бул showButtons = false;

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			TreeTestApp app = new TreeTestApp();
			app.Пуск();
		}

		//---------------------------------------------------------------------

		public override бул ПоИниц()
		{
			MyFrame frame = new MyFrame("TreeCtrl Test", Точка(50,50), Размер(450,600));
			frame.Покажи(да);
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

		public this(ткст title, Точка поз, Размер Размер)
		{
			super(title, поз, Размер);
			ЦветФона = new Цвет(255, 255, 255);
		
			пиктограмма = new Пиктограмма("data/mondrian.png");

			// Уст up a меню

			Меню fileMenu = new Меню();
			Меню style_menu = new Меню();
			Меню tree_menu = new Меню();
			Меню элт_menu = new Меню();

			fileMenu.Append(Cmd.TreeTest_About, "&About...\tF1");
			fileMenu.AppendSeparator();
			fileMenu.Append(Cmd.TreeTest_Quit, "E&xit\tAlt-X");
			
			style_menu.AppendCheckItem(Cmd.TreeTest_TogButtons, "Toggle &normal buttons");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogTwist, "Toggle &twister buttons");
			style_menu.AppendCheckItem(Cmd.TreeTest_ToggleButtons, "Toggle рисунок &buttons");
			style_menu.AppendSeparator();
			style_menu.AppendCheckItem(Cmd.TreeTest_TogLines, "Toggle &connecting строки");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogRootLines, "Toggle &строки at root");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogHideRoot, "Toggle &hidden root");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogBorder, "Toggle &элт бордюр");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogFullHighlight, "Toggle &full row highlight");
			style_menu.AppendCheckItem(Cmd.TreeTest_TogEdit, "Toggle &edit mode");
			style_menu.AppendCheckItem(Cmd.TreeTest_ToggleSel, "Toggle &selection mode");
			style_menu.AppendCheckItem(Cmd.TreeTest_ToggleImages, "Toggle покажи ima&ges");
			style_menu.Append(Cmd.TreeTest_SetImageSize, "Уст рисунок si&ze...");
			style_menu.AppendSeparator();
			style_menu.Append(Cmd.TreeTest_SetFgColour, "Уст &foreground цвет...");
			style_menu.Append(Cmd.TreeTest_SetBgColour, "Уст &background цвет...");
			style_menu.AppendSeparator();
			style_menu.Append(Cmd.TreeTest_ResetStyle, "&Reset to default\tF10");

			tree_menu.Append(Cmd.TreeTest_Recreate, "&Recreate the tree");
			tree_menu.Append(Cmd.TreeTest_CollapseAndReset, "C&ollapse and reset");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_AddItem, "Append a &new элт");
			tree_menu.Append(Cmd.TreeTest_InsertItem, "&Insert a new элт");
			tree_menu.Append(Cmd.TreeTest_Delete, "&Delete this элт");
			tree_menu.Append(Cmd.TreeTest_DeleteChildren, "Delete &children");
			tree_menu.Append(Cmd.TreeTest_DeleteAll, "Delete &all элтs");
			tree_menu.Append(Cmd.TreeTest_SelectRoot, "Select root элт");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_Count, "Счёт children of current элт");
			tree_menu.Append(Cmd.TreeTest_CountRec, "Recursively count children of current элт");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_Sort, "Sort children of current элт");
			tree_menu.Append(Cmd.TreeTest_SortRev, "Sort in reversed order");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_EnsureVisible, "Make the last элт &visible");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_IncIndent, "Добавь 5 points to indentation\tAlt-I");
			tree_menu.Append(Cmd.TreeTest_DecIndent, "Reduce indentation by 5 points\tAlt-R");
			tree_menu.AppendSeparator();
			tree_menu.Append(Cmd.TreeTest_IncSpacing, "Добавь 5 points to spacing\tCtrl-I");
			tree_menu.Append(Cmd.TreeTest_DecSpacing, "Reduce spacing by 5 points\tCtrl-R");

			элт_menu.Append(Cmd.TreeTest_Dump, "&Dump элт children");
			элт_menu.Append(Cmd.TreeTest_Rename, "&Rename элт...");

			элт_menu.AppendSeparator();
			элт_menu.Append(Cmd.TreeTest_SetBold, "Make элт &bold");
			элт_menu.Append(Cmd.TreeTest_ClearBold, "Make элт &not bold");
			элт_menu.AppendSeparator();
			элт_menu.Append(Cmd.TreeTest_ToggleIcon, "Toggle the элт's &пиктограмма");

			элт_menu.AppendSeparator();
			элт_menu.Append(Cmd.TreeTest_DumpSelected, "Dump selected элтs\tAlt-D");
			элт_menu.Append(Cmd.TreeTest_Select, "Select current элт\tAlt-S");
			элт_menu.Append(Cmd.TreeTest_Unselect, "Unselect everything\tAlt-U");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(fileMenu, "&File");
			menuBar.Append(style_menu, "&Стиль");
			menuBar.Append(tree_menu, "&Tree");
			menuBar.Append(элт_menu, "&Элемент");
			this.menuBar = menuBar;
			
			m_textCtrl = new TextCtrl(this, -1, "", вхДефПоз, вхДефРазм, 
				TextCtrl.wxTE_MULTILINE | TextCtrl.wxSUNKEN_BORDER);

			// Уст up a status bar

			CreateStatusBar(2);
			StatusText = "";

			// Создай the default tree control

			CreateTreeWithDefaultStyle();
			
			menuBar.Check(Cmd.TreeTest_ToggleImages, да);
			
			Log.УстActiveTarget( m_textCtrl ); 

			// Уст up the event table

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
			EVT_MENU(Cmd.TreeTest_SetBold, &OnУстBold);
			EVT_MENU(Cmd.TreeTest_ClearBold, &OnClearBold);
			EVT_MENU(Cmd.TreeTest_Delete, &OnDelete);
			EVT_MENU(Cmd.TreeTest_DeleteChildren, &OnDeleteChildren);
			EVT_MENU(Cmd.TreeTest_DeleteAll, &OnDeleteAll);
			EVT_MENU(Cmd.TreeTest_Recreate, &OnRecreate);
			EVT_MENU(Cmd.TreeTest_SetImageSize, &OnУстImageSize);
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
			EVT_MENU(Cmd.TreeTest_SetFgColour, &OnУстFgColour);
			EVT_MENU(Cmd.TreeTest_SetBgColour, &OnУстBgColour);
			
			EVT_MENU(Cmd.TreeTest_Sort, &OnSort);
			EVT_MENU(Cmd.TreeTest_SortRev, &OnSortRev);
			
			EVT_IDLE( &OnIdle) ;
			
			EVT_SIZE( &OnSize) ;
		}
		
		//---------------------------------------------------------------------
		
		~this()
		{
			Log.УстActiveTarget(null);
		}

		//---------------------------------------------------------------------

		public проц CreateTreeWithDefaultStyle()
		{
			long стиль = TreeCtrl.wxTR_DEFAULT_STYLE | TreeCtrl.wxTR_EDIT_LABELS;
			CreateTree(стиль | ПБордюр.УТОПЛЕННЫЙ);
			
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
			m_treeCtrl = new MyTreeCtrl(this, Cmd.TreeTest_Ctrl, вхДефПоз, вхДефРазм, стиль);
			Resize();
		}
		
		//---------------------------------------------------------------------
		
		public проц TogStyle(цел ид, long flag)
		{
			long стиль = m_treeCtrl.СтильОкна ^ flag;
			//delete m_treeCtrl;
			CreateTree(стиль);

			menuBar.Check(ид, (стиль & flag) != 0);
		}

		//---------------------------------------------------------------------
		
		public проц OnIdle(Объект отправитель, Событие e)
		{
			if (m_treeCtrl)
			{
				TreeItemId idRoot = m_treeCtrl.RootItem;
			
				ткст s = "Root/last элт is ";
				s ~= m_treeCtrl.Виден(idRoot) ? "" : "not ";
				s ~= "visible/";
				s ~= m_treeCtrl.Виден(m_treeCtrl.GetLastChild(idRoot)) ? "" : "not ";
				s ~= "visible";
				
				УстStatusText(s, 1);
			}
		      
			e.Skip();
		}
		
		//---------------------------------------------------------------------

		public проц OnQuit(Объект отправитель, Событие e)
		{
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект отправитель, Событие e)
		{
			ткст msg = "Tree test sample\n(c) Julian Smart 1997, Vadim Zeitlin 1998\nPorted to wxD by Jason Perkins and Alexander Olk";
			MessageBox(this, msg, "About Tree Test", Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------

		public проц Resize()
		{
			Размер Размер = РазмерКлиента;
			m_treeCtrl.УстРазм(0, 0, Размер.Ширь, Размер.Высь * 2/3);
			m_textCtrl.УстРазм(0, 2 * Размер.Высь/3, Размер.Ширь, Размер.Высь/3);
		}

		//---------------------------------------------------------------------
		
		public проц OnTogButtons(Объект отправитель, Событие e)
		{
			TogStyle(e.ИД, TreeCtrl.wxTR_HAS_BUTTONS);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSize(Объект отправитель, Событие e)
		{
			if ( m_treeCtrl && m_textCtrl )
			{
				Resize();
			}

			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnRename(Объект отправитель, Событие e)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			m_treeCtrl.EditLabel(элт);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnCount(Объект отправитель, Событие e)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			цел i = m_treeCtrl.GetChildrenCount( элт, false );

			Log.LogMessage(.вТкст(i) ~ " children");
		}
		
		//---------------------------------------------------------------------
		
		public проц OnCountRec(Объект отправитель, Событие e)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			цел i = m_treeCtrl.GetChildrenCount( элт );

			Log.LogMessage(.вТкст(i) ~ " children");
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDump(Объект отправитель, Событие e)
		{
			TreeItemId root = m_treeCtrl.Selection;
			
			CHECK_ITEM( root );

			m_treeCtrl.GetItemsRecursively(root, IntPtr.init);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnToggleSel(Объект отправитель, Событие e)
		{
			TogStyle(e.ИД, TreeCtrl.wxTR_MULTIPLE);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDumpSelected(Объект отправитель, Событие e)
		{
			TreeItemId[] array = m_treeCtrl.Selections();

			цел count = array.length;
			
			Log.LogMessage(.вТкст(count) ~ " элтs selected");

			for ( цел n = 0; n < count; n++ )
			{
				Log.LogMessage(m_treeCtrl.GetItemText(array[n]));
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelect(Объект отправитель, Событие e)
		{
			m_treeCtrl.SelectItem(m_treeCtrl.Selection);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelectRoot(Объект отправитель, Событие e)
		{
			m_treeCtrl.SelectItem(m_treeCtrl.RootItem);
		}

		//---------------------------------------------------------------------

		public проц OnUnselect(Объект отправитель, Событие e)
		{
			m_treeCtrl.UnselectAll();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстBold(Объект отправитель, Событие e)
		{
			DoУстBold(да);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnClearBold(Объект отправитель, Событие e)
		{
			DoУстBold(false);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoУстBold(бул bold)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			m_treeCtrl.УстItemBold(элт, bold);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDelete(Объект отправитель, Событие e)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			m_treeCtrl.Delete(элт);
		}

		//---------------------------------------------------------------------

		public проц OnDeleteChildren(Объект отправитель, Событие e)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			m_treeCtrl.DeleteChildren(элт);
		}

		//---------------------------------------------------------------------

		public проц OnDeleteAll(Объект отправитель, Событие e)
		{
			m_treeCtrl.DeleteAllItems();
		}

		//---------------------------------------------------------------------

		public проц OnRecreate(Объект отправитель, Событие e)
		{
			OnDeleteAll(this, e);
			m_treeCtrl.AddTestItemsToTree(5, 2);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстImageSize(Объект отправитель, Событие e)
		{
			цел Размер = GetNumberFromUser("Enter the Размер for the images to use",
					"Размер: ",
					"TreeCtrl sample",
					m_treeCtrl.ImageSize);
			if ( Размер == -1 )
				return;

			m_treeCtrl.CreateImageList(Размер);
			TreeTestApp.ShowImages = да;
		}
		
		//---------------------------------------------------------------------

		public проц OnToggleImages(Объект отправитель, Событие e)
		{
			if ( TreeTestApp.ShowImages )
			{
				m_treeCtrl.CreateImageList(-1);
				TreeTestApp.ShowImages = false;
			}
			else
			{
				m_treeCtrl.CreateImageList(0);
				TreeTestApp.ShowImages = да;
			}
		}
		
		//---------------------------------------------------------------------
		
// 		public проц OnToggleButtons(Объект отправитель, Событие e)
// 		{
// 			if ( TreeTestApp.ShowButtons )
// 			{
// 				m_treeCtrl.CreateButtonsImageList(-1);
// 				TreeTestApp.ShowButtons = false;
// 			}
// 			else
// 			{
// 				m_treeCtrl.CreateButtonsImageList(15);
// 				TreeTestApp.ShowButtons = да;
// 			}
// 		}

		//---------------------------------------------------------------------
		
		public проц OnCollapseAndReset(Объект отправитель, Событие e)
		{
			m_treeCtrl.CollapseAndReset(m_treeCtrl.RootItem);
		}

		//---------------------------------------------------------------------

		public проц OnEnsureVisible(Объект отправитель, Событие e)
		{
			m_treeCtrl.DoEnsureVisible();
		}

		//---------------------------------------------------------------------

		public проц OnInsertItem(Объект отправитель, Событие e)
		{
			цел рисунок = TreeTestApp.ShowImages ? MyTreeCtrl.TreeIcon.File : -1;
			m_treeCtrl.InsertItem(m_treeCtrl.RootItem, рисунок, "2nd элт");
		}

		//---------------------------------------------------------------------

		public проц OnAddItem(Объект отправитель, Событие e)
		{
			ткст текст = "Элемент #" ~ .вТкст(++s_num);

			m_treeCtrl.AppendItem(m_treeCtrl.RootItem, текст);
		}

		//---------------------------------------------------------------------

		public проц OnIncIndent(Объект отправитель, Событие e)
		{
			бцел indent = m_treeCtrl.Indent;
			if (indent < 100)
				m_treeCtrl.Indent = indent + 5;
		}

		//---------------------------------------------------------------------

		public проц OnDecIndent(Объект отправитель, Событие e)
		{
			бцел indent = m_treeCtrl.Indent;
			if (indent > 10)
				m_treeCtrl.Indent = indent-5;
		}

		//---------------------------------------------------------------------

		public проц OnIncSpacing(Объект отправитель, Событие e)
		{
			бцел indent = m_treeCtrl.Spacing;
			if (indent < 100)
				m_treeCtrl.Spacing = indent + 5;
		}

		//---------------------------------------------------------------------

		public проц OnDecSpacing(Объект отправитель, Событие e)
		{
			бцел indent = m_treeCtrl.Spacing;
			if (indent > 10)
				m_treeCtrl.Spacing = indent - 5;
		}

		//---------------------------------------------------------------------

		public проц OnToggleIcon(Объект отправитель, Событие e)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			m_treeCtrl.DoToggleIcon(элт);
		}
		
		//---------------------------------------------------------------------

		public проц OnУстFgColour(Объект отправитель, Событие e)
		{
			Цвет col = GetColourFromUser(this, m_treeCtrl.ЦветПП);
			if ( col.Ок() )
				m_treeCtrl.ЦветПП = col;
		}

		//---------------------------------------------------------------------

		public проц OnУстBgColour(Объект отправитель, Событие e)
		{
			Цвет col = GetColourFromUser(this, m_treeCtrl.ЦветФона);
			if ( col.Ок() )
				m_treeCtrl.ЦветФона = col;
		}

		
		//---------------------------------------------------------------------
		
		public проц OnSort(Объект отправитель, Событие e)
		{
			DoSort(false);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSortRev(Объект отправитель, Событие e)
		{
			DoSort(да);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoSort(бул reverse)
		{
			TreeItemId элт = m_treeCtrl.Selection;

			CHECK_ITEM( элт );

			m_treeCtrl.DoSortChildren(элт, reverse);
		}
		
		//---------------------------------------------------------------------
		
		public проц CHECK_ITEM(TreeItemId элт)
		{
			if ( !элт.Ок() ) 
			{                                 
				MessageBox(this, "Please select some элт first!", 
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

		public this(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль)
		{
			super(родитель, ид, поз, Размер, стиль);
			CreateImageList(16);
			AddTestItemsToTree(5, 2);
			
			EVT_TREE_BEGIN_DRAG(MyFrame.Cmd.TreeTest_Ctrl, &OnBeginDrag);
			EVT_TREE_BEGIN_RDRAG(MyFrame.Cmd.TreeTest_Ctrl, &OnBeginRDrag);
			EVT_TREE_END_DRAG(MyFrame.Cmd.TreeTest_Ctrl, &OnEndDrag);
			EVT_TREE_BEGIN_LABEL_EDIT(MyFrame.Cmd.TreeTest_Ctrl, &OnBeginLabelEdit);
			EVT_TREE_END_LABEL_EDIT(MyFrame.Cmd.TreeTest_Ctrl, &OnEndLabelEdit);
			EVT_TREE_DELETE_ITEM(MyFrame.Cmd.TreeTest_Ctrl, &OnDeleteItem);
			EVT_TREE_SET_INFO(MyFrame.Cmd.TreeTest_Ctrl, &OnУстInfo);
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

		public проц CreateImageList(цел Размер)
		{
			if (Размер == -1)      // signal to turn off images
			{
				УстImageList(null);
				return;
			}

			if (Размер == 0)       // signal to turn on images
				Размер = imageSize;
			else
				imageSize = Размер;

			/* wxBusyCursor wait; */

			ImageList images = new ImageList(Размер, Размер);

			for (цел i = 0; i < 5; ++i)
			{
				Рисунок рисунок = new Рисунок("./data/пиктограмма" ~ .вТкст(i) ~ ".png");
				images.Добавь(new Битмап(рисунок.Rescale(Размер, Размер)));
			}

			AssignImageList(images);
		}

		//---------------------------------------------------------------------

		public проц AddItemsRecursively(TreeItemId idParent, цел numChildren, цел глубь, цел folder)
		{
			if (глубь > 0)
			{
				бул hasChildren = глубь > 1;

				for (цел n = 0; n < numChildren; ++n)
				{
					ткст стр;

					// at глубь 1 elements won't have any more children
					if (hasChildren)
						стр ~= фм("%s child %d", "Folder", n + 1);
					else
						стр ~= фм("%s child %d.%d", "File", folder, n + 1);

					// here we pass to AppendItem() normal and selected элт images (we
					// suppose that selected рисунок follows the normal one in the enum)

					цел рисунок, imageSel;
					if (TreeTestApp.ShowImages)
					{
						рисунок = (глубь == 1) ? TreeIcon.File : TreeIcon.Folder;
						imageSel = рисунок + 1;
					}
					else
					{
						рисунок = -1;
						imageSel = -1;
					}

					TreeItemId ид = AppendItem(idParent, стр, рисунок, imageSel,
						new MyTreeItemData(стр));

					// and now we also set the expanded one (only for the folders)

					if (hasChildren && TreeTestApp.ShowImages)
					{
						УстItemImage(ид, TreeIcon.FolderOpened, TreeItemIcon.wxTreeItemIcon_Expanded);
					}

					// remember the last child for OnEnsureVisible()

					if (!hasChildren && n == numChildren - 1)
					{
						m_lastItem = ид;
					}

					AddItemsRecursively(ид, numChildren, глубь - 1, n + 1);
				}
			}
		}

		//---------------------------------------------------------------------

		public проц AddTestItemsToTree(цел numChildren, цел глубь)
		{
			цел рисунок = TreeTestApp.ShowImages ? TreeIcon.Folder : -1;
			TreeItemId rootId = AddRoot("Root", рисунок, рисунок,
				new MyTreeItemData("Root элт"));
			if (рисунок != -1)
				УстItemImage(rootId, TreeIcon.FolderOpened, TreeItemIcon.wxTreeItemIcon_Expanded);

			AddItemsRecursively(rootId, numChildren, глубь, 0);
			
			УстItemFont(rootId, Шрифт.wxITALIC_FONT);
			
			IntPtr cookie = IntPtr.init;
			TreeItemId ид = GetFirstChild(rootId, cookie);
			УстItemTextColour(ид, Цвет.wxBLUE);

			ид = GetNextChild(rootId, cookie);
			ид = GetNextChild(rootId, cookie);
			УстItemTextColour(ид, Цвет.wxRED);
			УстItemBackgroundColour(ид, Цвет.wxLIGHT_GREY);
		}
		
		//---------------------------------------------------------------------
		
		public проц GetItemsRecursively(TreeItemId idParent, IntPtr cookie)
		{
			TreeItemId ид;

			if ( cookie == IntPtr.init )
				ид = GetFirstChild(idParent, cookie);
			else
				ид = GetNextChild(idParent, cookie);

			if ( !ид.Ок() )
				return;

			ткст текст = GetItemText(ид);
			Log.LogMessage(текст);

			if ( ItemHasChildren(ид) )
				GetItemsRecursively(ид, IntPtr.init);

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
			if (m_lastItem.Ок()) 
				EnsureVisible(m_lastItem);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoToggleIcon(TreeItemId элт)
		{
			цел рисунок = GetItemImage(элт);
			рисунок = рисунок == TreeIcon.Folder ? TreeIcon.File
								: TreeIcon.Folder;

			УстItemImage(элт, рисунок);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnBeginDrag(Объект отправитель, Событие e)
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
				Log.LogMessage("OnBeginDrag: this элт can't be dragged.");
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnBeginRDrag(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnBeginRDrag");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEndDrag(Объект отправитель, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
			
			TreeItemId элтSrc = m_draggedItem;
			TreeItemId элтDst = te.Элемент;
			//m_draggedItem = (wxTreeItemId)0l;

			if ( элтDst.Ок() && !ItemHasChildren(элтDst) )
			{
				элтDst = GetItemParent(элтDst);
			}

			if ( !элтDst.Ок() )
			{
				Log.LogMessage("OnEndDrag: can't drop here.");

				return;
			}

			ткст текст = GetItemText(элтSrc);
			Log.LogMessage("OnEndDrag: '" ~ текст ~ "' copied to '" ~ GetItemText(элтDst) ~ "'.");

			цел рисунок = TreeTestApp.ShowImages ? TreeIcon.File : -1;
			AppendItem(элтDst, текст, рисунок);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnBeginLabelEdit(Объект отправитель, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
			
			Log.LogMessage("OnBeginLabelEdit");

			TreeItemId элтId = te.Элемент;
			if ( IsTestItem(элтId) )
			{
				MessageBox("You can't edit this элт.");

				te.Veto();
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEndLabelEdit(Объект отправитель, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			Log.LogMessage("OnEndLabelEdit");

// 			if ( !te.Ярлык.IsWord() )
// 			{
// 				MessageBox("The new ярлык should be a single word.");
// 
// 				te.Veto();
// 			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDeleteItem(Объект отправитель, Событие e)
		{
// 			Log.LogMessage("OnDeleteItem");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстInfo(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnУстInfo");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemExpanded(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnItemExpanded");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemExpanding(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnItemExpanding");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemCollapsed(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnItemCollapsed");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemCollapsing(Объект отправитель, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			Log.LogMessage("OnItemCollapsing");

			TreeItemId элтId = te.Элемент;
			if ( IsTestItem(элтId) )
			{
				MessageBox("You can't collapse this элт.");

				te.Veto();
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnContextMenu(Объект отправитель, Событие e)
		{
			ContextMenuEvent ce = cast(ContextMenuEvent)e;
		
			Точка тчк = ce.Позиция;
			TreeItemId элт = Selection;
			Log.LogMessage("OnContextMenu at screen coords (" ~ .вТкст(тчк.X) ~ ", " ~ .вТкст(тчк.Y) ~ ")");

			if (тчк.X==-1 && тчк.Y==-1) 
			{
				if (элт.Ок())
				{
					Прямоугольник прям = Прямоугольник(0, 0, 0, 0);
					GetBoundingRect(элт, прям, да); 
					тчк = Точка(прям.Лево, прям.Верх);
				}
				else
				{
					тчк = Точка(0, 0);
				}
			}
			else
			{
				тчк = ЭкранККлиенту(тчк);
			}

			ShowMenu(элт, тчк);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelChanged(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnSelChanged");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelChanging(Объект отправитель, Событие e)
		{
			Log.LogMessage("OnSelChanging");
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnTreeKeyDown(Объект отправитель, Событие e)
		{
		}
		
		//---------------------------------------------------------------------
		
		public проц OnItemActivated(Объект отправитель, Событие e)
		{
			TreeEvent te = cast(TreeEvent)e;
		
			TreeItemId элтId = te.Элемент;
			MyTreeItemData элт = cast(MyTreeItemData)GetItemData(элтId);

			if ( элт )
			{
				элт.ShowInfo(this);
			}

			Log.LogMessage("OnItemActivated");
		}
		
		//---------------------------------------------------------------------
		
		public проц OnRMouseDClick(Объект отправитель, Событие e)
		{
			MouseEvent me = cast(MouseEvent)e;
		
			цел флаги = 0;
			TreeItemId ид = ТестНажатия(me.Позиция, флаги);
			if ( ид is null )
				Log.LogMessage("No элт under mouse");
			else
			{
				MyTreeItemData элт = cast(MyTreeItemData)GetItemData(ид);
				if ( элт )
					Log.LogMessage("Элемент '" ~ элт.Desc ~ "' under mouse");
			}
		}
		
		//---------------------------------------------------------------------
		
		private бул IsTestItem(TreeItemId элт)
		{
			return GetItemParent(элт) == RootItem && (GetPrevSibling(элт) is null);
		}
		
		//---------------------------------------------------------------------
		
		public проц УстLastItem(TreeItemId ид)
		{
			m_lastItem = ид;
		}
		
		//---------------------------------------------------------------------
		
		public проц ShowMenu(TreeItemId ид, Точка тчк)
		{
			ткст title = "";
			if ( ид.Ок() )
			{
				title ~= "Меню for " ~ GetItemText(ид);
			}
			else
			{
				title = "Меню for no particular элт";
			}

			Меню меню = new Меню(title);
			меню.Append(MyFrame.Cmd.TreeTest_About, "&About...");
			меню.Append(MyFrame.Cmd.TreeTest_Dump, "&Dump");

			ВсплывающееМеню(меню, тчк);
		}
		
		//---------------------------------------------------------------------
		
		public проц DoSortChildren(TreeItemId элт, бул reverse)
		{
			m_reverseSort = reverse;
			super.SortChildren(элт);
		}
		
		//---------------------------------------------------------------------
		
		public override цел OnCompareItems(TreeItemId элт1, TreeItemId элт2)
		{
			if ( m_reverseSort )
			{
				return super.OnCompareItems(элт2, элт1);
			}
			else
			{
				return super.OnCompareItems(элт1, элт2);
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
		
		protected ткст Bool2String(бул b)
		{
			return b ? "" : "not";
		}
		
		//---------------------------------------------------------------------
		
		public проц ShowInfo(TreeCtrl tree)
		{
			ткст msg = "Элемент '" ~ m_desc ~ "': ";
			msg ~= Bool2String(tree.IsSelected(Ид)) ~ "selected, ";
			msg ~= Bool2String(tree.IsExpanded(Ид)) ~ "expanded, ";
			msg ~= Bool2String(tree.IsBold(Ид)) ~ "bold,\n";
			msg ~= .вТкст(tree.GetChildrenCount(Ид)) ~ " children (";
			msg ~= .вТкст(tree.GetChildrenCount(Ид, false)) ~ " immediately under this элт).";
		
			Log.LogMessage(msg);
		}
	}


проц main()
{
	TreeTestApp.Main();
}
