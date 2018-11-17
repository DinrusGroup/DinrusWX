//-----------------------------------------------------------------------------
// wxD - ListCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ListCtrl.cs
//
/// The wxListCtrl wrapper class
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ListCtrl.d,v 1.12 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.ListCtrl;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.ImageList;

//! \cond EXTERN
static extern (C) ЦелУкз wxListItem_ctor();
static extern (C) проц   wxListItem_Clear(ЦелУкз сам);
static extern (C) проц   wxListItem_ClearAttributes(ЦелУкз сам);
static extern (C) цел    wxListItem_GetAlign(ЦелУкз сам);
static extern (C) ЦелУкз wxListItem_GetBackgroundColour(ЦелУкз сам);
static extern (C) цел    wxListItem_GetColumn(ЦелУкз сам);
static extern (C) ЦелУкз wxListItem_GetData(ЦелУкз сам);
static extern (C) ЦелУкз wxListItem_GetFont(ЦелУкз сам);
static extern (C) цел    wxListItem_GetId(ЦелУкз сам);
static extern (C) цел    wxListItem_GetImage(ЦелУкз сам);
static extern (C) цел    wxListItem_GetMask(ЦелУкз сам);
static extern (C) цел    wxListItem_GetState(ЦелУкз сам);
static extern (C) ЦелУкз wxListItem_GetText(ЦелУкз сам);
static extern (C) ЦелУкз wxListItem_GetTextColour(ЦелУкз сам);
static extern (C) цел    wxListItem_GetWidth(ЦелУкз сам);
static extern (C) проц   wxListItem_SetAlign(ЦелУкз сам, цел alignment);
static extern (C) проц   wxListItem_SetBackgroundColour(ЦелУкз сам, ЦелУкз col);
static extern (C) проц   wxListItem_SetColumn(ЦелУкз сам, цел col);
static extern (C) проц   wxListItem_SetData(ЦелУкз сам, ЦелУкз data);
static extern (C) проц   wxListItem_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) проц   wxListItem_SetId(ЦелУкз сам, цел ид);
static extern (C) проц   wxListItem_SetImage(ЦелУкз сам, цел рисунок);
static extern (C) проц   wxListItem_SetMask(ЦелУкз сам, цел маска);
static extern (C) проц   wxListItem_SetState(ЦелУкз сам, цел state);
static extern (C) проц   wxListItem_SetStateMask(ЦелУкз сам, цел stateMask);
static extern (C) проц   wxListItem_SetText(ЦелУкз сам, ткст текст);
static extern (C) проц   wxListItem_SetTextColour(ЦелУкз сам, ЦелУкз col);
static extern (C) проц   wxListItem_SetWidth(ЦелУкз сам, цел ширь);

static extern (C) ЦелУкз wxListItem_GetAttributes(ЦелУкз сам);
static extern (C) бул   wxListItem_HasAttributes(ЦелУкз сам);
//! \endcond

