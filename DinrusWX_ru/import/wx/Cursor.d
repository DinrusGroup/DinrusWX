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
		static extern (C) IntPtr wxCursor_ctorById(StockCursor ид);
		static extern (C) IntPtr wxCursor_ctorImage(IntPtr рисунок);
		static extern (C) IntPtr wxCursor_ctorCopy(IntPtr курсор);

		static extern (C) бул   wxCursor_Ok(IntPtr сам);
		
		static extern (C) проц   wxCursor_SetCursor(IntPtr курсор);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias Курсор wxCursor;
	public class Курсор : Битмап
	{
		public static Курсор wxSTANDARD_CURSOR;
		public static Курсор wxHOURGLASS_CURSOR;
		public static Курсор wxCROSS_CURSOR;
		public static Курсор wxNullCursor;

		public this(IntPtr wxobj);
		public this(StockCursor ид);
		public this(Рисунок рисунок);
		public this(Курсор курсор);
		//override public проц Dispose();
		public override бул Ок();
		public static проц УстCursor(Курсор курсор);
	}
