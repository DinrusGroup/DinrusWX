module wx.StaticBitmap;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxStaticBitmap_ctor();
		static extern (C) бул wxStaticBitmap_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr ярлык, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxStaticBitmap_SetBitmap(IntPtr сам, IntPtr битмап);
		static extern (C) IntPtr wxStaticBitmap_GetBitmap(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias StaticBitmap wxStaticBitmap;
	public class StaticBitmap : Control
	{
		public const ткст wxStaticBitmapNameStr = "message";

		public this();
		public this(IntPtr wxobj) ;
		public this(Окно родитель, цел ид, Битмап ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBitmapNameStr);
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель, Битмап ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBitmapNameStr);
		public бул Создай(Окно родитель, цел ид, Битмап ярлык, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public проц битмап(Битмап значение) ;
		public Битмап битмап() ;
	}
