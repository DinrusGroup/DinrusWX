module wx.ClientData;
public import wx.common;

		//! \cond EXTERN
		static extern (C) IntPtr wxClientData_ctor();
		static extern (C) проц wxClientData_dtor(IntPtr сам);
		static extern (C) проц wxClientData_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		//! \endcond
		
		//---------------------------------------------------------------------
        
	alias ClientData wxClientData;
	public class ClientData : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor();
		static wxObject Нов(IntPtr ptr) ;
	}
    
	//---------------------------------------------------------------------
    
		//! \cond EXTERN
		static extern (C) IntPtr wxStringClientData_ctor(ткст data);
		static extern (C) проц   wxStringClientData_dtor(IntPtr сам);
		static extern (C) проц   wxStringClientData_SetData(IntPtr сам, ткст data);
		static extern (C) IntPtr wxStringClientData_GetData(IntPtr сам);
		//! \endcond
		
		//---------------------------------------------------------------------
        
	alias StringClientData wxStringClientData;
	public class StringClientData : ClientData
	{
		public this();
		public this(ткст data);
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor();
		public ткст Data() ;
		public проц Data(ткст значение) ;
	}

