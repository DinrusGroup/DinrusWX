//-----------------------------------------------------------------------------
// wxD - sound.cpp
// (C) 2006 afb <afb@users.sourceforge.net>
//
// wxSound class (loads and plays short Windows .wav files).
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: sound.cpp,v 1.5 2007/01/15 11:55:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/sound.h>
#include <wx/event.h>
#include "local_events.h"
*/
#include "stdafx.h"
#if wxUSE_SOUND

//-----------------------------------------------------------------------------
// C stubs for class methods

extern "C" WXEXPORT
wxSound* wxSound_ctor()
{
	return new wxSound();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxSound* wxSound_ctor2(wxc_string fileName, wxc_bool isResource)
{
	return new wxSound(wxstr(fileName), isResource);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxSound* wxSound_ctor3(int size, const wxByte* data)
{
	return new wxSound(size, data);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxSound_dtor(wxSound* self)
{
	if (self != NULL)
		delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxSound_Play(wxSound* self, unsigned int flags)
{
	return self->Play(flags);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxSound_Stop(wxSound* self)
{
	self->Stop();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxSound_IsOk(wxSound* self)
{
	return self->IsOk();
}

#else
#ifdef __GNUC__
#warning "wxUSE_SOUND is not set"
#endif
#endif
