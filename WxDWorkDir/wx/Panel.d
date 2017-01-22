//-----------------------------------------------------------------------------
// wxD - Panel.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Panel.cs
//
/// The wxPanel wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Panel.d,v 1.10 2007/04/19 19:45:25 afb Exp $
//-----------------------------------------------------------------------------

module wx.Panel;
public import wx.common;
public import wx.Window;
public import wx.Button;

		//! \cond EXTERN
		static extern (C) ЦУк wxPanel_ctor();
		static extern (C) ЦУк wxPanel_ctor2(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) бул wxPanel_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxPanel_InitDialog(ЦУк сам);
		static extern (C) ЦУк wxPanel_GetDefaultItem(ЦУк сам);
		static extern (C) проц wxPanel_SetDefaultItem(ЦУк сам, ЦУк btn);
		//! \endcond

	alias Panel wxPanel;
	/// A panel is a окно on which controls are placed. It is usually
	/// placed within a frame. It contains minimal extra functionality over and
	/// above its родитель class wxWindow; its main purpose is to be similar in
	/// appearance and functionality to a dialog, but with the flexibility of
	/// having any окно as a родитель.
	public class Panel : Окно
	{
		//---------------------------------------------------------------------
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}
		
		public this()
			{ super(wxPanel_ctor());}

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxTAB_TRAVERSAL|wxNO_BORDER, ткст имя = wxPanelNameStr)
			{ super(wxPanel_ctor2(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя));}
			
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxTAB_TRAVERSAL|wxNO_BORDER, ткст имя=wxPanelNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------
		
		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxPanel_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, стиль, имя);
		}

		//---------------------------------------------------------------------

		public Кнопка DefaultItem() 
			{
				ЦУк btn = wxPanel_GetDefaultItem(шхобъ);
				return (btn != ЦУк.init) ? new Кнопка(btn) : пусто;
			}
		public проц DefaultItem(Кнопка значение) 
			{
				wxPanel_SetDefaultItem(шхобъ, значение.шхобъ);
			}

		//---------------------------------------------------------------------

		public override проц InitDialog()
		{
			wxPanel_InitDialog(шхобъ);
		}

		//---------------------------------------------------------------------
	}
