module wx.PaintEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxPaintEvent_ctor(цел Ид);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias PaintEvent wxPaintEvent;
	public class PaintEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this(цел Ид=0);
	}
