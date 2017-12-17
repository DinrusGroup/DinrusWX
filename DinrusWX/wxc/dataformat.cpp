//-----------------------------------------------------------------------------
// wxD - dataformat.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - dataformat.cxx
// 
// wxDataFormat proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: dataformat.cpp,v 1.11 2007/01/28 23:06:38 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/dataobj.h>
*/
#include "stdafx.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDataFormat* wxDataFormat_ctor()
{
    return new wxDataFormat();
}

extern "C" WXEXPORT
void wxDataFormat_dtor(wxDataFormat* self)
{
	if (self != NULL) 
		delete self;
}

extern "C" WXEXPORT
wxDataFormat* wxDataFormat_ctorByType(wxDataFormatId type)
{
    return new wxDataFormat(type);
}

extern "C" WXEXPORT
wxDataFormat* wxDataFormat_ctorById(wxc_string id)
{
    return new wxDataFormat(wxstr(id).c_str());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxDataFormat_GetId(wxDataFormat* self)
{
    return new wxString(self->GetId());
}

extern "C" WXEXPORT
void wxDataFormat_SetId(wxDataFormat* self, wxc_string id)
{
    self->SetId(wxstr(id).c_str());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDataFormatId wxDataFormat_GetType(wxDataFormat* self)
{
    return (wxDataFormatId)self->GetType();
}

extern "C" WXEXPORT
void wxDataFormat_SetType(wxDataFormat* self, wxDataFormatId type)
{
    self->SetType(type);
}

