
module wx.SysColourChangedEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxSysColourChangedEvent_ctor();
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias SysColourChangedEvent wxSysColourChangedEvent;
	public class SysColourChangedEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this();
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
