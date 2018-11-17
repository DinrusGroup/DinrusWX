//-----------------------------------------------------------------------------
// wxD - SizeEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SizeEvent.cs
//
/// The wxSizeEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SizeEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SizeEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxSizeEvent_ctor();
static extern (C) ЦелУкз wxSizeEvent_ctorSize(inout Размер рм,цел winid);
static extern (C) ЦелУкз wxSizeEvent_ctorRect(inout Прям рм,цел winid);
static extern (C) проц wxSizeEvent_GetSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц wxSizeEvent_GetRect(ЦелУкз сам, out Прям прям);
static extern (C) проц wxSizeEvent_SetRect(ЦелУкз сам, inout Прям прям);
//! \endcond

//-----------------------------------------------------------------------------

alias SizeEvent wxSizeEvent;
public class SizeEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxSizeEvent_ctor());
    }

    public this(wx.common.Размер рм,цел winid = 0)
    {
        this(wxSizeEvent_ctorSize(рм,winid));
    }

    public this(Прямоугольник прям,цел winid = 0)
    {
        this(wxSizeEvent_ctorRect(прям,winid));
    }


    //-----------------------------------------------------------------------------

    public Размер размер()
    {
        Размер размер;
        wxSizeEvent_GetSize(wxobj, размер);
        return размер;
    }

    public Прямоугольник прям()
    {
        Прямоугольник прям;
        wxSizeEvent_GetRect(wxobj, прям);
        return прям;
    }

    public проц прям(Прямоугольник прям)
    {
        wxSizeEvent_SetRect(wxobj, прям);
    }


    private static Событие Нов(ЦелУкз объ)
    {
        return new SizeEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_SIZE,                            &SizeEvent.Нов);
    }
}
