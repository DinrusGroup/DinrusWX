//-----------------------------------------------------------------------------
// wxD - MoveEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MoveEvent.cs
//
/// The wxMoveEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MoveEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MoveEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxMoveEvent_ctor();
static extern (C) ЦелУкз wxMoveEvent_GetPosition(ЦелУкз сам, out Точка Точка);
//! \endcond

//-----------------------------------------------------------------------------

alias MoveEvent wxMoveEvent;
public class MoveEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxMoveEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    public Точка Позиция()
    {
        Точка Точка;
        wxMoveEvent_GetPosition(wxobj, Точка);
        return Точка;
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new MoveEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_MOVE,                            &MoveEvent.Нов);
    }
}
