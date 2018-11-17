//-----------------------------------------------------------------------------
// wxD - Событие.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Событие.cs
//
/// The wxEvent wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Событие.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Event;
public import wx.common;

typedef цел ТипСобытия;

//! \cond EXTERN
static extern (C) ТипСобытия wxEvent_GetEventType(ЦелУкз сам);
static extern (C) цел    wxEvent_GetId(ЦелУкз сам);
static extern (C) бул   wxEvent_GetSkipped(ЦелУкз сам);
static extern (C) цел    wxEvent_GetTimestamp(ЦелУкз сам);
static extern (C) проц   wxEvent_Skip(ЦелУкз сам, бул skip);
static extern (C) ЦелУкз wxEvent_GetEventObject(ЦелУкз сам);
static extern (C) проц   wxEvent_SetEventObject(ЦелУкз сам, ЦелУкз object);

//---------------------------------------------------------------------
static extern (C) ТипСобытия wxEvent_EVT_NULL();
static extern (C) ТипСобытия wxEvent_EVT_IDLE();
static extern (C) ТипСобытия wxEvent_EVT_SOCKET();

static extern (C) ТипСобытия wxEvent_EVT_COMMAND_BUTTON_CLICKED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_CHECKBOX_CLICKED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_CHOICE_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOX_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOX_DOUBLECLICKED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_CHECKLISTBOX_TOGGLED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_UPDATED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_ENTER();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_URL();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_MAXLEN();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_MENU_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_SLIDER_UPDATED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_RADIOBOX_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_RADIOBUTTON_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_SCROLLBAR_UPDATED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_VLBOX_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_COMBOBOX_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TOOL_RCLICKED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TOOL_ENTER();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_SPINCTRL_UPDATED();

// Sockets and timers send events, too
static extern (C) ТипСобытия wxEvent_EVT_TIMER ();

// Mouse event types
static extern (C) ТипСобытия wxEvent_EVT_LEFT_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_LEFT_UP();
static extern (C) ТипСобытия wxEvent_EVT_MIDDLE_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_MIDDLE_UP();
static extern (C) ТипСобытия wxEvent_EVT_RIGHT_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_RIGHT_UP();
static extern (C) ТипСобытия wxEvent_EVT_MOTION();
static extern (C) ТипСобытия wxEvent_EVT_ENTER_WINDOW();
static extern (C) ТипСобытия wxEvent_EVT_LEAVE_WINDOW();
static extern (C) ТипСобытия wxEvent_EVT_LEFT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_MIDDLE_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_RIGHT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_SET_FOCUS();
static extern (C) ТипСобытия wxEvent_EVT_KILL_FOCUS();
static extern (C) ТипСобытия wxEvent_EVT_CHILD_FOCUS();
static extern (C) ТипСобытия wxEvent_EVT_MOUSEWHEEL();

// Non-клиент mouse events
static extern (C) ТипСобытия wxEvent_EVT_NC_LEFT_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_NC_LEFT_UP();
static extern (C) ТипСобытия wxEvent_EVT_NC_MIDDLE_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_NC_MIDDLE_UP();
static extern (C) ТипСобытия wxEvent_EVT_NC_RIGHT_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_NC_RIGHT_UP();
static extern (C) ТипСобытия wxEvent_EVT_NC_MOTION();
static extern (C) ТипСобытия wxEvent_EVT_NC_ENTER_WINDOW();
static extern (C) ТипСобытия wxEvent_EVT_NC_LEAVE_WINDOW();
static extern (C) ТипСобытия wxEvent_EVT_NC_LEFT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_NC_MIDDLE_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_NC_RIGHT_DCLICK();

// Character input event тип
static extern (C) ТипСобытия wxEvent_EVT_CHAR();
static extern (C) ТипСобытия wxEvent_EVT_CHAR_HOOK();
static extern (C) ТипСобытия wxEvent_EVT_NAVIGATION_KEY();
static extern (C) ТипСобытия wxEvent_EVT_KEY_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_KEY_UP();
version(wxUSE_HOTKEY)
{
    static extern (C) ТипСобытия wxEvent_EVT_HOTKEY();
}

// Уст курсор event
static extern (C) ТипСобытия wxEvent_EVT_SET_CURSOR();

// wxScrollbar and wxSlider event identifiers
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_TOP();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_BOTTOM();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_LINEUP();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_LINEDOWN();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_PAGEUP();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_PAGEDOWN();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_THUMBTRACK();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_THUMBRELEASE();
static extern (C) ТипСобытия wxEvent_EVT_SCROLL_ENDSCROLL();

