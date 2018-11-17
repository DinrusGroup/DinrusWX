//-----------------------------------------------------------------------------
// wxD - Frame.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Frame.cs
//
/// The wxFrame wrapper class.
//
// Written by Jason Perkins (jason@379.com), Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Frame.d,v 1.12 2008/11/04 14:29:16 afb Exp $
//-----------------------------------------------------------------------------

module wx.Frame;
public import wx.common;
public import wx.Window;
public import wx.ToolBar;
public import wx.MenuBar;
public import wx.StatusBar;
public import wx.Icon;

//! \cond EXTERN
static extern (C) ЦелУкз wxFrame_ctor();
static extern (C) бул   wxFrame_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);

static extern (C) ЦелУкз wxFrame_CreateStatusBar(ЦелУкз сам, цел number, бцел стиль, цел ид, ткст имя);

static extern (C) проц   wxFrame_SendSizeEvent(ЦелУкз сам);

static extern (C) проц   wxFrame_SetIcon(ЦелУкз сам, ЦелУкз пиктограмма);

static extern (C) проц   wxFrame_SetMenuBar(ЦелУкз сам, ЦелУкз menuBar);
static extern (C) ЦелУкз wxFrame_GetMenuBar(ЦелУкз сам);

static extern (C) проц   wxFrame_SetStatusText(ЦелУкз сам, ткст текст, цел number);

static extern (C) ЦелУкз wxFrame_CreateToolBar(ЦелУкз сам, бцел стиль, цел ид, ткст имя);
static extern (C) ЦелУкз wxFrame_GetToolBar(ЦелУкз сам);
static extern (C) проц   wxFrame_SetToolBar(ЦелУкз сам, ЦелУкз toolbar);

static extern (C) бул   wxFrame_ShowFullScreen(ЦелУкз сам, бул покажи, бцел стиль);
static extern (C) бул   wxFrame_IsFullScreen(ЦелУкз сам);

static extern (C) ЦелУкз wxFrame_GetStatusBar(ЦелУкз wxobj);
static extern (C) проц   wxFrame_SetStatusBar(ЦелУкз wxobj, ЦелУкз statusbar);

static extern (C) цел    wxFrame_GetStatusBarPane(ЦелУкз wxobj);
static extern (C) проц   wxFrame_SetStatusBarPane(ЦелУкз wxobj, цел n);

static extern (C) проц   wxFrame_SetStatusWidths(ЦелУкз сам, цел n, цел* widths);

static extern (C) проц   wxFrame_Iconize(ЦелУкз wxobj, бул iconize);
static extern (C) бул   wxFrame_IsIconized(ЦелУкз wxobj);

static extern (C) проц   wxFrame_Maximize(ЦелУкз wxobj, бул maximize);
static extern (C) бул   wxFrame_IsMaximized(ЦелУкз wxobj);

//static extern (C) бул   wxFrame_SetShape(ЦелУкз сам, ЦелУкз region);

static extern (C) проц   wxFrame_GetClientAreaOrigin(ЦелУкз сам, inout Точка тчк);
//! \endcond

//---------------------------------------------------------------------

alias Frame wxFrame;
/// A frame is a окно whose Размер and position can (usually) be
/// changed by the user. It usually has thick borders and a титул bar,
/// and can optionally contain a меню bar, toolbar and status bar.
/// A frame can contain any окно that is not a frame or dialog.
public class Frame : Окно
{
    public const цел wxFULLSCREEN_NOMENUBAR   = 0x0001;
    public const цел wxFULLSCREEN_NOTOOLBAR   = 0x0002;
    public const цел wxFULLSCREEN_NOSTATUSBAR = 0x0004;
    public const цел wxFULLSCREEN_NOBORDER    = 0x0008;
    public const цел wxFULLSCREEN_NOCAPTION   = 0x0010;
    public const цел wxFULLSCREEN_ALL         =
        wxFULLSCREEN_NOMENUBAR | wxFULLSCREEN_NOTOOLBAR |
        wxFULLSCREEN_NOSTATUSBAR | wxFULLSCREEN_NOBORDER |
        wxFULLSCREEN_NOCAPTION;

