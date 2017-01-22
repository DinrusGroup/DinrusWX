//-----------------------------------------------------------------------------
// wxD - Перо.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Перо.cs
//
/// The wxPen wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Перо.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.Перо;
public import wx.common;
public import wx.Defs;
public import wx.GDIObject;
public import wx.Colour;

		//! \cond EXTERN
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

		static extern (C) ЦУк wxPen_ctor(ЦУк col, цел ширина, СтильЗаливки стиль);
		static extern (C) ЦУк wxPen_ctorByName(ткст имя, цел ширина, СтильЗаливки стиль);
	
		static extern (C) ЦУк wxPen_GetColour(ЦУк сам);
		static extern (C) проц   wxPen_SetColour(ЦУк сам, ЦУк col);
	
		static extern (C) проц   wxPen_SetWidth(ЦУк сам, цел ширина);
		static extern (C) цел    wxPen_GetWidth(ЦУк сам);
		
		static extern (C) цел    wxPen_GetCap(ЦУк сам);
		static extern (C) цел    wxPen_GetJoin(ЦУк сам);
		static extern (C) цел    wxPen_GetStyle(ЦУк сам);
		static extern (C) бул   wxPen_Ok(ЦУк сам);
		static extern (C) проц   wxPen_SetCap(ЦУк сам, цел capStyle);
		static extern (C) проц   wxPen_SetJoin(ЦУк сам, цел join_style);
		static extern (C) проц   wxPen_SetStyle(ЦУк сам, цел стиль);

		//---------------------------------------------------------------------
		static extern (C) ЦУк wxNullPen_Get();
		//! \endcond

	alias Перо wxPen;
	public class Перо : GDIObject
	{
		public static Перо wxRED_PEN;
		public static Перо wxCYAN_PEN;
		public static Перо wxGREEN_PEN;
		public static Перо wxBLACK_PEN;
		public static Перо wxWHITE_PEN;
		public static Перо wxTRANSPARENT_PEN;
		public static Перо wxBLACK_DASHED_PEN;
		public static Перо wxGREY_PEN;
		public static Перо wxMEDIUM_GREY_PEN;
		public static Перо wxLIGHT_GREY_PEN;
		public static Перо wxNullPen;

/+
		override public проц Dispose()
		{
			if (this !== wxRED_PEN
			&&  this !== wxCYAN_PEN
			&&  this !== wxGREEN_PEN
			&&  this !== wxBLACK_PEN
			&&  this !== wxWHITE_PEN
			&&  this !== wxTRANSPARENT_PEN
			&&  this !== wxBLACK_DASHED_PEN
			&&  this !== wxGREY_PEN
			&&  this !== wxMEDIUM_GREY_PEN
			&&  this !== wxLIGHT_GREY_PEN) {
				super.Dispose();
			}
		}
+/
		//---------------------------------------------------------------------

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ткст имя) 
			{ this(имя, 1, СтильЗаливки.wxSOLID); }
			
		public this(ткст имя, цел ширина) 
			{ this(имя, ширина, СтильЗаливки.wxSOLID); }
			
		public this(ткст имя, цел ширина, СтильЗаливки стиль) 
			{ super(wxPen_ctorByName(имя, ширина, стиль)); }

		public this(Цвет colour) 
			{ this(colour, 1, СтильЗаливки.wxSOLID); }
			
		public this(Цвет colour, цел ширина) 
			{ this(colour, ширина, СтильЗаливки.wxSOLID); }
			
		public this(Цвет col, цел ширина, СтильЗаливки стиль)
			{ super(wxPen_ctor(wxObject.SafePtr(col), ширина, стиль)); }


		//---------------------------------------------------------------------
        
		public Цвет colour() { return cast(Цвет)FindObject(wxPen_GetColour(шхобъ), &Цвет.Нов); }
		public проц colour(Цвет значение) { wxPen_SetColour(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------

		public цел Ширина() { return wxPen_GetWidth(шхобъ); }
		public проц Ширина(цел значение) { wxPen_SetWidth(шхобъ, значение); }
	
		//---------------------------------------------------------------------
	
		public цел Cap() { return wxPen_GetCap(шхобъ); }
		public проц Cap(цел значение) { wxPen_SetCap(шхобъ, значение); }
	
		//---------------------------------------------------------------------
	
		public цел Join() { return wxPen_GetJoin(шхобъ); }
		public проц Join(цел значение) { wxPen_SetJoin(шхобъ, значение); }
	
		//---------------------------------------------------------------------
	
		public цел Style() { return wxPen_GetStyle(шхобъ); }
		public проц Style(цел значение) { wxPen_SetStyle(шхобъ, значение); }
	
		//---------------------------------------------------------------------
	
		public бул Ок() { return wxPen_Ok(шхобъ); }

		static wxObject Нов(ЦУк ptr) { return new Перо(ptr); }
	}