// Scroll events from wxWindow
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_TOP();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_BOTTOM();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_LINEUP();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_LINEDOWN();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_PAGEUP();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_PAGEDOWN();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_THUMBTRACK();
static extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_THUMBRELEASE();

// System events
static extern (C) ТипСобытия wxEvent_EVT_SIZE();
static extern (C) ТипСобытия wxEvent_EVT_SIZING();
static extern (C) ТипСобытия wxEvent_EVT_MOVE();
static extern (C) ТипСобытия wxEvent_EVT_MOVING();
static extern (C) ТипСобытия wxEvent_EVT_CLOSE_WINDOW();
static extern (C) ТипСобытия wxEvent_EVT_END_SESSION();
static extern (C) ТипСобытия wxEvent_EVT_QUERY_END_SESSION();
static extern (C) ТипСобытия wxEvent_EVT_ACTIVATE_APP();
static extern (C) ТипСобытия wxEvent_EVT_POWER();
static extern (C) ТипСобытия wxEvent_EVT_ACTIVATE();
static extern (C) ТипСобытия wxEvent_EVT_CREATE();
static extern (C) ТипСобытия wxEvent_EVT_DESTROY();
static extern (C) ТипСобытия wxEvent_EVT_SHOW();
static extern (C) ТипСобытия wxEvent_EVT_ICONIZE();
static extern (C) ТипСобытия wxEvent_EVT_MAXIMIZE();
static extern (C) ТипСобытия wxEvent_EVT_MOUSE_CAPTURE_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_PAINT();
static extern (C) ТипСобытия wxEvent_EVT_ERASE_BACKGROUND();
static extern (C) ТипСобытия wxEvent_EVT_NC_PAINT();
static extern (C) ТипСобытия wxEvent_EVT_PAINT_ICON();
static extern (C) ТипСобытия wxEvent_EVT_MENU_OPEN();
static extern (C) ТипСобытия wxEvent_EVT_MENU_CLOSE();
static extern (C) ТипСобытия wxEvent_EVT_MENU_HIGHLIGHT();
static extern (C) ТипСобытия wxEvent_EVT_CONTEXT_MENU();
static extern (C) ТипСобытия wxEvent_EVT_SYS_COLOUR_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_DISPLAY_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_SETTING_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_QUERY_NEW_PALETTE();
static extern (C) ТипСобытия wxEvent_EVT_PALETTE_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_JOY_BUTTON_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_JOY_BUTTON_UP();
static extern (C) ТипСобытия wxEvent_EVT_JOY_MOVE();
static extern (C) ТипСобытия wxEvent_EVT_JOY_ZMOVE();
static extern (C) ТипСобытия wxEvent_EVT_DROP_FILES();
static extern (C) ТипСобытия wxEvent_EVT_DRAW_ITEM();
static extern (C) ТипСобытия wxEvent_EVT_MEASURE_ITEM();
static extern (C) ТипСобытия wxEvent_EVT_COMPARE_ITEM();
static extern (C) ТипСобытия wxEvent_EVT_INIT_DIALOG();
static extern (C) ТипСобытия wxEvent_EVT_UPDATE_UI();

// Generic command events
// Note: a click is a higher-level event than button down/up
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LEFT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LEFT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_RIGHT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_RIGHT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_SET_FOCUS();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_KILL_FOCUS();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_ENTER();

// Help events
static extern (C) ТипСобытия wxEvent_EVT_HELP();
static extern (C) ТипСобытия wxEvent_EVT_DETAILED_HELP();

//togglebtn
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TOGGLEBUTTON_CLICKED();
static extern (C) ТипСобытия wxEvent_EVT_OBJECTDELETED();

// calendar control
static extern (C) ТипСобытия wxEvent_EVT_CALENDAR_SEL_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_CALENDAR_DAY_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_CALENDAR_MONTH_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_CALENDAR_YEAR_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_CALENDAR_DOUBLECLICKED();
static extern (C) ТипСобытия wxEvent_EVT_CALENDAR_WEEKDAY_CLICKED();

// find_replace
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_NEXT();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_REPLACE();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_REPLACE_ALL();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_CLOSE();

static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_BEGIN_DRAG();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_BEGIN_RDRAG();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_BEGIN_LABEL_EDIT();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_END_LABEL_EDIT();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_DELETE_ITEM();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_GET_INFO();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_SET_INFO();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_EXPANDED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_EXPANDING();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_COLLAPSED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_COLLAPSING();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_SEL_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_SEL_CHANGING();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_KEY_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_ACTIVATED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_RIGHT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_MIDDLE_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_END_DRAG();

