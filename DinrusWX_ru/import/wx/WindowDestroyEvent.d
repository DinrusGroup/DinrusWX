module wx.WindowDestroyEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxWindowDestroyEvent_ctor(IntPtr тип);
		static extern (C) IntPtr wxWindowDestroyEvent_GetWindow(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias WindowDestroyEvent wxWindowDestroyEvent;
	public class WindowDestroyEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj) ;
		public this(Окно win = null);
		public Окно Активен() ;
		private static Событие Нов(IntPtr объ);
		static this();
	}
