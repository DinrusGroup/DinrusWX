module wx.ToggleButton;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxToggleButton_ctor();
		static extern (C) бул   wxToggleButton_Create(IntPtr сам, IntPtr родитель,
			цел ид, ткст ярлык, inout Точка поз, inout Размер разм, бцел стиль,
			IntPtr оценщик, ткст имя);
		static extern (C) бул wxToggleButton_GetValue(IntPtr сам);
		static extern (C) бул wxToggleButton_SetValue(IntPtr сам, бул state);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias ToggleButton wxToggleButton;
	public class ToggleButton : Control
	{
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = "checkbox");
	public static wxObject Нов(IntPtr ptr) ;
		public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = "checkbox");
		public бул Создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм,
			цел стиль, Оценщик оценщик, ткст имя);
		public бул State() ;
		public проц State(бул значение);
		public проц Click_Add(ДатчикСобытий значение) ;
		public проц Click_Remove(ДатчикСобытий значение) ;
	}

