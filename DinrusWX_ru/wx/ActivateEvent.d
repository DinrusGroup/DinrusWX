//-----------------------------------------------------------------------------
// wxD - СобытиеАктивации.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - СобытиеАктивации.cs
//
/// The wxСобытиеАктивации wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: СобытиеАктивации.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ActivateEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxActivateEvent_ctor(цел тип, бул активен,цел Ид);
static extern (C) бул wxActivateEvent_GetActive(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias СобытиеАктивации wxСобытиеАктивации;
public class СобытиеАктивации : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия тип = wxEVT_NULL, бул активен = да, цел Ид = 0)
    {
        this(wxActivateEvent_ctor(тип,да,Ид));
    }

    //-----------------------------------------------------------------------------

    public бул Активен()
    {
        return wxActivateEvent_GetActive(wxobj);
    }


    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеАктивации(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_ACTIVATE,                        &СобытиеАктивации.Нов);
    }
}
