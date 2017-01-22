/// Common structs that do not belong to any particular class
module wx.common;

/*! \mainpage
 *  <p><a href="http://wxd.sourceforge.net/"><с>wxD</с></a> is
 *  <a href="http://www.wxwidgets.org/">wxWidgets</a> bindings for the
 *  <a href="http://www.d-programming-language.org/">D programming language</a>.</p>
 */   

/*! \namespace wx::libs 
 *  \brief This module gets set to a pragma(link) for version(build).
 *
 *  It also does a pragma(export_version), for platform and encoding.
 */   

//! \cond STD
version (Tango)
{
public import tango.stdc.stddef;
// "ткст" doesn't matter:
const цел version_major = 1;
const цел version_minor = 0;
}

version(Phobos)
{
public import std.c.stddef; // wchar_t
public import std.compiler; // version
  version (D_Version2)
  {
static if (version_major >= 2 && version_minor >= 6)
public import std.contracts; // DMD 2.006
  }
}

version(Dinrus)
{
import stdrus;
}

interface IDisposable
{
	проц Dispose();
}

interface ICloneable
{
	Объект Clone();
}


	/// An implementation-specific тип that is used to represent a pointer or a handle.
	typedef проц* ЦУк;

version(UNICODE)
	alias wchar_t wxChar;
else //version(ANSI)
	alias ббайт wxChar;
/+
//! \cond D1
static if (version_major < 1 || (version_major == 1 && version_minor < 16))
//! \endcond
	static if (is(object.ткст)) { /*already added*/ } else
	alias сим[] ткст; // added in DMD 1.016 and DMD 2.000

//! \cond D2
static if (version_major < 2 || (version_major == 2 && version_minor < 6))
//! \endcond
	ткст assumeUnique(сим[] s) { return s; } // DMD 2.006
+/

class NullPointerException : Exception
{
	this(ткст msg) { super(msg); }
}

class NullReferenceException : Exception
{
	this(ткст msg) { super(msg); }
}

class ИсклАрга : Exception
{
	this(ткст msg) { super(msg); }
}

class InvalidOperationException : Exception
{
	this(ткст msg) { super(msg); }
}

class ArgumentNullException : Exception
{
	this(ткст msg) { super(msg); }
}


//public import wx.Defs;
public import wx.wxObject;
public import wx.wxString;
//public import wx.Log;
//public import wx.Event;
//public import wx.EvtHandler;
//public import wx.App;
//public import wx.Utils;

alias Точка wxPoint;
struct Точка
{
	цел X,Y;

	/** struct constructor */
	static Точка opCall(цел x,цел y)
	{
	    Точка pt;
	    pt.X = x;
	    pt.Y = y;
	    return pt;
	}
}

alias Размер wxSize;
struct Размер
{
	цел Ширина,Высота;

	/** struct constructor */
	static Размер opCall(цел w,цел h) {
	    Размер sz;
	    sz.Ширина = w;
	    sz.Высота = h;
	    return sz;
	}
}

alias Прямоугольник wxRectangle;
struct Прямоугольник
{
	цел X,Y,Ширина,Высота;
	цел  Left() { return X; }
	проц Left(цел значение) { X = значение; }
	цел  Top() { return Y; }
	проц Top(цел значение) { Y = значение; }

	цел  Right() { return X + Ширина - 1; }
	проц Right(цел значение) { Ширина = значение - X + 1; }
	цел  Bottom() { return Y + Высота - 1; }
	проц Bottom(цел значение) { Высота = значение - Y + 1; }

	/** struct constructor */
	static Прямоугольник opCall(цел x,цел y,цел w,цел h)
	{
	    Прямоугольник прям;
	    прям.X = x;
	    прям.Y = y;
	    прям.Ширина = w;
	    прям.Высота = h;
	    return прям;
	}
}

alias Rect wxRect;
alias Прямоугольник Rect;

alias new_Rectangle new_Rect;


deprecated Точка new_Point(цел x,цел y)
{
	return Точка(x,y);
}

deprecated Размер new_Size(цел w,цел h)
{
	return Размер(w,h);
}

deprecated Прямоугольник new_Rectangle(цел x,цел y,цел w,цел h)
{
	return Прямоугольник(x,y,w,h);
}

/+

//Список импортов из DinrusWX.dll

//accel.cpp

wxAcceleratorEntry* wxAcceleratorEntry_ctor(цел флаги, цел кодКлавиши, цел команда, wxMenuItem* элемент);
проц wxAcceleratorEntry_RegisterDisposable(_AcceleratorEntry* сам, Virtual_Dispose onDispose);
проц wxAcceleratorEntry_dtor(wxAcceleratorEntry* сам);
проц wxAcceleratorEntry_Set(wxAcceleratorEntry* сам, цел флаги, цел кодКлавиши, цел команда, wxMenuItem* элемент);
проц wxAcceleratorEntry_SetMenuItem(wxAcceleratorEntry* сам, wxMenuItem* элемент);
цел wxAcceleratorEntry_GetFlags(wxAcceleratorEntry* сам);
цел wxAcceleratorEntry_GetKeyCode(wxAcceleratorEntry* сам);
цел wxAcceleratorEntry_GetCommand(wxAcceleratorEntry* сам);
wxMenuItem* wxAcceleratorEntry_GetMenuItem(wxAcceleratorEntry* сам);
wxAcceleratorEntry* wxAcceleratorEntry_GetAccelFromString(wxc_string надпись);
wxAcceleratorTable* wxAcceleratorTable_ctor();
wxc_bool wxAcceleratorTable_Ok(wxAcceleratorTable* сам);

// activateevent.cpp

wxActivateEvent* wxActivateEvent_ctor(wxEventType тип, wxc_bool активен, цел Ид);
wxc_bool wxActivateEvent_GetActive(wxActivateEvent* сам);

// wxD - прил.cpp

_App* wxApp_ctor();
проц wxApp_RegisterVirtual(_App* сам, wxc_object объ, Virtual_OnInit onInit, Virtual_OnRun onRun, Virtual_OnExit onExit,Virtual_Initialize инициализуй);
wxc_bool wxApp_OnInit(_App* сам);
цел wxApp_OnRun(_App* сам);
цел wxApp_OnExit(_App* сам);
wxc_bool wxApp_Initialize(_App* сам,цел *argc, сим **argv); 
	проц wxApp_Run(цел argc, сим* argv[]); 
	проц wxApp_Run(цел argc, сим* argv[]);
wxString* wxApp_GetVendorName(wxApp* сам);
проц wxApp_SetVendorName(wxApp* сам, wxc_string имя);
wxString* wxApp_GetAppName(wxApp* сам);
проц wxApp_SetAppName(wxApp* сам, wxc_string имя);
wxWindow* wxApp_GetTopWindow(wxApp* сам);
проц wxApp_SetTopWindow(wxApp* сам, wxWindow* окно);
wxc_bool wxApp_SafeYield(wxWindow* окн, wxc_bool толькЕслиНужно) ;
wxc_bool wxApp_Yield(wxApp* сам, wxc_bool толькЕслиНужно);
проц wxApp_ExitMainLoop(wxApp* сам);


+/

