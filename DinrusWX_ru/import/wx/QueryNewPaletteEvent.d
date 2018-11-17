
module wx.QueryNewPaletteEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxQueryNewPaletteEvent_ctor(цел идок);
		static extern (C) бул wxQueryNewPaletteEvent_GetPaletteRealized(IntPtr сам);
		static extern (C) проц wxQueryNewPaletteEvent_SetPaletteRealized(IntPtr сам, бул realized);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias QueryNewPaletteEvent wxQueryNewPaletteEvent;
	public class QueryNewPaletteEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел идок=0);
		public бул Realized();
		public проц Realized(бул значение);
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			ДобавьТипСоб(wxEVT_QUERY_NEW_PALETTE,			&QueryNewPaletteEvent.Нов);
		}
	}
