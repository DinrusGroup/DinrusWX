module wx.NavigationKeyEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxNavigationKeyEvent_ctor();
		static extern (C) бул wxNavigationKeyEvent_GetDirection(IntPtr сам);
		static extern (C) проц wxNavigationKeyEvent_SetDirection(IntPtr сам, бул bForward);
		static extern (C) бул wxNavigationKeyEvent_IsWindowChange(IntPtr сам);
		static extern (C) проц wxNavigationKeyEvent_SetWindowChange(IntPtr сам, бул bIs);
		static extern (C) IntPtr wxNavigationKeyEvent_GetCurrentFocus(IntPtr сам);
		static extern (C) проц wxNavigationKeyEvent_SetCurrentFocus(IntPtr сам, IntPtr win);
		static extern (C) проц wxNavigationKeyEvent_SetФлаги(IntPtr сам, бцел флаги);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias NavigationKeyEvent wxNavigationKeyEvent;
	public class NavigationKeyEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this();
		public бул Direction();
		public проц Direction(бул значение);
		public бул WindowChange() ;
		public проц WindowChange(бул значение);
		public Окно CurrentFocus() ;
		public проц CurrentFocus(Окно значение) ;
		public проц Флаги(цел значение);
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			ДобавьТипСоб(wxEVT_NAVIGATION_KEY,			&NavigationKeyEvent.Нов);
		}
	}
