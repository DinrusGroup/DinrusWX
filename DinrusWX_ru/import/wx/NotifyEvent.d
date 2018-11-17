module wx.NotifyEvent;
public import wx.common;
public import wx.CommandEvent;


		//! \cond EXTERN
		static extern (C) IntPtr wxNotifyEvent_ctor(EventType commandtype,цел идок);
		static extern (C) проц   wxNotifyEvent_Veto(IntPtr сам);
		static extern (C) проц   wxNotifyEvent_Allow(IntPtr сам);
		static extern (C) бул   wxNotifyEvent_IsAllowed(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias NotifyEvent wxNotifyEvent;
	public class NotifyEvent : СобытиеКоманда
	{

		public this(IntPtr wxobj) ;
		public this(EventType commandtype = wxEVT_NULL,цел идок = 0);
		public проц Veto();
		public проц Allow() ;
		public проц IsAllowed();
	}
