module wx.Pen;
public import wx.common;
public import wx.Defs;
public import wx.GDIObject;
public import wx.Colour;

		//! \cond EXTERN
		static extern (C) IntPtr wxGDIObj_GetRedPen();
		static extern (C) IntPtr wxGDIObj_GetCyanPen();
		static extern (C) IntPtr wxGDIObj_GetGreenPen();
		static extern (C) IntPtr wxGDIObj_GetBlackPen();
		static extern (C) IntPtr wxGDIObj_GetWhitePen();
		static extern (C) IntPtr wxGDIObj_GetTransparentPen();
		static extern (C) IntPtr wxGDIObj_GetBlackDashedPen();
		static extern (C) IntPtr wxGDIObj_GetGreyPen();
		static extern (C) IntPtr wxGDIObj_GetMediumGreyPen();
		static extern (C) IntPtr wxGDIObj_GetLightGreyPen();

		static extern (C) IntPtr wxPen_ctor(IntPtr col, цел ширь, FillStyle стиль);
		static extern (C) IntPtr wxPen_ctorByName(ткст имя, цел ширь, FillStyle стиль);

		static extern (C) IntPtr wxPen_GetColour(IntPtr сам);
		static extern (C) проц   wxPen_SetColour(IntPtr сам, IntPtr col);

		static extern (C) проц   wxPen_SetWidth(IntPtr сам, цел ширь);
		static extern (C) цел    wxPen_GetWidth(IntPtr сам);

		static extern (C) цел    wxPen_GetCap(IntPtr сам);
		static extern (C) цел    wxPen_GetJoin(IntPtr сам);
		static extern (C) цел    wxPen_GetStyle(IntPtr сам);
		static extern (C) бул   wxPen_Ok(IntPtr сам);
		static extern (C) проц   wxPen_SetCap(IntPtr сам, цел capStyle);
		static extern (C) проц   wxPen_SetJoin(IntPtr сам, цел join_style);
		static extern (C) проц   wxPen_SetStyle(IntPtr сам, цел стиль);

		//---------------------------------------------------------------------
		static extern (C) IntPtr wxNullPen_Get();
		//! \endcond

	alias Pen wxPen;
	public class Pen : GDIObject
	{
		public static Pen wxRED_PEN;
		public static Pen wxCYAN_PEN;
		public static Pen wxGREEN_PEN;
		public static Pen wxBLACK_PEN;
		public static Pen wxWHITE_PEN;
		public static Pen wxTRANSPARENT_PEN;
		public static Pen wxBLACK_DASHED_PEN;
		public static Pen wxGREY_PEN;
		public static Pen wxMEDIUM_GREY_PEN;
		public static Pen wxLIGHT_GREY_PEN;
		public static Pen wxNullPen;

		public this(IntPtr wxobj) ;
		public this(ткст имя) ;
		public this(ткст имя, цел ширь) ;
		public this(ткст имя, цел ширь, FillStyle стиль) ;
		public this(Цвет цвет) ;
		public this(Цвет цвет, цел ширь) ;
		public this(Цвет col, цел ширь, FillStyle стиль);
		public Цвет цвет();
		public проц цвет(Цвет значение) ;
		public цел Ширь();
		public проц Ширь(цел значение);
		public цел Cap() ;
		public проц Cap(цел значение) ;
		public цел Join() ;
		public проц Join(цел значение) ;
		public цел Стиль() ;
		public проц Стиль(цел значение) ;
		public бул Ок() ;
		static wxObject Нов(IntPtr ptr) ;
	}
