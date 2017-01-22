//-----------------------------------------------------------------------------
// wxD - TreeCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TreeCtrl.cs
//
/// The wxTreeCtrl wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TreeCtrl.d,v 1.13 2008/09/26 09:40:42 afb Exp $
//-----------------------------------------------------------------------------

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
		static extern (C) ЦУк wxTreeItemData_ctor();
		static extern (C) проц   wxTreeItemData_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxTreeItemData_dtor(ЦУк сам);
		static extern (C) ЦУк wxTreeItemData_GetId(ЦУк сам);
		static extern (C) проц   wxTreeItemData_SetId(ЦУк сам, ЦУк param);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias TreeItemData wxTreeItemData;
	public class TreeItemData : ClientData
	{
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
		{
			this(wxTreeItemData_ctor(), да);
			wxTreeItemData_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------
		override protected проц dtor() { wxTreeItemData_dtor(шхобъ); }
				
		//-----------------------------------------------------------------------------

		public TreeItemId Ид() { return new TreeItemId(wxTreeItemData_GetId(шхобъ), да); }
		public проц Ид(TreeItemId значение) { wxTreeItemData_SetId(шхобъ, wxObject.SafePtr(значение)); }
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxTreeItemAttr_ctor();
		static extern (C) ЦУк wxTreeItemAttr_ctor2(ЦУк colText, ЦУк colBack, ЦУк шрифт);
		static extern (C) проц   wxTreeItemAttr_dtor(ЦУк сам);
		static extern (C) проц   wxTreeItemAttr_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxTreeItemAttr_SetTextColour(ЦУк сам, ЦУк colText);
		static extern (C) проц   wxTreeItemAttr_SetBackgroundColour(ЦУк сам, ЦУк colBack);
		static extern (C) проц   wxTreeItemAttr_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) бул   wxTreeItemAttr_HasTextColour(ЦУк сам);
		static extern (C) бул   wxTreeItemAttr_HasBackgroundColour(ЦУк сам);
		static extern (C) бул   wxTreeItemAttr_HasFont(ЦУк сам);
		static extern (C) ЦУк wxTreeItemAttr_GetTextColour(ЦУк сам);
		static extern (C) ЦУк wxTreeItemAttr_GetBackgroundColour(ЦУк сам);
		static extern (C) ЦУк wxTreeItemAttr_GetFont(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias TreeItemAttr wxTreeItemAttr;
	public class TreeItemAttr : wxObject
	{
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
		{
			this(wxTreeItemAttr_ctor(), да);
			wxTreeItemAttr_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		public this(Цвет colText, Цвет colBack, Шрифт шрифт)
		{
			this(wxTreeItemAttr_ctor2(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт)), да);
			wxTreeItemAttr_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxTreeItemAttr_dtor(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public Цвет TextColour() { return new Цвет(wxTreeItemAttr_GetTextColour(шхобъ), да); }
		public проц TextColour(Цвет значение) { wxTreeItemAttr_SetTextColour(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public Цвет ЦветЗП() { return new Цвет(wxTreeItemAttr_GetBackgroundColour(шхобъ), да); }
		public проц ЦветЗП(Цвет значение) { wxTreeItemAttr_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public Шрифт шрифт() { return new Шрифт(wxTreeItemAttr_GetFont(шхобъ), да); }
		public проц шрифт(Шрифт значение) { wxTreeItemAttr_SetFont(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public бул HasTextColour() { return wxTreeItemAttr_HasTextColour(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasBackgroundColour() { return wxTreeItemAttr_HasBackgroundColour(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasFont() { return wxTreeItemAttr_HasFont(шхобъ); }
	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxTreeItemId_ctor();
		static extern (C) ЦУк wxTreeItemId_ctor2(проц* pItem);
		static extern (C) проц   wxTreeItemId_dtor(ЦУк сам);
		static extern (C) проц   wxTreeItemId_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) бул   wxTreeItemId_Equal(ЦУк item1, ЦУк item2);
		static extern (C) бул   wxTreeItemId_IsOk(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------

	//[StructLayout(LayoutKind.Sequential)]
	alias TreeItemId wxTreeItemId;
	public class TreeItemId : wxObject
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{
			super(шхобъ);
			this.memOwn = memOwn;
			wxTreeItemId_RegisterDisposable(шхобъ, &VirtualDispose);
		}

		public this()
		{
			this(wxTreeItemId_ctor(), да);
		}
		
		public this(/*ClientData*/проц* pItem)
		{
			this(wxTreeItemId_ctor2(pItem), да);
		}
		
		//---------------------------------------------------------------------

		override protected проц dtor() { wxTreeItemId_dtor(шхобъ); }
		
		//---------------------------------------------------------------------
		
		//-----------------------------------------------------------------------------

		/*private ЦУк ид;

		public this(ЦУк ид)
		{ this.ид = ид; }*/

		//-----------------------------------------------------------------------------

version (D_Version2) // changed in DMD 2.016
{
		public override бул opEquals(Объект o)
		{
			if (o is пусто) return нет;
			TreeItemId ид = cast(TreeItemId)o;
			if (ид is пусто) return нет;
			if (ид is this || шхобъ == ид.шхобъ) return да;
			return wxTreeItemId_Equal(шхобъ, ид.шхобъ);
		}
}
else // D_Version1
{
		public override цел opEquals(Объект o)
		{
			if (o is пусто) return нет;
			TreeItemId ид = cast(TreeItemId)o;
			if (ид is пусто) return нет;
			if (ид is this || шхобъ == ид.шхобъ) return да;
			return wxTreeItemId_Equal(шхобъ, ид.шхобъ);
		}
}
		
		//-----------------------------------------------------------------------------

		public override hash_t toHash()
		{
			return cast(hash_t)шхобъ;
		}
		
		//-----------------------------------------------------------------------------

		/*public бул IsValid
		{
			get { return ид != ЦУк.init; }
		}*/
		
		//-----------------------------------------------------------------------------
		
		public бул IsOk()
		{
			return wxTreeItemId_IsOk(шхобъ);
		}
	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел function(TreeCtrl объ, ЦУк item1, ЦУк item2) Virtual_OnCompareItems;
		}
		
		static extern (C) бцел   wxTreeCtrl_GetDefaultStyle();
		static extern (C) ЦУк wxTreeCtrl_ctor();
		static extern (C) проц   wxTreeCtrl_RegisterVirtual(ЦУк сам,TreeCtrl объ, Virtual_OnCompareItems onCompareItems);
		static extern (C) цел    wxTreeCtrl_OnCompareItems(ЦУк сам, ЦУк item1, ЦУк item2);
		static extern (C) ЦУк wxTreeCtrl_AddRoot(ЦУк сам, ткст текст, цел рисунок, цел selImage, ЦУк данные);
		static extern (C) ЦУк wxTreeCtrl_AppendItem(ЦУк сам, ЦУк родитель, ткст текст, цел рисунок, цел selImage, ЦУк данные);
		static extern (C) проц   wxTreeCtrl_AssignImageList(ЦУк сам, ЦУк imageList);
		static extern (C) проц   wxTreeCtrl_AssignStateImageList(ЦУк сам, ЦУк imageList);
		//static extern (C) проц   wxTreeCtrl_AssignButtonsImageList(ЦУк сам, ЦУк imageList);
		static extern (C) бул   wxTreeCtrl_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ЦУк val, ткст имя);
		static extern (C) ЦУк wxTreeCtrl_GetImageList(ЦУк сам);
		static extern (C) ЦУк wxTreeCtrl_GetStateImageList(ЦУк сам);
		//static extern (C) ЦУк wxTreeCtrl_GetButtonsImageList(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_SetImageList(ЦУк сам, ЦУк imageList);
		static extern (C) проц   wxTreeCtrl_SetStateImageList(ЦУк сам, ЦУк imageList);
		//static extern (C) проц   wxTreeCtrl_SetButtonsImageList(ЦУк сам, ЦУк imageList);
		static extern (C) проц   wxTreeCtrl_SetItemImage(ЦУк сам, ЦУк элемент, цел рисунок, TreeItemIcon which);
		static extern (C) цел    wxTreeCtrl_GetItemImage(ЦУк сам, ЦУк элемент, TreeItemIcon which);

		static extern (C) проц   wxTreeCtrl_DeleteAllItems(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_Delete(ЦУк сам, ЦУк элемент);
		static extern (C) проц   wxTreeCtrl_DeleteChildren(ЦУк сам, ЦУк элемент);

		static extern (C) проц   wxTreeCtrl_Unselect(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_UnselectAll(ЦУк сам);

		static extern (C) бул   wxTreeCtrl_IsSelected(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetSelection(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_SelectItem(ЦУк сам, ЦУк элемент);

		static extern (C) ЦУк wxTreeCtrl_GetItemText(ЦУк сам, ЦУк элемент);
		static extern (C) проц   wxTreeCtrl_SetItemText(ЦУк сам, ЦУк элемент, ткст текст);

		static extern (C) ЦУк wxTreeCtrl_HitTest(ЦУк сам, inout Точка pt, inout цел флаги);

		static extern (C) проц   wxTreeCtrl_SetItemData(ЦУк сам, ЦУк элемент, ЦУк данные);
		static extern (C) ЦУк wxTreeCtrl_GetItemData(ЦУк сам, ЦУк элемент);

		static extern (C) ЦУк wxTreeCtrl_GetRootItem(ЦУк сам);
		static extern (C) ЦУк wxTreeCtrl_GetItemParent(ЦУк сам, ЦУк элемент);

		static extern (C) ЦУк wxTreeCtrl_GetFirstChild(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetNextChild(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetLastChild(ЦУк сам, ЦУк элемент);

		static extern (C) ЦУк wxTreeCtrl_GetNextSibling(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetPrevSibling(ЦУк сам, ЦУк элемент);

		static extern (C) ЦУк wxTreeCtrl_GetFirstVisibleItem(ЦУк сам);
		static extern (C) ЦУк wxTreeCtrl_GetNextVisible(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetPrevVisible(ЦУк сам, ЦУк элемент);

		static extern (C) проц   wxTreeCtrl_Expand(ЦУк сам, ЦУк элемент);

		static extern (C) проц   wxTreeCtrl_Collapse(ЦУк сам, ЦУк элемент);
		static extern (C) проц   wxTreeCtrl_CollapseAndReset(ЦУк сам, ЦУк элемент);

		static extern (C) проц   wxTreeCtrl_Toggle(ЦУк сам, ЦУк элемент);

		static extern (C) проц   wxTreeCtrl_EnsureVisible(ЦУк сам, ЦУк элемент);
		static extern (C) проц   wxTreeCtrl_ScrollTo(ЦУк сам, ЦУк элемент);

		static extern (C) цел    wxTreeCtrl_GetChildrenCount(ЦУк сам, ЦУк элемент, бул recursively);
		static extern (C) цел    wxTreeCtrl_GetCount(ЦУк сам);

		static extern (C) бул   wxTreeCtrl_IsVisible(ЦУк сам, ЦУк элемент);

		static extern (C) бул   wxTreeCtrl_ItemHasChildren(ЦУк сам, ЦУк элемент);

		static extern (C) бул   wxTreeCtrl_IsExpanded(ЦУк сам, ЦУк элемент);
		
		static extern (C) бцел   wxTreeCtrl_GetIndent(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_SetIndent(ЦУк сам, бцел indent);
		
		static extern (C) бцел   wxTreeCtrl_GetSpacing(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_SetSpacing(ЦУк сам, бцел indent);
		
		static extern (C) ЦУк wxTreeCtrl_GetItemTextColour(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetItemBackgroundColour(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeCtrl_GetItemFont(ЦУк сам, ЦУк элемент);
		
		static extern (C) проц   wxTreeCtrl_SetItemHasChildren(ЦУк сам, ЦУк элемент, бул has);
		static extern (C) проц   wxTreeCtrl_SetItemBold(ЦУк сам, ЦУк элемент, бул bold);
		static extern (C) проц   wxTreeCtrl_SetItemTextColour(ЦУк сам, ЦУк элемент, ЦУк col);
		static extern (C) проц   wxTreeCtrl_SetItemBackgroundColour(ЦУк сам, ЦУк элемент, ЦУк col);
		
		static extern (C) проц   wxTreeCtrl_EditLabel(ЦУк сам, ЦУк элемент);
		
		static extern (C) бул   wxTreeCtrl_GetBoundingRect(ЦУк сам, ЦУк элемент, inout Прямоугольник прям, бул textOnly);
		
		static extern (C) ЦУк wxTreeCtrl_InsertItem(ЦУк сам, ЦУк родитель, ЦУк idPrevious, ткст текст, цел рисунок, цел selectedImage, ЦУк данные);
		static extern (C) ЦУк wxTreeCtrl_InsertItem2(ЦУк сам, ЦУк родитель, цел before, ткст текст, цел рисунок, цел selectedImage, ЦУк данные);
		
		static extern (C) бул   wxTreeCtrl_IsBold(ЦУк сам, ЦУк элемент);
		
		static extern (C) ЦУк wxTreeCtrl_PrependItem(ЦУк сам, ЦУк родитель, ткст текст, цел рисунок, цел selectedImage, ЦУк данные);
		
		static extern (C) проц   wxTreeCtrl_SetItemSelectedImage(ЦУк сам, ЦУк элемент, цел selImage);
		
		static extern (C) проц   wxTreeCtrl_ToggleItemSelection(ЦУк сам, ЦУк элемент);
		
		static extern (C) проц   wxTreeCtrl_UnselectItem(ЦУк сам, ЦУк элемент);
		
		static extern (C) ЦУк wxTreeCtrl_GetMyCookie(ЦУк сам);
		static extern (C) проц   wxTreeCtrl_SetMyCookie(ЦУк сам, ЦУк newval);
		
		static extern (C) ЦУк wxTreeCtrl_GetSelections(ЦУк сам);
		
		static extern (C) проц   wxTreeCtrl_SetItemFont(ЦУк сам, ЦУк элемент, ЦУк шрифт);
		static extern (C) проц   wxTreeCtrl_SortChildren(ЦУк сам, ЦУк элемент);
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
		
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this()
		{ 
			this(wxTreeCtrl_ctor());
			wxTreeCtrl_RegisterVirtual(шхобъ, this, &staticDoOnCompareItems);
		}

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxTR_HAS_BUTTONS | wxTR_LINES_AT_ROOT, Validator val = пусто, ткст имя = wxTreeCtrlNameStr)
		{
			this();
			if (!Create(родитель, ид, поз, size, стиль, val, имя)) 
			{
				throw new InvalidOperationException("Could not create TreeCtrl");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ)
		{
			return new TreeCtrl(шхобъ);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxTR_HAS_BUTTONS | wxTR_LINES_AT_ROOT, Validator val = пусто, ткст имя = wxTreeCtrlNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, val, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, Validator val, ткст имя)
		{
			return wxTreeCtrl_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, wxObject.SafePtr(val), имя);
		}

		//---------------------------------------------------------------------
		
		static extern (C) private цел staticDoOnCompareItems(TreeCtrl объ, ЦУк item1, ЦУк item2)
		{
			return объ.OnCompareItems(new TreeItemId(item1, да), new TreeItemId(item2, да));
		}
		
		public /+virtual+/ цел OnCompareItems(TreeItemId item1, TreeItemId item2)
		{
			return wxTreeCtrl_OnCompareItems(шхобъ, wxObject.SafePtr(item1), wxObject.SafePtr(item2));
		}
		
		//---------------------------------------------------------------------

		public TreeItemId AddRoot(ткст текст)
		{ 
			return AddRoot(текст, -1, -1, пусто); 
		}
		
		public TreeItemId AddRoot(ткст текст, цел рисунок)
		{ 
			return AddRoot(текст, рисунок, -1, пусто); 
		}
		
		public TreeItemId AddRoot(ткст текст, цел рисунок, цел selImage)
		{ 
			return AddRoot(текст, рисунок, selImage, пусто); 
		}
		
		public TreeItemId AddRoot(ткст текст, цел рисунок, цел selImage, TreeItemData данные)
		{
			return new TreeItemId(wxTreeCtrl_AddRoot(шхобъ, текст, рисунок, selImage, wxObject.SafePtr(данные)), да);
		}

		//---------------------------------------------------------------------

		public TreeItemId AppendItem(TreeItemId parentId, ткст текст)
		{ 
			return AppendItem(parentId, текст, -1, -1, пусто); 
		}
		
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок)
		{ 
			return AppendItem(parentId, текст, рисунок, -1, пусто); 
		}
		
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок, цел selImage)
		{ 
			return AppendItem(parentId, текст, рисунок, selImage, пусто); 
		}
		
		public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок, цел selImage, TreeItemData данные)
		{
			return new TreeItemId(wxTreeCtrl_AppendItem(шхобъ, wxObject.SafePtr(parentId), текст, рисунок, selImage, wxObject.SafePtr(данные)), да);
		}

		//---------------------------------------------------------------------

		public проц AssignImageList(ImageList imageList)
		{
			wxTreeCtrl_AssignImageList(шхобъ, wxObject.SafePtr(imageList));
		}
		
		//---------------------------------------------------------------------

		public проц AssignStateImageList(ImageList imageList)
		{
			wxTreeCtrl_AssignStateImageList(шхобъ, wxObject.SafePtr(imageList));
		}
		
		//---------------------------------------------------------------------

		/*public проц AssignButtonsImageList(ImageList imageList)
		{
			wxTreeCtrl_AssignButtonsImageList(шхобъ, wxObject.SafePtr(imageList));
		}*/

		//---------------------------------------------------------------------

		public ImageList imageList() { return cast(ImageList)FindObject(wxTreeCtrl_GetImageList(шхобъ), &ImageList.Нов); }
			
		public проц imageList(ImageList значение) { wxTreeCtrl_SetImageList(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------

		public проц SetImageList(ImageList imageList)
		{
			wxTreeCtrl_SetImageList(шхобъ, wxObject.SafePtr(imageList));
		}
		
		//---------------------------------------------------------------------
		
		public ImageList StateImageList() { return cast(ImageList)FindObject(wxTreeCtrl_GetStateImageList(шхобъ), &ImageList.Нов); }
			
		public проц StateImageList(ImageList значение) { wxTreeCtrl_SetStateImageList(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		/*public ImageList ButtonsImageList
		{
			get { return (ImageList)FindObject(wxTreeCtrl_GetButtonsImageList(шхобъ), typeid(ImageList)); }
			
			set { wxTreeCtrl_SetButtonsImageList(шхобъ, wxObject.SafePtr(значение)); }
		}*/

		//---------------------------------------------------------------------
		
		public проц SetItemImage(TreeItemId элемент, цел рисунок)
		{
			SetItemImage(элемент, рисунок, TreeItemIcon.wxTreeItemIcon_Normal);
		}

		public проц SetItemImage(TreeItemId элемент, цел рисунок, TreeItemIcon which)
		{
			wxTreeCtrl_SetItemImage(шхобъ, wxObject.SafePtr(элемент), рисунок, which);
		}

		//---------------------------------------------------------------------
		
		public цел GetItemImage(TreeItemId элемент)
		{
			return GetItemImage(элемент, TreeItemIcon.wxTreeItemIcon_Normal);
		}

		public цел GetItemImage(TreeItemId элемент, TreeItemIcon which)
		{
			return wxTreeCtrl_GetItemImage(шхобъ, wxObject.SafePtr(элемент), which);
		}

		//---------------------------------------------------------------------

		public проц DeleteAllItems()
		{
			wxTreeCtrl_DeleteAllItems(шхобъ);
		}

		public проц Delete(TreeItemId элемент)
		{
			wxTreeCtrl_Delete(шхобъ, wxObject.SafePtr(элемент));
		}

		public проц DeleteChildren(TreeItemId элемент)
		{
			wxTreeCtrl_DeleteChildren(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public проц Unselect()
		{
			wxTreeCtrl_Unselect(шхобъ);
		}

		public проц UnselectAll()
		{
			wxTreeCtrl_UnselectAll(шхобъ);
		}

		//---------------------------------------------------------------------

		public бул IsSelected(TreeItemId элемент)
		{
			return wxTreeCtrl_IsSelected(шхобъ, wxObject.SafePtr(элемент));
		}

		public проц SelectItem(TreeItemId элемент)
		{
			wxTreeCtrl_SelectItem(шхобъ, wxObject.SafePtr(элемент));
		}

		public TreeItemId Selection() { return new TreeItemId(wxTreeCtrl_GetSelection(шхобъ), да); }
		public проц Selection(TreeItemId значение) { SelectItem(значение); }

		//---------------------------------------------------------------------

		public проц SetItemText(TreeItemId элемент, ткст текст)
		{
			wxTreeCtrl_SetItemText(шхобъ, wxObject.SafePtr(элемент), текст);
		}

		public ткст GetItemText(TreeItemId элемент)
		{
			return cast(ткст) new wxString(wxTreeCtrl_GetItemText(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		//---------------------------------------------------------------------

		public проц SetItemData(TreeItemId элемент, TreeItemData данные)
		{
			wxTreeCtrl_SetItemData(шхобъ, wxObject.SafePtr(элемент), wxObject.SafePtr(данные));
		}

		public TreeItemData GetItemData(TreeItemId элемент)
		{
			return cast(TreeItemData)wxObject.FindObject(wxTreeCtrl_GetItemData(шхобъ, wxObject.SafePtr(элемент)));
		}

		//---------------------------------------------------------------------
        
		public TreeItemId HitTest(Точка pt, out цел флаги)
		{
			return new TreeItemId(wxTreeCtrl_HitTest(шхобъ, pt, флаги), да);
		}

		//---------------------------------------------------------------------

		public TreeItemId RootItem() { return new TreeItemId(wxTreeCtrl_GetRootItem(шхобъ), да); }

		public TreeItemId GetItemParent(TreeItemId элемент)
		{
			return new TreeItemId(wxTreeCtrl_GetItemParent(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		//---------------------------------------------------------------------
        
		public TreeItemId GetFirstChild(TreeItemId элемент, inout ЦУк cookie)
		{
			TreeItemId ид = new TreeItemId(wxTreeCtrl_GetFirstChild(шхобъ, wxObject.SafePtr(элемент)), да);
			
			cookie = wxTreeCtrl_GetMyCookie(шхобъ);
			
			return ид;
		}

		public TreeItemId GetNextChild(TreeItemId элемент, inout ЦУк cookie)
		{
			wxTreeCtrl_SetMyCookie(шхобъ, cookie);
			
			TreeItemId ид = new TreeItemId(wxTreeCtrl_GetNextChild(шхобъ, wxObject.SafePtr(элемент)), да);
			
			cookie =  wxTreeCtrl_GetMyCookie(шхобъ);
			
			return ид;
		}

		public TreeItemId GetLastChild(TreeItemId элемент)
		{
			return new TreeItemId(wxTreeCtrl_GetLastChild(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		//---------------------------------------------------------------------

		public TreeItemId GetNextSibling(TreeItemId элемент)
		{
			return new TreeItemId(wxTreeCtrl_GetNextSibling(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		public TreeItemId GetPrevSibling(TreeItemId элемент)
		{
			return new TreeItemId(wxTreeCtrl_GetPrevSibling(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		//---------------------------------------------------------------------

		public TreeItemId GetFirstVisibleItem()
		{
			return new TreeItemId(wxTreeCtrl_GetFirstVisibleItem(шхобъ), да);
		}

		public TreeItemId GetNextVisible(TreeItemId элемент)
		{
			return new TreeItemId(wxTreeCtrl_GetNextVisible(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		public TreeItemId GetPrevVisible(TreeItemId элемент)
		{
			return new TreeItemId(wxTreeCtrl_GetPrevVisible(шхобъ, wxObject.SafePtr(элемент)), да);
		}

		//---------------------------------------------------------------------

		public проц Expand(TreeItemId элемент)
		{
			wxTreeCtrl_Expand(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public проц Collapse(TreeItemId элемент)
		{
			wxTreeCtrl_Collapse(шхобъ, wxObject.SafePtr(элемент));
		}

		public проц CollapseAndReset(TreeItemId элемент)
		{
			wxTreeCtrl_CollapseAndReset(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public проц Toggle(TreeItemId элемент)
		{
			wxTreeCtrl_Toggle(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public проц EnsureVisible(TreeItemId элемент)
		{
			wxTreeCtrl_EnsureVisible(шхобъ, wxObject.SafePtr(элемент));
		}

		public проц ScrollTo(TreeItemId элемент)
		{
			wxTreeCtrl_ScrollTo(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------
		
		public цел GetChildrenCount(TreeItemId элемент)
		{
			return GetChildrenCount(элемент, да);
		}

		public цел GetChildrenCount(TreeItemId элемент, бул recursively)
		{
			return wxTreeCtrl_GetChildrenCount(шхобъ, wxObject.SafePtr(элемент), recursively);
		}

		public цел Счёт() { return wxTreeCtrl_GetCount(шхобъ); }

		//---------------------------------------------------------------------

		public бул IsVisible(TreeItemId элемент)
		{
			return wxTreeCtrl_IsVisible(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public бул ItemHasChildren(TreeItemId элемент)
		{
			return wxTreeCtrl_ItemHasChildren(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public бул IsExpanded(TreeItemId элемент)
		{
			return wxTreeCtrl_IsExpanded(шхобъ, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public бул HasChildren(TreeItemId элемент)
		{
			return GetChildrenCount(элемент, нет) > 0;
		}

		// A brute force way to get list of selections (if wxTR_MULTIPLE has been
		// enabled) by inspecting each элемент. May want to replace with Interop
		// invocation of GetSelections() if it is implemented more efficiently
		// (such as the TreeCtrl has a built-in list of currect selections).
		public TreeItemId[] SelectionsOld()
		{
			return Get_Items(GetItemsMode.Selections, this.RootItem, да);
		}
		
		// This is now interop...
		public TreeItemId[] Selections()
		{
			return (new ArrayTreeItemIds(wxTreeCtrl_GetSelections(шхобъ), да)).вМассив();
		}

		// This is an addition to the standard API. Limits the selection
		// search to parent_item and below.
		public TreeItemId[] SelectionsAtOrBelow(TreeItemId parent_item)
		{
			return Get_Items(GetItemsMode.Selections, parent_item, нет);
		}

		// This is an addition to the standard API. Limits the selection
		// search to those items below parent_item.
		public TreeItemId[] SelectionsBelow(TreeItemId parent_item)
		{
			return Get_Items(GetItemsMode.Selections, parent_item, да);
		}

		// This is an addition to the standard API. Returns all items
		// except for the root node.
		public TreeItemId[] AllItems()
		{
			return Get_Items(GetItemsMode.All, this.RootItem, да);
		}

		// This is an addition to the standard API. Only returns items
		// that are at or below parent_item (i.e. returns parent_item).
		public TreeItemId[] AllItemsAtOrBelow(TreeItemId parent_item)
		{
			return Get_Items(GetItemsMode.All, parent_item, нет);
		}

		// This is an addition to the standard API. Only returns items
		// that are below parent_item.
		public TreeItemId[] AllItemsBelow(TreeItemId parent_item)
		{
			return Get_Items(GetItemsMode.All, parent_item, да);
		}

		private enum GetItemsMode
		{
			Selections,
			All,
		}

		private TreeItemId[] Get_Items(GetItemsMode mode, TreeItemId parent_item, 
			бул skip_parent)
		{
			// Console.WriteLine("---");
			TreeItemId[] list;
			Add_Items(mode, parent_item, list, ЦУк.init, skip_parent);
			return list;
		}

		private проц Add_Items(GetItemsMode mode, TreeItemId родитель, 
			TreeItemId[] list, ЦУк cookie, бул skip_parent)
		{
			TreeItemId ид;

			if ( cookie == ЦУк.init)
			{
				if ( (! skip_parent) && 
					((mode == GetItemsMode.All) || (this.IsSelected(родитель))))
				{
					// Console.WriteLine(this.GetItemText(родитель));
					list ~= родитель;
				}
				ид = GetFirstChild(родитель, cookie);
			}
			else
			{
				ид = GetNextChild(родитель, cookie);
			}

			if ( ! ид.IsOk() )
				return;

			if ((mode == GetItemsMode.All) || (this.IsSelected(ид)))
			{
				// Console.WriteLine(this.GetItemText(ид));
				list ~= ид;
			}

			if (ItemHasChildren(ид))
			{
				Add_Items(mode, ид, list, ЦУк.init, нет);
			}

			Add_Items(mode, родитель, list, cookie, нет);
		}
		
		//---------------------------------------------------------------------
		
		public бцел Indent() { return wxTreeCtrl_GetIndent(шхобъ); }
		public проц Indent(бцел значение) { wxTreeCtrl_SetIndent(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public бцел Spacing() { return wxTreeCtrl_GetSpacing(шхобъ); }
		public проц Spacing(бцел значение) { wxTreeCtrl_SetSpacing(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public Цвет GetItemTextColour(TreeItemId элемент)
		{
			return new Цвет(wxTreeCtrl_GetItemTextColour(шхобъ, wxObject.SafePtr(элемент)), да);
		}
		
		//---------------------------------------------------------------------
		
		public Цвет GetItemBackgroundColour(TreeItemId элемент)
		{
			return new Цвет(wxTreeCtrl_GetItemBackgroundColour(шхобъ, wxObject.SafePtr(элемент)), да);
		}
		
		//---------------------------------------------------------------------
		
		public Шрифт GetItemFont(TreeItemId элемент)
		{
			return new Шрифт(wxTreeCtrl_GetItemFont(шхобъ, wxObject.SafePtr(элемент)), да);
		}
		
		public проц SetItemFont(TreeItemId элемент, Шрифт шрифт)
		{
			wxTreeCtrl_SetItemFont(шхобъ, wxObject.SafePtr(элемент), wxObject.SafePtr(шрифт));
		}

		//---------------------------------------------------------------------
		
		public проц SetItemHasChildren(TreeItemId элемент)
		{
			SetItemHasChildren(элемент, да);
		}
		
		public проц SetItemHasChildren(TreeItemId элемент, бул has)
		{
			wxTreeCtrl_SetItemHasChildren(шхобъ, wxObject.SafePtr(элемент), has);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetItemBold(TreeItemId элемент)
		{
			SetItemBold(элемент, да);
		}
		
		public проц SetItemBold(TreeItemId элемент, бул bold)
		{
			wxTreeCtrl_SetItemBold(шхобъ, wxObject.SafePtr(элемент), bold);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetItemTextColour(TreeItemId элемент, Цвет col)
		{
			wxTreeCtrl_SetItemTextColour(шхобъ, wxObject.SafePtr(элемент), wxObject.SafePtr(col));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetItemBackgroundColour(TreeItemId элемент, Цвет col)
		{
			wxTreeCtrl_SetItemBackgroundColour(шхобъ, wxObject.SafePtr(элемент), wxObject.SafePtr(col));
		}
		
		//---------------------------------------------------------------------
		
		public проц EditLabel(TreeItemId элемент)
		{
			wxTreeCtrl_EditLabel(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		
		public бул GetBoundingRect(TreeItemId элемент, inout Прямоугольник прям)
		{
			return GetBoundingRect(элемент, прям, нет);
		}
		
		public бул GetBoundingRect(TreeItemId элемент, inout Прямоугольник прям, бул textOnly)
		{
			return wxTreeCtrl_GetBoundingRect(шхобъ, wxObject.SafePtr(элемент), прям, textOnly);
		}
		
		//---------------------------------------------------------------------
		
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст)
		{
			return InsertItem(родитель, previous, текст, -1, -1, пусто);
		}
		
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок)
		{
			return InsertItem(родитель, previous, текст, рисунок, -1, пусто);
		}
		
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок, цел sellimage)
		{
			return InsertItem(родитель, previous, текст, рисунок, sellimage, пусто);
		}
		
		public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок, цел sellimage, TreeItemData данные)
		{
			return new TreeItemId(wxTreeCtrl_InsertItem(шхобъ, wxObject.SafePtr(родитель), wxObject.SafePtr(previous), текст, рисунок, sellimage, wxObject.SafePtr(данные)), да);
		}
		
		//---------------------------------------------------------------------
		
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст)
		{
			return InsertItem(родитель, before, текст, -1, -1, пусто);
		}
		
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок)
		{
			return InsertItem(родитель, before, текст, рисунок, -1, пусто);
		}
		
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок, цел sellimage)
		{
			return InsertItem(родитель, before, текст, рисунок, sellimage, пусто);
		}
		
		public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок, цел sellimage, TreeItemData данные)
		{
			return new TreeItemId(wxTreeCtrl_InsertItem2(шхобъ, wxObject.SafePtr(родитель), before, текст, рисунок, sellimage, wxObject.SafePtr(данные)), да);
		}
		
		//---------------------------------------------------------------------
		
		public бул IsBold(TreeItemId элемент)
		{
			return wxTreeCtrl_IsBold(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст)
		{
			return PrependItem(родитель, текст, -1, -1, пусто);
		}
		
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок)
		{
			return PrependItem(родитель, текст, рисунок, -1, пусто);
		}
		
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок, цел sellimage)
		{
			return PrependItem(родитель, текст, рисунок, sellimage, пусто);
		}
		
		public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок, цел sellimage, TreeItemData данные)
		{
			return new TreeItemId(wxTreeCtrl_PrependItem(шхобъ, wxObject.SafePtr(родитель), текст, рисунок, sellimage, wxObject.SafePtr(данные)), да);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetItemSelectedImage(TreeItemId элемент, цел selImage)
		{
			wxTreeCtrl_SetItemSelectedImage(шхобъ, wxObject.SafePtr(элемент), selImage);
		}
		
		//---------------------------------------------------------------------
		
		public проц ToggleItemSelection(TreeItemId элемент)
		{
			wxTreeCtrl_ToggleItemSelection(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		
		public проц UnselectItem(TreeItemId элемент)
		{
			wxTreeCtrl_UnselectItem(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		
		public проц SortChildren(TreeItemId элемент)
		{
			wxTreeCtrl_SortChildren(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		public проц BeginDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_DRAG, ИД, значение, this); }
		public проц BeginDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц BeginRightDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_RDRAG, ИД, значение, this); }
		public проц BeginRightDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц BeginLabelEdit_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_LABEL_EDIT, ИД, значение, this); }
		public проц BeginLabelEdit_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц EndLabelEdit_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_END_LABEL_EDIT, ИД, значение, this); }
		public проц EndLabelEdit_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DeleteItem_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_DELETE_ITEM, ИД, значение, this); }
		public проц DeleteItem_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц GetInfo_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_GET_INFO, ИД, значение, this); }
		public проц GetInfo_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SetInfo_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_SET_INFO, ИД, значение, this); }
		public проц SetInfo_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemExpand_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_EXPANDED, ИД, значение, this); }
		public проц ItemExpand_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemExpanding_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_EXPANDING, ИД, значение, this); }
		public проц ItemExpanding_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemCollapse_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_COLLAPSED, ИД, значение, this); }
		public проц ItemCollapse_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemCollapsing_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_COLLAPSING, ИД, значение, this); }
		public проц ItemCollapsing_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SelectionChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_SEL_CHANGED, ИД, значение, this); }
		public проц SelectionChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SelectionChanging_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_SEL_CHANGING, ИД, значение, this); }
		public проц SelectionChanging_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public override проц KeyDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_KEY_DOWN, ИД, значение, this); }
		public override проц KeyDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemActivate_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_ACTIVATED, ИД, значение, this); }
		public проц ItemActivate_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemRightClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_RIGHT_CLICK, ИД, значение, this); }
		public проц ItemRightClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ItemMiddleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_MIDDLE_CLICK, ИД, значение, this); }
		public проц ItemMiddleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц EndDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TREE_END_DRAG, ИД, значение, this); }
		public проц EndDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }

	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxTreeEvent_ctor(цел commandType, цел ид);
		static extern (C) ЦУк wxTreeEvent_GetItem(ЦУк сам);
		static extern (C) проц   wxTreeEvent_SetItem(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxTreeEvent_GetOldItem(ЦУк сам);
		static extern (C) проц   wxTreeEvent_SetOldItem(ЦУк сам, ЦУк элемент);
		static extern (C) проц   wxTreeEvent_GetPoint(ЦУк сам, inout Точка pt);
		static extern (C) проц   wxTreeEvent_SetPoint(ЦУк сам, inout Точка pt);
		static extern (C) ЦУк wxTreeEvent_GetKeyEvent(ЦУк сам);
		static extern (C) цел    wxTreeEvent_GetKeyCode(ЦУк сам);
		static extern (C) проц   wxTreeEvent_SetKeyEvent(ЦУк сам, ЦУк evt);
		static extern (C) ЦУк wxTreeEvent_GetLabel(ЦУк сам);
		static extern (C) проц   wxTreeEvent_SetLabel(ЦУк сам, ткст надпись);
		static extern (C) бул   wxTreeEvent_IsEditCancelled(ЦУк сам);
		static extern (C) проц   wxTreeEvent_SetEditCanceled(ЦУк сам, бул editCancelled);
		//static extern (C) цел    wxTreeEvent_GetCode(ЦУк сам);
		static extern (C) проц   wxTreeEvent_Veto(ЦУк сам);
		static extern (C) проц   wxTreeEvent_Allow(ЦУк сам);
		static extern (C) бул   wxTreeEvent_IsAllowed(ЦУк сам);       
		
		static extern (C) проц   wxTreeEvent_SetToolTip(ЦУк сам, ткст toolTip);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias TreeEvent wxTreeEvent;
	public class TreeEvent : Событие
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
		public this(цел commandType, цел ид)
			{ super(wxTreeEvent_ctor(commandType, ид)); }

		//-----------------------------------------------------------------------------

		public TreeItemId Элемент() { return new TreeItemId(wxTreeEvent_GetItem(шхобъ), да); }
		public проц Элемент(TreeItemId значение) { wxTreeEvent_SetItem(шхобъ, wxObject.SafePtr(значение)); }

		public TreeItemId OldItem() { return new TreeItemId(wxTreeEvent_GetOldItem(шхобъ), да); }
		public проц OldItem(TreeItemId значение) { wxTreeEvent_SetOldItem(шхобъ, wxObject.SafePtr(значение)); }

		//-----------------------------------------------------------------------------

		public Точка point() 
			{ 
				Точка pt;
				wxTreeEvent_GetPoint(шхобъ, pt);
				return pt;
			}
		public проц point(Точка значение) { wxTreeEvent_SetPoint(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public СобКлавиши keyEvent() { return cast(СобКлавиши)FindObject(wxTreeEvent_GetKeyEvent(шхобъ), cast(wxObject function(ЦУк ptr))&СобКлавиши.Нов); }
		public проц keyEvent(СобКлавиши значение) { wxTreeEvent_SetKeyEvent(шхобъ, wxObject.SafePtr(значение)); }

		//-----------------------------------------------------------------------------

		public цел КодКлавиши() { return wxTreeEvent_GetKeyCode(шхобъ); }

		//-----------------------------------------------------------------------------

		public ткст Label() { return cast(ткст) new wxString(wxTreeEvent_GetLabel(шхобъ), да); }
		public проц Label(ткст значение) { wxTreeEvent_SetLabel(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public бул IsEditCancelled() { return wxTreeEvent_IsEditCancelled(шхобъ); } 
		public проц IsEditCancelled(бул значение) { wxTreeEvent_SetEditCanceled(шхобъ, значение); }
		
		public проц ToolTip(ткст значение) { wxTreeEvent_SetToolTip(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------        
        
		public проц Veto()
		{
			wxTreeEvent_Veto(шхобъ);
		}
        
		//-----------------------------------------------------------------------------
        
		public проц Allow()
		{
			wxTreeEvent_Allow(шхобъ);
		}
        
		//-----------------------------------------------------------------------------
        
		public бул Allowed() { return  wxTreeEvent_IsAllowed(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new TreeEvent(объ); }

		static this()
		{
			wxEVT_COMMAND_TREE_BEGIN_DRAG = wxEvent_EVT_COMMAND_TREE_BEGIN_DRAG();
			wxEVT_COMMAND_TREE_BEGIN_RDRAG = wxEvent_EVT_COMMAND_TREE_BEGIN_RDRAG();
			wxEVT_COMMAND_TREE_BEGIN_LABEL_EDIT = wxEvent_EVT_COMMAND_TREE_BEGIN_LABEL_EDIT();
			wxEVT_COMMAND_TREE_END_LABEL_EDIT = wxEvent_EVT_COMMAND_TREE_END_LABEL_EDIT();
			wxEVT_COMMAND_TREE_DELETE_ITEM = wxEvent_EVT_COMMAND_TREE_DELETE_ITEM();
			wxEVT_COMMAND_TREE_GET_INFO = wxEvent_EVT_COMMAND_TREE_GET_INFO();
			wxEVT_COMMAND_TREE_SET_INFO = wxEvent_EVT_COMMAND_TREE_SET_INFO();
			wxEVT_COMMAND_TREE_ITEM_EXPANDED = wxEvent_EVT_COMMAND_TREE_ITEM_EXPANDED();
			wxEVT_COMMAND_TREE_ITEM_EXPANDING = wxEvent_EVT_COMMAND_TREE_ITEM_EXPANDING();
			wxEVT_COMMAND_TREE_ITEM_COLLAPSED = wxEvent_EVT_COMMAND_TREE_ITEM_COLLAPSED();
			wxEVT_COMMAND_TREE_ITEM_COLLAPSING = wxEvent_EVT_COMMAND_TREE_ITEM_COLLAPSING();
			wxEVT_COMMAND_TREE_SEL_CHANGED = wxEvent_EVT_COMMAND_TREE_SEL_CHANGED();
			wxEVT_COMMAND_TREE_SEL_CHANGING = wxEvent_EVT_COMMAND_TREE_SEL_CHANGING();
			wxEVT_COMMAND_TREE_KEY_DOWN = wxEvent_EVT_COMMAND_TREE_KEY_DOWN();
			wxEVT_COMMAND_TREE_ITEM_ACTIVATED = wxEvent_EVT_COMMAND_TREE_ITEM_ACTIVATED();
			wxEVT_COMMAND_TREE_ITEM_RIGHT_CLICK = wxEvent_EVT_COMMAND_TREE_ITEM_RIGHT_CLICK();
			wxEVT_COMMAND_TREE_ITEM_MIDDLE_CLICK = wxEvent_EVT_COMMAND_TREE_ITEM_MIDDLE_CLICK();
			wxEVT_COMMAND_TREE_END_DRAG = wxEvent_EVT_COMMAND_TREE_END_DRAG();

			ДобавьТипСоб(wxEVT_COMMAND_TREE_BEGIN_DRAG,         &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_BEGIN_RDRAG,        &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_BEGIN_LABEL_EDIT,   &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_END_LABEL_EDIT,     &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_DELETE_ITEM,        &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_GET_INFO,           &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_SET_INFO,           &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_EXPANDED,      &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_EXPANDING,     &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_COLLAPSED,     &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_COLLAPSING,    &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_SEL_CHANGED,        &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_SEL_CHANGING,       &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_KEY_DOWN,           &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_ACTIVATED,     &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_RIGHT_CLICK,   &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_ITEM_MIDDLE_CLICK,  &TreeEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TREE_END_DRAG,           &TreeEvent.Нов);
		}
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxArrayTreeItemIds_ctor();
		static extern (C) проц   wxArrayTreeItemIds_dtor(ЦУк сам);
		static extern (C) проц   wxArrayTreeItemIds_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxArrayTreeItemIds_Add(ЦУк сам, ЦУк добавка);
		static extern (C) ЦУк wxArrayTreeItemIds_Item(ЦУк сам, цел num);
		static extern (C) цел    wxArrayTreeItemIds_GetCount(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias ArrayTreeItemIds wxArrayTreeItemIds;
	public class ArrayTreeItemIds : wxObject
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
		{
			this(wxArrayTreeItemIds_ctor(), да);
			wxArrayTreeItemIds_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------

		public TreeItemId[] вМассив()
		{
			цел счёт = this.Счёт();
			TreeItemId[] tmps = new TreeItemId[счёт];
			for (цел i = 0; i < счёт; i++)
				tmps[i] = this.Элемент(i);
			return tmps;
		}
	
		public TreeItemId Элемент(цел num)
		{
			return new TreeItemId(wxArrayTreeItemIds_Item(шхобъ, num), да);
		}	
	
		public проц Добавь(TreeItemId добавка)
		{
			wxArrayTreeItemIds_Add(шхобъ, wxObject.SafePtr(добавка));
		}

		public цел Счёт() { return wxArrayTreeItemIds_GetCount(шхобъ); }
        
		//---------------------------------------------------------------------

		override protected проц dtor() { wxArrayTreeItemIds_dtor(шхобъ); }
	}
