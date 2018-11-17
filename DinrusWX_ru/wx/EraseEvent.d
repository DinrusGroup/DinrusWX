//-----------------------------------------------------------------------------
// wxD - EraseEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - EraseEvent.cs
//
/// The wxEraseEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: EraseEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.EraseEvent;
public import wx.common;

public import wx.Event;
public import wx.DC;

//! \cond EXTERN
static extern (C) ЦелУкз wxEraseEvent_ctor(цел ид, ЦелУкз dc);
static extern (C) ЦелУкз wxEraseEvent_GetDC(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias EraseEvent wxEraseEvent;
public class EraseEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел ид=0, DC dc = null)
    {
        this(wxEraseEvent_ctor(ид,wxObject.SafePtr(dc)));
    }

    //-----------------------------------------------------------------------------

    public DC GetDC()
    {
        return cast(DC)НайдиОбъект(wxEraseEvent_GetDC(wxobj), &DC.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new EraseEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_ERASE_BACKGROUND,			&EraseEvent.Нов);
    }
}
