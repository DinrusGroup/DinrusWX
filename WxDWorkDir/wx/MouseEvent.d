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
        static extern (C) ЦУк wxMouseEvent_ctor(цел mouseType);
        static extern (C) бул   wxMouseEvent_IsButton(ЦУк сам);
        static extern (C) бул   wxMouseEvent_ButtonDown(ЦУк сам);
	static extern (C) бул   wxMouseEvent_ButtonDown2(ЦУк сам, цел button);
        static extern (C) бул   wxMouseEvent_ButtonDClick(ЦУк сам, цел but);
        static extern (C) бул   wxMouseEvent_ButtonUp(ЦУк сам, цел but);
        static extern (C) бул   wxMouseEvent_Button(ЦУк сам, цел but);
        static extern (C) бул   wxMouseEvent_ButtonIsDown(ЦУк сам, цел but);
        static extern (C) цел    wxMouseEvent_GetButton(ЦУк сам);
        static extern (C) бул   wxMouseEvent_ControlDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_MetaDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_AltDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_ShiftDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_LeftDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_MiddleDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_RightDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_LeftUp(ЦУк сам);
        static extern (C) бул   wxMouseEvent_MiddleUp(ЦУк сам);
        static extern (C) бул   wxMouseEvent_RightUp(ЦУк сам);
        static extern (C) бул   wxMouseEvent_LeftDClick(ЦУк сам);
        static extern (C) бул   wxMouseEvent_MiddleDClick(ЦУк сам);
        static extern (C) бул   wxMouseEvent_RightDClick(ЦУк сам);
        static extern (C) бул   wxMouseEvent_LeftIsDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_MiddleIsDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_RightIsDown(ЦУк сам);
        static extern (C) бул   wxMouseEvent_Dragging(ЦУк сам);
        static extern (C) бул   wxMouseEvent_Moving(ЦУк сам);
        static extern (C) бул   wxMouseEvent_Entering(ЦУк сам);
        static extern (C) бул   wxMouseEvent_Leaving(ЦУк сам);
        static extern (C) проц   wxMouseEvent_GetPosition(ЦУк сам, inout Точка поз);
        static extern (C) проц   wxMouseEvent_LogicalPosition(ЦУк сам, ЦУк dc, inout Точка поз);
        static extern (C) цел    wxMouseEvent_GetWheelRotation(ЦУк сам);
        static extern (C) цел    wxMouseEvent_GetWheelDelta(ЦУк сам);
        static extern (C) цел    wxMouseEvent_GetLinesPerAction(ЦУк сам);
        static extern (C) бул   wxMouseEvent_IsPageScroll(ЦУк сам);
		//! \endcond

		//----------------------------------------------------------------------------

    alias MouseEvent wxMouseEvent;
    public class MouseEvent : Событие
    {
		public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(ТипСобытия mouseType)
            { super(wxMouseEvent_ctor(mouseType)); }

		//----------------------------------------------------------------------------

        public бул IsButton() { return wxMouseEvent_IsButton(шхобъ); }
	
	//----------------------------------------------------------------------------

        public бул ButtonDown()
        {
            //get { return wxMouseEvent_ButtonDown(шхобъ); }
	    return ButtonDown(MouseButton.wxMOUSE_BTN_ANY);
        }
	
	public бул ButtonDown(MouseButton but)
	{
		return wxMouseEvent_ButtonDown2(шхобъ, cast(цел)but);
	}
	
	//----------------------------------------------------------------------------
	
	public бул ButtonDClick()
	{
		return ButtonDClick(MouseButton.wxMOUSE_BTN_ANY);
	}

        public бул ButtonDClick(MouseButton but)
        {
            return wxMouseEvent_ButtonDClick(шхобъ, cast(цел)but);
        }
	
	//----------------------------------------------------------------------------
	
	public бул ButtonUp()
	{
		return ButtonUp(MouseButton.wxMOUSE_BTN_ANY);
	}

        public бул ButtonUp(MouseButton but)
        {
            return wxMouseEvent_ButtonUp(шхобъ, cast(цел)but);
        }
	
	//----------------------------------------------------------------------------

        public бул Кнопка(цел but)
        {
            return wxMouseEvent_Button(шхобъ, but);
        }

        public бул ButtonIsDown(цел but)
        {
            return wxMouseEvent_ButtonIsDown(шхобъ, but);
        }

        public цел Кнопка()
        {
            return wxMouseEvent_GetButton(шхобъ);
        }

		//----------------------------------------------------------------------------

        public бул НажатКонтрол() { return wxMouseEvent_ControlDown(шхобъ); }

        public бул НажатМета() { return wxMouseEvent_MetaDown(шхобъ); }

        public бул НажатАльт() { return wxMouseEvent_AltDown(шхобъ); }

        public бул НажатШифт() { return wxMouseEvent_ShiftDown(шхобъ); }

		//----------------------------------------------------------------------------

        public бул LeftDown() { return wxMouseEvent_LeftDown(шхобъ); }

        public бул MiddleDown() { return wxMouseEvent_MiddleDown(шхобъ); }

        public бул RightDown() { return wxMouseEvent_RightDown(шхобъ); }

		//----------------------------------------------------------------------------

        public бул LeftUp() { return wxMouseEvent_LeftUp(шхобъ); }

        public бул MiddleUp() { return wxMouseEvent_MiddleUp(шхобъ); }

        public бул RightUp() { return wxMouseEvent_RightUp(шхобъ); }

		//----------------------------------------------------------------------------

        public бул LeftDClick() { return wxMouseEvent_LeftDClick(шхобъ); }

        public бул MiddleDClick() { return wxMouseEvent_MiddleDClick(шхобъ); }

        public бул RightDClick() { return wxMouseEvent_RightDClick(шхобъ); }

		//----------------------------------------------------------------------------

        public бул LeftIsDown() { return wxMouseEvent_LeftIsDown(шхобъ); }

        public бул MiddleIsDown() { return wxMouseEvent_MiddleIsDown(шхобъ); }

        public бул RightIsDown() { return wxMouseEvent_RightIsDown(шхобъ); }

		//----------------------------------------------------------------------------

        public бул Dragging() { return wxMouseEvent_Dragging(шхобъ); }

        public бул Moving() { return wxMouseEvent_Moving(шхобъ); }

        public бул Entering() { return wxMouseEvent_Entering(шхобъ); }

        public бул Leaving() { return wxMouseEvent_Leaving(шхобъ); }

		//----------------------------------------------------------------------------

        public Точка Положение() { 
                Точка поз;
                wxMouseEvent_GetPosition(шхобъ, поз);
                return поз;
            }

        public Точка LogicalPosition(DC dc)
        {
			Точка поз;
            wxMouseEvent_LogicalPosition(шхобъ, wxObject.SafePtr(dc), поз);
			return поз;
        }

		//----------------------------------------------------------------------------

        public цел WheelRotation() { return wxMouseEvent_GetWheelRotation(шхобъ); }

        public цел WheelDelta() { return wxMouseEvent_GetWheelDelta(шхобъ); }

        public цел LinesPerAction() { return wxMouseEvent_GetLinesPerAction(шхобъ); }

        public бул IsPageScroll() { return wxMouseEvent_IsPageScroll(шхобъ); }

		//----------------------------------------------------------------------------
		private static Событие Нов(ЦУк объ) { return new MouseEvent(объ); }

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
			ДобавьТипСоб(wxEVT_MOTION,                              &MouseEvent.Нов);   		}
    }

