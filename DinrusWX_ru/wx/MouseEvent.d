//-----------------------------------------------------------------------------
// wxD - MouseEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MouseEvent.cs
//
/// The wxMouseEvent wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MouseEvent.d,v 1.10 2008/05/07 06:15:51 afb Exp $
//-----------------------------------------------------------------------------

module wx.MouseEvent;
public import wx.common;
public import wx.Event;

public import wx.DC;

//! \cond EXTERN
static extern (C) ЦелУкз wxMouseEvent_ctor(цел mouseType);
static extern (C) бул   wxMouseEvent_IsButton(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_ButtonDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_ButtonDown2(ЦелУкз сам, цел button);
static extern (C) бул   wxMouseEvent_ButtonDClick(ЦелУкз сам, цел but);
static extern (C) бул   wxMouseEvent_ButtonUp(ЦелУкз сам, цел but);
static extern (C) бул   wxMouseEvent_Button(ЦелУкз сам, цел but);
static extern (C) бул   wxMouseEvent_ButtonIsDown(ЦелУкз сам, цел but);
static extern (C) цел    wxMouseEvent_GetButton(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_ControlDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_MetaDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_AltDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_ShiftDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_LeftDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_MiddleDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_RightDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_LeftUp(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_MiddleUp(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_RightUp(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_LeftDClick(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_MiddleDClick(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_RightDClick(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_LeftIsDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_MiddleIsDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_RightIsDown(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_Dragging(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_Moving(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_Entering(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_Leaving(ЦелУкз сам);
static extern (C) проц   wxMouseEvent_GetPosition(ЦелУкз сам, inout Точка поз);
static extern (C) проц   wxMouseEvent_LogicalPosition(ЦелУкз сам, ЦелУкз dc, inout Точка поз);
static extern (C) цел    wxMouseEvent_GetWheelRotation(ЦелУкз сам);
static extern (C) цел    wxMouseEvent_GetWheelDelta(ЦелУкз сам);
static extern (C) цел    wxMouseEvent_GetLinesPerAction(ЦелУкз сам);
static extern (C) бул   wxMouseEvent_IsPageScroll(ЦелУкз сам);
//! \endcond

//----------------------------------------------------------------------------

alias MouseEvent wxMouseEvent;
public class MouseEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия mouseType)
    {
        super(wxMouseEvent_ctor(mouseType));
    }

    //----------------------------------------------------------------------------

    public бул IsButton()
    {
        return wxMouseEvent_IsButton(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул ButtonDown()
    {
        //get { return wxMouseEvent_ButtonDown(wxobj); }
        return ButtonDown(MouseButton.wxMOUSE_BTN_ANY);
    }

    public бул ButtonDown(MouseButton but)
    {
        return wxMouseEvent_ButtonDown2(wxobj, cast(цел)but);
    }

    //----------------------------------------------------------------------------

    public бул ButtonDClick()
    {
        return ButtonDClick(MouseButton.wxMOUSE_BTN_ANY);
    }

    public бул ButtonDClick(MouseButton but)
    {
        return wxMouseEvent_ButtonDClick(wxobj, cast(цел)but);
    }

    //----------------------------------------------------------------------------

    public бул ButtonUp()
    {
        return ButtonUp(MouseButton.wxMOUSE_BTN_ANY);
    }

    public бул ButtonUp(MouseButton but)
    {
        return wxMouseEvent_ButtonUp(wxobj, cast(цел)but);
    }

    //----------------------------------------------------------------------------

    public бул Кнопка(цел but)
    {
        return wxMouseEvent_Button(wxobj, but);
    }

    public бул ButtonIsDown(цел but)
    {
        return wxMouseEvent_ButtonIsDown(wxobj, but);
    }

    public цел Кнопка()
    {
        return wxMouseEvent_GetButton(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул ControlDown()
    {
        return wxMouseEvent_ControlDown(wxobj);
    }

    public бул MetaDown()
    {
        return wxMouseEvent_MetaDown(wxobj);
    }

    public бул AltDown()
    {
        return wxMouseEvent_AltDown(wxobj);
    }

    public бул ShiftDown()
    {
        return wxMouseEvent_ShiftDown(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул LeftDown()
    {
        return wxMouseEvent_LeftDown(wxobj);
    }

    public бул MiddleDown()
    {
        return wxMouseEvent_MiddleDown(wxobj);
    }

    public бул RightDown()
    {
        return wxMouseEvent_RightDown(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул LeftUp()
    {
        return wxMouseEvent_LeftUp(wxobj);
    }

    public бул MiddleUp()
    {
        return wxMouseEvent_MiddleUp(wxobj);
    }

    public бул RightUp()
    {
        return wxMouseEvent_RightUp(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул LeftDClick()
    {
        return wxMouseEvent_LeftDClick(wxobj);
    }

    public бул MiddleDClick()
    {
        return wxMouseEvent_MiddleDClick(wxobj);
    }

    public бул RightDClick()
    {
        return wxMouseEvent_RightDClick(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул LeftIsDown()
    {
        return wxMouseEvent_LeftIsDown(wxobj);
    }

    public бул MiddleIsDown()
    {
        return wxMouseEvent_MiddleIsDown(wxobj);
    }

    public бул RightIsDown()
    {
        return wxMouseEvent_RightIsDown(wxobj);
    }

    //----------------------------------------------------------------------------

    public бул Dragging()
    {
        return wxMouseEvent_Dragging(wxobj);
    }

    public бул Moving()
    {
        return wxMouseEvent_Moving(wxobj);
    }

    public бул Entering()
    {
        return wxMouseEvent_Entering(wxobj);
    }

    public бул Leaving()
    {
        return wxMouseEvent_Leaving(wxobj);
    }

    //----------------------------------------------------------------------------

    public Точка Позиция()
    {
        Точка поз;
        wxMouseEvent_GetPosition(wxobj, поз);
        return поз;
    }

    public Точка LogicalPosition(DC dc)
    {
        Точка поз;
        wxMouseEvent_LogicalPosition(wxobj, wxObject.SafePtr(dc), поз);
        return поз;
    }

    //----------------------------------------------------------------------------

    public цел WheelRotation()
    {
        return wxMouseEvent_GetWheelRotation(wxobj);
    }

    public цел WheelDelta()
    {
        return wxMouseEvent_GetWheelDelta(wxobj);
    }

    public цел LinesPerAction()
    {
        return wxMouseEvent_GetLinesPerAction(wxobj);
    }

    public бул IsPageScroll()
    {
        return wxMouseEvent_IsPageScroll(wxobj);
    }

    //----------------------------------------------------------------------------
    private static Событие Нов(ЦелУкз объ)
    {
        return new MouseEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_LEFT_UP,                         &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_RIGHT_UP,                        &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_MIDDLE_UP,                       &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_ENTER_WINDOW,                    &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_LEAVE_WINDOW,                    &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_LEFT_DOWN,                       &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_MIDDLE_DOWN,                     &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_RIGHT_DOWN,                      &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_LEFT_DCLICK,                     &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_RIGHT_DCLICK,                    &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_MIDDLE_DCLICK,                   &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_MOUSEWHEEL,                      &MouseEvent.Нов);
        ДобавьТипСоб(wxEVT_MOTION,                              &MouseEvent.Нов);
    }
}

