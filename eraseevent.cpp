//-----------------------------------------------------------------------------
// wxD - eraseevent.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - eraseevent.cxx
// 
// The wxEraseEvent proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: eraseevent.cpp,v 1.9 2006/11/17 15:21:03 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
*/
#include "stdafx.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxEraseEvent* wxEraseEvent_ctor(int Id, wxDC *dc)
{
    return new wxEraseEvent(Id,dc);
}

extern "C" WXEXPORT
wxEraseEvent* wxEraseEvent_ctor2(wxEventType type)
{
    return new wxEraseEvent(type);
}

extern "C" WXEXPORT
wxDC* wxEraseEvent_GetDC(wxEraseEvent* self)
{
	return self->GetDC();
}
