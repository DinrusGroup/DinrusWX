//-----------------------------------------------------------------------------
// wxD - cursor.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - cursor.cxx
//
// The wxCursor proxy interface.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: cursor.cpp,v 1.10 2007/01/15 11:55:35 afb Exp $
//-----------------------------------------------------------------------------

#include "stdafx.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxCursor* wxCursor_ctorImage(wxImage* image)

{
	return new wxCursor(*image);
}

extern "C" WXEXPORT
wxCursor* wxCursor_ctorCopy(wxCursor* cursor)
{
	return new wxCursor(*cursor);
}

extern "C" WXEXPORT
wxCursor* wxCursor_ctor(const wxString& name,
             wxBitmapType type,
             int hotSpotX = 0, int hotSpotY = 0)
			 
{
	if(type == NULL) type = wxCURSOR_DEFAULT_TYPE;
	return new wxCursor(name, type, hotSpotX, hotSpotY);
}

#if WXWIN_COMPATIBILITY_2_8
extern "C" WXEXPORT
wxCursor* wxCursor_ctorById(int id) { InitFromStock((wxStockCursor)id); }
#else
extern "C" WXEXPORT
wxCursor* wxCursor_ctorById(wxStockCursor id)
{
	return new wxCursor(id);
}
#endif

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxPoint wxCursor_GetHotSpot(wxCursor* self)
{
	return self->GetHotSpot();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxCursor_Ok(wxCursor* self)
{
	return self->Ok()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxCursor_SetCursor(const wxCursor* cursor)
{
	wxSetCursor(*cursor);
}
