//-----------------------------------------------------------------------------
// wxD - CloseEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - CloseEvent.cs
//
/// The wxCloseEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: CloseEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.CloseEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxCloseEvent_ctor(цел тип,цел winid);
		static extern (C) проц wxCloseEvent_SetLoggingOff(ЦУк сам, бул logOff);
		static extern (C) бул wxCloseEvent_GetLoggingOff(ЦУк сам);
		static extern (C) проц wxCloseEvent_Veto(ЦУк сам, бул veto);
		static extern (C) проц wxCloseEvent_SetCanVeto(ЦУк сам, бул canVeto);
		static extern (C) бул wxCloseEvent_CanVeto(ЦУк сам);
		static extern (C) бул wxCloseEvent_GetVeto(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias CloseEvent wxCloseEvent;
	public class CloseEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0)
			{ this(wxCloseEvent_ctor(тип,winid)); }

		//-----------------------------------------------------------------------------
		
		public бул LoggingOff() { return wxCloseEvent_GetLoggingOff(шхобъ); }
		public проц LoggingOff(бул значение) { wxCloseEvent_SetLoggingOff(шхобъ, значение); } 
		
		public проц Veto()
		{
			Veto(да);
		}
		
		public проц Veto(бул veto)
		{
			wxCloseEvent_Veto(шхобъ, veto);
		}
		
		public проц CanVeto(бул значение) { wxCloseEvent_SetCanVeto(шхобъ, значение); }
		public бул CanVeto() { return wxCloseEvent_CanVeto(шхобъ); }
		
		public бул GetVeto() { return wxCloseEvent_GetVeto(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new CloseEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_CLOSE_WINDOW,                    &CloseEvent.Нов);
			ДобавьТипСоб(wxEVT_END_SESSION,                     &CloseEvent.Нов);
			ДобавьТипСоб(wxEVT_QUERY_END_SESSION,               &CloseEvent.Нов);
		}
	}
