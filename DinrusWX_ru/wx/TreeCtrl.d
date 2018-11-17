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
static extern (C) ЦелУкз wxTreeItemData_ctor();
static extern (C) проц   wxTreeItemData_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxTreeItemData_dtor(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeItemData_GetId(ЦелУкз сам);
static extern (C) проц   wxTreeItemData_SetId(ЦелУкз сам, ЦелУкз param);
//! \endcond

//-----------------------------------------------------------------------------

alias TreeItemData wxTreeItemData;
public class TreeItemData : ClientData
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxTreeItemData_ctor(), да);
        wxTreeItemData_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------
    override protected проц dtor()
    {
        wxTreeItemData_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public TreeItemId Ид()
    {
        return new TreeItemId(wxTreeItemData_GetId(wxobj), да);
    }
    public проц Ид(TreeItemId значение)
    {
        wxTreeItemData_SetId(wxobj, wxObject.SafePtr(значение));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxTreeItemAttr_ctor();
static extern (C) ЦелУкз wxTreeItemAttr_ctor2(ЦелУкз colText, ЦелУкз colBack, ЦелУкз шрифт);
static extern (C) проц   wxTreeItemAttr_dtor(ЦелУкз сам);
static extern (C) проц   wxTreeItemAttr_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxTreeItemAttr_SetTextColour(ЦелУкз сам, ЦелУкз colText);
static extern (C) проц   wxTreeItemAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз colBack);
static extern (C) проц   wxTreeItemAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) бул   wxTreeItemAttr_HasTextColour(ЦелУкз сам);
static extern (C) бул   wxTreeItemAttr_HasBackgroundColour(ЦелУкз сам);
static extern (C) бул   wxTreeItemAttr_HasFont(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeItemAttr_GetTextColour(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeItemAttr_GetBackgroundColour(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeItemAttr_GetFont(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias TreeItemAttr wxTreeItemAttr;
public class TreeItemAttr : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxTreeItemAttr_ctor(), да);
        wxTreeItemAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public this(Цвет colText, Цвет colBack, Шрифт шрифт)
    {
        this(wxTreeItemAttr_ctor2(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт)), да);
        wxTreeItemAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxTreeItemAttr_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public Цвет цветТекста()
    {
        return new Цвет(wxTreeItemAttr_GetTextColour(wxobj), да);
    }
    public проц цветТекста(Цвет значение)
    {
        wxTreeItemAttr_SetTextColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Цвет цветФона()
    {
        return new Цвет(wxTreeItemAttr_GetBackgroundColour(wxobj), да);
    }
    public проц цветФона(Цвет значение)
    {
        wxTreeItemAttr_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Шрифт шрифт()
    {
        return new Шрифт(wxTreeItemAttr_GetFont(wxobj), да);
    }
    public проц шрифт(Шрифт значение)
    {
        wxTreeItemAttr_SetFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public бул ЕстьЦветТекста()
    {
        return wxTreeItemAttr_HasTextColour(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьЦветФона()
    {
        return wxTreeItemAttr_HasBackgroundColour(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьШрифт()
    {
        return wxTreeItemAttr_HasFont(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxTreeItemId_ctor();
static extern (C) ЦелУкз wxTreeItemId_ctor2(проц* pItem);
static extern (C) проц   wxTreeItemId_dtor(ЦелУкз сам);
static extern (C) проц   wxTreeItemId_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) бул   wxTreeItemId_Equal(ЦелУкз элт1, ЦелУкз элт2);
static extern (C) бул   wxTreeItemId_IsOk(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

//[StructLayout(LayoutKind.Sequential)]
alias TreeItemId wxTreeItemId;
public class TreeItemId : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
        wxTreeItemId_RegisterDisposable(wxobj, &VirtualDispose);
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

    override protected проц dtor()
    {
        wxTreeItemId_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    //-----------------------------------------------------------------------------

    /*private ЦелУкз ид;

    public this(ЦелУкз ид)
    { this.ид = ид; }*/

    //-----------------------------------------------------------------------------

    version (D_Version2) // changed in DMD 2.016
    {
        public override бул opEquals(Объект o)
        {
            if (o is null) return false;
            TreeItemId ид = cast(TreeItemId)o;
            if (ид is null) return false;
            if (ид is this || wxobj == ид.wxobj) return да;
            return wxTreeItemId_Equal(wxobj, ид.wxobj);
        }
    }
    else // D_Version1
    {
        public override цел opEquals(Объект o)
        {
            if (o is null) return false;
            TreeItemId ид = cast(TreeItemId)o;
            if (ид is null) return false;
            if (ид is this || wxobj == ид.wxobj) return да;
            return wxTreeItemId_Equal(wxobj, ид.wxobj);
        }
    }

    //-----------------------------------------------------------------------------

    public override hash_t toHash()
    {
        return cast(hash_t)wxobj;
    }

    //-----------------------------------------------------------------------------

    /*public бул IsValid
    {
    	get { return ид != ЦелУкз.init; }
    }*/

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxTreeItemId_IsOk(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias цел function(TreeCtrl объ, ЦелУкз элт1, ЦелУкз элт2) Virtual_OnCompareItems;
}

static extern (C) бцел   wxTreeCtrl_GetDefaultStyle();
static extern (C) ЦелУкз wxTreeCtrl_ctor();
static extern (C) проц   wxTreeCtrl_RegisterVirtual(ЦелУкз сам,TreeCtrl объ, Virtual_OnCompareItems onCompareItems);
static extern (C) цел    wxTreeCtrl_OnCompareItems(ЦелУкз сам, ЦелУкз элт1, ЦелУкз элт2);
static extern (C) ЦелУкз wxTreeCtrl_AddRoot(ЦелУкз сам, ткст текст, цел рисунок, цел selImage, ЦелУкз data);
static extern (C) ЦелУкз wxTreeCtrl_AppendItem(ЦелУкз сам, ЦелУкз родитель, ткст текст, цел рисунок, цел selImage, ЦелУкз data);
static extern (C) проц   wxTreeCtrl_AssignImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) проц   wxTreeCtrl_AssignStateImageList(ЦелУкз сам, ЦелУкз imageList);
//static extern (C) проц   wxTreeCtrl_AssignButtonsImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) бул   wxTreeCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз val, ткст имя);
static extern (C) ЦелУкз wxTreeCtrl_GetImageList(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeCtrl_GetStateImageList(ЦелУкз сам);
//static extern (C) ЦелУкз wxTreeCtrl_GetButtonsImageList(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_SetImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) проц   wxTreeCtrl_SetStateImageList(ЦелУкз сам, ЦелУкз imageList);
//static extern (C) проц   wxTreeCtrl_SetButtonsImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) проц   wxTreeCtrl_SetItemImage(ЦелУкз сам, ЦелУкз элт, цел рисунок, TreeItemIcon which);
static extern (C) цел    wxTreeCtrl_GetItemImage(ЦелУкз сам, ЦелУкз элт, TreeItemIcon which);

static extern (C) проц   wxTreeCtrl_DeleteAllItems(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_Delete(ЦелУкз сам, ЦелУкз элт);
static extern (C) проц   wxTreeCtrl_DeleteChildren(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_Unselect(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_UnselectAll(ЦелУкз сам);

static extern (C) бул   wxTreeCtrl_IsSelected(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetSelection(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_SelectItem(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_GetItemText(ЦелУкз сам, ЦелУкз элт);
static extern (C) проц   wxTreeCtrl_SetItemText(ЦелУкз сам, ЦелУкз элт, ткст текст);

static extern (C) ЦелУкз wxTreeCtrl_HitTest(ЦелУкз сам, inout Точка тчк, inout цел флаги);

static extern (C) проц   wxTreeCtrl_SetItemData(ЦелУкз сам, ЦелУкз элт, ЦелУкз data);
static extern (C) ЦелУкз wxTreeCtrl_GetItemData(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_GetRootItem(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeCtrl_GetItemParent(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_GetFirstChild(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetNextChild(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetLastChild(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_GetNextSibling(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetPrevSibling(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_GetFirstVisibleItem(ЦелУкз сам);
static extern (C) ЦелУкз wxTreeCtrl_GetNextVisible(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetPrevVisible(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_Expand(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_Collapse(ЦелУкз сам, ЦелУкз элт);
static extern (C) проц   wxTreeCtrl_CollapseAndReset(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_Toggle(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_EnsureVisible(ЦелУкз сам, ЦелУкз элт);
static extern (C) проц   wxTreeCtrl_ScrollTo(ЦелУкз сам, ЦелУкз элт);

static extern (C) цел    wxTreeCtrl_GetChildrenCount(ЦелУкз сам, ЦелУкз элт, бул recursively);
static extern (C) цел    wxTreeCtrl_GetCount(ЦелУкз сам);

static extern (C) бул   wxTreeCtrl_IsVisible(ЦелУкз сам, ЦелУкз элт);

static extern (C) бул   wxTreeCtrl_ItemHasChildren(ЦелУкз сам, ЦелУкз элт);

static extern (C) бул   wxTreeCtrl_IsExpanded(ЦелУкз сам, ЦелУкз элт);

static extern (C) бцел   wxTreeCtrl_GetIndent(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_SetIndent(ЦелУкз сам, бцел indent);

static extern (C) бцел   wxTreeCtrl_GetSpacing(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_SetSpacing(ЦелУкз сам, бцел indent);

static extern (C) ЦелУкз wxTreeCtrl_GetItemTextColour(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetItemBackgroundColour(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeCtrl_GetItemFont(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_SetItemHasChildren(ЦелУкз сам, ЦелУкз элт, бул has);
static extern (C) проц   wxTreeCtrl_SetItemBold(ЦелУкз сам, ЦелУкз элт, бул bold);
static extern (C) проц   wxTreeCtrl_SetItemTextColour(ЦелУкз сам, ЦелУкз элт, ЦелУкз col);
static extern (C) проц   wxTreeCtrl_SetItemBackgroundColour(ЦелУкз сам, ЦелУкз элт, ЦелУкз col);

static extern (C) проц   wxTreeCtrl_EditLabel(ЦелУкз сам, ЦелУкз элт);

static extern (C) бул   wxTreeCtrl_GetBoundingRect(ЦелУкз сам, ЦелУкз элт, inout Прямоугольник прям, бул textOnly);

static extern (C) ЦелУкз wxTreeCtrl_InsertItem(ЦелУкз сам, ЦелУкз родитель, ЦелУкз idPrevious, ткст текст, цел рисунок, цел selectedImage, ЦелУкз data);
static extern (C) ЦелУкз wxTreeCtrl_InsertItem2(ЦелУкз сам, ЦелУкз родитель, цел before, ткст текст, цел рисунок, цел selectedImage, ЦелУкз data);

static extern (C) бул   wxTreeCtrl_IsBold(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_PrependItem(ЦелУкз сам, ЦелУкз родитель, ткст текст, цел рисунок, цел selectedImage, ЦелУкз data);

static extern (C) проц   wxTreeCtrl_SetItemSelectedImage(ЦелУкз сам, ЦелУкз элт, цел selImage);

static extern (C) проц   wxTreeCtrl_ToggleItemSelection(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxTreeCtrl_UnselectItem(ЦелУкз сам, ЦелУкз элт);

static extern (C) ЦелУкз wxTreeCtrl_GetMyCookie(ЦелУкз сам);
static extern (C) проц   wxTreeCtrl_SetMyCookie(ЦелУкз сам, ЦелУкз newval);

static extern (C) ЦелУкз wxTreeCtrl_GetSelections(ЦелУкз сам);

static extern (C) проц   wxTreeCtrl_SetItemFont(ЦелУкз сам, ЦелУкз элт, ЦелУкз шрифт);
static extern (C) проц   wxTreeCtrl_SortChildren(ЦелУкз сам, ЦелУкз элт);
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

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxTreeCtrl_ctor());
        wxTreeCtrl_RegisterVirtual(wxobj, this, &staticDoOnCompareItems);
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxTR_HAS_BUTTONS | wxTR_LINES_AT_ROOT, Оценщик val = null, ткст имя = wxTreeCtrlNameStr)
    {
        this();
        if (!создай(родитель, ид, поз, Размер, стиль, val, имя))
        {
            throw new InvalidOperationException("Could not create TreeCtrl");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new TreeCtrl(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxTR_HAS_BUTTONS | wxTR_LINES_AT_ROOT, Оценщик val = null, ткст имя = wxTreeCtrlNameStr)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, val, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, Оценщик val, ткст имя)
    {
        return wxTreeCtrl_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(val), имя);
    }

    //---------------------------------------------------------------------

    static extern (C) private цел staticDoOnCompareItems(TreeCtrl объ, ЦелУкз элт1, ЦелУкз элт2)
    {
        return объ.OnCompareItems(new TreeItemId(элт1, да), new TreeItemId(элт2, да));
    }

    public  цел OnCompareItems(TreeItemId элт1, TreeItemId элт2)
    {
        return wxTreeCtrl_OnCompareItems(wxobj, wxObject.SafePtr(элт1), wxObject.SafePtr(элт2));
    }

    //---------------------------------------------------------------------

    public TreeItemId AddRoot(ткст текст)
    {
        return AddRoot(текст, -1, -1, null);
    }

    public TreeItemId AddRoot(ткст текст, цел рисунок)
    {
        return AddRoot(текст, рисунок, -1, null);
    }

    public TreeItemId AddRoot(ткст текст, цел рисунок, цел selImage)
    {
        return AddRoot(текст, рисунок, selImage, null);
    }

    public TreeItemId AddRoot(ткст текст, цел рисунок, цел selImage, TreeItemData data)
    {
        return new TreeItemId(wxTreeCtrl_AddRoot(wxobj, текст, рисунок, selImage, wxObject.SafePtr(data)), да);
    }

    //---------------------------------------------------------------------

    public TreeItemId AppendItem(TreeItemId parentId, ткст текст)
    {
        return AppendItem(parentId, текст, -1, -1, null);
    }

    public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок)
    {
        return AppendItem(parentId, текст, рисунок, -1, null);
    }

    public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок, цел selImage)
    {
        return AppendItem(parentId, текст, рисунок, selImage, null);
    }

    public TreeItemId AppendItem(TreeItemId parentId, ткст текст, цел рисунок, цел selImage, TreeItemData data)
    {
        return new TreeItemId(wxTreeCtrl_AppendItem(wxobj, wxObject.SafePtr(parentId), текст, рисунок, selImage, wxObject.SafePtr(data)), да);
    }

    //---------------------------------------------------------------------

    public проц AssignImageList(ImageList imageList)
    {
        wxTreeCtrl_AssignImageList(wxobj, wxObject.SafePtr(imageList));
    }

    //---------------------------------------------------------------------

    public проц AssignStateImageList(ImageList imageList)
    {
        wxTreeCtrl_AssignStateImageList(wxobj, wxObject.SafePtr(imageList));
    }

    //---------------------------------------------------------------------

    /*public проц AssignButtonsImageList(ImageList imageList)
    {
    	wxTreeCtrl_AssignButtonsImageList(wxobj, wxObject.SafePtr(imageList));
    }*/

    //---------------------------------------------------------------------

    public ImageList imageList()
    {
        return cast(ImageList)НайдиОбъект(wxTreeCtrl_GetImageList(wxobj), &ImageList.Нов);
    }

    public проц imageList(ImageList значение)
    {
        wxTreeCtrl_SetImageList(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public проц УстImageList(ImageList imageList)
    {
        wxTreeCtrl_SetImageList(wxobj, wxObject.SafePtr(imageList));
    }

    //---------------------------------------------------------------------

    public ImageList StateImageList()
    {
        return cast(ImageList)НайдиОбъект(wxTreeCtrl_GetStateImageList(wxobj), &ImageList.Нов);
    }

    public проц StateImageList(ImageList значение)
    {
        wxTreeCtrl_SetStateImageList(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    /*public ImageList ButtonsImageList
    {
    	get { return (ImageList)НайдиОбъект(wxTreeCtrl_GetButtonsImageList(wxobj), typeid(ImageList)); }

    	set { wxTreeCtrl_SetButtonsImageList(wxobj, wxObject.SafePtr(значение)); }
    }*/

    //---------------------------------------------------------------------

    public проц УстItemImage(TreeItemId элт, цел рисунок)
    {
        УстItemImage(элт, рисунок, TreeItemIcon.wxTreeItemIcon_Normal);
    }

    public проц УстItemImage(TreeItemId элт, цел рисунок, TreeItemIcon which)
    {
        wxTreeCtrl_SetItemImage(wxobj, wxObject.SafePtr(элт), рисунок, which);
    }

    //---------------------------------------------------------------------

    public цел GetItemImage(TreeItemId элт)
    {
        return GetItemImage(элт, TreeItemIcon.wxTreeItemIcon_Normal);
    }

    public цел GetItemImage(TreeItemId элт, TreeItemIcon which)
    {
        return wxTreeCtrl_GetItemImage(wxobj, wxObject.SafePtr(элт), which);
    }

    //---------------------------------------------------------------------

    public проц удалиВсеЭлементы()
    {
        wxTreeCtrl_DeleteAllItems(wxobj);
    }

    public проц Delete(TreeItemId элт)
    {
        wxTreeCtrl_Delete(wxobj, wxObject.SafePtr(элт));
    }

    public проц DeleteChildren(TreeItemId элт)
    {
        wxTreeCtrl_DeleteChildren(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public проц Unselect()
    {
        wxTreeCtrl_Unselect(wxobj);
    }

    public проц UnselectAll()
    {
        wxTreeCtrl_UnselectAll(wxobj);
    }

    //---------------------------------------------------------------------

    public бул IsSelected(TreeItemId элт)
    {
        return wxTreeCtrl_IsSelected(wxobj, wxObject.SafePtr(элт));
    }

    public проц SelectItem(TreeItemId элт)
    {
        wxTreeCtrl_SelectItem(wxobj, wxObject.SafePtr(элт));
    }

    public TreeItemId Selection()
    {
        return new TreeItemId(wxTreeCtrl_GetSelection(wxobj), да);
    }
    public проц Selection(TreeItemId значение)
    {
        SelectItem(значение);
    }

    //---------------------------------------------------------------------

    public проц УстItemText(TreeItemId элт, ткст текст)
    {
        wxTreeCtrl_SetItemText(wxobj, wxObject.SafePtr(элт), текст);
    }

    public ткст GetItemText(TreeItemId элт)
    {
        return cast(ткст) new wxString(wxTreeCtrl_GetItemText(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public проц УстItemData(TreeItemId элт, TreeItemData data)
    {
        wxTreeCtrl_SetItemData(wxobj, wxObject.SafePtr(элт), wxObject.SafePtr(data));
    }

    public TreeItemData GetItemData(TreeItemId элт)
    {
        return cast(TreeItemData)wxObject.НайдиОбъект(wxTreeCtrl_GetItemData(wxobj, wxObject.SafePtr(элт)));
    }

    //---------------------------------------------------------------------

    public TreeItemId ТестНажатия(Точка тчк, out цел флаги)
    {
        return new TreeItemId(wxTreeCtrl_HitTest(wxobj, тчк, флаги), да);
    }

    //---------------------------------------------------------------------

    public TreeItemId RootItem()
    {
        return new TreeItemId(wxTreeCtrl_GetRootItem(wxobj), да);
    }

    public TreeItemId GetItemParent(TreeItemId элт)
    {
        return new TreeItemId(wxTreeCtrl_GetItemParent(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public TreeItemId GetFirstChild(TreeItemId элт, inout ЦелУкз cookie)
    {
        TreeItemId ид = new TreeItemId(wxTreeCtrl_GetFirstChild(wxobj, wxObject.SafePtr(элт)), да);

        cookie = wxTreeCtrl_GetMyCookie(wxobj);

        return ид;
    }

    public TreeItemId GetNextChild(TreeItemId элт, inout ЦелУкз cookie)
    {
        wxTreeCtrl_SetMyCookie(wxobj, cookie);

        TreeItemId ид = new TreeItemId(wxTreeCtrl_GetNextChild(wxobj, wxObject.SafePtr(элт)), да);

        cookie =  wxTreeCtrl_GetMyCookie(wxobj);

        return ид;
    }

    public TreeItemId GetLastChild(TreeItemId элт)
    {
        return new TreeItemId(wxTreeCtrl_GetLastChild(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public TreeItemId GetNextSibling(TreeItemId элт)
    {
        return new TreeItemId(wxTreeCtrl_GetNextSibling(wxobj, wxObject.SafePtr(элт)), да);
    }

    public TreeItemId GetPrevSibling(TreeItemId элт)
    {
        return new TreeItemId(wxTreeCtrl_GetPrevSibling(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public TreeItemId GetFirstVisibleItem()
    {
        return new TreeItemId(wxTreeCtrl_GetFirstVisibleItem(wxobj), да);
    }

    public TreeItemId GetNextVisible(TreeItemId элт)
    {
        return new TreeItemId(wxTreeCtrl_GetNextVisible(wxobj, wxObject.SafePtr(элт)), да);
    }

    public TreeItemId GetPrevVisible(TreeItemId элт)
    {
        return new TreeItemId(wxTreeCtrl_GetPrevVisible(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public проц Expand(TreeItemId элт)
    {
        wxTreeCtrl_Expand(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public проц Collapse(TreeItemId элт)
    {
        wxTreeCtrl_Collapse(wxobj, wxObject.SafePtr(элт));
    }

    public проц CollapseAndReset(TreeItemId элт)
    {
        wxTreeCtrl_CollapseAndReset(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public проц Toggle(TreeItemId элт)
    {
        wxTreeCtrl_Toggle(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public проц EnsureVisible(TreeItemId элт)
    {
        wxTreeCtrl_EnsureVisible(wxobj, wxObject.SafePtr(элт));
    }

    public проц ScrollTo(TreeItemId элт)
    {
        wxTreeCtrl_ScrollTo(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public цел GetChildrenCount(TreeItemId элт)
    {
        return GetChildrenCount(элт, да);
    }

    public цел GetChildrenCount(TreeItemId элт, бул recursively)
    {
        return wxTreeCtrl_GetChildrenCount(wxobj, wxObject.SafePtr(элт), recursively);
    }

    public цел Счёт()
    {
        return wxTreeCtrl_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Виден(TreeItemId элт)
    {
        return wxTreeCtrl_IsVisible(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public бул ItemHasChildren(TreeItemId элт)
    {
        return wxTreeCtrl_ItemHasChildren(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public бул IsExpanded(TreeItemId элт)
    {
        return wxTreeCtrl_IsExpanded(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public бул HasChildren(TreeItemId элт)
    {
        return GetChildrenCount(элт, false) > 0;
    }

    // A brute сила way to get list of selections (if wxTR_MULTIPLE has been
    // enabled) by inspecting each элт. May want to replace with Interop
    // invocation of GetSelections() if it is implemented more efficiently
    // (such as the TreeCtrl has a built-in list of currect selections).
    public TreeItemId[] SelectionsOld()
    {
        return Get_Items(GetItemsMode.Selections, this.RootItem, да);
    }

    // This is now interop...
    public TreeItemId[] Selections()
    {
        return (new ArrayTreeItemIds(wxTreeCtrl_GetSelections(wxobj), да)).вМассив();
    }

    // This is an addition to the standard API. Limits the selection
    // search to parent_элт and below.
    public TreeItemId[] SelectionsAtOrBelow(TreeItemId parent_элт)
    {
        return Get_Items(GetItemsMode.Selections, parent_элт, false);
    }

    // This is an addition to the standard API. Limits the selection
    // search to those элтs below parent_элт.
    public TreeItemId[] SelectionsBelow(TreeItemId parent_элт)
    {
        return Get_Items(GetItemsMode.Selections, parent_элт, да);
    }

    // This is an addition to the standard API. Returns all элтs
    // except for the root node.
    public TreeItemId[] AllItems()
    {
        return Get_Items(GetItemsMode.All, this.RootItem, да);
    }

    // This is an addition to the standard API. Only returns элтs
    // that are at or below parent_элт (i.e. returns parent_элт).
    public TreeItemId[] AllItemsAtOrBelow(TreeItemId parent_элт)
    {
        return Get_Items(GetItemsMode.All, parent_элт, false);
    }

    // This is an addition to the standard API. Only returns элтs
    // that are below parent_элт.
    public TreeItemId[] AllItemsBelow(TreeItemId parent_элт)
    {
        return Get_Items(GetItemsMode.All, parent_элт, да);
    }

    private enum GetItemsMode
    {
        Selections,
        All,
    }

    private TreeItemId[] Get_Items(GetItemsMode mode, TreeItemId parent_элт,
                                   бул skip_parent)
    {
        // Console.WriteLine("---");
        TreeItemId[] list;
        Add_Items(mode, parent_элт, list, ЦелУкз.init, skip_parent);
        return list;
    }

    private проц Add_Items(GetItemsMode mode, TreeItemId родитель,
                           TreeItemId[] list, ЦелУкз cookie, бул skip_parent)
    {
        TreeItemId ид;

        if ( cookie == ЦелУкз.init)
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

        if ( ! ид.Ок() )
            return;

        if ((mode == GetItemsMode.All) || (this.IsSelected(ид)))
        {
            // Console.WriteLine(this.GetItemText(ид));
            list ~= ид;
        }

        if (ItemHasChildren(ид))
        {
            Add_Items(mode, ид, list, ЦелУкз.init, false);
        }

        Add_Items(mode, родитель, list, cookie, false);
    }

    //---------------------------------------------------------------------

    public бцел Indent()
    {
        return wxTreeCtrl_GetIndent(wxobj);
    }
    public проц Indent(бцел значение)
    {
        wxTreeCtrl_SetIndent(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бцел Spacing()
    {
        return wxTreeCtrl_GetSpacing(wxobj);
    }
    public проц Spacing(бцел значение)
    {
        wxTreeCtrl_SetSpacing(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Цвет GetItemTextColour(TreeItemId элт)
    {
        return new Цвет(wxTreeCtrl_GetItemTextColour(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public Цвет GetItemBackgroundColour(TreeItemId элт)
    {
        return new Цвет(wxTreeCtrl_GetItemBackgroundColour(wxobj, wxObject.SafePtr(элт)), да);
    }

    //---------------------------------------------------------------------

    public Шрифт GetItemFont(TreeItemId элт)
    {
        return new Шрифт(wxTreeCtrl_GetItemFont(wxobj, wxObject.SafePtr(элт)), да);
    }

    public проц УстItemFont(TreeItemId элт, Шрифт шрифт)
    {
        wxTreeCtrl_SetItemFont(wxobj, wxObject.SafePtr(элт), wxObject.SafePtr(шрифт));
    }

    //---------------------------------------------------------------------

    public проц УстItemHasChildren(TreeItemId элт)
    {
        УстItemHasChildren(элт, да);
    }

    public проц УстItemHasChildren(TreeItemId элт, бул has)
    {
        wxTreeCtrl_SetItemHasChildren(wxobj, wxObject.SafePtr(элт), has);
    }

    //---------------------------------------------------------------------

    public проц УстItemBold(TreeItemId элт)
    {
        УстItemBold(элт, да);
    }

    public проц УстItemBold(TreeItemId элт, бул bold)
    {
        wxTreeCtrl_SetItemBold(wxobj, wxObject.SafePtr(элт), bold);
    }

    //---------------------------------------------------------------------

    public проц УстItemTextColour(TreeItemId элт, Цвет col)
    {
        wxTreeCtrl_SetItemTextColour(wxobj, wxObject.SafePtr(элт), wxObject.SafePtr(col));
    }

    //---------------------------------------------------------------------

    public проц УстItemBackgroundColour(TreeItemId элт, Цвет col)
    {
        wxTreeCtrl_SetItemBackgroundColour(wxobj, wxObject.SafePtr(элт), wxObject.SafePtr(col));
    }

    //---------------------------------------------------------------------

    public проц EditLabel(TreeItemId элт)
    {
        wxTreeCtrl_EditLabel(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public бул GetBoundingRect(TreeItemId элт, inout Прямоугольник прям)
    {
        return GetBoundingRect(элт, прям, false);
    }

    public бул GetBoundingRect(TreeItemId элт, inout Прямоугольник прям, бул textOnly)
    {
        return wxTreeCtrl_GetBoundingRect(wxobj, wxObject.SafePtr(элт), прям, textOnly);
    }

    //---------------------------------------------------------------------

    public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст)
    {
        return InsertItem(родитель, previous, текст, -1, -1, null);
    }

    public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок)
    {
        return InsertItem(родитель, previous, текст, рисунок, -1, null);
    }

    public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок, цел sellimage)
    {
        return InsertItem(родитель, previous, текст, рисунок, sellimage, null);
    }

    public TreeItemId InsertItem(TreeItemId родитель, TreeItemId previous, ткст текст, цел рисунок, цел sellimage, TreeItemData data)
    {
        return new TreeItemId(wxTreeCtrl_InsertItem(wxobj, wxObject.SafePtr(родитель), wxObject.SafePtr(previous), текст, рисунок, sellimage, wxObject.SafePtr(data)), да);
    }

    //---------------------------------------------------------------------

    public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст)
    {
        return InsertItem(родитель, before, текст, -1, -1, null);
    }

    public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок)
    {
        return InsertItem(родитель, before, текст, рисунок, -1, null);
    }

    public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок, цел sellimage)
    {
        return InsertItem(родитель, before, текст, рисунок, sellimage, null);
    }

    public TreeItemId InsertItem(TreeItemId родитель, цел before, ткст текст, цел рисунок, цел sellimage, TreeItemData data)
    {
        return new TreeItemId(wxTreeCtrl_InsertItem2(wxobj, wxObject.SafePtr(родитель), before, текст, рисунок, sellimage, wxObject.SafePtr(data)), да);
    }

    //---------------------------------------------------------------------

    public бул IsBold(TreeItemId элт)
    {
        return wxTreeCtrl_IsBold(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public TreeItemId PrependItem(TreeItemId родитель, ткст текст)
    {
        return PrependItem(родитель, текст, -1, -1, null);
    }

    public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок)
    {
        return PrependItem(родитель, текст, рисунок, -1, null);
    }

    public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок, цел sellimage)
    {
        return PrependItem(родитель, текст, рисунок, sellimage, null);
    }

    public TreeItemId PrependItem(TreeItemId родитель, ткст текст, цел рисунок, цел sellimage, TreeItemData data)
    {
        return new TreeItemId(wxTreeCtrl_PrependItem(wxobj, wxObject.SafePtr(родитель), текст, рисунок, sellimage, wxObject.SafePtr(data)), да);
    }

    //---------------------------------------------------------------------

    public проц УстItemSelectedImage(TreeItemId элт, цел selImage)
    {
        wxTreeCtrl_SetItemSelectedImage(wxobj, wxObject.SafePtr(элт), selImage);
    }

    //---------------------------------------------------------------------

    public проц ToggleItemSelection(TreeItemId элт)
    {
        wxTreeCtrl_ToggleItemSelection(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public проц UnselectItem(TreeItemId элт)
    {
        wxTreeCtrl_UnselectItem(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public проц SortChildren(TreeItemId элт)
    {
        wxTreeCtrl_SortChildren(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------
    public проц BeginDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_DRAG, ИД, значение, this);
    }
    public проц BeginDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц BeginRightDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_RDRAG, ИД, значение, this);
    }
    public проц BeginRightDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц BeginLabelEdit_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_LABEL_EDIT, ИД, значение, this);
    }
    public проц BeginLabelEdit_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц EndLabelEdit_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_END_LABEL_EDIT, ИД, значение, this);
    }
    public проц EndLabelEdit_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц DeleteItem_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_DELETE_ITEM, ИД, значение, this);
    }
    public проц DeleteItem_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц GetInfo_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_GET_INFO, ИД, значение, this);
    }
    public проц GetInfo_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц УстInfo_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_SET_INFO, ИД, значение, this);
    }
    public проц УстInfo_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemExpand_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_EXPANDED, ИД, значение, this);
    }
    public проц ItemExpand_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemExpanding_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_EXPANDING, ИД, значение, this);
    }
    public проц ItemExpanding_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemCollapse_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_COLLAPSED, ИД, значение, this);
    }
    public проц ItemCollapse_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemCollapsing_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_COLLAPSING, ИД, значение, this);
    }
    public проц ItemCollapsing_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц SelectionChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_SEL_CHANGED, ИД, значение, this);
    }
    public проц SelectionChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц SelectionChanging_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_SEL_CHANGING, ИД, значение, this);
    }
    public проц SelectionChanging_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public override проц KeyDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_KEY_DOWN, ИД, значение, this);
    }
    public override проц KeyDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemActivate_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_ACTIVATED, ИД, значение, this);
    }
    public проц ItemActivate_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemRightClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_RIGHT_CLICK, ИД, значение, this);
    }
    public проц ItemRightClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ItemMiddleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_MIDDLE_CLICK, ИД, значение, this);
    }
    public проц ItemMiddleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц EndDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_END_DRAG, ИД, значение, this);
    }
    public проц EndDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxTreeEvent_ctor(цел типКоманды, цел ид);
static extern (C) ЦелУкз wxTreeEvent_GetItem(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_SetItem(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxTreeEvent_GetOldItem(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_SetOldItem(ЦелУкз сам, ЦелУкз элт);
static extern (C) проц   wxTreeEvent_GetPoint(ЦелУкз сам, inout Точка тчк);
static extern (C) проц   wxTreeEvent_SetPoint(ЦелУкз сам, inout Точка тчк);
static extern (C) ЦелУкз wxTreeEvent_GetKeyEvent(ЦелУкз сам);
static extern (C) цел    wxTreeEvent_GetKeyCode(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_SetKeyEvent(ЦелУкз сам, ЦелУкз evt);
static extern (C) ЦелУкз wxTreeEvent_GetLabel(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_SetLabel(ЦелУкз сам, ткст ярлык);
static extern (C) бул   wxTreeEvent_IsEditCancelled(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_SetEditCanceled(ЦелУкз сам, бул editCancelled);
//static extern (C) цел    wxTreeEvent_GetCode(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_Veto(ЦелУкз сам);
static extern (C) проц   wxTreeEvent_Allow(ЦелУкз сам);
static extern (C) бул   wxTreeEvent_IsAllowed(ЦелУкз сам);

static extern (C) проц   wxTreeEvent_SetToolTip(ЦелУкз сам, ткст тулТип);
//! \endcond

//-----------------------------------------------------------------------------

alias TreeEvent wxTreeEvent;
public class TreeEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }
    public this(цел типКоманды, цел ид)
    {
        super(wxTreeEvent_ctor(типКоманды, ид));
    }

    //-----------------------------------------------------------------------------

    public TreeItemId Элемент()
    {
        return new TreeItemId(wxTreeEvent_GetItem(wxobj), да);
    }
    public проц Элемент(TreeItemId значение)
    {
        wxTreeEvent_SetItem(wxobj, wxObject.SafePtr(значение));
    }

    public TreeItemId OldItem()
    {
        return new TreeItemId(wxTreeEvent_GetOldItem(wxobj), да);
    }
    public проц OldItem(TreeItemId значение)
    {
        wxTreeEvent_SetOldItem(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public Точка точка()
    {
        Точка тчк;
        wxTreeEvent_GetPoint(wxobj, тчк);
        return тчк;
    }
    public проц точка(Точка значение)
    {
        wxTreeEvent_SetPoint(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public KeyEvent keyEvent()
    {
        return cast(KeyEvent)НайдиОбъект(wxTreeEvent_GetKeyEvent(wxobj), cast(wxObject function(ЦелУкз ptr))&KeyEvent.Нов);
    }
    public проц keyEvent(KeyEvent значение)
    {
        wxTreeEvent_SetKeyEvent(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public цел КодКл()
    {
        return wxTreeEvent_GetKeyCode(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст Ярлык()
    {
        return cast(ткст) new wxString(wxTreeEvent_GetLabel(wxobj), да);
    }
    public проц Ярлык(ткст значение)
    {
        wxTreeEvent_SetLabel(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул IsEditCancelled()
    {
        return wxTreeEvent_IsEditCancelled(wxobj);
    }
    public проц IsEditCancelled(бул значение)
    {
        wxTreeEvent_SetEditCanceled(wxobj, значение);
    }

    public проц ToolTip(ткст значение)
    {
        wxTreeEvent_SetToolTip(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Veto()
    {
        wxTreeEvent_Veto(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Allow()
    {
        wxTreeEvent_Allow(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Allowed()
    {
        return  wxTreeEvent_IsAllowed(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new TreeEvent(объ);
    }

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
static extern (C) ЦелУкз wxArrayTreeItemIds_ctor();
static extern (C) проц   wxArrayTreeItemIds_dtor(ЦелУкз сам);
static extern (C) проц   wxArrayTreeItemIds_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxArrayTreeItemIds_Add(ЦелУкз сам, ЦелУкз доб);
static extern (C) ЦелУкз wxArrayTreeItemIds_Item(ЦелУкз сам, цел чис);
static extern (C) цел    wxArrayTreeItemIds_GetCount(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias ArrayTreeItemIds wxArrayTreeItemIds;
public class ArrayTreeItemIds : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxArrayTreeItemIds_ctor(), да);
        wxArrayTreeItemIds_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    public TreeItemId[] вМассив()
    {
        цел count = this.Счёт();
        TreeItemId[] tmps = new TreeItemId[count];
        for (цел i = 0; i < count; i++)
            tmps[i] = this.Элемент(i);
        return tmps;
    }

    public TreeItemId Элемент(цел чис)
    {
        return new TreeItemId(wxArrayTreeItemIds_Item(wxobj, чис), да);
    }

    public проц Добавь(TreeItemId доб)
    {
        wxArrayTreeItemIds_Add(wxobj, wxObject.SafePtr(доб));
    }

    public цел Счёт()
    {
        return wxArrayTreeItemIds_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxArrayTreeItemIds_dtor(wxobj);
    }
}
