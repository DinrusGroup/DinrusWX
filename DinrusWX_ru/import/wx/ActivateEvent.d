module wx.ActivateEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxActivateEvent_ctor(цел тип, бул активен,цел Ид);
		static extern (C) бул wxActivateEvent_GetActive(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias СобытиеАктивации wxСобытиеАктивации;
	public class СобытиеАктивации : Событие
	{
		public this(IntPtr wxobj);
		public this(EventType тип = wxEVT_NULL, бул активен = да, цел Ид = 0);
		public бул Активен() ;
		private static Событие Нов(IntPtr объ);
		    static this()
    {
        ДобавьТипСоб(wxEVT_ACTIVATE,                        &СобытиеАктивации.Нов);
    }
	}
