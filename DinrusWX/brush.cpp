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
wxBrushStyle wxBrush_GetStyle(wxBrush* self)
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

//-----------------------------------------------------------------------------new!!!

extern "C" WXEXPORT
void wxBrush_SetColourRGB(wxBrush* self, unsigned char r, unsigned char g, unsigned char b)
{
	self->SetColour(r, g, b);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxColour* wxBrush_GetColour(wxBrush* self) 
{
    return new wxColour(self->GetColour());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBrush_SetStyle(wxBrush* self, wxBrushStyle style)
{
	self->SetStyle(style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBrush_SetStipple(wxBrush* self, const wxBitmap* stipple)
{
	self->SetStipple(*stipple);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBrush_GetResourceHandle(wxBrush* self)
{
	self->GetResourceHandle();
}

//-----------------------------------