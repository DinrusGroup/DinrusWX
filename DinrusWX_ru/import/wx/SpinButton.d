module wx.SpinButton;
public import wx.common;
public import wx.CommandEvent;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxSpinEvent_ctor(цел типКоманды, цел ид);
		static extern (C) цел wxSpinEvent_GetPosition(IntPtr сам);
		static extern (C) проц wxSpinEvent_SetPosition(IntPtr сам, цел поз);
		static extern (C) проц wxSpinEvent_Veto(IntPtr сам);
		static extern (C) проц wxSpinEvent_Allow(IntPtr сам);
		static extern (C) бул wxSpinEvent_IsAllowed(IntPtr сам);	
		//! \endcond

		//-----------------------------------------------------------------------------
	
	alias SpinEvent wxSpinEvent;
	public class SpinEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj);
		public this(цел типКоманды, цел ид);
		public цел Позиция() ;
		public проц Позиция(цел значение) ;
		public проц Veto();
		public проц Allow();
		public бул Allowed() ;
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxSpinButton_ctor();
		static extern (C) бул   wxSpinButton_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) цел    wxSpinButton_GetValue(IntPtr сам);
		static extern (C) цел    wxSpinButton_GetMin(IntPtr сам);
		static extern (C) цел    wxSpinButton_GetMax(IntPtr сам);
		static extern (C) проц   wxSpinButton_SetValue(IntPtr сам, цел val);
		static extern (C) проц   wxSpinButton_SetRange(IntPtr сам, цел minVal, цел maxVal);
		//! \endcond

		//---------------------------------------------------------------------
	alias SpinButton wxSpinButton;
	public class SpinButton : Control
	{
		// These are duplicated in SpinCtrl.cs (for easier access)
		enum {
			wxSP_HORIZONTAL       = Ориентация.wxHORIZONTAL,
			wxSP_VERTICAL         = Ориентация.wxVERTICAL,
			wxSP_ARROW_KEYS       = 0x1000,
			wxSP_WRAP             = 0x2000,
		}
	
		public const ткст wxSPIN_BUTTON_NAME = "SpinButton";
		//---------------------------------------------------------------------
        
		
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSP_VERTICAL | wxSP_ARROW_KEYS, ткст имя = wxSPIN_BUTTON_NAME);
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSP_VERTICAL | wxSP_ARROW_KEYS, ткст имя = wxSPIN_BUTTON_NAME);
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм,  цел стиль, ткст имя);
		public цел Value();
		public проц Value(цел значение);
		public цел Max() ;
		public цел Min() ;
		public проц УстRange(цел min, цел max);
	}