static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_BEGIN_DRAG();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_BEGIN_RDRAG();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_BEGIN_LABEL_EDIT();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_END_LABEL_EDIT();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_DELETE_ITEM();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_DELETE_ALL_ITEMS();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_GET_INFO();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_SET_INFO();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_SELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_DESELECTED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_ACTIVATED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_FOCUSED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_MIDDLE_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_RIGHT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_KEY_DOWN();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_INSERT_ITEM();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_RIGHT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_BEGIN_DRAG();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_DRAGGING();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_END_DRAG();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_CACHE_HINT();

static extern (C) ТипСобытия wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGING();

static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOOK_PAGE_CHANGED();
static extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOOK_PAGE_CHANGING();

version(__WXMSW__)
{
    static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TAB_SEL_CHANGED();
    static extern (C) ТипСобытия wxEvent_EVT_COMMAND_TAB_SEL_CHANGING();
}
static extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_LEFT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_RIGHT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_LEFT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_RIGHT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_LEFT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_RIGHT_CLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_LEFT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_RIGHT_DCLICK();
static extern (C) ТипСобытия wxEvent_EVT_GRID_ROW_SIZE();
static extern (C) ТипСобытия wxEvent_EVT_GRID_COL_SIZE();
static extern (C) ТипСобытия wxEvent_EVT_GRID_RANGE_SELECT();
static extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_CHANGE();
static extern (C) ТипСобытия wxEvent_EVT_GRID_SELECT_CELL();
static extern (C) ТипСобытия wxEvent_EVT_GRID_EDITOR_SHOWN();
static extern (C) ТипСобытия wxEvent_EVT_GRID_EDITOR_HIDDEN();
static extern (C) ТипСобытия wxEvent_EVT_GRID_EDITOR_CREATED();

static extern (C) ТипСобытия wxEvent_EVT_SASH_DRAGGED();

//layoutwin
static extern (C) ТипСобытия wxEvent_EVT_QUERY_LAYOUT_INFO();
static extern (C) ТипСобытия wxEvent_EVT_CALCULATE_LAYOUT();

//! \endcond
//---------------------------------------------------------------------

alias Событие wxEvent;
public class Событие : wxObject
{
    public static /*readonly*/ ТипСобытия wxEVT_NULL;

    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_BUTTON_CLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_CHECKBOX_CLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_CHOICE_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LISTBOX_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LISTBOX_DOUBLECLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_CHECKLISTBOX_TOGGLED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TEXT_UPDATED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TEXT_ENTER;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TEXT_URL;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TEXT_MAXLEN;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_MENU_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TOOL_CLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_SLIDER_UPDATED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_RADIOBOX_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_RADIOBUTTON_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_SCROLLBAR_UPDATED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_VLBOX_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_COMBOBOX_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TOOL_RCLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TOOL_ENTER;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_SPINCTRL_UPDATED;

    public static /*readonly*/ ТипСобытия wxEVT_SOCKET;
    public static /*readonly*/ ТипСобытия wxEVT_TIMER ;

    public static /*readonly*/ ТипСобытия wxEVT_LEFT_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_LEFT_UP;
    public static /*readonly*/ ТипСобытия wxEVT_MIDDLE_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_MIDDLE_UP;
    public static /*readonly*/ ТипСобытия wxEVT_RIGHT_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_RIGHT_UP;
    public static /*readonly*/ ТипСобытия wxEVT_MOTION;
    public static /*readonly*/ ТипСобытия wxEVT_ENTER_WINDOW;
    public static /*readonly*/ ТипСобытия wxEVT_LEAVE_WINDOW;
    public static /*readonly*/ ТипСобытия wxEVT_LEFT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_MIDDLE_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_RIGHT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_SET_FOCUS;
    public static /*readonly*/ ТипСобытия wxEVT_KILL_FOCUS;
    public static /*readonly*/ ТипСобытия wxEVT_CHILD_FOCUS;
    public static /*readonly*/ ТипСобытия wxEVT_MOUSEWHEEL;

    public static /*readonly*/ ТипСобытия wxEVT_NC_LEFT_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_NC_LEFT_UP;
    public static /*readonly*/ ТипСобытия wxEVT_NC_MIDDLE_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_NC_MIDDLE_UP;
    public static /*readonly*/ ТипСобытия wxEVT_NC_RIGHT_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_NC_RIGHT_UP;
    public static /*readonly*/ ТипСобытия wxEVT_NC_MOTION;
    public static /*readonly*/ ТипСобытия wxEVT_NC_ENTER_WINDOW;
    public static /*readonly*/ ТипСобытия wxEVT_NC_LEAVE_WINDOW;
    public static /*readonly*/ ТипСобытия wxEVT_NC_LEFT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_NC_MIDDLE_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_NC_RIGHT_DCLICK;

