//-----------------------------------------------------------------------------
// wxD - tooltip.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - tooltip.cxx
//
// The wxToolTip proxy interface
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: tooltip.cpp,v 1.11 2007/01/28 23:06:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/tooltip.h>
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolTip_Enable(wxc_bool flag)
{
	wxToolTip::Enable(flag);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolTip_SetDelay(long msecs)
{
	wxToolTip::SetDelay(msecs);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolTip* wxToolTip_ctor(wxc_string tip)
{
	return new wxToolTip(wxstr(tip));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolTip_SetTip(wxToolTip* self, wxc_string tip)
{
	self->SetTip(wxstr(tip));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxToolTip_GetTip(wxToolTip* self)
{
	return new wxString(self->GetTip());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxWindow* wxToolTip_GetWindow(wxToolTip* self)
{
	return self->GetWindow();
}

//-----------------------------------------------------------------------------


extern "C" WXEXPORT
void wxToolTip_SetWindow(wxToolTip* self,wxWindow* win)
{
#ifndef __WXGTK__
	return self->SetWindow(win);
#endif
}

//-----------------------------------------------------------------------------
