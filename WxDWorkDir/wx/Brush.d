//-----------------------------------------------------------------------------
// wxD - Кисть.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Кисть.cs
//
/// The wxBrush wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Кисть.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Brush;
public import wx.common;
public import wx.Bitmap;

		//! \cond EXTERN
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
		
        	static extern (C) ЦУк wxBrush_ctor();
		static extern (C) бул   wxBrush_Ok(ЦУк сам);
		static extern (C) СтильЗаливки wxBrush_GetStyle(ЦУк сам);
		static extern (C) проц   wxBrush_SetStyle(ЦУк сам, СтильЗаливки стиль);
		static extern (C) ЦУк wxBrush_GetStipple(ЦУк сам);
		static extern (C) проц   wxBrush_SetStipple(ЦУк сам, ЦУк stipple);
        	static extern (C) ЦУк wxBrush_GetColour(ЦУк сам);
		static extern (C) проц   wxBrush_SetColour(ЦУк сам, ЦУк col);
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
		override public проц Dispose()
		{
			if (this !== wxBLUE_BRUSH
			&&  this !== wxGREEN_BRUSH
			&&  this !== wxWHITE_BRUSH
			&&  this !== wxBLACK_BRUSH
			&&  this !== wxGREY_BRUSH
			&&  this !== wxMEDIUM_GREY_BRUSH
			&&  this !== wxLIGHT_GREY_BRUSH
			&&  this !== wxTRANSPARENT_BRUSH
			&&  this !== wxCYAN_BRUSH
			&&  this !== wxRED_BRUSH) {
				super.Dispose();
			}
		}
+/
		//---------------------------------------------------------------------
        
		public this()
			{ this(wxBrush_ctor()); }

		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this(Цвет colour) 
			{ this(colour, СтильЗаливки.wxSOLID); }
			
		public this(Цвет colour, СтильЗаливки стиль)
		{
			this();
			this.colour = colour;
			Style = стиль;
		}

		public this(Битмап stippleBitmap) 
		{
			this();
			Stipple = stippleBitmap;
		}

		public this(ткст имя) 
			{ this(имя, СтильЗаливки.wxSOLID); }
			
		public this(ткст имя, СтильЗаливки стиль) 
		{
			this(); 
			this.colour = new Цвет(имя);
			Style = стиль;
		}

		//---------------------------------------------------------------------

		public бул Ок() 
		{
			return wxBrush_Ok(шхобъ);
		}

		//---------------------------------------------------------------------

		public СтильЗаливки Style() { return wxBrush_GetStyle(шхобъ); }
		public проц Style(СтильЗаливки значение) { wxBrush_SetStyle(шхобъ, значение); }

		//---------------------------------------------------------------------

		public Битмап Stipple() { return cast(Битмап)FindObject(wxBrush_GetStipple(шхобъ), &Битмап.Нов); }
		public проц Stipple(Битмап значение) { wxBrush_SetStipple(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------

		public Цвет colour() { return new Цвет(wxBrush_GetColour(шхобъ), да); }
		public проц colour(Цвет значение){ wxBrush_SetColour(шхобъ, wxObject.SafePtr(значение)); }
	}
