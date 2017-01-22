//-----------------------------------------------------------------------------
// wxD - TextDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TextDialog.cs
//
/// The wxTextEntryDialog wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TextDialog.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.TextDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) ЦУк wxTextEntryDialog_ctor(ЦУк родитель, ткст message, ткст caption, ткст значение, бцел стиль, inout Точка поз);
        static extern (C) проц wxTextEntryDialog_dtor(ЦУк сам);
        static extern (C) проц wxTextEntryDialog_SetValue(ЦУк сам, ткст val);
        static extern (C) ЦУк wxTextEntryDialog_GetValue(ЦУк сам);
        static extern (C) цел wxTextEntryDialog_ShowModal(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias TextEntryDialog wxTextEntryDialog;
    public class TextEntryDialog : Dialog
    {
    	enum {
        wxTextEntryDialogStyle = (wxOK | wxCANCEL | wxCENTRE),
	}
	public const ткст wxGetTextFromUserPromptStr = "Input Текст";

        public this(ЦУк шхобъ)
            { super(шхобъ);}

        public  this(Окно родитель, ткст message=wxGetTextFromUserPromptStr, ткст caption="", ткст значение="", цел стиль=wxTextEntryDialogStyle, Точка поз=wxDefaultPosition)
            { this(wxTextEntryDialog_ctor(wxObject.SafePtr(родитель), message, caption, значение, cast(бцел)стиль, поз)); }

        //-----------------------------------------------------------------------------

        public ткст Value() { return cast(ткст) new wxString(wxTextEntryDialog_GetValue(шхобъ), да); }
        public проц Value(ткст значение) { wxTextEntryDialog_SetValue(шхобъ, значение); }

        //---------------------------------------------------------------------

        public override цел ShowModal()
        {
            return wxTextEntryDialog_ShowModal(шхобъ);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxGetPasswordFromUser_func(ткст message, ткст caption, ткст defaultValue, ЦУк родитель);
        static extern (C) ЦУк wxGetTextFromUser_func(ткст message, ткст caption, ткст defaultValue, ЦУк родитель, цел x, цел y, бул centre);
		//! \endcond

        //-----------------------------------------------------------------------------

        public ткст GetPasswordFromUser(ткст message, ткст caption=TextEntryDialog.wxGetTextFromUserPromptStr, ткст defaultValue="", Окно родитель=пусто)
        {
            return cast(ткст) new wxString(wxGetPasswordFromUser_func(message, caption, defaultValue, wxObject.SafePtr(родитель)), да);
        }

        //-----------------------------------------------------------------------------

        public ткст GetTextFromUser(ткст message, ткст caption=TextEntryDialog.wxGetTextFromUserPromptStr, ткст defaultValue="", Окно родитель=пусто, цел x=-1, цел y=-1, бул centre=да)
        {
            return cast(ткст) new wxString(wxGetTextFromUser_func(message, caption, defaultValue, wxObject.SafePtr(родитель), x, y, centre), да);
        }
