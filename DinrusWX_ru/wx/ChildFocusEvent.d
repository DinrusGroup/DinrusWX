//-----------------------------------------------------------------------------
// wxD - ChildFocusEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ChildFocusEvent.cs
//
/// The wxChildFocusEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ChildFocusEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ChildFocusEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxChildFocusEvent_ctor(ЦелУкз win);
static extern (C) ЦелУкз wxChildFocusEvent_GetWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias ChildFocusEvent wxChildFocusEvent;
public class ChildFocusEvent : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно win)
    {
        super(wxChildFocusEvent_ctor(wxObject.SafePtr(win)));
    }

    //-----------------------------------------------------------------------------

    public Окно окно()
    {
        return cast(Окно)НайдиОбъект(wxChildFocusEvent_GetWindow(wxobj), &Окно.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new ChildFocusEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_CHILD_FOCUS,				&ChildFocusEvent.Нов);
    }
}
