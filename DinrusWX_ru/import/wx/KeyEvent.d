module wx.KeyEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
        static extern (C) IntPtr wxKeyEvent_ctor(цел тип);

        static extern (C) бул   wxKeyEvent_ControlDown(IntPtr сам);
        static extern (C) бул   wxKeyEvent_ShiftDown(IntPtr сам);
        static extern (C) бул   wxKeyEvent_AltDown(IntPtr сам);
        static extern (C) бул   wxKeyEvent_MetaDown(IntPtr сам);

        static extern (C) бцел   wxKeyEvent_GetRawКодКл(IntPtr сам);
        static extern (C) цел    wxKeyEvent_GetKeyCode(IntPtr сам);

        static extern (C) бцел   wxKeyEvent_GetRawKeyФлаги(IntPtr сам);
        static extern (C) бул   wxKeyEvent_HasModifiers(IntPtr сам);

        static extern (C) проц   wxKeyEvent_GetPosition(IntPtr сам, inout Точка тчк);
        static extern (C) цел    wxKeyEvent_GetX(IntPtr сам);
        static extern (C) цел    wxKeyEvent_GetY(IntPtr сам);
	
	static extern (C) бул   wxKeyEvent_CmdDown(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias KeyEvent wxKeyEvent;
    public class KeyEvent : Событие
    {
        public this(IntPtr wxobj) ;
        public this(EventType тип = wxEVT_NULL);
        public бул ControlDown();
        public бул MetaDown() ;
        public бул ShiftDown() ;
        public бул AltDown();
	public цел КодКл() ;
        public цел RawКодКл();
        public цел RawKeyФлаги() ;
        public бул HasModifiers();
        public Точка Позиция() ;
        public цел X() ;
        public цел Y() ;
	public бул CmdDown() ;
		private static Событие Нов(IntPtr объ);

		static this()
		{
			ДобавьТипСоб(wxEVT_KEY_DOWN,                        &KeyEvent.Нов);
			ДобавьТипСоб(wxEVT_KEY_UP,                          &KeyEvent.Нов);
			ДобавьТипСоб(wxEVT_CHAR,                            &KeyEvent.Нов);
			ДобавьТипСоб(wxEVT_CHAR_HOOK,                       &KeyEvent.Нов);
		}
    }
