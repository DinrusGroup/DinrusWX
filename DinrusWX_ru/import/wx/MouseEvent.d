module wx.MouseEvent;
public import wx.common;
public import wx.Event;

public import wx.DC;

		//! \cond EXTERN
        static extern (C) IntPtr wxMouseEvent_ctor(цел mouseType);
        static extern (C) бул   wxMouseEvent_IsButton(IntPtr сам);
        static extern (C) бул   wxMouseEvent_ButtonDown(IntPtr сам);
	static extern (C) бул   wxMouseEvent_ButtonDown2(IntPtr сам, цел button);
        static extern (C) бул   wxMouseEvent_ButtonDClick(IntPtr сам, цел but);
        static extern (C) бул   wxMouseEvent_ButtonUp(IntPtr сам, цел but);
        static extern (C) бул   wxMouseEvent_Button(IntPtr сам, цел but);
        static extern (C) бул   wxMouseEvent_ButtonIsDown(IntPtr сам, цел but);
        static extern (C) цел    wxMouseEvent_GetButton(IntPtr сам);
        static extern (C) бул   wxMouseEvent_ControlDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_MetaDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_AltDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_ShiftDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_LeftDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_MiddleDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_RightDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_LeftUp(IntPtr сам);
        static extern (C) бул   wxMouseEvent_MiddleUp(IntPtr сам);
        static extern (C) бул   wxMouseEvent_RightUp(IntPtr сам);
        static extern (C) бул   wxMouseEvent_LeftDClick(IntPtr сам);
        static extern (C) бул   wxMouseEvent_MiddleDClick(IntPtr сам);
        static extern (C) бул   wxMouseEvent_RightDClick(IntPtr сам);
        static extern (C) бул   wxMouseEvent_LeftIsDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_MiddleIsDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_RightIsDown(IntPtr сам);
        static extern (C) бул   wxMouseEvent_Dragging(IntPtr сам);
        static extern (C) бул   wxMouseEvent_Moving(IntPtr сам);
        static extern (C) бул   wxMouseEvent_Entering(IntPtr сам);
        static extern (C) бул   wxMouseEvent_Leaving(IntPtr сам);
        static extern (C) проц   wxMouseEvent_GetPosition(IntPtr сам, inout Точка поз);
        static extern (C) проц   wxMouseEvent_LogicalPosition(IntPtr сам, IntPtr dc, inout Точка поз);
        static extern (C) цел    wxMouseEvent_GetWheelRotation(IntPtr сам);
        static extern (C) цел    wxMouseEvent_GetWheelDelta(IntPtr сам);
        static extern (C) цел    wxMouseEvent_GetLinesPerAction(IntPtr сам);
        static extern (C) бул   wxMouseEvent_IsPageScroll(IntPtr сам);
		//! \endcond

		//----------------------------------------------------------------------------

    alias MouseEvent wxMouseEvent;
    public class MouseEvent : Событие
    {
		public this(IntPtr wxobj) ;
        public this(EventType mouseType);
        public бул IsButton() ;
	public бул ButtonDown(MouseButton but);
	public бул ButtonDClick();
        public бул ButtonDClick(MouseButton but);
	public бул ButtonUp();
        public бул ButtonUp(MouseButton but);
        public бул Кнопка(цел but);
        public бул ButtonIsDown(цел but);
        public цел Кнопка();
        public бул ControlDown() ;
        public бул MetaDown() ;
        public бул AltDown() ;
        public бул ShiftDown() ;
        public бул LeftDown() ;
        public бул MiddleDown();
        public бул RightDown();
        public бул LeftUp() ;
        public бул MiddleUp();
        public бул RightUp() ;
        public бул LeftDClick() ;
        public бул MiddleDClick() ;
        public бул RightDClick();
        public бул LeftIsDown() ;
        public бул MiddleIsDown();
        public бул RightIsDown() ;
        public бул Dragging() ;
        public бул Moving() ;
        public бул Entering() ;
        public бул Leaving();
        public Точка Позиция();
        public Точка LogicalPosition(DC dc);
        public цел WheelRotation() ;
        public цел WheelDelta() ;
        public цел LinesPerAction();
        public бул IsPageScroll() ;
		private static Событие Нов(IntPtr объ);

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