alias ListItem wxListItem;
public class ListItem : wxObject
{
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxListItem_ctor());
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ListItem(ptr);
    }

    //---------------------------------------------------------------------

    public проц очисть()
    {
        wxListItem_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public проц очистьАтрибуты()
    {
        wxListItem_ClearAttributes(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Align()
    {
        return wxListItem_GetAlign(wxobj);
    }
    public проц Align(цел значение)
    {
        wxListItem_SetAlign(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Цвет цветФона()
    {
        return new Цвет(wxListItem_GetBackgroundColour(wxobj), да);
    }
    public проц цветФона(Цвет значение)
    {
        wxListItem_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public цел Колонка()
    {
        return wxListItem_GetColumn(wxobj);
    }
    public проц Колонка(цел значение)
    {
        wxListItem_SetColumn(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ClientData Data()
    {
        return cast(ClientData)НайдиОбъект(wxListItem_GetData(wxobj));
    }
    public проц Data(ClientData значение)
    {
        wxListItem_SetData(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Шрифт шрифт()
    {
        return new Шрифт(wxListItem_GetFont(wxobj));
    }
    public проц шрифт(Шрифт значение)
    {
        wxListItem_SetFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public цел Ид()
    {
        return wxListItem_GetId(wxobj);
    }
    public проц Ид(цел значение)
    {
        wxListItem_SetId(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Рисунок()
    {
        return wxListItem_GetImage(wxobj);
    }
    public проц Рисунок(цел значение)
    {
        wxListItem_SetImage(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Маска()
    {
        return wxListItem_GetMask(wxobj);
    }
    public проц Маска(цел значение)
    {
        wxListItem_SetMask(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел State()
    {
        return wxListItem_GetState(wxobj);
    }
    public проц State(цел значение)
    {
        wxListItem_SetState(wxobj, значение);
    }

    public проц StateMask(цел значение)
    {
        wxListItem_SetStateMask(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст Text()
    {
        return cast(ткст) new wxString(wxListItem_GetText(wxobj), да);
    }
    public проц Text(ткст значение)
    {
        wxListItem_SetText(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Цвет цветТекста()
    {
        return new Цвет(wxListItem_GetTextColour(wxobj), да);
    }
    public проц цветТекста(Цвет значение)
    {
        wxListItem_SetTextColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public цел Ширь()
    {
        return wxListItem_GetWidth(wxobj);
    }
    public проц Ширь(цел значение)
    {
        wxListItem_SetWidth(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ListItemAttr Attributes()
    {
        return cast(ListItemAttr)НайдиОбъект(wxListItem_GetAttributes(wxobj), &ListItemAttr.Нов);
    }

    //---------------------------------------------------------------------

    public бул HasAttributes()
    {
        return wxListItem_HasAttributes(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxListItemAttr_ctor();
static extern (C) ЦелУкз wxListItemAttr_ctor2(ЦелУкз colText, ЦелУкз colBack, ЦелУкз шрифт);
static extern (C) проц   wxListItemAttr_dtor(ЦелУкз сам);
static extern (C) проц   wxListItemAttr_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxListItemAttr_SetTextColour(ЦелУкз сам, ЦелУкз colText);
static extern (C) проц   wxListItemAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз colBack);
static extern (C) проц   wxListItemAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) бул   wxListItemAttr_HasTextColour(ЦелУкз сам);
static extern (C) бул   wxListItemAttr_HasBackgroundColour(ЦелУкз сам);
static extern (C) бул   wxListItemAttr_HasFont(ЦелУкз сам);
static extern (C) ЦелУкз wxListItemAttr_GetTextColour(ЦелУкз сам);
static extern (C) ЦелУкз wxListItemAttr_GetBackgroundColour(ЦелУкз сам);
static extern (C) ЦелУкз wxListItemAttr_GetFont(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias ListItemAttr wxListItemAttr;
public class ListItemAttr : wxObject
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
        this(wxListItemAttr_ctor(), да);
        wxListItemAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public this(Цвет colText, Цвет colBack, Шрифт шрифт)
    {
        this(wxListItemAttr_ctor2(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт)), да);
        wxListItemAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ListItemAttr(ptr);
    }
    //---------------------------------------------------------------------

    private override проц dtor()
    {
        wxListItemAttr_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public Цвет цветТекста()
    {
        return new Цвет(wxListItemAttr_GetTextColour(wxobj), да);
    }
    public проц цветТекста(Цвет значение)
    {
        wxListItemAttr_SetTextColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Цвет цветФона()
    {
        return new Цвет(wxListItemAttr_GetBackgroundColour(wxobj), да);
    }
    public проц цветФона(Цвет значение)
    {
        wxListItemAttr_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Шрифт шрифт()
    {
        return new Шрифт(wxListItemAttr_GetFont(wxobj), да);
    }
    public проц шрифт(Шрифт значение)
    {
        wxListItemAttr_SetFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public бул ЕстьЦветТекста()
    {
        return wxListItemAttr_HasTextColour(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьЦветФона()
    {
        return wxListItemAttr_HasBackgroundColour(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьШрифт()
    {
        return wxListItemAttr_HasFont(wxobj);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias ЦелУкз function (ListCtrl, цел) Virtual_OnGetItemAttr;
    alias цел function (ListCtrl, цел) Virtual_OnGetItemImage;
    alias цел function (ListCtrl, цел, цел) Virtual_OnGetItemColumnImage;
    alias ткст function (ListCtrl, цел, цел) Virtual_OnGetItemText;

    alias цел function(цел элт1, цел элт2, цел sortData) wxListCtrlCompare;
}

static extern (C) ЦелУкз wxListCtrl_ctor();
static extern (C) проц   wxListCtrl_dtor(ЦелУкз сам);
static extern (C) проц   wxListCtrl_RegisterVirtual(ЦелУкз сам, ListCtrl объ, Virtual_OnGetItemAttr onGetItemAttr,
        Virtual_OnGetItemImage onGetItemImage,
        Virtual_OnGetItemColumnImage onGetItemColumnImage,
        Virtual_OnGetItemText onGetItemText);
static extern (C) бул   wxListCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) бул   wxListCtrl_GetColumn(ЦелУкз сам, цел col, inout ЦелУкз элт);
static extern (C) бул   wxListCtrl_SetColumn(ЦелУкз сам, цел col, ЦелУкз элт);
static extern (C) цел    wxListCtrl_GetColumnWidth(ЦелУкз сам, цел col);
static extern (C) бул   wxListCtrl_SetColumnWidth(ЦелУкз сам, цел col, цел ширь);
static extern (C) цел    wxListCtrl_GetCountPerPage(ЦелУкз сам);
static extern (C) ЦелУкз wxListCtrl_GetItem(ЦелУкз сам, ЦелУкз info, inout бул retval);
static extern (C) бул   wxListCtrl_SetItem(ЦелУкз сам, ЦелУкз info);
static extern (C) цел    wxListCtrl_SetItem_By_Row_Col(ЦелУкз сам, цел index, цел col, ткст ярлык, цел imageId);
static extern (C) цел    wxListCtrl_GetItemState(ЦелУкз сам, цел элт, цел stateMask);
static extern (C) бул   wxListCtrl_SetItemState(ЦелУкз сам, цел элт, цел state, цел stateMask);
static extern (C) бул   wxListCtrl_SetItemImage(ЦелУкз сам, цел элт, цел рисунок, цел selImage);
static extern (C) ЦелУкз wxListCtrl_GetItemText(ЦелУкз сам, цел элт);
static extern (C) проц   wxListCtrl_SetItemText(ЦелУкз сам, цел элт, ткст стр);
static extern (C) ЦелУкз wxListCtrl_GetItemData(ЦелУкз сам, цел элт);
static extern (C) бул   wxListCtrl_SetItemData(ЦелУкз сам, цел элт, ЦелУкз data);
static extern (C) бул   wxListCtrl_SetItemData2(ЦелУкз сам, цел элт, цел data);
static extern (C) бул   wxListCtrl_GetItemRect(ЦелУкз сам, цел элт, out Прямоугольник прям, цел code);
static extern (C) бул   wxListCtrl_GetItemPosition(ЦелУкз сам, цел элт, out Точка поз);
static extern (C) бул   wxListCtrl_SetItemPosition(ЦелУкз сам, цел элт, inout Точка поз);
static extern (C) цел    wxListCtrl_GetItemCount(ЦелУкз сам);
static extern (C) цел    wxListCtrl_GetColumnCount(ЦелУкз сам);
static extern (C) проц   wxListCtrl_SetItemTextColour(ЦелУкз сам, цел элт, ЦелУкз col);
static extern (C) ЦелУкз wxListCtrl_GetItemTextColour(ЦелУкз сам, цел элт);
static extern (C) проц   wxListCtrl_SetItemBackgroundColour(ЦелУкз сам, цел элт, ЦелУкз col);
static extern (C) ЦелУкз wxListCtrl_GetItemBackgroundColour(ЦелУкз сам, цел элт);
static extern (C) цел    wxListCtrl_GetSelectedItemCount(ЦелУкз сам);
static extern (C) ЦелУкз wxListCtrl_GetTextColour(ЦелУкз сам);
static extern (C) проц   wxListCtrl_SetTextColour(ЦелУкз сам, ЦелУкз col);
static extern (C) цел    wxListCtrl_GetTopItem(ЦелУкз сам);
static extern (C) проц   wxListCtrl_SetSingleStyle(ЦелУкз сам, бцел стиль, бул add);
static extern (C) проц   wxListCtrl_SetWindowStyleFlag(ЦелУкз сам, бцел стиль);
static extern (C) цел    wxListCtrl_GetNextItem(ЦелУкз сам, цел элт, цел geometry, цел state);
static extern (C) ЦелУкз wxListCtrl_GetImageList(ЦелУкз сам, цел which);
static extern (C) проц   wxListCtrl_SetImageList(ЦелУкз сам, ЦелУкз imageList, цел which);
static extern (C) проц   wxListCtrl_AssignImageList(ЦелУкз сам, ЦелУкз imageList, цел which);
static extern (C) бул   wxListCtrl_Arrange(ЦелУкз сам, цел flag);
static extern (C) проц   wxListCtrl_ClearAll(ЦелУкз сам);
static extern (C) бул   wxListCtrl_DeleteItem(ЦелУкз сам, цел элт);
static extern (C) бул   wxListCtrl_DeleteAllItems(ЦелУкз сам);
static extern (C) бул   wxListCtrl_DeleteAllColumns(ЦелУкз сам);
static extern (C) бул   wxListCtrl_DeleteColumn(ЦелУкз сам, цел col);
static extern (C) проц   wxListCtrl_SetItemCount(ЦелУкз сам, цел count);
static extern (C) проц   wxListCtrl_EditLabel(ЦелУкз сам, цел элт);
static extern (C) бул   wxListCtrl_EnsureVisible(ЦелУкз сам, цел элт);
static extern (C) цел    wxListCtrl_FindItem(ЦелУкз сам, цел start, ткст стр, бул partial);
static extern (C) цел    wxListCtrl_FindItemData(ЦелУкз сам, цел start, ЦелУкз data);
static extern (C) цел    wxListCtrl_FindItemPoint(ЦелУкз сам, цел start, inout Точка тчк, цел направление);
static extern (C) цел    wxListCtrl_HitTest(ЦелУкз сам, inout Точка Точка, цел флаги);
static extern (C) цел    wxListCtrl_InsertItem(ЦелУкз сам, ЦелУкз info);
static extern (C) цел    wxListCtrl_InsertTextItem(ЦелУкз сам, цел index, ткст ярлык);
static extern (C) цел    wxListCtrl_InsertImageItem(ЦелУкз сам, цел index, цел imageIndex);
static extern (C) цел    wxListCtrl_InsertTextImageItem(ЦелУкз сам, цел index, ткст ярлык, цел imageIndex);
static extern (C) цел    wxListCtrl_InsertColumn(ЦелУкз сам, цел col, ЦелУкз info);
static extern (C) цел    wxListCtrl_InsertTextColumn(ЦелУкз сам, цел col, ткст heading, цел format, цел ширь);
static extern (C) бул   wxListCtrl_ScrollList(ЦелУкз сам, цел dx, цел dy);
static extern (C) бул   wxListCtrl_SortItems(ЦелУкз сам, wxListCtrlCompare fn, цел data);

static extern (C) проц   wxListCtrl_GetViewRect(ЦелУкз сам, inout Прямоугольник прям);

static extern (C) проц   wxListCtrl_RefreshItem(ЦелУкз сам, цел элт);
static extern (C) проц   wxListCtrl_RefreshItems(ЦелУкз сам, цел элтFrom, цел элтTo);
//! \endcond

alias ListCtrl wxListCtrl;
public class ListCtrl : Control
{
    public const цел wxLC_VRULES           = 0x0001;
    public const цел wxLC_HRULES           = 0x0002;

    public const цел wxLC_ICON             = 0x0004;
    public const цел wxLC_SMALL_ICON       = 0x0008;
    public const цел wxLC_LIST             = 0x0010;
    public const цел wxLC_REPORT           = 0x0020;

    public const цел wxLC_ALIGN_TOP        = 0x0040;
    public const цел wxLC_ALIGN_LEFT       = 0x0080;
    public const цел wxLC_AUTO_ARRANGE     = 0x0100;
    public const цел wxLC_VIRTUAL          = 0x0200;
    public const цел wxLC_EDIT_LABELS      = 0x0400;
    public const цел wxLC_NO_HEADER        = 0x0800;
    public const цел wxLC_NO_SORT_HEADER   = 0x1000;
    public const цел wxLC_SINGLE_SEL       = 0x2000;
    public const цел wxLC_SORT_ASCENDING   = 0x4000;
    public const цел wxLC_SORT_DESCENDING  = 0x8000;

    public const цел wxLC_MASK_TYPE        = (wxLC_ICON | wxLC_SMALL_ICON | wxLC_LIST | wxLC_REPORT);
    public const цел wxLC_MASK_ALIGN       = (wxLC_ALIGN_TOP | wxLC_ALIGN_LEFT);
    public const цел wxLC_MASK_SORT        = (wxLC_SORT_ASCENDING | wxLC_SORT_DESCENDING);

    public const цел wxLIST_FORMAT_LEFT     = 0;
    public const цел wxLIST_FORMAT_RIGHT    = 1;
    public const цел wxLIST_FORMAT_CENTRE   = 2;
    public const цел wxLIST_FORMAT_CENTER   = wxLIST_FORMAT_CENTRE;

    public const цел wxLIST_MASK_STATE         = 0x0001;
    public const цел wxLIST_MASK_TEXT          = 0x0002;
    public const цел wxLIST_MASK_IMAGE         = 0x0004;
    public const цел wxLIST_MASK_DATA          = 0x0008;
    public const цел wxLIST_SET_ITEM           = 0x0010;
    public const цел wxLIST_MASK_WIDTH         = 0x0020;
    public const цел wxLIST_MASK_FORMAT        = 0x0040;

    public const цел wxLIST_NEXT_ABOVE     = 1;
    public const цел wxLIST_NEXT_ALL       = 2;
    public const цел wxLIST_NEXT_BELOW     = 3;
    public const цел wxLIST_NEXT_LEFT      = 4;
    public const цел wxLIST_NEXT_RIGHT     = 5;

    public const цел wxLIST_STATE_DONTCARE     = 0x0000;
    public const цел wxLIST_STATE_DROPHILITED  = 0x0001;
    public const цел wxLIST_STATE_FOCUSED      = 0x0002;
    public const цел wxLIST_STATE_SELECTED     = 0x0004;
    public const цел wxLIST_STATE_CUT          = 0x0008;

    public const цел wxLIST_HITTEST_ABOVE          = 0x0001;
    public const цел wxLIST_HITTEST_BELOW          = 0x0002;
    public const цел wxLIST_HITTEST_NOWHERE        = 0x0004;
    public const цел wxLIST_HITTEST_ONITEMICON     = 0x0020;
    public const цел wxLIST_HITTEST_ONITEMLABEL    = 0x0080;
    public const цел wxLIST_HITTEST_ONITEMRIGHT    = 0x0100;
    public const цел wxLIST_HITTEST_ONITEMSTATEICON= 0x0200;
    public const цел wxLIST_HITTEST_TOLEFT         = 0x0400;
    public const цел wxLIST_HITTEST_TORIGHT        = 0x0800;

    public const цел wxLIST_AUTOSIZE			= -1;
    public const цел wxLIST_AUTOSIZE_USEHEADER	= -2;

    //---------------------------------------------------------------------

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxListCtrl_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxLC_ICON, Оценщик оценщик = null, ткст имя = "ListCtrl")
    {
        super(wxListCtrl_ctor());
        if (!создай(родитель, ид, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать ListCtrl");
        }

        wxListCtrl_RegisterVirtual(wxobj, this, &staticOnGetItemAttr,
                                   &staticOnGetItemImage, &staticOnGetItemColumnImage,
                                   &staticOnGetItemText);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ListCtrl(ptr);
    }
    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxLC_ICON, Оценщик оценщик = null, ткст имя = "ListCtrl")
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxListCtrl_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    static extern(C) private ЦелУкз staticOnGetItemAttr(ListCtrl объ, цел элт)
    {
        return wxObject.SafePtr(объ.OnGetItemAttr(элт));
    }
    protected  wxListItemAttr OnGetItemAttr(цел элт)
    {
        return null;
    }

    //---------------------------------------------------------------------

    static extern(C) private цел staticOnGetItemImage(ListCtrl объ, цел элт)
    {
        return объ.OnGetItemImage(элт);
    }
    protected  цел OnGetItemImage(цел элт)
    {
        return -1;
    }

    //---------------------------------------------------------------------

    static extern(C) private цел staticOnGetItemColumnImage(ListCtrl объ, цел элт, цел column)
    {
        return объ.OnGetItemColumnImage(элт, column);
    }
    protected  цел OnGetItemColumnImage(цел элт, цел column)
    {
        return -1;
    }

    //---------------------------------------------------------------------

    static extern(C) private ткст staticOnGetItemText(ListCtrl объ, цел элт, цел column)
    {
        return объ.OnGetItemText(элт, column);
    }
    protected  ткст OnGetItemText(цел элт, цел column)
    {
        assert(0, "Generic OnGetItemText not supposed to be called");
    }

    //---------------------------------------------------------------------

    public бул GetColumn(цел col, out ListItem элт)
    {
        элт = new ListItem();
        return wxListCtrl_GetColumn(wxobj, col, элт.wxobj);
    }

    //---------------------------------------------------------------------

    public бул УстColumn(цел col, ListItem элт)
    {
        return wxListCtrl_SetColumn(wxobj, col, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public цел GetColumnWidth(цел col)
    {
        return wxListCtrl_GetColumnWidth(wxobj, col);
    }

    //---------------------------------------------------------------------

    public бул УстColumnWidth(цел col, цел ширь)
    {
        return wxListCtrl_SetColumnWidth(wxobj, col, ширь);
    }

    //---------------------------------------------------------------------

    public цел CountPerPage()
    {
        return wxListCtrl_GetCountPerPage(wxobj);
    }

    //---------------------------------------------------------------------

    public бул GetItem(inout ListItem info)
    {
        бул retval = false;
        info  = cast(ListItem)НайдиОбъект(wxListCtrl_GetItem(wxobj, wxObject.SafePtr(info), retval), &ListItem.Нов);
        return retval;
    }

    //---------------------------------------------------------------------

    public бул УстItem(ListItem info)
    {
        return wxListCtrl_SetItem(wxobj, wxObject.SafePtr(info));
    }

    public цел УстItem(цел index, цел col, ткст ярлык)
    {
        return УстItem(index, col, ярлык, -1);
    }

    public цел УстItem(цел index, цел col, ткст ярлык, цел imageId)
    {
        return wxListCtrl_SetItem_By_Row_Col(wxobj, index, col, ярлык, imageId);
    }


    //---------------------------------------------------------------------

    public проц УстItemText(цел index, ткст ярлык)
    {
        wxListCtrl_SetItemText(wxobj, index, ярлык);
    }

    //---------------------------------------------------------------------

    public ткст GetItemText(цел элт)
    {
        return cast(ткст) new wxString(wxListCtrl_GetItemText(wxobj, элт), да);
    }

    //---------------------------------------------------------------------

    public цел GetItemState(цел элт, цел stateMask)
    {
        return wxListCtrl_GetItemState(wxobj, элт, stateMask);
    }

    public бул УстItemState(цел элт, цел state, цел stateMask)
    {
        return wxListCtrl_SetItemState(wxobj, элт, state, stateMask);
    }

    //---------------------------------------------------------------------

    public бул УстItemImage(цел элт, цел рисунок, цел selImage)
    {
        return wxListCtrl_SetItemImage(wxobj, элт, рисунок, selImage);
    }

    //---------------------------------------------------------------------

    public ClientData GetItemData(цел элт)
    {
        return cast(ClientData)НайдиОбъект(wxListCtrl_GetItemData(wxobj, элт));
    }

    //---------------------------------------------------------------------

    public бул УстItemData(цел элт, ClientData data)
    {
        return wxListCtrl_SetItemData(wxobj, элт, wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public бул УстItemData(цел элт, цел data)
    {
        return wxListCtrl_SetItemData2(wxobj, элт, data);
    }

    //---------------------------------------------------------------------

    public бул GetItemRect(цел элт, out Прямоугольник прям, цел code)
    {
        return wxListCtrl_GetItemRect(wxobj, элт, прям, code);
    }

    //---------------------------------------------------------------------

    public бул GetItemPosition(цел элт, out Точка поз)
    {
        return wxListCtrl_GetItemPosition(wxobj, элт, поз);
    }

    //---------------------------------------------------------------------

    public бул УстItemPosition(цел элт, Точка поз)
    {
        return wxListCtrl_SetItemPosition(wxobj, элт, поз);
    }

    //---------------------------------------------------------------------

    public цел ItemCount()
    {
        return wxListCtrl_GetItemCount(wxobj);
    }
    public проц ItemCount(цел значение)
    {
        wxListCtrl_SetItemCount(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел ColumnCount()
    {
        return wxListCtrl_GetColumnCount(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстItemTextColour(цел элт, Цвет col)
    {
        wxListCtrl_SetItemTextColour(wxobj, элт, wxObject.SafePtr(col));
    }

    //---------------------------------------------------------------------

    public Цвет GetItemTextColour(цел элт)
    {
        return new Цвет(wxListCtrl_GetItemTextColour(wxobj, элт), да);
    }

    //---------------------------------------------------------------------

    public проц УстItemBackgroundColour(цел элт, Цвет col)
    {
        wxListCtrl_SetItemBackgroundColour(wxobj, элт, wxObject.SafePtr(col));
    }

    //---------------------------------------------------------------------

    public Цвет GetItemBackgroundColour(цел элт)
    {
        return new Цвет(wxListCtrl_GetItemBackgroundColour(wxobj, элт), да);
    }

    //---------------------------------------------------------------------

    public цел SelectedItemCount()
    {
        return wxListCtrl_GetSelectedItemCount(wxobj);
    }

    //---------------------------------------------------------------------

    public Цвет цветТекста()
    {
        return new Цвет(wxListCtrl_GetTextColour(wxobj), да);
    }
    public проц цветТекста(Цвет значение)
    {
        wxListCtrl_SetTextColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public цел TopItem()
    {
        return wxListCtrl_GetTopItem(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстSingleStyle(цел стиль, бул add)
    {
        wxListCtrl_SetSingleStyle(wxobj, cast(бцел)стиль, add);
    }

    //---------------------------------------------------------------------

    public проц WindowStyleFlag(цел значение)
    {
        wxListCtrl_SetWindowStyleFlag(wxobj, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    public цел GetNextItem(цел элт, цел geometry, цел state)
    {
        return wxListCtrl_GetNextItem(wxobj, элт, geometry, state);
    }

    //---------------------------------------------------------------------

    public ImageList GetImageList(цел which)
    {
        return cast(ImageList)НайдиОбъект(wxListCtrl_GetImageList(wxobj, which), &ImageList.Нов);
    }

    //---------------------------------------------------------------------

    public проц УстImageList(ImageList imageList, цел which)
    {
        wxListCtrl_SetImageList(wxobj, wxObject.SafePtr(imageList), which);
    }

    //---------------------------------------------------------------------

    public проц AssignImageList(ImageList imageList, цел which)
    {
        wxListCtrl_AssignImageList(wxobj, wxObject.SafePtr(imageList), which);
    }

    //---------------------------------------------------------------------

    public бул Arrange(цел flag)
    {
        return wxListCtrl_Arrange(wxobj, flag);
    }

    //---------------------------------------------------------------------

    public проц очистьВсё()
    {
        wxListCtrl_ClearAll(wxobj);
    }

    //---------------------------------------------------------------------

    public бул удалиЭлемент(цел элт)
    {
        return wxListCtrl_DeleteItem(wxobj, элт);
    }

    //---------------------------------------------------------------------

    public бул удалиВсеЭлементы()
    {
        return wxListCtrl_DeleteAllItems(wxobj);
    }

    //---------------------------------------------------------------------

    public бул DeleteAllColumns()
    {
        return wxListCtrl_DeleteAllColumns(wxobj);
    }

    //---------------------------------------------------------------------

    public бул DeleteColumn(цел col)
    {
        return wxListCtrl_DeleteColumn(wxobj, col);
    }

    //---------------------------------------------------------------------

    public проц EditLabel(цел элт)
    {
        wxListCtrl_EditLabel(wxobj, элт);
    }

    //---------------------------------------------------------------------

    public бул EnsureVisible(цел элт)
    {
        return wxListCtrl_EnsureVisible(wxobj, элт);
    }

    //---------------------------------------------------------------------

    public цел FindItem(цел start, ткст стр, бул partial)
    {
        return wxListCtrl_FindItem(wxobj, start, стр, partial);
    }

    // TODO: Verify data
    public цел FindItem(цел start, ClientData data)
    {
        return wxListCtrl_FindItemData(wxobj, start, wxObject.SafePtr(data));
    }

    public цел FindItem(цел start, Точка тчк, цел направление)
    {
        return wxListCtrl_FindItemPoint(wxobj, start, тчк, направление);
    }

    //---------------------------------------------------------------------

    public цел ТестНажатия(Точка точка, цел флаги)
    {
        return wxListCtrl_HitTest(wxobj, точка, флаги);
    }

    //---------------------------------------------------------------------

    public цел InsertItem(ListItem info)
    {
        return wxListCtrl_InsertItem(wxobj, wxObject.SafePtr(info));
    }

    public цел InsertItem(цел index, ткст ярлык)
    {
        return wxListCtrl_InsertTextItem(wxobj, index, ярлык);
    }

    public цел InsertItem(цел index, цел imageIndex)
    {
        return wxListCtrl_InsertImageItem(wxobj, index, imageIndex);
    }

    public цел InsertItem(цел index, ткст ярлык, цел imageIndex)
    {
        return wxListCtrl_InsertTextImageItem(wxobj, index, ярлык, imageIndex);
    }

    //---------------------------------------------------------------------

    public цел InsertColumn(цел col, ListItem info)
    {
        return wxListCtrl_InsertColumn(wxobj, col, wxObject.SafePtr(info));
    }

    public цел InsertColumn(цел col, ткст heading)
    {
        return InsertColumn(col, heading, wxLIST_FORMAT_LEFT, -1);
    }

    public цел InsertColumn(цел col, ткст heading, цел format, цел ширь)
    {
        return wxListCtrl_InsertTextColumn(wxobj, col, heading, format, ширь);
    }

    //---------------------------------------------------------------------

    public бул ScrollList(цел dx, цел dy)
    {
        return wxListCtrl_ScrollList(wxobj, dx, dy);
    }

    //---------------------------------------------------------------------

    public Прямоугольник ViewRect()
    {
        Прямоугольник прям;
        wxListCtrl_GetViewRect(wxobj, прям);
        return прям;
    }

    //---------------------------------------------------------------------

    public проц RefreshItem(цел элт)
    {
        wxListCtrl_RefreshItem(wxobj, элт);
    }

    //---------------------------------------------------------------------

    public проц RefreshItems(цел элтFrom, цел элтTo)
    {
        wxListCtrl_RefreshItems(wxobj, элтFrom, элтTo);
    }

    //-----------------------------------------------------------------------------

    public бул SortItems(wxListCtrlCompare fn, цел data)
    {
        бул retval = wxListCtrl_SortItems(wxobj, fn, data);

        fn = null;

        return retval;
    }

    //-----------------------------------------------------------------------------

    public проц BeginDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_DRAG, ИД, значение, this);
    }
    public проц BeginDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц BeginRightDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_RDRAG, ИД, значение, this);
    }
    public проц BeginRightDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц BeginLabelEdit_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT, ИД, значение, this);
    }
    public проц BeginLabelEdit_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц EndLabelEdit_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_END_LABEL_EDIT, ИД, значение, this);
    }
    public проц EndLabelEdit_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemDelete_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_DELETE_ITEM, ИД, значение, this);
    }
    public проц ItemDelete_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemDeleteAll_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS, ИД, значение, this);
    }
    public проц ItemDeleteAll_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц GetInfo_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_GET_INFO, ИД, значение, this);
    }
    public проц GetInfo_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц УстInfo_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_SET_INFO, ИД, значение, this);
    }
    public проц УстInfo_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemSelect_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_SELECTED, ИД, значение, this);
    }
    public проц ItemSelect_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemDeselect_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_DESELECTED, ИД, значение, this);
    }
    public проц ItemDeselect_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemActivate_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_ACTIVATED, ИД, значение, this);
    }
    public проц ItemActivate_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemFocus_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_FOCUSED, ИД, значение, this);
    }
    public проц ItemFocus_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemMiddleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK, ИД, значение, this);
    }
    public проц ItemMiddleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ItemRightClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK, ИД, значение, this);
    }
    public проц ItemRightClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public override проц KeyDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_KEY_DOWN, ИД, значение, this);
    }
    public override проц KeyDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц Insert_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_INSERT_ITEM, ИД, значение, this);
    }
    public проц Insert_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ColumnClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_CLICK, ИД, значение, this);
    }
    public проц ColumnClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ColumnRightClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_RIGHT_CLICK, ИД, значение, this);
    }
    public проц ColumnRightClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ColumnBeginDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_BEGIN_DRAG, ИД, значение, this);
    }
    public проц ColumnBeginDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ColumnDragging_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_DRAGGING, ИД, значение, this);
    }
    public проц ColumnDragging_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц ColumnEndDrag_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_END_DRAG, ИД, значение, this);
    }
    public проц ColumnEndDrag_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    //-----------------------------------------------------------------------------

    public проц CacheHint_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_CACHE_HINT, ИД, значение, this);
    }
    public проц CacheHint_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxListEvent_ctor(цел типКоманды, цел ид);
