//-----------------------------------------------------------------------------
// wxD - ФайлДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// (C) 2005 afb <afb@users.sourceforge.net>
// based on
// wx.NET - ФайлДиалог.cs
//
/// The wxFileDialog wrapper class.
//
// Written by Achim Breunig (achim.breunig@web.de)
// (C) 2003 Achim Breunig
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ФайлДиалог.d,v 1.11 2007/04/17 15:24:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.FileDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ArrayString;

//! \cond STD
version (Tango)
{
}
else // Phobos
{
private import std.string;
}
//! \endcond

		//! \cond EXTERN
        static extern (C) ЦУк wxFileDialog_ctor(ЦУк родитель, ткст message, ткст defaultDir, ткст defaultFile, ткст wildcard, бцел стиль, inout Точка поз);
        static extern (C) проц   wxFileDialog_dtor(ЦУк сам);

        static extern (C) ЦУк wxFileDialog_GetDirectory(ЦУк сам);
        static extern (C) проц   wxFileDialog_SetDirectory(ЦУк сам, ткст dir);

        static extern (C) ЦУк wxFileDialog_GetFilename(ЦУк сам);
        static extern (C) проц   wxFileDialog_SetFilename(ЦУк сам, ткст фимя);

        static extern (C) ЦУк wxFileDialog_GetPath(ЦУк сам);
        static extern (C) проц   wxFileDialog_SetPath(ЦУк сам, ткст путь);

        static extern (C) проц   wxFileDialog_SetFilterIndex(ЦУк сам, цел filterIndex);
        static extern (C) цел    wxFileDialog_GetFilterIndex(ЦУк сам);

        static extern (C) ЦУк wxFileDialog_GetWildcard(ЦУк сам);
        static extern (C) проц   wxFileDialog_SetWildcard(ЦУк сам, ткст wildcard);

        static extern (C) проц   wxFileDialog_SetMessage(ЦУк сам, ткст message);
        static extern (C) ЦУк wxFileDialog_GetMessage(ЦУк сам);

        static extern (C) цел    wxFileDialog_ShowModal(ЦУк сам);

        static extern (C) цел    wxFileDialog_GetStyle(ЦУк сам);
        static extern (C) проц   wxFileDialog_SetStyle(ЦУк сам, цел стиль);

        static extern (C) ЦУк wxFileDialog_GetPaths(ЦУк сам);
        static extern (C) ЦУк wxFileDialog_GetFilenames(ЦУк сам);
		//! \endcond

        //---------------------------------------------------------------------

    alias ФайлДиалог wxFileDialog;
    public class ФайлДиалог : Диалог
    {
        public const цел wxOPEN              = 0x0001;
        public const цел wxSAVE              = 0x0002;
        public const цел wxOVERWRITE_PROMPT  = 0x0004;
        public const цел wxHIDE_READONLY     = 0x0008;
        public const цел wxFILE_MUST_EXIST   = 0x0010;
        public const цел wxMULTIPLE          = 0x0020;
        public const цел wxCHANGE_DIR        = 0x0040;

	public const ткст wxFileSelectorPromptStr = "Выберите файл";
	version(__WXMSW__) {
		public const ткст wxFileSelectorDefaultWildcardStr = "*.*";
	} else {
		public const ткст wxFileSelectorDefaultWildcardStr = "*";
	}

        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель, ткст message = wxFileSelectorPromptStr, ткст defaultDir = "", ткст defaultFile = "", ткст wildcard = wxFileSelectorDefaultWildcardStr , цел стиль = 0, Точка поз = wxDefaultPosition)
            { this(wxFileDialog_ctor(wxObject.SafePtr(родитель), message, defaultDir, defaultFile, wildcard, cast(бцел)стиль, поз)); }

        //---------------------------------------------------------------------

        public ткст Directory() { return cast(ткст) new wxString(wxFileDialog_GetDirectory(шхобъ), да); }
        public проц Directory(ткст значение) { wxFileDialog_SetDirectory(шхобъ, значение); }

        public ткст Filename() { return cast(ткст) new wxString(wxFileDialog_GetFilename(шхобъ), да); }
        public проц Filename(ткст значение) { wxFileDialog_SetFilename(шхобъ, значение); }

        public ткст Путь() { return cast(ткст) new wxString(wxFileDialog_GetPath(шхобъ), да); }
        public проц Путь(ткст значение) { wxFileDialog_SetPath(шхобъ, значение); }

        public проц FilterIndex(цел значение) { wxFileDialog_SetFilterIndex(шхобъ,значение); }
        public цел FilterIndex() { return wxFileDialog_GetFilterIndex(шхобъ); }

        public проц Message(ткст значение) { wxFileDialog_SetMessage(шхобъ,значение); }
        public ткст Message() { return cast(ткст) new wxString(wxFileDialog_GetMessage(шхобъ), да); }

        //---------------------------------------------------------------------

        public override цел ShowModal()
        {
            return wxFileDialog_ShowModal(шхобъ);
        }

        //---------------------------------------------------------------------

        public ткст Wildcard() { return cast(ткст) new wxString(wxFileDialog_GetWildcard(шхобъ), да); }
        public проц Wildcard(ткст значение) { wxFileDialog_SetWildcard(шхобъ, значение); }

        public цел Style() { return cast(цел)wxFileDialog_GetStyle(шхобъ); }
        public проц Style(цел значение) { wxFileDialog_SetStyle(шхобъ, cast(цел)значение); }

        //---------------------------------------------------------------------

        public ткст[] Paths() { return (new МасТкст(wxFileDialog_GetPaths(шхобъ), да)).вМассив(); }

        public ткст[] Именаф() { return (new МасТкст(wxFileDialog_GetFilenames(шхобъ), да)).вМассив(); }
    }

	//! \cond EXTERN
	static extern (C) ЦУк wxFileSelector_func(ткст message, ткст default_path, ткст default_filename, ткст default_extension, ткст wildcard, цел флаги, ЦУк родитель, цел x, цел y);
	static extern (C) ЦУк wxFileSelectorEx_func(ткст message, ткст default_path, ткст default_filename,цел *indexDefaultExtension, ткст wildcard, цел флаги, ЦУк родитель, цел x, цел y);
	static extern (C) ЦУк wxLoadFileSelector_func(ткст what, ткст extension, ткст default_name, ЦУк родитель);
	static extern (C) ЦУк wxSaveFileSelector_func(ткст what, ткст extension, ткст default_name, ЦУк родитель);
	//! \endcond

