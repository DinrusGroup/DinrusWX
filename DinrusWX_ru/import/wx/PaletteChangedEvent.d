
module wx.PaletteChangedEvent;
public import wx.common;

public import wx.Event;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxPaletteChangedEvent_ctor(цел идок);
		static extern (C) проц wxPaletteChangedEvent_SetChangedWindow(IntPtr сам, IntPtr win);
		static extern (C) IntPtr wxPaletteChangedEvent_GetChangedWindow(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias PaletteChangedEvent wxPaletteChangedEvent;
	public class PaletteChangedEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел идок=0);
		public Окно ChangedWindow() ;
		public проц ChangedWindow(Окно значение);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_PALETTE_CHANGED,			&PaletteChangedEvent.Нов);
		}
	}
