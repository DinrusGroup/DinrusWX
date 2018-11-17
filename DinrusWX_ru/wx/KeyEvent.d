//-----------------------------------------------------------------------------
// wxD - KeyEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - KeyEvent.cs
//
/// The wxKeyEvent wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: KeyEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.KeyEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
static extern (C) ЦелУкз wxKeyEvent_ctor(цел тип);

static extern (C) бул   wxKeyEvent_ControlDown(ЦелУкз сам);
static extern (C) бул   wxKeyEvent_ShiftDown(ЦелУкз сам);
static extern (C) бул   wxKeyEvent_AltDown(ЦелУкз сам);
static extern (C) бул   wxKeyEvent_MetaDown(ЦелУкз сам);

static extern (C) бцел   wxKeyEvent_GetRawКодКл(ЦелУкз сам);
static extern (C) цел    wxKeyEvent_GetKeyCode(ЦелУкз сам);

static extern (C) бцел   wxKeyEvent_GetRawKeyФлаги(ЦелУкз сам);
static extern (C) бул   wxKeyEvent_HasModifiers(ЦелУкз сам);

static extern (C) проц   wxKeyEvent_GetPosition(ЦелУкз сам, inout Точка тчк);
static extern (C) цел    wxKeyEvent_GetX(ЦелУкз сам);
static extern (C) цел    wxKeyEvent_GetY(ЦелУкз сам);

static extern (C) бул   wxKeyEvent_CmdDown(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias KeyEvent wxKeyEvent;
public class KeyEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия тип = wxEVT_NULL)
    {
        this(wxKeyEvent_ctor(тип));
    }

    //-----------------------------------------------------------------------------

    public бул ControlDown()
    {
        return wxKeyEvent_ControlDown(wxobj);
    }

    public бул MetaDown()
    {
        return wxKeyEvent_MetaDown(wxobj);
    }

    public бул ShiftDown()
    {
        return wxKeyEvent_ShiftDown(wxobj);
    }

    public бул AltDown()
    {
        return wxKeyEvent_AltDown(wxobj);
    }

    //-----------------------------------------------------------------------------

    /*public КодКл КодКл
    {
        get { return (КодКл)wxKeyEvent_GetKeyCode(wxobj); }
    }*/

    public цел КодКл()
    {
        return wxKeyEvent_GetKeyCode(wxobj);
    }

    public цел RawКодКл()
    {
        return wxKeyEvent_GetRawКодКл(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел RawKeyФлаги()
    {
        return wxKeyEvent_GetRawKeyФлаги(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул HasModifiers()
    {
        return wxKeyEvent_HasModifiers(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Точка Позиция()
    {
        Точка тчк;
        wxKeyEvent_GetPosition(wxobj, тчк);
        return тчк;
    }

    //-----------------------------------------------------------------------------

    public цел X()
    {
        return wxKeyEvent_GetX(wxobj);
    }

    public цел Y()
    {
        return wxKeyEvent_GetY(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул CmdDown()
    {
        return wxKeyEvent_CmdDown(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new KeyEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_KEY_DOWN,                        &KeyEvent.Нов);
        ДобавьТипСоб(wxEVT_KEY_UP,                          &KeyEvent.Нов);
        ДобавьТипСоб(wxEVT_CHAR,                            &KeyEvent.Нов);
        ДобавьТипСоб(wxEVT_CHAR_HOOK,                       &KeyEvent.Нов);
    }
}
