module wx.MouseCaptureChangedEvent;
public import wx.common;

public import wx.Event;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxMouseCaptureChangedEvent_ctor(цел идок,IntPtr gainedCapture);
		static extern (C) IntPtr wxMouseCaptureChangedEvent_GetCapturedWindow(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias MouseCaptureChangedEvent wxMouseCaptureChangedEvent;
	public class MouseCaptureChangedEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел идок = 0, Окно gainedCapture = null);
		public Окно CapturedWindow();
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_MOUSE_CAPTURE_CHANGED,		&MouseCaptureChangedEvent.Нов);
		}
	}
