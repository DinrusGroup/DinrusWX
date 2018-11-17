//-----------------------------------------------------------------------------
// wxD - УстCursorEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - УстCursorEvent.cs
//
/// The wxУстCursorEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: УстCursorEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SetCursorEvent;
public import wx.common;

public import wx.Event;

public import wx.Cursor;

//! \cond EXTERN
static extern (C) ЦелУкз	wxУстCursorEvent_ctor(цел x,цел y);
static extern (C) цел		wxУстCursorEvent_GetX(ЦелУкз сам);
static extern (C) цел		wxУстCursorEvent_GetY(ЦелУкз сам);
static extern (C) проц		wxУстCursorEvent_SetCursor(ЦелУкз сам, ЦелУкз курсор);
static extern (C) ЦелУкз	wxУстCursorEvent_GetCursor(ЦелУкз сам);
static extern (C) бул		wxУстCursorEvent_HasCursor(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias УстCursorEvent wxУстCursorEvent;
public class УстCursorEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел x=0,цел y=0)
    {
        this(wxУстCursorEvent_ctor(x,y));
    }

    //-----------------------------------------------------------------------------

    public цел X()
    {
        return wxУстCursorEvent_GetX(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел Y()
    {
        return wxУстCursorEvent_GetY(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Курсор курсор()
    {
        return cast(Курсор)НайдиОбъект(wxУстCursorEvent_GetCursor(wxobj), &Курсор.Нов);
    }
    public проц курсор(Курсор значение)
    {
        wxУстCursorEvent_SetCursor(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public бул HasCursor()
    {
        return wxУстCursorEvent_HasCursor(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new УстCursorEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_SET_CURSOR,				&УстCursorEvent.Нов);
    }
}
