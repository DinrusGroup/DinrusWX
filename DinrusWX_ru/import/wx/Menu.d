
module wx.Menu;
public import wx.common;
public import wx.Defs;
public import wx.Window;
public import wx.MenuItem;
public import wx.MenuBar;

		//! \cond EXTERN
		static extern (C) IntPtr wxMenuBase_ctor1(ткст titel, бцел стиль);
		static extern (C) IntPtr wxMenuBase_ctor2(бцел стиль);
		
		static extern (C) IntPtr wxMenuBase_Append(IntPtr сам, цел ид, ткст элт, ткст help, ItemKind kind);
		static extern (C) IntPtr wxMenuBase_AppendSubMenu(IntPtr сам, цел ид, ткст элт, IntPtr subMenu, ткст help);
		static extern (C) IntPtr wxMenuBase_AppendItem(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxMenuBase_AppendSeparator(IntPtr сам);
		static extern (C) IntPtr wxMenuBase_AppendCheckItem(IntPtr сам, цел элтid, ткст текст, ткст help);
		static extern (C) IntPtr wxMenuBase_AppendRadioItem(IntPtr сам, цел элтid, ткст текст, ткст help);
		static extern (C) цел    wxMenuBase_GetMenuItemCount(IntPtr сам);
		static extern (C) IntPtr wxMenuBase_GetMenuItem(IntPtr сам, цел index);
		static extern (C) проц   wxMenuBase_Break(IntPtr сам);
		
		static extern (C) IntPtr wxMenuBase_Insert(IntPtr сам, цел поз, IntPtr элт);
		static extern (C) IntPtr wxMenuBase_Insert2(IntPtr сам, цел поз, цел элтid, ткст текст, ткст help, ItemKind kind);
		static extern (C) IntPtr wxMenuBase_InsertSeparator(IntPtr сам, цел поз);
		static extern (C) IntPtr wxMenuBase_InsertCheckItem(IntPtr сам, цел поз, цел элтid, ткст текст, ткст help);
		static extern (C) IntPtr wxMenuBase_InsertRadioItem(IntPtr сам, цел поз, цел элтid, ткст текст, ткст help);
		static extern (C) IntPtr wxMenuBase_InsertSubMenu(IntPtr сам, цел поз, цел элтid, ткст текст, IntPtr submenu, ткст help);
		
		static extern (C) IntPtr wxMenuBase_Prepend(IntPtr сам, IntPtr элт);
		static extern (C) IntPtr wxMenuBase_Prepend2(IntPtr сам, цел элтid, ткст текст, ткст help, ItemKind kind);
		static extern (C) IntPtr wxMenuBase_PrependSeparator(IntPtr сам);
		static extern (C) IntPtr wxMenuBase_PrependCheckItem(IntPtr сам, цел элтid, ткст текст, ткст help);
		static extern (C) IntPtr wxMenuBase_PrependRadioItem(IntPtr сам, цел элтid, ткст текст, ткст help);
		static extern (C) IntPtr wxMenuBase_PrependSubMenu(IntPtr сам, цел элтid, ткст текст, IntPtr submenu, ткст help);
		
		static extern (C) IntPtr wxMenuBase_Remove(IntPtr сам, цел элтid);
		static extern (C) IntPtr wxMenuBase_Remove2(IntPtr сам, IntPtr элт);
		
		static extern (C) бул   wxMenuBase_Delete(IntPtr сам, цел элтid);
		static extern (C) бул   wxMenuBase_Delete2(IntPtr сам, IntPtr элт);
		
		static extern (C) бул   wxMenuBase_Destroy(IntPtr сам, цел элтid);
		static extern (C) бул   wxMenuBase_Destroy2(IntPtr сам, IntPtr элт);
		
		static extern (C) цел    wxMenuBase_FindItem(IntPtr сам, ткст элт);
		static extern (C) IntPtr wxMenuBase_FindItem2(IntPtr сам, цел элтid, inout IntPtr меню); 
		static extern (C) IntPtr wxMenuBase_FindItemByPosition(IntPtr сам, цел position);
		
		static extern (C) проц   wxMenuBase_Enable(IntPtr сам, цел элтid, бул вкл);
		static extern (C) бул   wxMenuBase_IsEnabled(IntPtr сам, цел элтid);
		
		static extern (C) проц   wxMenuBase_Check(IntPtr сам, цел ид, бул check);
		static extern (C) бул   wxMenuBase_IsChecked(IntPtr сам, цел элтid);
		
		static extern (C) проц   wxMenuBase_SetLabel(IntPtr сам, цел элтid, ткст ярлык);
		static extern (C) IntPtr wxMenuBase_GetLabel(IntPtr сам, цел элтid);
		
		static extern (C) проц   wxMenuBase_SetHelpString(IntPtr сам, цел элтid, ткст helpString);
		static extern (C) IntPtr wxMenuBase_GetHelpString(IntPtr сам, цел элтid);		
		
		static extern (C) проц   wxMenuBase_SetTitle(IntPtr сам, ткст title);
		static extern (C) IntPtr wxMenuBase_GetTitle(IntPtr сам);		
		
		static extern (C) проц   wxMenuBase_SetInvokingWindow(IntPtr сам, IntPtr win);
		static extern (C) IntPtr wxMenuBase_GetInvokingWindow(IntPtr сам);
		
		static extern (C) бцел   wxMenuBase_GetStyle(IntPtr сам);
		
		static extern (C) проц   wxMenuBase_SetEventHandler(IntPtr сам, IntPtr обработчик);
		static extern (C) IntPtr wxMenuBase_GetEventHandler(IntPtr сам);
		
		static extern (C) проц   wxMenuBase_UpdateUI(IntPtr сам, IntPtr source);
		
		static extern (C) IntPtr wxMenuBase_GetMenuBar(IntPtr сам);
		
		static extern (C) бул   wxMenuBase_IsAttached(IntPtr сам);
		
		static extern (C) проц   wxMenuBase_SetParent(IntPtr сам, IntPtr родитель);
		static extern (C) IntPtr wxMenuBase_GetParent(IntPtr сам);
		
		static extern (C) IntPtr wxMenuBase_FindChildItem(IntPtr сам, цел элтid, out цел поз);
		static extern (C) IntPtr wxMenuBase_FindChildItem2(IntPtr сам, цел элтid);
		static extern (C) бул   wxMenuBase_SendEvent(IntPtr сам, цел элтid, цел xchecked);
		//! \endcond
	
	alias MenuBase wxMenuBase;
	public class MenuBase : ОбработчикСоб
	{
		public this(IntPtr wxobj);
		public this(цел стиль = 0);
		public this(ткст titel, цел стиль = 0);
		public ЭлтМеню Append(цел ид, ткст элт);
		public ЭлтМеню Append(цел ид, ткст элт, ткст help);
		public ЭлтМеню Append(цел ид, ткст элт, ткст help, ItemKind kind);
		public ЭлтМеню Append(цел ид, ткст элт, Меню subMenu);
		public ЭлтМеню Append(цел ид, ткст элт, Меню subMenu, ткст help);
		public ЭлтМеню Append(ЭлтМеню элт) ;
		public ЭлтМеню AppendCheckItem(цел ид, ткст элт);
		public ЭлтМеню AppendCheckItem(цел ид, ткст элт, ткст help);
		public ЭлтМеню AppendSeparator();
		public ЭлтМеню AppendRadioItem(цел элтid, ткст текст);
		public ЭлтМеню AppendRadioItem(цел элтid, ткст текст, ткст help);
		public проц Check(цел ид, бул check);
		public цел GetЭлтМенюCount();
		public ЭлтМеню GetЭлтМеню(цел index);
		public  проц Break();
		public ЭлтМеню Insert(цел поз, ЭлтМеню элт);
		public ЭлтМеню Insert(цел поз, цел элтid, ткст текст);
		public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, ткст help);
		public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, ткст help, ItemKind kind);
		public ЭлтМеню InsertSeparator(цел поз);
		public ЭлтМеню InsertCheckItem(цел поз, цел элтid, ткст текст);
		public ЭлтМеню InsertCheckItem(цел поз, цел элтid, ткст текст, ткст help);
		public ЭлтМеню InsertRadioItem(цел поз, цел элтid, ткст текст);
		public ЭлтМеню InsertRadioItem(цел поз, цел элтid, ткст текст, ткст help);
		public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, Меню submenu);
		public ЭлтМеню Insert(цел поз, цел элтid, ткст текст, Меню submenu, ткст help);
		public ЭлтМеню Prepend(ЭлтМеню элт);
		public ЭлтМеню Prepend(цел элтid, ткст текст);
		public ЭлтМеню Prepend(цел элтid, ткст текст, ткст help);
		public ЭлтМеню Prepend(цел элтid, ткст текст, ткст help, ItemKind kind);
		public ЭлтМеню PrependSeparator();
		public ЭлтМеню PrependCheckItem(цел элтid, ткст текст);
		public ЭлтМеню PrependCheckItem(цел элтid, ткст текст, ткст help);
		public ЭлтМеню PrependRadioItem(цел элтid, ткст текст);
		public ЭлтМеню PrependRadioItem(цел элтid, ткст текст, ткст help);
		public ЭлтМеню Prepend(цел элтid, ткст текст, Меню submenu);
		public ЭлтМеню Prepend(цел элтid, ткст текст, Меню submenu, ткст help);
		public ЭлтМеню Remove(цел элтid);
		public ЭлтМеню Remove(ЭлтМеню элт);
		public бул Delete(цел элтid);
		public бул Delete(ЭлтМеню элт);
		public бул Разрушь(цел элтid);
		public бул Разрушь(ЭлтМеню элт);
		public  цел FindItem(ткст элт);
		public ЭлтМеню FindItem(цел элтid);
		public ЭлтМеню FindItem(цел элтid, inout Меню меню);
		public ЭлтМеню FindItemByPosition(цел position);
		public проц Включи(цел элтid, бул вкл);
		public бул IsEnabled(цел элтid);
		public бул Отмечен(цел элтid);
		public проц УстЯрлык(цел элтid, ткст ярлык);
		public ткст ДайЯрлык(цел элтid);
		public проц УстHelpString(цел элтid, ткст helpString);
		public ткст GetHelpString(цел элтid);
		public ткст Титул() ;
		public проц Титул(ткст значение) ;
		public ОбработчикСоб ОбработчикСобытий() ;
		public проц ОбработчикСобытий(ОбработчикСоб значение);
		public Окно InvokingWindow() ;
		public проц InvokingWindow(Окно значение);
		public цел Стиль();
		public проц UpdateUI();
		public проц UpdateUI(ОбработчикСоб source);
		public MenuBar menuBar();
		public бул Attached();
		public Меню Родитель();
		public проц Родитель(Меню значение) ;
		public ЭлтМеню FindChildItem(цел элтid);
		public ЭлтМеню FindChildItem(цел элтid, out цел поз);
		public бул SendEvent(цел элтid);
		public бул SendEvent(цел элтid, цел xchecked);
	}
	
	//---------------------------------------------------------------------
	// helper struct, stores added EventListeners...
	
	alias MenuListener wxMenuListener;
	public class MenuListener
	{
		public ДатчикСобытий listener;
		public wxObject owner;
		public цел ид;
		
		public this( цел ид, ДатчикСобытий listener, wxObject owner );
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxMenu_ctor(ткст titel, бцел стиль);
		static extern (C) IntPtr wxMenu_ctor2(бцел стиль);
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
		 
		public this();
		public this(цел стиль);
		public this(ткст titel);
		public this(ткст titel, цел стиль);
		public this(IntPtr wxobj);
		public static wxObject Нов(IntPtr wxobj);
		public проц AddEvent(цел inId, ДатчикСобытий el, wxObject owner);
		public проц ConnectEvents(Окно родитель);
		public ЭлтМеню AppendWL(цел ид, ткст элт, ДатчикСобытий listener);
		public ЭлтМеню AppendWL(цел ид, ткст элт, ткст help, ДатчикСобытий listener);
		public ЭлтМеню AppendWL(цел ид, ткст элт, ткст help, ItemKind kind, ДатчикСобытий listener);
		public ЭлтМеню AppendWL(цел ид, ткст элт, Меню subMenu, ДатчикСобытий listener);
		public ЭлтМеню AppendWL(цел ид, ткст элт, Меню subMenu, ткст help, ДатчикСобытий listener);
		public ЭлтМеню AppendWL(ЭлтМеню элт, ДатчикСобытий listener) ;
	}
