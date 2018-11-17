//-----------------------------------------------------------------------------
// wxD - dataobj.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - dataobj.cxx
//
// The wxDataObject proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: dataobject.cpp,v 1.11 2007/01/28 23:06:38 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/dataobj.h>
#include "local_events.h"
*/
#include "stdafx.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDataObject_dtor(wxDataObject* self)
{
	delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDataObject_GetPreferredFormat(wxDataObject* self, wxDataObject::Direction dir, wxDataFormat* dataFormat)
{
	*dataFormat = self->GetPreferredFormat(dir);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
size_t wxDataObject_GetFormatCount(wxDataObject* self, wxDataObject::Direction dir)
{
	return self->GetFormatCount(dir);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDataObject_GetAllFormats(wxDataObject* self, wxDataFormat *formats, wxDataObject::Direction dir)
{
	self->GetAllFormats(formats, dir);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
size_t wxDataObject_GetDataSize(wxDataObject* self, const wxDataFormat* format)
{
	return self->GetDataSize(*format);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxDataObject_GetDataHere(wxDataObject* self, const wxDataFormat* format, void *buf)
{
	return self->GetDataHere(*format, buf)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxDataObject_SetData(wxDataObject* self, const wxDataFormat* format, size_t len, const void * buf)
{
	return self->SetData(*format, len, buf)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxDataObject_IsSupported(wxDataObject* self, const wxDataFormat* format, wxDataObject::Direction dir)
{
	return self->IsSupported(*format, dir)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDataObjectSimple* wxDataObjectSimple_ctor(const wxDataFormat* format)
{
	if (format == NULL)
		format = &wxFormatInvalid;

	return new wxDataObjectSimple(*format);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDataObjectSimple_dtor(wxDataObjectSimple* self)
{
	if (self != NULL)
		delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDataObjectSimple_SetFormat(wxDataObjectSimple* self, const wxDataFormat* format)
{
	self->SetFormat(*format);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
size_t wxDataObjectSimple_GetDataSize(wxDataObjectSimple* self)
{
	return self->GetDataSize();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxDataObjectSimple_GetDataHere(wxDataObjectSimple* self, void *buf)
{
	return self->GetDataHere(buf)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxDataObjectSimple_SetData(wxDataObjectSimple* self, size_t len, const void *buf)
{
	return self->SetData(len, buf)?1:0;
}

//-----------------------------------------------------------------------------
// wxTextDataObject

class _TextDataObject : public wxTextDataObject
{
public:
	_TextDataObject(const wxString& text)
		: wxTextDataObject(text) {}

	DECLARE_DISPOSABLE(_TextDataObject)
};

extern "C" WXEXPORT
wxTextDataObject* wxTextDataObject_ctor(wxc_string text)
{
	return new _TextDataObject(wxstr(text));
}

extern "C" WXEXPORT
void wxTextDataObject_dtor(wxTextDataObject* self)
{
	if (self != NULL)
		delete self;
}

extern "C" WXEXPORT
void wxTextDataObject_RegisterDisposable(_TextDataObject* self, Virtual_Dispose onDispose)
{
	self->RegisterDispose(onDispose);
}

extern "C" WXEXPORT
size_t wxTextDataObject_GetTextLength(wxTextDataObject* self)
{
	return self->GetTextLength();
}

extern "C" WXEXPORT
wxString* wxTextDataObject_GetText(wxTextDataObject* self)
{
	return new wxString(self->GetText().c_str());
}

extern "C" WXEXPORT
void wxTextDataObject_SetText(wxTextDataObject* self, wxc_string text)
{
	self->SetText(wxstr(text));
}

//-----------------------------------------------------------------------------

class _FileDataObject : public wxFileDataObject
{
public:
	_FileDataObject()
		: wxFileDataObject() {}

	DECLARE_DISPOSABLE(_FileDataObject)
};

extern "C" WXEXPORT
wxFileDataObject* wxFileDataObject_ctor()
{
	return new _FileDataObject();
}

extern "C" WXEXPORT
void wxFileDataObject_dtor(wxFileDataObject* self)
{
	if (self != NULL)
		delete self;
}

extern "C" WXEXPORT
void wxFileDataObject_RegisterDisposable(_FileDataObject* self, Virtual_Dispose onDispose)
{
	self->RegisterDispose(onDispose);
}

extern "C" WXEXPORT
void wxFileDataObject_AddFile(wxFileDataObject* self, wxc_string filename)
{
	self->AddFile(wxstr(filename));
}

extern "C" WXEXPORT
wxArrayString* wxFileDataObject_GetFilenames(wxFileDataObject* self)
{
	wxArrayString* was = new wxArrayString();
	*was = self->GetFilenames();
	return was;
}

