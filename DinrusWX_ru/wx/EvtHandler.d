//-----------------------------------------------------------------------------
// wxD - ОбработчикСоб.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ОбработчикСоб.cs
//
/// The wxEvtHandler wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ОбработчикСоб.d,v 1.15 2008/05/07 06:15:51 afb Exp $
//-----------------------------------------------------------------------------

// TODO:	Change handling of removing EventListeners. If a listener gets
//		removed and then readded it will not be added to the end but at
//		the same position of listeners. This is because of the clientdata
//		that the event proxy gets...

module wx.EvtHandler;
public import wx.common;
public import wx.Event;
public import wx.TaskBarIcon;
private import wx.App;

alias проц delegate(Объект отправитель, Событие e) ДатчикСобытий;

//! \cond VERSION
version(WXD_STYLEDTEXTCTRL)
//! \endcond
public import wx.StyledTextCtrl;

//---------------------------------------------------------------------

public class SListener
{
    public ДатчикСобытий listener;
    public wxObject owner;
    public цел ТипСобытия;
    public бул активен;

    public this( ДатчикСобытий listener, wxObject owner, цел ТипСобытия )
    {
        this.listener = listener;
        this.owner = owner;
        this.ТипСобытия = ТипСобытия;
        активен = да;
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(ОбработчикСоб объ,ЦелУкз wxEvent, цел iListener) EvtMarshalDelegate;
}

struct clientdata
{
    EvtMarshalDelegate listener;
    wxObject объ;
};

//		extern (C) {
//		alias проц function() ObjectDeletedHandler;
//		}
//
//		public ObjectDeletedHandler ObjectDeleted;


static extern (C) проц wxEvtHandler_proxy(ЦелУкз сам, clientdata* data);
static extern (C) проц wxEvtHandler_Connect(ЦелУкз сам, цел evtType, цел ид, цел lastId, цел iListener);

static extern (C) бул wxEvtHandler_ProcessEvent(ЦелУкз сам, ЦелУкз evt);

static extern (C) проц wxEvtHandler_AddPendingEvent(ЦелУкз сам, ЦелУкз evt);
//! \endcond


alias ОбработчикСоб wxEvtHandler;
/// A class that can handle events from the windowing system.
/// wxWindow (and therefore all окно classes) are derived from this
/// class.
public class ОбработчикСоб : wxObject
{
    private SListener[] listeners;

    clientdata data;
    //---------------------------------------------------------------------

    // We store hard references to event handlers, since wxWidgets will
    // clean them up.
    private static ОбработчикСоб[ЦелУкз] evtHandlers;

    //---------------------------------------------------------------------

    //---------------------------------------------------------------------

    /*private*/public this(ЦелУкз wxobj)
    {
        super(wxobj);

        data.объ = this;
        data.listener = &staticMarshalEvent;

        //	lock (typeid(ОбработчикСоб))
        {
            wxEvtHandler_proxy(wxobj, &data);

            AddEventListener(Событие.wxEVT_OBJECTDELETED, &OnObjectDeleted);

            AddEvtHander(this);
        }
    }

    //---------------------------------------------------------------------

    ~this()
    {
        RemoveEvtHandler(wxobj);
    }

    //---------------------------------------------------------------------

    public проц AddCommandListener(цел типСобытия, цел ид, ДатчикСобытий listener)
    {
        AddCommandRangeListener(типСобытия, ид, -1, listener);
    }

    public проц AddCommandListener(цел типСобытия, цел ид, ДатчикСобытий listener, wxObject owner)
    {
        AddCommandRangeListener(типСобытия, ид, -1, listener, owner);
    }

    //---------------------------------------------------------------------

    public проц AddCommandRangeListener(цел типСобытия, цел ид, цел lastId, ДатчикСобытий listener)
    {
        // I must keep a reference to the listener to prevent it from
        // being garbage collected. I had trouble passing the listener
        // delegate into C and back (.NET threw a runtime error, Mono
        // crashed) so I pass the index into the listeners массив instead.
        // Works like a charm so far.
        listeners ~= new SListener(listener, null, типСобытия);
        wxEvtHandler_Connect(wxobj, типСобытия, ид, lastId, listeners.length - 1);
    }

