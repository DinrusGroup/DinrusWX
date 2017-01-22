module wx.MemoryDC;
public import wx.common;
public import wx.DC;

		//! \cond EXTERN
		static extern (C) ЦУк wxMemoryDC_ctor();
		static extern (C) ЦУк wxMemoryDC_ctorByDC(ЦУк dc);
		static extern (C) проц   wxMemoryDC_SelectObject(ЦУк сам, ЦУк битмап);
		//! \endcond

		//---------------------------------------------------------------------

	alias MemoryDC wxMemoryDC;
	public class MemoryDC : WindowDC
	{
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(wxMemoryDC_ctor()); }

        public this(DC dc)
            { this(wxMemoryDC_ctorByDC(wxObject.SafePtr(dc))); }

		//---------------------------------------------------------------------

        public проц SelectObject(Битмап битмап)
        {
            wxMemoryDC_SelectObject(шхобъ, wxObject.SafePtr(битмап));
        }

		//---------------------------------------------------------------------
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxBufferedDC_ctor();
		static extern (C) ЦУк wxBufferedDC_ctorByBitmap(ЦУк dc, ЦУк buffer);
		static extern (C) ЦУк wxBufferedDC_ctorBySize(ЦУк dc, inout Размер area);
		
		static extern (C) проц   wxBufferedDC_InitByBitmap(ЦУк сам, ЦУк dc, ЦУк битмап);
		static extern (C) проц   wxBufferedDC_InitBySize(ЦУк сам, ЦУк dc, inout Размер area);
		static extern (C) проц   wxBufferedDC_UnMask(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias BufferedDC wxBufferedDC;
	public class BufferedDC : MemoryDC
	{
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

 		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

        public this()
            { this(wxBufferedDC_ctor(), да); }

        public this(DC dc, Битмап битмап) 
            { this(wxBufferedDC_ctorByBitmap(wxObject.SafePtr(dc), wxObject.SafePtr(битмап)), да); }

        public this(DC dc, Размер size)
            { this(wxBufferedDC_ctorBySize(wxObject.SafePtr(dc), size), да); }

		//---------------------------------------------------------------------

		public проц InitByBitmap(DC dc, Битмап битмап)
        {
            wxBufferedDC_InitByBitmap(шхобъ, wxObject.SafePtr(dc), wxObject.SafePtr(битмап));
        }

		public проц InitBySize(DC dc, Размер area)
        {
            wxBufferedDC_InitBySize(шхобъ, wxObject.SafePtr(dc), area);
        }

		//---------------------------------------------------------------------

        public проц UnMask()
        {
            wxBufferedDC_UnMask(шхобъ);
        }

		//---------------------------------------------------------------------
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxBufferedPaintDC_ctor(ЦУк окно, ЦУк buffer);
		//! \endcond

		//---------------------------------------------------------------------
        
	alias BufferedPaintDC wxBufferedPaintDC;
	public class BufferedPaintDC : BufferedDC
	{
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

 		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

       public this(Окно окно, Битмап buffer)
            { this(wxBufferedPaintDC_ctor(wxObject.SafePtr(окно), wxObject.SafePtr(buffer)), да); }

		//---------------------------------------------------------------------
	}

