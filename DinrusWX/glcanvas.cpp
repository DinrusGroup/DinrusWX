//-----------------------------------------------------------------------------
// wxD - glcanvas.cpp
// (C) 2006 afb <afb@users.sourceforge.net>
//
// wxGLCanvas, for OpenGL windows
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: glcanvas.cpp,v 1.7 2007/04/17 21:35:25 afb Exp $
//-----------------------------------------------------------------------------

#include "stdafx.h"

#if wxUSE_GLCANVAS

//-----------------------------------------------------------------------------
// wxGLContext

extern "C" WXEXPORT
void wxGLContext_SetCurrent(wxGLContext* self, wxGLCanvas *canvas)
{
#if wxABI_VERSION < 20700 || defined(__WXMAC__)
	self->SetCurrent();
#else
	self->SetCurrent(*canvas);
#endif
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLContext_Update(wxGLContext* self)
{
#ifdef __WXMAC__
	// must be called after window drag/grows/zoom or clut change
	self->Update();
#endif
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLContext_SetColour(wxGLContext* self, wxc_string colour)
{
#if wxABI_VERSION < 20700 || defined(__WXMAC__)
	self->SetColour(wxstr(colour));
#endif
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLContext_SwapBuffers(wxGLContext* self)
{
#if wxABI_VERSION < 20700 || defined(__WXMAC__)
	self->SwapBuffers();
#endif
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxWindow* wxGLContext_GetWindow(wxGLContext* self)
{
#if wxABI_VERSION < 20700 || defined(__WXMAC__)
	return self->GetWindow();
#else
	return NULL;
#endif
}

//-----------------------------------------------------------------------------
// wxGLCanvas

class _GLCanvas : public wxGLCanvas
{
public:

	_GLCanvas(wxWindow *parent,
               const wxGLAttributes& dispAttrs,
               wxWindowID id = wxID_ANY,
               const wxPoint& pos = wxDefaultPosition,
               const wxSize& size = wxDefaultSize,
               long style = 0,
               const wxString& name = wxGLCanvasName,
               const wxPalette& palette = wxNullPalette)
		: wxGLCanvas(parent, dispAttrs, id, pos, size, style, name, palette)
	{

	}

	_GLCanvas(wxWindow *parent,
               wxWindowID id = wxID_ANY,
               const int *attribList = NULL,
               const wxPoint& pos = wxDefaultPosition,
               const wxSize& size = wxDefaultSize,
               long style = 0,
               const wxString& name = wxGLCanvasName,
               const wxPalette& palette = wxNullPalette)
		: wxGLCanvas(parent, id, attribList, pos, size, style, name, palette)
	{
	}	

    DECLARE_OBJECTDELETED(_GLCanvas)
};

//-----------------------------------------------------------------------------
// C stubs for class methods

extern "C" WXEXPORT
wxGLCanvas* wxGLCanvas_ctor(wxWindow *parent,
               wxGLAttributes& dispAttrs,
               wxWindowID id,
               wxPoint& pos,
               wxSize& size,
               long style,
               const wxString& name = "GLCanvas",
               wxPalette& palette = wxNullPalette)
{

	if (id == NULL)
		id = wxID_ANY;
	
	if ( pos.x == wxDefaultCoord && pos.y == wxDefaultCoord)
		pos = wxDefaultPosition;

	if (size.x == wxDefaultCoord && size.y == wxDefaultCoord)
		size = wxDefaultSize;

	//if (name.data == NULL)
		//name = wxc_string("GLCanvas");

	//if (palette == NULL)
		//palette = wxNullPalette;

	return new _GLCanvas(parent, dispAttrs, id, pos, size, style, wxstr(name), palette);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxGLCanvas* wxGLCanvas_ctor2(wxWindow *parent,
               wxWindowID id,
               const int *attribList,
               wxPoint& pos,
                wxSize& size,
               long style,
               const wxString& name = "GLCanvas",
               const wxPalette& palette = wxNullPalette)
{
	
		if (id == NULL)
			id = wxID_ANY;

		if (pos.x == wxDefaultCoord && pos.y == wxDefaultCoord)
			pos = wxDefaultPosition;

		if (size.x == wxDefaultCoord && size.y == wxDefaultCoord)
			size = wxDefaultSize;

		//if (name.data==NULL)
			//name = wxc_string("GLCanvas");

	//	if (palette == NULL)
		//	palette = &wxNullPalette;

	return new _GLCanvas(parent, id, attribList, pos, size, style, wxstr(name), palette);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLCanvas_SetCurrent(wxGLCanvas* self, wxGLContext& ctxt)
{
	self->SetCurrent(ctxt);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLCanvas_UpdateContext(wxGLCanvas* self)
{
#ifdef __WXMAC__
	self->UpdateContext();
#endif
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLCanvas_SetColour(wxGLCanvas* self, wxc_string colour)
{
	self->SetColour(wxstr(colour));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxGLCanvas_SwapBuffers(wxGLCanvas* self)
{
	self->SwapBuffers();
}

//-----------------------------------------------------------------------------
/*VK!
extern "C" WXEXPORT
wxGLContext* wxGLCanvas_GetContext(wxGLCanvas* self)
{
	return self->GetContext();
}
*/
#else
#ifdef __GNUC__
#warning "wxUSE_GLCANVAS is not set"
#endif
#endif
