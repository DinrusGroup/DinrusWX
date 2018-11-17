module wx.GdiCommon;
public import wx.common;
public import wx.Bitmap;
public import wx.Cursor;
public import wx.Icon;
public import wx.Pen;
public import wx.Brush;
public import wx.Font;
public import wx.Colour;

		//! \cond EXTERN
		static extern (C) IntPtr wxSTANDARD_CURSOR_Get();
		static extern (C) IntPtr wxHOURGLASS_CURSOR_Get();
		static extern (C) IntPtr wxCROSS_CURSOR_Get();

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

		static extern (C) IntPtr wxNullBitmap_Get();
		static extern (C) IntPtr wxNullIcon_Get();
		static extern (C) IntPtr wxNullCursor_Get();
		static extern (C) IntPtr wxNullPen_Get();
		static extern (C) IntPtr wxNullBrush_Get();
		static extern (C) IntPtr wxNullPalette_Get();
		static extern (C) IntPtr wxNullFont_Get();
		static extern (C) IntPtr wxNullColour_Get();
		//! \endcond


	проц InitializeStockObjects();

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxColourDatabase_ctor();
		static extern (C) проц wxColourDataBase_dtor(IntPtr сам);
		static extern (C) IntPtr wxColourDatabase_Find(IntPtr сам, ткст имя);
		static extern (C) IntPtr wxColourDatabase_FindName(IntPtr сам, IntPtr цвет);
		static extern (C) проц wxColourDatabase_AddColour(IntPtr сам, ткст имя, IntPtr цвет);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ColourDatabase wxColourDatabase;
	public class ColourDatabase : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor() ;
		public Цвет Find(ткст имя);
		public ткст FindName(Цвет цвет);
		public проц AddColour(ткст имя, Цвет цвет);
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxPenList_ctor();
		//static extern (C) проц wxPenList_AddPen(IntPtr сам, IntPtr pen);
		//static extern (C) проц wxPenList_RemovePen(IntPtr сам, IntPtr pen);
		static extern (C) IntPtr wxPenList_FindOrCreatePen(IntPtr сам, IntPtr цвет, цел ширь, цел стиль);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias PenList wxPenList;
	public class PenList : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		//public проц AddPen(Pen pen);
		//public проц RemovePen(Pen pen);
		public Pen FindOrCreatePen(Цвет цвет, цел ширь, цел стиль);
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxBrushList_ctor();
		//static extern (C) проц wxBrushList_AddBrush(IntPtr сам, IntPtr brush);
		//static extern (C) проц wxBrushList_RemoveBrush(IntPtr сам, IntPtr brush);
		static extern (C) IntPtr wxBrushList_FindOrCreateBrush(IntPtr сам, IntPtr цвет, цел стиль);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias BrushList wxBrushList;
	public class BrushList : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		//public проц AddBrush(Кисть brush);
		//public проц RemoveBrush(Кисть brush);
		public Кисть FindOrCreateBrush(Цвет цвет, цел стиль);
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxFontList_ctor();
		//static extern (C) проц wxFontList_AddFont(IntPtr сам, IntPtr шрифт);
		//static extern (C) проц wxFontList_RemoveFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxFontList_FindOrCreateFont(IntPtr сам,
			цел размТочки,
			цел семейство,
			цел стиль,
			цел weight,
			бул underline,
			ткст face,
			FontEncoding кодировка);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias FontList wxFontList;
	public class FontList : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		//public проц AddFont(Шрифт шрифт);
		//public проц RemoveFont(Шрифт шрифт);
		public Шрифт FindOrCreateFont(цел размТочки, цел семейство, цел стиль, цел weight);
		public Шрифт FindOrCreateFont(цел размТочки, цел семейство, цел стиль, цел weight, бул underline);
		public Шрифт FindOrCreateFont(цел размТочки, цел семейство, цел стиль, цел weight, бул underline, ткст face);
		public Шрифт FindOrCreateFont(цел размТочки, цел семейство, цел стиль, цел weight, бул underline, ткст face, FontEncoding кодировка);
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxBitmapList_ctor();
		static extern (C) проц   wxBitmapList_AddBitmap(IntPtr сам, IntPtr битмап);
		static extern (C) проц   wxBitmapList_RemoveBitmap(IntPtr сам, IntPtr битмап);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias BitmapList wxBitmapList;
	public class BitmapList : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		public проц AddBitmap(Битмап битмап);
		public проц RemoveBitmap(Битмап битмап);
	}

	//-----------------------------------------------------------------------------
