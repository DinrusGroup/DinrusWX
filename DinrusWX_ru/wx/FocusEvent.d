//-----------------------------------------------------------------------------
// wxD - FocusEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FocusEvent.cs
//
/// The wxFocusEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FocusEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.FocusEvent;
public import wx.common;

public import wx.Window;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxFocusEvent_ctor(цел тип,цел winid);
static extern (C) ЦелУкз wxFocusEvent_GetWindow(ЦелУкз сам);
static extern (C) проц   wxFocusEvent_SetWindow(ЦелУкз сам, ЦелУкз win);
//! \endcond

//-----------------------------------------------------------------------------

alias FocusEvent wxFocusEvent;
public class FocusEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0)
    {
        this(wxFocusEvent_ctor(тип,winid));
    }

    //-----------------------------------------------------------------------------

    public Окно окно()
    {
        return cast(Окно)НайдиОбъект(wxFocusEvent_GetWindow(wxobj), &Окно.Нов);
    }
    public проц окно(Окно значение)
    {
        wxFocusEvent_SetWindow(wxobj, wxObject.SafePtr(значение));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new FocusEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_SET_FOCUS,				&FocusEvent.Нов);
        ДобавьТипСоб(wxEVT_KILL_FOCUS,				&FocusEvent.Нов);
    }
}
