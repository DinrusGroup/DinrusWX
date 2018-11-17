module wx.Brush;
public import wx.common;
public import wx.Bitmap;

		//! \cond EXTERN
		static extern (C) IntPtr wxBLUE_BRUSH_Get();
		static extern (C) IntPtr wxGREEN_BRUSH_Get();
		static extern (C) IntPtr wxWHITE_BRUSH_Get();
		static extern (C) IntPtr wxBLACK_BRUSH_Get();
		static extern (C) IntPtr wxGREY_BRUSH_Get();
		static extern (C) IntPtr wxMEDIUM_GREY_BRUSH_Get();
		static extern (C) IntPtr wxLIGHT_GREY_BRUSH_Get();
		static extern (C) IntPtr wxTRANSPARENT_BRUSH_Get();
		static extern (C) IntPtr wxCYAN_BRUSH_Get();
		static extern (C) IntPtr wxRED_BRUSH_Get();
		
        	static extern (C) IntPtr wxBrush_ctor();
		static extern (C) бул   wxBrush_Ok(IntPtr сам);
		static extern (C) FillStyle wxBrush_GetStyle(IntPtr сам);
		static extern (C) проц   wxBrush_SetStyle(IntPtr сам, FillStyle стиль);
		static extern (C) IntPtr wxBrush_GetStipple(IntPtr сам);
		static extern (C) проц   wxBrush_SetStipple(IntPtr сам, IntPtr stipple);
        	static extern (C) IntPtr wxBrush_GetColour(IntPtr сам);
		static extern (C) проц   wxBrush_SetColour(IntPtr сам, IntPtr col);
		//! \endcond

		//---------------------------------------------------------------------

	alias Кисть wxBrush;
	public class Кисть : GDIObject
	{
		public static Кисть wxBLUE_BRUSH;
		public static Кисть wxGREEN_BRUSH;
		public static Кисть wxWHITE_BRUSH;
		public static Кисть wxBLACK_BRUSH;
		public static Кисть wxGREY_BRUSH;
		public static Кисть wxMEDIUM_GREY_BRUSH;
		public static Кисть wxLIGHT_GREY_BRUSH;
		public static Кисть wxTRANSPARENT_BRUSH;
		public static Кисть wxCYAN_BRUSH;
		public static Кисть wxRED_BRUSH;
		public static Кисть wxNullBrush;

/+
		override public проц Dispose();
+/

		public this();
		public this(IntPtr wxobj);
		public this(Цвет цвет) ;
		public this(Цвет цвет, FillStyle стиль);
		public this(Битмап stippleBitmap) ;
		public this(ткст имя) ;
		public this(ткст имя, FillStyle стиль) ;
		public бул Ок() ;
		public FillStyle Стиль() ;
		public проц Стиль(FillStyle значение) ;
		public Битмап Пунктир() ;
		public проц Пунктир(Битмап значение);
		public Цвет цвет();
		public проц цвет(Цвет значение);
	}