    public static /*readonly*/ ТипСобытия wxEVT_CHAR;
    public static /*readonly*/ ТипСобытия wxEVT_CHAR_HOOK;
    public static /*readonly*/ ТипСобытия wxEVT_NAVIGATION_KEY;
    public static /*readonly*/ ТипСобытия wxEVT_KEY_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_KEY_UP;
    version(wxUSE_HOTKEY)
    {
        public static /*readonly*/ ТипСобытия wxEVT_HOTKEY;
    }

    public static /*readonly*/ ТипСобытия wxEVT_SET_CURSOR;

    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_TOP;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_BOTTOM;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_LINEUP;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_LINEDOWN;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_PAGEUP;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_PAGEDOWN;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_THUMBTRACK;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_THUMBRELEASE;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLL_ENDSCROLL;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_TOP;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_BOTTOM;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_LINEUP;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_LINEDOWN;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_PAGEUP;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_PAGEDOWN;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_THUMBTRACK;
    public static /*readonly*/ ТипСобытия wxEVT_SCROLLWIN_THUMBRELEASE;
    public static /*readonly*/ ТипСобытия wxEVT_SIZE;
    public static /*readonly*/ ТипСобытия wxEVT_MOVE;
    public static /*readonly*/ ТипСобытия wxEVT_CLOSE_WINDOW;
    public static /*readonly*/ ТипСобытия wxEVT_END_SESSION;
    public static /*readonly*/ ТипСобытия wxEVT_QUERY_END_SESSION;
    public static /*readonly*/ ТипСобытия wxEVT_ACTIVATE_APP;
    public static /*readonly*/ ТипСобытия wxEVT_POWER;
    public static /*readonly*/ ТипСобытия wxEVT_ACTIVATE;
    public static /*readonly*/ ТипСобытия wxEVT_CREATE;
    public static /*readonly*/ ТипСобытия wxEVT_DESTROY;
    public static /*readonly*/ ТипСобытия wxEVT_SHOW;
    public static /*readonly*/ ТипСобытия wxEVT_ICONIZE;
    public static /*readonly*/ ТипСобытия wxEVT_MAXIMIZE;
    public static /*readonly*/ ТипСобытия wxEVT_MOUSE_CAPTURE_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_PAINT;
    public static /*readonly*/ ТипСобытия wxEVT_ERASE_BACKGROUND;
    public static /*readonly*/ ТипСобытия wxEVT_NC_PAINT;
    public static /*readonly*/ ТипСобытия wxEVT_PAINT_ICON;
    public static /*readonly*/ ТипСобытия wxEVT_MENU_OPEN;
    public static /*readonly*/ ТипСобытия wxEVT_MENU_CLOSE;
    public static /*readonly*/ ТипСобытия wxEVT_MENU_HIGHLIGHT;
    public static /*readonly*/ ТипСобытия wxEVT_CONTEXT_MENU;
    public static /*readonly*/ ТипСобытия wxEVT_SYS_COLOUR_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_DISPLAY_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_SETTING_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_QUERY_NEW_PALETTE;
    public static /*readonly*/ ТипСобытия wxEVT_PALETTE_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_JOY_BUTTON_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_JOY_BUTTON_UP;
    public static /*readonly*/ ТипСобытия wxEVT_JOY_MOVE;
    public static /*readonly*/ ТипСобытия wxEVT_JOY_ZMOVE;
    public static /*readonly*/ ТипСобытия wxEVT_DROP_FILES;
    public static /*readonly*/ ТипСобытия wxEVT_DRAW_ITEM;
    public static /*readonly*/ ТипСобытия wxEVT_MEASURE_ITEM;
    public static /*readonly*/ ТипСобытия wxEVT_COMPARE_ITEM;
    public static /*readonly*/ ТипСобытия wxEVT_INIT_DIALOG;
    public static /*readonly*/ ТипСобытия wxEVT_IDLE;
    public static /*readonly*/ ТипСобытия wxEVT_UPDATE_UI;
    public static /*readonly*/ ТипСобытия wxEVT_SIZING;
    public static /*readonly*/ ТипСобытия wxEVT_MOVING;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LEFT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LEFT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_RIGHT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_RIGHT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_SET_FOCUS;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_KILL_FOCUS;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_ENTER;
    public static /*readonly*/ ТипСобытия wxEVT_HELP;
    public static /*readonly*/ ТипСобытия wxEVT_DETAILED_HELP;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TOGGLEBUTTON_CLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_OBJECTDELETED;

