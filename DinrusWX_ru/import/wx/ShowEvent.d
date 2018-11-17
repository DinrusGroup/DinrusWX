
module wx.ShowEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxShowEvent_ctor(цел идок, бул покажи);
		static extern (C) бул wxShowEvent_GetShow(IntPtr сам);
		static extern (C) проц wxShowEvent_SetShow(IntPtr сам, бул покажи);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias ShowEvent wxShowEvent;
	public class ShowEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел идок = 0, бул покажи = false);
		public бул Покажи() ;
		public проц Покажи(бул значение);
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