    public проц AddCommandRangeListener(цел типСобытия, цел ид, цел lastId, ДатчикСобытий listener, wxObject owner)
    {
        // I must keep a reference to the listener to prevent it from
        // being garbage collected. I had trouble passing the listener
        // delegate into C and back (.NET threw a runtime error, Mono
        // crashed) so I pass the index into the listeners массив instead.
        // Works like a charm so far.

        // first we check if the listener is already in listeners
        // this can happen, when RemoveHandler gets called
        // if found, just set активен to да and return
        foreach( SListener sl; listeners )
        {
            if ( sl.owner is owner && sl.listener == listener && sl.ТипСобытия == типСобытия )
            {
                sl.активен = да;
            }
        }

        listeners ~= new SListener(listener, owner, типСобытия);
        wxEvtHandler_Connect(wxobj, типСобытия, ид, lastId, listeners.length - 1);
    }

    //---------------------------------------------------------------------

    public проц AddEventListener(цел типСобытия, ДатчикСобытий listener)
    {
        AddCommandRangeListener(типСобытия, -1, -1, listener);
    }

    public проц AddEventListener(цел типСобытия, ДатчикСобытий listener, wxObject owner)
    {
        AddCommandRangeListener(типСобытия, -1, -1, listener, owner);
    }

    //---------------------------------------------------------------------

