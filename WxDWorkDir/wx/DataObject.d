//-----------------------------------------------------------------------------
// wxD - ОбъектДанных.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Dataobj.cs
//
/// The wxDataObject wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ОбъектДанных.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.DataObject;
public import wx.common;
public import wx.ArrayString;

	public abstract class ОбъектДанных : wxObject
	{
		public enum DataDirection
		{
			Get = 0x01,
			Установи = 0x02,
			Both = 0x03
		}
		
		//---------------------------------------------------------------------

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
				
		override protected проц dtor() {  }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxDataObjectSimple_ctor(ЦУк format);
		static extern (C) проц wxDataObjectSimple_dtor(ЦУк сам);
		static extern (C) проц wxDataObjectSimple_SetFormat(ЦУк сам, ЦУк format);
		static extern (C) бцел wxDataObjectSimple_GetDataSize(ЦУк сам);
		static extern (C) бул wxDataObjectSimple_GetDataHere(ЦУк сам, ЦУк buf);
		static extern (C) бул wxDataObjectSimple_SetData(ЦУк сам, бцел len, ЦУк buf);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias ПростойОбъектДанных wxDataObjectSimple;
	public class ПростойОбъектДанных : ОбъектДанных
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
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxDataObjectSimple_dtor(шхобъ); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxTextDataObject_ctor(ткст текст);
		static extern (C) проц wxTextDataObject_dtor(ЦУк сам);
		static extern (C) проц wxTextDataObject_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) цел wxTextDataObject_GetTextLength(ЦУк сам);
		static extern (C) ЦУк wxTextDataObject_GetText(ЦУк сам);
		static extern (C) проц wxTextDataObject_SetText(ЦУк сам, ткст текст);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias ОбъектТекстовыхДанных wxTextDataObject;
	public class ОбъектТекстовыхДанных : ПростойОбъектДанных
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
			{ this("");}

		public this(ткст текст)
		{
			this(wxTextDataObject_ctor(текст), да);
			wxTextDataObject_RegisterDisposable(шхобъ, &VirtualDispose);
		}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxTextDataObject_dtor(шхобъ); }
			
		//---------------------------------------------------------------------

		public цел ДлинаТекста() { return wxTextDataObject_GetTextLength(шхобъ); }
		
		//---------------------------------------------------------------------

		public ткст Текст() { return cast(ткст) new wxString(wxTextDataObject_GetText(шхобъ), да); }
		public проц Текст(ткст значение) { wxTextDataObject_SetText(шхобъ, значение); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxFileDataObject_ctor();
		static extern (C) проц wxFileDataObject_dtor(ЦУк сам);
		static extern (C) проц wxFileDataObject_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц wxFileDataObject_AddFile(ЦУк сам, ткст фимя);
		static extern (C) ЦУк wxFileDataObject_GetFilenames(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias ОбъектФайловыхДанных wxFileDataObject;
	public class ОбъектФайловыхДанных : ПростойОбъектДанных
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
			this(wxFileDataObject_ctor(), да);
			wxFileDataObject_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxFileDataObject_dtor(шхобъ); }
			
		//---------------------------------------------------------------------
			
		public проц ДобавьФайл(ткст фимя)
		{
			wxFileDataObject_AddFile(шхобъ, фимя);
		}
		
		public ткст[] Именаф()
		{
			МасТкст a=new МасТкст(wxFileDataObject_GetFilenames(шхобъ), да);
			ткст[] res;
			res.length=a.Счёт;
			for(бцел i=0; i<a.Счёт; ++i)
				res[i]=a.Элемент(i);
			
			return res;
		}
	
	}
