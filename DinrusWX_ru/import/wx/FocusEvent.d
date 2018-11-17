
module wx.FocusEvent;
public import wx.common;

public import wx.Window;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxFocusEvent_ctor(цел тип,цел идок);
		static extern (C) IntPtr wxFocusEvent_GetWindow(IntPtr сам);
		static extern (C) проц   wxFocusEvent_SetWindow(IntPtr сам, IntPtr win);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias FocusEvent wxFocusEvent;
	public class FocusEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(EventType тип = wxEVT_NULL, цел идок = 0);
		public Окно окно() ;
		public проц окно(Окно значение);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_SET_FOCUS,				&FocusEvent.Нов);
			ДобавьТипСоб(wxEVT_KILL_FOCUS,				&FocusEvent.Нов);
		}
	}
