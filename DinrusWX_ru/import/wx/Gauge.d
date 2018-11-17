module wx.Gauge;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxGauge_ctor();
		static extern (C) проц   wxGauge_dtor(IntPtr сам);
		static extern (C) бул   wxGauge_Create(IntPtr сам, IntPtr родитель, цел ид, цел диапазон, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) проц   wxGauge_SetRange(IntPtr сам, цел диапазон);
		static extern (C) цел    wxGauge_GetRange(IntPtr сам);
		static extern (C) проц   wxGauge_SetValue(IntPtr сам, цел поз);
		static extern (C) цел    wxGauge_GetValue(IntPtr сам);
		static extern (C) проц   wxGauge_SetShadowWidth(IntPtr сам, цел w);
		static extern (C) цел    wxGauge_GetShadowWidth(IntPtr сам);
		static extern (C) проц   wxGauge_SetBezelFace(IntPtr сам, цел w);
		static extern (C) цел    wxGauge_GetBezelFace(IntPtr сам);
		static extern (C) бул   wxGauge_AcceptsFocus(IntPtr сам);
		static extern (C) бул   wxGauge_IsVertical(IntPtr сам);
		//! \endcond
	
		//---------------------------------------------------------------------
		
	alias Gauge wxGauge;
	public class Gauge :  Control
	{
		enum {
			wxGA_HORIZONTAL       = Ориентация.wxHORIZONTAL,
			wxGA_VERTICAL         = Ориентация.wxVERTICAL,
			wxGA_PROGRESSBAR      = 0x0010,
		}
	
		// Windows only
		public const цел wxGA_SMOOTH           = 0x0020;
	
		public const ткст wxGaugeNameStr = "gauge";
		//---------------------------------------------------------------------
		
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, цел диапазон, Точка поз = вхДефПоз, Размер разм = вхДефРазм, 
				цел стиль = wxGA_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxGaugeNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, цел диапазон, Точка поз = вхДефПоз, Размер разм = вхДефРазм, 
				цел стиль = wxGA_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxGaugeNameStr);
		public бул Создай(Окно родитель, цел ид, цел диапазон, inout Точка поз, 
				inout Размер разм, цел стиль, Оценщик оценщик, 
				ткст имя);
		public цел Range();
		public проц Range(цел значение) ;
		public цел Value();
		public проц Value(цел значение) ;
		public цел ShadowWidth() ;
		public проц ShadowWidth(цел значение);
		public цел BezelFace() ;
		public проц BezelFace(цел значение) ;
		public override бул ПринимаетФокус();
		public бул IsVertical() ;
	}
