//-----------------------------------------------------------------------------
// wxD - Slider.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Slider.cs
//
/// The wxSlider wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: Slider.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.Slider;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxSlider_ctor();
		static extern (C) бул   wxSlider_Create(ЦУк сам, ЦУк родитель, цел ид, цел значение, цел minValue, цел maxValue, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) цел    wxSlider_GetValue(ЦУк сам);
		static extern (C) проц   wxSlider_SetValue(ЦУк сам, цел значение);
		static extern (C) проц   wxSlider_SetRange(ЦУк сам, цел minValue, цел maxValue);
		static extern (C) цел    wxSlider_GetMin(ЦУк сам);
		static extern (C) цел    wxSlider_GetMax(ЦУк сам);
		static extern (C) проц   wxSlider_SetLineSize(ЦУк сам, цел lineSize);
		static extern (C) проц   wxSlider_SetPageSize(ЦУк сам, цел pageSize);
		static extern (C) цел    wxSlider_GetLineSize(ЦУк сам);
		static extern (C) цел    wxSlider_GetPageSize(ЦУк сам);
		static extern (C) проц   wxSlider_SetThumbLength(ЦУк сам, цел lenPixels);
		static extern (C) цел    wxSlider_GetThumbLength(ЦУк сам);
		//static extern (C) проц   wxSlider_SetTickFreq(ЦУк сам, цел n, цел поз);
		static extern (C) цел    wxSlider_GetTickFreq(ЦУк сам);
		static extern (C) проц   wxSlider_ClearTicks(ЦУк сам);
		static extern (C) проц   wxSlider_SetTick(ЦУк сам, цел tickPos);
		static extern (C) проц   wxSlider_ClearSel(ЦУк сам);
		static extern (C) цел    wxSlider_GetSelEnd(ЦУк сам);
		static extern (C) цел    wxSlider_GetSelStart(ЦУк сам);
		static extern (C) проц   wxSlider_SetSelection(ЦУк сам, цел min, цел max);
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

		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxSlider_ctor()); }
			
		public this(Окно родитель, цел ид, цел значение, цел minValue, цел maxValue, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSL_HORIZONTAL, Validator validator = пусто, ткст имя = wxSliderNameStr)
		{
			super(wxSlider_ctor());
			if(!Create(родитель, ид, значение, minValue, maxValue, поз, size, стиль, validator, имя))
			{
				throw new InvalidOperationException("Failed to create Slider");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new Slider(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, цел значение, цел minValue, цел maxValue, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSL_HORIZONTAL, Validator validator = пусто, ткст имя = wxSliderNameStr)
			{ this(родитель, Окно.UniqueID, значение, minValue, maxValue, поз, size, стиль, validator, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, цел значение, цел minValue, цел maxValue, inout Точка поз, inout Размер size, цел стиль, Validator validator, ткст имя)
		{
			return wxSlider_Create(шхобъ, wxObject.SafePtr(родитель), ид, значение, minValue, maxValue, поз, size, cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}


		//---------------------------------------------------------------------

		public цел Value() { return wxSlider_GetValue(шхобъ); }
		public проц Value(цел значение) { wxSlider_SetValue(шхобъ, значение); }

		//---------------------------------------------------------------------

		public проц SetRange(цел minValue, цел maxValue)
		{
			wxSlider_SetRange(шхобъ, minValue, maxValue);
		}

		public цел Max() { return wxSlider_GetMax(шхобъ); }

		public цел Min() { return wxSlider_GetMin(шхобъ); }

		//---------------------------------------------------------------------

		public цел LineSize() { return wxSlider_GetLineSize(шхобъ); }
		public проц LineSize(цел значение) { wxSlider_SetLineSize(шхобъ, значение); }
		
		//---------------------------------------------------------------------

		public цел PageSize() { return wxSlider_GetPageSize(шхобъ); }
		public проц PageSize(цел значение) { wxSlider_SetPageSize(шхобъ, значение); }

		//---------------------------------------------------------------------

		public цел ThumbLength() { return wxSlider_GetThumbLength(шхобъ); }
		public проц ThumbLength(цел значение) { wxSlider_SetThumbLength(шхобъ, значение); }

		//---------------------------------------------------------------------

		public цел TickFreq() { return wxSlider_GetTickFreq(шхобъ); }
/+
		public проц SetTickFreq(цел n, цел поз)
		{
			wxSlider_SetTickFreq(шхобъ, n, поз);
		}
+/
		//---------------------------------------------------------------------

		public проц SetTick(цел tickPos)
		{
			wxSlider_SetTick(шхобъ, tickPos);
		}

		public проц ClearTicks()
		{
			wxSlider_ClearTicks(шхобъ);
		}

		public проц ClearSel()
		{
			wxSlider_ClearSel(шхобъ);
		}

		//---------------------------------------------------------------------

		public цел SelEnd() { return wxSlider_GetSelEnd(шхобъ); }

		public цел SelStart() { return wxSlider_GetSelStart(шхобъ); }

		public проц SetSelection(цел min, цел max)
		{
			wxSlider_SetSelection(шхобъ, min, max);
		}

		//---------------------------------------------------------------------

		public override проц UpdateUI_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_SLIDER_UPDATED, ИД, значение, this); }
		public override проц UpdateUI_Remove(EventListener значение) { RemoveHandler(значение, this); }
    }
