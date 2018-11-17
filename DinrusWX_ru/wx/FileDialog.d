//-----------------------------------------------------------------------------
// wxD - FileDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// (C) 2005 afb <afb@users.sourceforge.net>
// based on
// wx.NET - FileDialog.cs
//
/// The wxFileDialog wrapper class.
//
// Written by Achim Breunig (achim.breunig@web.de)
// (C) 2003 Achim Breunig
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FileDialog.d,v 1.11 2007/04/17 15:24:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.FileDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ArrayString;

    private import stdrus;


//! \cond EXTERN
static extern (C) ЦелУкз wxFileDialog_ctor(ЦелУкз родитель, ткст message, ткст defaultDir, ткст defaultFile, ткст wildcard, бцел стиль, inout Точка поз);
static extern (C) проц   wxFileDialog_dtor(ЦелУкз сам);

static extern (C) ЦелУкз wxFileDialog_GetDirectory(ЦелУкз сам);
static extern (C) проц   wxFileDialog_SetDirectory(ЦелУкз сам, ткст dir);

static extern (C) ЦелУкз wxFileDialog_GetFilename(ЦелУкз сам);
static extern (C) проц   wxFileDialog_SetFilename(ЦелУкз сам, ткст имяф);

static extern (C) ЦелУкз wxFileDialog_GetPath(ЦелУкз сам);
static extern (C) проц   wxFileDialog_SetPath(ЦелУкз сам, ткст path);

static extern (C) проц   wxFileDialog_SetFilterIndex(ЦелУкз сам, цел filterIndex);
static extern (C) цел    wxFileDialog_GetFilterIndex(ЦелУкз сам);

static extern (C) ЦелУкз wxFileDialog_GetWildcard(ЦелУкз сам);
static extern (C) проц   wxFileDialog_SetWildcard(ЦелУкз сам, ткст wildcard);

static extern (C) проц   wxFileDialog_SetMessage(ЦелУкз сам, ткст message);
static extern (C) ЦелУкз wxFileDialog_GetMessage(ЦелУкз сам);

static extern (C) цел    wxFileDialog_ShowModal(ЦелУкз сам);

static extern (C) цел    wxFileDialog_GetStyle(ЦелУкз сам);
static extern (C) проц   wxFileDialog_SetStyle(ЦелУкз сам, цел стиль);

static extern (C) ЦелУкз wxFileDialog_GetPaths(ЦелУкз сам);
static extern (C) ЦелУкз wxFileDialog_GetFilenames(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias FileDialog wxFileDialog;
public class FileDialog : Dialog
{
    public const цел wxOPEN              = 0x0001;
    public const цел wxSAVE              = 0x0002;
    public const цел wxOVERWRITE_PROMPT  = 0x0004;
    public const цел wxHIDE_READONLY     = 0x0008;
    public const цел wxFILE_MUST_EXIST   = 0x0010;
    public const цел wxMULTIPLE          = 0x0020;
    public const цел wxCHANGE_DIR        = 0x0040;

    public const ткст wxFileSelectorPromptStr = "Выберите файл";
    version(__WXMSW__)
    {
        public const ткст wxFileSelectorDefaultWildcardStr = "*.*";
    } else
    {
        public const ткст wxFileSelectorDefaultWildcardStr = "*";
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, ткст message = wxFileSelectorPromptStr, ткст defaultDir = "", ткст defaultFile = "", ткст wildcard = wxFileSelectorDefaultWildcardStr, цел стиль = 0, Точка поз = вхДефПоз)
    {
        this(wxFileDialog_ctor(wxObject.SafePtr(родитель), message, defaultDir, defaultFile, wildcard, cast(бцел)стиль, поз));
    }

    //---------------------------------------------------------------------

    public ткст Directory()
    {
        return cast(ткст) new wxString(wxFileDialog_GetDirectory(wxobj), да);
    }
    public проц Directory(ткст значение)
    {
        wxFileDialog_SetDirectory(wxobj, значение);
    }

    public ткст ИмяФайла()
    {
        return cast(ткст) new wxString(wxFileDialog_GetFilename(wxobj), да);
    }
    public проц ИмяФайла(ткст значение)
    {
        wxFileDialog_SetFilename(wxobj, значение);
    }

    public ткст Path()
    {
        return cast(ткст) new wxString(wxFileDialog_GetPath(wxobj), да);
    }
    public проц Path(ткст значение)
    {
        wxFileDialog_SetPath(wxobj, значение);
    }

    public проц FilterIndex(цел значение)
    {
        wxFileDialog_SetFilterIndex(wxobj,значение);
    }
    public цел FilterIndex()
    {
        return wxFileDialog_GetFilterIndex(wxobj);
    }

    public проц Message(ткст значение)
    {
        wxFileDialog_SetMessage(wxobj,значение);
    }
    public ткст Message()
    {
        return cast(ткст) new wxString(wxFileDialog_GetMessage(wxobj), да);
    }

    //---------------------------------------------------------------------

    public override цел ShowModal()
    {
        return wxFileDialog_ShowModal(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст Wildcard()
    {
        return cast(ткст) new wxString(wxFileDialog_GetWildcard(wxobj), да);
    }
    public проц Wildcard(ткст значение)
    {
        wxFileDialog_SetWildcard(wxobj, значение);
    }

    public цел Стиль()
    {
        return cast(цел)wxFileDialog_GetStyle(wxobj);
    }
    public проц Стиль(цел значение)
    {
        wxFileDialog_SetStyle(wxobj, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    public ткст[] Paths()
    {
        return (new ТкстМассив(wxFileDialog_GetPaths(wxobj), да)).вМассив();
    }

    public ткст[] Filenames()
    {
        return (new ТкстМассив(wxFileDialog_GetFilenames(wxobj), да)).вМассив();
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxFileSelector_func(ткст message, ткст default_path, ткст default_filename, ткст default_extension, ткст wildcard, цел флаги, ЦелУкз родитель, цел x, цел y);
static extern (C) ЦелУкз wxFileSelectorEx_func(ткст message, ткст default_path, ткст default_filename,цел *indexDefaultExtension, ткст wildcard, цел флаги, ЦелУкз родитель, цел x, цел y);
static extern (C) ЦелУкз wxLoadFileSelector_func(ткст what, ткст extension, ткст default_name, ЦелУкз родитель);
static extern (C) ЦелУкз wxSaveFileSelector_func(ткст what, ткст extension, ткст default_name, ЦелУкз родитель);
//! \endcond

ткст FileSelector(
    ткст message = FileDialog.wxFileSelectorPromptStr,
    ткст default_path = null,
    ткст default_filename = null,
    ткст default_extension = null,
    ткст wildcard = FileDialog.wxFileSelectorDefaultWildcardStr,
    цел флаги = 0,
    Окно родитель = null, цел x = -1, цел y = -1)
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
    ткст message = FileDialog.wxFileSelectorPromptStr,
    ткст default_path = null,
    ткст default_filename = null,
    цел *indexDefaultExtension = null,
    ткст wildcard = FileDialog.wxFileSelectorDefaultWildcardStr,
    цел флаги = 0,
    Окно родитель = null, цел x = -1, цел y = -1)
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
    ткст default_name = null,
    Окно родитель = null)
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
    ткст default_name = null,
    Окно родитель = null)
{
    return cast(ткст) new wxString(wxSaveFileSelector_func(
                                         what,
                                         extension,
                                         default_name,
                                         wxObject.SafePtr(родитель)), да);
}

