//-----------------------------------------------------------------------------
// wxD - ShowEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ShowEvent.cs
//
/// The wxShowEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ShowEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ShowEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxShowEvent_ctor(цел winid, бул show);
		//static extern (C) бул wxShowEvent_GetShow(ЦУк сам);
		static extern (C) проц wxShowEvent_SetShow(ЦУк сам, бул show);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias ShowEvent wxShowEvent;
	public class ShowEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(цел winid = 0, бул show = нет)
			{ this(wxShowEvent_ctor(winid,show)); }

		//-----------------------------------------------------------------------------	
		
		//public бул Show() { return wxShowEvent_GetShow(шхобъ); }
		public проц Show(бул значение) { wxShowEvent_SetShow(шхобъ, значение); }

		private static Событие Нов(ЦУк объ) { return new ShowEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_SHOW,				&ShowEvent.Нов);
		}
	}
