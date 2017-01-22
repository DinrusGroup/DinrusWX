module wx.DisplayChangedEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxDisplayChangedEvent_ctor();
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias DisplayChangedEvent wxDisplayChangedEvent;
	public class DisplayChangedEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxDisplayChangedEvent_ctor()); }

		private static Событие Нов(ЦУк объ) { return new DisplayChangedEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_DISPLAY_CHANGED,			&DisplayChangedEvent.Нов);
		}
	}
