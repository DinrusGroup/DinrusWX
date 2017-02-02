//-----------------------------------------------------------------------------
// wxD - MessageДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MessageДиалог.cs
//
/// The wxMessageДиалог wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MessageДиалог.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MessageDialog;
public import wx.common;
public import wx.Dialog;

	// The MessageДиалог class implements the interface for wxWidgets' 
	// wxMessageДиалог class and wxMessageBox.

		//! \cond EXTERN

		// MessageBox function
		static extern (C) цел    wxMsgBox(ЦУк родитель, ткст msg, ткст cap, бцел стиль, inout Точка поз);

		// Message dialog methods
		static extern (C) ЦУк wxMessageDialog_ctor(ЦУк родитель, ткст message, ткст caption, бцел стиль, inout Точка поз);
		static extern (C) цел    wxMessageDialog_ShowModal(ЦУк сам);

		//! \endcond

	alias MessageДиалог wxMessageДиалог;
	public class MessageДиалог : Диалог
	{
		public const ткст wxMessageBoxCaptionStr = "Message";
		//---------------------------------------------------------------------
	
		private this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(Окно родитель, ткст msg, ткст caption=wxMessageBoxCaptionStr, цел стиль=wxOK | wxCENTRE, Точка поз = wxDefaultPosition)
			{ this(wxMessageDialog_ctor(wxObject.SafePtr(родитель), msg, caption, cast(бцел)стиль, поз)); }

		//---------------------------------------------------------------------

		public override цел ShowModal()
		{
			return wxMessageDialog_ShowModal(шхобъ);
		}

		//---------------------------------------------------------------------

	}

		static extern(C) цел wxMessageBox_func(ткст msg, ткст cap, цел стиль, ЦУк родитель,цел x, цел y);

		static цел MessageBox(ткст msg,ткст caption=MessageДиалог.wxMessageBoxCaptionStr,цел стиль=Диалог.wxOK | Диалог.wxCENTRE , Окно родитель=пусто, цел x=-1, цел y=-1)
		{
			return wxMessageBox_func(msg,caption,стиль,wxObject.SafePtr(родитель),x,y);
		}

		/* wx.NET compat */
		static цел MessageBox(Окно родитель,ткст msg,ткст caption=MessageДиалог.wxMessageBoxCaptionStr,цел стиль=Диалог.wxOK | Диалог.wxCENTRE , Точка поз=Диалог.wxDefaultPosition)
		{
			return wxMessageBox_func(msg,caption,стиль,wxObject.SafePtr(родитель),поз.X,поз.Y);
		}
