//-----------------------------------------------------------------------------
// wxD - progdlg.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - progdlg.cxx
//
// The wxProgressDialog proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: progdlg.cpp,v 1.10 2007/01/15 11:55:38 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/progdlg.h>
#include "local_events.h"
*/
#include "stdafx.h"


class _ProgressDialog : public wxProgressDialog
{
    public:
        _ProgressDialog(const wxString title, const wxString& message,
			int maximum, wxWindow* parent, int style)
            : wxProgressDialog(title, message, maximum, parent, style)
        {
        }

        DECLARE_OBJECTDELETED(_ProgressDialog)
};


//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxProgressDialog* wxProgressDialog_ctor(wxc_string title, wxc_string message,
        int maximum, wxWindow* parent, int style)
{
    return new _ProgressDialog(wxstr(title), wxstr(message),
            maximum, parent, style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxProgressDialog_dtor(wxProgressDialog* self)
{
    delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxProgressDialog_Update(wxProgressDialog* self, int value, wxc_string newmsg)
{
    return self->Update(value, wxstr(newmsg))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxProgressDialog_Resume(wxProgressDialog* self)
{
    self->Resume();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxProgressDialog_Show(wxProgressDialog* self, wxc_bool show)
{
	return self->Show(show)?1:0;
}



