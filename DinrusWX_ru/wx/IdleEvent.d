//-----------------------------------------------------------------------------
// wxD - IdleEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - IdleEvent.cs
//
/// The wxIdleEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: IdleEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.IdleEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

public enum IdleMode
{
    wxIDLE_PROCESS_ALL,
    wxIDLE_PROCESS_SPECIFIED
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxIdleEvent_ctor();
static extern (C) проц   wxIdleEvent_RequestMore(ЦелУкз сам, бул needMore);
static extern (C) бул   wxIdleEvent_MoreRequested(ЦелУкз сам);

static extern (C) проц   wxIdleEvent_SetMode(IdleMode mode);
static extern (C) IdleMode wxIdleEvent_GetMode();
static extern (C) бул   wxIdleEvent_CanSend(ЦелУкз win);
//! \endcond

//-----------------------------------------------------------------------------

alias IdleEvent wxIdleEvent;
public class IdleEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxIdleEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    public проц RequestMore()
    {
        RequestMore(да);
    }

    public проц RequestMore(бул needMore)
    {
        wxIdleEvent_RequestMore(wxobj, needMore);
    }

    //-----------------------------------------------------------------------------

    public бул MoreRequested()
    {
        return wxIdleEvent_MoreRequested(wxobj);
    }

    //-----------------------------------------------------------------------------

    static IdleMode Mode()
    {
        return wxIdleEvent_GetMode();
    }
    static проц Mode(IdleMode значение)
    {
        wxIdleEvent_SetMode(значение);
    }

    //-----------------------------------------------------------------------------

    public static бул CanSend(Окно win)
    {
        return wxIdleEvent_CanSend(wxObject.SafePtr(win));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new IdleEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_IDLE, 				&IdleEvent.Нов);
    }
}
