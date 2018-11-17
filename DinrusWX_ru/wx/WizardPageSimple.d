//-----------------------------------------------------------------------------
// wxD - WizardPageSimple.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - WizardPageSimple.cs
//
/// The wxWizardPageSimple wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: WizardPageSimple.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.WizardPageSimple;
public import wx.WizardPage;
public import wx.Wizard;

//! \cond EXTERN
static extern (C) ЦелУкз wxWizardPageSimple_ctor(ЦелУкз родитель, ЦелУкз prev, ЦелУкз next, ЦелУкз битмап, ткст resource);
static extern (C) проц   wxWizardPageSimple_Chain(ЦелУкз first, ЦелУкз second);
//! \endcond

//---------------------------------------------------------------------

alias WizardPageSimple wxWizardPageSimple;
public class WizardPageSimple : WizardPage
{
    public this(Wizard родитель, WizardPage prev = null, WizardPage next = null, Битмап битмап = Битмап.wxNullBitmap, ткст resource = null)
    {
        super(wxWizardPageSimple_ctor(wxObject.SafePtr(родитель),
                                      wxObject.SafePtr(prev),wxObject.SafePtr(next),
                                      wxObject.SafePtr(битмап),resource));
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public static проц Chain(WizardPageSimple first, WizardPageSimple second)
    {
        wxWizardPageSimple_Chain(wxObject.SafePtr(first), wxObject.SafePtr(second));
    }

    //---------------------------------------------------------------------
}

