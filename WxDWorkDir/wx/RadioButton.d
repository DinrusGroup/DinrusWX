//-----------------------------------------------------------------------------
// wxD - RadioButton.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - RadioButton.cs
//
/// The wxRadioButton wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//-----------------------------------------------------------------------------

module wx.RadioButton;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxRadioButton_ctor();
		static extern (C) бул   wxRadioButton_Create(ЦУк сам, ЦУк родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, бцел стиль, ЦУк val, ткст имя);
		static extern (C) бул   wxRadioButton_GetValue(ЦУк сам);
		static extern (C) проц   wxRadioButton_SetValue(ЦУк сам, бул state);
		//! \endcond
	
		//---------------------------------------------------------------------
		
	alias RadioButton wxRadioButton;
	public class RadioButton : Control 
	{
		public const цел wxRB_GROUP     = 0x0004;
		public const цел wxRB_SINGLE    = 0x0008;
		
		public const ткст wxRadioButtonNameStr = "radioButton";
		//---------------------------------------------------------------------
	
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}
		
		public this()
			{ super (wxRadioButton_ctor()); }

		public this(Окно родитель, цел ид, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator val = пусто, ткст имя = wxRadioButtonNameStr)
		{
			super(wxRadioButton_ctor());
			if (!wxRadioButton_Create(шхобъ, wxObject.SafePtr(родитель), ид,
					надпись, поз, size, cast(бцел)стиль, wxObject.SafePtr(val), имя))
			{
				throw new InvalidOperationException("Failed to create RadioButton");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new RadioButton(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator val = пусто, ткст имя = wxRadioButtonNameStr)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, val, имя);}

		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, цел стиль, Validator val, ткст имя)
		{
			return wxRadioButton_Create(шхобъ, wxObject.SafePtr(родитель), ид,
					надпись, поз, size, cast(бцел)стиль, wxObject.SafePtr(val), имя);
		}

		//---------------------------------------------------------------------

		public бул Value() { return wxRadioButton_GetValue(шхобъ); }
		public проц Value(бул значение) { wxRadioButton_SetValue(шхобъ, значение); }

		//---------------------------------------------------------------------

		public проц Select_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_RADIOBUTTON_SELECTED, ИД, значение, this); }
		public проц Select_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
