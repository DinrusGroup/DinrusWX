module wx.ImageList;
public import wx.common;
public import wx.Bitmap;
public import wx.DC;

	// Flag values for Уст/GetImageList
	enum
	{
		wxIMAGE_LIST_NORMAL, // Normal icons
		wxIMAGE_LIST_SMALL,  // Small icons
		wxIMAGE_LIST_STATE   // State icons: unimplemented (see WIN32 documentation)
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxImageList_ctor(цел ширь, цел высь, бул маска, цел initialCount);
		static extern (C) IntPtr wxImageList_ctor2();
		static extern (C) цел    wxImageList_AddBitmap1(IntPtr сам, IntPtr bmp, IntPtr маска);
		static extern (C) цел    wxImageList_AddBitmap(IntPtr сам, IntPtr bmp, IntPtr maskColour);
		static extern (C) цел    wxImageList_AddIcon(IntPtr сам, IntPtr пиктограмма);
		static extern (C) цел    wxImageList_GetImageCount(IntPtr сам);
		
		static extern (C) бул   wxImageList_Draw(IntPtr сам, цел index, IntPtr dc, цел x, цел y, цел флаги, бул solidBackground);
		
		static extern (C) бул   wxImageList_Create(IntPtr сам, цел ширь, цел высь, бул маска, цел initialCount);
		
		static extern (C) бул   wxImageList_Replace(IntPtr сам, цел index, IntPtr битмап);
		
		static extern (C) бул   wxImageList_Remove(IntPtr сам, цел index);
		static extern (C) бул   wxImageList_RemoveAll(IntPtr сам);
		
		//static extern (C) IntPtr wxImageList_GetBitmap(IntPtr сам, цел index);
		
		static extern (C) бул   wxImageList_GetSize(IntPtr сам, цел index, inout цел ширь, inout цел высь);
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
	
		public this(цел ширь, цел высь, бул маска = да, цел initialCount=1);
		public this(IntPtr wxobj) ;
		public this();
		public static wxObject Нов(IntPtr ptr);
		public цел Добавь(Битмап битмап);
		public цел Добавь(Битмап битмап, Битмап маска);
		public цел Добавь(Пиктограмма пиктограмма);
		public цел Добавь(Битмап bmp, Цвет maskColour);
		public бул Создай(цел ширь, цел высь);
		public бул Создай(цел ширь, цел высь, бул маска);
		public бул Создай(цел ширь, цел высь, бул маска, цел initialCount);
		public цел ImageCount() ;
		public бул Draw(цел index, DC dc, цел x, цел y);
		public бул Draw(цел index, DC dc, цел x, цел y, цел флаги);
		public бул Draw(цел index, DC dc, цел x, цел y, цел флаги, бул solidBackground);
		public бул Replace(цел index, Битмап битмап);
		public бул Remove(цел index);
		public бул RemoveAll();
		//public Битмап ДайБитмап(цел index);
		public бул GetSize(цел index, inout цел ширь, inout цел высь);
	}
