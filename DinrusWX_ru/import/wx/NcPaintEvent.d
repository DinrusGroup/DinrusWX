module wx.NcPaintEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxNcPaintEvent_ctor(цел Ид);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias NCPaintEvent wxNCPaintEvent;
	public class NCPaintEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(цел Ид=0);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_NC_PAINT,				&NCPaintEvent.Нов);
		}
	}
