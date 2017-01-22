//-----------------------------------------------------------------------------
// wxD - Gauge.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Gauge.cs
//
/// The wxGauge wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Gauge.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.Gauge;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxGauge_ctor();
		static extern (C) проц   wxGauge_dtor(ЦУк сам);
		static extern (C) бул   wxGauge_Create(ЦУк сам, ЦУк родитель, цел ид, цел range, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) проц   wxGauge_SetRange(ЦУк сам, цел range);
		static extern (C) цел    wxGauge_GetRange(ЦУк сам);
		static extern (C) проц   wxGauge_SetValue(ЦУк сам, цел поз);
		static extern (C) цел    wxGauge_GetValue(ЦУк сам);
		//static extern (C) проц   wxGauge_SetShadowWidth(ЦУк сам, цел w);
		//static extern (C) цел    wxGauge_GetShadowWidth(ЦУк сам);
		//static extern (C) проц   wxGauge_SetBezelFace(ЦУк сам, цел w);
		//static extern (C) цел    wxGauge_GetBezelFace(ЦУк сам);
		static extern (C) бул   wxGauge_AcceptsFocus(ЦУк сам);
		static extern (C) бул   wxGauge_IsVertical(ЦУк сам);
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
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxGauge_ctor()); }

		public this(Окно родитель, цел ид, цел range, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, 
				цел стиль = wxGA_HORIZONTAL, Validator validator = пусто, ткст имя = wxGaugeNameStr)
		{	
			super(wxGauge_ctor());
			if (!Create(родитель, ид, range, поз, size, стиль, validator, имя)) 
			{
				throw new InvalidOperationException("Failed to create Gauge");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new Gauge(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, цел range, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, 
				цел стиль = wxGA_HORIZONTAL, Validator validator = пусто, ткст имя = wxGaugeNameStr)
			{ this(родитель, Окно.UniqueID, range, поз, size, стиль, validator, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, цел range, inout Точка поз, 
				inout Размер size, цел стиль, Validator validator, 
				ткст имя)
		{
			return wxGauge_Create(шхобъ, wxObject.SafePtr(родитель), ид, range, 
					поз, size, cast(бцел)стиль, 
					wxObject.SafePtr(validator), имя);
		}

		//---------------------------------------------------------------------

		public цел Range() { return wxGauge_GetRange(шхобъ); }
		public проц Range(цел значение) { wxGauge_SetRange(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public цел Value() { return wxGauge_GetValue(шхобъ); }
		public проц Value(цел значение) { wxGauge_SetValue(шхобъ, значение); }

		//---------------------------------------------------------------------
/+
		public цел ShadowWidth() { return wxGauge_GetShadowWidth(шхобъ); }
		public проц ShadowWidth(цел значение) { wxGauge_SetShadowWidth(шхобъ, значение); }
+/
		//---------------------------------------------------------------------
/+
		public цел BezelFace() { return wxGauge_GetBezelFace(шхобъ); }
		public проц BezelFace(цел значение) { wxGauge_SetBezelFace(шхобъ, значение); }
+/
		//---------------------------------------------------------------------

		public override бул AcceptsFocus()
		{
			return wxGauge_AcceptsFocus(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public бул IsVertical() { return wxGauge_IsVertical(шхобъ); }
	}