    public static /*readonly*/ ТипСобытия wxEVT_CALENDAR_SEL_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_CALENDAR_DAY_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_CALENDAR_MONTH_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_CALENDAR_YEAR_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_CALENDAR_DOUBLECLICKED;
    public static /*readonly*/ ТипСобытия wxEVT_CALENDAR_WEEKDAY_CLICKED;

    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_FIND;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_FIND_NEXT;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_FIND_REPLACE;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_FIND_REPLACE_ALL;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_FIND_CLOSE;

    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_BEGIN_DRAG;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_BEGIN_RDRAG;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_BEGIN_LABEL_EDIT;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_END_LABEL_EDIT;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_DELETE_ITEM;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_GET_INFO;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_SET_INFO;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_EXPANDED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_EXPANDING;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_COLLAPSED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_COLLAPSING;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_SEL_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_SEL_CHANGING;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_KEY_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_ACTIVATED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_RIGHT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_ITEM_MIDDLE_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TREE_END_DRAG;

    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_BEGIN_DRAG;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_BEGIN_RDRAG;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_END_LABEL_EDIT;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_DELETE_ITEM;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_GET_INFO;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_SET_INFO;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_ITEM_SELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_ITEM_DESELECTED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_ITEM_ACTIVATED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_ITEM_FOCUSED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_KEY_DOWN;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_INSERT_ITEM;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_COL_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_COL_RIGHT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_COL_BEGIN_DRAG;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_COL_DRAGGING;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_COL_END_DRAG;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LIST_CACHE_HINT;

    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING;

    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LISTBOOK_PAGE_CHANGED;
    public static /*readonly*/ ТипСобытия wxEVT_COMMAND_LISTBOOK_PAGE_CHANGING;

    version(__WXMSW__)
    {
        public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TAB_SEL_CHANGED;
        public static /*readonly*/ ТипСобытия wxEVT_COMMAND_TAB_SEL_CHANGING;
    }
    public static /*readonly*/ ТипСобытия wxEVT_GRID_CELL_LEFT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_CELL_RIGHT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_CELL_LEFT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_CELL_RIGHT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_LABEL_LEFT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_LABEL_RIGHT_CLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_LABEL_LEFT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_LABEL_RIGHT_DCLICK;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_ROW_SIZE;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_COL_SIZE;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_RANGE_SELECT;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_CELL_CHANGE;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_SELECT_CELL;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_EDITOR_SHOWN;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_EDITOR_HIDDEN;
    public static /*readonly*/ ТипСобытия wxEVT_GRID_EDITOR_CREATED;

    public static /*readonly*/ ТипСобытия wxEVT_SASH_DRAGGED;

    public static /*readonly*/ ТипСобытия wxEVT_QUERY_LAYOUT_INFO;
    public static /*readonly*/ ТипСобытия wxEVT_CALCULATE_LAYOUT;

