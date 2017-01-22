//-----------------------------------------------------------------------------
// wxD - QueryNewPaletteEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - QueryNewPaletteEvent.cs
//
/// The wxQueryNewPaletteEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: QueryNewPaletteEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.QueryNewPaletteEvent;
public import wx.common;

public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxQueryNewPaletteEvent_ctor(цел winid);
		static extern (C) бул wxQueryNewPaletteEvent_GetPaletteRealized(ЦУк сам);
		static extern (C) проц wxQueryNewPaletteEvent_SetPaletteRealized(ЦУк сам, бул realized);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias QueryNewPaletteEvent wxQueryNewPaletteEvent;
	public class QueryNewPaletteEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(цел winid=0)
			{ this(wxQueryNewPaletteEvent_ctor(winid)); }

		//-----------------------------------------------------------------------------	
		
		public бул Realized() { return wxQueryNewPaletteEvent_GetPaletteRealized(шхобъ); }
		public проц Realized(бул значение) { wxQueryNewPaletteEvent_SetPaletteRealized(шхобъ, значение); }

		private static Событие Нов(ЦУк объ) { return new QueryNewPaletteEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_QUERY_NEW_PALETTE,			&QueryNewPaletteEvent.Нов);
		}
	}
