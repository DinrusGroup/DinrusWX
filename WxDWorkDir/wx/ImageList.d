//-----------------------------------------------------------------------------
// wxD - ImageList.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ImageList.cs
//
/// The wxImageList wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ImageList.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ImageList;
public import wx.common;
public import wx.Bitmap;
public import wx.DC;

	// Flag values for Установи/GetImageList
	enum
	{
		wxIMAGE_LIST_NORMAL, // Normal icons
		wxIMAGE_LIST_SMALL,  // Small icons
		wxIMAGE_LIST_STATE   // State icons: unimplemented (see WIN32 documentation)
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxImageList_ctor(цел ширина, цел высота, бул маска, цел initialCount);
		static extern (C) ЦУк wxImageList_ctor2();
		static extern (C) цел    wxImageList_AddBitmap1(ЦУк сам, ЦУк bmp, ЦУк маска);
		static extern (C) цел    wxImageList_AddBitmap(ЦУк сам, ЦУк bmp, ЦУк maskColour);
		static extern (C) цел    wxImageList_AddIcon(ЦУк сам, ЦУк иконка);
		static extern (C) цел    wxImageList_GetImageCount(ЦУк сам);
		
		static extern (C) бул   wxImageList_Draw(ЦУк сам, цел индекс, ЦУк dc, цел x, цел y, цел флаги, бул solidBackground);
		
		static extern (C) бул   wxImageList_Create(ЦУк сам, цел ширина, цел высота, бул маска, цел initialCount);
		
		static extern (C) бул   wxImageList_Replace(ЦУк сам, цел индекс, ЦУк битмап);
		
		static extern (C) бул   wxImageList_Remove(ЦУк сам, цел индекс);
		static extern (C) бул   wxImageList_RemoveAll(ЦУк сам);
		
		//static extern (C) ЦУк wxImageList_GetBitmap(ЦУк сам, цел индекс);
		
		static extern (C) бул   wxImageList_GetSize(ЦУк сам, цел индекс, inout цел ширина, inout цел высота);
		//! \endcond

		//---------------------------------------------------------------------

	alias ImageList wxImageList;
	public class ImageList : wxObject
	{
		public const цел wxIMAGELIST_DRAW_NORMAL	= 0x0001;
		public const цел wxIMAGELIST_DRAW_TRANSPARENT	= 0x0002;
		public const цел wxIMAGELIST_DRAW_SELECTED	= 0x0004;
		public const цел wxIMAGELIST_DRAW_FOCUSED	= 0x0008;
		
		//---------------------------------------------------------------------
	
		public this(цел ширина, цел высота, бул маска = да, цел initialCount=1)
			{ super(wxImageList_ctor(ширина, высота, маска, initialCount));}

		public this(ЦУк шхобъ) 
			{ super(шхобъ);}
			
		public this()
			{ super(wxImageList_ctor2());}

		public static wxObject Нов(ЦУк ptr) { return new ImageList(ptr); }
		//---------------------------------------------------------------------

		public цел Добавь(Битмап битмап)
		{
			return wxImageList_AddBitmap1(шхобъ, wxObject.SafePtr(битмап), ЦУк.init);
		}
		
		public цел Добавь(Битмап битмап, Битмап маска)
		{
			return wxImageList_AddBitmap1(шхобъ, wxObject.SafePtr(битмап), wxObject.SafePtr(маска));
		}

		public цел Добавь(Icon иконка)
		{
			return wxImageList_AddIcon(шхобъ, wxObject.SafePtr(иконка));
		}
		
		public цел Добавь(Битмап bmp, Цвет maskColour)
		{
			return wxImageList_AddBitmap(шхобъ, wxObject.SafePtr(bmp), wxObject.SafePtr(maskColour));
		}

		//---------------------------------------------------------------------
		
		public бул Create(цел ширина, цел высота)
		{
			return Create(ширина, высота, да, 1);
		}
		
		public бул Create(цел ширина, цел высота, бул маска)
		{
			return Create(ширина, высота, маска, 1);
		}
		
		public бул Create(цел ширина, цел высота, бул маска, цел initialCount)
		{
			return wxImageList_Create(шхобъ, ширина, высота, маска, initialCount);
		}
		
		//---------------------------------------------------------------------
		
		public цел ImageCount() { return wxImageList_GetImageCount(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул Draw(цел индекс, DC dc, цел x, цел y)
		{
			return Draw(индекс, dc, x, y, wxIMAGELIST_DRAW_NORMAL, нет);
		}
		
		public бул Draw(цел индекс, DC dc, цел x, цел y, цел флаги)
		{
			return Draw(индекс, dc, x, y, флаги, нет);
		}
		
		public бул Draw(цел индекс, DC dc, цел x, цел y, цел флаги, бул solidBackground)
		{
			return wxImageList_Draw(шхобъ, индекс, wxObject.SafePtr(dc), x, y, флаги, solidBackground);
		}
		
		//---------------------------------------------------------------------
		
		public бул Замени(цел индекс, Битмап битмап)
		{
			return wxImageList_Replace(шхобъ, индекс, wxObject.SafePtr(битмап));
		}
		
		//---------------------------------------------------------------------
		
		public бул Remove(цел индекс)
		{
			return wxImageList_Remove(шхобъ, индекс);
		}
		
		//---------------------------------------------------------------------
		
		public бул RemoveAll()
		{
			return wxImageList_RemoveAll(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		/*public Битмап GetBitmap(цел индекс)
		{
			return cast(Битмап)FindObject(wxImageList_GetBitmap(шхобъ, индекс), &Битмап.Нов);
		}*/
		
		//---------------------------------------------------------------------
		
		public бул GetSize(цел индекс, inout цел ширина, inout цел высота)
		{
			return wxImageList_GetSize(шхобъ, индекс, ширина, высота);
		}
	}
