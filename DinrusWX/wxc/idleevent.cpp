//-----------------------------------------------------------------------------
// wxD - idleevent.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - idleevent.cxx
// 
// The wxIdleEvent proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: idleevent.cpp,v 1.10 2007/01/15 11:55:37 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxIdleEvent* wxIdleEvent_ctor()
{
    return new wxIdleEvent();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxIdleEvent_RequestMore(wxIdleEvent* self, wxc_bool needMore)
{
	self->RequestMore(needMore);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxIdleEvent_MoreRequested(wxIdleEvent* self)
{
	return self->MoreRequested()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxIdleEvent_SetMode(wxIdleMode mode)
{
	wxIdleEvent::SetMode(mode);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxIdleMode wxIdleEvent_GetMode()
{
	return wxIdleEvent::GetMode();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxIdleEvent_CanSend(wxWindow* win)
{
	return wxIdleEvent::CanSend(win)?1:0;
}


