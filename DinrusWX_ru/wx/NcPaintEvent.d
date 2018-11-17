//-----------------------------------------------------------------------------
// wxD - NCPaintEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - NCPaintEvent.cs
//
/// The wxNCPaintEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NcPaintEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NcPaintEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxNcPaintEvent_ctor(цел Ид);
//! \endcond

//-----------------------------------------------------------------------------

alias NCPaintEvent wxNCPaintEvent;
public class NCPaintEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел Ид=0)
    {
        this(wxNcPaintEvent_ctor(Ид));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new NCPaintEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_NC_PAINT,				&NCPaintEvent.Нов);
    }
}
