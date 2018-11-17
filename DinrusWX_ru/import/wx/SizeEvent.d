module wx.SizeEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) IntPtr wxSizeEvent_ctor();
		static extern (C) IntPtr wxSizeEvent_ctorSize(inout Размер рм,цел идок);
		static extern (C) IntPtr wxSizeEvent_ctorRect(inout Прям рм,цел идок);
		static extern (C) проц wxSizeEvent_GetSize(IntPtr сам, out Размер разм);
		static extern (C) проц wxSizeEvent_GetRect(IntPtr сам, out Прям прям);
		static extern (C) проц wxSizeEvent_SetRect(IntPtr сам, inout Прям прям);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias SizeEvent wxSizeEvent;
	public class SizeEvent : Событие
	{
		public this(IntPtr wxobj) ;
		public this();
		public this(Размер рм,цел идок = 0);
		public this(Прямоугольник прям,цел идок = 0);
		public Размер разм();
		public Прямоугольник прям();
		public проц прям(Прямоугольник прям);
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
