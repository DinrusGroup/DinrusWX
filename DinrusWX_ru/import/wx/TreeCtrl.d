module wx.TreeCtrl;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.ImageList;
public import wx.KeyEvent;

	public enum TreeItemIcon
	{
		wxTreeItemIcon_Normal,
		wxTreeItemIcon_Selected,
		wxTreeItemIcon_Expanded,
		wxTreeItemIcon_SelectedExpanded,
		wxTreeItemIcon_Max
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTreeItemData_ctor();
		static extern (C) проц   wxTreeItemData_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxTreeItemData_dtor(IntPtr сам);
		static extern (C) IntPtr wxTreeItemData_GetId(IntPtr сам);
		static extern (C) проц   wxTreeItemData_SetId(IntPtr сам, IntPtr param);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias TreeItemData wxTreeItemData;
	public class TreeItemData : ClientData
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor();
		public TreeItemId Ид() ;
		public проц Ид(TreeItemId значение) ;
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTreeItemAttr_ctor();
		static extern (C) IntPtr wxTreeItemAttr_ctor2(IntPtr colText, IntPtr colBack, IntPtr шрифт);
		static extern (C) проц   wxTreeItemAttr_dtor(IntPtr сам);
		static extern (C) проц   wxTreeItemAttr_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxTreeItemAttr_SetTextColour(IntPtr сам, IntPtr colText);
		static extern (C) проц   wxTreeItemAttr_SetBackgroundColour(IntPtr сам, IntPtr colBack);
		static extern (C) проц   wxTreeItemAttr_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) бул   wxTreeItemAttr_HasTextColour(IntPtr сам);
		static extern (C) бул   wxTreeItemAttr_HasBackgroundColour(IntPtr сам);
		static extern (C) бул   wxTreeItemAttr_HasFont(IntPtr сам);
		static extern (C) IntPtr wxTreeItemAttr_GetTextColour(IntPtr сам);
		static extern (C) IntPtr wxTreeItemAttr_GetBackgroundColour(IntPtr сам);
		static extern (C) IntPtr wxTreeItemAttr_GetFont(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias TreeItemAttr wxTreeItemAttr;
	public class TreeItemAttr : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(Цвет colText, Цвет colBack, Шрифт шрифт);
		override protected проц dtor() ;
		public Цвет ЦветТекста() ;
		public проц ЦветТекста(Цвет значение) ;
		public Цвет ЦветФона() ;
		public проц ЦветФона(Цвет значение) ;
		public Шрифт шрифт() ;
		public проц шрифт(Шрифт значение);
		public бул ЕстьЦветТекста();
		public бул ЕстьЦветФона() ;
		public бул ЕстьШрифт() ;
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTreeItemId_ctor();
		static extern (C) IntPtr wxTreeItemId_ctor2(проц* pItem);
		static extern (C) проц   wxTreeItemId_dtor(IntPtr сам);
		static extern (C) проц   wxTreeItemId_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) бул   wxTreeItemId_Equal(IntPtr элт1, IntPtr элт2);
		static extern (C) бул   wxTreeItemId_IsOk(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	//[StructLayout(LayoutKind.Sequential)]
	alias TreeItemId wxTreeItemId;
	public class TreeItemId : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(/*ClientData*/проц* pItem);
		override protected проц dtor() ;

version (D_Version2) // changed in DMD 2.016
{
		public override бул opEquals(Объект o);
}
else // D_Version1
{
		public override цел opEquals(Объект o);
}

		public override hash_t toHash();
		public бул Ок();
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел function(TreeCtrl объ, IntPtr элт1, IntPtr элт2) Virtual_OnCompareItems;
		}

		static extern (C) бцел   wxTreeCtrl_GetDefaultStyle();
		static extern (C) IntPtr wxTreeCtrl_ctor();
		static extern (C) проц   wxTreeCtrl_RegisterVirtual(IntPtr сам,TreeCtrl объ, Virtual_OnCompareItems onCompareItems);
		static extern (C) цел    wxTreeCtrl_OnCompareItems(IntPtr сам, IntPtr элт1, IntPtr элт2);
		static extern (C) IntPtr wxTreeCtrl_AddRoot(IntPtr сам, ткст текст, цел рисунок, цел selImage, IntPtr data);
		static extern (C) IntPtr wxTreeCtrl_AppendItem(IntPtr сам, IntPtr родитель, ткст текст, цел рисунок, цел selImage, IntPtr data);
		static extern (C) проц   wxTreeCtrl_AssignImageList(IntPtr сам, IntPtr imageList);
		static extern (C) проц   wxTreeCtrl_AssignStateImageList(IntPtr сам, IntPtr imageList);
		//static extern (C) проц   wxTreeCtrl_AssignButtonsImageList(IntPtr сам, IntPtr imageList);
		static extern (C) бул   wxTreeCtrl_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, IntPtr val, ткст имя);
		static extern (C) IntPtr wxTreeCtrl_GetImageList(IntPtr сам);
		static extern (C) IntPtr wxTreeCtrl_GetStateImageList(IntPtr сам);
		//static extern (C) IntPtr wxTreeCtrl_GetButtonsImageList(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_SetImageList(IntPtr сам, IntPtr imageList);
		static extern (C) проц   wxTreeCtrl_SetStateImageList(IntPtr сам, IntPtr imageList);
		//static extern (C) проц   wxTreeCtrl_SetButtonsImageList(IntPtr сам, IntPtr imageList);
		static extern (C) проц   wxTreeCtrl_SetItemImage(IntPtr сам, IntPtr элт, цел рисунок, TreeItemIcon which);
		static extern (C) цел    wxTreeCtrl_GetItemImage(IntPtr сам, IntPtr элт, TreeItemIcon which);

		static extern (C) проц   wxTreeCtrl_DeleteAllItems(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_Delete(IntPtr сам, IntPtr элт);
		static extern (C) проц   wxTreeCtrl_DeleteChildren(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_Unselect(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_UnselectAll(IntPtr сам);

		static extern (C) бул   wxTreeCtrl_IsSelected(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetSelection(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_SelectItem(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_GetItemText(IntPtr сам, IntPtr элт);
		static extern (C) проц   wxTreeCtrl_SetItemText(IntPtr сам, IntPtr элт, ткст текст);

		static extern (C) IntPtr wxTreeCtrl_HitTest(IntPtr сам, inout Точка тчк, inout цел флаги);

		static extern (C) проц   wxTreeCtrl_SetItemData(IntPtr сам, IntPtr элт, IntPtr data);
		static extern (C) IntPtr wxTreeCtrl_GetItemData(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_GetRootItem(IntPtr сам);
		static extern (C) IntPtr wxTreeCtrl_GetItemParent(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_GetFirstChild(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetNextChild(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetLastChild(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_GetNextSibling(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetPrevSibling(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_GetFirstVisibleItem(IntPtr сам);
		static extern (C) IntPtr wxTreeCtrl_GetNextVisible(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetPrevVisible(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_Expand(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_Collapse(IntPtr сам, IntPtr элт);
		static extern (C) проц   wxTreeCtrl_CollapseAndReset(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_Toggle(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_EnsureVisible(IntPtr сам, IntPtr элт);
		static extern (C) проц   wxTreeCtrl_ScrollTo(IntPtr сам, IntPtr элт);

		static extern (C) цел    wxTreeCtrl_GetChildrenCount(IntPtr сам, IntPtr элт, бул recursively);
		static extern (C) цел    wxTreeCtrl_GetCount(IntPtr сам);

		static extern (C) бул   wxTreeCtrl_IsVisible(IntPtr сам, IntPtr элт);

		static extern (C) бул   wxTreeCtrl_ItemHasChildren(IntPtr сам, IntPtr элт);

		static extern (C) бул   wxTreeCtrl_IsExpanded(IntPtr сам, IntPtr элт);

		static extern (C) бцел   wxTreeCtrl_GetIndent(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_SetIndent(IntPtr сам, бцел indent);

		static extern (C) бцел   wxTreeCtrl_GetSpacing(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_SetSpacing(IntPtr сам, бцел indent);

		static extern (C) IntPtr wxTreeCtrl_GetItemTextColour(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetItemBackgroundColour(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeCtrl_GetItemFont(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_SetItemHasChildren(IntPtr сам, IntPtr элт, бул has);
		static extern (C) проц   wxTreeCtrl_SetItemBold(IntPtr сам, IntPtr элт, бул bold);
		static extern (C) проц   wxTreeCtrl_SetItemTextColour(IntPtr сам, IntPtr элт, IntPtr col);
		static extern (C) проц   wxTreeCtrl_SetItemBackgroundColour(IntPtr сам, IntPtr элт, IntPtr col);

		static extern (C) проц   wxTreeCtrl_EditLabel(IntPtr сам, IntPtr элт);

		static extern (C) бул   wxTreeCtrl_GetBoundingRect(IntPtr сам, IntPtr элт, inout Прямоугольник прям, бул textOnly);

		static extern (C) IntPtr wxTreeCtrl_InsertItem(IntPtr сам, IntPtr родитель, IntPtr idPrevious, ткст текст, цел рисунок, цел selectedImage, IntPtr data);
		static extern (C) IntPtr wxTreeCtrl_InsertItem2(IntPtr сам, IntPtr родитель, цел before, ткст текст, цел рисунок, цел selectedImage, IntPtr data);

		static extern (C) бул   wxTreeCtrl_IsBold(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_PrependItem(IntPtr сам, IntPtr родитель, ткст текст, цел рисунок, цел selectedImage, IntPtr data);

		static extern (C) проц   wxTreeCtrl_SetItemSelectedImage(IntPtr сам, IntPtr элт, цел selImage);

		static extern (C) проц   wxTreeCtrl_ToggleItemSelection(IntPtr сам, IntPtr элт);

		static extern (C) проц   wxTreeCtrl_UnselectItem(IntPtr сам, IntPtr элт);

		static extern (C) IntPtr wxTreeCtrl_GetMyCookie(IntPtr сам);
		static extern (C) проц   wxTreeCtrl_SetMyCookie(IntPtr сам, IntPtr newval);

		static extern (C) IntPtr wxTreeCtrl_GetSelections(IntPtr сам);

		static extern (C) проц   wxTreeCtrl_SetItemFont(IntPtr сам, IntPtr элт, IntPtr шрифт);
		static extern (C) проц   wxTreeCtrl_SortChildren(IntPtr сам, IntPtr элт);
		//! \endcond

		//---------------------------------------------------------------------

	alias TreeCtrl wxTreeCtrl;
	public class TreeCtrl : Control
	{
		public const цел wxTR_NO_BUTTONS                = 0x0000;
		public const цел wxTR_HAS_BUTTONS                = 0x0001;
		public const цел wxTR_TWIST_BUTTONS            = 0x0010;
		public const цел wxTR_NO_LINES                    = 0x0004;
		public const цел wxTR_LINES_AT_ROOT             = 0x0008;
		public const цел wxTR_MAC_BUTTONS                = 0; // deprecated
		public const цел wxTR_AQUA_BUTTONS                = 0; // deprecated

		public const цел wxTR_SINGLE                    = 0x0000;
		public const цел wxTR_MULTIPLE                    = 0x0020;
		public const цел wxTR_EXTENDED                    = 0x0040;
		public const цел wxTR_FULL_ROW_HIGHLIGHT         = 0x2000;

		public const цел wxTR_EDIT_LABELS                = 0x0200;
		public const цел wxTR_ROW_LINES                = 0x0400;
		public const цел wxTR_HIDE_ROOT                = 0x0800;
		public const цел wxTR_HAS_VARIABLE_ROW_HEIGHT    = 0x0080;

		public static /*readonly*/ цел wxTR_DEFAULT_STYLE;

		static this()
		{
			wxTR_DEFAULT_STYLE    = wxTreeCtrl_GetDefaultStyle();
		}

		//-----------------------------------------------------------------------------

		public const цел wxTREE_HITTEST_ABOVE           = 0x0001;
		public const цел wxTREE_HITTEST_BELOW           = 0x0002;
		public const цел wxTREE_HITTEST_NOWHERE         = 0x0004;
		public const цел wxTREE_HITTEST_ONITEMBUTTON    = 0x0008;
		public const цел wxTREE_HITTEST_ONITEMICON      = 0x0010;
		public const цел wxTREE_HITTEST_ONITEMINDENT    = 0x0020;
		public const цел wxTREE_HITTEST_ONITEMLABEL     = 0x0040;
		public const цел wxTREE_HITTEST_ONITEMRIGHT     = 0x0080;
		public const цел wxTREE_HITTEST_ONITEMSTATEICON = 0x0100;
		public const цел wxTREE_HITTEST_TOLEFT          = 0x0200;
		public const цел wxTREE_HITTEST_TORIGHT         = 0x0400;
		public const цел wxTREE_HITTEST_ONITEMUPPERPART = 0x0800;
		public const цел wxTREE_HITTEST_ONITEMLOWERPART = 0x1000;

		public const цел wxTREE_HITTEST_ONITEM = wxTREE_HITTEST_ONITEMICON | wxTREE_HITTEST_ONITEMLABEL;

		public const ткст wxTreeCtrlNameStr = "treeCtrl";
		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxTR_HAS_BUTTONS | wxTR_LINES_AT_ROOT, Оценщик val = null, ткст имя = wxTreeCtrlNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxTR_HAS_BUTTONS | wxTR_LINES_AT_ROOT, Оценщик val = null, ткст имя = wxTreeCtrlNameStr);
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, Оценщик val, ткст имя);
		static extern (C) private цел staticDoOnCompareItems(TreeCtrl объ, IntPtr элт1, IntPtr элт2);
		public  цел OnCompareItems(TreeItemId элт1, TreeItemId элт2);
		public TreeItemId AddRoot(ткст текст);
		public TreeItemId AddRoot(ткст текст, цел рисунок);
		public TreeItemId AddRoot(ткст текст, цел рисунок, цел selImage);
		public TreeItemId AddRoot(ткст текст, цел рисунок, цел selImage, TreeItemData data);
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст);
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок);
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок, цел selImage);
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок, цел selImage, TreeItemData data);
		public проц AssignImageList(ImageList imageList);
		public проц AssignStateImageList(ImageList imageList);
		public ImageList imageList() ;
		public проц imageList(ImageList значение) ;
		public проц УстImageList(ImageList imageList);
		public ImageList StateImageList() ;
		public проц StateImageList(ImageList значение) ;
		public проц УстItemImage(TreeItemId элт, цел рисунок);
		public проц УстItemImage(TreeItemId элт, цел рисунок, TreeItemIcon which);
		public цел GetItemImage(TreeItemId элт);
		public цел GetItemImage(TreeItemId элт, TreeItemIcon which);
		public проц DeleteAllItems();
		public проц Delete(TreeItemId элт);
		public проц DeleteChildren(TreeItemId элт);
		public проц Unselect();
		public проц UnselectAll();
		public бул IsSelected(TreeItemId элт);
		public проц SelectItem(TreeItemId элт);
		public TreeItemId Выбор();
		public проц Выбор(TreeItemId значение) ;
		public проц УстItemText(TreeItemId элт, ткст текст);
		public ткст GetItemText(TreeItemId элт);
		public проц УстItemData(TreeItemId элт, TreeItemData data);
		public TreeItemData GetItemData(TreeItemId элт);
		public TreeItemId ТестНажатия(Точка тчк, out цел флаги);
		public TreeItemId RootItem() ;
		public TreeItemId GetItemParent(TreeItemId элт);
		public TreeItemId GetFirstChild(TreeItemId элт, inout IntPtr cookie);
		public TreeItemId GetNextChild(TreeItemId элт, inout IntPtr cookie);
		public TreeItemId GetLastChild(TreeItemId элт);
		public TreeItemId GetNextSibling(TreeItemId элт);
		public TreeItemId GetPrevSibling(TreeItemId элт);
		public TreeItemId GetFirstVisibleItem();
		public TreeItemId GetNextVisible(TreeItemId элт);
		public TreeItemId GetPrevVisible(TreeItemId элт);
		public проц Expand(TreeItemId элт);
		public проц Collapse(TreeItemId элт);
		public проц CollapseAndReset(TreeItemId элт);
		public проц Toggle(TreeItemId элт);
		public проц EnsureVisible(TreeItemId элт);
		public проц ScrollTo(TreeItemId элт);
		public цел GetChildrenCount(TreeItemId элт);
		public цел GetChildrenCount(TreeItemId элт, бул recursively);
		public цел Счёт() ;
		public бул Виден(TreeItemId элт);
		public бул ItemHasChildren(TreeItemId элт);
		public бул IsExpanded(TreeItemId элт);
		public бул HasChildren(TreeItemId элт);
		public TreeItemId[] SelectionsOld();
		public TreeItemId[] Selections();
		public TreeItemId[] SelectionsAtOrBelow(TreeItemId parent_элт);
		public TreeItemId[] SelectionsBelow(TreeItemId parent_элт);
		public TreeItemId[] AllItems();
		public TreeItemId[] AllItemsAtOrBelow(TreeItemId parent_элт);
		public TreeItemId[] AllItemsBelow(TreeItemId parent_элт);
		private enum GetItemsMode
		{
			Selections,
			All,
		}

		private TreeItemId[] Get_Items(GetItemsMode mode, TreeItemId parent_элт,
			бул skip_parent);
		private проц Add_Items(GetItemsMode mode, TreeItemId родитель,
			TreeItemId[] list, IntPtr cookie, бул skip_parent);
		public бцел Indent();
		public проц Indent(бцел значение);
		public бцел Spacing();
		public проц Spacing(бцел значение) ;
		public Цвет GetItemTextColour(TreeItemId элт);
		public Цвет GetItemBackgroundColour(TreeItemId элт);
		public Шрифт GetItemFont(TreeItemId элт);
		public проц УстItemFont(TreeItemId элт, Шрифт шрифт);
		public проц УстItemHasChildren(TreeItemId элт);
		public проц УстItemHasChildren(TreeItemId элт, бул has);
		public проц УстItemBold(TreeItemId элт);
		public проц УстItemBold(TreeItemId элт, бул bold);
		public проц УстItemTextColour(TreeItemId элт, Цвет col);
		public проц УстItemBackgroundColour(TreeItemId элт, Цвет col);
		public проц EditLabel(TreeItemId элт);
		public бул GetBoundingRect(TreeItemId элт, inout Прямоугольник прям);
		public бул GetBoundingRect(TreeItemId элт, inout Прямоугольник прям, бул textOnly);
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст);
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок);
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок, цел sellimage);
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок, цел sellimage, TreeItemData data);
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст);
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок);
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок, цел sellimage);
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок, цел sellimage, TreeItemData data);
		public бул IsBold(TreeItemId элт);
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст);
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок);
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок, цел sellimage);
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок, цел sellimage, TreeItemData data);
		public проц УстItemSelectedImage(TreeItemId элт, цел selImage);
		public проц ToggleItemSelection(TreeItemId элт);
		public проц UnselectItem(TreeItemId элт);
		public проц SortChildren(TreeItemId элт);
		public проц BeginDrag_Add(ДатчикСобытий значение) ;
		public проц BeginDrag_Remove(ДатчикСобытий значение) ;
		public проц BeginRightDrag_Add(ДатчикСобытий значение) ;
		public проц BeginRightDrag_Remove(ДатчикСобытий значение) ;
		public проц BeginLabelEdit_Add(ДатчикСобытий значение) ;
		public проц BeginLabelEdit_Remove(ДатчикСобытий значение) ;
		public проц EndLabelEdit_Add(ДатчикСобытий значение) ;
		public проц EndLabelEdit_Remove(ДатчикСобытий значение) ;
		public проц DeleteItem_Add(ДатчикСобытий значение) ;
		public проц DeleteItem_Remove(ДатчикСобытий значение) ;
		public проц GetInfo_Add(ДатчикСобытий значение);
		public проц GetInfo_Remove(ДатчикСобытий значение) ;
		public проц УстInfo_Add(ДатчикСобытий значение) ;
		public проц УстInfo_Remove(ДатчикСобытий значение) ;
		public проц ItemExpand_Add(ДатчикСобытий значение) ;
		public проц ItemExpand_Remove(ДатчикСобытий значение) ;
		public проц ItemExpanding_Add(ДатчикСобытий значение) ;
		public проц ItemExpanding_Remove(ДатчикСобытий значение) ;
		public проц ItemCollapse_Add(ДатчикСобытий значение) ;
		public проц ItemCollapse_Remove(ДатчикСобытий значение) ;
		public проц ItemCollapsing_Add(ДатчикСобытий значение) ;
		public проц ItemCollapsing_Remove(ДатчикСобытий значение) ;
		public проц SelectionChange_Add(ДатчикСобытий значение) ;
		public проц SelectionChange_Remove(ДатчикСобытий значение) ;
		public проц SelectionChanging_Add(ДатчикСобытий значение) ;
		public проц SelectionChanging_Remove(ДатчикСобытий значение);
		public override проц KeyDown_Add(ДатчикСобытий значение) ;
		public override проц KeyDown_Remove(ДатчикСобытий значение) ;
		public проц ItemActivate_Add(ДатчикСобытий значение) ;
		public проц ItemActivate_Remove(ДатчикСобытий значение) ;
		public проц ItemRightClick_Add(ДатчикСобытий значение) ;
		public проц ItemRightClick_Remove(ДатчикСобытий значение) ;
		public проц ItemMiddleClick_Add(ДатчикСобытий значение) ;
		public проц ItemMiddleClick_Remove(ДатчикСобытий значение) ;
		public проц EndDrag_Add(ДатчикСобытий значение);
		public проц EndDrag_Remove(ДатчикСобытий значение) ;

	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTreeEvent_ctor(цел типКоманды, цел ид);
		static extern (C) IntPtr wxTreeEvent_GetItem(IntPtr сам);
		static extern (C) проц   wxTreeEvent_SetItem(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxTreeEvent_GetOldItem(IntPtr сам);
		static extern (C) проц   wxTreeEvent_SetOldItem(IntPtr сам, IntPtr элт);
		static extern (C) проц   wxTreeEvent_GetPoint(IntPtr сам, inout Точка тчк);
		static extern (C) проц   wxTreeEvent_SetPoint(IntPtr сам, inout Точка тчк);
		static extern (C) IntPtr wxTreeEvent_GetKeyEvent(IntPtr сам);
		static extern (C) цел    wxTreeEvent_GetKeyCode(IntPtr сам);
		static extern (C) проц   wxTreeEvent_SetKeyEvent(IntPtr сам, IntPtr evt);
		static extern (C) IntPtr wxTreeEvent_GetLabel(IntPtr сам);
		static extern (C) проц   wxTreeEvent_SetLabel(IntPtr сам, ткст ярлык);
		static extern (C) бул   wxTreeEvent_IsEditCancelled(IntPtr сам);
		static extern (C) проц   wxTreeEvent_SetEditCanceled(IntPtr сам, бул editCancelled);
		//static extern (C) цел    wxTreeEvent_GetCode(IntPtr сам);
		static extern (C) проц   wxTreeEvent_Veto(IntPtr сам);
		static extern (C) проц   wxTreeEvent_Allow(IntPtr сам);
		static extern (C) бул   wxTreeEvent_IsAllowed(IntPtr сам);

		static extern (C) проц   wxTreeEvent_SetToolTip(IntPtr сам, ткст тулТип);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias TreeEvent wxTreeEvent;
	public class TreeEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(цел типКоманды, цел ид);
		public TreeItemId Элемент() ;
		public проц Элемент(TreeItemId значение) ;
		public TreeItemId OldItem() ;
		public проц OldItem(TreeItemId значение) ;
		public Точка точка();
		public проц точка(Точка значение);
		public KeyEvent keyEvent();
		public проц keyEvent(KeyEvent значение) ;
		public цел КодКл();
		public ткст Ярлык() ;
		public проц Ярлык(ткст значение) ;
		public бул IsEditCancelled() ;
		public проц IsEditCancelled(бул значение) ;
		public проц ToolTip(ткст значение) ;
		public проц Veto();
		public проц Allow();
		public бул Allowed() ;
		private static Событие Нов(IntPtr объ) ;
		static this();
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxArrayTreeItemIds_ctor();
		static extern (C) проц   wxArrayTreeItemIds_dtor(IntPtr сам);
		static extern (C) проц   wxArrayTreeItemIds_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxArrayTreeItemIds_Add(IntPtr сам, IntPtr доб);
		static extern (C) IntPtr wxArrayTreeItemIds_Item(IntPtr сам, цел чис);
		static extern (C) цел    wxArrayTreeItemIds_GetCount(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias ArrayTreeItemIds wxArrayTreeItemIds;
	public class ArrayTreeItemIds : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public TreeItemId[] вМассив();
		public TreeItemId Элемент(цел чис);
		public проц Добавь(TreeItemId доб);
		public цел Счёт() ;
		override protected проц dtor();
	}
