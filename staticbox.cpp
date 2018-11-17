//-----------------------------------------------------------------------------
// wxD - staticbox.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - staticbox.cxx
//
// The wxStaticBox proxy interface
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: staticbox.cpp,v 1.10 2007/01/15 11:55:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/statbox.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

class _StaticBox : public wxStaticBox
{
public:
    DECLARE_OBJECTDELETED(_StaticBox)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxStaticBox* wxStaticBox_ctor()
{
    return new _StaticBox();
}

extern "C" WXEXPORT
void wxStaticBox_dtor(wxStaticBox* self)
{
    delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxStaticBox_Create(wxStaticBox* self, wxWindow* parent, wxWindowID id,
                        wxc_string label,
                        const wxPoint* pos, const wxSize* size,
                        long style, wxc_string name)
{
    if (pos == NULL)
        pos = &wxDefaultPosition;

    if (size == NULL)
        size = &wxDefaultSize;

    if (name.data==NULL)
        name = wxc_string("staticBox");

    return self->Create(parent, id, wxstr(label),
                        *pos, *size, style, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------
