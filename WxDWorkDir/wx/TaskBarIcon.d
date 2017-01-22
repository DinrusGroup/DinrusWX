//-----------------------------------------------------------------------------
// wxD - TaskBarIcon.d
// (C) 2007
// 
/// wxTaskBarIcon, represents a taskbar иконка.
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

extern (C) {
alias ЦУк function (TaskBarIcon) Virtual_CreatePopupMenu;
}
		
//! \cond EXTERN
static extern (C) ЦУк wxTaskBarIcon_ctor();
static extern (C) ЦУк wxTaskBarIcon_ctor2(цел iconType);
static extern (C) проц   wxTaskBarIcon_RegisterVirtual(ЦУк сам, TaskBarIcon объ, 
	Virtual_CreatePopupMenu popmenu);
static extern (C) ЦУк wxTaskBarIcon_dtor(ЦУк сам);

static extern (C) ЦУк wxTaskBarIcon_BaseCreatePopupMenu(ЦУк сам);
static extern (C) бул wxTaskBarIcon_IsIconInstalled(ЦУк сам);
static extern (C) бул wxTaskBarIcon_IsOk(ЦУк сам);
static extern (C) бул wxTaskBarIcon_PopupMenu(ЦУк сам, ЦУк меню);
static extern (C) бул wxTaskBarIcon_RemoveIcon(ЦУк сам);
static extern (C) бул wxTaskBarIcon_SetIcon(ЦУк сам, ЦУк иконка, ткст tooltip);
//! \endcond

//! \cond EXTERN
static extern (C) ЦУк wxTaskBarIconEvent_ctor(цел commandType, ЦУк tbIcon);
static extern (C) ЦУк wxTaskBarIconEvent_Clone(ЦУк сам);
//! \endcond
		
//-----------------------------------------------------------------------------

alias TaskBarIconType wxTaskBarIconType;
/// тип of taskbar элемент to create
enum TaskBarIconType
{
	 DEFAULT_TYPE
}

alias TaskBarIcon wxTaskBarIcon;
public class TaskBarIcon : EvtHandler
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
		{ this(wxTaskBarIcon_ctor(), да); }

	public this(TaskBarIconType iconType)
		{ this(wxTaskBarIcon_ctor2(cast(цел)iconType), да); }

	public this(ЦУк шхобъ) 
	{
		super(шхобъ);

		wxTaskBarIcon_RegisterVirtual(шхобъ, this, &staticCreatePopupMenu);
	}
		
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;

		wxTaskBarIcon_RegisterVirtual(шхобъ, this, &staticCreatePopupMenu);
	}

	override protected проц dtor() { wxTaskBarIcon_dtor(шхобъ); }
		
	//---------------------------------------------------------------------
		
	static extern(C) private ЦУк staticCreatePopupMenu(TaskBarIcon объ)
	{
		return wxObject.SafePtr(объ.CreatePopupMenu());
	}
	protected /+virtual+/ Меню CreatePopupMenu()
	{
		return cast(Меню)FindObject(wxTaskBarIcon_BaseCreatePopupMenu(шхобъ));
	}

	//---------------------------------------------------------------------
		
	public бул IsIconInstalled()
	{
		return wxTaskBarIcon_IsIconInstalled(шхобъ);
	}

	public бул IsOk()
	{
		return wxTaskBarIcon_IsOk(шхобъ);
	}

	public бул PopupMenu(Меню меню)
	{
		return wxTaskBarIcon_PopupMenu(шхобъ, wxObject.SafePtr(меню));
	}

	public бул RemoveIcon()
	{
		return wxTaskBarIcon_RemoveIcon(шхобъ);
	}

	public бул SetIcon(Icon иконка, ткст tooltip = "")
	{
		return wxTaskBarIcon_SetIcon(шхобъ, wxObject.SafePtr(иконка), tooltip);
	}

	public проц Move_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_MOVE, значение, this); }
	public проц Move_Remove(EventListener значение) { RemoveHandler(значение, this); }

	public проц LeftDown_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_LEFT_DOWN, значение, this); }
	public проц LeftDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

	public проц LeftUp_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_LEFT_UP, значение, this); }
	public проц LeftUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

	public проц RightDown_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_RIGHT_DOWN, значение, this); }
	public проц RightDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

	public проц RightUp_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_RIGHT_UP, значение, this); }
	public проц RightUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

	public проц LeftDClick_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_LEFT_DCLICK, значение, this); }
	public проц LeftDClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

	public проц RightDClick_Add(EventListener значение) { AddEventListener(wxEVT_TASKBAR_RIGHT_DCLICK, значение, this); }
	public проц RightDClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
}

alias TaskBarIconEvent wxTaskBarIconEvent;
public class TaskBarIconEvent : Событие
{
	public this(ЦУк шхобъ)
		{ super(шхобъ); }

	public this(ТипСобытия тип, TaskBarIcon tbIcon)
		{ super(wxTaskBarIconEvent_ctor(тип, wxObject.SafePtr(tbIcon))); }

	public Событие Clone()
	{
		return new TaskBarIconEvent(wxTaskBarIconEvent_Clone(шхобъ));
	}

	private static Событие Нов(ЦУк объ) { return new TaskBarIconEvent(объ); }
}
