//-----------------------------------------------------------------------------
// wxD - ShowEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ShowEvent.cs
//
/// The wxShowEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ShowEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ShowEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxShowEvent_ctor(цел winid, бул покажи);
static extern (C) бул wxShowEvent_GetShow(ЦелУкз сам);
static extern (C) проц wxShowEvent_SetShow(ЦелУкз сам, бул покажи);
//! \endcond

//-----------------------------------------------------------------------------

alias ShowEvent wxShowEvent;
public class ShowEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел winid = 0, бул покажи = false)
    {
        this(wxShowEvent_ctor(winid,покажи));
    }

    //-----------------------------------------------------------------------------

    public бул Покажи()
    {
        return wxShowEvent_GetShow(wxobj);
    }
    public проц Покажи(бул значение)
    {
        wxShowEvent_SetShow(wxobj, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new ShowEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_SHOW,				&ShowEvent.Нов);
    }
}
