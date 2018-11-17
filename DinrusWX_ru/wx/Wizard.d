//-----------------------------------------------------------------------------
// wxD - Wizard.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Wizard.cs
//
/// The wxWizard wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Wizard.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.Wizard;
public import wx.common;
public import wx.Dialog;
public import wx.Panel;
//public import wx.NotifyEvent;
public import wx.WizardPage;

//! \cond EXTERN
static extern (C) ЦелУкз wxWizard_ctor(ЦелУкз родитель, цел ид, ткст титул, ЦелУкз битмап, inout Точка поз, цел стиль);
static extern (C) бул   wxWizard_RunWizard(ЦелУкз сам, ЦелУкз firstPage);
static extern (C) проц   wxWizard_SetPageSize(ЦелУкз сам, inout Размер Размер);
//! \endcond

//---------------------------------------------------------------------

alias Wizard wxWizard;
public class Wizard : Dialog
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, цел ид = wxID_ANY, ткст титул = "", Битмап битмап = Битмап.wxNullBitmap, Точка поз = вхДефПоз, цел стиль = wxDEFAULT_DIALOG_STYLE)
    {
        super(wxWizard_ctor(wxObject.SafePtr(родитель), ид, титул, wxObject.SafePtr(битмап), поз, стиль));
    }

    //---------------------------------------------------------------------

    public бул RunWizard(WizardPage firstPage)
    {
        if (firstPage is null)
            throw new ArgumentNullException("firstPage");

        return wxWizard_RunWizard(wxobj, firstPage.wxobj);
    }

    //---------------------------------------------------------------------

    public проц PageSize(Размер значение)
    {
        wxWizard_SetPageSize(wxobj, значение);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxWizardEvent_ctor(цел тип,цел ид, бул направление,ЦелУкз page);
static extern (C) бул   wxWizardEvent_GetDirection(ЦелУкз сам);
static extern (C) ЦелУкз wxWizardEvent_GetPage(ЦелУкз сам);

static extern (C) ТипСобытия wxEvent_WIZARD_PAGE_CHANGED();
static extern (C) ТипСобытия wxEvent_WIZARD_PAGE_CHANGING();
static extern (C) ТипСобытия wxEvent_WIZARD_CANCEL();
static extern (C) ТипСобытия wxEvent_WIZARD_HELP();
static extern (C) ТипСобытия wxEvent_WIZARD_FINISHED();
//! \endcond

/+
alias WizardEvent wxWizardEvent;
public class WizardEvent : NotifyEvent
{
    static ТипСобытия wxEVT_WIZARD_PAGE_CHANGED;
    static ТипСобытия wxEVT_WIZARD_PAGE_CHANGING;
    static ТипСобытия wxEVT_WIZARD_CANCEL;
    static ТипСобытия wxEVT_WIZARD_HELP;
    static ТипСобытия wxEVT_WIZARD_FINISHED;

    static this()
    {
        wxEVT_WIZARD_PAGE_CHANGED  = wxEvent_WIZARD_PAGE_CHANGED();
        wxEVT_WIZARD_PAGE_CHANGING = wxEvent_WIZARD_PAGE_CHANGING();
        wxEVT_WIZARD_CANCEL   = wxEvent_WIZARD_CANCEL();
        wxEVT_WIZARD_HELP     = wxEvent_WIZARD_HELP();
        wxEVT_WIZARD_FINISHED = wxEvent_WIZARD_FINISHED();

        ДобавьТипСоб(wxEVT_WIZARD_PAGE_CHANGED,  &WizardEvent.Нов);
        ДобавьТипСоб(wxEVT_WIZARD_PAGE_CHANGING, &WizardEvent.Нов);
        ДобавьТипСоб(wxEVT_WIZARD_CANCEL,   &WizardEvent.Нов);
        ДобавьТипСоб(wxEVT_WIZARD_HELP,     &WizardEvent.Нов);
        ДобавьТипСоб(wxEVT_WIZARD_FINISHED, &WizardEvent.Нов);
    }

    this(ЦелУкз ptr)
    {
        super(ptr);
    }

    this(ТипСобытия тип = wxEVT_NULL, цел ид = wxID_ANY, бул направление = да, WizardPage page = null)
    {
        this(wxWizardEvent_ctor(тип,ид,направление,wxObject.SafePtr(page)));
    }

    static Событие Нов(ЦелУкз ptr)
    {
        return new WizardEvent(ptr);
    }

    бул Direction()
    {
        return wxWizardEvent_GetDirection(wxobj);
    }
    WizardPage Page()
    {
        return cast(WizardPage)НайдиОбъект(wxWizardEvent_GetPage(wxobj),&WizardPage.Нов);
    }
}
+/
