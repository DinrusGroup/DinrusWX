module wx.DataObject;
public import wx.common;
public import wx.ArrayString;

	public abstract class DataObject : wxObject
	{
		public enum DataDirection
		{
			Get = 0x01,
			Уст = 0x02,
			Both = 0x03
		}
		
		//---------------------------------------------------------------------

		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor();
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxDataObjectSimple_ctor(IntPtr format);
		static extern (C) проц wxDataObjectSimple_dtor(IntPtr сам);
		static extern (C) проц wxDataObjectSimple_SetFormat(IntPtr сам, IntPtr format);
		static extern (C) бцел wxDataObjectSimple_GetDataSize(IntPtr сам);
		static extern (C) бул wxDataObjectSimple_GetDataHere(IntPtr сам, IntPtr buf);
		static extern (C) бул wxDataObjectSimple_SetData(IntPtr сам, бцел len, IntPtr buf);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias DataObjectSimple wxDataObjectSimple;
	public class DataObjectSimple : DataObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTextDataObject_ctor(ткст текст);
		static extern (C) проц wxTextDataObject_dtor(IntPtr сам);
		static extern (C) проц wxTextDataObject_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) цел wxTextDataObject_GetTextLength(IntPtr сам);
		static extern (C) IntPtr wxTextDataObject_GetText(IntPtr сам);
		static extern (C) проц wxTextDataObject_SetText(IntPtr сам, ткст текст);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias TextDataObject wxTextDataObject;
	public class TextDataObject : DataObjectSimple
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(ткст текст);
		override protected проц dtor();
		public цел TextLength();
		public ткст Text();
		public проц Text(ткст значение) ;
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxFileDataObject_ctor();
		static extern (C) проц wxFileDataObject_dtor(IntPtr сам);
		static extern (C) проц wxFileDataObject_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц wxFileDataObject_AddFile(IntPtr сам, ткст filename);
		static extern (C) IntPtr wxFileDataObject_GetFilenames(IntPtr сам);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias FileDataObject wxFileDataObject;
	public class FileDataObject : DataObjectSimple
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor();
		public проц AddFile(ткст filename);
		public ткст[] Filenames();
	}
