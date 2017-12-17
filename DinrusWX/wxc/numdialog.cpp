//-----------------------------------------------------------------------------
// wxD - numdialog.cxx
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - numdialog.cxx
//
// The wxNumberEntryDialog proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: numdialog.cpp,v 1.9 2007/01/15 11:55:37 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/numdlg.h>
#include "local_events.h"
*/
#include "stdafx.h"

class _NumberEntryDialog : public wxNumberEntryDialog
{
    public:
        _NumberEntryDialog(wxWindow* parent, const wxString message,
                const wxString& prompt, const wxString& caption,
                const long value, const long min,const long max,
                const wxPoint& pos)
            : wxNumberEntryDialog(parent, message, prompt, caption, value, min, max , pos)
        {
        }

        DECLARE_OBJECTDELETED(_NumberEntryDialog)
};


//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxNumberEntryDialog* wxNumberEntryDialog_ctor(wxWindow* parent, wxc_string message,
        wxc_string prompt, wxc_string caption, long value, long min, long max, wxPoint* pos)
{
    return new _NumberEntryDialog(parent, wxstr(message),
            wxstr(prompt),
            wxstr(caption),
            value, min, max, *pos);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxNumberEntryDialog_dtor(wxNumberEntryDialog* self)
{
    delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxNumberEntryDialog_ShowModal(wxNumberEntryDialog* self)
{
    return self->ShowModal();
}

//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
long wxNumberEntryDialog_GetValue(wxNumberEntryDialog* self)
{
    return self->GetValue();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
long wxGetNumberFromUser_func(wxc_string message, wxc_string prompt, wxc_string caption,
                                     long value, long min, long max, wxWindow* parent, wxPoint* pos)
{
    return wxGetNumberFromUser(wxstr(message),
                        wxstr(prompt),
                        wxstr(caption),
                        value, min, max, parent, *pos);
}

