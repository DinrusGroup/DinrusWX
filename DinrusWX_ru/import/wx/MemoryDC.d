module wx.MemoryDC;
public import wx.common;
public import wx.DC;

		//! \cond EXTERN
		static extern (C) IntPtr wxMemoryDC_ctor();
		static extern (C) IntPtr wxMemoryDC_ctorByDC(IntPtr dc);
		static extern (C) проц   wxMemoryDC_SelectObject(IntPtr сам, IntPtr битмап);
		//! \endcond

		//---------------------------------------------------------------------

	alias MemoryDC wxMemoryDC;
	public class MemoryDC : WindowDC
	{
        public this(IntPtr wxobj) ;
        public this();
        public this(DC dc);
        public проц SelectObject(Битмап битмап);
		//---------------------------------------------------------------------
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxBufferedDC_ctor();
		static extern (C) IntPtr wxBufferedDC_ctorByBitmap(IntPtr dc, IntPtr buffer);
		static extern (C) IntPtr wxBufferedDC_ctorBySize(IntPtr dc, inout Размер area);
		
		static extern (C) проц   wxBufferedDC_InitByBitmap(IntPtr сам, IntPtr dc, IntPtr битмап);
		static extern (C) проц   wxBufferedDC_InitBySize(IntPtr сам, IntPtr dc, inout Размер area);
		static extern (C) проц   wxBufferedDC_UnMask(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias BufferedDC wxBufferedDC;
	public class BufferedDC : MemoryDC
	{
        public this(IntPtr wxobj) ;
 		private this(IntPtr wxobj, бул memOwn);
        public this();
        public this(DC dc, Битмап битмап) ;
        public this(DC dc, Размер разм);
		public проц InitByBitmap(DC dc, Битмап битмап);
		public проц InitBySize(DC dc, Размер area);
        public проц UnMask();
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxBufferedPaintDC_ctor(IntPtr окно, IntPtr buffer);
		//! \endcond

		//---------------------------------------------------------------------
        
	alias BufferedPaintDC wxBufferedPaintDC;
	public class BufferedPaintDC : BufferedDC
	{
        public this(IntPtr wxobj) ;
 		private this(IntPtr wxobj, бул memOwn);
       public this(Окно окно, Битмап buffer);
   }

