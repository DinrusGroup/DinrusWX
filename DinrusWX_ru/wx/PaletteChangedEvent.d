//-----------------------------------------------------------------------------
// wxD - PaletteChangedEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - PaletteChangedEvent.cs
//
/// The wxPaletteChangedEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: PaletteChangedEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.PaletteChangedEvent;
public import wx.common;

public import wx.Event;

public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxPaletteChangedEvent_ctor(цел winid);
static extern (C) проц wxPaletteChangedEvent_SetChangedWindow(ЦелУкз сам, ЦелУкз win);
static extern (C) ЦелУкз wxPaletteChangedEvent_GetChangedWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PaletteChangedEvent wxPaletteChangedEvent;
public class PaletteChangedEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел winid=0)
    {
        this(wxPaletteChangedEvent_ctor(winid));
    }

    //-----------------------------------------------------------------------------

    public Окно ChangedWindow()
    {
        return cast(Окно)НайдиОбъект(wxPaletteChangedEvent_GetChangedWindow(wxobj), &Окно.Нов);
    }
    public проц ChangedWindow(Окно значение)
    {
        wxPaletteChangedEvent_SetChangedWindow(wxobj, wxObject.SafePtr(значение));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new PaletteChangedEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_PALETTE_CHANGED,			&PaletteChangedEvent.Нов);
    }
}
