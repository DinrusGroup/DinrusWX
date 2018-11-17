//-----------------------------------------------------------------------------
// wxD - wxString.d
// (C) 2005 bero <berobero.sourceforge.net>
// (C) 2006 afb <afb@users.sourceforge.net>
// based on
// wx.NET - wxString.cs
//
/// The wxString wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: wxString.d,v 1.17 2008/07/29 06:53:22 afb Exp $
//-----------------------------------------------------------------------------

module wx.wxString;
public import wx.common;
    private import stdrus;


//! \cond EXTERN
static extern (C) ЦелУкз  wxString_ctor(ткст стр);
static extern (C) ЦелУкз  wxString_ctor2(wxChar* стр, size_t len);
static extern (C) проц    wxString_dtor(ЦелУкз сам);
static extern (C) size_t  wxString_Length(ЦелУкз сам);
static extern (C) wxChar* wxString_Data(ЦелУкз сам);
static extern (C) wxChar  wxString_GetChar(ЦелУкз сам, size_t i);
static extern (C) проц    wxString_SetChar(ЦелУкз сам, size_t i, wxChar c);

static extern (C) size_t  wxString_ansi_len(ЦелУкз сам);
static extern (C) size_t  wxString_ansi_str(ЦелУкз сам, ubyte *buffer, size_t buflen);
static extern (C) size_t  wxString_wide_len(ЦелУкз сам);
static extern (C) size_t  wxString_wide_str(ЦелУкз сам, wchar_t *buffer, size_t buflen);
static extern (C) size_t  wxString_utf8_len(ЦелУкз сам);
static extern (C) size_t  wxString_utf8_str(ЦелУкз сам, char *buffer, size_t buflen);
//! \endcond

//---------------------------------------------------------------------

/// wxString is a class representing a character ткст.
public class wxString : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    package this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this("");
    }

    public this(ткст стр)
    {
        this(wxString_ctor(стр), да);
    }

    public this(wxChar* wxstr, size_t wxlen)
    {
        this(wxString_ctor2(wxstr, wxlen), да);
    }

    //---------------------------------------------------------------------
    override protected проц dtor()
    {
        wxString_dtor(wxobj);
    }
    //---------------------------------------------------------------------

    public size_t length()
    {
        return wxString_Length(wxobj);
    }
    public wxChar* data()
    {
        return wxString_Data(wxobj);
    }
    public wxChar opIndex(size_t i)
    {
        return wxString_GetChar(wxobj, i);
    }
    public проц opIndexAssign(wxChar c, size_t i)
    {
        wxString_SetChar(wxobj, i, c);
    }
    public ткст opCast()
    {
        return this.вТкст();
    }
    public ubyte[] toAnsi()
    {
        size_t len = wxString_ansi_len(wxobj);
        ubyte[] buffer = new ubyte[len + 1]; // include NUL
        len = wxString_ansi_str(wxobj, buffer.ptr, buffer.length);
        buffer.length = len;
        return buffer;
    }
    public wchar_t[] toWide()
    {
        size_t len = wxString_wide_len(wxobj);
        wchar_t[] buffer = new wchar_t[len + 1]; // include NUL
        len = wxString_wide_str(wxobj, buffer.ptr, buffer.length);
        buffer.length = len;
        return buffer;
    }
    version (D_Version2)
    {
        public override ткст вТкст()
        {
            size_t len = wxString_utf8_len(wxobj);
            char[] buffer = new char[len + 1]; // include NUL
            len = wxString_utf8_str(wxobj, buffer.ptr, buffer.length);
            buffer.length = len;
            return assumeUnique(buffer);
        }
    }
    else // D_Version1
    {
        public ткст вТкст()
        {
            size_t len = wxString_utf8_len(wxobj);
            char[] buffer = new char[len + 1]; // include NUL
            len = wxString_utf8_str(wxobj, buffer.ptr, buffer.length);
            buffer.length = len;
            return assumeUnique(buffer);
        }
    }
}

