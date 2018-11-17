//-----------------------------------------------------------------------------
// wxD - MouseCaptureChangedEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MouseCaptureChangedEvent.cs
//
/// The wxMouseCaptureChangedEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MouseCaptureChangedEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MouseCaptureChangedEvent;
public import wx.common;

public import wx.Event;

public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxMouseCaptureChangedEvent_ctor(цел winid,ЦелУкз gainedCapture);
static extern (C) ЦелУкз wxMouseCaptureChangedEvent_GetCapturedWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias MouseCaptureChangedEvent wxMouseCaptureChangedEvent;
public class MouseCaptureChangedEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел winid = 0, Окно gainedCapture = null)
    {
        this(wxMouseCaptureChangedEvent_ctor(winid,wxObject.SafePtr(gainedCapture)));
    }

    //-----------------------------------------------------------------------------

    public Окно CapturedWindow()
    {
        return cast(Окно)НайдиОбъект(wxMouseCaptureChangedEvent_GetCapturedWindow(wxobj), &Окно.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new MouseCaptureChangedEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_MOUSE_CAPTURE_CHANGED,		&MouseCaptureChangedEvent.Нов);
    }
}