    public проц AddMenuListener(цел ид, ДатчикСобытий listener)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_MENU_SELECTED, ид, listener);
    }

    public проц AddMenuListener(цел ид, ДатчикСобытий listener, wxObject owner)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_MENU_SELECTED, ид, listener, owner);
    }

    //---------------------------------------------------------------------

    public бул ProcessEvent(Событие evt)
    {
        return wxEvtHandler_ProcessEvent(wxobj, wxObject.SafePtr(evt));
    }

    //---------------------------------------------------------------------
    // This method doesn't do a real disconnect it only sets the активен
    // flag to false, if it finds it in listeners.
    // MarshalEvent then doesn't call the listener

    public бул RemoveHandler(ДатчикСобытий listener, wxObject owner)
    {
        foreach( SListener sl; listeners )
        {
            if ( sl.listener == listener && sl.owner is owner && sl.активен )
            {
                sl.активен = false;
                return да;
            }
        }

        return false;
    }

    //---------------------------------------------------------------------

    public проц AddPendingEvent(Событие evt)
    {
        wxEvtHandler_AddPendingEvent(wxobj, wxObject.SafePtr(evt));
    }

    //---------------------------------------------------------------------

    // All listened-for events are received here. The event code is
    // mapped to an actual Событие тип, and then the listener ДатчикСобытий lsnrtion
    // is called.

    static extern (C) private проц staticMarshalEvent(ОбработчикСоб объ, ЦелУкз wxEvent, цел iListner)
    {
        объ.MarshalEvent(wxEvent,iListner);
    }
    private проц MarshalEvent(ЦелУкз wxEvent, цел iListener)
    {
        // создай an appropriate .NET wrapper for the event object
        assert(wxEvent!=ЦелУкз.init);

        Событие e = Событие.CreateFrom(wxEvent);

        // Send it off to the registered listener
        SListener listener = listeners[iListener];

        // only iterate through the list if listener.owner != null
        // Only the new event system can handle more then one ДатчикСобытий
        // because the ДатчикСобытий gets connected via its owner and not
        // via a Frame, Dialog, etc...
        try
        {
            if ( listener.owner )
            {
                цел i = 0;
                foreach ( SListener sl; listeners )
                {
                    // continue if listener equals sl, because it will be handled below
                    if ( listener == sl ) continue;

                    // if there is the same object in the list with the same
                    // ТипСобытия then call its listener also
                    if ( sl.owner )
                    {
                        if ( sl.owner is listener.owner && sl.ТипСобытия == listener.ТипСобытия )
                        {
                            if ( sl.активен ) sl.listener(this, e);
                        }
                    }
                }
            }

            if ( listener.активен ) listener.listener(this, e);
        }
        catch(Exception e)
        {
            Апп.ДайАпп().ловиИскл(e);
            Апп.ДайАпп().ВыйдиИзГлавнЦикла();
        }
    }

    //---------------------------------------------------------------------

    // This обработчик is called whenever an object's associated C++ instance
    // is deleted, so that any C# references can be cleaned up.

    private /*static*/ проц OnObjectDeleted(Объект отправитель, Событие evt)
    {
        ОбработчикСоб evthandler = cast(ОбработчикСоб) отправитель;

//			if ( evthandler.ObjectDeleted )
//				evthandler.ObjectDeleted();

        RemoveEvtHandler(evt.EventIntPtr);
    }

    //---------------------------------------------------------------------

    private static проц AddEvtHander(ОбработчикСоб eh)
    {
        if (eh.wxobj != ЦелУкз.init && !(eh.wxobj in evtHandlers))
        {
            evtHandlers[eh.wxobj] = eh;
        }
    }

    private static проц RemoveEvtHandler(ЦелУкз ptr)
    {
        if ( ptr != ЦелУкз.init)
        {
            evtHandlers.remove(ptr);
            RemoveObject(ptr);
            ptr = ЦелУкз.init;
        }
    }

    //---------------------------------------------------------------------

    public проц EVT_SIZE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_SIZE, lsnr);
    }
    public проц EVT_CLOSE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_CLOSE_WINDOW, lsnr);
    }
    public проц EVT_PAINT(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_PAINT, lsnr);
    }
    public проц EVT_ERASE_BACKGROUND(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_ERASE_BACKGROUND, lsnr);
    }
    public проц EVT_IDLE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_IDLE, lsnr);
    }
    public проц EVT_MOVE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MOVE, lsnr);
    }
    public проц EVT_SOCKET(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_SOCKET, lsnr);
    }
    public проц EVT_KILL_FOCUS(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_KILL_FOCUS, lsnr);
    }
    public проц EVT_SET_FOCUS(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_SET_FOCUS, lsnr);
    }

    public проц EVT_MOUSE_EVENTS(ДатчикСобытий lsnr)
    {
        EVT_ENTER_WINDOW(lsnr);
        EVT_LEAVE_WINDOW(lsnr);

        EVT_LEFT_DOWN(lsnr);
        EVT_RIGHT_DOWN(lsnr);
        EVT_MIDDLE_DOWN(lsnr);

        EVT_LEFT_DCLICK(lsnr);
        EVT_RIGHT_DCLICK(lsnr);
        EVT_MIDDLE_DCLICK(lsnr);

        EVT_MOUSEWHEEL(lsnr);

        EVT_MOTION(lsnr);

        EVT_LEFT_UP(lsnr);
        EVT_RIGHT_UP(lsnr);
        EVT_MIDDLE_UP(lsnr);
    }

    public проц EVT_ENTER_WINDOW(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_ENTER_WINDOW, lsnr);
    }
    public проц EVT_LEAVE_WINDOW(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_LEAVE_WINDOW, lsnr);
    }

    public проц EVT_LEFT_DOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_LEFT_DOWN, lsnr);
    }
    public проц EVT_RIGHT_DOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_RIGHT_DOWN, lsnr);
    }
    public проц EVT_MIDDLE_DOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MIDDLE_DOWN, lsnr);
    }

    public проц EVT_LEFT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_LEFT_DCLICK, lsnr);
    }
    public проц EVT_RIGHT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_RIGHT_DCLICK, lsnr);
    }
    public проц EVT_MIDDLE_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MIDDLE_DCLICK, lsnr);
    }

    public проц EVT_MOUSEWHEEL(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MOUSEWHEEL, lsnr);
    }

    public проц EVT_MOTION(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MOTION, lsnr);
    }

    public проц EVT_LEFT_UP(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_LEFT_UP, lsnr);
    }
    public проц EVT_RIGHT_UP(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_RIGHT_UP, lsnr);
    }
    public проц EVT_MIDDLE_UP(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MIDDLE_UP, lsnr);
    }

    public проц EVT_UPDATE_UI(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_UPDATE_UI, ид, lsnr);
    }
    public проц EVT_TIMER(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_TIMER, ид, lsnr);
    }
    public проц EVT_MENU(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_MENU_SELECTED, ид, lsnr);
    }
    public проц EVT_MENU_RANGE(цел ид, цел lastId, ДатчикСобытий lsnr)
    {
        AddCommandRangeListener(Событие.wxEVT_COMMAND_MENU_SELECTED, ид, lastId, lsnr);
    }
    public проц EVT_BUTTON(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_BUTTON_CLICKED, ид, lsnr);
    }
    public проц EVT_CHECKBOX(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_CHECKBOX_CLICKED, ид, lsnr);
    }
    public проц EVT_LISTBOX(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOX_SELECTED, ид, lsnr);
    }
    public проц EVT_LISTBOX_DCLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOX_DOUBLECLICKED, ид, lsnr);
    }
    public проц EVT_CHOICE(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_CHOICE_SELECTED, ид, lsnr);
    }
    public проц EVT_COMBOBOX(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_COMBOBOX_SELECTED, ид, lsnr);
    }
    public проц EVT_TEXT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TEXT_UPDATED, ид, lsnr);
    }
    public проц EVT_TEXT_ENTER(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TEXT_ENTER, ид, lsnr);
    }
    public проц EVT_RADIOBOX(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_RADIOBOX_SELECTED, ид, lsnr);
    }
    public проц EVT_RADIOBUTTON(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_RADIOBUTTON_SELECTED, ид, lsnr);
    }
    public проц EVT_SLIDER(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_SLIDER_UPDATED, ид, lsnr);
    }
    public проц EVT_SPINCTRL(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_SPINCTRL_UPDATED, ид, lsnr);
    }
    public проц EVT_SPIN_UP(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_SCROLL_LINEUP, ид, lsnr);
    }
    public проц EVT_SPIN_DOWN(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_SCROLL_LINEDOWN, ид, lsnr);
    }
    public проц EVT_SPIN(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_SCROLL_THUMBTRACK, ид, lsnr);
    }
    public проц EVT_TOGGLEBUTTON(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TOGGLEBUTTON_CLICKED, ид, lsnr);
    }

    public проц EVT_KEY_DOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_KEY_DOWN, lsnr);
    }
    public проц EVT_KEY_UP(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_KEY_UP, lsnr);
    }
    public проц EVT_CHAR(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_CHAR, lsnr);
    }

    public проц EVT_CALENDAR_SEL_CHANGED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_SEL_CHANGED, ид, lsnr);
    }
    public проц EVT_CALENDAR_DAY(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_DAY_CHANGED, ид, lsnr);
    }
    public проц EVT_CALENDAR_MONTH(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_MONTH_CHANGED, ид, lsnr);
    }
    public проц EVT_CALENDAR_YEAR(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_YEAR_CHANGED, ид, lsnr);
    }
    public проц EVT_CALENDAR_DOUBLECLICKED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_DOUBLECLICKED, ид, lsnr);
    }
    public проц EVT_CALENDAR_WEEKDAY_CLICKED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_WEEKDAY_CLICKED, ид, lsnr);
    }

    public проц EVT_FIND(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND, ид, lsnr);
    }
    public проц EVT_FIND_NEXT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_NEXT, ид, lsnr);
    }
    public проц EVT_FIND_REPLACE(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_REPLACE, ид, lsnr);
    }
    public проц EVT_FIND_REPLACE_ALL(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_REPLACE_ALL, ид, lsnr);
    }
    public проц EVT_FIND_CLOSE(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_CLOSE, ид, lsnr);
    }

    public проц EVT_TREE_BEGIN_DRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_DRAG, ид, lsnr);
    }
    public проц EVT_TREE_BEGIN_RDRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_RDRAG, ид, lsnr);
    }
    public проц EVT_TREE_BEGIN_LABEL_EDIT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_BEGIN_LABEL_EDIT, ид, lsnr);
    }
    public проц EVT_TREE_END_LABEL_EDIT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_END_LABEL_EDIT, ид, lsnr);
    }
    public проц EVT_TREE_DELETE_ITEM(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_DELETE_ITEM, ид, lsnr);
    }
    public проц EVT_TREE_GET_INFO(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_GET_INFO, ид, lsnr);
    }
    public проц EVT_TREE_SET_INFO(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_SET_INFO, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_EXPANDED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_EXPANDED, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_EXPANDING(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_EXPANDING, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_COLLAPSED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_COLLAPSED, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_COLLAPSING(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_COLLAPSING, ид, lsnr);
    }
    public проц EVT_TREE_SEL_CHANGED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_SEL_CHANGED, ид, lsnr);
    }
    public проц EVT_TREE_SEL_CHANGING(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_SEL_CHANGING, ид, lsnr);
    }
    public проц EVT_TREE_KEY_DOWN(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_KEY_DOWN, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_ACTIVATED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_ACTIVATED, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_RIGHT_CLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_RIGHT_CLICK, ид, lsnr);
    }
    public проц EVT_TREE_ITEM_MIDDLE_CLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_ITEM_MIDDLE_CLICK, ид, lsnr);
    }
    public проц EVT_TREE_END_DRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TREE_END_DRAG, ид, lsnr);
    }

    public проц EVT_LIST_BEGIN_DRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_DRAG, ид, lsnr);
    }
    public проц EVT_LIST_BEGIN_RDRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_RDRAG, ид, lsnr);
    }
    public проц EVT_LIST_BEGIN_LABEL_EDIT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT, ид, lsnr);
    }
    public проц EVT_LIST_END_LABEL_EDIT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_END_LABEL_EDIT, ид, lsnr);
    }
    public проц EVT_LIST_DELETE_ITEM(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_DELETE_ITEM, ид, lsnr);
    }
    public проц EVT_LIST_DELETE_ALL_ITEMS(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS, ид, lsnr);
    }
    public проц EVT_LIST_GET_INFO(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_GET_INFO, ид, lsnr);
    }
    public проц EVT_LIST_SET_INFO(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_SET_INFO, ид, lsnr);
    }
    public проц EVT_LIST_ITEM_SELECTED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_SELECTED, ид, lsnr);
    }
    public проц EVT_LIST_ITEM_DESELECTED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_DESELECTED, ид, lsnr);
    }
    public проц EVT_LIST_ITEM_ACTIVATED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_ACTIVATED, ид, lsnr);
    }
    public проц EVT_LIST_ITEM_FOCUSED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_FOCUSED, ид, lsnr);
    }
    public проц EVT_LIST_ITEM_MIDDLE_CLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK, ид, lsnr);
    }
    public проц EVT_LIST_ITEM_RIGHT_CLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK, ид, lsnr);
    }
    public проц EVT_LIST_KEY_DOWN(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_KEY_DOWN, ид, lsnr);
    }
    public проц EVT_LIST_INSERT_ITEM(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_INSERT_ITEM, ид, lsnr);
    }
    public проц EVT_LIST_COL_CLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_CLICK, ид, lsnr);
    }
    public проц EVT_LIST_COL_RIGHT_CLICK(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_RIGHT_CLICK, ид, lsnr);
    }
    public проц EVT_LIST_COL_BEGIN_DRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_BEGIN_DRAG, ид, lsnr);
    }
    public проц EVT_LIST_COL_DRAGGING(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_DRAGGING, ид, lsnr);
    }
    public проц EVT_LIST_COL_END_DRAG(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_END_DRAG, ид, lsnr);
    }
    public проц EVT_LIST_CACHE_HINT(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LIST_CACHE_HINT, ид, lsnr);
    }

    public проц EVT_NOTEBOOK_PAGE_CHANGED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ид, lsnr);
    }
    public проц EVT_NOTEBOOK_PAGE_CHANGING(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING, ид, lsnr);
    }

    public проц EVT_LISTBOOK_PAGE_CHANGED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOOK_PAGE_CHANGED, ид, lsnr);
    }
    public проц EVT_LISTBOOK_PAGE_CHANGING(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOOK_PAGE_CHANGING, ид, lsnr);
    }

    version(__WXMSW__)
    {
        public проц EVT_TAB_SEL_CHANGED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(Событие.wxEVT_COMMAND_TAB_SEL_CHANGED, ид, lsnr);
        }
        public проц EVT_TAB_SEL_CHANGING(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(Событие.wxEVT_COMMAND_TAB_SEL_CHANGING, ид, lsnr);
        }
    }
    public проц EVT_GRID_CELL_LEFT_CLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_CELL_LEFT_CLICK, lsnr);
    }
    public проц EVT_GRID_CELL_RIGHT_CLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_CELL_RIGHT_CLICK, lsnr);
    }
    public проц EVT_GRID_CELL_LEFT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_CELL_LEFT_DCLICK, lsnr);
    }
    public проц EVT_GRID_CELL_RIGHT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_CELL_RIGHT_DCLICK, lsnr);
    }
    public проц EVT_GRID_LABEL_LEFT_CLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_LABEL_LEFT_CLICK, lsnr);
    }
    public проц EVT_GRID_LABEL_RIGHT_CLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_LABEL_RIGHT_CLICK, lsnr);
    }
    public проц EVT_GRID_LABEL_LEFT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_LABEL_LEFT_DCLICK, lsnr);
    }
    public проц EVT_GRID_LABEL_RIGHT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_LABEL_RIGHT_DCLICK, lsnr);
    }
    public проц EVT_GRID_ROW_SIZE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_ROW_SIZE, lsnr);
    }
    public проц EVT_GRID_COL_SIZE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_COL_SIZE, lsnr);
    }
    public проц EVT_GRID_RANGE_SELECT(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_RANGE_SELECT, lsnr);
    }
    public проц EVT_GRID_CELL_CHANGE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_CELL_CHANGE, lsnr);
    }
    public проц EVT_GRID_SELECT_CELL(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_SELECT_CELL, lsnr);
    }
    public проц EVT_GRID_EDITOR_SHOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_EDITOR_SHOWN, lsnr);
    }
    public проц EVT_GRID_EDITOR_HIDDEN(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_EDITOR_HIDDEN, lsnr);
    }
    public проц EVT_GRID_EDITOR_CREATED(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_GRID_EDITOR_CREATED, lsnr);
    }

    public проц EVT_ACTIVATE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_ACTIVATE, lsnr);
    }

    public проц EVT_DISPLAY_CHANGED(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_DISPLAY_CHANGED, lsnr);
    }

    public проц EVT_SASH_DRAGGED(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_SASH_DRAGGED, ид, lsnr);
    }
    public проц EVT_SASH_DRAGGED_RANGE(цел ид, цел lastId, ДатчикСобытий lsnr)
    {
        AddCommandRangeListener(Событие.wxEVT_SASH_DRAGGED, ид, lastId, lsnr);
    }

    public проц EVT_QUERY_LAYOUT_INFO(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_QUERY_LAYOUT_INFO, lsnr);
    }
    public проц EVT_CALCULATE_LAYOUT(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_CALCULATE_LAYOUT, lsnr);
    }

    public проц EVT_CHECKLISTBOX(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_CHECKLISTBOX_TOGGLED, ид, lsnr);
    }

    public проц EVT_CONTEXT_MENU(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_CONTEXT_MENU, lsnr);
    }

    public проц EVT_SYS_COLOUR_CHANGED(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_SYS_COLOUR_CHANGED, lsnr);
    }

    public проц EVT_QUERY_NEW_PALETTE(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_QUERY_NEW_PALETTE, lsnr);
    }

    public проц EVT_PALETTE_CHANGED(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_PALETTE_CHANGED, lsnr);
    }

    public проц EVT_INIT_DIALOG(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_INIT_DIALOG, lsnr);
    }

    public проц EVT_SIZING(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_SIZING, lsnr);
    }

    public проц EVT_MOVING(ДатчикСобытий lsnr)
    {
        AddEventListener(Событие.wxEVT_MOVING, lsnr);
    }

    public проц EVT_HELP(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_HELP, ид, lsnr);
    }

    public проц EVT_DETAILED_HELP(цел ид, ДатчикСобытий lsnr)
    {
        AddCommandListener(Событие.wxEVT_DETAILED_HELP, ид, lsnr);
    }