static extern (C) ЦелУкз wxListEvent_GetItem(ЦелУкз сам);
static extern (C) ЦелУкз wxListEvent_GetLabel(ЦелУкз сам);
static extern (C) цел   wxListEvent_GetIndex(ЦелУкз сам);
static extern (C) цел    wxListEvent_GetKeyCode(ЦелУкз сам);
static extern (C) цел    wxListEvent_GetColumn(ЦелУкз сам);
static extern (C) проц   wxListEvent_GetPoint(ЦелУкз сам, inout Точка тчк);
static extern (C) ЦелУкз wxListEvent_GetText(ЦелУкз сам);
static extern (C) цел wxListEvent_GetImage(ЦелУкз сам);
static extern (C) цел wxListEvent_GetData(ЦелУкз сам);
static extern (C) цел wxListEvent_GetMask(ЦелУкз сам);
static extern (C) цел wxListEvent_GetCacheFrom(ЦелУкз сам);
static extern (C) цел wxListEvent_GetCacheTo(ЦелУкз сам);
static extern (C) бул wxListEvent_IsEditCancelled(ЦелУкз сам);
static extern (C) проц wxListEvent_SetEditCanceled(ЦелУкз сам, бул editCancelled);
static extern (C) проц wxListEvent_Veto(ЦелУкз сам);
static extern (C) проц wxListEvent_Allow(ЦелУкз сам);
static extern (C) бул wxListEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias ListEvent wxListEvent;
public class ListEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел типКоманды, цел ид)
    {
        super(wxListEvent_ctor(типКоманды, ид));
    }

    static Событие Нов(ЦелУкз ptr)
    {
        return new ListEvent(ptr);
    }
    //-----------------------------------------------------------------------------

    public ткст Ярлык()
    {
        return cast(ткст) new wxString(wxListEvent_GetLabel(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public цел КодКл()
    {
        return wxListEvent_GetKeyCode(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Index()
    {
        return wxListEvent_GetIndex(wxobj);
    }

    //---------------------------------------------------------------------

    public ListItem Элемент()
    {
        return new ListItem(wxListEvent_GetItem(wxobj));
    }

    //---------------------------------------------------------------------

    public цел Колонка()
    {
        return wxListEvent_GetColumn(wxobj);
    }

    //---------------------------------------------------------------------

    public Точка точка()
    {
        Точка тчк;
        wxListEvent_GetPoint(wxobj, тчк);
        return тчк;
    }

    //---------------------------------------------------------------------

    public ткст Text()
    {
        return cast(ткст) new wxString(wxListEvent_GetText(wxobj), да);
    }

    //---------------------------------------------------------------------

    public цел Рисунок()
    {
        return wxListEvent_GetImage(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Data()
    {
        return wxListEvent_GetData(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Маска()
    {
        return wxListEvent_GetMask(wxobj);
    }

    //---------------------------------------------------------------------

    public цел CacheFrom()
    {
        return wxListEvent_GetCacheFrom(wxobj);
    }

    //---------------------------------------------------------------------

    public цел CacheTo()
    {
        return wxListEvent_GetCacheTo(wxobj);
    }

    //---------------------------------------------------------------------

    public бул EditCancelled()
    {
        return wxListEvent_IsEditCancelled(wxobj);
    }
    public проц EditCancelled(бул значение)
    {
        wxListEvent_SetEditCanceled(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Veto()
    {
        wxListEvent_Veto(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Allow()
    {
        wxListEvent_Allow(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Allowed()
    {
        return wxListEvent_IsAllowed(wxobj);
    }

    static this()
    {


        wxEVT_COMMAND_LIST_BEGIN_DRAG = wxEvent_EVT_COMMAND_LIST_BEGIN_DRAG();
        wxEVT_COMMAND_LIST_BEGIN_RDRAG = wxEvent_EVT_COMMAND_LIST_BEGIN_RDRAG();
        wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT = wxEvent_EVT_COMMAND_LIST_BEGIN_LABEL_EDIT();
        wxEVT_COMMAND_LIST_END_LABEL_EDIT = wxEvent_EVT_COMMAND_LIST_END_LABEL_EDIT();
        wxEVT_COMMAND_LIST_DELETE_ITEM = wxEvent_EVT_COMMAND_LIST_DELETE_ITEM();
        wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS = wxEvent_EVT_COMMAND_LIST_DELETE_ALL_ITEMS();
        wxEVT_COMMAND_LIST_GET_INFO = wxEvent_EVT_COMMAND_LIST_GET_INFO();
        wxEVT_COMMAND_LIST_SET_INFO = wxEvent_EVT_COMMAND_LIST_SET_INFO();
        wxEVT_COMMAND_LIST_ITEM_SELECTED = wxEvent_EVT_COMMAND_LIST_ITEM_SELECTED();
        wxEVT_COMMAND_LIST_ITEM_DESELECTED = wxEvent_EVT_COMMAND_LIST_ITEM_DESELECTED();
        wxEVT_COMMAND_LIST_ITEM_ACTIVATED = wxEvent_EVT_COMMAND_LIST_ITEM_ACTIVATED();
        wxEVT_COMMAND_LIST_ITEM_FOCUSED = wxEvent_EVT_COMMAND_LIST_ITEM_FOCUSED();
        wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK = wxEvent_EVT_COMMAND_LIST_ITEM_MIDDLE_CLICK();
        wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK = wxEvent_EVT_COMMAND_LIST_ITEM_RIGHT_CLICK();
        wxEVT_COMMAND_LIST_KEY_DOWN = wxEvent_EVT_COMMAND_LIST_KEY_DOWN();
        wxEVT_COMMAND_LIST_INSERT_ITEM = wxEvent_EVT_COMMAND_LIST_INSERT_ITEM();
        wxEVT_COMMAND_LIST_COL_CLICK = wxEvent_EVT_COMMAND_LIST_COL_CLICK();
        wxEVT_COMMAND_LIST_COL_RIGHT_CLICK = wxEvent_EVT_COMMAND_LIST_COL_RIGHT_CLICK();
        wxEVT_COMMAND_LIST_COL_BEGIN_DRAG = wxEvent_EVT_COMMAND_LIST_COL_BEGIN_DRAG();
        wxEVT_COMMAND_LIST_COL_DRAGGING = wxEvent_EVT_COMMAND_LIST_COL_DRAGGING();
        wxEVT_COMMAND_LIST_COL_END_DRAG = wxEvent_EVT_COMMAND_LIST_COL_END_DRAG();
        wxEVT_COMMAND_LIST_CACHE_HINT = wxEvent_EVT_COMMAND_LIST_CACHE_HINT();

        ДобавьТипСоб(wxEVT_COMMAND_LIST_BEGIN_DRAG,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_BEGIN_RDRAG,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_END_LABEL_EDIT,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_DELETE_ITEM,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_GET_INFO,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_SET_INFO,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_SELECTED,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_DESELECTED,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_ACTIVATED,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_FOCUSED,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_KEY_DOWN,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_INSERT_ITEM,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_CLICK,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_RIGHT_CLICK,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_BEGIN_DRAG,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_DRAGGING,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_END_DRAG,	&ListEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LIST_CACHE_HINT,	&ListEvent.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxListView_ctor();
static extern (C) бул wxListView_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) проц   wxListView_RegisterVirtual(ЦелУкз сам, ListCtrl объ, Virtual_OnGetItemAttr onGetItemAttr,
        Virtual_OnGetItemImage onGetItemImage,
        Virtual_OnGetItemColumnImage onGetItemColumnImage,
        Virtual_OnGetItemText onGetItemText);
static extern (C) проц wxListView_Select(ЦелУкз сам, бцел n, бул on);
static extern (C) проц wxListView_Focus(ЦелУкз сам, бцел index);
static extern (C) бцел wxListView_GetFocusedItem(ЦелУкз сам);
static extern (C) бцел wxListView_GetNextSelected(ЦелУкз сам, бцел элт);
static extern (C) бцел wxListView_GetFirstSelected(ЦелУкз сам);
static extern (C) бул wxListView_IsSelected(ЦелУкз сам, бцел index);
static extern (C) проц wxListView_SetColumnImage(ЦелУкз сам, цел col, цел рисунок);
static extern (C) проц wxListView_ClearColumnImage(ЦелУкз сам, цел col);
//! \endcond

//-----------------------------------------------------------------------------

alias ListView wxListView;
public class ListView : ListCtrl
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxListView_ctor());
    }

    public this(Окно родитель)
    {
        this(родитель, Окно.УникИД, вхДефПоз, вхДефРазм, wxLC_REPORT, null, null);
    }

    public this(Окно родитель, цел ид)
    {
        this(родитель, ид, вхДефПоз, вхДефРазм, wxLC_REPORT, null, null);
    }

    public this(Окно родитель, цел ид, Точка поз)
    {
        this(родитель, ид, поз, вхДефРазм, wxLC_REPORT, null, null);
    }

    public this(Окно родитель, цел ид, Точка поз, Размер размер)
    {
        this(родитель, ид, поз, размер, wxLC_REPORT, null, null);
    }

    public this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль)
    {
        this(родитель, ид, поз, размер, стиль, null, null);
    }

    public this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, ид, поз, размер, стиль, оценщик, null);
    }

    public this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        super(wxListView_ctor());
        if (!создай(родитель, ид, поз, размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать ListView");
        }

        wxListView_RegisterVirtual(wxobj, this, &staticOnGetItemAttr,
                                   &staticOnGetItemImage, &staticOnGetItemColumnImage,
                                   &staticOnGetItemText);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз)
    {
        this(родитель, Окно.УникИД, поз, вхДефРазм, wxLC_REPORT, null, null);
    }

    public this(Окно родитель, Точка поз, Размер размер)
    {
        this(родитель, Окно.УникИД, поз, размер, wxLC_REPORT, null, null);
    }

    public this(Окно родитель, Точка поз, Размер размер, цел стиль)
    {
        this(родитель, Окно.УникИД, поз, размер, стиль, null, null);
    }

    public this(Окно родитель, Точка поз, Размер размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, Окно.УникИД, поз, размер, стиль, оценщик, null);
    }

    public this(Окно родитель, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        this(родитель, Окно.УникИД, поз, размер, стиль, оценщик, имя);
    }

    //-----------------------------------------------------------------------------

    public override бул создай(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxListView_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, размер, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //-----------------------------------------------------------------------------

    public проц Select(цел n)
    {
        Select(n, да);
    }

    public проц Select(цел n, бул on)
    {
        wxListView_Select(wxobj, cast(бцел)n, on);
    }

    //-----------------------------------------------------------------------------

    public проц Focus(цел index)
    {
        wxListView_Focus(wxobj, cast(бцел)index);
    }

    //-----------------------------------------------------------------------------

    public цел FocusedItem()
    {
        return cast(цел)wxListView_GetFocusedItem(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел GetNextSelected(цел элт)
    {
        return cast(цел)wxListView_GetNextSelected(wxobj, cast(бцел)элт);
    }

    //-----------------------------------------------------------------------------

    public цел FirstSelected()
    {
        return cast(цел)wxListView_GetFirstSelected(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул IsSelected(цел index)
    {
        return wxListView_IsSelected(wxobj, cast(бцел)index);
    }

    //-----------------------------------------------------------------------------

    public проц УстColumnImage(цел col, цел рисунок)
    {
        wxListView_SetColumnImage(wxobj, col, рисунок);
    }

    //-----------------------------------------------------------------------------

    public проц ClearColumnImage(цел col)
    {
        wxListView_ClearColumnImage(wxobj, col);
    }
}
