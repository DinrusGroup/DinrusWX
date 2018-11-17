module wx.Slider;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxSlider_ctor();
		static extern (C) бул   wxSlider_Create(IntPtr сам, IntPtr родитель, цел ид, цел значение, цел minValue, цел maxValue, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) цел    wxSlider_GetValue(IntPtr сам);
		static extern (C) проц   wxSlider_SetValue(IntPtr сам, цел значение);
		static extern (C) проц   wxSlider_SetRange(IntPtr сам, цел minValue, цел maxValue);
		static extern (C) цел    wxSlider_GetMin(IntPtr сам);
		static extern (C) цел    wxSlider_GetMax(IntPtr сам);
		static extern (C) проц   wxSlider_SetLineSize(IntPtr сам, цел lineSize);
		static extern (C) проц   wxSlider_SetPageSize(IntPtr сам, цел pageSize);
		static extern (C) цел    wxSlider_GetLineSize(IntPtr сам);
		static extern (C) цел    wxSlider_GetPageSize(IntPtr сам);
		static extern (C) проц   wxSlider_SetThumbLength(IntPtr сам, цел lenPixels);
		static extern (C) цел    wxSlider_GetThumbLength(IntPtr сам);
		static extern (C) проц   wxSlider_SetTickFreq(IntPtr сам, цел n, цел поз);
		static extern (C) цел    wxSlider_GetTickFreq(IntPtr сам);
		static extern (C) проц   wxSlider_ClearTicks(IntPtr сам);
		static extern (C) проц   wxSlider_SetTick(IntPtr сам, цел tickPos);
		static extern (C) проц   wxSlider_ClearSel(IntPtr сам);
		static extern (C) цел    wxSlider_GetSelEnd(IntPtr сам);
		static extern (C) цел    wxSlider_GetSelStart(IntPtr сам);
		static extern (C) проц   wxSlider_SetSelection(IntPtr сам, цел min, цел max);
		//! \endcond
	
		//---------------------------------------------------------------------
		
    alias Slider wxSlider;
    public class Slider : Control
    {
		enum {
			wxSL_HORIZONTAL      = Ориентация.wxHORIZONTAL,
			wxSL_VERTICAL        = Ориентация.wxVERTICAL,

			wxSL_NOTIFY_DRAG     = 0x0000,
			wxSL_TICKS           = 0x0010,
			wxSL_AUTOTICKS       = wxSL_TICKS,
			wxSL_LABELS          = 0x0020,
			wxSL_LEFT            = 0x0040,
			wxSL_TOP             = 0x0080,
			wxSL_RIGHT           = 0x0100,
			wxSL_BOTTOM          = 0x0200,
			wxSL_BOTH            = 0x0400,
			wxSL_SELRANGE        = 0x0800,
		}

		public const ткст wxSliderNameStr = "slider";
		//---------------------------------------------------------------------

		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, цел значение, цел minValue, цел maxValue, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSL_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxSliderNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, цел значение, цел minValue, цел maxValue, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSL_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxSliderNameStr);
		public бул Создай(Окно родитель, цел ид, цел значение, цел minValue, цел maxValue, inout Точка поз, inout Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public цел Value();
		public проц Value(цел значение);
		public проц УстRange(цел minValue, цел maxValue);
		public цел Max() ;
		public цел Min() ;
		public цел LineSize() ;
		public проц LineSize(цел значение);
		public цел PageSize();
		public проц PageSize(цел значение);
		public цел ThumbLength() ;
		public проц ThumbLength(цел значение) ;
		public цел TickFreq();
		public проц УстTickFreq(цел n, цел поз);
		public проц УстTick(цел tickPos);
		public проц ClearTicks();
		public проц ClearSel();
		public цел SelEnd() ;
		public цел SelStart() ;
		public проц УстSelection(цел min, цел max);
		public override проц UpdateUI_Add(ДатчикСобытий значение);
		public override проц UpdateUI_Remove(ДатчикСобытий значение) ;
    }
