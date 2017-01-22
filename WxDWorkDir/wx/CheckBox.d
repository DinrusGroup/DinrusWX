//-----------------------------------------------------------------------------
// wxD - CheckBox.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - CheckBox.cs
//
/// The wxCheckBox wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: CheckBox.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.CheckBox;
public import wx.common;
public import wx.Control;

	public enum CheckBoxState
	{
		wxCHK_UNCHECKED,
		wxCHK_CHECKED,
		wxCHK_UNDETERMINED
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxCheckBox_ctor();
		static extern (C) бул   wxCheckBox_Create(ЦУк сам, ЦУк родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, бцел стиль, ЦУк val, ткст имя);
		static extern (C) бул   wxCheckBox_GetValue(ЦУк сам);
		static extern (C) проц   wxCheckBox_SetValue(ЦУк сам, бул state);
		static extern (C) бул   wxCheckBox_IsChecked(ЦУк сам);
		
		static extern (C) CheckBoxState wxCheckBox_Get3StateValue(ЦУк сам);
		static extern (C) проц wxCheckBox_Set3StateValue(ЦУк сам, CheckBoxState state);
		static extern (C) бул wxCheckBox_Is3State(ЦУк сам);
		static extern (C) бул wxCheckBox_Is3rdStateAllowedForUser(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias CheckBox wxCheckBox;
	public class CheckBox : Control
	{
		public const цел wxCHK_2STATE           = 0x0000;
		public const цел wxCHK_3STATE           = 0x1000;
		public const цел wxCHK_ALLOW_3RD_STATE_FOR_USER           = 0x2000;
		public const ткст wxCheckBoxNameStr = "checkbox";
	
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}
			
		public this()
			{ this(wxCheckBox_ctor()); }

		public this(Окно родитель, цел ид, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль =0, Validator val=пусто, ткст имя = wxCheckBoxNameStr)
		{
			this(wxCheckBox_ctor());
			if (!wxCheckBox_Create(шхобъ, wxObject.SafePtr(родитель), ид,
			                       надпись, поз, size, cast(бцел)стиль, wxObject.SafePtr(val), имя))
			{
				throw new InvalidOperationException("failed to create checkbox");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ)
		{
			return new CheckBox(шхобъ);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль =0, Validator val=пусто, ткст имя = wxCheckBoxNameStr)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, val, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size,
			цел стиль, Validator val, ткст имя)
		{
			return wxCheckBox_Create(шхобъ, wxObject.SafePtr(родитель), ид,
			                       надпись, поз, size, cast(бцел)стиль, wxObject.SafePtr(val), имя);
		}

		//---------------------------------------------------------------------

		public бул Value() { return wxCheckBox_GetValue(шхобъ); }
		public проц Value(бул значение) { wxCheckBox_SetValue(шхобъ, значение); }

		//---------------------------------------------------------------------

		public бул IsChecked() { return wxCheckBox_IsChecked(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public CheckBoxState ThreeStateValue() { return wxCheckBox_Get3StateValue(шхобъ); }
		public проц ThreeStateValue(CheckBoxState значение) { wxCheckBox_Set3StateValue(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public бул Is3State()
		{
			return wxCheckBox_Is3State(шхобъ);
		}

		//---------------------------------------------------------------------
		
		public бул Is3rdStateAllowedForUser()
		{
			return wxCheckBox_Is3rdStateAllowedForUser(шхобъ);
		}
		
		//---------------------------------------------------------------------
        
		public проц Clicked_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_CHECKBOX_CLICKED, ИД, значение, this); }
		public проц Clicked_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
