//-----------------------------------------------------------------------------
// wxD - querynewpaletteevent.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - querynewpaletteevent.cxx
// 
// The wxQueryNewPaletteEvent proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: querynewpaletteevent.cpp,v 1.10 2007/01/15 11:55:38 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxQueryNewPaletteEvent* wxQueryNewPaletteEvent_ctor(wxWindowID winid)
{
    return new wxQueryNewPaletteEvent(winid);
}

extern "C" WXEXPORT
wxQueryNewPaletteEvent* wxQueryNewPaletteEvent_ctor2(wxEventType type)
{
    return new wxQueryNewPaletteEvent(type);
}

extern "C" WXEXPORT
wxc_bool wxQueryNewPaletteEvent_GetPaletteRealized(wxQueryNewPaletteEvent* self)
{
	return self->GetPaletteRealized()?1:0;
}

extern "C" WXEXPORT
void wxQueryNewPaletteEvent_SetPaletteRealized(wxQueryNewPaletteEvent* self, wxc_bool realized)
{
	self->SetPaletteRealized(realized);
}