    //-----------------------------------------------------------------------------
    const ткст wxFrameNameStr="frame";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxFrame_ctor());
    }

    public this(Окно родитель, цел ид, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this(wxFrame_ctor());
        if (!создай(родитель, ид, титул, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать Frame");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this(родитель, Окно.УникИД, титул, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxFrame_Create(wxobj, wxObject.SafePtr(родитель), ид, титул, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    // Helper constructors

    public this(ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE)
    {
        this(null, -1, титул, поз, Размер, стиль);
    }

    //---------------------------------------------------------------------

    public бул ShowFullScreen(бул покажи, цел стиль)
    {
        return wxFrame_ShowFullScreen(wxobj, покажи, cast(бцел)стиль);
    }

    public бул ShowFullScreen(бул покажи)
    {
        return ShowFullScreen(покажи, wxFULLSCREEN_ALL);
    }

    public бул IsFullScreen()
    {
        return wxFrame_IsFullScreen(wxobj);
    }

    //---------------------------------------------------------------------

    public StatusBar CreateStatusBar()
    {
        return CreateStatusBar(1, 0, -1, "statusBar");
    }

    public StatusBar CreateStatusBar(цел number)
    {
        return CreateStatusBar(number, 0, -1, "statusBar");
    }

    public StatusBar CreateStatusBar(цел number, цел стиль)
    {
        return CreateStatusBar(number, стиль, -1, "statusBar");
    }

    public StatusBar CreateStatusBar(цел number, цел стиль, цел ид)
    {
        return CreateStatusBar(number, стиль, ид, "statusBar");
    }

    public StatusBar CreateStatusBar(цел number, цел стиль, цел ид, ткст имя)
    {
        return new StatusBar(wxFrame_CreateStatusBar(wxobj, number, cast(бцел)стиль, ид, имя));
    }

    public StatusBar statusBar()
    {
        return cast(StatusBar)НайдиОбъект(wxFrame_GetStatusBar(wxobj), &StatusBar.Нов);
    }
    public проц statusBar(StatusBar значение)
    {
        wxFrame_SetStatusBar(wxobj, wxObject.SafePtr(значение));
    }

    public цел StatusBarPane()
    {
        return wxFrame_GetStatusBarPane(wxobj);
    }
    public проц StatusBarPane(цел значение)
    {
        wxFrame_SetStatusBarPane(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц SendSizeEvent()
    {
        wxFrame_SendSizeEvent(wxobj);
    }

    //---------------------------------------------------------------------

    public проц пиктограмма(Пиктограмма значение)
    {
        wxFrame_SetIcon(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public проц menuBar(MenuBar значение)
    {
        wxFrame_SetMenuBar(wxobj, wxObject.SafePtr(значение));
        // add меню events...
        if (значение)
        {
            for ( цел i = 0; i < menuBar.MenuCount; ++i )
            {
                Меню меню = значение.GetMenu(i);
                меню.ConnectEvents(this);
            }
        }
    }
    public MenuBar menuBar()
    {
        return cast(MenuBar)НайдиОбъект(wxFrame_GetMenuBar(wxobj), &MenuBar.Нов);
    }

    //---------------------------------------------------------------------

    public проц StatusText(ткст значение)
    {
        УстStatusText(значение);
    }

    public проц УстStatusText(ткст текст)
    {
        УстStatusText(текст, 0);
    }

    public проц УстStatusText(ткст текст, цел number)
    {
        wxFrame_SetStatusText(wxobj, текст, number);
    }

    //---------------------------------------------------------------------

    public проц StatusWidths(цел[] значение)
    {
        УстStatusWidths(значение.length, значение);
    }

    public проц УстStatusWidths(цел n, цел[] widths)
    {
        wxFrame_SetStatusWidths(wxobj, n, widths.ptr);
    }

    //---------------------------------------------------------------------

    public ТулБар CreateToolBar()
    {
        return CreateToolBar(/*ПБордюр.*/wxNO_BORDER | ТулБар.wxTB_HORIZONTAL, -1, "toolBar");
    }
    public ТулБар CreateToolBar(цел стиль)
    {
        return CreateToolBar(стиль, -1, "toolBar");
    }
    public ТулБар CreateToolBar(цел стиль, цел ид)
    {
        return CreateToolBar(стиль, ид, "toolBar");
    }

    public ТулБар CreateToolBar(цел стиль, цел ид, ткст имя)
    {
        return new ТулБар(wxFrame_CreateToolBar(wxobj, cast(бцел)стиль, ид, имя));
    }

    public ТулБар тулБар()
    {
        return cast(ТулБар)НайдиОбъект(wxFrame_GetToolBar(wxobj));
    }
    public проц тулБар(ТулБар значение)
    {
        wxFrame_SetToolBar(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public бул Iconized()
    {
        return wxFrame_IsIconized(wxobj);
    }
    public проц Iconized(бул значение)
    {
        wxFrame_Iconize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул Maximized()
    {
        return wxFrame_IsMaximized(wxobj);
    }
    public проц Maximized(бул значение)
    {
        wxFrame_Maximize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    /*public бул УстShape(wx.Region region)
    {
    	return wxFrame_SetShape(wxobj, wxObject.SafePtr(region));
    }*/

    //---------------------------------------------------------------------

    public override Точка ИсходнаяЗоныКлиента()
    {
        Точка тчк;
        wxFrame_GetClientAreaOrigin(wxobj, тчк);
        return тчк;
    }


    override public  бул Закрой()
    {
        return wxWindow_Close(wxobj, false);
    }

    override public  бул Закрой(бул сила)
    {
        return wxWindow_Close(wxobj, сила);
    }
}
