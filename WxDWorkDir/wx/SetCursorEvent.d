//-----------------------------------------------------------------------------
// wxD - SetCursorEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SetCursorEvent.cs
//
/// The wxSetCursorEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SetCursorEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SetCursorEvent;
public import wx.common;

public import wx.Event;

public import wx.Cursor;

		//! \cond EXTERN
		static extern (C) ЦУк	wxSetCursorEvent_ctor(цел x,цел y);
		static extern (C) цел		wxSetCursorEvent_GetX(ЦУк сам);
		static extern (C) цел		wxSetCursorEvent_GetY(ЦУк сам);
		static extern (C) проц		wxSetCursorEvent_SetCursor(ЦУк сам, ЦУк cursor);
		static extern (C) ЦУк	wxSetCursorEvent_GetCursor(ЦУк сам);
		static extern (C) бул		wxSetCursorEvent_HasCursor(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias SetCursorEvent wxSetCursorEvent;
	public class SetCursorEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(цел x=0,цел y=0)
			{ this(wxSetCursorEvent_ctor(x,y)); }

		//-----------------------------------------------------------------------------	
		
		public цел X() { return wxSetCursorEvent_GetX(шхобъ); }
		
		//-----------------------------------------------------------------------------	
		
		public цел Y() { return wxSetCursorEvent_GetY(шхобъ); }
		
		//-----------------------------------------------------------------------------	
		
		public Cursor cursor() { return cast(Cursor)FindObject(wxSetCursorEvent_GetCursor(шхобъ), &Cursor.Нов); }
		public проц cursor(Cursor значение) { wxSetCursorEvent_SetCursor(шхобъ, wxObject.SafePtr(значение)); }
		
		//-----------------------------------------------------------------------------	
		
		public бул HasCursor() { return wxSetCursorEvent_HasCursor(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new SetCursorEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_SET_CURSOR,				&SetCursorEvent.Нов);
		}
	}
