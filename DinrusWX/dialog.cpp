//-----------------------------------------------------------------------------
// wxD - dialog.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - dialog.cxx
//
// The wxDialog proxy interface
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: dialog.cpp,v 1.11 2007/01/28 23:06:38 afb Exp $
//-----------------------------------------------------------------------------

#include "stdafx.h"


//-----------------------------------------------------------------------------

class _Dialog : public wxDialog
{
public:
    DECLARE_OBJECTDELETED(_Dialog)
    
#include "panel.inc"
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDialog* wxDialog_ctor()
{
	return new _Dialog();
}

extern "C" WXEXPORT
void wxDialog_dtor(_Dialog* self)
{
	delete self;
}

extern "C" WXEXPORT
wxc_bool wxDialog_Create(_Dialog* self, wxWindow* parent, int id,
				     wxc_string title, const wxPoint* pos, const wxSize* size,
					 long style, wxc_string name)
{
	if (pos == NULL)
		pos = &wxDefaultPosition;

	if (size == NULL)
		size = &wxDefaultSize;

	if (name.data==NULL)
		name = wxc_string("dialogBox");

	return self->Create(parent, id, wxstr(title), *pos,
					    *size, style, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDialog_SetReturnCode(_Dialog* self, int returnCode)
{
	self->SetReturnCode(returnCode);
}

extern "C" WXEXPORT
int wxDialog_GetReturnCode(_Dialog* self)
{
	return self->GetReturnCode();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxDialog_GetTitle(_Dialog* self)
{
	return new wxString(self->GetTitle());
}

extern "C" WXEXPORT
void wxDialog_SetTitle(_Dialog* self, wxc_string title)
{
	self->SetTitle(wxstr(title));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDialog_EndModal(_Dialog* self, int retCode)
{
	self->EndModal(retCode);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxDialog_IsModal(_Dialog* self)
{
	return self->IsModal()?1:0;
}
  /*  
extern "C" WXEXPORT
void wxDialog_SetModal(_Dialog* self, wxc_bool modal)
{
	self->SetModal(modal);
}
*/
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDialog_SetIcon(_Dialog* self, wxIcon* icon)
{
	self->SetIcon(*icon);
}

extern "C" WXEXPORT
void wxDialog_SetIcons(_Dialog* self, wxIconBundle* icons)
{
	self->SetIcons(*icons);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxDialog_ShowModal(_Dialog* self)
{
	return self->ShowModal();
}

//-----------------------------------------------------------------------------
