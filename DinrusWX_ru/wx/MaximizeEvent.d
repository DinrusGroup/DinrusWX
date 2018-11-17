//-----------------------------------------------------------------------------
// wxD - MaximizeEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MaximizeEvent.cs
//
/// The wxMaximizeEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MaximizeEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MaximizeEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxMaximizeEvent_ctor(цел Ид);
//! \endcond

//-----------------------------------------------------------------------------

alias MaximizeEvent wxMaximizeEvent;
public class MaximizeEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел Ид = 0)
    {
        this(wxMaximizeEvent_ctor(Ид));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new MaximizeEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_MAXIMIZE,				&MaximizeEvent.Нов);
    }
}
