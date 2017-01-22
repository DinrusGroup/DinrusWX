//-----------------------------------------------------------------------------
// wxD - СобАктивирования.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - СобАктивирования.cs
//
/// The wxActivateEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GdiCommon.d,v 1.11 2007/02/01 00:09:34 afb Exp $
//-----------------------------------------------------------------------------

module wx.GdiCommon;
public import wx.common;
public import wx.Bitmap;
public import wx.Cursor;
public import wx.Icon;
public import wx.Перо;
public import wx.Brush;
public import wx.Шрифт;
public import wx.Colour;

		//! \cond EXTERN
		static extern (C) ЦУк wxSTANDARD_CURSOR_Get();
		static extern (C) ЦУк wxHOURGLASS_CURSOR_Get();
		static extern (C) ЦУк wxCROSS_CURSOR_Get();
		
		static extern (C) ЦУк wxGDIObj_GetRedPen();
		static extern (C) ЦУк wxGDIObj_GetCyanPen();
		static extern (C) ЦУк wxGDIObj_GetGreenPen();
		static extern (C) ЦУк wxGDIObj_GetBlackPen();
		static extern (C) ЦУк wxGDIObj_GetWhitePen();
		static extern (C) ЦУк wxGDIObj_GetTransparentPen();
		static extern (C) ЦУк wxGDIObj_GetBlackDashedPen();
		static extern (C) ЦУк wxGDIObj_GetGreyPen();
		static extern (C) ЦУк wxGDIObj_GetMediumGreyPen();
		static extern (C) ЦУк wxGDIObj_GetLightGreyPen();

		static extern (C) ЦУк wxBLUE_BRUSH_Get();
		static extern (C) ЦУк wxGREEN_BRUSH_Get();
		static extern (C) ЦУк wxWHITE_BRUSH_Get();
		static extern (C) ЦУк wxBLACK_BRUSH_Get();
		static extern (C) ЦУк wxGREY_BRUSH_Get();
		static extern (C) ЦУк wxMEDIUM_GREY_BRUSH_Get();
		static extern (C) ЦУк wxLIGHT_GREY_BRUSH_Get();
		static extern (C) ЦУк wxTRANSPARENT_BRUSH_Get();
		static extern (C) ЦУк wxCYAN_BRUSH_Get();
		static extern (C) ЦУк wxRED_BRUSH_Get();

		static extern (C) ЦУк wxNullBitmap_Get();
		static extern (C) ЦУк wxNullIcon_Get();
		static extern (C) ЦУк wxNullCursor_Get();
		static extern (C) ЦУк wxNullPen_Get();
		static extern (C) ЦУк wxNullBrush_Get();
		static extern (C) ЦУк wxNullPalette_Get();
		static extern (C) ЦУк wxNullFont_Get();
		static extern (C) ЦУк wxNullColour_Get();
		//! \endcond
		

	проц InitializeStockObjects()
	{
			Cursor.wxSTANDARD_CURSOR = new Cursor(wxSTANDARD_CURSOR_Get());
			Cursor.wxHOURGLASS_CURSOR = new Cursor(wxHOURGLASS_CURSOR_Get());
			Cursor.wxCROSS_CURSOR = new Cursor(wxCROSS_CURSOR_Get());

			Перо.wxRED_PEN = new Перо(wxGDIObj_GetRedPen());
			Перо.wxCYAN_PEN = new Перо(wxGDIObj_GetCyanPen());
			Перо.wxGREEN_PEN = new Перо(wxGDIObj_GetGreenPen());
			Перо.wxBLACK_PEN = new Перо(wxGDIObj_GetBlackPen());
			Перо.wxWHITE_PEN = new Перо(wxGDIObj_GetWhitePen());
			Перо.wxTRANSPARENT_PEN = new Перо(wxGDIObj_GetTransparentPen());
			Перо.wxBLACK_DASHED_PEN = new Перо(wxGDIObj_GetBlackDashedPen());
			Перо.wxGREY_PEN = new Перо(wxGDIObj_GetGreyPen());
			Перо.wxMEDIUM_GREY_PEN = new Перо(wxGDIObj_GetMediumGreyPen());
			Перо.wxLIGHT_GREY_PEN = new Перо(wxGDIObj_GetLightGreyPen());

			Кисть.wxBLUE_BRUSH = new Кисть(wxBLUE_BRUSH_Get());
			Кисть.wxGREEN_BRUSH = new Кисть(wxGREEN_BRUSH_Get());
			Кисть.wxWHITE_BRUSH = new Кисть(wxWHITE_BRUSH_Get());
			Кисть.wxBLACK_BRUSH = new Кисть(wxBLACK_BRUSH_Get());
			Кисть.wxGREY_BRUSH = new Кисть(wxGREY_BRUSH_Get());
			Кисть.wxMEDIUM_GREY_BRUSH = new Кисть(wxMEDIUM_GREY_BRUSH_Get());
			Кисть.wxLIGHT_GREY_BRUSH = new Кисть(wxLIGHT_GREY_BRUSH_Get());
			Кисть.wxTRANSPARENT_BRUSH = new Кисть(wxTRANSPARENT_BRUSH_Get());
			Кисть.wxCYAN_BRUSH = new Кисть(wxCYAN_BRUSH_Get());
			Кисть.wxRED_BRUSH = new Кисть(wxRED_BRUSH_Get());

			Цвет.wxBLACK       = new Цвет("Black");
			Цвет.wxWHITE       = new Цвет("White");
			Цвет.wxRED         = new Цвет("Красный");
			Цвет.wxBLUE        = new Цвет("Синий");
			Цвет.wxGREEN       = new Цвет("Зелёный");
			Цвет.wxCYAN        = new Цвет("Cyan");
			Цвет.wxLIGHT_GREY  = new Цвет("Light Gray");

			Битмап.wxNullBitmap = new Битмап(wxNullBitmap_Get());
			Icon.wxNullIcon = new Icon(wxNullIcon_Get());
			Cursor.wxNullCursor = new Cursor(wxNullCursor_Get());
			Перо.wxNullPen = new Перо(wxNullPen_Get());
			Кисть.wxNullBrush = new Кисть(wxNullBrush_Get());
			Палитра.wxNullPalette = new Палитра(wxNullPalette_Get());
			Шрифт.wxNullFont = new Шрифт(wxNullFont_Get());
			Цвет.wxNullColour = new Цвет(wxNullColour_Get());
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxColourDatabase_ctor();
		static extern (C) проц wxColourDataBase_dtor(ЦУк сам);
		static extern (C) ЦУк wxColourDatabase_Find(ЦУк сам, ткст имя);
		static extern (C) ЦУк wxColourDatabase_FindName(ЦУк сам, ЦУк colour);
		static extern (C) проц wxColourDatabase_AddColour(ЦУк сам, ткст имя, ЦУк colour);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias ColourDatabase wxColourDatabase;
	public class ColourDatabase : wxObject
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
			{ this(wxColourDatabase_ctor(), да);}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxColourDataBase_dtor(шхобъ); }
			
		//-----------------------------------------------------------------------------
			
		public Цвет Find(ткст имя)
		{
			return new Цвет(wxColourDatabase_Find(шхобъ, имя), да);
		}
		
		//-----------------------------------------------------------------------------
		
		public ткст FindName(Цвет colour)
		{
			return cast(ткст) new wxString(wxColourDatabase_FindName(шхобъ, wxObject.SafePtr(colour)), да);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц AddColour(ткст имя, Цвет colour)
		{
			wxColourDatabase_AddColour(шхобъ, имя, wxObject.SafePtr(colour));
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxPenList_ctor();
		static extern (C) проц wxPenList_AddPen(ЦУк сам, ЦУк перо);
		static extern (C) проц wxPenList_RemovePen(ЦУк сам, ЦУк перо);
		//static extern (C) ЦУк wxPenList_FindOrCreatePen(ЦУк сам, ЦУк colour, цел ширина, цел стиль);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias PenList wxPenList;
	public class PenList : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxPenList_ctor());}
			
		//-----------------------------------------------------------------------------
			
		public проц AddPen(Перо перо)
		{
			wxPenList_AddPen(шхобъ, wxObject.SafePtr(перо));
		}
		
		//-----------------------------------------------------------------------------
		
		public проц RemovePen(Перо перо)
		{
			wxPenList_RemovePen(шхобъ, wxObject.SafePtr(перо));
		}
		
		//-----------------------------------------------------------------------------
	/+	
		public Перо FindOrCreatePen(Цвет colour, цел ширина, цел стиль)
		{
			return new Перо(wxPenList_FindOrCreatePen(шхобъ, wxObject.SafePtr(colour), ширина, стиль));
		}
		
		+/
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxBrushList_ctor();
		static extern (C) проц wxBrushList_AddBrush(ЦУк сам, ЦУк кисть);
		static extern (C) проц wxBrushList_RemoveBrush(ЦУк сам, ЦУк кисть);
		//static extern (C) ЦУк wxBrushList_FindOrCreateBrush(ЦУк сам, ЦУк colour, цел стиль);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias BrushList wxBrushList;
	public class BrushList : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxBrushList_ctor());}
			
		//-----------------------------------------------------------------------------
			
		public проц AddBrush(Кисть кисть)
		{
			wxBrushList_AddBrush(шхобъ, wxObject.SafePtr(кисть));
		}
		
		//-----------------------------------------------------------------------------
		
		public проц RemoveBrush(Кисть кисть)
		{
			wxBrushList_RemoveBrush(шхобъ, wxObject.SafePtr(кисть));
		}
		
		//-----------------------------------------------------------------------------
		/+
		public Кисть FindOrCreateBrush(Цвет colour, цел стиль)
		{
			return new Кисть(wxBrushList_FindOrCreateBrush(шхобъ, wxObject.SafePtr(colour), стиль));
		}
		+/
	}	
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxFontList_ctor();
		static extern (C) проц wxFontList_AddFont(ЦУк сам, ЦУк шрифт);
		static extern (C) проц wxFontList_RemoveFont(ЦУк сам, ЦУк шрифт);
		/*static extern (C) ЦУк wxFontList_FindOrCreateFont(ЦУк сам, 
			цел pointSize, 
			цел family, 
			цел стиль, 
			цел weight,
			бул underline,
			ткст face,
			FontEncoding encoding);*/
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias FontList wxFontList;
	public class FontList : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxFontList_ctor());}
			
		//-----------------------------------------------------------------------------
			
		public проц AddFont(Шрифт шрифт)
		{
			wxFontList_AddFont(шхобъ, wxObject.SafePtr(шрифт));
		}
		
		//-----------------------------------------------------------------------------
		
		public проц RemoveFont(Шрифт шрифт)
		{
			wxFontList_RemoveFont(шхобъ, wxObject.SafePtr(шрифт));
		}
		
		//-----------------------------------------------------------------------------
	/+	
		public Шрифт FindOrCreateFont(цел pointSize, цел family, цел стиль, цел weight)
		{
			return FindOrCreateFont(pointSize, family, стиль, weight, нет, "", FontEncoding.wxFONTENCODING_DEFAULT);
		}
		
		public Шрифт FindOrCreateFont(цел pointSize, цел family, цел стиль, цел weight, бул underline)
		{
			return FindOrCreateFont(pointSize, family, стиль, weight, underline, "", FontEncoding.wxFONTENCODING_DEFAULT);
		}

		public Шрифт FindOrCreateFont(цел pointSize, цел family, цел стиль, цел weight, бул underline, ткст face)
		{
			return FindOrCreateFont(pointSize, family, стиль, weight, underline, face, FontEncoding.wxFONTENCODING_DEFAULT);
		}
		
		
		public Шрифт FindOrCreateFont(цел pointSize, цел family, цел стиль, цел weight, бул underline, ткст face, FontEncoding encoding)
		{
			return new Шрифт(wxFontList_FindOrCreateFont(шхобъ, pointSize, family, стиль, weight, underline, face, encoding));
		}
		+/
	}		
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxBitmapList_ctor();
		static extern (C) проц   wxBitmapList_AddBitmap(ЦУк сам, ЦУк битмап);
		static extern (C) проц   wxBitmapList_RemoveBitmap(ЦУк сам, ЦУк битмап);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias BitmapList wxBitmapList;
	public class BitmapList : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxBitmapList_ctor());}
			
		//-----------------------------------------------------------------------------
		
		public проц AddBitmap(Битмап битмап)
		{
			wxBitmapList_AddBitmap(шхобъ, wxObject.SafePtr(битмап));
		}
		
		//-----------------------------------------------------------------------------
		
		public проц RemoveBitmap(Битмап битмап)
		{
			wxBitmapList_RemoveBitmap(шхобъ, wxObject.SafePtr(битмап));
		}
	}
	
	//-----------------------------------------------------------------------------
