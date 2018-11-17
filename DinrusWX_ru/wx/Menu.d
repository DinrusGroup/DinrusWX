//-----------------------------------------------------------------------------
// wxD - Меню.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Меню.cs
//
/// The wxMenu wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Меню.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.Menu;
public import wx.common;
public import wx.Defs;
public import wx.Window;
public import wx.MenuItem;
public import wx.MenuBar;

//! \cond EXTERN
static extern (C) ЦелУкз wxMenuBase_ctor1(ткст titel, бцел стиль);
static extern (C) ЦелУкз wxMenuBase_ctor2(бцел стиль);

static extern (C) ЦелУкз wxMenuBase_Append(ЦелУкз сам, цел ид, ткст элт, ткст help, ItemKind kind);
static extern (C) ЦелУкз wxMenuBase_AppendSubMenu(ЦелУкз сам, цел ид, ткст элт, ЦелУкз subMenu, ткст help);
static extern (C) ЦелУкз wxMenuBase_AppendItem(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxMenuBase_AppendSeparator(ЦелУкз сам);
static extern (C) ЦелУкз wxMenuBase_AppendCheckItem(ЦелУкз сам, цел элтid, ткст текст, ткст help);
static extern (C) ЦелУкз wxMenuBase_AppendRadioItem(ЦелУкз сам, цел элтid, ткст текст, ткст help);
static extern (C) цел    wxMenuBase_GetMenuItemCount(ЦелУкз сам);
static extern (C) ЦелУкз wxMenuBase_GetMenuItem(ЦелУкз сам, цел index);
static extern (C) проц   wxMenuBase_Break(ЦелУкз сам);

static extern (C) ЦелУкз wxMenuBase_Insert(ЦелУкз сам, цел поз, ЦелУкз элт);
static extern (C) ЦелУкз wxMenuBase_Insert2(ЦелУкз сам, цел поз, цел элтid, ткст текст, ткст help, ItemKind kind);
static extern (C) ЦелУкз wxMenuBase_InsertSeparator(ЦелУкз сам, цел поз);
static extern (C) ЦелУкз wxMenuBase_InsertCheckItem(ЦелУкз сам, цел поз, цел элтid, ткст текст, ткст help);
static extern (C) ЦелУкз wxMenuBase_InsertRadioItem(ЦелУкз сам, цел поз, цел элтid, ткст текст, ткст help);
static extern (C) ЦелУкз wxMenuBase_InsertSubMenu(ЦелУкз сам, цел поз, цел элтid, ткст текст, ЦелУкз submenu, ткст help);

static extern (C) ЦелУкз wxMenuBase_Prepend(ЦелУкз сам, ЦелУкз элт);
static extern (C) ЦелУкз wxMenuBase_Prepend2(ЦелУкз сам, цел элтid, ткст текст, ткст help, ItemKind kind);
static extern (C) ЦелУкз wxMenuBase_PrependSeparator(ЦелУкз сам);
static extern (C) ЦелУкз wxMenuBase_PrependCheckItem(ЦелУкз сам, цел элтid, ткст текст, ткст help);
static extern (C) ЦелУкз wxMenuBase_PrependRadioItem(ЦелУкз сам, цел элтid, ткст текст, ткст help);
static extern (C) ЦелУкз wxMenuBase_PrependSubMenu(ЦелУкз сам, цел элтid, ткст текст, ЦелУкз submenu, ткст help);

static extern (C) ЦелУкз wxMenuBase_Remove(ЦелУкз сам, цел элтid);
static extern (C) ЦелУкз wxMenuBase_Remove2(ЦелУкз сам, ЦелУкз элт);

static extern (C) бул   wxMenuBase_Delete(ЦелУкз сам, цел элтid);
static extern (C) бул   wxMenuBase_Delete2(ЦелУкз сам, ЦелУкз элт);

static extern (C) бул   wxMenuBase_Destroy(ЦелУкз сам, цел элтid);
static extern (C) бул   wxMenuBase_Destroy2(ЦелУкз сам, ЦелУкз элт);

static extern (C) цел    wxMenuBase_FindItem(ЦелУкз сам, ткст элт);
static extern (C) ЦелУкз wxMenuBase_FindItem2(ЦелУкз сам, цел элтid, inout ЦелУкз меню);
static extern (C) ЦелУкз wxMenuBase_FindItemByPosition(ЦелУкз сам, цел position);

static extern (C) проц   wxMenuBase_Enable(ЦелУкз сам, цел элтid, бул вкл);
static extern (C) бул   wxMenuBase_IsEnabled(ЦелУкз сам, цел элтid);

static extern (C) проц   wxMenuBase_Check(ЦелУкз сам, цел ид, бул check);
static extern (C) бул   wxMenuBase_IsChecked(ЦелУкз сам, цел элтid);

static extern (C) проц   wxMenuBase_SetLabel(ЦелУкз сам, цел элтid, ткст ярлык);
static extern (C) ЦелУкз wxMenuBase_GetLabel(ЦелУкз сам, цел элтid);

static extern (C) проц   wxMenuBase_SetHelpString(ЦелУкз сам, цел элтid, ткст helpString);
static extern (C) ЦелУкз wxMenuBase_GetHelpString(ЦелУкз сам, цел элтid);

static extern (C) проц   wxMenuBase_SetTitle(ЦелУкз сам, ткст титул);
static extern (C) ЦелУкз wxMenuBase_GetTitle(ЦелУкз сам);

static extern (C) проц   wxMenuBase_SetInvokingWindow(ЦелУкз сам, ЦелУкз win);
static extern (C) ЦелУкз wxMenuBase_GetInvokingWindow(ЦелУкз сам);

static extern (C) бцел   wxMenuBase_GetStyle(ЦелУкз сам);

static extern (C) проц   wxMenuBase_SetEventHandler(ЦелУкз сам, ЦелУкз обработчик);
static extern (C) ЦелУкз wxMenuBase_GetEventHandler(ЦелУкз сам);

static extern (C) проц   wxMenuBase_UpdateUI(ЦелУкз сам, ЦелУкз source);

static extern (C) ЦелУкз wxMenuBase_GetMenuBar(ЦелУкз сам);

static extern (C) бул   wxMenuBase_IsAttached(ЦелУкз сам);

static extern (C) проц   wxMenuBase_SetParent(ЦелУкз сам, ЦелУкз родитель);
static extern (C) ЦелУкз wxMenuBase_GetParent(ЦелУкз сам);

static extern (C) ЦелУкз wxMenuBase_FindChildItem(ЦелУкз сам, цел элтid, out цел поз);
static extern (C) ЦелУкз wxMenuBase_FindChildItem2(ЦелУкз сам, цел элтid);
static extern (C) бул   wxMenuBase_SendEvent(ЦелУкз сам, цел элтid, цел xchecked);
//! \endcond

alias MenuBase wxMenuBase;
public class MenuBase : ОбработчикСоб
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел стиль = 0)
    {
        this(wxMenuBase_ctor2(cast(бцел)стиль));
    }

    public this(ткст titel, цел стиль = 0)
    {
        this(wxMenuBase_ctor1(titel, cast(бцел)стиль));
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Append(цел ид, ткст элт)
    {
        return this.Append(ид, элт, "");
    }

    public ЭлтМеню Append(цел ид, ткст элт, ткст help)
    {
        return Append(ид, элт, help, ItemKind.wxITEM_NORMAL);
    }

    public ЭлтМеню Append(цел ид, ткст элт, ткст help, ItemKind kind)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Append(wxobj, ид, элт, help, kind), &ЭлтМеню.New2);
    }

    public ЭлтМеню Append(цел ид, ткст элт, Меню subMenu)
    {
        return Append(ид, элт, subMenu, "");
    }

    public ЭлтМеню Append(цел ид, ткст элт, Меню subMenu, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_AppendSubMenu(wxobj, ид, элт, wxObject.SafePtr(subMenu), help), &ЭлтМеню.New2);
    }

    public ЭлтМеню Append(ЭлтМеню элт)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_AppendItem(wxobj, wxObject.SafePtr(элт)), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню AppendCheckItem(цел ид, ткст элт)
    {
        return AppendCheckItem(ид, элт, "");
    }

    public ЭлтМеню AppendCheckItem(цел ид, ткст элт, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_AppendCheckItem(wxobj, ид, элт, help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню AppendSeparator()
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_AppendSeparator(wxobj), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню AppendRadioItem(цел элтid, ткст текст)
    {
        return AppendRadioItem(элтid, текст, "");
    }

    public ЭлтМеню AppendRadioItem(цел элтid, ткст текст, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_AppendRadioItem(wxobj, элтid, текст, help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public проц Check(цел ид, бул check)
    {
        wxMenuBase_Check(wxobj, ид, check);
    }

    //---------------------------------------------------------------------

    public цел GetЭлтМенюCount()
    {
        return wxMenuBase_GetMenuItemCount(wxobj);
    }

    public ЭлтМеню GetЭлтМеню(цел index)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_GetMenuItem(wxobj, index), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public  проц Break()
    {
        wxMenuBase_Break(wxobj);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Insert(цел поз, ЭлтМеню элт)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Insert(wxobj, поз, wxObject.SafePtr(элт)), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Insert(цел поз, цел элтid, ткст текст)
    {
        return Insert(поз, элтid, текст, "", ItemKind.wxITEM_NORMAL);
    }

    public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, ткст help)
    {
        return Insert(поз, элтid, текст, help, ItemKind.wxITEM_NORMAL);
    }

    public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, ткст help, ItemKind kind)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Insert2(wxobj, поз, элтid, текст, help, kind), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню вставьРазделитель(цел поз)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_InsertSeparator(wxobj, поз), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню InsertCheckItem(цел поз, цел элтid, ткст текст)
    {
        return InsertCheckItem(поз, элтid, текст, "");
    }

    public ЭлтМеню InsertCheckItem(цел поз, цел элтid, ткст текст, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_InsertCheckItem(wxobj, поз, элтid, текст, help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню InsertRadioItem(цел поз, цел элтid, ткст текст)
    {
        return InsertCheckItem(поз, элтid, текст, "");
    }

    public ЭлтМеню InsertRadioItem(цел поз, цел элтid, ткст текст, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_InsertRadioItem(wxobj, поз, элтid, текст, help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, Меню submenu)
    {
        return Insert(поз, элтid, текст, submenu, "");
    }

    public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, Меню submenu, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_InsertSubMenu(wxobj, поз, элтid, текст, wxObject.SafePtr(submenu), help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Prepend(ЭлтМеню элт)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Prepend(wxobj, wxObject.SafePtr(элт)), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Prepend(цел элтid, ткст текст)
    {
        return Prepend(элтid, текст, "", ItemKind.wxITEM_NORMAL);
    }

    public ЭлтМеню Prepend(цел элтid, ткст текст, ткст help)
    {
        return Prepend(элтid, текст, help, ItemKind.wxITEM_NORMAL);
    }

    public ЭлтМеню Prepend(цел элтid, ткст текст, ткст help, ItemKind kind)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Prepend2(wxobj, элтid, текст, help, kind), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню PrependSeparator()
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_PrependSeparator(wxobj));
    }

    //---------------------------------------------------------------------

    public ЭлтМеню PrependCheckItem(цел элтid, ткст текст)
    {
        return PrependCheckItem(элтid, текст, "");
    }

    public ЭлтМеню PrependCheckItem(цел элтid, ткст текст, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_PrependCheckItem(wxobj, элтid, текст, help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню PrependRadioItem(цел элтid, ткст текст)
    {
        return PrependRadioItem(элтid, текст, "");
    }

    public ЭлтМеню PrependRadioItem(цел элтid, ткст текст, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_PrependRadioItem(wxobj, элтid, текст, help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Prepend(цел элтid, ткст текст, Меню submenu)
    {
        return Prepend(элтid, текст, submenu, "");
    }

    public ЭлтМеню Prepend(цел элтid, ткст текст, Меню submenu, ткст help)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_PrependSubMenu(wxobj, элтid, текст, wxObject.SafePtr(submenu), help), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню Удали(цел элтid)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Remove(wxobj, элтid), &ЭлтМеню.New2);
    }

    public ЭлтМеню Удали(ЭлтМеню элт)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_Remove2(wxobj, wxObject.SafePtr(элт)), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public бул Delete(цел элтid)
    {
        return wxMenuBase_Delete(wxobj, элтid);
    }

    public бул Delete(ЭлтМеню элт)
    {
        return wxMenuBase_Delete2(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public бул Разрушь(цел элтid)
    {
        return wxMenuBase_Destroy(wxobj, элтid);
    }

    public бул Разрушь(ЭлтМеню элт)
    {
        return wxMenuBase_Destroy2(wxobj, wxObject.SafePtr(элт));
    }

    //---------------------------------------------------------------------

    public  цел FindItem(ткст элт)
    {
        return wxMenuBase_FindItem(wxobj, элт);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню FindItem(цел элтid)
    {
        Меню menuRef = null;
        return FindItem(элтid, menuRef);
    }

    public ЭлтМеню FindItem(цел элтid, inout Меню меню)
    {
        ЦелУкз menuRef = ЦелУкз.init;
        if (меню)
        {
            menuRef = wxObject.SafePtr(меню);
        }
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_FindItem2(wxobj, элтid, menuRef), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public ЭлтМеню FindItemByPosition(цел position)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_FindItemByPosition(wxobj, position), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public проц Включи(цел элтid, бул вкл)
    {
        wxMenuBase_Enable(wxobj, элтid, вкл);
    }

    public бул IsEnabled(цел элтid)
    {
        return wxMenuBase_IsEnabled(wxobj, элтid);
    }

    //---------------------------------------------------------------------

    public бул IsChecked(цел элтid)
    {
        return wxMenuBase_IsChecked(wxobj, элтid);
    }

    //---------------------------------------------------------------------

    public проц УстЯрлык(цел элтid, ткст ярлык)
    {
        wxMenuBase_SetLabel(wxobj, элтid, ярлык);
    }

    public ткст ДайЯрлык(цел элтid)
    {
        return cast(ткст) new wxString(wxMenuBase_GetLabel(wxobj, элтid), да);
    }

    //---------------------------------------------------------------------

    public проц УстHelpString(цел элтid, ткст helpString)
    {
        wxMenuBase_SetHelpString(wxobj, элтid, helpString);
    }

    public ткст GetHelpString(цел элтid)
    {
        return cast(ткст) new wxString(wxMenuBase_GetHelpString(wxobj, элтid), да);
    }

    //---------------------------------------------------------------------

    public ткст Титул()
    {
        return cast(ткст) new wxString(wxMenuBase_GetTitle(wxobj), да);
    }
    public проц Титул(ткст значение)
    {
        wxMenuBase_SetTitle(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ОбработчикСоб ОбработчикСобытий()
    {
        //	return cast(ОбработчикСоб)НайдиОбъект(wxMenuBase_GetEventHandler(wxobj), &ОбработчикСоб.Нов);
        ЦелУкз ptr = wxMenuBase_GetEventHandler(wxobj);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(ОбработчикСоб)o;
        else return new ОбработчикСоб(ptr);
    }
    public проц ОбработчикСобытий(ОбработчикСоб значение)
    {
        wxMenuBase_SetEventHandler(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Окно InvokingWindow()
    {
        return cast(Окно)НайдиОбъект(wxMenuBase_GetInvokingWindow(wxobj), &Окно.Нов);
    }
    public проц InvokingWindow(Окно значение)
    {
        wxMenuBase_SetInvokingWindow(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public цел Стиль()
    {
        return cast(цел)wxMenuBase_GetStyle(wxobj);
    }

    //---------------------------------------------------------------------

    public проц UpdateUI()
    {
        UpdateUI(null);
    }

    public проц UpdateUI(ОбработчикСоб source)
    {
        wxMenuBase_UpdateUI(wxobj, wxObject.SafePtr(source));
    }

    //---------------------------------------------------------------------

    public MenuBar menuBar()
    {
        return cast(MenuBar)НайдиОбъект(wxMenuBase_GetMenuBar(wxobj), &MenuBar.Нов);
    }

    //---------------------------------------------------------------------

    public бул Attached()
    {
        return wxMenuBase_IsAttached(wxobj);
    }

    //---------------------------------------------------------------------

    public Меню родитель()
    {
        return cast(Меню)НайдиОбъект(wxMenuBase_GetParent(wxobj), &Меню.Нов);
    }
    public проц родитель(Меню значение)
    {
        wxMenuBase_SetParent(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public ЭлтМеню FindChildItem(цел элтid)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_FindChildItem2(wxobj, элтid), &ЭлтМеню.New2);
    }

    public ЭлтМеню FindChildItem(цел элтid, out цел поз)
    {
        return cast(ЭлтМеню)НайдиОбъект(wxMenuBase_FindChildItem(wxobj, элтid, поз), &ЭлтМеню.New2);
    }

    //---------------------------------------------------------------------

    public бул SendEvent(цел элтid)
    {
        return SendEvent(элтid, -1);
    }

    public бул SendEvent(цел элтid, цел xchecked)
    {
        return wxMenuBase_SendEvent(wxobj, элтid, xchecked);
    }
}

//---------------------------------------------------------------------
// helper struct, stores added EventListeners...

alias MenuListener wxMenuListener;
public class MenuListener
{
    public ДатчикСобытий listener;
    public wxObject owner;
    public цел ид;

    public this( цел ид, ДатчикСобытий listener, wxObject owner )
    {
        this.listener = listener;
        this.owner = owner;
        this.ид = ид;
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxMenu_ctor(ткст titel, бцел стиль);
static extern (C) ЦелУкз wxMenu_ctor2(бцел стиль);
//! \endcond

//---------------------------------------------------------------------

alias Меню wxMenu;
public class Меню : MenuBase
{
    public MenuListener[] eventListeners;

    // InvokingWindow does not work on Windows, so we
    // need this...
    private Окно родитель = null;

    // if events were connected with Frame.MenuBar or Окно.ВсплывающееМеню
    // that means with ConnectEvents(), we have a Invoking Окно and can add
    // the event directly to the ОбработчикСобытий
    private бул eventsconnected = false;

    //---------------------------------------------------------------------

    public this()
    {
        this(0);
    }

    public this(цел стиль)
    {
        this(wxMenu_ctor2(cast(бцел)стиль));
    }

    public this(ткст titel)
    {
        this(titel, 0);
    }

    public this(ткст titel, цел стиль)
    {
        this(wxMenu_ctor(titel, cast(бцел)стиль));
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Меню(wxobj);
    }

    //---------------------------------------------------------------------

    public проц AddEvent(цел inId, ДатчикСобытий el, wxObject owner)
    {
        // This is the only way of handling меню selection events (maybe there is an other solution)
        // But for now we have to add the ДатчикСобытий to the ОбработчикСобытий of the invoking окно,
        // otherwise nothing happens.
        // As цел as we do not have an invoking окно, which means, that for example the
        // MenuBar of this Меню isn't connected to a Frame, the ДатчикСобытий gets only
        // added to the СписокМассивов, otherwise it gets directly added to the ОбработчикСобытий of
        // the invoking окно. When Frame.MenuBar is set, it will call ConnectEvents()
        // for each Меню ; MenuBar
        eventListeners ~=  new MenuListener( inId, el, owner );

        if ( eventsconnected )
            родитель.AddCommandListener(Событие.wxEVT_COMMAND_MENU_SELECTED, inId, el, owner);
    }

    //---------------------------------------------------------------------
    // ConnectEvents gets only called from Окно and Frame

    public проц ConnectEvents(Окно родитель)
    {
        this.родитель = родитель;

        if ( eventListeners.length > 0 )
        {
            foreach( MenuListener ml ; eventListeners )
            {
                родитель.AddCommandListener(Событие.wxEVT_COMMAND_MENU_SELECTED, ml.ид, ml.listener, ml.owner);
            }
        }

        eventsconnected = да;
    }

    //---------------------------------------------------------------------

    // This is for faster coding ;) and closes request on SourceForge ;))))
    // WL stands for with listener
    public ЭлтМеню AppendWL(цел ид, ткст элт, ДатчикСобытий listener)
    {
        ЭлтМеню tmpэлт = Append(ид, элт, "");

        AddEvent( ид, listener, tmpэлт );

        return tmpэлт;
    }

    public ЭлтМеню AppendWL(цел ид, ткст элт, ткст help, ДатчикСобытий listener)
    {
        ЭлтМеню tmpэлт = Append(ид, элт, help, ItemKind.wxITEM_NORMAL);

        AddEvent( ид, listener, tmpэлт );

        return tmpэлт;
    }

    public ЭлтМеню AppendWL(цел ид, ткст элт, ткст help, ItemKind kind, ДатчикСобытий listener)
    {
        ЭлтМеню tmpэлт = Append(ид, элт, help, kind);

        AddEvent( ид, listener, tmpэлт );

        return tmpэлт;
    }

    public ЭлтМеню AppendWL(цел ид, ткст элт, Меню subMenu, ДатчикСобытий listener)
    {
        ЭлтМеню tmpэлт = Append(ид, элт, subMenu, "");

        AddEvent( ид, listener, tmpэлт );

        return tmpэлт;
    }

    public ЭлтМеню AppendWL(цел ид, ткст элт, Меню subMenu, ткст help, ДатчикСобытий listener)
    {
        ЭлтМеню tmpэлт = Append(ид, элт, subMenu, help);

        AddEvent( ид, listener, tmpэлт );

        return tmpэлт;
    }

    public ЭлтМеню AppendWL(ЭлтМеню элт, ДатчикСобытий listener)
    {
        ЭлтМеню tmpэлт = Append(элт);
        AddEvent(элт.ИД, listener, tmpэлт);
        return tmpэлт;
    }
}
