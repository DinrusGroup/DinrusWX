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

//! \cond STD
version (Tango)
{
import tango.core.Version;
static if (Tango.Major == 0 && Tango.Minor < 994)
alias Объект.toUtf8 toString;
}

version(Phobos) // Phobos
{
private import std.string;
private import std.utf;
}

version(Dinrus)
{

}
//! \endcond

		//! \cond EXTERN
		static extern (C) ЦУк  wxString_ctor(ткст str);
		static extern (C) ЦУк  wxString_ctor2(wxChar* str, size_t len);
		static extern (C) проц    wxString_dtor(ЦУк сам);
		static extern (C) size_t  wxString_Length(ЦУк сам);
		static extern (C) wxChar* wxString_Data(ЦУк сам);
		static extern (C) wxChar  wxString_GetChar(ЦУк сам, size_t i);
		static extern (C) проц    wxString_SetChar(ЦУк сам, size_t i, wxChar c);

		static extern (C) size_t  wxString_ansi_len(ЦУк сам);
		static extern (C) size_t  wxString_ansi_str(ЦУк сам, ббайт *buffer, size_t buflen);
		static extern (C) size_t  wxString_wide_len(ЦУк сам);
		static extern (C) size_t  wxString_wide_str(ЦУк сам, wchar_t *buffer, size_t buflen);
		static extern (C) size_t  wxString_utf8_len(ЦУк сам);
		static extern (C) size_t  wxString_utf8_str(ЦУк сам, сим *buffer, size_t buflen);
		//! \endcond
		
		//---------------------------------------------------------------------

	/// wxString is a class representing a character ткст.
	public class wxString : wxObject
	{
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
			
		package this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
			{ this(""); }

		public this(ткст str)
			{ this(wxString_ctor(str), да); }

		public this(wxChar* wxstr, size_t wxlen)
			{ this(wxString_ctor2(wxstr, wxlen), да); }
		
		//---------------------------------------------------------------------
		override protected проц dtor() { wxString_dtor(шхобъ); }				
		//---------------------------------------------------------------------

		public size_t length() { return wxString_Length(шхобъ); }
		public wxChar* данные() { return wxString_Data(шхобъ); }
		public wxChar opIndex(size_t i) { return wxString_GetChar(шхобъ, i); }
		public проц opIndexAssign(wxChar c, size_t i) { wxString_SetChar(шхобъ, i, c); }
		public ткст opCast() { return this.toString(); }
		public ббайт[] toAnsi()
		{
			size_t len = wxString_ansi_len(шхобъ);
			ббайт[] buffer = new ббайт[len + 1]; // include NUL
			len = wxString_ansi_str(шхобъ, buffer.ptr, buffer.length);
			buffer.length = len;
			return buffer;
		}
		public wchar_t[] toWide()
		{
			size_t len = wxString_wide_len(шхобъ);
			wchar_t[] buffer = new wchar_t[len + 1]; // include NUL
			len = wxString_wide_str(шхобъ, buffer.ptr, buffer.length);
			buffer.length = len;
			return buffer;
		}
version (D_Version2)
{
		public override ткст toString()
		{
			size_t len = wxString_utf8_len(шхобъ);
			сим[] buffer = new сим[len + 1]; // include NUL
			len = wxString_utf8_str(шхобъ, buffer.ptr, buffer.length);
			buffer.length = len;
			return buffer;//assumeUnique(buffer);
		}
}
else // D_Version1
{
		public ткст toString()
		{
			size_t len = wxString_utf8_len(шхобъ);
			сим[] buffer = new сим[len + 1]; // include NUL
			len = wxString_utf8_str(шхобъ, buffer.ptr, buffer.length);
			buffer.length = len;
			return buffer;//assumeUnique(buffer);
		}
}
	}

