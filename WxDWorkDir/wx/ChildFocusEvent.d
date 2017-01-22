//-----------------------------------------------------------------------------
// wxD - ChildFocusEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ChildFocusEvent.cs
//
/// The wxChildFocusEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ChildFocusEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ChildFocusEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxChildFocusEvent_ctor(ЦУк окн);
		static extern (C) ЦУк wxChildFocusEvent_GetWindow(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias ChildFocusEvent wxChildFocusEvent;
	public class ChildFocusEvent : CommandEvent
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		public this(Окно окн)
			{ super(wxChildFocusEvent_ctor(wxObject.SafePtr(окн))); }

		//-----------------------------------------------------------------------------	
		
		public Окно окно() { return cast(Окно)FindObject(wxChildFocusEvent_GetWindow(шхобъ), &Окно.Нов); }

		private static Событие Нов(ЦУк объ) { return new ChildFocusEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_CHILD_FOCUS,				&ChildFocusEvent.Нов);
		}
	}
