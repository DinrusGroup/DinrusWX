//-----------------------------------------------------------------------------
// wxD - wxVersion.d
// (C) 2005 afb <afb@users.sourceforge.net>
//
/// The wxVersion constants
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: wxVersion.d,v 1.8 2007/04/17 15:24:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.wxVersion;
public import wx.common;
    private import stdrus;

//! \cond EXTERN
static extern (C) цел wxVersion_MAJOR_VERSION();
static extern (C) цел wxVersion_MINOR_VERSION();
static extern (C) цел wxVersion_RELEASE_NUMBER();
static extern (C) цел wxVersion_SUBRELEASE_NUMBER();
static extern (C) ЦелУкз wxVersion_VERSION_STRING();
static extern (C) цел wxVersion_ABI_VERSION();
//! \endcond

public цел wxMAJOR_VERSION()
{
    return wxVersion_MAJOR_VERSION();
}
public цел wxMINOR_VERSION()
{
    return wxVersion_MINOR_VERSION();
}
public цел wxRELEASE_NUMBER()
{
    return wxVersion_RELEASE_NUMBER();
}
public цел wxSUBRELEASE_NUMBER()
{
    return wxVersion_SUBRELEASE_NUMBER();
}

public ткст wxVERSION_STRING()
{
    return cast(ткст) new wxString(wxVersion_VERSION_STRING(), да);
}

public цел wxABI_VERSION()
{
    return wxVersion_ABI_VERSION();
}

