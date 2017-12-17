//-----------------------------------------------------------------------------
// wxD - textdialog.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - textdialog.cxx
//
// The wxTextEntryDialog proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: textdialog.cpp,v 1.11 2007/01/28 23:06:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/textdlg.h>
#include "local_events.h"
*/
#include "stdafx.h"

class _TextEntryDialog : public wxTextEntryDialog
{
    public:
        _TextEntryDialog(wxWindow* parent, const wxString message,
                const wxString& caption, const wxString& value,
                long style, const wxPoint& pos)
            : wxTextEntryDialog(parent, message, caption, value, style, pos)
        {
        }

        DECLARE_OBJECTDELETED(_TextEntryDialog)
};


//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxTextEntryDialog* wxTextEntryDialog_ctor(wxWindow* parent, wxc_string message,
        wxc_string caption, wxc_string value, int style, wxPoint* pos)
{
    return new _TextEntryDialog(parent, wxstr(message),
            wxstr(caption),
            wxstr(value), style, *pos);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxTextEntryDialog_dtor(wxTextEntryDialog* self)
{
    delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxTextEntryDialog_ShowModal(wxTextEntryDialog* self)
{
    return self->ShowModal();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxTextEntryDialog_SetValue(wxTextEntryDialog* self, wxc_string val)
{
    self->SetValue(wxstr(val));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxTextEntryDialog_GetValue(wxTextEntryDialog* self)
{
    return new wxString(self->GetValue());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxGetPasswordFromUser_func(wxc_string message, wxc_string caption,
                                     wxc_string defaultValue, wxWindow* parent)
{
    return new wxString(wxGetPasswordFromUser(wxstr(message),
                        wxstr(caption),
                        wxstr(defaultValue),
                        parent));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxGetTextFromUser_func(wxc_string message, wxc_string caption,
                                 wxc_string defaultValue, wxWindow* parent,
                                 int x, int y, wxc_bool centre)
{
    return new wxString(wxGetTextFromUser(wxstr(message),
                        wxstr(caption),
                        wxstr(defaultValue),
                        parent, x, y, centre));
}



