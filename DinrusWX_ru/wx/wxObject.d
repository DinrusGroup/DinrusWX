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
extern (C)
{
    alias проц function(ЦелУкз ptr) Virtual_Dispose;
}

static extern (C) ЦелУкз wxObject_GetTypeName(ЦелУкз объ);
static extern (C) проц   wxObject_dtor(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------
// this is for Locale gettext support...

//! \cond EXTERN
static extern (C) ЦелУкз wxGetTranslation_func(ткст стр);
//! \endcond

public static ткст GetTranslation(ткст стр)
{
    return cast(ткст) new wxString(wxGetTranslation_func(стр), да);
}

// in wxWidgets it is a c/c++ macro

public static ткст _(ткст стр)
{
    return cast(ткст) new wxString(wxGetTranslation_func(стр), да);
}

//---------------------------------------------------------------------
/+
template findObject(class T)
T find(ЦелУкз ptr)
{
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
    // Reference to the associated C++ object
    public ЦелУкз wxobj = ЦелУкз.init;

    // Hashtable to associate C++ objects with D references
    private static wxObject[ЦелУкз] objects;

    // memOwn is да when we create a new instance with the wrapper ctor
    // or if a call to a wrapper function returns new c++ instance.
    // Otherwise the created c++ object won't be deleted by the Dispose member.
    protected бул memOwn = false;

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        //	lock(typeof(wxObject)) {
        this.wxobj = wxobj;

        if (wxobj == ЦелУкз.init)
        {
            version (Tango)
            static if (Tango.Major == 0 && Tango.Minor < 994)
                           throw new NullReferenceException("Не удаётся создать экземпляр " ~ this.toUtf8());
            else
                throw new NullReferenceException("Не удаётся создать экземпляр " ~ this.вТкст());
            else // Phobos
                throw new NullReferenceException("Не удаётся создать экземпляр " ~ this.вТкст());
        }

        AddObject(this);
        //	}
    }

    private this(ЦелУкз wxobj,бул memOwn)
    {
        this(wxobj);
        this.memOwn = memOwn;
    }

    //---------------------------------------------------------------------

    public static ЦелУкз SafePtr(wxObject объ)
    {
        return объ ? объ.wxobj : ЦелУкз.init;
    }

    //---------------------------------------------------------------------

    private static ткст GetTypeName(ЦелУкз wxobj)
    {
        return cast(ткст) new wxString(wxObject_GetTypeName(wxobj), да);
    }

    public ткст GetTypeName()
    {
        return cast(ткст) new wxString(wxObject_GetTypeName(wxobj), да);
    }

    //---------------------------------------------------------------------

    // Registers an wxObject, so that it can be referenced using a C++ object
    // pointer.

    private static проц AddObject(wxObject объ)
    {
        if (объ.wxobj != ЦелУкз.init)
        {
            objects[объ.wxobj] = объ;
        }
    }

    //---------------------------------------------------------------------

    // Locates the registered object that references the given C++ object
    // pointer.
    //
    // If the pointer is not found, a reference to the object is created
    // using тип.

    alias static wxObject function(ЦелУкз wxobj) newfunc;

    public static wxObject НайдиОбъект(ЦелУкз ptr, newfunc Нов)
    {
        if (ptr == ЦелУкз.init)
        {
            return null;
        }

        wxObject o = НайдиОбъект(ptr);

        // If the object wasn't found, create it
        //	if (тип != null && (o == null || o.GetType() != тип)) {
        //		o = (wxObject)Activator.CreateInstance(тип, new object[]{ptr});
        //	}
        if (o is null)
        {
            o = Нов(ptr);
        }

        return o;
    }

    // Locates the registered object that references the given C++ object
    // pointer.

    public static wxObject НайдиОбъект(ЦелУкз ptr)
    {
        if (ptr != ЦелУкз.init)
        {
            wxObject *o = ptr in objects;
            if (o) return *o;
        }

        return null;
    }

    //---------------------------------------------------------------------

    // Removes a registered object.
    // returns да if the object is found in the
    // Hashtable and is removed (for Dispose)

    public static бул RemoveObject(ЦелУкз ptr)
    {
        бул retval = false;

        if (ptr != ЦелУкз.init)
        {
            if(ptr in objects)
            {
                objects.remove(ptr);
                retval = да;
            }
        }

        return retval;
    }

    //---------------------------------------------------------------------

    // called when an c++ (wx)wxObject dtor gets invoked
    static extern(C) private проц VirtualDispose(ЦелУкз ptr)
    {
        НайдиОбъект(ptr).realVirtualDispose();
    }

    private проц realVirtualDispose()
    {
        RemoveObject(wxobj);
        wxobj = ЦелУкз.init;
    }

    protected проц dtor()
    {
        wxObject_dtor(wxobj);
    }

    public  проц Dispose()
    {
        if (wxobj != ЦелУкз.init)
        {
            //	бул still_there = RemoveObject(wxobj);

            //	lock (typeof (wxObject)) {
            if (memOwn /*&& still_there*/)
            {
                dtor();
            }
            //	}

            RemoveObject(wxobj);
            wxobj = ЦелУкз.init;
            //	memOwn = false;
        }
        //GC.SuppressFinalize(this);
    }

    ~this()
    {
        Dispose();
    }

    protected бул disposed()
    {
        return wxobj==ЦелУкз.init;
    }
}

