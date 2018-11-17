//-----------------------------------------------------------------------------
// wxD - CloseEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - CloseEvent.cs
//
/// The wxCloseEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: CloseEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.CloseEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxCloseEvent_ctor(цел тип,цел winid);
static extern (C) проц wxCloseEvent_SetLoggingOff(ЦелУкз сам, бул logOff);
static extern (C) бул wxCloseEvent_GetLoggingOff(ЦелУкз сам);
static extern (C) проц wxCloseEvent_Veto(ЦелУкз сам, бул veto);
static extern (C) проц wxCloseEvent_SetCanVeto(ЦелУкз сам, бул canVeto);
static extern (C) бул wxCloseEvent_CanVeto(ЦелУкз сам);
static extern (C) бул wxCloseEvent_GetVeto(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias CloseEvent wxCloseEvent;
public class CloseEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0)
    {
        this(wxCloseEvent_ctor(тип,winid));
    }

    //-----------------------------------------------------------------------------

    public бул LoggingOff()
    {
        return wxCloseEvent_GetLoggingOff(wxobj);
    }
    public проц LoggingOff(бул значение)
    {
        wxCloseEvent_SetLoggingOff(wxobj, значение);
    }

    public проц Veto()
    {
        Veto(да);
    }

    public проц Veto(бул veto)
    {
        wxCloseEvent_Veto(wxobj, veto);
    }

    public проц CanVeto(бул значение)
    {
        wxCloseEvent_SetCanVeto(wxobj, значение);
    }
    public бул CanVeto()
    {
        return wxCloseEvent_CanVeto(wxobj);
    }

    public бул GetVeto()
    {
        return wxCloseEvent_GetVeto(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new CloseEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_CLOSE_WINDOW,                    &CloseEvent.Нов);
        ДобавьТипСоб(wxEVT_END_SESSION,                     &CloseEvent.Нов);
        ДобавьТипСоб(wxEVT_QUERY_END_SESSION,               &CloseEvent.Нов);
    }
}