    static this()
    {
        wxEVT_NULL = wxEvent_EVT_NULL();

        wxEVT_COMMAND_BUTTON_CLICKED = wxEvent_EVT_COMMAND_BUTTON_CLICKED();
        wxEVT_COMMAND_CHECKBOX_CLICKED = wxEvent_EVT_COMMAND_CHECKBOX_CLICKED();
        wxEVT_COMMAND_CHOICE_SELECTED = wxEvent_EVT_COMMAND_CHOICE_SELECTED();
        wxEVT_COMMAND_LISTBOX_SELECTED = wxEvent_EVT_COMMAND_LISTBOX_SELECTED();
        wxEVT_COMMAND_LISTBOX_DOUBLECLICKED = wxEvent_EVT_COMMAND_LISTBOX_DOUBLECLICKED();
        wxEVT_COMMAND_CHECKLISTBOX_TOGGLED = wxEvent_EVT_COMMAND_CHECKLISTBOX_TOGGLED();
        wxEVT_COMMAND_MENU_SELECTED = wxEvent_EVT_COMMAND_MENU_SELECTED();
        wxEVT_COMMAND_SLIDER_UPDATED = wxEvent_EVT_COMMAND_SLIDER_UPDATED();
        wxEVT_COMMAND_RADIOBOX_SELECTED = wxEvent_EVT_COMMAND_RADIOBOX_SELECTED();
        wxEVT_COMMAND_RADIOBUTTON_SELECTED = wxEvent_EVT_COMMAND_RADIOBUTTON_SELECTED();
        wxEVT_COMMAND_SCROLLBAR_UPDATED = wxEvent_EVT_COMMAND_SCROLLBAR_UPDATED();
        wxEVT_COMMAND_VLBOX_SELECTED = wxEvent_EVT_COMMAND_VLBOX_SELECTED();
        wxEVT_COMMAND_COMBOBOX_SELECTED = wxEvent_EVT_COMMAND_COMBOBOX_SELECTED();
        wxEVT_COMMAND_TOOL_RCLICKED = wxEvent_EVT_COMMAND_TOOL_RCLICKED();
        wxEVT_COMMAND_TOOL_ENTER = wxEvent_EVT_COMMAND_TOOL_ENTER();
        wxEVT_COMMAND_SPINCTRL_UPDATED = wxEvent_EVT_COMMAND_SPINCTRL_UPDATED();

        wxEVT_COMMAND_TOOL_CLICKED = wxEVT_COMMAND_MENU_SELECTED;

        wxEVT_COMMAND_TEXT_UPDATED = wxEvent_EVT_COMMAND_TEXT_UPDATED();
        wxEVT_COMMAND_TEXT_ENTER = wxEvent_EVT_COMMAND_TEXT_ENTER();
        wxEVT_COMMAND_TEXT_URL = wxEvent_EVT_COMMAND_TEXT_URL();
        wxEVT_COMMAND_TEXT_MAXLEN = wxEvent_EVT_COMMAND_TEXT_MAXLEN();

        wxEVT_SOCKET = wxEvent_EVT_SOCKET();
        wxEVT_TIMER  = wxEvent_EVT_TIMER ();

        wxEVT_LEFT_DOWN = wxEvent_EVT_LEFT_DOWN();
        wxEVT_LEFT_UP = wxEvent_EVT_LEFT_UP();
        wxEVT_MIDDLE_DOWN = wxEvent_EVT_MIDDLE_DOWN();
        wxEVT_MIDDLE_UP = wxEvent_EVT_MIDDLE_UP();
        wxEVT_RIGHT_DOWN = wxEvent_EVT_RIGHT_DOWN();
        wxEVT_RIGHT_UP = wxEvent_EVT_RIGHT_UP();
        wxEVT_MOTION = wxEvent_EVT_MOTION();
        wxEVT_ENTER_WINDOW = wxEvent_EVT_ENTER_WINDOW();
        wxEVT_LEAVE_WINDOW = wxEvent_EVT_LEAVE_WINDOW();
        wxEVT_LEFT_DCLICK = wxEvent_EVT_LEFT_DCLICK();
        wxEVT_MIDDLE_DCLICK = wxEvent_EVT_MIDDLE_DCLICK();
        wxEVT_RIGHT_DCLICK = wxEvent_EVT_RIGHT_DCLICK();
        wxEVT_SET_FOCUS = wxEvent_EVT_SET_FOCUS();
        wxEVT_KILL_FOCUS = wxEvent_EVT_KILL_FOCUS();
        wxEVT_CHILD_FOCUS = wxEvent_EVT_CHILD_FOCUS();
        wxEVT_MOUSEWHEEL = wxEvent_EVT_MOUSEWHEEL();

        wxEVT_NC_LEFT_DOWN = wxEvent_EVT_NC_LEFT_DOWN();
        wxEVT_NC_LEFT_UP = wxEvent_EVT_NC_LEFT_UP();
        wxEVT_NC_MIDDLE_DOWN = wxEvent_EVT_NC_MIDDLE_DOWN();
        wxEVT_NC_MIDDLE_UP = wxEvent_EVT_NC_MIDDLE_UP();
        wxEVT_NC_RIGHT_DOWN = wxEvent_EVT_NC_RIGHT_DOWN();
        wxEVT_NC_RIGHT_UP = wxEvent_EVT_NC_RIGHT_UP();
        wxEVT_NC_MOTION = wxEvent_EVT_NC_MOTION();
        wxEVT_NC_ENTER_WINDOW = wxEvent_EVT_NC_ENTER_WINDOW();
        wxEVT_NC_LEAVE_WINDOW = wxEvent_EVT_NC_LEAVE_WINDOW();
        wxEVT_NC_LEFT_DCLICK = wxEvent_EVT_NC_LEFT_DCLICK();
        wxEVT_NC_MIDDLE_DCLICK = wxEvent_EVT_NC_MIDDLE_DCLICK();
        wxEVT_NC_RIGHT_DCLICK = wxEvent_EVT_NC_RIGHT_DCLICK();

        wxEVT_CHAR = wxEvent_EVT_CHAR();
        wxEVT_CHAR_HOOK = wxEvent_EVT_CHAR_HOOK();
        wxEVT_NAVIGATION_KEY = wxEvent_EVT_NAVIGATION_KEY();
        wxEVT_KEY_DOWN = wxEvent_EVT_KEY_DOWN();
        wxEVT_KEY_UP = wxEvent_EVT_KEY_UP();
        version(wxUSE_HOTKEY)
        {
            wxEVT_HOTKEY = wxEvent_HOTKEY();
        }

        wxEVT_SET_CURSOR = wxEvent_EVT_SET_CURSOR();

        wxEVT_SCROLL_TOP = wxEvent_EVT_SCROLL_TOP();
        wxEVT_SCROLL_BOTTOM = wxEvent_EVT_SCROLL_BOTTOM();
        wxEVT_SCROLL_LINEUP = wxEvent_EVT_SCROLL_LINEUP();
        wxEVT_SCROLL_LINEDOWN = wxEvent_EVT_SCROLL_LINEDOWN();
        wxEVT_SCROLL_PAGEUP = wxEvent_EVT_SCROLL_PAGEUP();
        wxEVT_SCROLL_PAGEDOWN = wxEvent_EVT_SCROLL_PAGEDOWN();
        wxEVT_SCROLL_THUMBTRACK = wxEvent_EVT_SCROLL_THUMBTRACK();
        wxEVT_SCROLL_THUMBRELEASE = wxEvent_EVT_SCROLL_THUMBRELEASE();
        wxEVT_SCROLL_ENDSCROLL = wxEvent_EVT_SCROLL_ENDSCROLL();

        wxEVT_SCROLLWIN_TOP = wxEvent_EVT_SCROLLWIN_TOP();
        wxEVT_SCROLLWIN_BOTTOM = wxEvent_EVT_SCROLLWIN_BOTTOM();
        wxEVT_SCROLLWIN_LINEUP = wxEvent_EVT_SCROLLWIN_LINEUP();
        wxEVT_SCROLLWIN_LINEDOWN = wxEvent_EVT_SCROLLWIN_LINEDOWN();
        wxEVT_SCROLLWIN_PAGEUP = wxEvent_EVT_SCROLLWIN_PAGEUP();
        wxEVT_SCROLLWIN_PAGEDOWN = wxEvent_EVT_SCROLLWIN_PAGEDOWN();
        wxEVT_SCROLLWIN_THUMBTRACK = wxEvent_EVT_SCROLLWIN_THUMBTRACK();
        wxEVT_SCROLLWIN_THUMBRELEASE = wxEvent_EVT_SCROLLWIN_THUMBRELEASE();

        wxEVT_SIZE = wxEvent_EVT_SIZE();
        wxEVT_SIZING = wxEvent_EVT_SIZING();
        wxEVT_MOVE = wxEvent_EVT_MOVE();
        wxEVT_MOVING = wxEvent_EVT_MOVING();
        wxEVT_CLOSE_WINDOW = wxEvent_EVT_CLOSE_WINDOW();
        wxEVT_END_SESSION = wxEvent_EVT_END_SESSION();
        wxEVT_QUERY_END_SESSION = wxEvent_EVT_QUERY_END_SESSION();
        wxEVT_ACTIVATE_APP = wxEvent_EVT_ACTIVATE_APP();
        wxEVT_POWER = wxEvent_EVT_POWER();
        wxEVT_ACTIVATE = wxEvent_EVT_ACTIVATE();
        wxEVT_CREATE = wxEvent_EVT_CREATE();
        wxEVT_DESTROY = wxEvent_EVT_DESTROY();
        wxEVT_SHOW = wxEvent_EVT_SHOW();
        wxEVT_ICONIZE = wxEvent_EVT_ICONIZE();
        wxEVT_MAXIMIZE = wxEvent_EVT_MAXIMIZE();
        wxEVT_MOUSE_CAPTURE_CHANGED = wxEvent_EVT_MOUSE_CAPTURE_CHANGED();
        wxEVT_PAINT = wxEvent_EVT_PAINT();
        wxEVT_ERASE_BACKGROUND = wxEvent_EVT_ERASE_BACKGROUND();
        wxEVT_NC_PAINT = wxEvent_EVT_NC_PAINT();
        wxEVT_PAINT_ICON = wxEvent_EVT_PAINT_ICON();
        wxEVT_MENU_OPEN = wxEvent_EVT_MENU_OPEN();
        wxEVT_MENU_CLOSE = wxEvent_EVT_MENU_CLOSE();
        wxEVT_MENU_HIGHLIGHT = wxEvent_EVT_MENU_HIGHLIGHT();
        wxEVT_CONTEXT_MENU = wxEvent_EVT_CONTEXT_MENU();
        wxEVT_SYS_COLOUR_CHANGED = wxEvent_EVT_SYS_COLOUR_CHANGED();
        wxEVT_DISPLAY_CHANGED = wxEvent_EVT_DISPLAY_CHANGED();
        wxEVT_SETTING_CHANGED = wxEvent_EVT_SETTING_CHANGED();
        wxEVT_QUERY_NEW_PALETTE = wxEvent_EVT_QUERY_NEW_PALETTE();
        wxEVT_PALETTE_CHANGED = wxEvent_EVT_PALETTE_CHANGED();
        wxEVT_JOY_BUTTON_DOWN = wxEvent_EVT_JOY_BUTTON_DOWN();
        wxEVT_JOY_BUTTON_UP = wxEvent_EVT_JOY_BUTTON_UP();
        wxEVT_JOY_MOVE = wxEvent_EVT_JOY_MOVE();
        wxEVT_JOY_ZMOVE = wxEvent_EVT_JOY_ZMOVE();
        wxEVT_DROP_FILES = wxEvent_EVT_DROP_FILES();
        wxEVT_DRAW_ITEM = wxEvent_EVT_DRAW_ITEM();
        wxEVT_MEASURE_ITEM = wxEvent_EVT_MEASURE_ITEM();
        wxEVT_COMPARE_ITEM = wxEvent_EVT_COMPARE_ITEM();
        wxEVT_INIT_DIALOG = wxEvent_EVT_INIT_DIALOG();
        wxEVT_IDLE = wxEvent_EVT_IDLE();
        wxEVT_UPDATE_UI = wxEvent_EVT_UPDATE_UI();

        wxEVT_COMMAND_LEFT_CLICK = wxEvent_EVT_COMMAND_LEFT_CLICK();
        wxEVT_COMMAND_LEFT_DCLICK = wxEvent_EVT_COMMAND_LEFT_DCLICK();
        wxEVT_COMMAND_RIGHT_CLICK = wxEvent_EVT_COMMAND_RIGHT_CLICK();
        wxEVT_COMMAND_RIGHT_DCLICK = wxEvent_EVT_COMMAND_RIGHT_DCLICK();
        wxEVT_COMMAND_SET_FOCUS = wxEvent_EVT_COMMAND_SET_FOCUS();
        wxEVT_COMMAND_KILL_FOCUS = wxEvent_EVT_COMMAND_KILL_FOCUS();
        wxEVT_COMMAND_ENTER = wxEvent_EVT_COMMAND_ENTER();

        wxEVT_HELP = wxEvent_EVT_HELP();
        wxEVT_DETAILED_HELP = wxEvent_EVT_DETAILED_HELP();

        wxEVT_COMMAND_TOGGLEBUTTON_CLICKED = wxEvent_EVT_COMMAND_TOGGLEBUTTON_CLICKED();

        wxEVT_OBJECTDELETED = wxEvent_EVT_OBJECTDELETED();







    }

