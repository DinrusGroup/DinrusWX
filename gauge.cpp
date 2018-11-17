//-----------------------------------------------------------------------------
// wxD - gauge.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - gauge.cxx
//
// The wxGauge proxy interface
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: gauge.cpp,v 1.10 2007/01/15 11:55:36 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/gauge.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

class _Gauge : public wxGauge
{
public:
    DECLARE_OBJECTDELETED(_Gauge)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxGauge* wxGauge_ctor()
{
	return new _Gauge();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGauge_dtor(wxGauge* self)
{
	delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxGauge_Create(wxGauge* self, wxWindow *parent, wxWindowID id, int range, const wxPoint* pos, const wxSize* size, long style, const wxValidator* validator, wxc_string name)
{
	if (pos == NULL)
		pos = &wxDefaultPosition;

	if (size == NULL)
		size = &wxDefaultSize;

	if (validator == NULL)
		validator = &wxDefaultValidator;

	if (name.data==NULL)
		name = wxc_string("gauge");

	return self->Create(parent, id, range, *pos, *size, style, *validator, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGauge_SetRange(wxGauge* self, int range)
{
	self->SetRange(range);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxGauge_GetRange(wxGauge* self)
{
	return self->GetRange();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGauge_SetValue(wxGauge* self, int pos)
{
	self->SetValue(pos);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxGauge_GetValue(wxGauge* self)
{
	return self->GetValue();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGauge_SetShadowWidth(wxGauge* self, int w)
{
	self->SetShadowWidth(w);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxGauge_GetShadowWidth(wxGauge* self)
{
	return self->GetShadowWidth();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGauge_SetBezelFace(wxGauge* self, int w)
{
	self->SetBezelFace(w);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxGauge_GetBezelFace(wxGauge* self)
{
	return self->GetBezelFace();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxGauge_AcceptsFocus(wxGauge* self)
{
	return self->AcceptsFocus()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxGauge_IsVertical(wxGauge* self)
{
	return self->IsVertical()?1:0;
}
