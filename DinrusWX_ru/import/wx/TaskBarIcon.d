module wx.TaskBarIcon;
public import wx.common;
public import wx.EvtHandler;
public import wx.Icon;
public import wx.Menu;

//! \cond EXTERN
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_MOVE();
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_LEFT_DOWN();
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_LEFT_UP();
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_RIGHT_DOWN();
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_RIGHT_UP();
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_LEFT_DCLICK();
static extern (C) EventType wxTaskBarIcon_EVT_TASKBAR_RIGHT_DCLICK();
//! \endcond

extern (C) {
alias IntPtr function (TaskBarIcon) Virtual_CreatePopupMenu;
}
		
//! \cond EXTERN
static extern (C) IntPtr wxTaskBarIcon_ctor();
static extern (C) IntPtr wxTaskBarIcon_ctor2(цел iconType);
static extern (C) проц   wxTaskBarIcon_RegisterVirtual(IntPtr сам, TaskBarIcon объ, 
	Virtual_CreatePopupMenu popmenu);
static extern (C) IntPtr wxTaskBarIcon_dtor(IntPtr сам);

static extern (C) IntPtr wxTaskBarIcon_BaseCreatePopupMenu(IntPtr сам);
static extern (C) бул wxTaskBarIcon_IsIconInstalled(IntPtr сам);
static extern (C) бул wxTaskBarIcon_IsOk(IntPtr сам);
static extern (C) бул wxTaskBarIcon_PopupMenu(IntPtr сам, IntPtr меню);
static extern (C) бул wxTaskBarIcon_RemoveIcon(IntPtr сам);
static extern (C) бул wxTaskBarIcon_SetIcon(IntPtr сам, IntPtr пиктограмма, ткст tooltip);
//! \endcond

//! \cond EXTERN
static extern (C) IntPtr wxTaskBarIconEvent_ctor(цел типКоманды, IntPtr tbIcon);
static extern (C) IntPtr wxTaskBarIconEvent_Clone(IntPtr сам);
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
	public static /*readonly*/ EventType wxEVT_TASKBAR_MOVE;
	public static /*readonly*/ EventType wxEVT_TASKBAR_LEFT_DOWN;
	public static /*readonly*/ EventType wxEVT_TASKBAR_LEFT_UP;
	public static /*readonly*/ EventType wxEVT_TASKBAR_RIGHT_DOWN;
	public static /*readonly*/ EventType wxEVT_TASKBAR_RIGHT_UP;
	public static /*readonly*/ EventType wxEVT_TASKBAR_LEFT_DCLICK;
	public static /*readonly*/ EventType wxEVT_TASKBAR_RIGHT_DCLICK;

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

	public this();
	public this(TaskBarIconType iconType);
	public this(IntPtr wxobj) ;
	private this(IntPtr wxobj, бул memOwn);
	override protected проц dtor();
	static extern(C) private IntPtr staticCreatePopupMenu(TaskBarIcon объ);
	protected  Меню CreatePopupMenu();
	public бул IsIconInstalled();
	public бул Ок();
	public бул ВсплывающееМеню(Меню меню);
	public бул RemoveIcon();
	public бул УстIcon(Пиктограмма пиктограмма, ткст tooltip = "");
	public проц Move_Add(ДатчикСобытий значение) ;
	public проц Move_Remove(ДатчикСобытий значение) ;
	public проц LeftDown_Add(ДатчикСобытий значение) ;
	public проц LeftDown_Remove(ДатчикСобытий значение) ;
	public проц LeftUp_Add(ДатчикСобытий значение) ;
	public проц LeftUp_Remove(ДатчикСобытий значение) ;
	public проц RightDown_Add(ДатчикСобытий значение) ;
	public проц RightDown_Remove(ДатчикСобытий значение) ;
	public проц RightUp_Add(ДатчикСобытий значение) ;
	public проц RightUp_Remove(ДатчикСобытий значение) ;
	public проц LeftDClick_Add(ДатчикСобытий значение);
	public проц LeftDClick_Remove(ДатчикСобытий значение) ;
	public проц RightDClick_Add(ДатчикСобытий значение) ;
	public проц RightDClick_Remove(ДатчикСобытий значение);
}

alias TaskBarIconEvent wxTaskBarIconEvent;
public class TaskBarIconEvent : Событие
{
	public this(IntPtr wxobj);
	public this(EventType тип, TaskBarIcon tbIcon);
	public Событие Clone();
	private static Событие Нов(IntPtr объ);
}
