//-----------------------------------------------------------------------------
// wxD - Битмап.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Битмап.cs
//
/// The wxBitmap wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Битмап.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Bitmap;
public import wx.common;
public import wx.GDIObject;
public import wx.Colour;
public import wx.Palette;
public import wx.Image;
public import wx.Icon;

		//! \cond EXTERN
		static extern (C) ЦУк wxBitmap_ctor();
		static extern (C) ЦУк wxBitmap_ctorByImage(ЦУк рисунок, цел глубина);
		static extern (C) ЦУк wxBitmap_ctorByName(ткст имя, ТипБитмапа тип);
		static extern (C) ЦУк wxBitmap_ctorBySize(цел ширина, цел высота, цел глубина);
		static extern (C) ЦУк wxBitmap_ctorByBitmap(ЦУк битмап);
		//static extern (C) проц   wxBitmap_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		
		static extern (C) ЦУк wxBitmap_ConvertToImage(ЦУк сам);
		static extern (C) бул   wxBitmap_LoadFile(ЦУк сам, ткст имя, ТипБитмапа тип);
		static extern (C) бул   wxBitmap_SaveFile(ЦУк сам, ткст имя, ТипБитмапа тип, ЦУк палитра);
		static extern (C) бул   wxBitmap_Ok(ЦУк сам);
	
		static extern (C) цел    wxBitmap_GetHeight(ЦУк сам);
		static extern (C) проц   wxBitmap_SetHeight(ЦУк сам, цел высота);
	
		static extern (C) цел    wxBitmap_GetWidth(ЦУк сам);
		static extern (C) проц   wxBitmap_SetWidth(ЦУк сам, цел ширина);
		
		static extern (C) цел    wxBitmap_GetDepth(ЦУк сам);
		static extern (C) проц   wxBitmap_SetDepth(ЦУк сам, цел глубина);
		
		static extern (C) ЦУк wxBitmap_GetSubBitmap(ЦУк сам, inout Прямоугольник прям);
		
		static extern (C) ЦУк wxBitmap_GetMask(ЦУк сам);
		static extern (C) ЦУк wxBitmap_SetMask(ЦУк сам, ЦУк маска);
		
		static extern (C) ЦУк wxBitmap_GetPalette(ЦУк сам);
		static extern (C) бул   wxBitmap_CopyFromIcon(ЦУк сам, ЦУк иконка);
		
		static extern (C) ЦУк wxBitmap_GetColourMap(ЦУк сам);
		//! \endcond
	
		//---------------------------------------------------------------------

	alias Битмап wxBitmap;
	public class Битмап : GDIObject
	{
		public static Битмап wxNullBitmap;
/*
		static this()
		{
			Рисунок.ИницВсеОбработчики();
		}
*/
		public this()
			{ this(wxBitmap_ctor()); }

		public this(Рисунок рисунок)
			{ this(рисунок, -1); }

		public this(Рисунок рисунок, цел глубина)
			{ this(wxBitmap_ctorByImage(рисунок.шхобъ, глубина)); }

		public this(ткст имя)
			{ this(wxBitmap_ctorByName(имя, ТипБитмапа.wxBITMAP_TYPE_ANY)); }

		public this(ткст имя, ТипБитмапа тип)
			{ this(wxBitmap_ctorByName(имя, тип)); }

		public this(цел ширина, цел высота)
			{ this(ширина, высота, -1); }

		public this(цел ширина, цел высота, цел глубина)
			{ this(wxBitmap_ctorBySize(ширина, высота, глубина));}
	    
		public this(Битмап битмап)
			{ this(wxBitmap_ctorByBitmap(wxObject.SafePtr(битмап)));}

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		//---------------------------------------------------------------------

		public Рисунок ConvertToImage()
		{
			return new Рисунок(wxBitmap_ConvertToImage(шхобъ));
		}

		//---------------------------------------------------------------------

		public цел Высота() { return wxBitmap_GetHeight(шхобъ); }
		public проц Высота(цел значение) { wxBitmap_SetHeight(шхобъ, значение); }

		//---------------------------------------------------------------------

		public бул ЗагрузиФайл(ткст имя, ТипБитмапа тип)
		{
			return wxBitmap_LoadFile(шхобъ, имя, тип);
		}
	
		//---------------------------------------------------------------------
	
		public бул СохраниФайл(ткст имя, ТипБитмапа тип)
		{
			return СохраниФайл(имя, тип, пусто);
		}
	
		public бул СохраниФайл(ткст имя, ТипБитмапа тип, Палитра палитра)
		{
			return wxBitmap_SaveFile(шхобъ, имя, тип, wxObject.SafePtr(палитра));
		}

		//---------------------------------------------------------------------

		public цел Ширина() { return wxBitmap_GetWidth(шхобъ); }
		public проц Ширина(цел значение) { wxBitmap_SetWidth(шхобъ, значение); }

		//---------------------------------------------------------------------

		public /+virtual+/ бул Ок()
		{
			return wxBitmap_Ok(шхобъ);
		}

		//---------------------------------------------------------------------
	
		public цел Depth() { return wxBitmap_GetDepth(шхобъ); }
		public проц Depth(цел значение) { wxBitmap_SetDepth(шхобъ, значение); }
	
		//---------------------------------------------------------------------
	
		public Битмап GetSubBitmap(Прямоугольник прям)
		{
			return new Битмап(wxBitmap_GetSubBitmap(шхобъ, прям));
		}
	
		//---------------------------------------------------------------------
	
		public Маска маска() { return new Маска(wxBitmap_GetMask(шхобъ)); }
		public проц маска(Маска значение) { wxBitmap_SetMask(шхобъ, wxObject.SafePtr(значение)); }
	
		//---------------------------------------------------------------------
	
		public Палитра палитра() { return new Палитра(wxBitmap_GetPalette(шхобъ)); }
	
		//---------------------------------------------------------------------
	
		public Палитра ColourMap() { return new Палитра(wxBitmap_GetColourMap(шхобъ)); }
	
		//---------------------------------------------------------------------
		
		public бул CopyFromIcon(Icon иконка)
		{
			return wxBitmap_CopyFromIcon(шхобъ, wxObject.SafePtr(иконка));
		}
		
		public static wxObject Нов(ЦУк ptr) { return new Битмап(ptr); }
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxMask_ctor();
		static extern (C) ЦУк wxMask_ctorByBitmpaColour(ЦУк битмап, ЦУк colour);
		static extern (C) ЦУк wxMask_ctorByBitmapIndex(ЦУк битмап, цел paletteIndex);
		static extern (C) ЦУк wxMask_ctorByBitmap(ЦУк битмап);
		
		static extern (C) бул wxMask_CreateByBitmapColour(ЦУк сам, ЦУк битмап, ЦУк colour);
		static extern (C) бул wxMask_CreateByBitmapIndex(ЦУк сам, ЦУк битмап, цел paletteIndex);
		static extern (C) бул wxMask_CreateByBitmap(ЦУк сам, ЦУк битмап);
		//! \endcond
		
		//---------------------------------------------------------------------
	alias Маска wxMask;
	public class Маска : wxObject
	{
		
		public this()
			{ this(wxMask_ctor());}
			
		public this(Битмап битмап, Цвет colour)
			{ this(wxMask_ctorByBitmpaColour(wxObject.SafePtr(битмап), wxObject.SafePtr(colour)));}
			
		public this(Битмап битмап, цел paletteIndex)
			{ this(wxMask_ctorByBitmapIndex(wxObject.SafePtr(битмап), paletteIndex));}
			
		public this(Битмап битмап)
			{ this(wxMask_ctorByBitmap(wxObject.SafePtr(битмап)));}
		
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		//---------------------------------------------------------------------
			
		public бул Create(Битмап битмап, Цвет colour)
		{
			return wxMask_CreateByBitmapColour(шхобъ, wxObject.SafePtr(битмап), wxObject.SafePtr(colour));
		}
		
		public бул Create(Битмап битмап, цел paletteIndex)
		{
			return wxMask_CreateByBitmapIndex(шхобъ, wxObject.SafePtr(битмап), paletteIndex);
		}
		
		public бул Create(Битмап битмап)
		{
			return wxMask_CreateByBitmap(шхобъ, wxObject.SafePtr(битмап));
		}
	}
