//-----------------------------------------------------------------------------
// wxD - ProgressDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ProgressDialog.cs
//
/// The wxProgressDialog wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ProgressDialog.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ProgressDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
static extern (C) ЦелУкз wxProgressDialog_ctor(ткст титул, ткст message, цел maximum, ЦелУкз родитель, бцел стиль);
static extern (C) проц wxProgressDialog_dtor(ЦелУкз сам);
static extern (C) бул wxProgressDialog_Update(ЦелУкз сам, цел значение, ткст newmsg);
static extern (C) проц wxProgressDialog_Resume(ЦелУкз сам);
static extern (C) бул wxProgressDialog_Show(ЦелУкз сам, бул покажи);
//! \endcond

//-----------------------------------------------------------------------------

alias ProgressDialog wxProgressDialog;
public class ProgressDialog : Dialog
{
    public const цел wxPD_CAN_ABORT      = 0x0001;
    public const цел wxPD_APP_MODAL      = 0x0002;
    public const цел wxPD_AUTO_HIDE      = 0x0004;
    public const цел wxPD_ELAPSED_TIME   = 0x0008;
    public const цел wxPD_ESTIMATED_TIME = 0x0010;
    public const цел wxPD_REMAINING_TIME = 0x0040;

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ткст титул, ткст message, цел maximum = 100, Окно родитель = null, цел стиль = wxPD_APP_MODAL | wxPD_AUTO_HIDE)
    {
        this(wxProgressDialog_ctor(титул, message, maximum, wxObject.SafePtr(родитель), cast(бцел)стиль));
    }

    //-----------------------------------------------------------------------------

    public бул Обнови(цел значение)
    {
        return wxProgressDialog_Update(wxobj, значение, "");
    }

    //---------------------------------------------------------------------

    public бул Обнови(цел значение, ткст newmsg)
    {
        return wxProgressDialog_Update(wxobj, значение, newmsg);
    }

    //---------------------------------------------------------------------

    public проц Resume()
    {
        wxProgressDialog_Resume(wxobj);
    }

    //---------------------------------------------------------------------

    public override бул Покажи(бул покажи=да)
    {
        return wxProgressDialog_Show(wxobj, покажи);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxProgressDialog_dtor(wxobj);
    }
}

