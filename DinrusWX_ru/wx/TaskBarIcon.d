//-----------------------------------------------------------------------------
// wxD - TaskBarIcon.d
// (C) 2007
//
/// wxTaskBarIcon, represents a taskbar пиктограмма.
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TaskBarIcon.d,v 1.2 2007/09/08 09:21:54 afb Exp $
//-----------------------------------------------------------------------------

module wx.TaskBarIcon;
public import wx.common;
public import wx.EvtHandler;
public import wx.Icon;
public import wx.Menu;

//! \cond EXTERN
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_MOVE();
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_LEFT_DOWN();
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_LEFT_UP();
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_RIGHT_DOWN();
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_RIGHT_UP();
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_LEFT_DCLICK();
static extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_RIGHT_DCLICK();
//! \endcond

extern (C)
{
    alias ЦелУкз function (TaskBarIcon) Virtual_CreatePopupMenu;
}

//! \cond EXTERN
static extern (C) ЦелУкз wxTaskBarIcon_ctor();
static extern (C) ЦелУкз wxTaskBarIcon_ctor2(цел iconType);
static extern (C) проц   wxTaskBarIcon_RegisterVirtual(ЦелУкз сам, TaskBarIcon объ,
        Virtual_CreatePopupMenu popmenu);
static extern (C) ЦелУкз wxTaskBarIcon_dtor(ЦелУкз сам);

static extern (C) ЦелУкз wxTaskBarIcon_BaseCreatePopupMenu(ЦелУкз сам);
static extern (C) бул wxTaskBarIcon_IsIconInstalled(ЦелУкз сам);
static extern (C) бул wxTaskBarIcon_IsOk(ЦелУкз сам);
static extern (C) бул wxTaskBarIcon_PopupMenu(ЦелУкз сам, ЦелУкз меню);
static extern (C) бул wxTaskBarIcon_RemoveIcon(ЦелУкз сам);
static extern (C) бул wxTaskBarIcon_SetIcon(ЦелУкз сам, ЦелУкз пиктограмма, ткст tooltip);
//! \endcond

//! \cond EXTERN
static extern (C) ЦелУкз wxTaskBarIconEvent_ctor(цел типКоманды, ЦелУкз tbIcon);
static extern (C) ЦелУкз wxTaskBarIconEvent_Clone(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias TaskBarIconType wxTaskBarIconType;
/// тип of taskbar элт to create
enum TaskBarIconType
{
    DEFAULT_TYPE
}

alias TaskBarIcon wxTaskBarIcon;
public class TaskBarIcon : ОбработчикСоб
{
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_MOVE;
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_LEFT_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_LEFT_UP;
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_RIGHT_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_RIGHT_UP;
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_LEFT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_TASKBAR_RIGHT_DCLICK;

    static this()
    {
        wxEVT_TASKBAR_MOVE = wxTaskBarIcon_EVT_TASKBAR_MOVE();
        wxEVT_TASKBAR_LEFT_DOWN = wxTaskBarIcon_EVT_TASKBAR_LEFT_DOWN();
        wxEVT_TASKBAR_LEFT_UP = wxTaskBarIcon_EVT_TASKBAR_LEFT_UP();
        wxEVT_TASKBAR_RIGHT_DOWN = wxTaskBarIcon_EVT_TASKBAR_RIGHT_DOWN();
        wxEVT_TASKBAR_RIGHT_UP = wxTaskBarIcon_EVT_TASKBAR_RIGHT_UP();
        wxEVT_TASKBAR_LEFT_DCLICK = wxTaskBarIcon_EVT_TASKBAR_LEFT_DCLICK();
        wxEVT_TASKBAR_RIGHT_DCLICK = wxTaskBarIcon_EVT_TASKBAR_RIGHT_DCLICK();

        Событие.ДобавьТипСоб(wxEVT_TASKBAR_MOVE,         &TaskBarIconEvent.Нов);
        Событие.ДобавьТипСоб(wxEVT_TASKBAR_LEFT_DOWN,    &TaskBarIconEvent.Нов);
        Событие.ДобавьТипСоб(wxEVT_TASKBAR_LEFT_UP,      &TaskBarIconEvent.Нов);
        Событие.ДобавьТипСоб(wxEVT_TASKBAR_RIGHT_DOWN,   &TaskBarIconEvent.Нов);
        Событие.ДобавьТипСоб(wxEVT_TASKBAR_RIGHT_UP,     &TaskBarIconEvent.Нов);
        Событие.ДобавьТипСоб(wxEVT_TASKBAR_LEFT_DCLICK,  &TaskBarIconEvent.Нов);
        Событие.ДобавьТипСоб(wxEVT_TASKBAR_RIGHT_DCLICK, &TaskBarIconEvent.Нов);
    }

    public this()
    {
        this(wxTaskBarIcon_ctor(), да);
    }

    public this(TaskBarIconType iconType)
    {
        this(wxTaskBarIcon_ctor2(cast(цел)iconType), да);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);

        wxTaskBarIcon_RegisterVirtual(wxobj, this, &staticCreatePopupMenu);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;

        wxTaskBarIcon_RegisterVirtual(wxobj, this, &staticCreatePopupMenu);
    }

    override protected проц dtor()
    {
        wxTaskBarIcon_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    static extern(C) private ЦелУкз staticCreatePopupMenu(TaskBarIcon объ)
    {
        return wxObject.SafePtr(объ.CreatePopupMenu());
    }
    protected  Меню CreatePopupMenu()
    {
        return cast(Меню)НайдиОбъект(wxTaskBarIcon_BaseCreatePopupMenu(wxobj));
    }

    //---------------------------------------------------------------------

    public бул IsIconInstalled()
    {
        return wxTaskBarIcon_IsIconInstalled(wxobj);
    }

    public бул Ок()
    {
        return wxTaskBarIcon_IsOk(wxobj);
    }

    public бул ВсплывающееМеню(Меню меню)
    {
        return wxTaskBarIcon_PopupMenu(wxobj, wxObject.SafePtr(меню));
    }

    public бул RemoveIcon()
    {
        return wxTaskBarIcon_RemoveIcon(wxobj);
    }

    public бул УстIcon(Пиктограмма пиктограмма, ткст tooltip = "")
    {
        return wxTaskBarIcon_SetIcon(wxobj, wxObject.SafePtr(пиктограмма), tooltip);
    }

    public проц Move_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_MOVE, значение, this);
    }
    public проц Move_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц LeftDown_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_LEFT_DOWN, значение, this);
    }
    public проц LeftDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц LeftUp_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_LEFT_UP, значение, this);
    }
    public проц LeftUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц RightDown_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_RIGHT_DOWN, значение, this);
    }
    public проц RightDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц RightUp_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_RIGHT_UP, значение, this);
    }
    public проц RightUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц LeftDClick_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_LEFT_DCLICK, значение, this);
    }
    public проц LeftDClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц RightDClick_Add(ДатчикСобытий значение)
    {
        AddEventListener(wxEVT_TASKBAR_RIGHT_DCLICK, значение, this);
    }
    public проц RightDClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

alias TaskBarIconEvent wxTaskBarIconEvent;
public class TaskBarIconEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия тип, TaskBarIcon tbIcon)
    {
        super(wxTaskBarIconEvent_ctor(тип, wxObject.SafePtr(tbIcon)));
    }

    public Событие Clone()
    {
        return new TaskBarIconEvent(wxTaskBarIconEvent_Clone(wxobj));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new TaskBarIconEvent(объ);
    }
}
