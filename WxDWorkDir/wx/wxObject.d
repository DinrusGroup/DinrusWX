//-----------------------------------------------------------------------------
// wxD - wxObject.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - wxObject.cs
//
/// The wxObject wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: wxObject.d,v 1.14 2008/07/29 06:53:22 afb Exp $
//-----------------------------------------------------------------------------

module wx.wxObject;
public import wx.common;

//! \cond STD
version (Tango)
import tango.core.Version;
//! \endcond

		//! \cond EXTERN
		extern (C) {
		alias проц function(ЦУк ptr) Virtual_Dispose;
		}
	
		static extern (C) ЦУк wxObject_GetTypeName(ЦУк объ);
		static extern (C) проц   wxObject_dtor(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------
		// this is for Locale gettext support...
		
		//! \cond EXTERN
		static extern (C) ЦУк wxGetTranslation_func(ткст str);
		//! \endcond
		
		public static ткст GetTranslation(ткст str)
		{
			return cast(ткст) new wxString(wxGetTranslation_func(str), да);
		}

		// in wxWidgets it is a c/c++ macro
				
		public static ткст _(ткст str)
		{
			return cast(ткст) new wxString(wxGetTranslation_func(str), да);
		}

		//---------------------------------------------------------------------
/+
	template findObject(class T)
	T find(ЦУк ptr){
		Объект o = wxObject.FindObject(ptr);
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
		// Reference to the associated C++ object
		public ЦУк шхобъ = ЦУк.init;

		// Hashtable to associate C++ objects with D references
		private static wxObject[ЦУк] objects;
		
		// memOwn is да when we create a new instance with the wrapper ctor
		// or if a call to a wrapper function returns new c++ instance.
		// Otherwise the created c++ object won't be deleted by the Dispose member.
		protected бул memOwn = нет;
		
		//---------------------------------------------------------------------

		public this(ЦУк шхобъ)
		{
		//	lock(typeof(wxObject)) {
				this.шхобъ = шхобъ;

				if (шхобъ == ЦУк.init) {
					version (Tango)
					static if (Tango.Major == 0 && Tango.Minor < 994)
					throw new NullReferenceException("Unable to create instance of " ~ this.toUtf8());
					else
					throw new NullReferenceException("Unable to create instance of " ~ this.toString());
					else // Phobos
					throw new NullReferenceException("Unable to create instance of " ~ this.toString());
				}

				AddObject(this);
		//	}
		}

		private this(ЦУк шхобъ,бул memOwn)
		{
			this(шхобъ);
			this.memOwn = memOwn;
		}

		//---------------------------------------------------------------------

		public static ЦУк SafePtr(wxObject объ)
		{
			return объ ? объ.шхобъ : ЦУк.init;
		}
		
		//---------------------------------------------------------------------

		private static ткст GetTypeName(ЦУк шхобъ)
		{
			return cast(ткст) new wxString(wxObject_GetTypeName(шхобъ), да);
		}

		public ткст GetTypeName()
		{
			return cast(ткст) new wxString(wxObject_GetTypeName(шхобъ), да);
		}

		//---------------------------------------------------------------------

		// Registers an wxObject, so that it can be referenced using a C++ object
		// pointer.
        
		private static проц AddObject(wxObject объ)
		{
			if (объ.шхобъ != ЦУк.init) {
				objects[объ.шхобъ] = объ;
			}
		}
	
		//---------------------------------------------------------------------

		// Locates the registered object that references the given C++ object
		// pointer.
		//
		// If the pointer is not found, a reference to the object is created 
		// using тип.

		alias static wxObject function(ЦУк шхобъ) newfunc;

		public static wxObject FindObject(ЦУк ptr, newfunc Нов)
		{
			if (ptr == ЦУк.init) {
				return пусто;
			}

			wxObject o = FindObject(ptr);

			// If the object wasn't found, create it
		//	if (тип != пусто && (o == пусто || o.GetType() != тип)) {
		//		o = (wxObject)Activator.CreateInstance(тип, new object[]{ptr});
		//	}
			if (o is пусто) {
				o = Нов(ptr);
			}

			return o;
		}
	
		// Locates the registered object that references the given C++ object
		// pointer.

		public static wxObject FindObject(ЦУк ptr)
		{
			if (ptr != ЦУк.init) {
				wxObject *o = ptr in objects;
				if (o) return *o;
			}

			return пусто;
		}
		
		//---------------------------------------------------------------------

		// Removes a registered object.
		// returns да if the object is found in the
		// Hashtable and is removed (for Dispose)

		public static бул RemoveObject(ЦУк ptr)
		{
			бул retval = нет;

			if (ptr != ЦУк.init)
			{
				if(ptr in objects) {
					objects.remove(ptr);
					retval = да;
				}
			}
			
			return retval;
		}
		
		//---------------------------------------------------------------------
		
		// called when an c++ (wx)wxObject dtor gets invoked
		static extern(C) private проц VirtualDispose(ЦУк ptr)
		{
			FindObject(ptr).realVirtualDispose();
		}

		private проц realVirtualDispose()
		{
			RemoveObject(шхобъ);
			шхобъ = ЦУк.init;
		}

		protected проц dtor() { wxObject_dtor(шхобъ); }

		public /+virtual+/ проц Dispose()
		{
			if (шхобъ != ЦУк.init)
			{
			//	бул still_there = RemoveObject(шхобъ);

			//	lock (typeof (wxObject)) {
					if (memOwn /*&& still_there*/)
					{
						dtor();
					}
			//	}
				
				RemoveObject(шхобъ);
				шхобъ = ЦУк.init;
			//	memOwn = нет;
			}
			//GC.SuppressFinalize(this);
		}
		
		~this()
		{
			Dispose();
		}

		protected бул disposed() { return шхобъ==ЦУк.init; }
	}

