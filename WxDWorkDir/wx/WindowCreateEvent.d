//-----------------------------------------------------------------------------
// wxD - WindowCreateEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - WindowCreateEvent.cs
//
/// The wxWindowCreateEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: WindowCreateEvent.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.WindowCreateEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxWindowCreateEvent_ctor(ЦУк тип);
		static extern (C) ЦУк wxWindowCreateEvent_GetWindow(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias WindowCreateEvent wxWindowCreateEvent;
	public class WindowCreateEvent : CommandEvent
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(Окно окн = пусто)
			{ this(wxWindowCreateEvent_ctor(wxObject.SafePtr(окн))); }

		//-----------------------------------------------------------------------------	
		
		public Окно Активен() { return cast(Окно)FindObject(wxWindowCreateEvent_GetWindow(шхобъ), &Окно.Нов); }

		private static Событие Нов(ЦУк объ) { return new WindowCreateEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_CREATE,				&WindowCreateEvent.Нов);
		}
	}
