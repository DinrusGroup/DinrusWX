module wx.BitmapButton;
public import wx.common;
public import wx.Bitmap;
public import wx.Button;
public import wx.Control;

		//! \cond EXTERN
		extern (C) {
		alias проц function(КнопкаБитмап объ) Virtual_OnSetBitmap;
		}
		
		static extern (C) IntPtr wxBitmapButton_ctor();
		static extern (C) проц   wxBitmapButton_RegisterVirtual(IntPtr сам, КнопкаБитмап объ,Virtual_OnSetBitmap onУстBitmap);
		//static extern (C) проц   wxBitmapButton_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) бул   wxBitmapButton_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr ярлык, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) проц   wxBitmapButton_SetDefault(IntPtr сам);
		
		static extern (C) проц wxBitmapButton_SetLabel(IntPtr сам, ткст ярлык);
		static extern (C) IntPtr wxBitmapButton_GetLabel(IntPtr сам);
		
		static extern (C) бул wxBitmapButton_Enable(IntPtr сам, бул вкл);

		static extern (C) проц   wxBitmapButton_SetBitmapLabel(IntPtr сам, IntPtr битмап);
		static extern (C) IntPtr wxBitmapButton_GetBitmapLabel(IntPtr сам);
		
		static extern (C) проц wxBitmapButton_SetBitmapSelected(IntPtr сам, IntPtr битмап);
		static extern (C) IntPtr wxBitmapButton_GetBitmapSelected(IntPtr сам);

		static extern (C) проц wxBitmapButton_SetBitmapFocus(IntPtr сам, IntPtr битмап);
		static extern (C) IntPtr wxBitmapButton_GetBitmapFocus(IntPtr сам);

		static extern (C) проц wxBitmapButton_SetBitmapDisabled(IntPtr сам, IntPtr битмап);
		static extern (C) IntPtr wxBitmapButton_GetBitmapDisabled(IntPtr сам);
		
		static extern (C) проц wxBitmapButton_OnSetBitmap(IntPtr сам);
		
		//static extern (C) проц wxBitmapButton_ApplyParentThemeBackground(IntPtr сам, IntPtr цвет);
		//! \endcond

		//---------------------------------------------------------------------
		
		public const цел wxBU_AUTODRAW      =  0x0004;
		
		//---------------------------------------------------------------------
		
	alias КнопкаБитмап wxBitmapButton;
	public class КнопкаБитмап : Control
	{
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Битмап ярлык);
		public this(Окно родитель, цел ид, Битмап ярлык, Точка поз);
		public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер разм);
		public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер разм, цел стиль);
		public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер разм, цел стиль, Оценщик оценщик);
		public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public static wxObject Нов(IntPtr wxobj) ;
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
			
		public this(Окно родитель, Битмап ярлык);
		public this(Окно родитель, Битмап ярлык, Точка поз);
		public this(Окно родитель, Битмап ярлык, Точка поз, Размер разм);
		public this(Окно родитель, Битмап ярлык, Точка поз, Размер разм, цел стиль);
		public this(Окно родитель, Битмап ярлык, Точка поз, Размер разм, цел стиль, Оценщик оценщик);
		public this(Окно родитель, Битмап ярлык, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		//---------------------------------------------------------------------
		
		public бул Создай(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер разм, бцел стиль, Оценщик оценщик, ткст имя);
		public проц УстДеф();
		public ткст ЯрлыкСтрока() ;
		public проц ЯрлыкСтрока(ткст значение);		
		public проц УстЯрлык(ткст ярлык);
		public ткст ДайЯрлык();
		public бул Включи();
		public бул Включи(бул вкл);
		public Битмап ЯрлыкБитмапа();
		public проц ЯрлыкБитмапа(Битмап значение) ;
/+
		public Битмап Ярлык() ;
		public проц Ярлык(Битмап значение) ;
+/
		
		public Битмап БитмапВыбран() ;
		public проц БитмапВыбран(Битмап значение);		
		public Битмап БитмапФокус();
		public проц БитмапФокус(Битмап значение);
		public Битмап БитмапОтключен() ;
		public проц БитмапОтключен(Битмап значение) ;

		//---------------------------------------------------------------------
		//! \cond EXTERN
		extern(C) private static проц staticOnSetBitmap(КнопкаБитмап объ);
		//! \endcond
		protected  проц ПоУстБитмапа();
		
		//public  проц ApplyParentThemeBackground(Цвет bg);
	}
