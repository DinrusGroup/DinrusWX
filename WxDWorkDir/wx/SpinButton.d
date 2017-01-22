//-----------------------------------------------------------------------------
// wxD - SpinButton.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SpinButton.cs
//
/// The wxSpinButton wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: SpinButton.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.SpinButton;
public import wx.common;
public import wx.CommandEvent;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxSpinEvent_ctor(цел commandType, цел ид);
		static extern (C) цел wxSpinEvent_GetPosition(ЦУк сам);
		static extern (C) проц wxSpinEvent_SetPosition(ЦУк сам, цел поз);
		static extern (C) проц wxSpinEvent_Veto(ЦУк сам);
		static extern (C) проц wxSpinEvent_Allow(ЦУк сам);
		static extern (C) бул wxSpinEvent_IsAllowed(ЦУк сам);	
		//! \endcond

		//-----------------------------------------------------------------------------
	
	alias SpinEvent wxSpinEvent;
	public class SpinEvent : CommandEvent
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this(цел commandType, цел ид)
			{ super(wxSpinEvent_ctor(commandType, ид)); }

		//-----------------------------------------------------------------------------	

		public цел Положение() { return wxSpinEvent_GetPosition(шхобъ); }
		public проц Положение(цел значение) { wxSpinEvent_SetPosition(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public проц Veto()
		{
			wxSpinEvent_Veto(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Allow()
		{
			wxSpinEvent_Allow(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Allowed() { return wxSpinEvent_IsAllowed(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new SpinEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_SCROLL_THUMBTRACK,               &SpinEvent.Нов);
			ДобавьТипСоб(wxEVT_SCROLL_LINEUP,                   &SpinEvent.Нов);
			ДобавьТипСоб(wxEVT_SCROLL_LINEDOWN,                 &SpinEvent.Нов);        		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxSpinButton_ctor();
		static extern (C) бул   wxSpinButton_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) цел    wxSpinButton_GetValue(ЦУк сам);
		static extern (C) цел    wxSpinButton_GetMin(ЦУк сам);
		static extern (C) цел    wxSpinButton_GetMax(ЦУк сам);
		static extern (C) проц   wxSpinButton_SetValue(ЦУк сам, цел val);
		static extern (C) проц   wxSpinButton_SetRange(ЦУк сам, цел minVal, цел maxVal);
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
        
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxSpinButton_ctor()); }
			
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSP_VERTICAL | wxSP_ARROW_KEYS, ткст имя = wxSPIN_BUTTON_NAME)
		{
			super(wxSpinButton_ctor());
			if(!Create(родитель, ид, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create SpinButton");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new SpinButton(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSP_VERTICAL | wxSP_ARROW_KEYS, ткст имя = wxSPIN_BUTTON_NAME)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size,  цел стиль, ткст имя)
		{
			return wxSpinButton_Create(шхобъ, wxObject.SafePtr(родитель), ид,
						поз, size, cast(бцел)стиль, имя);
		}

		//---------------------------------------------------------------------
        
		public цел Value() { return wxSpinButton_GetValue(шхобъ); }
		public проц Value(цел значение) { wxSpinButton_SetValue(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public цел Max() { return wxSpinButton_GetMax(шхобъ); }

		public цел Min() { return wxSpinButton_GetMin(шхобъ); }

		public проц SetRange(цел min, цел max)
		{
			wxSpinButton_SetRange(шхобъ, min, max);
		}
	}
