//-----------------------------------------------------------------------------
// wxD - toolbar.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - toolbar.cxx
// 
// The wxToolBar proxy interface
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: toolbar.cpp,v 1.11 2007/01/28 23:06:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/toolbar.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBarToolBase_ctor(wxToolBar *tbar, int toolid, wxc_string label, const wxBitmap* bmpNormal, const wxBitmap* bmpDisabled, wxItemKind kind, wxObject *clientData, wxc_string shortHelpString, wxc_string longHelpString)
{
	if (bmpNormal == NULL)
		bmpNormal = &wxNullBitmap;

	if (bmpDisabled == NULL)
		bmpDisabled = &wxNullBitmap;

	return new wxToolBarToolBase(tbar, toolid, wxstr(label), *bmpNormal, *bmpDisabled, kind, clientData, wxstr(shortHelpString), wxstr(longHelpString));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBarToolBase_ctorCtrl(wxToolBar *tbar, wxControl *control)
{
	return new wxToolBarToolBase(tbar, control);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxToolBarToolBase_GetId(wxToolBarToolBase* self)
{
	return self->GetId();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxControl* wxToolBarToolBase_GetControl(wxToolBarToolBase* self)
{
	return self->GetControl();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBar* wxToolBarToolBase_GetToolBar(wxToolBarToolBase* self)
{
	return (wxToolBar*)self->GetToolBar();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_IsButton(wxToolBarToolBase* self)
{
	return self->IsButton()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_IsControl(wxToolBarToolBase* self)
{
	return self->IsControl()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_IsSeparator(wxToolBarToolBase* self)
{
	return self->IsSeparator()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxToolBarToolBase_GetStyle(wxToolBarToolBase* self)
{
	return self->GetStyle();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxItemKind wxToolBarToolBase_GetKind(wxToolBarToolBase* self)
{
	return self->GetKind();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_IsEnabled(wxToolBarToolBase* self)
{
	return self->IsEnabled()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_IsToggled(wxToolBarToolBase* self)
{
	return self->IsToggled()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_CanBeToggled(wxToolBarToolBase* self)
{
	return self->CanBeToggled()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxToolBarToolBase_GetLabel(wxToolBarToolBase* self)
{
	return new wxString(self->GetLabel());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxToolBarToolBase_GetShortHelp(wxToolBarToolBase* self)
{
	return new wxString(self->GetShortHelp());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxToolBarToolBase_GetLongHelp(wxToolBarToolBase* self)
{
	return new wxString(self->GetLongHelp());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxObject* wxToolBarToolBase_GetClientData(wxToolBarToolBase* self)
{
	return self->GetClientData();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_Enable(wxToolBarToolBase* self, wxc_bool enable)
{
	return self->Enable(enable)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_Toggle(wxToolBarToolBase* self, wxc_bool toggle)
{
	return self->Toggle(toggle)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_SetToggle(wxToolBarToolBase* self, wxc_bool toggle)
{
	return self->SetToggle(toggle)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_SetShortHelp(wxToolBarToolBase* self, wxc_string help)
{
	return self->SetShortHelp(wxstr(help))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBarToolBase_SetLongHelp(wxToolBarToolBase* self, wxc_string help)
{
	return self->SetLongHelp(wxstr(help))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBarToolBase_SetNormalBitmap(wxToolBarToolBase* self, const wxBitmap* bmp)
{
	self->SetNormalBitmap(*bmp);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBarToolBase_SetDisabledBitmap(wxToolBarToolBase* self, const wxBitmap* bmp)
{
	self->SetDisabledBitmap(*bmp);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBarToolBase_SetLabel(wxToolBarToolBase* self, wxc_string label)
{
	self->SetLabel(wxstr(label));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBarToolBase_SetClientData(wxToolBarToolBase* self, wxObject *clientData)
{
	self->SetClientData(clientData);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBarToolBase_Detach(wxToolBarToolBase* self)
{
	self->Detach();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBarToolBase_Attach(wxToolBarToolBase* self, wxToolBar *tbar)
{
	self->Attach(tbar);
}

//-----------------------------------------------------------------------------

class _ToolBar : public wxToolBar
{
public:
    _ToolBar(wxWindow* parent, wxWindowID id, const wxPoint& pos, const wxSize& size, int style)
        : wxToolBar(parent, id, pos, size, style) { }

    DECLARE_OBJECTDELETED(_ToolBar)
};

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBar* wxToolBar_ctor(wxWindow* parent, wxWindowID id, const wxPoint* pos, const wxSize* size, int style)
{
    if (pos == NULL)
        pos = &wxDefaultPosition;

    if (size == NULL)
        size = &wxDefaultSize;

	return new _ToolBar(parent, id, *pos, *size, style);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddTool1(wxToolBar* self, int toolid, wxc_string label, const wxBitmap* bitmap, const wxBitmap* bmpDisabled, wxItemKind kind, wxc_string shortHelp, wxc_string longHelp, wxObject *data)
{
	return self->AddTool(toolid, wxstr(label), *bitmap, *bmpDisabled, kind, wxstr(shortHelp), wxstr(longHelp), data);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddTool2(wxToolBar* self, int toolid, wxc_string label, const wxBitmap* bitmap, wxc_string shortHelp, wxItemKind kind)
{
	return self->AddTool(toolid, wxstr(label), *bitmap, wxstr(shortHelp), kind);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddCheckTool(wxToolBar* self, int toolid, wxc_string label, const wxBitmap* bitmap, const wxBitmap* bmpDisabled, wxc_string shortHelp, wxc_string longHelp, wxObject *data)
{
	if (bmpDisabled == NULL)
		bmpDisabled = &wxNullBitmap;

	return self->AddCheckTool(toolid, wxstr(label), *bitmap, *bmpDisabled, wxstr(shortHelp), wxstr(longHelp), data);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddRadioTool(wxToolBar* self, int toolid, wxc_string label, const wxBitmap* bitmap, const wxBitmap* bmpDisabled, wxc_string shortHelp, wxc_string longHelp, wxObject *data)
{
	if (bmpDisabled == NULL)
		bmpDisabled = &wxNullBitmap;

	return self->AddRadioTool(toolid, wxstr(label), *bitmap, *bmpDisabled, wxstr(shortHelp), wxstr(longHelp), data);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddControl(wxToolBar* self, wxControl *control)
{
	return self->AddControl(control);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_InsertControl(wxToolBar* self, size_t pos, wxControl *control)
{
	return self->InsertControl(pos, control);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxControl* wxToolBar_FindControl(wxToolBar* self, int toolid)
{
	return self->FindControl(toolid);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddSeparator(wxToolBar* self)
{
	return self->AddSeparator();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_InsertSeparator(wxToolBar* self, size_t pos)
{
	return self->InsertSeparator(pos);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_RemoveTool(wxToolBar* self, int toolid)
{
	return self->RemoveTool(toolid);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_DeleteToolByPos(wxToolBar* self, size_t pos)
{
	return self->DeleteToolByPos(pos)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_DeleteTool(wxToolBar* self, int toolid)
{
	return self->DeleteTool(toolid)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_ClearTools(wxToolBar* self)
{
	self->ClearTools();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_Realize(wxToolBar* self)
{
	return self->Realize()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_EnableTool(wxToolBar* self, int toolid, wxc_bool enable)
{
	self->EnableTool(toolid, enable);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_ToggleTool(wxToolBar* self, int toolid, wxc_bool toggle)
{
	self->ToggleTool(toolid, toggle);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxObject* wxToolBar_GetToolClientData(wxToolBar* self, int toolid)
{
	return self->GetToolClientData(toolid);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetToolClientData(wxToolBar* self, int toolid, wxObject *clientData)
{
	self->SetToolClientData(toolid, clientData);
}

//-----------------------------------------------------------------------------

#if 0
extern "C" WXEXPORT
int wxToolBar_GetToolPos(wxToolBar* self, int id)
{
	return self->GetToolPos(id);
}
#endif

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_GetToolState(wxToolBar* self, int toolid)
{
	return self->GetToolState(toolid)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_GetToolEnabled(wxToolBar* self, int toolid)
{
	return self->GetToolEnabled(toolid)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetToolShortHelp(wxToolBar* self, int toolid, wxc_string helpString)
{
	self->SetToolShortHelp(toolid, wxstr(helpString));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxToolBar_GetToolShortHelp(wxToolBar* self, int toolid)
{
	return new wxString(self->GetToolShortHelp(toolid).c_str());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetToolLongHelp(wxToolBar* self, int toolid, wxc_string helpString)
{
	self->SetToolLongHelp(toolid, wxstr(helpString));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxToolBar_GetToolLongHelp(wxToolBar* self, int toolid)
{
	return new wxString(self->GetToolLongHelp(toolid).c_str());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetMargins(wxToolBar* self, int x, int y)
{
	self->SetMargins(x, y);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetToolPacking(wxToolBar* self, int packing)
{
	self->SetToolPacking(packing);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetToolSeparation(wxToolBar* self, int separation)
{
	self->SetToolSeparation(separation);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_GetToolMargins(wxToolBar* self, wxSize* size)
{
	*size = self->GetToolMargins();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxToolBar_GetToolPacking(wxToolBar* self)
{
	return self->GetToolPacking();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxToolBar_GetToolSeparation(wxToolBar* self)
{
	return self->GetToolSeparation();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetRows(wxToolBar* self, int nRows)
{
	self->SetRows(nRows);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetMaxRowsCols(wxToolBar* self, int rows, int cols)
{
	self->SetMaxRowsCols(rows, cols);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxToolBar_GetMaxRows(wxToolBar* self)
{
	return self->GetMaxRows();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxToolBar_GetMaxCols(wxToolBar* self)
{
	return self->GetMaxCols();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_SetToolBitmapSize(wxToolBar* self, const wxSize* size)
{
	self->SetToolBitmapSize(*size);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_GetToolBitmapSize(wxToolBar* self, wxSize* size)
{
	*size = self->GetToolBitmapSize();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_GetToolSize(wxToolBar* self, wxSize* size)
{
	*size = self->GetToolSize();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_FindToolForPosition(wxToolBar* self, wxCoord x, wxCoord y)
{
	return self->FindToolForPosition(x, y);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_IsVertical(wxToolBar* self)
{
	return self->IsVertical()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddTool3(wxToolBar* self, int toolid, const wxBitmap* bitmap, const wxBitmap* bmpDisabled, wxc_bool toggle, wxObject *clientData, wxc_string shortHelpString, wxc_string longHelpString)
{
	return self->AddTool(toolid, *bitmap, *bmpDisabled, toggle, clientData, wxstr(shortHelpString), wxstr(longHelpString));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddTool4(wxToolBar* self, int toolid, const wxBitmap* bitmap, wxc_string shortHelpString, wxc_string longHelpString)
{
	return self->AddTool(toolid, *bitmap, wxstr(shortHelpString), wxstr(longHelpString));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_AddTool5(wxToolBar* self, int toolid, const wxBitmap* bitmap, const wxBitmap* bmpDisabled, wxc_bool toggle, wxCoord xPos, wxCoord yPos, wxObject *clientData, wxc_string shortHelp, wxc_string longHelp)
{
	return self->AddTool(toolid, *bitmap, *bmpDisabled, toggle, xPos, yPos, clientData, wxstr(shortHelp), wxstr(longHelp));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBarToolBase* wxToolBar_InsertTool(wxToolBar* self, size_t pos, int toolid, const wxBitmap* bitmap, const wxBitmap* bmpDisabled, wxc_bool toggle, wxObject *clientData, wxc_string shortHelp, wxc_string longHelp)
{
	if (bmpDisabled == NULL)
		bmpDisabled = &wxNullBitmap;

	return self->InsertTool(pos, toolid, *bitmap, *bmpDisabled, toggle, clientData, wxstr(shortHelp), wxstr(longHelp));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxToolBar_GetMargins(wxToolBar* self, wxSize* size)
{
	*size = self->GetMargins();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
size_t wxToolBar_GetToolsCount(wxToolBar* self)
{
	return self->GetToolsCount();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxToolBar_AcceptsFocus(wxToolBar* self)
{
	return self->AcceptsFocus()?1:0;
}

