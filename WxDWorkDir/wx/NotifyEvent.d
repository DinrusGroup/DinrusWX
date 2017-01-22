//-----------------------------------------------------------------------------
// wxD - NotifyEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
//
/// The wxNotifyEvent wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NotifyEvent.d,v 1.6 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NotifyEvent;
public import wx.common;
public import wx.CommandEvent;


		//! \cond EXTERN
		static extern (C) ЦУк wxNotifyEvent_ctor(ТипСобытия commandtype,цел winid);
		static extern (C) проц   wxNotifyEvent_Veto(ЦУк сам);
		static extern (C) проц   wxNotifyEvent_Allow(ЦУк сам);
		static extern (C) бул   wxNotifyEvent_IsAllowed(ЦУк сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias NotifyEvent wxNotifyEvent;
	public class NotifyEvent : CommandEvent
	{

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия commandtype = wxEVT_NULL,цел winid = 0)
		{
			this(wxNotifyEvent_ctor(commandtype,winid));
		}

		//-----------------------------------------------------------------------------

		public проц Veto() { wxNotifyEvent_Veto(шхобъ); }
		public проц Allow() { wxNotifyEvent_Veto(шхобъ); }
		public проц IsAllowed() { return wxNotifyEvent_IsAllowed(шхобъ); }
	}
