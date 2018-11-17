//-----------------------------------------------------------------------------
// wxD - HelpEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - HelpEvent.cs
//
/// The wxHelpEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HelpEvent.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.HelpEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxHelpEvent_ctor(цел тип,цел winid, inout Точка поз);
static extern (C) проц   wxHelpEvent_GetPosition(ЦелУкз сам, inout Точка поз);
static extern (C) проц   wxHelpEvent_SetPosition(ЦелУкз сам, inout Точка поз);
static extern (C) ЦелУкз wxHelpEvent_GetLink(ЦелУкз сам);
static extern (C) проц   wxHelpEvent_SetLink(ЦелУкз сам, ткст link);
static extern (C) ЦелУкз wxHelpEvent_GetTarget(ЦелУкз сам);
static extern (C) проц   wxHelpEvent_SetTarget(ЦелУкз сам, ткст target);
//! \endcond

//-----------------------------------------------------------------------------

alias HelpEvent wxHelpEvent;
public class HelpEvent : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0, Точка поз = Окно.вхДефПоз)
    {
        this(wxHelpEvent_ctor(тип,winid,поз));
    }

    //-----------------------------------------------------------------------------

    public Точка Позиция()
    {
        Точка p;
        wxHelpEvent_GetPosition(wxobj, p);
        return p;
    }

    public проц Позиция(Точка значение)
    {
        wxHelpEvent_SetPosition(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст Link()
    {
        return cast(ткст) new wxString(wxHelpEvent_GetLink(wxobj), да);
    }
    public проц Link(ткст значение)
    {
        wxHelpEvent_SetLink(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст Target()
    {
        return cast(ткст) new wxString(wxHelpEvent_GetTarget(wxobj), да);
    }
    public проц Target(ткст значение)
    {
        wxHelpEvent_SetTarget(wxobj, значение);
    }


    private static Событие Нов(ЦелУкз объ)
    {
        return new HelpEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_HELP,				&HelpEvent.Нов);
        ДобавьТипСоб(wxEVT_DETAILED_HELP,			&HelpEvent.Нов);
    }
}
