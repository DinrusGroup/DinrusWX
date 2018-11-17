module wx.wxString;
public import wx.common;


		//! \cond EXTERN
		static extern (C) IntPtr  wxString_ctor(ткст стр);
		static extern (C) IntPtr  wxString_ctor2(wxChar* стр, size_t len);
		static extern (C) проц    wxString_dtor(IntPtr сам);
		static extern (C) size_t  wxString_Length(IntPtr сам);
		static extern (C) wxChar* wxString_Data(IntPtr сам);
		static extern (C) wxChar  wxString_GetChar(IntPtr сам, size_t i);
		static extern (C) проц    wxString_SetChar(IntPtr сам, size_t i, wxChar c);

		static extern (C) size_t  wxString_ansi_len(IntPtr сам);
		static extern (C) size_t  wxString_ansi_str(IntPtr сам, ubyte *buffer, size_t buflen);
		static extern (C) size_t  wxString_wide_len(IntPtr сам);
		static extern (C) size_t  wxString_wide_str(IntPtr сам, wchar_t *buffer, size_t buflen);
		static extern (C) size_t  wxString_utf8_len(IntPtr сам);
		static extern (C) size_t  wxString_utf8_str(IntPtr сам, char *buffer, size_t buflen);
		//! \endcond

		//---------------------------------------------------------------------

	/// wxString is a class representing a character ткст.
	public class wxString : wxObject
	{
		public this(IntPtr wxobj);
		package this(IntPtr wxobj, бул memOwn);
		public this();
		public this(ткст стр);
		public this(wxChar* wxstr, size_t wxlen);
		override protected проц dtor();
		public size_t length() ;
		public wxChar* data() ;
		public wxChar opIndex(size_t i);
		public проц opIndexAssign(wxChar c, size_t i) ;
		public ткст opCast() ;
		public ubyte[] toAnsi();
		public wchar_t[] toWide();
		version (D_Version2)
		{
				public override ткст вТкст();
		}
		else // D_Version1
		{
				public ткст вТкст();
		}
	}

