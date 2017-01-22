//-----------------------------------------------------------------------------
// wxD - ClientData.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ClientData.cs
//
/// The wxClientData wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ClientData.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.ClientData;
public import wx.common;

		//! \cond EXTERN
		static extern (C) ЦУк wxClientData_ctor();
		static extern (C) проц wxClientData_dtor(ЦУк сам);
		static extern (C) проц wxClientData_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		//! \endcond
		
		//---------------------------------------------------------------------
        
	alias ClientData wxClientData;
	public class ClientData : wxObject
	{
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
		{ 
			this(wxClientData_ctor(), да);
			wxClientData_RegisterDisposable(шхобъ, &VirtualDispose);
		}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxClientData_dtor(шхобъ); }

		static wxObject Нов(ЦУк ptr) { return new ClientData(ptr); }
	}
    
	//---------------------------------------------------------------------
    
		//! \cond EXTERN
		static extern (C) ЦУк wxStringClientData_ctor(ткст данные);
		static extern (C) проц   wxStringClientData_dtor(ЦУк сам);
		static extern (C) проц   wxStringClientData_SetData(ЦУк сам, ткст данные);
		static extern (C) ЦУк wxStringClientData_GetData(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------
        
	alias StringClientData wxStringClientData;
	public class StringClientData : ClientData
	{
		public this()
			{ this(wxStringClientData_ctor(""), да); }
			
		public this(ткст данные)
			{ this(wxStringClientData_ctor(данные), да); }
			
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxStringClientData_dtor(шхобъ); }
		//---------------------------------------------------------------------
		
		public ткст Data() { return cast(ткст) new wxString(wxStringClientData_GetData(шхобъ), да); }
		public проц Data(ткст значение) { wxStringClientData_SetData(шхобъ, значение); }
	}

