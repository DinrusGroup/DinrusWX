module wx.SetCursorEvent;
public import wx.common;

public import wx.Event;

public import wx.Cursor;

		//! \cond EXTERN
		static extern (C) IntPtr	wxУстCursorEvent_ctor(цел x,цел y);
		static extern (C) цел		wxУстCursorEvent_GetX(IntPtr сам);
		static extern (C) цел		wxУстCursorEvent_GetY(IntPtr сам);
		static extern (C) проц		wxУстCursorEvent_SetCursor(IntPtr сам, IntPtr курсор);
		static extern (C) IntPtr	wxУстCursorEvent_GetCursor(IntPtr сам);
		static extern (C) бул		wxУстCursorEvent_HasCursor(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias УстCursorEvent wxУстCursorEvent;
	public class УстCursorEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел x=0,цел y=0);
		public цел X();
		public цел Y();
		public Курсор курсор();
		public проц курсор(Курсор значение) ;
		public бул HasCursor();
		private static Событие Нов(IntPtr объ);
		static this();
	}
