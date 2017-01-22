//-----------------------------------------------------------------------------
// wxD - HelpEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - HelpEvent.cs
//
/// The wxHelpEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HelpEvent.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.HelpEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxHelpEvent_ctor(цел тип,цел winid, inout Точка поз);
		static extern (C) проц   wxHelpEvent_GetPosition(ЦУк сам, inout Точка поз);
		static extern (C) проц   wxHelpEvent_SetPosition(ЦУк сам, inout Точка поз);
		static extern (C) ЦУк wxHelpEvent_GetLink(ЦУк сам);
		static extern (C) проц   wxHelpEvent_SetLink(ЦУк сам, ткст link);
		static extern (C) ЦУк wxHelpEvent_GetTarget(ЦУк сам);
		static extern (C) проц   wxHelpEvent_SetTarget(ЦУк сам, ткст target);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias HelpEvent wxHelpEvent;
	public class HelpEvent : CommandEvent
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0, Точка поз = Окно.wxDefaultPosition)
			{ this(wxHelpEvent_ctor(тип,winid,поз)); }

		//-----------------------------------------------------------------------------	
		
		public Точка Положение() { 
				Точка p;
				wxHelpEvent_GetPosition(шхобъ, p); 
				return p;
			}
			
		public проц Положение(Точка значение) { wxHelpEvent_SetPosition(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------	
		
		public ткст Link() { return cast(ткст) new wxString(wxHelpEvent_GetLink(шхобъ), да); }
		public проц Link(ткст значение) { wxHelpEvent_SetLink(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------	
		
		public ткст Target() { return cast(ткст) new wxString(wxHelpEvent_GetTarget(шхобъ), да); }
		public проц Target(ткст значение) { wxHelpEvent_SetTarget(шхобъ, значение); }


		private static Событие Нов(ЦУк объ) { return new HelpEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_HELP,				&HelpEvent.Нов);
			ДобавьТипСоб(wxEVT_DETAILED_HELP,			&HelpEvent.Нов);
		}
	}
