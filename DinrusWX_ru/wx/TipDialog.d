//-----------------------------------------------------------------------------
// wxD - TipDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TipDialog.cs
//
/// The wxTipProvider proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TipDialog.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.TipDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
static extern (C) ЦелУкз wxCreateFileTipProvider_func(ткст имяф, цел текущаяПодсказка);
static extern (C) бул wxShowTip_func(ЦелУкз родитель, ЦелУкз провайдерПодсказок, бул showAtStartup);
static extern (C) цел wxTipProvider_GetCurrentTip();
//! \endcond

alias ПровайдерПодсказок wxTipProvider;
public class ПровайдерПодсказок
{
    public static ЦелУкз CreateFileTipProvider(ткст имяф, цел текущаяПодсказка)
    {
        return wxCreateFileTipProvider_func(имяф, текущаяПодсказка);
    }

    public static бул показатьПодсказку(Окно родитель, ЦелУкз провайдерПодсказок)
    {
        return wxShowTip_func(wxObject.SafePtr(родитель), провайдерПодсказок, да);
    }

    public static бул показатьПодсказку(Окно родитель, ЦелУкз провайдерПодсказок, бул showAtStartup)
    {
        return wxShowTip_func(wxObject.SafePtr(родитель), провайдерПодсказок, showAtStartup);
    }

    static цел текущаяПодсказка()
    {
        return wxTipProvider_GetCurrentTip();
    }
}
