//-----------------------------------------------------------------------------
// wxD - WindowDestroyEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - WindowDestroyEvent.cs
//
/// The wxWindowDestroyEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: WindowDestroyEvent.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.WindowDestroyEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxWindowDestroyEvent_ctor(ЦУк тип);
		static extern (C) ЦУк wxWindowDestroyEvent_GetWindow(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias WindowDestroyEvent wxWindowDestroyEvent;
	public class WindowDestroyEvent : CommandEvent
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(Окно окн = пусто)
			{ this(wxWindowDestroyEvent_ctor(wxObject.SafePtr(окн))); }

		//-----------------------------------------------------------------------------	
		
		public Окно Активен() { return cast(Окно)FindObject(wxWindowDestroyEvent_GetWindow(шхобъ), &Окно.Нов); }

		private static Событие Нов(ЦУк объ) { return new WindowDestroyEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_DESTROY,				&WindowDestroyEvent.Нов);
		}
	}
