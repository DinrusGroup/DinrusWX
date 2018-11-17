module wx.StaticText;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxStaticText_ctor();
		static extern (C) бул   wxStaticText_Create(IntPtr сам, IntPtr родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц   wxStaticText_Wrap(IntPtr сам, цел ширь);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias StaticText wxStaticText;
	public class StaticText : Control
	{
		public const цел wxST_NO_AUTORESIZE = 0x0001;
	
		public const ткст wxStaticTextNameStr = "message";
	
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxStaticTextNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxStaticTextNameStr);
		public бул Создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public проц Wrap(цел ширь);
	}
