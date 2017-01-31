//-----------------------------------------------------------------------------
// wxD - TipДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TipДиалог.cs
//
/// The wxTipProvider proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TipДиалог.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.TipDialog;
public import wx.common;
public import wx.Dialog;

	//! \cond EXTERN
	static extern (C) ЦУк wxCreateFileTipProvider_func(ткст фимя, цел currentTip);
	static extern (C) бул wxShowTip_func(ЦУк родитель, ЦУк tipProvider, бул showAtStartup);
	static extern (C) цел wxTipProvider_GetCurrentTip();
	//! \endcond

    alias TipProvider wxTipProvider;
    public class TipProvider
    {
	public static ЦУк CreateFileTipProvider(ткст фимя, цел currentTip)
	{
		return wxCreateFileTipProvider_func(фимя, currentTip);
	}

	public static бул ShowTip(Окно родитель, ЦУк tipProvider)
	{
		return wxShowTip_func(wxObject.SafePtr(родитель), tipProvider, да);
	}

	public static бул ShowTip(Окно родитель, ЦУк tipProvider, бул showAtStartup)
	{
		return wxShowTip_func(wxObject.SafePtr(родитель), tipProvider, showAtStartup);
	}

	static цел CurrentTip() { return wxTipProvider_GetCurrentTip(); }
    }
