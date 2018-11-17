module wx.EraseEvent;
public import wx.common;

public import wx.Event;
public import wx.DC;

		//! \cond EXTERN
		static extern (C) IntPtr wxEraseEvent_ctor(цел ид, IntPtr dc);
		static extern (C) IntPtr wxEraseEvent_GetDC(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias EraseEvent wxEraseEvent;
	public class EraseEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел ид=0, DC dc = null);
		public DC GetDC() ;
		private static Событие Нов(IntPtr объ);
		static this();
	}
