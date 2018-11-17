//-----------------------------------------------------------------------------
// wxD - WindowCreateEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - WindowCreateEvent.cs
//
/// The wxWindowCreateEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: WindowCreateEvent.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.WindowCreateEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxWindowCreateEvent_ctor(ЦелУкз тип);
static extern (C) ЦелУкз wxWindowCreateEvent_GetWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias WindowCreateEvent wxWindowCreateEvent;
public class WindowCreateEvent : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно win = null)
    {
        this(wxWindowCreateEvent_ctor(wxObject.SafePtr(win)));
    }

    //-----------------------------------------------------------------------------

    public Окно Активен()
    {
        return cast(Окно)НайдиОбъект(wxWindowCreateEvent_GetWindow(wxobj), &Окно.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new WindowCreateEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_CREATE,				&WindowCreateEvent.Нов);
    }
}
