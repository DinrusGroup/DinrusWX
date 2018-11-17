module wx.MoveEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxMoveEvent_ctor();
		static extern (C) IntPtr wxMoveEvent_GetPosition(IntPtr сам, out Точка Точка);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias MoveEvent wxMoveEvent;
	public class MoveEvent : Событие
	{
		public this(IntPtr wxobj);
		public this();
		public Точка Позиция() ;
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_MOVE,                            &MoveEvent.Нов);
		}
	}
