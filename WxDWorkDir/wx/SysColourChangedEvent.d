//-----------------------------------------------------------------------------
// wxD - SysColourChangedEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SysColourChangedEvent.cs
//
/// The wxSysColourChangedEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SysColourChangedEvent.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.SysColourChangedEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxSysColourChangedEvent_ctor();
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias SysColourChangedEvent wxSysColourChangedEvent;
	public class SysColourChangedEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxSysColourChangedEvent_ctor()); }

		private static Событие Нов(ЦУк объ) { return new SysColourChangedEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_SYS_COLOUR_CHANGED,			&SysColourChangedEvent.Нов);
		}
	}
