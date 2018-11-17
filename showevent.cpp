//-----------------------------------------------------------------------------
// wxD - showevent.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - showevent.cxx
// 
// The wxShowEvent proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: showevent.cpp,v 1.10 2007/01/15 11:55:38 afb Exp $
//-----------------------------------------------------------------------------
/*#include <wx/wx.h>
#include "common.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxShowEvent* wxShowEvent_ctor(int winid, wxc_bool show)
{
    return new wxShowEvent(winid,show);
}

extern "C" WXEXPORT
wxc_bool wxShowEvent_GetShow(wxShowEvent* self)
{
	return self->GetShow()?1:0;
}

extern "C" WXEXPORT
void wxShowEvent_SetShow(wxShowEvent* self, wxc_bool show)
{
	self->SetShow(show);
}
