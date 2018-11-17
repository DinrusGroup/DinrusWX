module wx.StaticBox;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxStaticBox_ctor();
		static extern (C) бул wxStaticBox_Create(IntPtr сам, IntPtr родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		//! \endcond
	
		//---------------------------------------------------------------------

	alias StaticBox wxStaticBox;
	public class StaticBox : Control
	{
		public const ткст wxStaticBoxNameStr = "groupBox";

		public this();
		public this(IntPtr wxobj);
		public this(Окно окно, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBoxNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно окно, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBoxNameStr);
		public бул Создай(Окно окно, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
	}
