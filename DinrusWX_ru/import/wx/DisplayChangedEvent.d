module wx.DisplayChangedEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxDisplayChangedEvent_ctor();
		//! \endcond

		//-----------------------------------------------------------------------------

	alias DisplayChangedEvent wxDisplayChangedEvent;
	public class DisplayChangedEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this();
		private static Событие Нов(IntPtr объ);
		    static this()
    {
        ДобавьТипСоб(wxEVT_DISPLAY_CHANGED,			&DisplayChangedEvent.Нов);
    }
	}