ткст FileSelector(
	ткст message = ФайлДиалог.wxFileSelectorPromptStr,
	ткст default_path = пусто,
	ткст default_filename = пусто,
	ткст default_extension = пусто,
	ткст wildcard = ФайлДиалог.wxFileSelectorDefaultWildcardStr,
	цел флаги = 0,
	Окно родитель = пусто, цел x = -1, цел y = -1)
{
	return cast(ткст) new wxString(wxFileSelector_func(
		message,
		default_path,
		default_filename,
		default_extension,
		wildcard,
		флаги,
		wxObject.SafePtr(родитель),x,y), да);
}

ткст FileSelectorEx(
	ткст message = ФайлДиалог.wxFileSelectorPromptStr,
	ткст default_path = пусто,
	ткст default_filename = пусто,
	цел *indexDefaultExtension = пусто,
	ткст wildcard = ФайлДиалог.wxFileSelectorDefaultWildcardStr,
	цел флаги = 0,
	Окно родитель = пусто, цел x = -1, цел y = -1)
{
	return cast(ткст) new wxString(wxFileSelectorEx_func(
		message,
		default_path,
		default_filename,
		indexDefaultExtension,
		wildcard,
		флаги,
		wxObject.SafePtr(родитель),x,y), да);
}

ткст LoadFileSelector(
	ткст what,
	ткст extension,
	ткст default_name = пусто,
	Окно родитель = пусто)
{
	return cast(ткст) new wxString(wxLoadFileSelector_func(
		what,
		extension,
		default_name,
		wxObject.SafePtr(родитель)), да);
}

ткст SaveFileSelector(
	ткст what,
	ткст extension,
	ткст default_name = пусто,
	Окно родитель = пусто)
{
	return cast(ткст) new wxString(wxSaveFileSelector_func(
		what,
		extension,
		default_name,
		wxObject.SafePtr(родитель)), да);
}

