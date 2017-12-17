//-----------------------------------------------------------------------------
// wxD - staticline.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - staticline.cxx
//
// The wxStaticLine proxy interface.
//
// Written by Robert Roebling
// (C) 2003 by Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: staticline.cpp,v 1.10 2007/01/15 11:55:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/statline.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

class _StaticLine : public wxStaticLine
{
public:
    DECLARE_OBJECTDELETED(_StaticLine)
};

//-----------------------------------------------------------------------------
// C stubs for class methods
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxStaticLine* wxStaticLine_ctor()
{
	return new _StaticLine();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxStaticLine_Create(wxStaticLine *self, wxWindow* parent, wxWindowID id, const wxPoint* pos, const wxSize* size, long style, wxc_string name)
{
	if (pos == NULL)
		pos = &wxDefaultPosition;

	if (size == NULL)
		size = &wxDefaultSize;

	if (name.data==NULL)
		name = wxc_string("staticLine");

	return self->Create(parent, id, *pos, *size, style, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxStaticLine_IsVertical(wxStaticLine* self)
{
	return self->IsVertical()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxStaticLine_GetDefaultSize(wxStaticLine* self)
{
	return self->GetDefaultSize();
}


