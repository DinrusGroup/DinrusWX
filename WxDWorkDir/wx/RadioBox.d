//-----------------------------------------------------------------------------
// wxD - RadioBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - RadioBox.cs
//
/// The wxRadioBox wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: RadioBox.d,v 1.13 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.RadioBox;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxRadioBox_ctor();
		static extern (C) бул   wxRadioBox_Create(ЦУк сам, ЦУк родитель, цел ид,
		                                                           ткст надпись, inout Точка поз, inout Размер size,
		                                                           цел n, ткст* choices, цел majorDimension,
		                                                           бцел стиль, ЦУк val, ткст имя);

		static extern (C) проц   wxRadioBox_SetSelection(ЦУк сам, цел n);
		static extern (C) цел    wxRadioBox_GetSelection(ЦУк сам);

		static extern (C) ЦУк wxRadioBox_GetStringSelection(ЦУк сам);
		static extern (C) бул   wxRadioBox_SetStringSelection(ЦУк сам, ткст s);

		static extern (C) цел    wxRadioBox_GetCount(ЦУк сам);
		static extern (C) цел    wxRadioBox_FindString(ЦУк сам, ткст s);

		static extern (C) ЦУк wxRadioBox_GetString(ЦУк сам, цел n);
		static extern (C) проц   wxRadioBox_SetString(ЦУк сам, цел n, ткст надпись);

		static extern (C) проц   wxRadioBox_Enable(ЦУк сам, цел n, бул enable);
		static extern (C) проц   wxRadioBox_Show(ЦУк сам, цел n, бул show);
		
		static extern (C) ЦУк wxRadioBox_GetLabel(ЦУк сам);
		static extern (C) проц   wxRadioBox_SetLabel(ЦУк сам, ткст надпись);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias RadioBox wxRadioBox;
	public class RadioBox : Control
	{
		enum {
			wxRA_LEFTTORIGHT    = 0x0001,
			wxRA_TOPTOBOTTOM    = 0x0002,
			wxRA_SPECIFY_COLS   = Ориентация.wxHORIZONTAL,
			wxRA_SPECIFY_ROWS   = Ориентация.wxVERTICAL,
			wxRA_HORIZONTAL     = Ориентация.wxHORIZONTAL,
			wxRA_VERTICAL       = Ориентация.wxVERTICAL,
		}

		public const ткст wxRadioBoxNameStr = "radioBox";
		//---------------------------------------------------------------------
        
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this(Окно родитель, цел ид, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст[] choices = пусто, цел majorDimension = 0, цел стиль = wxRA_HORIZONTAL, Validator val = пусто, ткст имя = wxRadioBoxNameStr)
		{
			super(wxRadioBox_ctor());
			if (!wxRadioBox_Create(шхобъ, wxObject.SafePtr(родитель), ид, надпись, поз, size,
			                       choices.length, choices.ptr, majorDimension, cast(бцел)стиль, wxObject.SafePtr(val), имя))
			{
				throw new InvalidOperationException("failed to create checkbox");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new RadioBox(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст[] choices = пусто, цел majorDimension = 0, цел стиль = wxRA_HORIZONTAL, Validator val = пусто, ткст имя = wxRadioBoxNameStr)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, choices, majorDimension, стиль, val, имя);}

		//---------------------------------------------------------------------

		public проц Selection(цел значение) { wxRadioBox_SetSelection(шхобъ, значение); }
		public цел Selection() { return wxRadioBox_GetSelection(шхобъ); }

		public проц StringSelection(ткст значение) { wxRadioBox_SetStringSelection(шхобъ, значение); }
		public ткст StringSelection() { return cast(ткст) new wxString(wxRadioBox_GetStringSelection(шхобъ), да); }

		//---------------------------------------------------------------------

		public цел Счёт() { return wxRadioBox_GetCount(шхобъ); }

		//---------------------------------------------------------------------

		public цел FindString(ткст s)
		{
			return wxRadioBox_FindString(шхобъ, s);
		}

		//---------------------------------------------------------------------

		public ткст GetString(цел n)
		{
			return cast(ткст) new wxString(wxRadioBox_GetString(шхобъ, n), да);
		}

		public проц SetString(цел n, ткст надпись)
		{
			wxRadioBox_SetString(шхобъ, n, надпись);
		}

		//---------------------------------------------------------------------

		public проц Enable(цел n, бул enable)
		{
			wxRadioBox_Enable(шхобъ, n, enable);
		}

		public проц Show(цел n, бул show)
		{
			wxRadioBox_Show(шхобъ, n , show);
		}

		//---------------------------------------------------------------------
		
		public override ткст Label() { return cast(ткст) new wxString(wxRadioBox_GetLabel(шхобъ), да); }
		public override проц Label(ткст значение) { wxRadioBox_SetLabel(шхобъ, значение); }
		
		//---------------------------------------------------------------------

		public проц Select_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_RADIOBOX_SELECTED, ИД, значение, this); }
		public проц Select_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
