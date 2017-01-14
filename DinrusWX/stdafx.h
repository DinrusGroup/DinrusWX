// stdafx.h: включаемый файл дл€ стандартных системных включаемых файлов
// или включаемых файлов дл€ конкретного проекта, которые часто используютс€, но
// не часто измен€ютс€
//

#pragma once

#include "targetver.h"

#define WIN32_LEAN_AND_MEAN             // »сключите редко используемые компоненты из заголовков Windows
// ‘айлы заголовков Windows:
#include <windows.h>
#include <stdio.h>
#include <string.h>


#define _CRT_SECURE_NO_WARNINGS



#pragma warning( push )
#pragma warning (disable : 4996)


// TODO: ”становите здесь ссылки на дополнительные заголовки, требующиес€ дл€ программы
#include <wx/config.h>
#include <wx/string.h>
#include <wx/event.h>
#include <wx/wx.h>
#include <wx/button.h>
#include <wx/msw/button.h>
#include <wx/bmpbuttn.h>
#include <wx/bitmap.h>
#include <wx/msw/bitmap.h>
#include <wx/image.h>
#include <wx/artprov.h>
#include <wx/control.h>
#include <wx/msw/control.h>
#include <wx/combobox.h>
#include <wx/msw/combobox.h>
#include <wx/colordlg.h>
#include <wx/msw/colordlg.h>
#include <wx/clipbrd.h>
#include <wx/msw/clipbrd.h>
#include <wx/textctrl.h>
#include <wx/msw/textctrl.h>
#include <wx/choicdlg.h>
#include <wx/choice.h>
#include <wx/caret.h>
#include <wx/calctrl.h>
#include <wx/generic/calctrlg.h>
#include <wx/tglbtn.h>
#include <wx/calctrl.h>
#include <wx/fdrepdlg.h>
#include <wx/treectrl.h>
#include <wx/listctrl.h>
#include <wx/notebook.h>
#include <wx/listbook.h>
#include <wx/grid.h>
#include <wx/sashwin.h>
#include <wx/laywin.h>
#include <wx/display.h>
#include <wx/dirdlg.h>
#include <wx/dataobj.h>
#include <wx/msw/dc.h>
#include <wx/msw/dcclient.h>
#include <wx/dcclient.h>
/*
#ifndef __WXGTK__
#include <wx/tabctrl.h>
#endif
*/

/********************************************************/
//local_events.h

class FunctionEvent : public wxEvent
{
public:
	FunctionEvent(wxEventType type)
		: wxEvent(0, type)
	{ }

	virtual wxEvent* Clone() const
	{
		return new FunctionEvent(this->GetEventType());
	}
};


// Custom event types for all mapped virtual functions

//VK: do not work in dialog.cpp
//was forced to redefine as #define name value
//the result is not clear yet.... (Nota Bene!)

BEGIN_DECLARE_EVENT_TYPES()
DECLARE_LOCAL_EVENT_TYPE(wxEVT_APPINIT, 0)
DECLARE_LOCAL_EVENT_TYPE(wxEVT_TRANSFERDATAFROMWINDOW, 0)
DECLARE_LOCAL_EVENT_TYPE(wxEVT_TRANSFERDATATOWINDOW, 0)
DECLARE_LOCAL_EVENT_TYPE(wxEVT_OBJECTDELETED, 0)
END_DECLARE_EVENT_TYPES()

// Short-cut for virtual destructors

// Creates sends an event when an object is deleted, so that it 
// can be handled elsewhere.

#define DECLARE_OBJECTDELETED(name) \
    virtual ~name() \
    { \
        FunctionEvent e(wxEVT_OBJECTDELETED); \
        ProcessEvent(e); \
    }

// Calls a delegate when an object is deleted internally.

#undef CALLBACK
#if 0 //defined(_WINDOWS)
#define CALLBACK __stdcall
#else
#define CALLBACK
#endif

typedef void (CALLBACK* Virtual_Dispose)(void* obj);

#define DECLARE_DISPOSABLE(name) \
    void RegisterDispose(Virtual_Dispose onDispose) { m_onDispose = onDispose; } \
    virtual ~name() { m_onDispose(this); } \
    Virtual_Dispose m_onDispose;
	
/***************************************************************/
//common.h
	
/// length-prefixed string in UTF-8 format
struct dstr {
	size_t          length;
	const char*     data;

	dstr(const char* str, size_t len) {
		data = str;
		length = len;
	}

	dstr(const char* str) {
		data = str;
		length = strlen(data);
	}
	
	operator wxString ()
	{
#if wxUSE_UNICODE
		return wxString(data, wxConvUTF8, length);
#else
		char *zero = (char*) malloc(length+1);
		memcpy(zero, data, length);
		zero[length] = '\0';
		// convert the UTF-8 to wide first, and then back to ansi:
		wxString str = wxString(wxConvUTF8.cMB2WC(zero), wxConvLocal);
		free(zero);
		return str;
#endif
	}
};

// Can't use "bool", since the size varies...
typedef char            wxc_bool;   // D bool

// This is a char[] array, aliased "string"
typedef dstr     wxc_string; // D string

// This is something inherited from "Object"
typedef void*           wxc_object; // D object


// Macro, for compatibility with wx.NET etc
// it converts a wxc_string into a wxString
#define wxstr(str)    wxString(str)


#pragma warning( pop )