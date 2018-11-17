//-----------------------------------------------------------------------------
// wxD - GridBadSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - gbsizer.h
//
/// The wxGridBagSizer wrapper classes
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: GridBagSizer.d,v 1.10 2009/01/16 14:06:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.GridBagSizer;
public import wx.common;
public import wx.SizerItem;
public import wx.FlexGridSizer;

//version(LDC) { pragma(ldc, "verbose") }

//! \cond EXTERN
static extern (C) ЦелУкз wxGBSizerItem_ctor(цел ширь, цел высь, ЦелУкз поз, ЦелУкз span, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) ЦелУкз wxGBSizerItem_ctorWindow(ЦелУкз окно, ЦелУкз поз, ЦелУкз span, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) ЦелУкз wxGBSizerItem_ctorSizer(ЦелУкз сайзер, ЦелУкз поз, ЦелУкз span, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) ЦелУкз wxGBSizerItem_ctorDefault();

static extern (C) ЦелУкз wxGBSizerItem_GetPos(ЦелУкз сам);

static extern (C) ЦелУкз wxGBSizerItem_GetSpan(ЦелУкз сам);
//static extern (C) проц   wxGBSizerItem_GetSpan(ЦелУкз сам, ЦелУкз rowspan, ЦелУкз colspan);

static extern (C) бул   wxGBSizerItem_SetPos(ЦелУкз сам, ЦелУкз поз);
static extern (C) бул   wxGBSizerItem_SetSpan(ЦелУкз сам, ЦелУкз span);

static extern (C) бул   wxGBSizerItem_IntersectsSizer(ЦелУкз сам, ЦелУкз other);
static extern (C) бул   wxGBSizerItem_IntersectsSpan(ЦелУкз сам, ЦелУкз поз, ЦелУкз span);

static extern (C) проц   wxGBSizerItem_GetEndPos(ЦелУкз сам, inout цел row, inout цел col);
static extern (C) ЦелУкз wxGBSizerItem_GetGBSizer(ЦелУкз сам);
static extern (C) проц   wxGBSizerItem_SetGBSizer(ЦелУкз сам, ЦелУкз сайзер);
//! \endcond

//-----------------------------------------------------------------------------

alias GBSizerItem wxGBSizerItem;
public class GBSizerItem : SizerItem
{
    public this(цел ширь, цел высь, GBPosition поз, GBSpan span, цел flag, цел бордюр, wxObject userData)
    {
        this(wxGBSizerItem_ctor(ширь, высь, wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, бордюр, wxObject.SafePtr(userData)));
    }

    public this(Окно окно, GBPosition поз, GBSpan span, цел flag, цел бордюр, wxObject userData)
    {
        this(wxGBSizerItem_ctorWindow(wxObject.SafePtr(окно), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, бордюр, wxObject.SafePtr(userData)));
    }

    public this(Сайзер сайзер, GBPosition поз, GBSpan span, цел flag, цел бордюр, wxObject userData)
    {
        this(wxGBSizerItem_ctorSizer(wxObject.SafePtr(сайзер), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, бордюр, wxObject.SafePtr(userData)));
    }

