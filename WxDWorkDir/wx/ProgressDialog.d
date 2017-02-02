//-----------------------------------------------------------------------------
// wxD - ProgressДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ProgressДиалог.cs
//
/// The wxProgressДиалог wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ProgressДиалог.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ProgressDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) ЦУк wxProgressDialog_ctor(ткст title, ткст message, цел maximum, ЦУк родитель, бцел стиль);
	static extern (C) проц wxProgressDialog_dtor(ЦУк сам);
        static extern (C) бул wxProgressDialog_Update(ЦУк сам, цел значение, ткст newmsg);
        static extern (C) проц wxProgressDialog_Resume(ЦУк сам);
        static extern (C) бул wxProgressDialog_Show(ЦУк сам, бул show);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias ProgressДиалог wxProgressДиалог;
    public class ProgressДиалог : Диалог
    {
        public const цел wxPD_CAN_ABORT      = 0x0001;
        public const цел wxPD_APP_MODAL      = 0x0002;
        public const цел wxPD_AUTO_HIDE      = 0x0004;
        public const цел wxPD_ELAPSED_TIME   = 0x0008;
        public const цел wxPD_ESTIMATED_TIME = 0x0010;
        public const цел wxPD_REMAINING_TIME = 0x0040;
	
		//---------------------------------------------------------------------

        public this(ЦУк шхобъ)
            { super(шхобъ);}

        public this(ткст title, ткст message, цел maximum = 100, Окно родитель = пусто, цел стиль = wxPD_APP_MODAL | wxPD_AUTO_HIDE)
            { this(wxProgressDialog_ctor(title, message, maximum, wxObject.SafePtr(родитель), cast(бцел)стиль));}

        //-----------------------------------------------------------------------------

        public бул Обнови(цел значение)
        {
            return wxProgressDialog_Update(шхобъ, значение, "");
        }

		//---------------------------------------------------------------------

        public бул Обнови(цел значение, ткст newmsg)
        {
            return wxProgressDialog_Update(шхобъ, значение, newmsg);
        }

		//---------------------------------------------------------------------

        public проц Resume()
        {
            wxProgressDialog_Resume(шхобъ);
        }

		//---------------------------------------------------------------------

        public override бул Show(бул show=да)
        {
            return wxProgressDialog_Show(шхобъ, show);
        }
	
	//---------------------------------------------------------------------
	
	override protected проц dtor() { wxProgressDialog_dtor(шхобъ); }
    }

