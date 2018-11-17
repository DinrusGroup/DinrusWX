//-----------------------------------------------------------------------------
// wx.NET - wizardpagesimple.cxx
//
// The wxWizardPageSimple proxy interface.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id: wizardpagesimple.cpp,v 1.9 2006/11/17 15:21:05 afb Exp $
//-----------------------------------------------------------------------------
/*
#include <wx/wx.h>
#include <wx/wizard.h>
#include "local_events.h"
*/
#include "stdafx.h"
//-----------------------------------------------------------------------------
// The proxy class

class _WizardPageSimple : public wxWizardPageSimple
{
public:
	_WizardPageSimple(wxWizard* parent, wxWizardPage* prev, wxWizardPage* next)
		: wxWizardPageSimple(parent, prev, next)
	{
	}

	DECLARE_OBJECTDELETED(_WizardPageSimple)

#include "panel.inc"
};

//-----------------------------------------------------------------------------
// C stubs for class methods

extern "C" WXEXPORT
wxWizardPageSimple* wxWizPageSimp_ctor(wxWizard* parent, wxWizardPage* prev, wxWizardPage* next)
{
	return new _WizardPageSimple(parent, prev, next);
}

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
void wxWizPageSimp_Chain(wxWizardPageSimple* page1, wxWizardPageSimple* page2)
{
	wxWizardPageSimple::Chain(page1, page2);
}

