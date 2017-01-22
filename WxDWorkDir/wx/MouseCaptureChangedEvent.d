//-----------------------------------------------------------------------------
// wxD - MouseCaptureChangedEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MouseCaptureChangedEvent.cs
//
/// The wxMouseCaptureChangedEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MouseCaptureChangedEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MouseCaptureChangedEvent;
public import wx.common;

public import wx.Event;

public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxMouseCaptureChangedEvent_ctor(цел winid,ЦУк gainedCapture);
		static extern (C) ЦУк wxMouseCaptureChangedEvent_GetCapturedWindow(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias MouseCaptureChangedEvent wxMouseCaptureChangedEvent;
	public class MouseCaptureChangedEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(цел winid = 0, Окно gainedCapture = пусто)
			{ this(wxMouseCaptureChangedEvent_ctor(winid,wxObject.SafePtr(gainedCapture))); }

		//-----------------------------------------------------------------------------	
		
		public Окно CapturedWindow() { return cast(Окно)FindObject(wxMouseCaptureChangedEvent_GetCapturedWindow(шхобъ), &Окно.Нов); }

		private static Событие Нов(ЦУк объ) { return new MouseCaptureChangedEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_MOUSE_CAPTURE_CHANGED,		&MouseCaptureChangedEvent.Нов);
		}
	}
