
module wx.IdleEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

	public enum IdleMode
	{
		wxIDLE_PROCESS_ALL,
		wxIDLE_PROCESS_SPECIFIED
	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxIdleEvent_ctor();
		static extern (C) проц   wxIdleEvent_RequestMore(IntPtr сам, бул needMore);
		static extern (C) бул   wxIdleEvent_MoreRequested(IntPtr сам);
		
		static extern (C) проц   wxIdleEvent_SetMode(IdleMode mode);
		static extern (C) IdleMode wxIdleEvent_GetMode();
		static extern (C) бул   wxIdleEvent_CanSend(IntPtr win);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias IdleEvent wxIdleEvent;
	public class IdleEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this();
		public проц RequestMore();
		public проц RequestMore(бул needMore);
		public бул MoreRequested();
		static IdleMode Mode() ;
		static проц Mode(IdleMode значение) ;
		public static бул CanSend(Окно win);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_IDLE, 				&IdleEvent.Нов);
		}
	}
