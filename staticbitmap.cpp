//-----------------------------------------------------------------------------
// wxD - statbmp.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - statbmp.cxx
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: staticbitmap.cpp,v 1.10 2007/01/15 11:55:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/statbmp.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

class _StaticBitmap : public wxStaticBitmap
{
public:
    DECLARE_OBJECTDELETED(_StaticBitmap)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxStaticBitmap* wxStaticBitmap_ctor()
{
	return new _StaticBitmap();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxStaticBitmap_Create(wxStaticBitmap* self, wxWindow *parent, wxWindowID id, const wxBitmap *bitmap, const wxPoint* pos, const wxSize* size, long style, wxc_string name)
{
	if (pos == NULL)
		pos = &wxDefaultPosition;

	if (size == NULL)
		size = &wxDefaultSize;

	if (name.data==NULL)
		name = wxc_string("staticbitmap");

	return self->Create(parent, id, *bitmap, *pos, *size, style, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxStaticBitmap_dtor(wxStaticBitmap* self)
{
	delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxStaticBitmap_SetIcon(wxStaticBitmap* self, const wxIcon* icon)
{
	self->SetIcon(*icon);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxStaticBitmap_SetBitmap(wxStaticBitmap* self, const wxBitmap* bitmap)
{
	self->SetBitmap(*bitmap);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxBitmap* wxStaticBitmap_GetBitmap(wxStaticBitmap* self)
{
	return new wxBitmap(self->GetBitmap());
}

