//-----------------------------------------------------------------------------
// wxD - ContextMenuEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ContextMenuEvent.cs
//
/// The wxContextMenuEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ContextMenuEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ContextMenuEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxContextMenuEvent_ctor(цел тип,цел winid, inout Точка поз);
		static extern (C) проц   wxContextMenuEvent_GetPosition(ЦУк сам, inout Точка поз);
		static extern (C) проц   wxContextMenuEvent_SetPosition(ЦУк сам, inout Точка поз);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias ContextMenuEvent wxContextMenuEvent;
	public class ContextMenuEvent : CommandEvent
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0,Точка pt = Окно.wxDefaultPosition)
			{ this(wxContextMenuEvent_ctor(тип,winid,pt)); }

		//-----------------------------------------------------------------------------	
		
		public Точка Положение() { 
				Точка p;
				wxContextMenuEvent_GetPosition(шхобъ, p); 
				return p;
			}
			
		public проц Положение(Точка значение) { wxContextMenuEvent_SetPosition(шхобъ, значение); }

		private static Событие Нов(ЦУк объ) { return new ContextMenuEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_CONTEXT_MENU,			&ContextMenuEvent.Нов);
		}
	}
