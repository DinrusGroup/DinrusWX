//-----------------------------------------------------------------------------
// wxD - bitmap.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - bitmap.cxx
//
// The wxBitmap proxy interface.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: bitmap.cpp,v 1.10 2007/01/15 11:55:34 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/bitmap.h>
#include <wx/image.h>
*/
#include "stdafx.h"

//-----------------------------------------------------------------------------
// wxBitmap

extern "C" WXEXPORT
wxBitmap* wxBitmap_ctor()
{
    return new wxBitmap();
}

extern "C" WXEXPORT
wxBitmap* wxBitmap_ctorByImage(wxImage* image, int depth)
{
    return new wxBitmap(*image, depth);
}

extern "C" WXEXPORT
wxBitmap* wxBitmap_ctorByName(wxc_string name, int type)
{
    return new wxBitmap(wxstr(name), (wxBitmapType)type);
}

extern "C" WXEXPORT
wxBitmap* wxBitmap_ctorBySize(int width, int height, int depth)
{
    return new wxBitmap(width, height, depth);
}

extern "C" WXEXPORT
wxBitmap* wxBitmap_ctorByBitmap(wxBitmap* bitmap)
{
	return new wxBitmap(*bitmap);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxImage* wxBitmap_ConvertToImage(wxBitmap* self)
{
    return new wxImage(self->ConvertToImage());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxBitmap_GetHeight(wxBitmap* self)
{
    return self->GetHeight();
}

extern "C" WXEXPORT
void wxBitmap_SetHeight(wxBitmap* self, int height)
{
    self->SetHeight(height);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxBitmap_GetWidth(wxBitmap* self)
{
    return self->GetWidth();
}

extern "C" WXEXPORT
void wxBitmap_SetWidth(wxBitmap* self, int width)
{
    self->SetWidth(width);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxBitmap_LoadFile(wxBitmap* self, wxc_string name, wxBitmapType type)
{
    return self->LoadFile(wxstr(name), type)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxBitmap_SaveFile(wxBitmap* self, wxc_string name, wxBitmapType type, wxPalette* palette)
{
	return self->SaveFile(wxstr(name), type, palette)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxBitmap_Ok(wxBitmap* self)
{
    return self->Ok()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
int wxBitmap_GetDepth(wxBitmap* self)
{
	return self->GetDepth();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBitmap_SetDepth(wxBitmap* self, int depth)
{
	self->SetDepth(depth);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxBitmap* wxBitmap_GetSubBitmap(wxBitmap* self, wxRect* rect)
{
	return new wxBitmap(self->GetSubBitmap(*rect));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxMask* wxBitmap_GetMask(wxBitmap* self)
{
	return self->GetMask();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxBitmap_SetMask(wxBitmap* self, wxMask* mask)
{
	self->SetMask(mask);
}

extern "C" WXEXPORT
wxPalette* wxBitmap_GetPalette(wxBitmap* self)
{
	return self->GetPalette();
}

extern "C" WXEXPORT
wxPalette* wxBitmap_GetColourMap(wxBitmap* self)
{
	return self->GetPalette();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxBitmap_CopyFromIcon(wxBitmap* self, wxIcon* icon)
{
	return self->CopyFromIcon(*icon)?1:0;
}

//-----------------------------------------------------------------------------
//wxMask

extern "C" WXEXPORT
wxMask* wxMask_ctor()
{
    return new wxMask();
}

extern "C" WXEXPORT
wxMask* wxMask_ctorByBitmpaColour(wxBitmap* bitmap, wxColour* colour)
{
    return new wxMask(*bitmap, *colour);
}

extern "C" WXEXPORT
wxMask* wxMask_ctorByBitmapIndex(wxBitmap* bitmap, int paletteIndex)
{
    return new wxMask(*bitmap, paletteIndex);
}

extern "C" WXEXPORT
wxMask* wxMask_ctorByBitmap(wxBitmap* bitmap)
{
    return new wxMask(*bitmap);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxMask_CreateByBitmapColour(wxMask* self, wxBitmap* bitmap, wxColour* colour)
{
	return self->Create(*bitmap, *colour)?1:0;
}

extern "C" WXEXPORT
wxc_bool wxMask_CreateByBitmapIndex(wxMask* self, wxBitmap* bitmap, int paletteIndex)
{
	return self->Create(*bitmap, paletteIndex)?1:0;
}

extern "C" WXEXPORT
wxc_bool wxMask_CreateByBitmap(wxMask* self, wxBitmap* bitmap)
{
	return self->Create(*bitmap)?1:0;
}

