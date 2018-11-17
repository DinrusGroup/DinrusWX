//-----------------------------------------------------------------------------
// wxD - NavigationKeyEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - NavigationKeyEvent.cs
//
/// The wxNavigationKeyEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NavigationKeyEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NavigationKeyEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxNavigationKeyEvent_ctor();
static extern (C) бул wxNavigationKeyEvent_GetDirection(ЦелУкз сам);
static extern (C) проц wxNavigationKeyEvent_SetDirection(ЦелУкз сам, бул bForward);
static extern (C) бул wxNavigationKeyEvent_IsWindowChange(ЦелУкз сам);
static extern (C) проц wxNavigationKeyEvent_SetWindowChange(ЦелУкз сам, бул bIs);
static extern (C) ЦелУкз wxNavigationKeyEvent_GetCurrentFocus(ЦелУкз сам);
static extern (C) проц wxNavigationKeyEvent_SetCurrentFocus(ЦелУкз сам, ЦелУкз win);
static extern (C) проц wxNavigationKeyEvent_SetФлаги(ЦелУкз сам, бцел флаги);
//! \endcond

//-----------------------------------------------------------------------------

alias NavigationKeyEvent wxNavigationKeyEvent;
public class NavigationKeyEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxNavigationKeyEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    public бул Direction()
    {
        return wxNavigationKeyEvent_GetDirection(wxobj);
    }
    public проц Direction(бул значение)
    {
        wxNavigationKeyEvent_SetDirection(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул WindowChange()
    {
        return wxNavigationKeyEvent_IsWindowChange(wxobj);
    }
    public проц WindowChange(бул значение)
    {
        wxNavigationKeyEvent_SetWindowChange(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public Окно CurrentFocus()
    {
        return cast(Окно)НайдиОбъект(wxNavigationKeyEvent_GetCurrentFocus(wxobj), &Окно.Нов);
    }
    public проц CurrentFocus(Окно значение)
    {
        wxNavigationKeyEvent_SetCurrentFocus(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public проц Флаги(цел значение)
    {
        wxNavigationKeyEvent_SetФлаги(wxobj, cast(бцел)значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new NavigationKeyEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_NAVIGATION_KEY,			&NavigationKeyEvent.Нов);
    }
}
