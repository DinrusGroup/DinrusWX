module wx.Button;
public import wx.common;
public import wx.Control;
public import wx.Bitmap;

		//! \cond EXTERN
		static extern (C) IntPtr wxButton_ctor();
		static extern (C) бул   wxButton_Create(IntPtr сам, IntPtr родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) проц   wxButton_SetDefault(IntPtr сам);
		static extern (C) проц   wxButton_GetDefaultSize(out Размер разм);
		
		static extern (C) проц wxButton_SetImageMargins(IntPtr сам, цел x, цел y);
		static extern (C) проц wxButton_SetImageLabel(IntPtr сам, IntPtr битмап);
		
		static extern (C) проц wxButton_SetLabel(IntPtr сам, ткст ярлык);
		//! \endcond

		//---------------------------------------------------------------------

	alias Кнопка wxButton;
	public class Кнопка : Control
	{
		public const цел wxBU_LEFT          =  0x0040;
		public const цел wxBU_TOP           =  0x0080;
		public const цел wxBU_RIGHT         =  0x0100;
		public const цел wxBU_BOTTOM        =  0x0200;
		public const цел wxBU_EXACTFIT      =  0x0001;

		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, ткст ярлык = "", Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = null);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = null);
		public бул Создай(Окно родитель, цел ид, ткст ярлык, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public проц УстДеф();
		public static Размер ДайДефРазм();
		public  проц ЯрлыкСРисунком(Битмап значение);
		public  проц УстКраяРисунка(цел x, цел y);
		public override проц Ярлык(ткст значение);
		public проц Click_Add(ДатчикСобытий значение) ;
		public проц Click_Remove(ДатчикСобытий значение) ;
	}

