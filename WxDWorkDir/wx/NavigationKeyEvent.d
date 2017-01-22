//-----------------------------------------------------------------------------
// wxD - NavigationKeyEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - NavigationKeyEvent.cs
//
/// The wxNavigationKeyEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NavigationKeyEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NavigationKeyEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxNavigationKeyEvent_ctor();
		static extern (C) бул wxNavigationKeyEvent_GetDirection(ЦУк сам);
		static extern (C) проц wxNavigationKeyEvent_SetDirection(ЦУк сам, бул bForward);
		static extern (C) бул wxNavigationKeyEvent_IsWindowChange(ЦУк сам);
		static extern (C) проц wxNavigationKeyEvent_SetWindowChange(ЦУк сам, бул bIs);
		static extern (C) ЦУк wxNavigationKeyEvent_GetCurrentFocus(ЦУк сам);
		static extern (C) проц wxNavigationKeyEvent_SetCurrentFocus(ЦУк сам, ЦУк окн);
		static extern (C) проц wxNavigationKeyEvent_SetFlags(ЦУк сам, бцел флаги);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias NavigationKeyEvent wxNavigationKeyEvent;
	public class NavigationKeyEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxNavigationKeyEvent_ctor()); }
			
		//-----------------------------------------------------------------------------
		
		public бул Direction() { return wxNavigationKeyEvent_GetDirection(шхобъ); }
		public проц Direction(бул значение) { wxNavigationKeyEvent_SetDirection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public бул WindowChange() { return wxNavigationKeyEvent_IsWindowChange(шхобъ); }
		public проц WindowChange(бул значение) { wxNavigationKeyEvent_SetWindowChange(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public Окно CurrentFocus() { return cast(Окно)FindObject(wxNavigationKeyEvent_GetCurrentFocus(шхобъ), &Окно.Нов); }
		public проц CurrentFocus(Окно значение) { wxNavigationKeyEvent_SetCurrentFocus(шхобъ, wxObject.SafePtr(значение)); }
		
		//-----------------------------------------------------------------------------
		
		public проц Флаги(цел значение) { wxNavigationKeyEvent_SetFlags(шхобъ, cast(бцел)значение); }

		private static Событие Нов(ЦУк объ) { return new NavigationKeyEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_NAVIGATION_KEY,			&NavigationKeyEvent.Нов);
		}
	}
