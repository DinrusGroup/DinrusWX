/// Common structs that do not belong to any particular class
module wx.common;

/*! \mainpage
 *  <p><a href="http://wxd.sourceforge.net/"><b>wxD</b></a> is
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
// "string" doesn't matter:
const int version_major = 1;
const int version_minor = 0;
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
	void Dispose();
}

interface ICloneable
{
	Object Clone();
}


	/// An implementation-specific type that is used to represent a pointer or a handle.
	typedef void* IntPtr;

version(UNICODE)
	alias wchar_t wxChar;
else //version(ANSI)
	alias ubyte wxChar;
/+
//! \cond D1
static if (version_major < 1 || (version_major == 1 && version_minor < 16))
//! \endcond
	static if (is(object.string)) { /*already added*/ } else
	alias char[] string; // added in DMD 1.016 and DMD 2.000

//! \cond D2
static if (version_major < 2 || (version_major == 2 && version_minor < 6))
//! \endcond
	string assumeUnique(char[] s) { return s; } // DMD 2.006
+/

class NullPointerException : Exception
{
	this(string msg) { super(msg); }
}

class NullReferenceException : Exception
{
	this(string msg) { super(msg); }
}

class ArgumentException : Exception
{
	this(string msg) { super(msg); }
}

class InvalidOperationException : Exception
{
	this(string msg) { super(msg); }
}

class ArgumentNullException : Exception
{
	this(string msg) { super(msg); }
}


//public import wx.Defs;
public import wx.wxObject;
public import wx.wxString;
//public import wx.Log;
//public import wx.Event;
//public import wx.EvtHandler;
//public import wx.App;
//public import wx.Utils;

alias Point wxPoint;
struct Point
{
	int X,Y;

	/** struct constructor */
	static Point opCall(int x,int y)
	{
	    Point pt;
	    pt.X = x;
	    pt.Y = y;
	    return pt;
	}
}

alias Size wxSize;
struct Size
{
	int Width,Height;

	/** struct constructor */
	static Size opCall(int w,int h) {
	    Size sz;
	    sz.Width = w;
	    sz.Height = h;
	    return sz;
	}
}

alias Rectangle wxRectangle;
struct Rectangle
{
	int X,Y,Width,Height;
	int  Left() { return X; }
	void Left(int value) { X = value; }
	int  Top() { return Y; }
	void Top(int value) { Y = value; }

	int  Right() { return X + Width - 1; }
	void Right(int value) { Width = value - X + 1; }
	int  Bottom() { return Y + Height - 1; }
	void Bottom(int value) { Height = value - Y + 1; }

	/** struct constructor */
	static Rectangle opCall(int x,int y,int w,int h)
	{
	    Rectangle rect;
	    rect.X = x;
	    rect.Y = y;
	    rect.Width = w;
	    rect.Height = h;
	    return rect;
	}
}

alias Rect wxRect;
alias Rectangle Rect;

alias new_Rectangle new_Rect;


deprecated Point new_Point(int x,int y)
{
	return Point(x,y);
}

deprecated Size new_Size(int w,int h)
{
	return Size(w,h);
}

deprecated Rectangle new_Rectangle(int x,int y,int w,int h)
{
	return Rectangle(x,y,w,h);
}

/+

//Список импортов из DinrusWX.dll

//accel.cpp

wxAcceleratorEntry* wxAcceleratorEntry_ctor(int flags, int keyCode, int cmd, wxMenuItem* item);
void wxAcceleratorEntry_RegisterDisposable(_AcceleratorEntry* self, Virtual_Dispose onDispose);
void wxAcceleratorEntry_dtor(wxAcceleratorEntry* self);
void wxAcceleratorEntry_Set(wxAcceleratorEntry* self, int flags, int keyCode, int cmd, wxMenuItem* item);
void wxAcceleratorEntry_SetMenuItem(wxAcceleratorEntry* self, wxMenuItem* item);
int wxAcceleratorEntry_GetFlags(wxAcceleratorEntry* self);
int wxAcceleratorEntry_GetKeyCode(wxAcceleratorEntry* self);
int wxAcceleratorEntry_GetCommand(wxAcceleratorEntry* self);
wxMenuItem* wxAcceleratorEntry_GetMenuItem(wxAcceleratorEntry* self);
wxAcceleratorEntry* wxAcceleratorEntry_GetAccelFromString(wxc_string label);
wxAcceleratorTable* wxAcceleratorTable_ctor();
wxc_bool wxAcceleratorTable_Ok(wxAcceleratorTable* self);

// activateevent.cpp

wxActivateEvent* wxActivateEvent_ctor(wxEventType type, wxc_bool active, int Id);
wxc_bool wxActivateEvent_GetActive(wxActivateEvent* self);

// wxD - app.cpp

_App* wxApp_ctor();
void wxApp_RegisterVirtual(_App* self, wxc_object obj, Virtual_OnInit onInit, Virtual_OnRun onRun, Virtual_OnExit onExit,Virtual_Initialize initialize);
wxc_bool wxApp_OnInit(_App* self);
int wxApp_OnRun(_App* self);
int wxApp_OnExit(_App* self);
wxc_bool wxApp_Initialize(_App* self,int *argc, char **argv); 
	void wxApp_Run(int argc, char* argv[]); 
	void wxApp_Run(int argc, char* argv[]);
wxString* wxApp_GetVendorName(wxApp* self);
void wxApp_SetVendorName(wxApp* self, wxc_string name);
wxString* wxApp_GetAppName(wxApp* self);
void wxApp_SetAppName(wxApp* self, wxc_string name);
wxWindow* wxApp_GetTopWindow(wxApp* self);
void wxApp_SetTopWindow(wxApp* self, wxWindow* window);
wxc_bool wxApp_SafeYield(wxWindow* win, wxc_bool onlyIfNeeded) ;
wxc_bool wxApp_Yield(wxApp* self, wxc_bool onlyIfNeeded);
void wxApp_ExitMainLoop(wxApp* self);


+/

