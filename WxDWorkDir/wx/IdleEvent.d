//-----------------------------------------------------------------------------
// wxD - IdleEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - IdleEvent.cs
//
/// The wxIdleEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: IdleEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.IdleEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

	public enum IdleMode
	{
		wxIDLE_PROCESS_ALL,
		wxIDLE_PROCESS_SPECIFIED
	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxIdleEvent_ctor();
		static extern (C) проц   wxIdleEvent_RequestMore(ЦУк сам, бул needMore);
		static extern (C) бул   wxIdleEvent_MoreRequested(ЦУк сам);
		
		static extern (C) проц   wxIdleEvent_SetMode(IdleMode mode);
		static extern (C) IdleMode wxIdleEvent_GetMode();
		static extern (C) бул   wxIdleEvent_CanSend(ЦУк окн);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias IdleEvent wxIdleEvent;
	public class IdleEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxIdleEvent_ctor()); }

		//-----------------------------------------------------------------------------	
		
		public проц RequestMore()
		{
			RequestMore(да);
		}
		
		public проц RequestMore(бул needMore)
		{
			wxIdleEvent_RequestMore(шхобъ, needMore);
		}
		
		//-----------------------------------------------------------------------------	
		
		public бул MoreRequested()
		{
			return wxIdleEvent_MoreRequested(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		static IdleMode Mode() { return wxIdleEvent_GetMode(); }
		static проц Mode(IdleMode значение) { wxIdleEvent_SetMode(значение); }
		
		//-----------------------------------------------------------------------------
		
		public static бул CanSend(Окно окн)
		{
			return wxIdleEvent_CanSend(wxObject.SafePtr(окн));
		}

		private static Событие Нов(ЦУк объ) { return new IdleEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_IDLE, 				&IdleEvent.Нов);
		}
	}