    //---------------------------------------------------------------------

    alias static Событие function(ЦелУкз wxobj) newfunc;

    protected static newfunc[ТипСобытия] funcmap;

    //---------------------------------------------------------------------
    private static Событие Нов(ЦелУкз объ);

    //---------------------------------------------------------------------

    public static проц ДобавьТипСоб(ТипСобытия evt, newfunc func)
    {
        funcmap[evt]= func;
    }

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public static Событие CreateFrom(ЦелУкз wxEvent)
    {
        // Check to see if this event тип is in the тип map

        ТипСобытия evtType = wxEvent_GetEventType(wxEvent);
        newfunc* func = evtType in funcmap;

        // If so, create an instance of the specified тип

        Событие e;
        if (func)
            e = (*func)(wxEvent);
        else
            e = new Событие(wxEvent);

        return e;
    }

    //---------------------------------------------------------------------

    public ТипСобытия типСобытия()
    {
        return wxEvent_GetEventType(wxobj);
    }

    //---------------------------------------------------------------------

    public цел ИД()
    {
        return wxEvent_GetId(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Skip()
    {
        Skip(да);
    }

    public проц Skip(бул skip)
    {
        wxEvent_Skip(wxobj, skip);
    }

    //---------------------------------------------------------------------

    public бул Skipped()
    {
        return wxEvent_GetSkipped(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Timestamp()
    {
        return wxEvent_GetTimestamp(wxobj);
    }

    //---------------------------------------------------------------------

    public wxObject EventObject()
    {
        return НайдиОбъект(wxEvent_GetEventObject(wxobj));
    }

    public проц EventObject(wxObject объ)
    {
        wxEvent_SetEventObject(wxobj, объ.wxobj);
    }

    //---------------------------------------------------------------------

    public ЦелУкз EventIntPtr()
    {
        return wxEvent_GetEventObject(wxobj);
    }

    public проц EventIntPtr(ЦелУкз ptr)
    {
        return wxEvent_SetEventObject(wxobj, ptr);
    }

}
