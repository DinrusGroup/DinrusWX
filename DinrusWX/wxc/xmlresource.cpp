//-----------------------------------------------------------------------------
// wxD - xmlresource.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - xmlresource.cxx
//
// The wxXmlResource proxy interface.
//
// Written by Achim Breunig (achim.breunig@web.de)
// (C) 2003 Achim Breunig
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: xmlresource.cpp,v 1.11 2007/01/28 23:06:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/xrc/xmlres.h>
#include <wx/fontenum.h>
#include <wx/fs_mem.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------
// C stubs for class methods

typedef wxObject* (CALLBACK* XmlSubclassCreate) (wxString*);

class XmlSubclassFactoryCS : public wxXmlSubclassFactory
{
public:
    XmlSubclassFactoryCS() { }

    wxObject *Create(const wxString& className)
        { return m_create(new wxString(className)); }

    void RegisterVirtual(XmlSubclassCreate create)
        { m_create = create; }

private:
    XmlSubclassCreate m_create;
};

extern "C" WXEXPORT
void wxXmlSubclassFactory_ctor(XmlSubclassCreate create)
{
    XmlSubclassFactoryCS *s_factory = new XmlSubclassFactoryCS();
    s_factory->RegisterVirtual(create);
    wxXmlResource::AddSubclassFactory(s_factory);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxXmlResource* wxXmlResource_ctorByFilemask(wxc_string filemask, int flags = wxXRC_USE_LOCALE)
{
	return new wxXmlResource(wxstr(filemask),flags);
}

extern "C" WXEXPORT
wxXmlResource* wxXmlResource_ctor(int flags)
{
	return new wxXmlResource(flags);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxXmlResource_InitAllHandlers(wxXmlResource* self)
{
	self->InitAllHandlers();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxXmlResource_Load(wxXmlResource* self, wxc_string filemask)
{
	return self->Load(wxstr(filemask))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxXmlResource_LoadFromByteArray(wxXmlResource* self, wxc_string filemask, char* data, size_t length)
{
	wxFileSystem::AddHandler(new wxMemoryFSHandler());
	wxMemoryFSHandler::AddFile(wxstr(filemask), data, length);

	wxString mem_name = wxString(wxT("memory:")) + wxstr(filemask) ;

	return self->Load(mem_name)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDialog* wxXmlResource_LoadDialog(wxXmlResource* self, wxWindow* parent, wxc_string name)
{
	return self->LoadDialog(parent, wxstr(name));
}

extern "C" WXEXPORT
wxc_bool wxXmlResource_LoadDialogDlg(wxXmlResource* self, wxDialog* dlg, wxWindow* parent, wxc_string name)
{
	return self->LoadDialog(dlg, parent, wxstr(name))?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxXmlResource_GetXRCID(wxc_string str_id)
{
	return wxXmlResource::GetXRCID(wxstr(str_id));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
long wxXmlResource_GetVersion(wxXmlResource* self)
{
	return self->GetVersion();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxXmlResource_LoadFrameWithFrame(wxXmlResource* self, wxFrame* frame, wxWindow* parent, wxc_string name)
{
	return self->LoadFrame(frame, parent, wxstr(name))?1:0;
}

extern "C" WXEXPORT
wxFrame* wxXmlResource_LoadFrame(wxXmlResource* self, wxWindow* parent, wxc_string name)
{
	return self->LoadFrame(parent, wxstr(name));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxBitmap* wxXmlResource_LoadBitmap(wxXmlResource* self, wxc_string name)
{
	return new wxBitmap(self->LoadBitmap(wxstr(name)));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxIcon* wxXmlResource_LoadIcon(wxXmlResource* self, wxc_string name)
{
	return new wxIcon(self->LoadIcon(wxstr(name)));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxMenu* wxXmlResource_LoadMenu(wxXmlResource* self, wxc_string name)
{
	return self->LoadMenu(wxstr(name));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxMenuBar* wxXmlResource_LoadMenuBarWithParent(wxXmlResource* self, wxWindow* parent, wxc_string name)
{
	return self->LoadMenuBar(parent,wxstr(name));
}

extern "C" WXEXPORT
wxMenuBar* wxXmlResource_LoadMenuBar(wxXmlResource* self, wxc_string name)
{
	return self->LoadMenuBar(wxstr(name));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxXmlResource_LoadPanelWithPanel(wxXmlResource* self, wxPanel* panel, wxWindow* parent, wxc_string name)
{
	return self->LoadPanel(panel, parent, wxstr(name))?1:0;
}

extern "C" WXEXPORT
wxPanel* wxXmlResource_LoadPanel(wxXmlResource* self, wxWindow* parent, wxc_string name)
{
	return self->LoadPanel(parent, wxstr(name));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxToolBar* wxXmlResource_LoadToolBar(wxXmlResource* self, wxWindow* parent, wxc_string name)
{
	return self->LoadToolBar(parent, wxstr(name));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxXmlResource_SetFlags(wxXmlResource* self, int flags)
{
	self->SetFlags(flags);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxXmlResource_GetFlags(wxXmlResource* self)
{
	return self->GetFlags();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxXmlResource_CompareVersion(wxXmlResource* self, int major, int minor, int release, int revision)
{
	return self->CompareVersion(major, minor, release, revision);
}

//-----------------------------------------------------------------------------

/*
extern "C" WXEXPORT
void wxXmlResource_UpdateResources(wxXmlResource* self)
{
	self->UpdateResources();
}
*/

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxXmlResource_AttachUnknownControl(wxXmlResource* self, wxc_string name, wxWindow* control, wxWindow* parent)
{
	return self->AttachUnknownControl(wxstr(name), control, parent)?1:0;
}