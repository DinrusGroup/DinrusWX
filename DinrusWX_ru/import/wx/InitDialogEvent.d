
module wx.InitDialogEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxInitDialogEvent_ctor(цел Ид);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias InitDialogEvent wxInitDialogEvent;
	public class InitDialogEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел Ид = 0);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_INIT_DIALOG,				&InitDialogEvent.Нов);
		}
	}
