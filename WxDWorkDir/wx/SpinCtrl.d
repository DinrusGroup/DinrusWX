//-----------------------------------------------------------------------------
// wxD - SpinCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SpinCtrl.cs
//
/// The wxSpinCtrl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SpinCtrl.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.SpinCtrl;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxSpinCtrl_ctor();
		static extern (C) бул   wxSpinCtrl_Create(ЦУк сам, ЦУк родитель, цел ид, ткст значение, inout Точка поз, inout Размер size, бцел стиль, цел min, цел max, цел initial, ткст имя);
		static extern (C) цел    wxSpinCtrl_GetValue(ЦУк сам);
		static extern (C) цел    wxSpinCtrl_GetMin(ЦУк сам);
		static extern (C) цел    wxSpinCtrl_GetMax(ЦУк сам);
		static extern (C) проц   wxSpinCtrl_SetValueStr(ЦУк сам, ткст значение);
		static extern (C) проц   wxSpinCtrl_SetValue(ЦУк сам, цел val);
		static extern (C) проц   wxSpinCtrl_SetRange(ЦУк сам, цел min, цел max);
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
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxSpinCtrl_ctor()); }

		public this(Окно родитель,
			цел ид /*= wxID_ANY*/,
			ткст значение = "",
			Точка поз = wxDefaultPosition,
			Размер size = wxDefaultSize,
			цел стиль = wxSP_ARROW_KEYS,
			цел min = 0, цел max = 100, цел initial = 0,
			ткст имя = "SpinCtrl")
		{
			super(wxSpinCtrl_ctor());
			if(!Create(родитель, ид, значение, поз, size, стиль, min, max, initial, имя))
			{
				throw new InvalidOperationException("Failed to create SpinCtrl");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new SpinCtrl(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель,
			ткст значение = "",
			Точка поз = wxDefaultPosition,
			Размер size = wxDefaultSize,
			цел стиль = wxSP_ARROW_KEYS,
			цел min = 0, цел max = 100, цел initial = 0,
			ткст имя = "SpinCtrl")
			{ this(родитель, Окно.UniqueID, значение, поз, size, стиль, min, max, initial, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст значение, Точка поз, Размер size, цел стиль, цел min, цел max, цел initial, ткст имя)
		{
			return wxSpinCtrl_Create(шхобъ, wxObject.SafePtr(родитель), ид, 
					значение, поз, size, cast(бцел)стиль, min,
					max, initial, имя);
		}

		//---------------------------------------------------------------------

		public цел Value() { return wxSpinCtrl_GetValue(шхобъ); }
		public проц Value(цел значение) { wxSpinCtrl_SetValue(шхобъ, значение); }

		public проц SetValue(ткст val)
		{
			wxSpinCtrl_SetValueStr(шхобъ, val);
		}

		//---------------------------------------------------------------------
        
		public цел Max() { return wxSpinCtrl_GetMax(шхобъ); }

		public цел Min() { return wxSpinCtrl_GetMin(шхобъ); }

		public проц SetRange(цел min, цел max)
		{
			wxSpinCtrl_SetRange(шхобъ, min, max);
		}

		//---------------------------------------------------------------------

		public override проц UpdateUI_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_SPINCTRL_UPDATED, ИД, значение, this); }
		public override проц UpdateUI_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}

