//-----------------------------------------------------------------------------
// wxD - InitDialogEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - InitDialogEvent.cs
//
/// The wxInitDialogEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: InitDialogEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.InitDialogEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxInitDialogEvent_ctor(цел Ид);
//! \endcond

//-----------------------------------------------------------------------------

alias InitDialogEvent wxInitDialogEvent;
public class InitDialogEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел Ид = 0)
    {
        this(wxInitDialogEvent_ctor(Ид));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new InitDialogEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_INIT_DIALOG,				&InitDialogEvent.Нов);
    }
}
