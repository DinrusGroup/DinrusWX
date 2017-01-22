//-----------------------------------------------------------------------------
// wxD - Dialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Dialog.cs
//
/// The wxDialog wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Dialog.d,v 1.11 2007/04/19 19:45:26 afb Exp $
//-----------------------------------------------------------------------------

module wx.Dialog;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxDialog_ctor();
		static extern (C) проц   wxDialog_dtor(ЦУк сам);

		static extern (C) проц   wxDialog_SetReturnCode(ЦУк сам, цел returnCode);
		static extern (C) цел    wxDialog_GetReturnCode(ЦУк сам);

		static extern (C) ЦУк wxDialog_GetTitle(ЦУк сам);
		static extern (C) проц   wxDialog_SetTitle(ЦУк сам, ткст title);

		static extern (C) бул   wxDialog_Create(ЦУк сам, ЦУк родитель, цел ид, ткст title, inout Точка поз, inout Размер size, бцел стиль, ткст имя);

		static extern (C) проц   wxDialog_EndModal(ЦУк сам, цел retCode);

		static extern (C) бул   wxDialog_IsModal(ЦУк сам);
	//	static extern (C) проц   wxDialog_SetModal(ЦУк сам, бул modal);

		static extern (C) проц   wxDialog_SetIcon(ЦУк сам, ЦУк иконка);
		static extern (C) проц   wxDialog_SetIcons(ЦУк сам, ЦУк icons);

		static extern (C) цел    wxDialog_ShowModal(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias Dialog wxDialog;
	/// A dialog box is a окно with a title bar and sometimes a
	/// system меню, which can be moved around the screen. It can contain
	/// controls and other windows and is usually used to allow the user
	/// to make some choice or to answer a question.
	public class Dialog : Окно
	{
		enum {
		wxCENTER		= 0x00000001,
		wxCENTRE		= 0x00000001,
		wxYES			= 0x00000002,
		wxOK			= 0x00000004,
		wxNO			= 0x00000008,
		wxCANCEL		= 0x00000010,
		wxYES_NO		= (wxYES | wxNO),

		wxYES_DEFAULT		= 0x00000000,
		wxNO_DEFAULT		= 0x00000080,

		wxICON_EXCLAMATION 	= 0x00000100,
		wxICON_HAND		= 0x00000200,
		wxICON_WARNING	= wxICON_EXCLAMATION,
		wxICON_ERROR		= wxICON_HAND,
		wxICON_QUESTION	= 0x00000400,
		wxICON_INFORMATION	= 0x00000800,
		wxICON_STOP		= wxICON_HAND,
		wxICON_ASTERISK	= wxICON_INFORMATION,
		wxICON_MASK		= (0x00000100|0x00000200|0x00000400|0x00000800),

		wxFORWARD		= 0x00001000,
		wxBACKWARD		= 0x00002000,
		wxRESET		= 0x00004000,
		wxHELP		= 0x00008000,
		wxMORE 		= 0x00010000,
		wxSETUP		= 0x00020000,
		}

		//---------------------------------------------------------------------
		const ткст wxDialogNameStr="dialog";

		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxDialog_ctor()); }

		public this(Окно родитель, цел ид, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_DIALOG_STYLE, ткст имя=wxDialogNameStr)
		{
			super(wxDialog_ctor());
			if (!Create(родитель, ид, title, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create Dialog");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_DIALOG_STYLE, ткст имя=wxDialogNameStr)
			{ this(родитель, Окно.UniqueID, title, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно окно, цел ид, ткст title, inout Точка поз,
						   inout Размер size, цел стиль, ткст имя)
		{
			return wxDialog_Create(шхобъ, wxObject.SafePtr(окно), ид, title,
								   поз, size, cast(бцел)стиль, имя);
		}

		//---------------------------------------------------------------------

		public цел ReturnCode() { return wxDialog_GetReturnCode(шхобъ); }
		public проц ReturnCode(цел значение) { wxDialog_SetReturnCode(шхобъ, значение); }

		//---------------------------------------------------------------------

		public override ткст Title() { return cast(ткст) new wxString(wxDialog_GetTitle(шхобъ), да); }
		public override проц Title(ткст значение) { wxDialog_SetTitle(шхобъ, значение); }

		//---------------------------------------------------------------------

		public проц EndModal(цел retCode)
		{
			wxDialog_EndModal(шхобъ, cast(цел)retCode);
		}

		//---------------------------------------------------------------------

		public проц SetIcon(Icon иконка)
		{
			wxDialog_SetIcon(шхобъ, wxObject.SafePtr(иконка));
		}

		/*public проц SetIcons(IconBundle icons)
		{
			wxDialog_SetIcons(шхобъ, wxObject.SafePtr(icons);
		}*/

		//---------------------------------------------------------------------

		public /+virtual+/ цел ShowModal()
		{
			return wxDialog_ShowModal(шхобъ);
		}

		//---------------------------------------------------------------------

		//deprecated public проц Modal(бул значение) { wxDialog_SetModal(шхобъ, значение); }
		public бул Modal() { return wxDialog_IsModal(шхобъ); }
	}
