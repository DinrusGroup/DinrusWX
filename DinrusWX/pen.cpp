//-----------------------------------------------------------------------------
// wxD - pen.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - pen.cxx
//
// The wxPen proxy interface.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: pen.cpp,v 1.10 2007/01/15 11:55:38 afb Exp $
//-----------------------------------------------------------------------------

#include "stdafx.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxPen* wxPen_ctorByName(wxc_string name, int width, int style)
{
	return new wxPen(wxstr(name), width, (wxPenStyle) style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxPen* wxPen_ctor(const wxColour* col, int width, int style)
{
	return new wxPen(*col, width, (wxPenStyle) style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxPen_SetWidth(wxPen *self, int width) 
{
    self->SetWidth(width);
}

extern "C" WXEXPORT
int wxPen_GetWidth(wxPen *self)
{
	return self->GetWidth();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxColour* wxPen_GetColour(wxPen* self)
{
    return new wxColour(self->GetColour());
}

extern "C" WXEXPORT
void wxPen_SetColour(wxPen* self, wxColour* col)
{
    self->SetColour(*col);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxPen_GetCap(wxPen* self)
{
	return self->GetCap();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxPen_GetJoin(wxPen* self)
{
	return self->GetJoin();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxPen_GetStyle(wxPen* self)
{
	return self->GetStyle();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxPen_Ok(wxPen* self)
{
	return self->Ok()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxPen_SetCap(wxPen* self, int capStyle)
{
	self->SetCap((wxPenCap) capStyle);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxPen_SetJoin(wxPen* self, int join_style)
{
	self->SetJoin((wxPenJoin) join_style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxPen_SetStyle(wxPen* self, int style)
{
	self->SetStyle((wxPenStyle) style);
}

