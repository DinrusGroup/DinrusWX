module wx.ChildFocusEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxChildFocusEvent_ctor(IntPtr win);
		static extern (C) IntPtr wxChildFocusEvent_GetWindow(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ChildFocusEvent wxChildFocusEvent;
	public class ChildFocusEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj);
		public this(Окно win);
		public Окно окно() ;
		private static Событие Нов(IntPtr объ) ;
		    static this()
    {
        ДобавьТипСоб(wxEVT_CHILD_FOCUS,				&ChildFocusEvent.Нов);
    }
	}
