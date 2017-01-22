//-----------------------------------------------------------------------------
// wxD - Cursor.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Cursor.cs
//
/// The wxCursor wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Cursor.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Cursor;
public import wx.common;
public import wx.Bitmap;

	public enum StockCursor
	{
		wxCURSOR_NONE,
		wxCURSOR_ARROW,
		wxCURSOR_RIGHT_ARROW,
		wxCURSOR_BULLSEYE,
		wxCURSOR_CHAR,
		wxCURSOR_CROSS,
		wxCURSOR_HAND,
		wxCURSOR_IBEAM,
		wxCURSOR_LEFT_BUTTON,
		wxCURSOR_MAGNIFIER,
		wxCURSOR_MIDDLE_BUTTON,
		wxCURSOR_NO_ENTRY,
		wxCURSOR_PAINT_BRUSH,
		wxCURSOR_PENCIL,
		wxCURSOR_POINT_LEFT,
		wxCURSOR_POINT_RIGHT,
		wxCURSOR_QUESTION_ARROW,
		wxCURSOR_RIGHT_BUTTON,
		wxCURSOR_SIZENESW,
		wxCURSOR_SIZENS,
		wxCURSOR_SIZENWSE,
		wxCURSOR_SIZEWE,
		wxCURSOR_SIZING,
		wxCURSOR_SPRAYCAN,
		wxCURSOR_WAIT,
		wxCURSOR_WATCH,
		wxCURSOR_BLANK,
		wxCURSOR_ARROWWAIT,
		wxCURSOR_MAX
	}

		//-----------------------------------------------------------------------------
		
		//! \cond EXTERN
		static extern (C) ЦУк wxCursor_ctorById(StockCursor ид);
		static extern (C) ЦУк wxCursor_ctorImage(ЦУк рисунок);
		static extern (C) ЦУк wxCursor_ctorCopy(ЦУк cursor);

		static extern (C) бул   wxCursor_Ok(ЦУк сам);
		
		static extern (C) проц   wxCursor_SetCursor(ЦУк cursor);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias Cursor wxCursor;
	public class Cursor : Битмап
	{
		public static Cursor wxSTANDARD_CURSOR;
		public static Cursor wxHOURGLASS_CURSOR;
		public static Cursor wxCROSS_CURSOR;
		public static Cursor wxNullCursor;

		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public this(StockCursor ид)
		{
			super(wxCursor_ctorById(ид));
		}

		public this(Рисунок рисунок)
		{
			super(wxCursor_ctorImage(wxObject.SafePtr(рисунок)));
		}

		public this(Cursor cursor)
		{
			super(wxCursor_ctorCopy(wxObject.SafePtr(cursor)));
		}
/+
		override public проц Dispose()
		{
			if (this !== wxSTANDARD_CURSOR
			&&  this !== wxHOURGLASS_CURSOR
			&&  this !== wxCROSS_CURSOR) {
				super.Dispose();
			}
		}
+/
		//---------------------------------------------------------------------

		public override бул Ок()
		{
			return wxCursor_Ok(шхобъ);
		}

		//---------------------------------------------------------------------
		
		public static проц SetCursor(Cursor cursor)
		{
			wxCursor_SetCursor(wxObject.SafePtr(cursor));
		}
	}
