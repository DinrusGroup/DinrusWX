//-----------------------------------------------------------------------------
// wxD - button.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - button.cxx
//
// The wxButton proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: button.cpp,v 1.10 2007/01/15 11:55:34 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/button.h>
#include "local_events.h"
*/
#include "stdafx.h"

//-----------------------------------------------------------------------------

class _Button : public wxButton
{
public:
    DECLARE_OBJECTDELETED(_Button)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxButton* wxButton_ctor()
{
	return new _Button();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxButton_Create(wxButton *self, wxWindow* parent, wxWindowID id, wxc_string label, const wxPoint* pos, const wxSize* size, long style, const wxValidator* validator, wxc_string name)
{
	if (pos == NULL)
		pos = &wxDefaultPosition;

	if (size == NULL)
		size = &wxDefaultSize;

	if (validator == NULL)
		validator = &wxDefaultValidator;

	if (name.data==NULL)
		name = wxc_string("button");

	return self->Create(parent, id, wxstr(label), *pos, *size, style, *validator, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetDefault(wxButton* self)
{
	self->SetDefault();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_GetDefaultSize(wxSize* size)
{
	*size = wxButton::GetDefaultSize();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetImageLabel(wxButton* self, wxBitmap* bitmap)
{
	self->SetImageLabel(*bitmap);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetImageMargins(wxButton* self, wxCoord x, wxCoord y)
{
	self->SetImageMargins(x, y);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetLabel(wxButton* self, wxc_string label)
{
	self->SetLabel(wxstr(label));
}


