//-----------------------------------------------------------------------------
// wxD - NumberДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
//
/// The wxNumberEntryДиалог wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NumberДиалог.d,v 1.7 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NumberDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) ЦУк wxNumberEntryDialog_ctor(ЦУк родитель, ткст message, ткст prompt, ткст caption, цел значение, цел min, цел max, inout Точка поз);
        static extern (C) проц wxNumberEntryDialog_dtor(ЦУк сам);
        static extern (C) цел wxNumberEntryDialog_GetValue(ЦУк сам);
        static extern (C) цел wxNumberEntryDialog_ShowModal(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias NumberEntryДиалог wxNumberEntryДиалог;
    public class NumberEntryДиалог : Диалог
    {
        public const цел wxNumberEntryДиалогStyle = (Диалог.wxOK | Диалог.wxCANCEL | Диалог.wxCENTRE );

        public this(ЦУк шхобъ)
            { super(шхобъ);}

        public  this(Окно родитель, ткст message, ткст prompt, ткст caption, цел значение, цел min, цел max, Точка поз = wxDefaultPosition)
            { this(wxNumberEntryDialog_ctor(wxObject.SafePtr(родитель), message, prompt, caption, значение, min, max, поз)); }

        //-----------------------------------------------------------------------------

        public цел Value() { return wxNumberEntryDialog_GetValue(шхобъ); }

        //---------------------------------------------------------------------

        public override цел ShowModal()
        {
            return wxNumberEntryDialog_ShowModal(шхобъ);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) цел wxGetNumberFromUser_func(ткст message, ткст prompt, ткст caption, цел значение, цел min, цел max, ЦУк родитель, inout Точка поз);
		//! \endcond

        //-----------------------------------------------------------------------------

        public цел GetNumberFromUser(ткст message, ткст prompt, ткст caption, цел значение = 0, цел min = 0, цел max = 100, Окно родитель = пусто, Точка поз = Диалог.wxDefaultPosition)
        {
            return wxGetNumberFromUser_func(message, prompt, caption, значение, min, max, wxObject.SafePtr(родитель), поз);
        }
