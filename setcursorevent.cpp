//-----------------------------------------------------------------------------
// wxD - setcursorevent.cxx
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - setcursorevent.cxx
// 
// The wxSetCursorEvent proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: setcursorevent.cpp,v 1.10 2007/01/15 11:55:38 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxSetCursorEvent* wxSetCursorEvent_ctor(wxCoord x, wxCoord y)
{
    return new wxSetCursorEvent(x,y);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxSetCursorEvent_GetX(wxSetCursorEvent* self)
{
	return self->GetX();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxSetCursorEvent_GetY(wxSetCursorEvent* self)
{
	return self->GetY();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxSetCursorEvent_SetCursor(wxSetCursorEvent* self, wxCursor* cursor)
{
	self->SetCursor(*cursor);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxCursor* wxSetCursorEvent_GetCursor(wxSetCursorEvent* self)
{
	return new wxCursor(self->GetCursor());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxSetCursorEvent_HasCursor(wxSetCursorEvent* self)
{
	return self->HasCursor()?1:0;
}

