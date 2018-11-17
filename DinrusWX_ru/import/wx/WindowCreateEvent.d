module wx.WindowCreateEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxWindowCreateEvent_ctor(IntPtr тип);
		static extern (C) IntPtr wxWindowCreateEvent_GetWindow(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias WindowCreateEvent wxWindowCreateEvent;
	public class WindowCreateEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj) ;
		public this(Окно win = null);
		public Окно Активен() ;
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
