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
        static extern (C) ЦУк wxGBSizerItem_ctor(цел ширина, цел высота, ЦУк поз, ЦУк span, цел flag, цел border, ЦУк userData);
        static extern (C) ЦУк wxGBSizerItem_ctorWindow(ЦУк окно, ЦУк поз, ЦУк span, цел flag, цел border, ЦУк userData);
        static extern (C) ЦУк wxGBSizerItem_ctorSizer(ЦУк sizer, ЦУк поз, ЦУк span, цел flag, цел border, ЦУк userData);
        static extern (C) ЦУк wxGBSizerItem_ctorDefault();

        static extern (C) ЦУк wxGBSizerItem_GetPos(ЦУк сам);

        static extern (C) ЦУк wxGBSizerItem_GetSpan(ЦУк сам);
        //static extern (C) проц   wxGBSizerItem_GetSpan(ЦУк сам, ЦУк rowspan, ЦУк colspan);

        static extern (C) бул   wxGBSizerItem_SetPos(ЦУк сам, ЦУк поз);
        static extern (C) бул   wxGBSizerItem_SetSpan(ЦУк сам, ЦУк span);

        static extern (C) бул   wxGBSizerItem_IntersectsSizer(ЦУк сам, ЦУк other);
        static extern (C) бул   wxGBSizerItem_IntersectsSpan(ЦУк сам, ЦУк поз, ЦУк span);

        static extern (C) проц   wxGBSizerItem_GetEndPos(ЦУк сам, inout цел row, inout цел col);
        static extern (C) ЦУк wxGBSizerItem_GetGBSizer(ЦУк сам);
        static extern (C) проц   wxGBSizerItem_SetGBSizer(ЦУк сам, ЦУк sizer);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GBSizerItem wxGBSizerItem;
    public class GBSizerItem : SizerItem
    {
        public this(цел ширина, цел высота, GBPosition поз, GBSpan span, цел flag, цел border, wxObject userData)
            { this(wxGBSizerItem_ctor(ширина, высота, wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, border, wxObject.SafePtr(userData))); }

        public this(Окно окно, GBPosition поз, GBSpan span, цел flag, цел border, wxObject userData)
            { this(wxGBSizerItem_ctorWindow(wxObject.SafePtr(окно), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, border, wxObject.SafePtr(userData))); }

        public this(Sizer sizer, GBPosition поз, GBSpan span, цел flag, цел border, wxObject userData)
            { this(wxGBSizerItem_ctorSizer(wxObject.SafePtr(sizer), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, border, wxObject.SafePtr(userData))); }

        public this()
            { this(wxGBSizerItem_ctorDefault()); }

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        public GBPosition Pos() { return cast(GBPosition)FindObject(wxGBSizerItem_GetPos(шхобъ), &GBPosition.Нов); }
        public проц Pos(GBPosition значение) { wxGBSizerItem_SetPos(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public GBSpan Span() { return cast(GBSpan)FindObject(wxGBSizerItem_GetSpan(шхобъ), &GBSpan.Нов); }
        public проц Span(GBSpan значение) { wxGBSizerItem_SetSpan(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public бул Intersects(GBSizerItem other)
        {
            return wxGBSizerItem_IntersectsSizer(шхобъ, wxObject.SafePtr(other));
        }

        public бул Intersects(GBPosition поз, GBSpan span)
        {
            return wxGBSizerItem_IntersectsSpan(шхобъ, wxObject.SafePtr(поз), wxObject.SafePtr(span));
        }

        //-----------------------------------------------------------------------------

        public проц GetEndPos(inout цел row, inout цел col)
        {
            wxGBSizerItem_GetEndPos(шхобъ, row, col);
        }

        //-----------------------------------------------------------------------------

        public GridBagSizer GBSizer() { return cast(GridBagSizer)FindObject(wxGBSizerItem_GetGBSizer(шхобъ), &GridBagSizer.Нов); }
        public проц GBSizer(GridBagSizer значение) { wxGBSizerItem_SetGBSizer(шхобъ, wxObject.SafePtr(значение)); }

	public static wxObject Нов(ЦУк ptr) { return new GBSizerItem(ptr); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxGBSpan_ctorDefault();
        static extern (C) ЦУк wxGBSpan_ctor(цел rowspan, цел colspan);

        static extern (C) проц   wxGBSpan_SetRowspan(ЦУк сам, цел rowspan);
        static extern (C) цел    wxGBSpan_GetRowspan(ЦУк сам);
        static extern (C) цел    wxGBSpan_GetColspan(ЦУк сам);
        static extern (C) проц   wxGBSpan_SetColspan(ЦУк сам, цел colspan);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GBSpan wxGBSpan;
    public class GBSpan : wxObject
    {
        public this()
            { super(wxGBSpan_ctorDefault()); }

        public this(цел rowspan, цел colspan)
            { super(wxGBSpan_ctor(rowspan, colspan)); }

        private this(ЦУк ptr)
            { super(ptr); }
	public static wxObject Нов(ЦУк ptr) { return new GBSpan(ptr); }

        //-----------------------------------------------------------------------------

        public цел Rowspan() { return wxGBSpan_GetRowspan(шхобъ); }
        public проц Rowspan(цел значение) { wxGBSpan_SetRowspan(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Colspan() { return wxGBSpan_GetColspan(шхобъ); }
        public проц Colspan(цел значение) { wxGBSpan_SetColspan(шхобъ, значение); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxGridBagSizer_ctor(цел vgap, цел hgap);
        static extern (C) бул   wxGridBagSizer_AddWindow(ЦУк сам, ЦУк окно, ЦУк поз, ЦУк span, цел flag, цел border, ЦУк userData);
        static extern (C) бул   wxGridBagSizer_AddSizer(ЦУк сам, ЦУк sizer, ЦУк поз, ЦУк span, цел flag, цел border, ЦУк userData);
        static extern (C) бул   wxGridBagSizer_Add(ЦУк сам, цел ширина, цел высота, ЦУк поз, ЦУк span, цел flag, цел border, ЦУк userData);
        static extern (C) бул   wxGridBagSizer_AddItem(ЦУк сам, ЦУк элемент);

        static extern (C) проц   wxGridBagSizer_GetEmptyCellSize(ЦУк сам, inout Размер size);
        static extern (C) проц   wxGridBagSizer_SetEmptyCellSize(ЦУк сам, inout Размер sz);
        static extern (C) проц   wxGridBagSizer_GetCellSize(ЦУк сам, цел row, цел col, inout Размер size);

        static extern (C) ЦУк wxGridBagSizer_GetItemPositionWindow(ЦУк сам, ЦУк окно);
        static extern (C) ЦУк wxGridBagSizer_GetItemPositionSizer(ЦУк сам, ЦУк sizer);
        static extern (C) ЦУк wxGridBagSizer_GetItemPositionIndex(ЦУк сам, цел индекс);
        static extern (C) бул   wxGridBagSizer_SetItemPositionWindow(ЦУк сам, ЦУк окно, ЦУк поз);
        static extern (C) бул   wxGridBagSizer_SetItemPositionSizer(ЦУк сам, ЦУк sizer, ЦУк поз);
        static extern (C) бул   wxGridBagSizer_SetItemPositionIndex(ЦУк сам, цел индекс, ЦУк поз);

        static extern (C) ЦУк wxGridBagSizer_GetItemSpanWindow(ЦУк сам, ЦУк окно);
        static extern (C) ЦУк wxGridBagSizer_GetItemSpanSizer(ЦУк сам, ЦУк sizer);
        static extern (C) ЦУк wxGridBagSizer_GetItemSpanIndex(ЦУк сам, цел индекс);
        static extern (C) бул   wxGridBagSizer_SetItemSpanWindow(ЦУк сам, ЦУк окно, ЦУк span);
        static extern (C) бул   wxGridBagSizer_SetItemSpanSizer(ЦУк сам, ЦУк sizer, ЦУк span);
        static extern (C) бул   wxGridBagSizer_SetItemSpanIndex(ЦУк сам, цел индекс, ЦУк span);

        static extern (C) ЦУк wxGridBagSizer_FindItemWindow(ЦУк сам, ЦУк окно);
        static extern (C) ЦУк wxGridBagSizer_FindItemSizer(ЦУк сам, ЦУк sizer);
        static extern (C) ЦУк wxGridBagSizer_FindItemAtPosition(ЦУк сам, ЦУк поз);
        static extern (C) ЦУк wxGridBagSizer_FindItemAtPoint(ЦУк сам, inout Точка pt);
        static extern (C) ЦУк wxGridBagSizer_FindItemWithData(ЦУк сам, ЦУк userData);

        static extern (C) бул   wxGridBagSizer_CheckForIntersectionItem(ЦУк сам, ЦУк элемент, ЦУк excludeItem);
        static extern (C) бул   wxGridBagSizer_CheckForIntersectionPos(ЦУк сам, ЦУк поз, ЦУк span, ЦУк excludeItem);
		//! \endcond

    alias GridBagSizer wxGridBagSizer;
    public class GridBagSizer : FlexGridSizer
    {
        //-----------------------------------------------------------------------------

        public this(цел vgap, цел hgap)
            { super(wxGridBagSizer_ctor(vgap, hgap)); }

	private this(ЦУк ptr)
	    { super(ptr); }
	public static wxObject Нов(ЦУк ptr) { return new GridBagSizer(ptr); }

        //-----------------------------------------------------------------------------

        public бул Добавь(Окно окно, GBPosition поз, GBSpan span, цел flag, цел border, wxObject userData)
        {
            return wxGridBagSizer_AddWindow(шхобъ, wxObject.SafePtr(окно), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, border, wxObject.SafePtr(userData));
        }

        public бул Добавь(Sizer sizer, GBPosition поз, GBSpan span, цел flag, цел border, wxObject userData)
        {
            return wxGridBagSizer_AddSizer(шхобъ, wxObject.SafePtr(sizer), wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, border, wxObject.SafePtr(userData));
        }

        public бул Добавь(цел ширина, цел высота, GBPosition поз, GBSpan span, цел flag, цел border, wxObject userData)
        {
            return wxGridBagSizer_Add(шхобъ, ширина, высота, wxObject.SafePtr(поз), wxObject.SafePtr(span), flag, border, wxObject.SafePtr(userData));
        }

        public бул Добавь(GBSizerItem элемент)
        {
            return wxGridBagSizer_AddItem(шхобъ, wxObject.SafePtr(элемент));
        }

        //-----------------------------------------------------------------------------

        public Размер EmptyCellSize() { 
                Размер size;
                wxGridBagSizer_GetEmptyCellSize(шхобъ, size);
                return size;
            }
        public проц EmptyCellSize(Размер значение) { wxGridBagSizer_SetEmptyCellSize(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public Размер GetCellSize(цел row, цел col)
        {
            Размер size;
            wxGridBagSizer_GetCellSize(шхобъ, row, col, size);
            return size;
        }

        //-----------------------------------------------------------------------------

        public GBPosition GetItemPosition(Окно окно)
        {
            return cast(GBPosition)FindObject(wxGridBagSizer_GetItemPositionWindow(шхобъ, wxObject.SafePtr(окно)), &GBPosition.Нов);
        }

        public GBPosition GetItemPosition(Sizer sizer)
        {
            return cast(GBPosition)FindObject(wxGridBagSizer_GetItemPositionSizer(шхобъ, wxObject.SafePtr(sizer)), &GBPosition.Нов);
        }

        public GBPosition GetItemPosition(цел индекс)
        {
            return cast(GBPosition)FindObject(wxGridBagSizer_GetItemPositionIndex(шхобъ, индекс), &GBPosition.Нов);
        }

        //-----------------------------------------------------------------------------

        public бул SetItemPosition(Окно окно, GBPosition поз)
        {
            return wxGridBagSizer_SetItemPositionWindow(шхобъ, wxObject.SafePtr(окно), wxObject.SafePtr(поз));
        }

        public бул SetItemPosition(Sizer sizer, GBPosition поз)
        {
            return wxGridBagSizer_SetItemPositionSizer(шхобъ, wxObject.SafePtr(sizer), wxObject.SafePtr(поз));
        }

        public бул SetItemPosition(цел индекс, GBPosition поз)
        {
            return wxGridBagSizer_SetItemPositionIndex(шхобъ, индекс, wxObject.SafePtr(поз));
        }

        //-----------------------------------------------------------------------------

        public GBSpan GetItemSpan(Окно окно)
        {
            return cast(GBSpan)FindObject(wxGridBagSizer_GetItemSpanWindow(шхобъ, wxObject.SafePtr(окно)), &GBSpan.Нов);
        }

        public GBSpan GetItemSpan(Sizer sizer)
        {
            return cast(GBSpan)FindObject(wxGridBagSizer_GetItemSpanSizer(шхобъ, wxObject.SafePtr(sizer)), &GBSpan.Нов);
        }

        public GBSpan GetItemSpan(цел индекс)
        {
            return cast(GBSpan)FindObject(wxGridBagSizer_GetItemSpanIndex(шхобъ, индекс), &GBSpan.Нов);
        }

        //-----------------------------------------------------------------------------

        public бул SetItemSpan(Окно окно, GBSpan span)
        {
            return wxGridBagSizer_SetItemSpanWindow(шхобъ, wxObject.SafePtr(окно), wxObject.SafePtr(span));
        }

        public бул SetItemSpan(Sizer sizer, GBSpan span)
        {
            return wxGridBagSizer_SetItemSpanSizer(шхобъ, wxObject.SafePtr(sizer), wxObject.SafePtr(span));
        }

        public бул SetItemSpan(цел индекс, GBSpan span)
        {
            return wxGridBagSizer_SetItemSpanIndex(шхобъ, индекс, wxObject.SafePtr(span));
        }

        //-----------------------------------------------------------------------------

        public GBSizerItem FindItem(Окно окно)
        {
            return cast(GBSizerItem)FindObject(wxGridBagSizer_FindItemWindow(шхобъ, wxObject.SafePtr(окно)), &GBSizerItem.Нов);
        }

        public GBSizerItem FindItem(Sizer sizer)
        {
            return cast(GBSizerItem)FindObject(wxGridBagSizer_FindItemSizer(шхобъ, wxObject.SafePtr(sizer)), &GBSizerItem.Нов);
        }

        public GBSizerItem FindItemAtPosition(GBPosition поз)
        {
            return cast(GBSizerItem)FindObject(wxGridBagSizer_FindItemAtPosition(шхобъ, wxObject.SafePtr(поз)), &GBSizerItem.Нов);
        }

        public GBSizerItem FindItemAtPoint(Точка pt)
        {
            return cast(GBSizerItem)FindObject(wxGridBagSizer_FindItemAtPoint(шхобъ, pt), &GBSizerItem.Нов);
        }

        public GBSizerItem FindItemWithData(wxObject userData)
        {
            return cast(GBSizerItem)FindObject(wxGridBagSizer_FindItemWithData(шхобъ, wxObject.SafePtr(userData)), &GBSizerItem.Нов);
        }

        //-----------------------------------------------------------------------------

        public бул CheckForIntersection(GBSizerItem элемент, GBSizerItem excludeItem)
        {
            return wxGridBagSizer_CheckForIntersectionItem(шхобъ, wxObject.SafePtr(элемент), wxObject.SafePtr(excludeItem));
        }

        public бул CheckForIntersection(GBPosition поз, GBSpan span, GBSizerItem excludeItem)
        {
            return wxGridBagSizer_CheckForIntersectionPos(шхобъ, wxObject.SafePtr(поз), wxObject.SafePtr(span), wxObject.SafePtr(excludeItem));
        }

    }

		//! \cond EXTERN
        static extern (C) ЦУк wxGBPosition_ctor();
        static extern (C) ЦУк wxGBPosition_ctorPos(цел row, цел col);
        static extern (C) цел    wxGBPosition_GetRow(ЦУк сам);
        static extern (C) цел    wxGBPosition_GetCol(ЦУк сам);
        static extern (C) проц   wxGBPosition_SetRow(ЦУк сам, цел row);
        static extern (C) проц   wxGBPosition_SetCol(ЦУк сам, цел col);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GBPosition wxGBPosition;
    public class GBPosition : wxObject
    {
	private this(ЦУк ptr)
	    { super(ptr); }

        public this()
            { super(wxGBPosition_ctor()); }

        //-----------------------------------------------------------------------------

        //public this(цел row, цел col)
        //    { super(wxGBPosition_ctorPos(row, col)); }

        //-----------------------------------------------------------------------------

        public цел GetRow()
        {
            return wxGBPosition_GetRow(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public цел GetCol()
        {
            return wxGBPosition_GetCol(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц SetRow(цел row)
        {
            wxGBPosition_SetRow(шхобъ, row);
        }

        //-----------------------------------------------------------------------------

        public проц SetCol(цел col)
        {
            wxGBPosition_SetCol(шхобъ, col);
        }

	public static wxObject Нов(ЦУк ptr) { return new GBPosition(ptr); }
    }