//! \cond VERSION
    version(WXD_STYLEDTEXTCTRL)
    {
//! \endcond

        // StyledTextCtrl specific events

        public проц EVT_STC_CHANGE(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_CHANGE, ид, lsnr);
        }
        public проц EVT_STC_STYLENEEDED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_STYLENEEDED, ид, lsnr);
        }
        public проц EVT_STC_CHARADDED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_CHARADDED, ид, lsnr);
        }

        public проц EVT_STC_SAVEPOINTREACHED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_SAVEPOINTREACHED, ид, lsnr);
        }
        public проц EVT_STC_SAVEPOINTLEFT(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_SAVEPOINTLEFT, ид, lsnr);
        }
        public проц EVT_STC_ROMODIFYATTEMPT(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_ROMODIFYATTEMPT, ид, lsnr);
        }

        public проц EVT_STC_KEY(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_KEY, ид, lsnr);
        }
        public проц EVT_STC_DOUBLECLICK(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_DOUBLECLICK, ид, lsnr);
        }
        public проц EVT_STC_UPDATEUI(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_UPDATEUI, ид, lsnr);
        }
        public проц EVT_STC_MODIFIED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_MODIFIED, ид, lsnr);
        }
        public проц EVT_STC_MACRORECORD(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_MACRORECORD, ид, lsnr);
        }
        public проц EVT_STC_MARGINCLICK(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_MARGINCLICK, ид, lsnr);
        }
        public проц EVT_STC_NEEDSHOWN(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_NEEDSHOWN, ид, lsnr);
        }
        //public проц EVT_STC_POSCHANGED(цел ид, ДатчикСобытий lsnr)
        //	{ AddCommandListener(StyledTextCtrl.wxEVT_STC_POSCHANGED, ид, lsnr); }
        public проц EVT_STC_PAINTED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_PAINTED, ид, lsnr);
        }
        public проц EVT_STC_USERLISTSELECTION(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_USERLISTSELECTION, ид, lsnr);
        }
        public проц EVT_STC_URIDROPPED(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_URIDROPPED, ид, lsnr);
        }

        public проц EVT_STC_DWELLSTART(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_DWELLSTART, ид, lsnr);
        }
        public проц EVT_STC_DWELLEND(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_DWELLEND, ид, lsnr);
        }

        public проц EVT_STC_START_DRAG(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_START_DRAG, ид, lsnr);
        }
        public проц EVT_STC_DRAG_OVER(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_DRAG_OVER, ид, lsnr);
        }
        public проц EVT_STC_DO_DROP(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_DO_DROP, ид, lsnr);
        }

        public проц EVT_STC_ZOOM(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_ZOOM, ид, lsnr);
        }

        public проц EVT_STC_HOTSPOT_CLICK(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_HOTSPOT_CLICK, ид, lsnr);
        }
        public проц EVT_STC_HOTSPOT_DCLICK(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_HOTSPOT_DCLICK, ид, lsnr);
        }

        public проц EVT_STC_CALLTIP_CLICK(цел ид, ДатчикСобытий lsnr)
        {
            AddCommandListener(StyledTextCtrl.wxEVT_STC_CALLTIP_CLICK, ид, lsnr);
        }
//! \cond VERSION
    } // version(WXD_STYLEDTEXTCTRL)
//! \endcond

    public проц EVT_TASKBAR_MOVE(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_MOVE, lsnr);
    }
    public проц EVT_TASKBAR_LEFT_DOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_LEFT_DOWN, lsnr);
    }
    public проц EVT_TASKBAR_LEFT_UP(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_LEFT_UP, lsnr);
    }
    public проц EVT_TASKBAR_RIGHT_DOWN(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_RIGHT_DOWN, lsnr);
    }
    public проц EVT_TASKBAR_RIGHT_UP(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_RIGHT_UP, lsnr);
    }
    public проц EVT_TASKBAR_LEFT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_LEFT_DCLICK, lsnr);
    }
    public проц EVT_TASKBAR_RIGHT_DCLICK(ДатчикСобытий lsnr)
    {
        AddEventListener(TaskBarIcon.wxEVT_TASKBAR_RIGHT_DCLICK, lsnr);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ОбработчикСоб(ptr);
    }
}
