//-----------------------------------------------------------------------------
// wxD - АртПровайдер.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - АртПровайдер.cs
//
/// The wxArtProvider wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: АртПровайдер.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ArtProvider;
public import wx.common;
public import wx.Bitmap;
public import wx.Icon;
public import wx.Window;

public enum ПАртИД
{
    wxART_ADD_BOOKMARK = 1,
    wxART_DEL_BOOKMARK,
    wxART_HELP_SIDE_PANEL,
    wxART_HELP_SETTINGS,
    wxART_HELP_BOOK,
    wxART_HELP_FOLDER,
    wxART_HELP_PAGE,
    wxART_GO_BACK,
    wxART_GO_FORWARD,
    wxART_GO_UP,
    wxART_GO_DOWN,
    wxART_GO_TO_PARENT,
    wxART_GO_HOME,
    wxART_FILE_OPEN,
    wxART_PRINT,
    wxART_HELP,
    wxART_TIP,
    wxART_REPORT_VIEW,
    wxART_LIST_VIEW,
    wxART_NEW_DIR,
    wxART_FOLDER,
    wxART_GO_DIR_UP,
    wxART_EXECUTABLE_FILE,
    wxART_NORMAL_FILE,
    wxART_TICK_MARK,
    wxART_CROSS_MARK,
    wxART_ERROR,
    wxART_QUESTION,
    wxART_WARNING,
    wxART_INFORMATION,
    wxART_MISSING_IMAGE
}

//---------------------------------------------------------------------

public enum ПАртКлиент
{
    wxART_TOOLBAR = 1,
    wxART_MENU,
    wxART_FRAME_ICON,
    wxART_CMN_DIALOG,
    wxART_HELP_BROWSER,
    wxART_MESSAGE_BOX,
    wxART_BUTTON,
    wxART_OTHER
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxArtProvider_GetBitmap(цел artid, цел artclient, inout Размер Размер);
static extern (C) ЦелУкз wxArtProvider_GetIcon(цел artid, цел artclient, inout Размер Размер);
//! \endcond

//---------------------------------------------------------------------

alias АртПровайдер wxArtProvider;
public class АртПровайдер
{
    public static Битмап ДайБитмап(ПАртИД ид)
    {
        return ДайБитмап(ид, ПАртКлиент.wxART_OTHER, Окно.вхДефРазм);
    }

    public static Битмап ДайБитмап(ПАртИД ид, ПАртКлиент клиент)
    {
        return ДайБитмап(ид, клиент, Окно.вхДефРазм);
    }

    public static Битмап ДайБитмап(ПАртИД ид, ПАртКлиент клиент, Размер Размер)
    {
        return new Битмап(wxArtProvider_GetBitmap(cast(цел)ид, cast(цел)клиент, Размер));
    }

    //---------------------------------------------------------------------

    public static Пиктограмма ДайПиктограмму(ПАртИД ид)
    {
        return ДайПиктограмму(ид, ПАртКлиент.wxART_OTHER, Окно.вхДефРазм);
    }

    public static Пиктограмма ДайПиктограмму(ПАртИД ид, ПАртКлиент клиент)
    {
        return ДайПиктограмму(ид, клиент, Окно.вхДефРазм);
    }

    public static Пиктограмма ДайПиктограмму(ПАртИД ид, ПАртКлиент клиент, Размер Размер)
    {
        return new Пиктограмма(wxArtProvider_GetIcon(cast(цел)ид, cast(цел)клиент, Размер));
    }
}
