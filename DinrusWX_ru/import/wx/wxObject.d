module wx.wxObject;
public import wx.common;

//! \cond STD
version (Tango)
import tango.core.Version;
//! \endcond

		//! \cond EXTERN
		extern (C) {
		alias проц function(IntPtr ptr) Virtual_Dispose;
		}
	
		static extern (C) IntPtr wxObject_GetTypeName(IntPtr объ);
		static extern (C) проц   wxObject_dtor(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------
		// this is for Locale gettext support...
		
		//! \cond EXTERN
		static extern (C) IntPtr wxGetTranslation_func(ткст стр);
		//! \endcond
		
		public static ткст GetTranslation(ткст стр);
		public static ткст _(ткст стр);
		//---------------------------------------------------------------------
/+
	template findObject(class T)
	T find(IntPtr ptr){
		Объект o = wxObject.НайдиОбъект(ptr);
		if (o) return cast(T)o;
		else new T(ptr);
	}
+/
	/// This is the root class of all wxWidgets classes.
	/// It declares a virtual destructor which ensures that destructors get
	/// called for all derived class objects where necessary.
	/**
	  * wxObject is the hub of a dynamic object creation scheme, enabling a
	  * program to create instances of a class only knowing its ткст class
	  * имя, and to query the class hierarchy.
	  **/
	public class wxObject : IDisposable
	{
		public IntPtr wxobj = IntPtr.init;

		private static wxObject[IntPtr] objects;
		
		protected бул memOwn = false;

		public this(IntPtr wxobj);
		private this(IntPtr wxobj,бул memOwn);
		public static IntPtr SafePtr(wxObject объ);
		private static ткст GetTypeName(IntPtr wxobj);
		public ткст GetTypeName();
		private static проц AddObject(wxObject объ);

		alias static wxObject function(IntPtr wxobj) newfunc;

		public static wxObject НайдиОбъект(IntPtr ptr, newfunc Нов);
		public static wxObject НайдиОбъект(IntPtr ptr);
		public static бул RemoveObject(IntPtr ptr);
		static extern(C) private проц VirtualDispose(IntPtr ptr);
		private проц realVirtualDispose();
		protected проц dtor() ;
		public  проц Dispose();		
		~this();
		protected бул disposed() ;
	}

