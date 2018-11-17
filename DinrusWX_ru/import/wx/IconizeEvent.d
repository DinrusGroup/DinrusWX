module wx.IconizeEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxIconizeEvent_ctor(цел идок,бул iconized);
		static extern (C) бул wxIconizeEvent_Iconized(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias IconizeEvent wxIconizeEvent;
	public class IconizeEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел идок = 0, бул iconized = да);
		public бул Iconized() ;
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			ДобавьТипСоб(wxEVT_ICONIZE,				&IconizeEvent.Нов);
		}
	}
