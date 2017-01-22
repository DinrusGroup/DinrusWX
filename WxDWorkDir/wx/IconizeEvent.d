//-----------------------------------------------------------------------------
// wxD - IconizeEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - IconizeEvent.cs
//
/// The wxIconizeEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: IconizeEvent.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.IconizeEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxIconizeEvent_ctor(цел winid,бул iconized);
		static extern (C) бул wxIconizeEvent_Iconized(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias IconizeEvent wxIconizeEvent;
	public class IconizeEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(цел winid = 0, бул iconized = да)
			{ this(wxIconizeEvent_ctor(winid,iconized)); }

		//-----------------------------------------------------------------------------	
		
		public бул Iconized() { return wxIconizeEvent_Iconized(шхобъ); }


		private static Событие Нов(ЦУк объ) { return new IconizeEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_ICONIZE,				&IconizeEvent.Нов);
		}
	}
