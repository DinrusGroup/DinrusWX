//-----------------------------------------------------------------------------
// wxD - brush.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - brush.cxx
//
// The wxBrush proxy interface.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: brush.cpp,v 1.10 2007/01/15 11:55:34 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
*/
#include "stdafx.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxBrush* wxBrush_ctor()
{
	return new wxBrush();
}

//-----------------------------------------------------------------------------

//wxBrush* wxBrush_ctor(const wxColour *colour, int style)
//wxBrush* wxBrush_ctor(const wxBitmap *stippleBitmap)

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxBrush_Ok(wxBrush* self)
{
	return self->Ok()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxBrush_GetStyle(wxBrush* self)
{
	return self->GetStyle();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxBitmap* wxBrush_GetStipple(wxBrush* self)
{
	return self->GetStipple();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBrush_SetColour(wxBrush* self, const wxColour* col)
{
	self->SetColour(*col);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxColour* wxBrush_GetColour(wxBrush* self) 
{
    return new wxColour(self->GetColour());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBrush_SetStyle(wxBrush* self, int style)
{
	self->SetStyle(style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBrush_SetStipple(wxBrush* self, const wxBitmap* stipple)
{
	self->SetStipple(*stipple);
}

