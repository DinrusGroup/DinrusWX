//-----------------------------------------------------------------------------
// wxD - FocusEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FocusEvent.cs
//
/// The wxFocusEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FocusEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.FocusEvent;
public import wx.common;

public import wx.Window;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxFocusEvent_ctor(цел тип,цел winid);
		static extern (C) ЦУк wxFocusEvent_GetWindow(ЦУк сам);
		static extern (C) проц   wxFocusEvent_SetWindow(ЦУк сам, ЦУк окн);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias FocusEvent wxFocusEvent;
	public class FocusEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия тип = wxEVT_NULL, цел winid = 0)
			{ this(wxFocusEvent_ctor(тип,winid)); }

		//-----------------------------------------------------------------------------	
		
		public Окно окно() { return cast(Окно)FindObject(wxFocusEvent_GetWindow(шхобъ), &Окно.Нов); }
		public проц окно(Окно значение) { wxFocusEvent_SetWindow(шхобъ, wxObject.SafePtr(значение)); }

		private static Событие Нов(ЦУк объ) { return new FocusEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_SET_FOCUS,				&FocusEvent.Нов);
			ДобавьТипСоб(wxEVT_KILL_FOCUS,				&FocusEvent.Нов);
		}
	}
