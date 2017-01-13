//-----------------------------------------------------------------------------
// wxD - button.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - button.cxx
//
// The wxButton proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: button.cpp,v 1.10 2007/01/15 11:55:34 afb Exp $
//-----------------------------------------------------------------------------

#include "stdafx.h"

//-----------------------------------------------------------------------------

class _Button : public wxButton
{
//public:
  //  DECLARE_OBJECTDELETED(_Button)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxButton* wxButton_ctor()
{
	return new _Button();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxButton_Create(wxButton *self, wxWindow* parent, wxWindowID id, wxc_string label, const wxPoint* pos, const wxSize* size, long style, const wxValidator* validator, wxc_string name)
{
	if (pos == NULL)
		pos = &wxDefaultPosition;

	if (size == NULL)
		size = &wxDefaultSize;

	if (validator == NULL)
		validator = &wxDefaultValidator;

	if (name.data==NULL)
		name = wxc_string("кнопка");
	
	if(style == NULL) style = 0;

	return self->Create(parent, id, wxstr(label), *pos, *size, style, *validator, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetDefault(wxButton* self)
{
	self->SetDefault();
}

//-----------------------------------------------------------------------------
extern "C" WXEXPORT
void wxButton_Command(wxButton* self,wxCommandEvent& event)
{
self->Command(event);
	
}
//-----------------------------------------------------------------------------
extern "C" WXEXPORT
void wxButton_MSWWindowProc(wxButton* self,WXUINT nMsg, WXWPARAM wParam, WXLPARAM lParam)
{
self->MSWWindowProc(nMsg, wParam, lParam);
	
}

//-----------------------------------------------------------------------------
extern "C" WXEXPORT
bool wxButton_MSWCommand(wxButton* self,WXUINT param, WXWORD id)
{
return self->MSWCommand(param, id);
	
}
//-----------------------------------------------------------------------------
extern "C" WXEXPORT
WXDWORD wxButton_MSWGetStyle(wxButton* self, long style, WXDWORD *exstyle)
{
return self->MSWGetStyle(style, exstyle);
	
}
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_GetDefaultSize(wxSize* size)
{
	*size = wxButton::GetDefaultSize();
}

//-----------------------------------------------------------------------------
/*
extern "C" WXEXPORT
void wxButton_SetImageLabel(wxButton* self, wxBitmap* bitmap)
{
	self->SetImageLabel(*bitmap);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetImageMargins(wxButton* self, wxCoord x, wxCoord y)
{
	self->SetImageMargins(x, y);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxButton_SetLabel(wxButton* self, wxc_string label)
{
	self->SetLabel(wxstr(label));
}
*/

/*
extern "C" WXEXPORT
void wxButton_SendClickEvent(wxButton* self)
{
	self->SendClickEvent();
}

//-----------------------------------------------------------------------------
extern "C" WXEXPORT
void wxButton_SetTmpDefault(wxButton* self)
{
self->SetTmpDefault();	
}

//-----------------------------------------------------------------------------
extern "C" WXEXPORT
void wxButton_UnsetTmpDefault(wxButton* self)
{
self->UnsetTmpDefault();	
}
//-----------------------------------------------------------------------------
extern "C" WXEXPORT
bool wxButton_DoGetAuthNeeded(wxButton* self)
{
return self->DoGetAuthNeeded();
	
}

//-----------------------------------------------------------------------------
extern "C" WXEXPORT
void wxButton_DoSetAuthNeeded(wxButton* self, bool show)
{
 self->DoSetAuthNeeded(show);
	
}

//-----------------------------------------------------------------------------
extern "C" WXEXPORT
void wxButton_OnCharHook(wxButton* self,wxKeyEvent& event)
{
 self->OnCharHook(event);
	
}

//-----------------------------------------------------------------------------
*/