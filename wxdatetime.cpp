//-----------------------------------------------------------------------------
// wxD - wxdatetime.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - wxdatetime.cxx
//
// The wxDateTime proxy interface
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: wxdatetime.cpp,v 1.9 2006/11/17 15:21:06 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/datetime.h>
*/
#include "stdafx.h"
extern "C" WXEXPORT
const wxDateTime* wxDefaultDateTime_Get()
{
    return &wxDefaultDateTime;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDateTime* wxDateTime_ctor()
{
    return new wxDateTime();
}

extern "C" WXEXPORT
void wxDateTime_dtor(wxDateTime* self)
{
	if (self != NULL)
		delete self;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxDateTime* wxDateTime_Now()
{
    return new wxDateTime(wxDateTime::Now());
}
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxDateTime_Set(wxDateTime* self, unsigned short day, 
                    int month, int year, 
                    unsigned short hour, unsigned short minute, 
                    unsigned short second, unsigned short millisec)
{
    self->Set(day, (wxDateTime::Month)month, year, hour, minute, second, millisec);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
unsigned short wxDateTime_GetYear(wxDateTime* self)
{
    return self->GetYear();
}

extern "C" WXEXPORT
int wxDateTime_GetMonth(wxDateTime* self)
{
    return (int)self->GetMonth();
}

extern "C" WXEXPORT
unsigned short wxDateTime_GetDay(wxDateTime* self)
{
    return self->GetDay();
}

extern "C" WXEXPORT
unsigned short wxDateTime_GetHour(wxDateTime* self)
{
    return self->GetHour();
}

extern "C" WXEXPORT
unsigned short wxDateTime_GetMinute(wxDateTime* self)
{
    return self->GetMinute();
}

extern "C" WXEXPORT
unsigned short wxDateTime_GetSecond(wxDateTime* self)
{
    return self->GetSecond();
}

extern "C" WXEXPORT
unsigned short wxDateTime_GetMillisecond(wxDateTime* self)
{
    return self->GetMillisecond();
}

//-----------------------------------------------------------------------------

