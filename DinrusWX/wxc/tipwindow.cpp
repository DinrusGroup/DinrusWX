//-----------------------------------------------------------------------------
// wxD - tipwindow.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - tipwindow.cxx
//
// The wxTipWindow proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten 
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: tipwindow.cpp,v 1.11 2008/04/06 18:55:49 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/tipwin.h>
#include "local_events.h"
*/
#include "stdafx.h"

#if wxUSE_TIPWINDOW

//-----------------------------------------------------------------------------

class _TipWindow : public wxTipWindow
{
public:
    _TipWindow(wxWindow *parent, const wxString& text, wxCoord maxLength, 
               wxTipWindow** windowPtr, wxRect *rectBound)
        : wxTipWindow(parent, text, maxLength, windowPtr, rectBound) { }

    DECLARE_OBJECTDELETED(_TipWindow)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxTipWindow* wxTipWindow_ctor(wxWindow* parent, wxc_string text, wxCoord maxLength, wxRect* rectBound)
{
    return new _TipWindow(parent, wxstr(text), maxLength, NULL, rectBound);
}

extern "C" WXEXPORT
wxTipWindow* wxTipWindow_ctorNoRect(wxWindow* parent, wxc_string text, wxCoord maxLength)
{
    return wxTipWindow_ctor(parent, text, maxLength, NULL);
}

//-----------------------------------------------------------------------------

/*extern "C" WXEXPORT
void wxTipWindow_SetTipWindowPtr(wxTipWindow* self, * wxTipWindow* windowPtr)
{
    self->SetTipWindowPtr(wxTipWindow* windowPtr);
}*/

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxTipWindow_SetBoundingRect(wxTipWindow* self, wxRect* rectBound)
{
    self->SetBoundingRect(*rectBound);
}

#else
#ifdef __GNUC__
#warning "wxUSE_TIPWINDOW is not set"
#endif

extern "C" WXEXPORT void* wxTipWindow_ctor(wxWindow* parent, wxc_string text, wxCoord maxLength, wxRect* rectBound) { return NULL; /* dummy symbol for library */ }
extern "C" WXEXPORT void wxTipWindow_SetBoundingRect(void* self, wxRect* rectBound) {}
#endif
