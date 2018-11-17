//-----------------------------------------------------------------------------
// wxD - log.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - log.cxx
//
// The wxLog and wxLogXXX proxy interfaces.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: log.cpp,v 1.11 2007/01/28 23:06:39 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include "common.h"
#include <wx/log.h>
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxLog* wxLog_ctor()
{
    return new wxLog();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_dtor(wxLog* self)
{
    delete self;
}

//-----------------------------------------------------------------------------
// SetLogBuffer ???
//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxLog_IsEnabled()
{
    return wxLog::IsEnabled()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxLog_EnableLogging(wxc_bool doit)
{
    return wxLog::EnableLogging(doit)?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_OnLog(unsigned long level, wxc_string szString, long t)
{
    wxLog::OnLog(level, wxstr(szString).c_str(), t);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_Flush(wxLog* self)
{
    self->Flush();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxLog_HasPendingMessages(wxLog* self)
{
    return self->HasPendingMessages()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_FlushActive()
{
    wxLog::FlushActive();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxLog* wxLog_GetActiveTarget()
{
    return wxLog::GetActiveTarget();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxLog* wxLog_SetActiveTargetTextCtrl(wxTextCtrl* pLogger)
{
    return wxLog::SetActiveTarget(new wxLogTextCtrl(pLogger));
}

// hmmm...
extern "C" WXEXPORT
void wxLog_DeleteActiveTarget()
{
    delete wxLog::GetActiveTarget();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_Suspend()
{
    wxLog::Suspend();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_Resume()
{
    wxLog::Resume();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_SetVerbose(wxc_bool bVerbose)
{
    wxLog::SetVerbose(bVerbose);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_SetLogLevel(wxLogLevel logLevel)
{
    wxLog::SetLogLevel(logLevel);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_DontCreateOnDemand()
{
    wxLog::DontCreateOnDemand();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_SetTraceMask(wxTraceMask ulMask)
{
    wxLog::SetTraceMask(ulMask);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_AddTraceMask(wxc_string str)
{
    wxLog::AddTraceMask(wxstr(str));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_RemoveTraceMask(wxc_string str)
{
    wxLog::RemoveTraceMask(wxstr(str));
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_ClearTraceMasks()
{
    wxLog::ClearTraceMasks();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxArrayString* wxLog_GetTraceMasks()
{
    return new wxArrayString(wxLog::GetTraceMasks());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_SetTimestamp(wxc_string ts)
{
    wxLog::SetTimestamp(wxstr(ts).c_str());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxLog_GetVerbose()
{
    return wxLog::GetVerbose()?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxTraceMask wxLog_GetTraceMask()
{
    return wxLog::GetTraceMask();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxc_bool wxLog_IsAllowedTraceMask(wxc_string mask)
{
    return wxLog::IsAllowedTraceMask(wxstr(mask).c_str())?1:0;
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxLogLevel wxLog_GetLogLevel()
{
    return wxLog::GetLogLevel();
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxString* wxLog_GetTimestamp()
{
    return new wxString(wxLog::GetTimestamp());
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxLog_TimeStamp(wxc_string str)
{
	wxString *wxs = new wxString(wxstr(str));
    wxLog::TimeStamp(wxs);
}

//-----------------------------------------------------------------------------

enum {
	xLOGMESSAGE,
	xFATALERROR,
	xERROR,
	xWARNING,
	xINFO,
	xVERBOSE,
	xSTATUS,
	xSYSERROR
};

extern "C" WXEXPORT
void wxLog_Log_Function(int what, wxc_string szFormat)
{
    wxString tmpstr = wxstr(szFormat);
    // params are converted by csharp code

    switch (what) {
    	case xLOGMESSAGE: 	wxLogMessage(tmpstr);
				break;
	case xFATALERROR: 	wxLogFatalError(tmpstr);
				break;
	case xERROR:	  	wxLogError(tmpstr);
				break;
	case xWARNING:		wxLogWarning(tmpstr);
				break;
	case xINFO:		wxLogInfo(tmpstr);
				break;
	case xVERBOSE:		wxLogVerbose(tmpstr);
				break;
	case xSTATUS:		wxLogStatus(tmpstr);
				break;
	case xSYSERROR:		wxLogSysError(tmpstr);
				break;
    }
}





