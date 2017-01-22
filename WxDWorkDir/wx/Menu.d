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
		static extern (C) ЦУк wxMenuBase_ctor1(ткст titel, бцел стиль);
		static extern (C) ЦУк wxMenuBase_ctor2(бцел стиль);
		
		static extern (C) ЦУк wxMenuBase_Append(ЦУк сам, цел ид, ткст элемент, ткст справка, ItemKind вид);
		static extern (C) ЦУк wxMenuBase_AppendSubMenu(ЦУк сам, цел ид, ткст элемент, ЦУк подменю, ткст справка);
		static extern (C) ЦУк wxMenuBase_AppendItem(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxMenuBase_AppendSeparator(ЦУк сам);
		static extern (C) ЦУк wxMenuBase_AppendCheckItem(ЦУк сам, цел itemid, ткст текст, ткст справка);
		static extern (C) ЦУк wxMenuBase_AppendRadioItem(ЦУк сам, цел itemid, ткст текст, ткст справка);
		static extern (C) цел    wxMenuBase_GetMenuItemCount(ЦУк сам);
		static extern (C) ЦУк wxMenuBase_GetMenuItem(ЦУк сам, цел индекс);
		static extern (C) проц   wxMenuBase_Break(ЦУк сам);
		
		static extern (C) ЦУк wxMenuBase_Insert(ЦУк сам, цел поз, ЦУк элемент);
		static extern (C) ЦУк wxMenuBase_Insert2(ЦУк сам, цел поз, цел itemid, ткст текст, ткст справка, ItemKind вид);
		static extern (C) ЦУк wxMenuBase_InsertSeparator(ЦУк сам, цел поз);
		static extern (C) ЦУк wxMenuBase_InsertCheckItem(ЦУк сам, цел поз, цел itemid, ткст текст, ткст справка);
		static extern (C) ЦУк wxMenuBase_InsertRadioItem(ЦУк сам, цел поз, цел itemid, ткст текст, ткст справка);
		static extern (C) ЦУк wxMenuBase_InsertSubMenu(ЦУк сам, цел поз, цел itemid, ткст текст, ЦУк submenu, ткст справка);
		
		static extern (C) ЦУк wxMenuBase_Prepend(ЦУк сам, ЦУк элемент);
		static extern (C) ЦУк wxMenuBase_Prepend2(ЦУк сам, цел itemid, ткст текст, ткст справка, ItemKind вид);
		static extern (C) ЦУк wxMenuBase_PrependSeparator(ЦУк сам);
		static extern (C) ЦУк wxMenuBase_PrependCheckItem(ЦУк сам, цел itemid, ткст текст, ткст справка);
		static extern (C) ЦУк wxMenuBase_PrependRadioItem(ЦУк сам, цел itemid, ткст текст, ткст справка);
		static extern (C) ЦУк wxMenuBase_PrependSubMenu(ЦУк сам, цел itemid, ткст текст, ЦУк submenu, ткст справка);
		
		static extern (C) ЦУк wxMenuBase_Remove(ЦУк сам, цел itemid);
		static extern (C) ЦУк wxMenuBase_Remove2(ЦУк сам, ЦУк элемент);
		
		static extern (C) бул   wxMenuBase_Delete(ЦУк сам, цел itemid);
		static extern (C) бул   wxMenuBase_Delete2(ЦУк сам, ЦУк элемент);
		
		static extern (C) бул   wxMenuBase_Destroy(ЦУк сам, цел itemid);
		static extern (C) бул   wxMenuBase_Destroy2(ЦУк сам, ЦУк элемент);
		
		static extern (C) цел    wxMenuBase_FindItem(ЦУк сам, ткст элемент);
		static extern (C) ЦУк wxMenuBase_FindItem2(ЦУк сам, цел itemid, inout ЦУк меню); 
		static extern (C) ЦУк wxMenuBase_FindItemByPosition(ЦУк сам, цел position);
		
		static extern (C) проц   wxMenuBase_Enable(ЦУк сам, цел itemid, бул enable);
		static extern (C) бул   wxMenuBase_IsEnabled(ЦУк сам, цел itemid);
		
		static extern (C) проц   wxMenuBase_Check(ЦУк сам, цел ид, бул check);
		static extern (C) бул   wxMenuBase_IsChecked(ЦУк сам, цел itemid);
		
		static extern (C) проц   wxMenuBase_SetLabel(ЦУк сам, цел itemid, ткст надпись);
		static extern (C) ЦУк wxMenuBase_GetLabel(ЦУк сам, цел itemid);
		
		static extern (C) проц   wxMenuBase_SetHelpString(ЦУк сам, цел itemid, ткст helpString);
		static extern (C) ЦУк wxMenuBase_GetHelpString(ЦУк сам, цел itemid);		
		
		static extern (C) проц   wxMenuBase_SetTitle(ЦУк сам, ткст title);
		static extern (C) ЦУк wxMenuBase_GetTitle(ЦУк сам);		
		
		static extern (C) проц   wxMenuBase_SetInvokingWindow(ЦУк сам, ЦУк окн);
		static extern (C) ЦУк wxMenuBase_GetInvokingWindow(ЦУк сам);
		
		static extern (C) бцел   wxMenuBase_GetStyle(ЦУк сам);
		
		static extern (C) проц   wxMenuBase_SetEventHandler(ЦУк сам, ЦУк handler);
		static extern (C) ЦУк wxMenuBase_GetEventHandler(ЦУк сам);
		
		static extern (C) проц   wxMenuBase_UpdateUI(ЦУк сам, ЦУк source);
		
		static extern (C) ЦУк wxMenuBase_GetMenuBar(ЦУк сам);
		
		static extern (C) бул   wxMenuBase_IsAttached(ЦУк сам);
		
		static extern (C) проц   wxMenuBase_SetParent(ЦУк сам, ЦУк родитель);
		static extern (C) ЦУк wxMenuBase_GetParent(ЦУк сам);
		
		static extern (C) ЦУк wxMenuBase_FindChildItem(ЦУк сам, цел itemid, out цел поз);
		static extern (C) ЦУк wxMenuBase_FindChildItem2(ЦУк сам, цел itemid);
		static extern (C) бул   wxMenuBase_SendEvent(ЦУк сам, цел itemid, цел xchecked);
		//! \endcond
	
	alias MenuBase wxMenuBase;
	public class MenuBase : EvtHandler
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this(цел стиль = 0)
			{ this(wxMenuBase_ctor2(cast(бцел)стиль));}
		
		public this(ткст titel, цел стиль = 0)
			{ this(wxMenuBase_ctor1(titel, cast(бцел)стиль)); }
			
		//---------------------------------------------------------------------
		
		public ЭлементМеню Append(цел ид, ткст элемент)
		{
			return this.Append(ид, элемент, "");
		}
		
		public ЭлементМеню Append(цел ид, ткст элемент, ткст справка)
		{
			return Append(ид, элемент, справка, ItemKind.wxITEM_NORMAL);
		}		

		public ЭлементМеню Append(цел ид, ткст элемент, ткст справка, ItemKind вид)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Append(шхобъ, ид, элемент, справка, вид), &ЭлементМеню.New2);
		}
		
		public ЭлементМеню Append(цел ид, ткст элемент, Меню подменю)
		{
			return Append(ид, элемент, подменю, "");
		}

		public ЭлементМеню Append(цел ид, ткст элемент, Меню подменю, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_AppendSubMenu(шхобъ, ид, элемент, wxObject.SafePtr(подменю), справка), &ЭлементМеню.New2);
		}

		public ЭлементМеню Append(ЭлементМеню элемент) 
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_AppendItem(шхобъ, wxObject.SafePtr(элемент)), &ЭлементМеню.New2);
		}

		//---------------------------------------------------------------------
		
		public ЭлементМеню AppendCheckItem(цел ид, ткст элемент)
		{
			return AppendCheckItem(ид, элемент, "");
		}

		public ЭлементМеню AppendCheckItem(цел ид, ткст элемент, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_AppendCheckItem(шхобъ, ид, элемент, справка), &ЭлементМеню.New2);
		}

		//---------------------------------------------------------------------

		public ЭлементМеню AppendSeparator()
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_AppendSeparator(шхобъ), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню AppendRadioItem(цел itemid, ткст текст)
		{
			return AppendRadioItem(itemid, текст, "");
		}
		
		public ЭлементМеню AppendRadioItem(цел itemid, ткст текст, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_AppendRadioItem(шхобъ, itemid, текст, справка), &ЭлементМеню.New2);
		}

		//---------------------------------------------------------------------

		public проц Check(цел ид, бул check)
		{
			wxMenuBase_Check(шхобъ, ид, check);
		}

		//---------------------------------------------------------------------

		public цел GetMenuItemCount()
		{
			return wxMenuBase_GetMenuItemCount(шхобъ);
		}

		public ЭлементМеню GetMenuItem(цел индекс)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_GetMenuItem(шхобъ, индекс), &ЭлементМеню.New2);
		}

		//---------------------------------------------------------------------
		
		public /+virtual+/ проц Break()
		{
			wxMenuBase_Break(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню Insert(цел поз, ЭлементМеню элемент)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Insert(шхобъ, поз, wxObject.SafePtr(элемент)), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню Insert(цел поз, цел itemid, ткст текст)
		{
			return Insert(поз, itemid, текст, "", ItemKind.wxITEM_NORMAL);
		}
		
		public ЭлементМеню Insert(цел поз, цел itemid, ткст текст, ткст справка)
		{
			return Insert(поз, itemid, текст, справка, ItemKind.wxITEM_NORMAL);
		}
		
		public ЭлементМеню Insert(цел поз, цел itemid, ткст текст, ткст справка, ItemKind вид)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Insert2(шхобъ, поз, itemid, текст, справка, вид), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню InsertSeparator(цел поз)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_InsertSeparator(шхобъ, поз), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню InsertCheckItem(цел поз, цел itemid, ткст текст)
		{
			return InsertCheckItem(поз, itemid, текст, "");
		}
		
		public ЭлементМеню InsertCheckItem(цел поз, цел itemid, ткст текст, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_InsertCheckItem(шхобъ, поз, itemid, текст, справка), &ЭлементМеню.New2);
		}		
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню InsertRadioItem(цел поз, цел itemid, ткст текст)
		{
			return InsertCheckItem(поз, itemid, текст, "");
		}
		
		public ЭлементМеню InsertRadioItem(цел поз, цел itemid, ткст текст, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_InsertRadioItem(шхобъ, поз, itemid, текст, справка), &ЭлементМеню.New2);
		}				
		
		//---------------------------------------------------------------------

		public ЭлементМеню Insert(цел поз, цел itemid, ткст текст, Меню submenu)
		{
			return Insert(поз, itemid, текст, submenu, "");
		}
		
		public ЭлементМеню Insert(цел поз, цел itemid, ткст текст, Меню submenu, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_InsertSubMenu(шхобъ, поз, itemid, текст, wxObject.SafePtr(submenu), справка), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню Prepend(ЭлементМеню элемент)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Prepend(шхобъ, wxObject.SafePtr(элемент)), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню Prepend(цел itemid, ткст текст)
		{
			return Prepend(itemid, текст, "", ItemKind.wxITEM_NORMAL);
		}
		
		public ЭлементМеню Prepend(цел itemid, ткст текст, ткст справка)
		{
			return Prepend(itemid, текст, справка, ItemKind.wxITEM_NORMAL);
		}
		
		public ЭлементМеню Prepend(цел itemid, ткст текст, ткст справка, ItemKind вид)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Prepend2(шхобъ, itemid, текст, справка, вид), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню PrependSeparator()
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_PrependSeparator(шхобъ));
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню PrependCheckItem(цел itemid, ткст текст)
		{
			return PrependCheckItem(itemid, текст, "");
		}
		
		public ЭлементМеню PrependCheckItem(цел itemid, ткст текст, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_PrependCheckItem(шхобъ, itemid, текст, справка), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню PrependRadioItem(цел itemid, ткст текст)
		{
			return PrependRadioItem(itemid, текст, "");
		}
		
		public ЭлементМеню PrependRadioItem(цел itemid, ткст текст, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_PrependRadioItem(шхобъ, itemid, текст, справка), &ЭлементМеню.New2);
		}		
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню Prepend(цел itemid, ткст текст, Меню submenu)
		{
			return Prepend(itemid, текст, submenu, "");
		}
		
		public ЭлементМеню Prepend(цел itemid, ткст текст, Меню submenu, ткст справка)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_PrependSubMenu(шхобъ, itemid, текст, wxObject.SafePtr(submenu), справка), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню Remove(цел itemid)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Remove(шхобъ, itemid), &ЭлементМеню.New2);
		}
		
		public ЭлементМеню Remove(ЭлементМеню элемент)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_Remove2(шхобъ, wxObject.SafePtr(элемент)), &ЭлементМеню.New2);
		}		
		
		//---------------------------------------------------------------------
		
		public бул Delete(цел itemid)
		{
			return wxMenuBase_Delete(шхобъ, itemid);
		}
		
		public бул Delete(ЭлементМеню элемент)
		{
			return wxMenuBase_Delete2(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		
		public бул Разрушь(цел itemid)
		{
			return wxMenuBase_Destroy(шхобъ, itemid);
		}
		
		public бул Разрушь(ЭлементМеню элемент)
		{
			return wxMenuBase_Destroy2(шхобъ, wxObject.SafePtr(элемент));
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ цел FindItem(ткст элемент)
		{
			return wxMenuBase_FindItem(шхобъ, элемент);
		}
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню FindItem(цел itemid)
		{
			Меню menuRef = пусто;
			return FindItem(itemid, menuRef);
		}
		
		public ЭлементМеню FindItem(цел itemid, inout Меню меню)
		{
			ЦУк menuRef = ЦУк.init;
			if (меню) 
			{
				menuRef = wxObject.SafePtr(меню);
			}
			return cast(ЭлементМеню)FindObject(wxMenuBase_FindItem2(шхобъ, itemid, menuRef), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		 
		public ЭлементМеню FindItemByPosition(цел position)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_FindItemByPosition(шхобъ, position), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public проц Enable(цел itemid, бул enable)
		{
			wxMenuBase_Enable(шхобъ, itemid, enable);
		}
		
		public бул IsEnabled(цел itemid)
		{
			return wxMenuBase_IsEnabled(шхобъ, itemid);
		}
		
		//---------------------------------------------------------------------
		
		public бул IsChecked(цел itemid)
		{
			return wxMenuBase_IsChecked(шхобъ, itemid);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetLabel(цел itemid, ткст надпись)
		{
			wxMenuBase_SetLabel(шхобъ, itemid, надпись);
		}
		
		public ткст GetLabel(цел itemid)
		{
			return cast(ткст) new wxString(wxMenuBase_GetLabel(шхобъ, itemid), да);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetHelpString(цел itemid, ткст helpString)
		{
			wxMenuBase_SetHelpString(шхобъ, itemid, helpString);
		}
		
		public ткст GetHelpString(цел itemid)
		{
			return cast(ткст) new wxString(wxMenuBase_GetHelpString(шхобъ, itemid), да);
		}
		
		//---------------------------------------------------------------------
		
		public ткст Title() { return cast(ткст) new wxString(wxMenuBase_GetTitle(шхобъ), да); }
		public проц Title(ткст значение) { wxMenuBase_SetTitle(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public EvtHandler EventHandler() {
		//	return cast(EvtHandler)FindObject(wxMenuBase_GetEventHandler(шхобъ), &EvtHandler.Нов);
			ЦУк ptr = wxMenuBase_GetEventHandler(шхобъ);
			wxObject o = FindObject(ptr);
			if (o) return cast(EvtHandler)o;
			else return new EvtHandler(ptr);
		}
		public проц EventHandler(EvtHandler значение) { wxMenuBase_SetEventHandler(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public Окно InvokingWindow() { return cast(Окно)FindObject(wxMenuBase_GetInvokingWindow(шхобъ), &Окно.Нов); }
		public проц InvokingWindow(Окно значение) { wxMenuBase_SetInvokingWindow(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public цел Style() { return cast(цел)wxMenuBase_GetStyle(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public проц UpdateUI()
		{
			UpdateUI(пусто);
		}
		
		public проц UpdateUI(EvtHandler source)
		{
			wxMenuBase_UpdateUI(шхобъ, wxObject.SafePtr(source));
		}
		
		//---------------------------------------------------------------------
		
		public MenuBar menuBar() { return cast(MenuBar)FindObject(wxMenuBase_GetMenuBar(шхобъ), &MenuBar.Нов); }
		
		//---------------------------------------------------------------------
		
		public бул Attached() { return wxMenuBase_IsAttached(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public Меню Parent() { return cast(Меню)FindObject(wxMenuBase_GetParent(шхобъ), &Меню.Нов); }
		public проц Parent(Меню значение) { wxMenuBase_SetParent(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public ЭлементМеню FindChildItem(цел itemid)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_FindChildItem2(шхобъ, itemid), &ЭлементМеню.New2);
		}
		
		public ЭлементМеню FindChildItem(цел itemid, out цел поз)
		{
			return cast(ЭлементМеню)FindObject(wxMenuBase_FindChildItem(шхобъ, itemid, поз), &ЭлементМеню.New2);
		}
		
		//---------------------------------------------------------------------
		
		public бул SendEvent(цел itemid)
		{
			return SendEvent(itemid, -1);
		}
		
		public бул SendEvent(цел itemid, цел xchecked)
		{
			return wxMenuBase_SendEvent(шхобъ, itemid, xchecked);
		}		
	}
	
	//---------------------------------------------------------------------
	// helper struct, stores added EventListeners...
	
	alias MenuListener wxMenuListener;
	public class MenuListener
	{
		public EventListener listener;
		public wxObject owner;
		public цел ид;
		
		public this( цел ид, EventListener listener, wxObject owner )
		{
			this.listener = listener;
			this.owner = owner;
			this.ид = ид;
		}
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxMenu_ctor(ткст titel, бцел стиль);
		static extern (C) ЦУк wxMenu_ctor2(бцел стиль);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias Меню wxMenu;
	public class Меню : MenuBase
	{
		public MenuListener[] eventListeners;

		// InvokingWindow does not work on Windows, so we 
		// need this...
		private Окно родитель = пусто;

		// if events were connected with Frame.MenuBar or Окно.PopupMenu
		// that means with ConnectEvents(), we have a Invoking Окно and can add 
		// the event directly to the EventHandler
		private бул eventsconnected = нет; 
		
		//---------------------------------------------------------------------
		 
		public this()
			{ this(0);}
			
		public this(цел стиль)
			{ this(wxMenu_ctor2(cast(бцел)стиль));}
		
		public this(ткст titel)
			{ this(titel, 0);}
		
		public this(ткст titel, цел стиль)
			{ this(wxMenu_ctor(titel, cast(бцел)стиль)); }

		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public static wxObject Нов(ЦУк шхобъ)
		{
			return new Меню(шхобъ);
		}
			
		//---------------------------------------------------------------------
			
		public проц AddEvent(цел inId, EventListener el, wxObject owner)
		{
			// This is the only way of handling меню selection events (maybe there is an other solution)
			// But for now we have to add the EventListener to the EventHandler of the invoking окно,
			// otherwise nothing happens.
			// As цел as we do not have an invoking окно, which means, that for example the
			// MenuBar of this Меню isn't connected to a Frame, the EventListener gets only
			// added to the ArrayList, otherwise it gets directly added to the EventHandler of
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
		public ЭлементМеню AppendWL(цел ид, ткст элемент, EventListener listener)
		{
			ЭлементМеню tmpitem = Append(ид, элемент, "");
			
			AddEvent( ид, listener, tmpitem );
			
			return tmpitem;
		}
		
		public ЭлементМеню AppendWL(цел ид, ткст элемент, ткст справка, EventListener listener)
		{
			ЭлементМеню tmpitem = Append(ид, элемент, справка, ItemKind.wxITEM_NORMAL);
			
			AddEvent( ид, listener, tmpitem );
			
			return tmpitem;
		}
		
		public ЭлементМеню AppendWL(цел ид, ткст элемент, ткст справка, ItemKind вид, EventListener listener)
		{
			ЭлементМеню tmpitem = Append(ид, элемент, справка, вид);
			
			AddEvent( ид, listener, tmpitem );
			
			return tmpitem;
		}
		
		public ЭлементМеню AppendWL(цел ид, ткст элемент, Меню подменю, EventListener listener)
		{
			ЭлементМеню tmpitem = Append(ид, элемент, подменю, "");
			
			AddEvent( ид, listener, tmpitem );
			
			return tmpitem;
		}

		public ЭлементМеню AppendWL(цел ид, ткст элемент, Меню подменю, ткст справка, EventListener listener)
		{
			ЭлементМеню tmpitem = Append(ид, элемент, подменю, справка);
			
			AddEvent( ид, listener, tmpitem );
			
			return tmpitem;
		}

		public ЭлементМеню AppendWL(ЭлементМеню элемент, EventListener listener) 
		{
			ЭлементМеню tmpitem = Append(элемент);
			AddEvent(элемент.ИД, listener, tmpitem);
			return tmpitem;
		}
	}
