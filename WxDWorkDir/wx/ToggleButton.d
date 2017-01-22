//-----------------------------------------------------------------------------
// wxD - ToggleButton.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ToggleButton.cs
//
/// The wxToggleToggleButton wrapper class.
//
// Written by Florian Fankhauser (f.fankhauser@gmx.at)
// (C) 2003 Florian Fankhauser
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ToggleButton.d,v 1.10 2007/03/13 17:02:42 afb Exp $
//-----------------------------------------------------------------------------

module wx.ToggleButton;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxToggleButton_ctor();
		static extern (C) бул   wxToggleButton_Create(ЦУк сам, ЦУк родитель,
			цел ид, ткст надпись, inout Точка поз, inout Размер size, бцел стиль,
			ЦУк validator, ткст имя);
		static extern (C) бул wxToggleButton_GetValue(ЦУк сам);
		static extern (C) бул wxToggleButton_SetValue(ЦУк сам, бул state);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias ToggleButton wxToggleButton;
	public class ToggleButton : Control
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxToggleButton_ctor()); }

		public this(Окно родитель, цел ид, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator validator = пусто, ткст имя = "checkbox")
		{
			super(wxToggleButton_ctor());
			if (!Create(родитель, ид, надпись, поз, size, стиль, validator, имя))
			{
				throw new InvalidOperationException("Failed to create ToggleButton");
			}
		}
		
	public static wxObject Нов(ЦУк ptr) { return new ToggleButton(ptr); }

		//---------------------------------------------------------------------
		
		public this(Окно родитель, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator validator = пусто, ткст имя = "checkbox")
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, validator, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size,
			цел стиль, Validator validator, ткст имя)
		{
			return wxToggleButton_Create(шхобъ, wxObject.SafePtr(родитель), ид, надпись, поз, size,
				cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}

		//---------------------------------------------------------------------

		public бул State() { return wxToggleButton_GetValue(шхобъ); }
		public проц State(бул значение) { wxToggleButton_SetValue(шхобъ, значение); }

		//---------------------------------------------------------------------

		public проц Click_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TOGGLEBUTTON_CLICKED, ИД, значение, this); }
		public проц Click_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}

