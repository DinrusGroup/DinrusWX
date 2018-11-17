//-----------------------------------------------------------------------------
// wxD - HtmlHelpController.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - HtmlHelpController.cs
//
/// The wxHtmlHelpController wrapper class
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HtmlHelpController.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.HtmlHelpController;
public import wx.common;

public import wx.Config;
public import wx.Frame;

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlHelpController_ctor(цел стиль);
static extern (C) проц   wxHtmlHelpController_SetTitleFormat(ЦелУкз сам, ткст format);
static extern (C) проц   wxHtmlHelpController_SetTempDir(ЦелУкз сам, ткст path);
static extern (C) бул   wxHtmlHelpController_AddBook(ЦелУкз сам, ткст book_url);
static extern (C) бул   wxHtmlHelpController_Display(ЦелУкз сам, ткст x);
static extern (C) бул   wxHtmlHelpController_DisplayInt(ЦелУкз сам, цел ид);
static extern (C) бул   wxHtmlHelpController_DisplayContents(ЦелУкз сам);
static extern (C) бул   wxHtmlHelpController_DisplayIndex(ЦелУкз сам);
static extern (C) бул   wxHtmlHelpController_KeywordSearch(ЦелУкз сам, ткст keyword, цел mode);
static extern (C) проц   wxHtmlHelpController_UseConfig(ЦелУкз сам, ЦелУкз config, ткст rootpath);
static extern (C) проц   wxHtmlHelpController_ReadCustomization(ЦелУкз сам, ЦелУкз cfg, ткст path);
static extern (C) проц   wxHtmlHelpController_WriteCustomization(ЦелУкз сам, ЦелУкз cfg, ткст path);
static extern (C) ЦелУкз wxHtmlHelpController_GetFrame(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlHelpController wxHtmlHelpController;
public class HtmlHelpController : wxObject
{
    enum
    {
        wxHF_TOOLBAR =	0x0001,
        wxHF_CONTENTS =	0x0002,
        wxHF_INDEX =		0x0004,
        wxHF_SEARCH =		0x0008,
        wxHF_BOOKMARKS =	0x0010,
        wxHF_OPEN_FILES =	0x0020,
        wxHF_PRINT = 		0x0040,
        wxHF_FLAT_TOOLBAR =	0x0080,
        wxHF_MERGE_BOOKS =	0x0100,
        wxHF_ICONS_BOOK =	0x0200,
        wxHF_ICONS_BOOK_CHAPTER = 0x0400,
        wxHF_ICONS_FOLDER = 0x0000,
        wxHF_DEFAULT_STYLE =		(wxHF_TOOLBAR | wxHF_CONTENTS |
                                     wxHF_INDEX | wxHF_SEARCH |
                                     wxHF_BOOKMARKS | wxHF_PRINT),
        wxHF_OPENFILES =	wxHF_OPEN_FILES,
        wxHF_FLATTOOLBAR = 	wxHF_FLAT_TOOLBAR,
        wxHF_DEFAULTSTYLE =	wxHF_DEFAULT_STYLE,
    }
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел стиль = wxHF_DEFAULT_STYLE)
    {
        super(wxHtmlHelpController_ctor(стиль));
    }

    //-----------------------------------------------------------------------------

    public проц TitleFormat(ткст значение)
    {
        wxHtmlHelpController_SetTitleFormat(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц TempDir(ткст значение)
    {
        wxHtmlHelpController_SetTempDir(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул AddBook(ткст book_url)
    {
        return wxHtmlHelpController_AddBook(wxobj, book_url);
    }

    //-----------------------------------------------------------------------------

    public бул Display(ткст x)
    {
        return wxHtmlHelpController_Display(wxobj, x);
    }

    //-----------------------------------------------------------------------------

    public бул Display(цел ид)
    {
        return wxHtmlHelpController_DisplayInt(wxobj, ид);
    }

    //-----------------------------------------------------------------------------

    public бул DisplayContents()
    {
        return wxHtmlHelpController_DisplayContents(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул DisplayIndex()
    {
        return wxHtmlHelpController_DisplayIndex(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул KeywordSearch(ткст keyword)
    {
        return KeywordSearch(keyword, HelpSearchMode.wxHELP_SEARCH_ALL);
    }

    public бул KeywordSearch(ткст keyword, HelpSearchMode mode)
    {
        return wxHtmlHelpController_KeywordSearch(wxobj, keyword, cast(цел)mode);
    }

    //-----------------------------------------------------------------------------

    public проц UseConfig(Config config)
    {
        UseConfig(config, "");
    }

    public проц UseConfig(Config config, ткст rootpath)
    {
        wxHtmlHelpController_UseConfig(wxobj, wxObject.SafePtr(config), rootpath);
    }

    //-----------------------------------------------------------------------------

    public проц ReadCustomization(Config cfg)
    {
        ReadCustomization(cfg, "");
    }

    public проц ReadCustomization(Config cfg, ткст path)
    {
        wxHtmlHelpController_ReadCustomization(wxobj, wxObject.SafePtr(cfg), path);
    }

    //-----------------------------------------------------------------------------

    public проц WriteCustomization(Config cfg)
    {
        WriteCustomization(cfg, "");
    }

    public проц WriteCustomization(Config cfg, ткст path)
    {
        wxHtmlHelpController_WriteCustomization(wxobj, wxObject.SafePtr(cfg), path);
    }

    //-----------------------------------------------------------------------------

    public Frame frame()
    {
        ЦелУкз tmp = wxHtmlHelpController_GetFrame(wxobj);
        if ( tmp != ЦелУкз.init )
            return new Frame(tmp);
        else
            return null;
    }
}
