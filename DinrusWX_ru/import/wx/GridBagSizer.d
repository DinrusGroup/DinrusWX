module wx.GridBagSizer;
public import wx.common;
public import wx.SizerItem;
public import wx.FlexGridSizer;

//version(LDC) { pragma(ldc, "verbose") }

		//! \cond EXTERN
        static extern (C) IntPtr wxGBSizerItem_ctor(цел ширь, цел высь, IntPtr поз, IntPtr span, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) IntPtr wxGBSizerItem_ctorWindow(IntPtr окно, IntPtr поз, IntPtr span, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) IntPtr wxGBSizerItem_ctorSizer(IntPtr сайзер, IntPtr поз, IntPtr span, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) IntPtr wxGBSizerItem_ctorDefault();

        static extern (C) IntPtr wxGBSizerItem_GetPos(IntPtr сам);

        static extern (C) IntPtr wxGBSizerItem_GetSpan(IntPtr сам);
        //static extern (C) проц   wxGBSizerItem_GetSpan(IntPtr сам, IntPtr rowspan, IntPtr colspan);

        static extern (C) бул   wxGBSizerItem_SetPos(IntPtr сам, IntPtr поз);
        static extern (C) бул   wxGBSizerItem_SetSpan(IntPtr сам, IntPtr span);

        static extern (C) бул   wxGBSizerItem_IntersectsSizer(IntPtr сам, IntPtr other);
        static extern (C) бул   wxGBSizerItem_IntersectsSpan(IntPtr сам, IntPtr поз, IntPtr span);

        static extern (C) проц   wxGBSizerItem_GetEndPos(IntPtr сам, inout цел row, inout цел col);
        static extern (C) IntPtr wxGBSizerItem_GetGBSizer(IntPtr сам);
        static extern (C) проц   wxGBSizerItem_SetGBSizer(IntPtr сам, IntPtr сайзер);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GBSizerItem wxGBSizerItem;
    public class GBSizerItem : SizerItem
    {
        public this(цел ширь, цел высь, GBPosition поз, GBSpan span, цел флаг, цел бордюр, wxObject userData);
        public this(Окно окно, GBPosition поз, GBSpan span, цел флаг, цел бордюр, wxObject userData);
        public this(Сайзер сайзер, GBPosition поз, GBSpan span, цел флаг, цел бордюр, wxObject userData);
        public this();
        public this(IntPtr wxobj) ;
        public GBPosition поз();
        public проц поз(GBPosition значение) ;
        public GBSpan Span() ;
        public проц Span(GBSpan значение) ;
        public бул Intersects(GBSizerItem other);
        public бул Intersects(GBPosition поз, GBSpan span);
        public проц GetEndPos(inout цел row, inout цел col);
        public GridBagSizer GBSizer() ;
        public проц GBSizer(GridBagSizer значение) ;
	public static wxObject Нов(IntPtr ptr) ;
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxGBSpan_ctorDefault();
        static extern (C) IntPtr wxGBSpan_ctor(цел rowspan, цел colspan);

        static extern (C) проц   wxGBSpan_SetRowspan(IntPtr сам, цел rowspan);
        static extern (C) цел    wxGBSpan_GetRowspan(IntPtr сам);
        static extern (C) цел    wxGBSpan_GetColspan(IntPtr сам);
        static extern (C) проц   wxGBSpan_SetColspan(IntPtr сам, цел colspan);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GBSpan wxGBSpan;
    public class GBSpan : wxObject
    {
        public this();
        public this(цел rowspan, цел colspan);
        private this(IntPtr ptr);
	public static wxObject Нов(IntPtr ptr);
        public цел Rowspan() ;
        public проц Rowspan(цел значение) ;
        public цел Colspan();
        public проц Colspan(цел значение) ;
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxGridBagSizer_ctor(цел vgap, цел hgap);
        static extern (C) бул   wxGridBagSizer_AddWindow(IntPtr сам, IntPtr окно, IntPtr поз, IntPtr span, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) бул   wxGridBagSizer_AddSizer(IntPtr сам, IntPtr сайзер, IntPtr поз, IntPtr span, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) бул   wxGridBagSizer_Add(IntPtr сам, цел ширь, цел высь, IntPtr поз, IntPtr span, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) бул   wxGridBagSizer_AddItem(IntPtr сам, IntPtr элт);

        static extern (C) проц   wxGridBagSizer_GetEmptyCellSize(IntPtr сам, inout Размер разм);
        static extern (C) проц   wxGridBagSizer_SetEmptyCellSize(IntPtr сам, inout Размер рм);
        static extern (C) проц   wxGridBagSizer_GetCellSize(IntPtr сам, цел row, цел col, inout Размер разм);

        static extern (C) IntPtr wxGridBagSizer_GetItemPositionWindow(IntPtr сам, IntPtr окно);
        static extern (C) IntPtr wxGridBagSizer_GetItemPositionSizer(IntPtr сам, IntPtr сайзер);
        static extern (C) IntPtr wxGridBagSizer_GetItemPositionIndex(IntPtr сам, цел index);
        static extern (C) бул   wxGridBagSizer_SetItemPositionWindow(IntPtr сам, IntPtr окно, IntPtr поз);
        static extern (C) бул   wxGridBagSizer_SetItemPositionSizer(IntPtr сам, IntPtr сайзер, IntPtr поз);
        static extern (C) бул   wxGridBagSizer_SetItemPositionIndex(IntPtr сам, цел index, IntPtr поз);

        static extern (C) IntPtr wxGridBagSizer_GetItemSpanWindow(IntPtr сам, IntPtr окно);
        static extern (C) IntPtr wxGridBagSizer_GetItemSpanSizer(IntPtr сам, IntPtr сайзер);
        static extern (C) IntPtr wxGridBagSizer_GetItemSpanIndex(IntPtr сам, цел index);
        static extern (C) бул   wxGridBagSizer_SetItemSpanWindow(IntPtr сам, IntPtr окно, IntPtr span);
        static extern (C) бул   wxGridBagSizer_SetItemSpanSizer(IntPtr сам, IntPtr сайзер, IntPtr span);
        static extern (C) бул   wxGridBagSizer_SetItemSpanIndex(IntPtr сам, цел index, IntPtr span);

        static extern (C) IntPtr wxGridBagSizer_FindItemWindow(IntPtr сам, IntPtr окно);
        static extern (C) IntPtr wxGridBagSizer_FindItemSizer(IntPtr сам, IntPtr сайзер);
        static extern (C) IntPtr wxGridBagSizer_FindItemAtPosition(IntPtr сам, IntPtr поз);
        static extern (C) IntPtr wxGridBagSizer_FindItemAtPoint(IntPtr сам, inout Точка тчк);
        static extern (C) IntPtr wxGridBagSizer_FindItemWithData(IntPtr сам, IntPtr userData);

        static extern (C) бул   wxGridBagSizer_CheckForIntersectionItem(IntPtr сам, IntPtr элт, IntPtr excludeItem);
        static extern (C) бул   wxGridBagSizer_CheckForIntersectionPos(IntPtr сам, IntPtr поз, IntPtr span, IntPtr excludeItem);
		//! \endcond

    alias GridBagSizer wxGridBagSizer;
    public class GridBagSizer : FlexGridSizer
    {
        //-----------------------------------------------------------------------------

        public this(цел vgap, цел hgap);
	    private this(IntPtr ptr);
    	public static wxObject Нов(IntPtr ptr) ;
        public бул Добавь(Окно окно, GBPosition поз, GBSpan span, цел флаг, цел бордюр, wxObject userData);
        public бул Добавь(Сайзер сайзер, GBPosition поз, GBSpan span, цел флаг, цел бордюр, wxObject userData);
        public бул Добавь(цел ширь, цел высь, GBPosition поз, GBSpan span, цел флаг, цел бордюр, wxObject userData);
        public бул Добавь(GBSizerItem элт);
        public Размер EmptyCellSize() ;
        public проц EmptyCellSize(Размер значение);
        public Размер GetCellSize(цел row, цел col);
        public GBPosition GetItemPosition(Окно окно);
        public GBPosition GetItemPosition(Сайзер сайзер);
        public GBPosition GetItemPosition(цел index);
        public бул УстItemPosition(Окно окно, GBPosition поз);
        public бул УстItemPosition(Сайзер сайзер, GBPosition поз);
        public бул УстItemPosition(цел index, GBPosition поз);
        public GBSpan GetItemSpan(Окно окно);
        public GBSpan GetItemSpan(Сайзер сайзер);
        public GBSpan GetItemSpan(цел index);
        public бул УстItemSpan(Окно окно, GBSpan span);
        public бул УстItemSpan(Сайзер сайзер, GBSpan span);
        public бул УстItemSpan(цел index, GBSpan span);
        public GBSizerItem FindItem(Окно окно);
        public GBSizerItem FindItem(Сайзер сайзер);
        public GBSizerItem FindItemAtPosition(GBPosition поз);
        public GBSizerItem FindItemAtPoint(Точка тчк);
        public GBSizerItem FindItemWithData(wxObject userData);
        public бул CheckForIntersection(GBSizerItem элт, GBSizerItem excludeItem);
        public бул CheckForIntersection(GBPosition поз, GBSpan span, GBSizerItem excludeItem);
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxGBPosition_ctor();
        static extern (C) IntPtr wxGBPosition_ctorPos(цел row, цел col);
        static extern (C) цел    wxGBPosition_GetRow(IntPtr сам);
        static extern (C) цел    wxGBPosition_GetCol(IntPtr сам);
        static extern (C) проц   wxGBPosition_SetRow(IntPtr сам, цел row);
        static extern (C) проц   wxGBPosition_SetCol(IntPtr сам, цел col);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GBPosition wxGBPosition;
    public class GBPosition : wxObject
    {
	private this(IntPtr ptr);
        public this();
        //public this(цел row, цел col);
        public цел GetRow();
        public цел GetCol();
        public проц УстRow(цел row);
        public проц УстCol(цел col);
	public static wxObject Нов(IntPtr ptr);
    }

