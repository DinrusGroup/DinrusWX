module wx.RadioButton;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxRadioButton_ctor();
		static extern (C) бул   wxRadioButton_Create(IntPtr сам, IntPtr родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, бцел стиль, IntPtr val, ткст имя);
		static extern (C) бул   wxRadioButton_GetValue(IntPtr сам);
		static extern (C) проц   wxRadioButton_SetValue(IntPtr сам, бул state);
		//! \endcond
	
		//---------------------------------------------------------------------
		
	alias RadioButton wxRadioButton;
	public class RadioButton : Control 
	{
		public const цел wxRB_GROUP     = 0x0004;
		public const цел wxRB_SINGLE    = 0x0008;
		
		public const ткст wxRadioButtonNameStr = "radioButton";
		//---------------------------------------------------------------------
	
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик val = null, ткст имя = wxRadioButtonNameStr);
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик val = null, ткст имя = wxRadioButtonNameStr);
		public бул Создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, цел стиль, Оценщик val, ткст имя);
		public бул Value() ;
		public проц Value(бул значение);
		public проц Select_Add(ДатчикСобытий значение) ;
		public проц Select_Remove(ДатчикСобытий значение) ;
	}
