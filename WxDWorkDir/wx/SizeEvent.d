//-----------------------------------------------------------------------------
// wxD - SizeEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SizeEvent.cs
//
/// The wxSizeEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SizeEvent.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SizeEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxSizeEvent_ctor();
		static extern (C) ЦУк wxSizeEvent_ctorSize(inout Размер sz,цел winid);
		static extern (C) ЦУк wxSizeEvent_ctorRect(inout Rect sz,цел winid);
		static extern (C) проц wxSizeEvent_GetSize(ЦУк сам, out Размер size);
		static extern (C) проц wxSizeEvent_GetRect(ЦУк сам, out Rect прям);
		static extern (C) проц wxSizeEvent_SetRect(ЦУк сам, inout Rect прям);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias SizeEvent wxSizeEvent;
	public class SizeEvent : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxSizeEvent_ctor()); }

		public this(Размер sz,цел winid = 0)
			{ this(wxSizeEvent_ctorSize(sz,winid)); }

		public this(Прямоугольник прям,цел winid = 0)
			{ this(wxSizeEvent_ctorRect(прям,winid)); }


		//-----------------------------------------------------------------------------	
		
		public Размер size()
			{
				Размер size;
				wxSizeEvent_GetSize(шхобъ, size);
				return size;
			}

		public Прямоугольник прям()
			{
				Прямоугольник прям;
				wxSizeEvent_GetRect(шхобъ, прям);
				return прям;
			}

		public проц прям(Прямоугольник прям)
			{
				wxSizeEvent_SetRect(шхобъ, прям);
			}


		private static Событие Нов(ЦУк объ) { return new SizeEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_SIZE,                            &SizeEvent.Нов);
		}
	}
