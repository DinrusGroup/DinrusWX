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
		public цел eventType;
		public бул активен;
		
		public this( ДатчикСобытий listener, wxObject owner, цел eventType );
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias проц function(ОбработчикСоб объ,IntPtr wxEvent, цел iListener) EvtMarshalDelegate;
		}

		struct clientdata {
			EvtMarshalDelegate listener;
			wxObject объ;
		};
		
//		extern (C) {
//		alias проц function() ObjectDeletedHandler;
//		}
//
//		public ObjectDeletedHandler ObjectDeleted;


		static extern (C) проц wxEvtHandler_proxy(IntPtr сам, clientdata* data);
		static extern (C) проц wxEvtHandler_Connect(IntPtr сам, цел evtType, цел ид, цел lastId, цел iListener);
		
		static extern (C) бул wxEvtHandler_ProcessEvent(IntPtr сам, IntPtr evt);
		
		static extern (C) проц wxEvtHandler_AddPendingEvent(IntPtr сам, IntPtr evt); 
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
		private static ОбработчикСоб[IntPtr] evtHandlers;
		
		//---------------------------------------------------------------------
			
		//---------------------------------------------------------------------

		/*private*/public this(IntPtr wxobj) ;
		~this();
		public проц AddКомандаListener(цел eventType, цел ид, ДатчикСобытий listener);
		public проц AddКомандаListener(цел eventType, цел ид, ДатчикСобытий listener, wxObject owner);
		public проц AddКомандаRangeListener(цел eventType, цел ид, цел lastId, ДатчикСобытий listener);
		public проц AddКомандаRangeListener(цел eventType, цел ид, цел lastId, ДатчикСобытий listener, wxObject owner);
		public проц AddEventListener(цел eventType, ДатчикСобытий listener);
		public проц AddEventListener(цел eventType, ДатчикСобытий listener, wxObject owner);
		public проц AddMenuListener(цел ид, ДатчикСобытий listener);
		public проц AddMenuListener(цел ид, ДатчикСобытий listener, wxObject owner);
		public бул ProcessEvent(Событие evt) ;
		public бул RemoveHandler(ДатчикСобытий listener, wxObject owner);
		public проц AddPendingEvent(Событие evt);
		static extern (C) private проц staticMarshalEvent(ОбработчикСоб объ, IntPtr wxEvent, цел iListner);
		private проц MarshalEvent(IntPtr wxEvent, цел iListener);
		private /*static*/ проц OnObjectDeleted(Объект отправитель, Событие evt);
		private static проц AddEvtHander(ОбработчикСоб eh);
		private static проц RemoveEvtHandler(IntPtr ptr);
		public проц EVT_SIZE(ДатчикСобытий lsnr);
		public проц EVT_CLOSE(ДатчикСобытий lsnr);
		public проц EVT_PAINT(ДатчикСобытий lsnr);
		public проц EVT_ERASE_BACKGROUND(ДатчикСобытий lsnr);
		public проц EVT_IDLE(ДатчикСобытий lsnr);
		public проц EVT_MOVE(ДатчикСобытий lsnr);
		public проц EVT_SOCKET(ДатчикСобытий lsnr);
		public проц EVT_KILL_FOCUS(ДатчикСобытий lsnr);
		public проц EVT_SET_FOCUS(ДатчикСобытий lsnr);   ;
		public проц EVT_ENTER_WINDOW(ДатчикСобытий lsnr);
		public проц EVT_LEAVE_WINDOW(ДатчикСобытий lsnr);
		public проц EVT_LEFT_DOWN(ДатчикСобытий lsnr);
		public проц EVT_RIGHT_DOWN(ДатчикСобытий lsnr);
		public проц EVT_MIDDLE_DOWN(ДатчикСобытий lsnr);
		public проц EVT_LEFT_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_RIGHT_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_MIDDLE_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_MOUSEWHEEL(ДатчикСобытий lsnr);
		public проц EVT_MOTION(ДатчикСобытий lsnr);
		public проц EVT_LEFT_UP(ДатчикСобытий lsnr);
		public проц EVT_RIGHT_UP(ДатчикСобытий lsnr);
		public проц EVT_MIDDLE_UP(ДатчикСобытий lsnr);
		public проц EVT_UPDATE_UI(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TIMER(цел ид, ДатчикСобытий lsnr);
		public проц EVT_MENU(цел ид, ДатчикСобытий lsnr);
		public проц EVT_MENU_RANGE(цел ид, цел lastId, ДатчикСобытий lsnr) ;
		public проц EVT_BUTTON(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CHECKBOX(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LISTBOX(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LISTBOX_DCLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CHOICE(цел ид, ДатчикСобытий lsnr);
		public проц EVT_COMBOBOX(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TEXT(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TEXT_ENTER(цел ид, ДатчикСобытий lsnr);
		public проц EVT_RADIOBOX(цел ид, ДатчикСобытий lsnr);
		public проц EVT_RADIOBUTTON(цел ид, ДатчикСобытий lsnr);
		public проц EVT_SLIDER(цел ид, ДатчикСобытий lsnr);
		public проц EVT_SPINCTRL(цел ид, ДатчикСобытий lsnr);
		public проц EVT_SPIN_UP(цел ид, ДатчикСобытий lsnr);
		public проц EVT_SPIN_DOWN(цел ид, ДатчикСобытий lsnr);
		public проц EVT_SPIN(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TOGGLEBUTTON(цел ид, ДатчикСобытий lsnr);
		public проц EVT_KEY_DOWN(ДатчикСобытий lsnr);
		public проц EVT_KEY_UP(ДатчикСобытий lsnr);
		public проц EVT_CHAR(ДатчикСобытий lsnr);
		public проц EVT_CALENDAR_SEL_CHANGED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CALENDAR_DAY(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CALENDAR_MONTH(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CALENDAR_YEAR(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CALENDAR_DOUBLECLICKED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CALENDAR_WEEKDAY_CLICKED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_FIND(цел ид, ДатчикСобытий lsnr);
		public проц EVT_FIND_NEXT(цел ид, ДатчикСобытий lsnr);
		public проц EVT_FIND_REPLACE(цел ид, ДатчикСобытий lsnr);
		public проц EVT_FIND_REPLACE_ALL(цел ид, ДатчикСобытий lsnr);
		public проц EVT_FIND_CLOSE(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_BEGIN_DRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_BEGIN_RDRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_BEGIN_LABEL_EDIT(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_END_LABEL_EDIT(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_DELETE_ITEM(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_GET_INFO(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_SET_INFO(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_EXPANDED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_EXPANDING(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_COLLAPSED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_COLLAPSING(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_SEL_CHANGED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_SEL_CHANGING(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_KEY_DOWN(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_ACTIVATED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_RIGHT_CLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_ITEM_MIDDLE_CLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TREE_END_DRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_BEGIN_DRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_BEGIN_RDRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_BEGIN_LABEL_EDIT(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_END_LABEL_EDIT(цел ид, ДатчикСобытий lsnr);   
		public проц EVT_LIST_DELETE_ITEM(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_DELETE_ALL_ITEMS(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_GET_INFO(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_SET_INFO(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_ITEM_SELECTED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_ITEM_DESELECTED(цел ид, ДатчикСобытий lsnr);   
		public проц EVT_LIST_ITEM_ACTIVATED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_ITEM_FOCUSED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_ITEM_MIDDLE_CLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_ITEM_RIGHT_CLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_KEY_DOWN(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_INSERT_ITEM(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_COL_CLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_COL_RIGHT_CLICK(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_COL_BEGIN_DRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_COL_DRAGGING(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_COL_END_DRAG(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LIST_CACHE_HINT(цел ид, ДатчикСобытий lsnr);
		public проц EVT_NOTEBOOK_PAGE_CHANGED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_NOTEBOOK_PAGE_CHANGING(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LISTBOOK_PAGE_CHANGED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_LISTBOOK_PAGE_CHANGING(цел ид, ДатчикСобытий lsnr);
version(__WXMSW__){
		public проц EVT_TAB_SEL_CHANGED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_TAB_SEL_CHANGING(цел ид, ДатчикСобытий lsnr);
}	
		public проц EVT_GRID_CELL_LEFT_CLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_CELL_RIGHT_CLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_CELL_LEFT_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_CELL_RIGHT_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_LABEL_LEFT_CLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_LABEL_RIGHT_CLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_LABEL_LEFT_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_LABEL_RIGHT_DCLICK(ДатчикСобытий lsnr);
		public проц EVT_GRID_ROW_SIZE(ДатчикСобытий lsnr);
		public проц EVT_GRID_COL_SIZE(ДатчикСобытий lsnr);
		public проц EVT_GRID_RANGE_SELECT(ДатчикСобытий lsnr);
		public проц EVT_GRID_CELL_CHANGE(ДатчикСобытий lsnr);
		public проц EVT_GRID_SELECT_CELL(ДатчикСобытий lsnr);
		public проц EVT_GRID_EDITOR_SHOWN(ДатчикСобытий lsnr);
		public проц EVT_GRID_EDITOR_HIDDEN(ДатчикСобытий lsnr);
		public проц EVT_GRID_EDITOR_CREATED(ДатчикСобытий lsnr);
		public проц EVT_ACTIVATE(ДатчикСобытий lsnr);
		public проц EVT_DISPLAY_CHANGED(ДатчикСобытий lsnr);
		public проц EVT_SASH_DRAGGED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_SASH_DRAGGED_RANGE(цел ид, цел lastId, ДатчикСобытий lsnr);
		public проц EVT_QUERY_LAYOUT_INFO(ДатчикСобытий lsnr);
		public проц EVT_CALCULATE_LAYOUT(ДатчикСобытий lsnr);
		public проц EVT_CHECKLISTBOX(цел ид, ДатчикСобытий lsnr);
		public проц EVT_CONTEXT_MENU(ДатчикСобытий lsnr);
		public проц EVT_SYS_COLOUR_CHANGED(ДатчикСобытий lsnr);
		public проц EVT_QUERY_NEW_PALETTE(ДатчикСобытий lsnr);
		public проц EVT_PALETTE_CHANGED(ДатчикСобытий lsnr);
		public проц EVT_INIT_DIALOG(ДатчикСобытий lsnr);
		public проц EVT_SIZING(ДатчикСобытий lsnr);
		public проц EVT_MOVING(ДатчикСобытий lsnr);
		public проц EVT_HELP(цел ид, ДатчикСобытий lsnr);
		public проц EVT_DETAILED_HELP(цел ид, ДатчикСобытий lsnr);

//! \cond VERSION
version(WXD_STYLEDTEXTCTRL){
//! \endcond

		// StyledTextCtrl specific events
		
		public проц EVT_STC_CHANGE(цел ид, ДатчикСобытий lsnr) ;
		public проц EVT_STC_STYLENEEDED(цел ид, ДатчикСобытий lsnr)   ;
		public проц EVT_STC_CHARADDED(цел ид, ДатчикСобытий lsnr)    ;
		public проц EVT_STC_SAVEPOINTREACHED(цел ид, ДатчикСобытий lsnr);
		public проц EVT_STC_SAVEPOINTLEFT(цел ид, ДатчикСобытий lsnr)   ;
		public проц EVT_STC_ROMODIFYATTEMPT(цел ид, ДатчикСобытий lsnr)   ;		
		public проц EVT_STC_KEY(цел ид, ДатчикСобытий lsnr)    ;
		public проц EVT_STC_DOUBLECLICK(цел ид, ДатчикСобытий lsnr)  ;
		public проц EVT_STC_UPDATEUI(цел ид, ДатчикСобытий lsnr) ;
		public проц EVT_STC_MODIFIED(цел ид, ДатчикСобытий lsnr)   ;
		public проц EVT_STC_MACRORECORD(цел ид, ДатчикСобытий lsnr)    ;
		public проц EVT_STC_MARGINCLICK(цел ид, ДатчикСобытий lsnr)  ;
		public проц EVT_STC_NEEDSHOWN(цел ид, ДатчикСобытий lsnr) ;
		//public проц EVT_STC_POSCHANGED(цел ид, ДатчикСобытий lsnr)        
		//	{ AddКомандаListener(StyledTextCtrl.wxEVT_STC_POSCHANGED, ид, lsnr); }
		public проц EVT_STC_PAINTED(цел ид, ДатчикСобытий lsnr) ;
		public проц EVT_STC_USERLISTSELECTION(цел ид, ДатчикСобытий lsnr) ;
		public проц EVT_STC_URIDROPPED(цел ид, ДатчикСобытий lsnr)    ;
		public проц EVT_STC_DWELLSTART(цел ид, ДатчикСобытий lsnr) ;
		public проц EVT_STC_DWELLEND(цел ид, ДатчикСобытий lsnr) ;
		public проц EVT_STC_START_DRAG(цел ид, ДатчикСобытий lsnr)  ;
		public проц EVT_STC_DRAG_OVER(цел ид, ДатчикСобытий lsnr)   ;
		public проц EVT_STC_DO_DROP(цел ид, ДатчикСобытий lsnr)  ;
		public проц EVT_STC_ZOOM(цел ид, ДатчикСобытий lsnr)   ;
		public проц EVT_STC_HOTSPOT_CLICK(цел ид, ДатчикСобытий lsnr)  ;
		public проц EVT_STC_HOTSPOT_DCLICK(цел ид, ДатчикСобытий lsnr)  ;
		public проц EVT_STC_CALLTIP_CLICK(цел ид, ДатчикСобытий lsnr) ;	
//! \cond VERSION
} // version(WXD_STYLEDTEXTCTRL)
//! \endcond

		public проц EVT_TASKBAR_MOVE(ДатчикСобытий lsnr);
		public проц EVT_TASKBAR_LEFT_DOWN(ДатчикСобытий lsnr);
		public проц EVT_TASKBAR_LEFT_UP(ДатчикСобытий lsnr) ;
		public проц EVT_TASKBAR_RIGHT_DOWN(ДатчикСобытий lsnr) ;
		public проц EVT_TASKBAR_RIGHT_UP(ДатчикСобытий lsnr)   ;
		public проц EVT_TASKBAR_LEFT_DCLICK(ДатчикСобытий lsnr)   ;
		public проц EVT_TASKBAR_RIGHT_DCLICK(ДатчикСобытий lsnr)   ;

		public static wxObject Нов(IntPtr ptr) ;
	}