    public this()
    {
        this(wxGBSizerItem_ctorDefault());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //-----------------------------------------------------------------------------

    public GBPosition поз()
    {
        return cast(GBPosition)НайдиОбъект(wxGBSizerItem_GetPos(wxobj), &GBPosition.Нов);
    }
    public проц поз(GBPosition значение)
    {
        wxGBSizerItem_SetPos(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public GBSpan Span()
    {
        return cast(GBSpan)НайдиОбъект(wxGBSizerItem_GetSpan(wxobj), &GBSpan.Нов);
    }
    public проц Span(GBSpan значение)
    {
        wxGBSizerItem_SetSpan(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public бул Intersects(GBSizerItem other)
    {
        return wxGBSizerItem_IntersectsSizer(wxobj, wxObject.SafePtr(other));
    }

    public бул Intersects(GBPosition поз, GBSpan span)
    {
        return wxGBSizerItem_IntersectsSpan(wxobj, wxObject.SafePtr(поз), wxObject.SafePtr(span));
    }

    //-----------------------------------------------------------------------------

    public проц GetEndPos(inout цел row, inout цел col)
    {
        wxGBSizerItem_GetEndPos(wxobj, row, col);
    }

    //-----------------------------------------------------------------------------

    public GridBagSizer GBSizer()
    {
        return cast(GridBagSizer)НайдиОбъект(wxGBSizerItem_GetGBSizer(wxobj), &GridBagSizer.Нов);
    }
    public проц GBSizer(GridBagSizer значение)
    {
        wxGBSizerItem_SetGBSizer(wxobj, wxObject.SafePtr(значение));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new GBSizerItem(ptr);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxGBSpan_ctorDefault();
static extern (C) ЦелУкз wxGBSpan_ctor(цел rowspan, цел colspan);

static extern (C) проц   wxGBSpan_SetRowspan(ЦелУкз сам, цел rowspan);
static extern (C) цел    wxGBSpan_GetRowspan(ЦелУкз сам);
static extern (C) цел    wxGBSpan_GetColspan(ЦелУкз сам);
static extern (C) проц   wxGBSpan_SetColspan(ЦелУкз сам, цел colspan);
//! \endcond

//-----------------------------------------------------------------------------

alias GBSpan wxGBSpan;
public class GBSpan : wxObject
{
    public this()
    {
        super(wxGBSpan_ctorDefault());
    }

    public this(цел rowspan, цел colspan)
    {
        super(wxGBSpan_ctor(rowspan, colspan));
    }

    private this(ЦелУкз ptr)
    {
        super(ptr);
    }
    public static wxObject Нов(ЦелУкз ptr)
    {
        return new GBSpan(ptr);
    }

    //-----------------------------------------------------------------------------

    public цел Rowspan()
    {
        return wxGBSpan_GetRowspan(wxobj);
    }
    public проц Rowspan(цел значение)
    {
        wxGBSpan_SetRowspan(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел Colspan()
    {
        return wxGBSpan_GetColspan(wxobj);
    }
    public проц Colspan(цел значение)
    {
        wxGBSpan_SetColspan(wxobj, значение);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxGridBagSizer_ctor(цел vgap, цел hgap);
static extern (C) бул   wxGridBagSizer_AddWindow(ЦелУкз сам, ЦелУкз окно, ЦелУкз поз, ЦелУкз span, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) бул   wxGridBagSizer_AddSizer(ЦелУкз сам, ЦелУкз сайзер, ЦелУкз поз, ЦелУкз span, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) бул   wxGridBagSizer_Add(ЦелУкз сам, цел ширь, цел высь, ЦелУкз поз, ЦелУкз span, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) бул   wxGridBagSizer_AddItem(ЦелУкз сам, ЦелУкз элт);

static extern (C) проц   wxGridBagSizer_GetEmptyCellSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxGridBagSizer_SetEmptyCellSize(ЦелУкз сам, inout Размер рм);
static extern (C) проц   wxGridBagSizer_GetCellSize(ЦелУкз сам, цел row, цел col, inout Размер Размер);

static extern (C) ЦелУкз wxGridBagSizer_GetItemPositionWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) ЦелУкз wxGridBagSizer_GetItemPositionSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) ЦелУкз wxGridBagSizer_GetItemPositionIndex(ЦелУкз сам, цел index);
static extern (C) бул   wxGridBagSizer_SetItemPositionWindow(ЦелУкз сам, ЦелУкз окно, ЦелУкз поз);
static extern (C) бул   wxGridBagSizer_SetItemPositionSizer(ЦелУкз сам, ЦелУкз сайзер, ЦелУкз поз);
static extern (C) бул   wxGridBagSizer_SetItemPositionIndex(ЦелУкз сам, цел index, ЦелУкз поз);

static extern (C) ЦелУкз wxGridBagSizer_GetItemSpanWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) ЦелУкз wxGridBagSizer_GetItemSpanSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) ЦелУкз wxGridBagSizer_GetItemSpanIndex(ЦелУкз сам, цел index);
static extern (C) бул   wxGridBagSizer_SetItemSpanWindow(ЦелУкз сам, ЦелУкз окно, ЦелУкз span);
static extern (C) бул   wxGridBagSizer_SetItemSpanSizer(ЦелУкз сам, ЦелУкз сайзер, ЦелУкз span);
static extern (C) бул   wxGridBagSizer_SetItemSpanIndex(ЦелУкз сам, цел index, ЦелУкз span);

static extern (C) ЦелУкз wxGridBagSizer_FindItemWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) ЦелУкз wxGridBagSizer_FindItemSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) ЦелУкз wxGridBagSizer_FindItemAtPosition(ЦелУкз сам, ЦелУкз поз);
static extern (C) ЦелУкз wxGridBagSizer_FindItemAtPoint(ЦелУкз сам, inout Точка тчк);
static extern (C) ЦелУкз wxGridBagSizer_FindItemWithData(ЦелУкз сам, ЦелУкз userData);

static extern (C) бул   wxGridBagSizer_CheckForIntersectionItem(ЦелУкз сам, ЦелУкз элт, ЦелУкз excludeItem);
static extern (C) бул   wxGridBagSizer_CheckForIntersectionPos(ЦелУкз сам, ЦелУкз поз, ЦелУкз span, ЦелУкз excludeItem);
//! \endcond

alias GridBagSizer wxGridBagSizer;
public class GridBagSizer : FlexGridSizer
{
    //-----------------------------------------------------------------------------

    public this(цел vgap, цел hgap)
    {
        super(wxGridBagSizer_ctor(vgap, hgap));
    }

    private this(ЦелУкз ptr)
    {
        super(ptr);
    }
    public static wxObject Нов(ЦелУкз ptr)
    {
        return new GridBagSizer(ptr);
    }

    //-----------------------------------------------------------------------------

    public бул Добавь(Окно окно, GBPosition поз, GBSpan span, цел flag, цел бордюр, wxObject userData)
    {
        return wxGridBagSizer_AddWindow(wxobj, wxObject.SafePtr(окно), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, бордюр, wxObject.SafePtr(userData));
    }

    public бул Добавь(Сайзер сайзер, GBPosition поз, GBSpan span, цел flag, цел бордюр, wxObject userData)
    {
        return wxGridBagSizer_AddSizer(wxobj, wxObject.SafePtr(сайзер), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, бордюр, wxObject.SafePtr(userData));
    }

    public бул Добавь(цел ширь, цел высь, GBPosition поз, GBSpan span, цел flag, цел бордюр, wxObject userData)
    {
        return wxGridBagSizer_Add(wxobj, ширь, высь, wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, бордюр, wxObject.SafePtr(userData));
    }

    public бул Добавь(GBSizerItem элт)
    {
        return wxGridBagSizer_AddItem(wxobj, wxObject.SafePtr(элт));
    }

    //-----------------------------------------------------------------------------

    public Размер EmptyCellSize()
    {
        Размер Размер;
        wxGridBagSizer_GetEmptyCellSize(wxobj, Размер);
        return Размер;
    }
    public проц EmptyCellSize(Размер значение)
    {
        wxGridBagSizer_SetEmptyCellSize(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public Размер GetCellSize(цел row, цел col)
    {
        Размер Размер;
        wxGridBagSizer_GetCellSize(wxobj, row, col, Размер);
        return Размер;
    }

    //-----------------------------------------------------------------------------

    public GBPosition GetItemPosition(Окно окно)
    {
        return cast(GBPosition)НайдиОбъект(wxGridBagSizer_GetItemPositionWindow(wxobj, wxObject.SafePtr(окно)), &GBPosition.Нов);
    }

    public GBPosition GetItemPosition(Сайзер сайзер)
    {
        return cast(GBPosition)НайдиОбъект(wxGridBagSizer_GetItemPositionSizer(wxobj, wxObject.SafePtr(сайзер)), &GBPosition.Нов);
    }

    public GBPosition GetItemPosition(цел index)
    {
        return cast(GBPosition)НайдиОбъект(wxGridBagSizer_GetItemPositionIndex(wxobj, index), &GBPosition.Нов);
    }

    //-----------------------------------------------------------------------------

    public бул УстItemPosition(Окно окно, GBPosition поз)
    {
        return wxGridBagSizer_SetItemPositionWindow(wxobj, wxObject.SafePtr(окно), wxObject.SafePtr(поз));
    }

    public бул УстItemPosition(Сайзер сайзер, GBPosition поз)
    {
        return wxGridBagSizer_SetItemPositionSizer(wxobj, wxObject.SafePtr(сайзер), wxObject.SafePtr(поз));
    }

    public бул УстItemPosition(цел index, GBPosition поз)
    {
        return wxGridBagSizer_SetItemPositionIndex(wxobj, index, wxObject.SafePtr(поз));
    }

    //-----------------------------------------------------------------------------

    public GBSpan GetItemSpan(Окно окно)
    {
        return cast(GBSpan)НайдиОбъект(wxGridBagSizer_GetItemSpanWindow(wxobj, wxObject.SafePtr(окно)), &GBSpan.Нов);
    }

    public GBSpan GetItemSpan(Сайзер сайзер)
    {
        return cast(GBSpan)НайдиОбъект(wxGridBagSizer_GetItemSpanSizer(wxobj, wxObject.SafePtr(сайзер)), &GBSpan.Нов);
    }

    public GBSpan GetItemSpan(цел index)
    {
        return cast(GBSpan)НайдиОбъект(wxGridBagSizer_GetItemSpanIndex(wxobj, index), &GBSpan.Нов);
    }

    //-----------------------------------------------------------------------------

    public бул УстItemSpan(Окно окно, GBSpan span)
    {
        return wxGridBagSizer_SetItemSpanWindow(wxobj, wxObject.SafePtr(окно), wxObject.SafePtr(span));
    }

    public бул УстItemSpan(Сайзер сайзер, GBSpan span)
    {
        return wxGridBagSizer_SetItemSpanSizer(wxobj, wxObject.SafePtr(сайзер), wxObject.SafePtr(span));
    }

    public бул УстItemSpan(цел index, GBSpan span)
    {
        return wxGridBagSizer_SetItemSpanIndex(wxobj, index, wxObject.SafePtr(span));
    }

    //-----------------------------------------------------------------------------

    public GBSizerItem FindItem(Окно окно)
    {
        return cast(GBSizerItem)НайдиОбъект(wxGridBagSizer_FindItemWindow(wxobj, wxObject.SafePtr(окно)), &GBSizerItem.Нов);
    }

    public GBSizerItem FindItem(Сайзер сайзер)
    {
        return cast(GBSizerItem)НайдиОбъект(wxGridBagSizer_FindItemSizer(wxobj, wxObject.SafePtr(сайзер)), &GBSizerItem.Нов);
    }

    public GBSizerItem FindItemAtPosition(GBPosition поз)
    {
        return cast(GBSizerItem)НайдиОбъект(wxGridBagSizer_FindItemAtPosition(wxobj, wxObject.SafePtr(поз)), &GBSizerItem.Нов);
    }

    public GBSizerItem FindItemAtPoint(Точка тчк)
    {
        return cast(GBSizerItem)НайдиОбъект(wxGridBagSizer_FindItemAtPoint(wxobj, тчк), &GBSizerItem.Нов);
    }

    public GBSizerItem FindItemWithData(wxObject userData)
    {
        return cast(GBSizerItem)НайдиОбъект(wxGridBagSizer_FindItemWithData(wxobj, wxObject.SafePtr(userData)), &GBSizerItem.Нов);
    }

    //-----------------------------------------------------------------------------

    public бул CheckForIntersection(GBSizerItem элт, GBSizerItem excludeItem)
    {
        return wxGridBagSizer_CheckForIntersectionItem(wxobj, wxObject.SafePtr(элт), wxObject.SafePtr(excludeItem));
    }

    public бул CheckForIntersection(GBPosition поз, GBSpan span, GBSizerItem excludeItem)
    {
        return wxGridBagSizer_CheckForIntersectionPos(wxobj, wxObject.SafePtr(поз), wxObject.SafePtr(span), wxObject.SafePtr(excludeItem));
    }

}

//! \cond EXTERN
static extern (C) ЦелУкз wxGBPosition_ctor();
static extern (C) ЦелУкз wxGBPosition_ctorPos(цел row, цел col);
static extern (C) цел    wxGBPosition_GetRow(ЦелУкз сам);
static extern (C) цел    wxGBPosition_GetCol(ЦелУкз сам);
static extern (C) проц   wxGBPosition_SetRow(ЦелУкз сам, цел row);
static extern (C) проц   wxGBPosition_SetCol(ЦелУкз сам, цел col);
//! \endcond

//-----------------------------------------------------------------------------

alias GBPosition wxGBPosition;
public class GBPosition : wxObject
{
    private this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(wxGBPosition_ctor());
    }

    //-----------------------------------------------------------------------------

    //public this(цел row, цел col)
    //    { super(wxGBPosition_ctorPos(row, col)); }

    //-----------------------------------------------------------------------------

    public цел GetRow()
    {
        return wxGBPosition_GetRow(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел GetCol()
    {
        return wxGBPosition_GetCol(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц УстRow(цел row)
    {
        wxGBPosition_SetRow(wxobj, row);
    }

    //-----------------------------------------------------------------------------

    public проц УстCol(цел col)
    {
        wxGBPosition_SetCol(wxobj, col);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new GBPosition(ptr);
    }
}

