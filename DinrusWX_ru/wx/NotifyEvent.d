//-----------------------------------------------------------------------------
// wxD - NotifyEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
//
/// The wxNotifyEvent wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NotifyEvent.d,v 1.6 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NotifyEvent;
public import wx.common;
public import wx.CommandEvent;


//! \cond EXTERN
static extern (C) ЦелУкз wxNotifyEvent_ctor(ТипСобытия commandtype,цел winid);
static extern (C) проц   wxNotifyEvent_Veto(ЦелУкз сам);
static extern (C) проц   wxNotifyEvent_Allow(ЦелУкз сам);
static extern (C) бул   wxNotifyEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias NotifyEvent wxNotifyEvent;
public class NotifyEvent : СобытиеКоманда
{

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия commandtype = wxEVT_NULL,цел winid = 0)
    {
        this(wxNotifyEvent_ctor(commandtype,winid));
    }

    //-----------------------------------------------------------------------------

    public проц Veto()
    {
        wxNotifyEvent_Veto(wxobj);
    }
    public проц Allow()
    {
        wxNotifyEvent_Veto(wxobj);
    }
    public проц IsAllowed()
    {
        return wxNotifyEvent_IsAllowed(wxobj);
    }
}
