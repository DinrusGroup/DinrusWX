
module wx.MaximizeEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxMaximizeEvent_ctor(цел Ид);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias MaximizeEvent wxMaximizeEvent;
	public class MaximizeEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел Ид = 0);
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			ДобавьТипСоб(wxEVT_MAXIMIZE,				&MaximizeEvent.Нов);		}
	}
