module wx.Bitmap;
public import wx.common;
public import wx.GDIObject;
public import wx.Colour;
public import wx.Palette;
public import wx.Image;
public import wx.Icon;

		//! \cond EXTERN
		static extern (C) IntPtr wxBitmap_ctor();
		static extern (C) IntPtr wxBitmap_ctorByImage(IntPtr рисунок, цел глубь);
		static extern (C) IntPtr wxBitmap_ctorByName(ткст имя, BitmapType тип);
		static extern (C) IntPtr wxBitmap_ctorBySize(цел ширь, цел высь, цел глубь);
		static extern (C) IntPtr wxBitmap_ctorByBitmap(IntPtr битмап);
		//static extern (C) проц   wxBitmap_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		
		static extern (C) IntPtr wxBitmap_ConvertToImage(IntPtr сам);
		static extern (C) бул   wxBitmap_LoadFile(IntPtr сам, ткст имя, BitmapType тип);
		static extern (C) бул   wxBitmap_SaveFile(IntPtr сам, ткст имя, BitmapType тип, IntPtr палитра);
		static extern (C) бул   wxBitmap_Ok(IntPtr сам);
	
		static extern (C) цел    wxBitmap_GetHeight(IntPtr сам);
		static extern (C) проц   wxBitmap_SetHeight(IntPtr сам, цел высь);
	
		static extern (C) цел    wxBitmap_GetWidth(IntPtr сам);
		static extern (C) проц   wxBitmap_SetWidth(IntPtr сам, цел ширь);
		
		static extern (C) цел    wxBitmap_GetDepth(IntPtr сам);
		static extern (C) проц   wxBitmap_SetDepth(IntPtr сам, цел глубь);
		
		static extern (C) IntPtr wxBitmap_GetSubBitmap(IntPtr сам, inout Прямоугольник прям);
		
		static extern (C) IntPtr wxBitmap_GetMask(IntPtr сам);
		static extern (C) IntPtr wxBitmap_SetMask(IntPtr сам, IntPtr маска);
		
		static extern (C) IntPtr wxBitmap_GetPalette(IntPtr сам);
		static extern (C) бул   wxBitmap_CopyFromIcon(IntPtr сам, IntPtr пиктограмма);
		
		static extern (C) IntPtr wxBitmap_GetColourMap(IntPtr сам);
		//! \endcond
	
		//---------------------------------------------------------------------

	alias Битмап wxBitmap;
	public class Битмап : GDIObject
	{
		public static Битмап wxNullBitmap;

		public this();
		public this(Рисунок рисунок);
		public this(Рисунок рисунок, цел глубь);
		public this(ткст имя);
		public this(ткст имя, BitmapType тип);
		public this(цел ширь, цел высь);
		public this(цел ширь, цел высь, цел глубь);
		public this(Битмап битмап);
		public this(IntPtr wxobj) ;
		public Рисунок ПреобразуйВРисунок();
		public цел Высь();
		public проц Высь(цел значение) ;
		public бул ЗагрузиФайл(ткст имя, BitmapType тип);
		public бул СохраниФайл(ткст имя, BitmapType тип);
		public бул СохраниФайл(ткст имя, BitmapType тип, Палитра палитра);
		public цел Ширь();
		public проц Ширь(цел значение) ;
		public  бул Ок();
		public цел Глубь() ;
		public проц Глубь(цел значение);
		public Битмап ДайПодБитмап(Прямоугольник прям);
		public Маска маска() ;
		public проц маска(Маска значение) ;
		public Палитра палитра() ;
		public Палитра ЦветоКарта() ;
		public бул КопируйИзПиктограммы(Пиктограмма пиктограмма);
		public static wxObject Нов(IntPtr ptr) ;
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxMask_ctor();
		static extern (C) IntPtr wxMask_ctorByBitmpaColour(IntPtr битмап, IntPtr цвет);
		static extern (C) IntPtr wxMask_ctorByBitmapIndex(IntPtr битмап, цел индексПалитры);
		static extern (C) IntPtr wxMask_ctorByBitmap(IntPtr битмап);
		
		static extern (C) бул wxMask_CreateByBitmapColour(IntPtr сам, IntPtr битмап, IntPtr цвет);
		static extern (C) бул wxMask_CreateByBitmapIndex(IntPtr сам, IntPtr битмап, цел индексПалитры);
		static extern (C) бул wxMask_CreateByBitmap(IntPtr сам, IntPtr битмап);
		//! \endcond
		
		//---------------------------------------------------------------------
	alias Маска wxMask;
	public class Маска : wxObject
	{
		
		public this();
		public this(Битмап битмап, Цвет цвет);
		public this(Битмап битмап, цел индексПалитры);
		public this(Битмап битмап);
		public this(IntPtr wxobj);
		public бул Создай(Битмап битмап, Цвет цвет);
		public бул Создай(Битмап битмап, цел индексПалитры);
		public бул Создай(Битмап битмап);
	}
