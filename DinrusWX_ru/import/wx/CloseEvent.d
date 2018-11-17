module wx.CloseEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxCloseEvent_ctor(цел тип,цел идок);
		static extern (C) проц wxCloseEvent_SetLoggingOff(IntPtr сам, бул logOff);
		static extern (C) бул wxCloseEvent_GetLoggingOff(IntPtr сам);
		static extern (C) проц wxCloseEvent_Veto(IntPtr сам, бул veto);
		static extern (C) проц wxCloseEvent_SetCanVeto(IntPtr сам, бул canVeto);
		static extern (C) бул wxCloseEvent_CanVeto(IntPtr сам);
		static extern (C) бул wxCloseEvent_GetVeto(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias CloseEvent wxCloseEvent;
	public class CloseEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(EventType тип = wxEVT_NULL, цел идок = 0);
		public бул LoggingOff();
		public проц LoggingOff(бул значение) ;
		public проц Veto();
		public проц Veto(бул veto);
		public проц CanVeto(бул значение);
		public бул CanVeto() ;
		public бул GetVeto() ;
		private static Событие Нов(IntPtr объ);
		    static this()
    {
        ДобавьТипСоб(wxEVT_CLOSE_WINDOW,                    &CloseEvent.Нов);
        ДобавьТипСоб(wxEVT_END_SESSION,                     &CloseEvent.Нов);
        ДобавьТипСоб(wxEVT_QUERY_END_SESSION,               &CloseEvent.Нов);
    }
	}
