//-----------------------------------------------------------------------------
// wxD - MoveEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MoveEvent.cs
//
/// The wxMoveEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MoveEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MoveEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxMoveEvent_ctor();
		static extern (C) ЦУк wxMoveEvent_GetPosition(ЦУк сам, out Точка point);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias MoveEvent wxMoveEvent;
	public class MoveEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxMoveEvent_ctor()); }

		//-----------------------------------------------------------------------------	
		
		public Точка Положение() {
				Точка point;
				wxMoveEvent_GetPosition(шхобъ, point);
				return point;
			}

		private static Событие Нов(ЦУк объ) { return new MoveEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_MOVE,                            &MoveEvent.Нов);
		}
	}
