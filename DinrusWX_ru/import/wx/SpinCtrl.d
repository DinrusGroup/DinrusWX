module wx.SpinCtrl;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxSpinCtrl_ctor();
		static extern (C) бул   wxSpinCtrl_Create(IntPtr сам, IntPtr родитель, цел ид, ткст значение, inout Точка поз, inout Размер разм, бцел стиль, цел min, цел max, цел initial, ткст имя);
		static extern (C) цел    wxSpinCtrl_GetValue(IntPtr сам);
		static extern (C) цел    wxSpinCtrl_GetMin(IntPtr сам);
		static extern (C) цел    wxSpinCtrl_GetMax(IntPtr сам);
		static extern (C) проц   wxSpinCtrl_SetValueStr(IntPtr сам, ткст значение);
		static extern (C) проц   wxSpinCtrl_SetValue(IntPtr сам, цел val);
		static extern (C) проц   wxSpinCtrl_SetRange(IntPtr сам, цел min, цел max);
		//! \endcond
	
		//---------------------------------------------------------------------
		
	alias SpinCtrl wxSpinCtrl;
	public class SpinCtrl : Control 
	{
		// These are duplicated in SpinButton.cs (for easier access)
		public const цел wxSP_HORIZONTAL       = Ориентация.wxHORIZONTAL;
		public const цел wxSP_VERTICAL         = Ориентация.wxVERTICAL;
		public const цел wxSP_ARROW_KEYS       = 0x1000;
		public const цел wxSP_WRAP             = 0x2000;
	
		//---------------------------------------------------------------------
		
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель,
			цел ид /*= wxID_ANY*/,
			ткст значение = "",
			Точка поз = вхДефПоз,
			Размер разм = вхДефРазм,
			цел стиль = wxSP_ARROW_KEYS,
			цел min = 0, цел max = 100, цел initial = 0,
			ткст имя = "SpinCtrl");
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель,
			ткст значение = "",
			Точка поз = вхДефПоз,
			Размер разм = вхДефРазм,
			цел стиль = wxSP_ARROW_KEYS,
			цел min = 0, цел max = 100, цел initial = 0,
			ткст имя = "SpinCtrl");
		public бул Создай(Окно родитель, цел ид, ткст значение, Точка поз, Размер разм, цел стиль, цел min, цел max, цел initial, ткст имя);
		public цел Value();
		public проц Value(цел значение) ;
		public проц УстValue(ткст val);
		public цел Max();
		public цел Min() ;
		public проц УстRange(цел min, цел max);
		public override проц UpdateUI_Add(ДатчикСобытий значение) ;
		public override проц UpdateUI_Remove(ДатчикСобытий значение) ;
	}

