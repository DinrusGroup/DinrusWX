//-----------------------------------------------------------------------------
// wxD - Control.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Control.cs
//
/// The wxControl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Control.d,v 1.12 2007/04/19 19:45:26 afb Exp $
//-----------------------------------------------------------------------------

module wx.Control;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) проц   wxControl_Command(ЦУк сам, ЦУк evt);
		static extern (C) ЦУк wxControl_GetLabel(ЦУк сам);
		static extern (C) проц   wxControl_SetLabel(ЦУк сам, ткст надпись);
		
		static extern (C) цел wxControl_GetAlignment(ЦУк сам);
		static extern (C) бул wxControl_SetFont(ЦУк сам, ЦУк шрифт);
		//! \endcond

		//---------------------------------------------------------------------

	alias Control wxControl;
	/// This is the base class for a control or "widget".
	/// A control is generally a small окно which processes user input
	/// and/or displays one or more элемент of данные.
	public class Control : Окно
	{
		const ткст wxControlNameStr = "control";
	
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this(Окно родитель, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxControlNameStr)
			{ super(родитель, ид, поз, size, стиль, имя);}
		
		public this(Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxControlNameStr)
			{ super(родитель, Окно.UniqueID, поз, size, стиль, имя);}

		public static wxObject Нов(ЦУк шхобъ) { return new Control(шхобъ); }
	
		//---------------------------------------------------------------------

		public проц Command() {}

		//---------------------------------------------------------------------

		public ткст Label() { return cast(ткст) new wxString(wxControl_GetLabel(шхобъ), да); }
		public проц Label(ткст значение) { wxControl_SetLabel(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public цел GetAlignment()
		{
			return wxControl_GetAlignment(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public бул SetFont(Шрифт шрифт)
		{
			return wxControl_SetFont(шхобъ, wxObject.SafePtr(шрифт));
		}
	}

