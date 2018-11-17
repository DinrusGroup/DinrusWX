module wx.Clipboard;
public import wx.common;
public import wx.DataFormat;
public import wx.DataObject;

		//! \cond EXTERN
		static extern (C) IntPtr wxClipboard_ctor();
		static extern (C) бул   wxClipboard_Open(IntPtr сам);
		static extern (C) проц   wxClipboard_Close(IntPtr сам);
		static extern (C) бул   wxClipboard_IsOpened(IntPtr сам);
		static extern (C) бул   wxClipboard_AddData(IntPtr сам, IntPtr data);
		static extern (C) бул   wxClipboard_SetData(IntPtr сам, IntPtr data);
		static extern (C) бул   wxClipboard_IsSupported(IntPtr сам, IntPtr format);
		static extern (C) бул   wxClipboard_GetData(IntPtr сам, IntPtr data);
		static extern (C) проц   wxClipboard_Clear(IntPtr сам);
		static extern (C) бул   wxClipboard_Flush(IntPtr сам);
		static extern (C) проц   wxClipboard_UsePrimarySelection(IntPtr сам, бул primary);
		static extern (C) IntPtr wxClipboard_Get();
		//! \endcond

		//-----------------------------------------------------------------------------

	alias Clipboard wxClipboard;
	public class Clipboard : wxObject
	{
		static Clipboard TheClipboard = null;

		// this crashed in GTK+, since it needs a valid context first
		// so it's called by Апп in the ПоИниц() обработчик now
		static проц initialize();
		public this(IntPtr wxobj);
		public  this();
		public бул Open();
		public проц Закрой();
		public бул IsOpened();
		public бул AddData(DataObject data);
		public бул УстData(DataObject data);
		public бул GetData(DataObject data);
		public бул IsSupported(ФорматДаты format);
		public проц Clear();
		public бул Flush();
		public  проц UsePrimarySelection(бул primary);
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxClipboardLocker_ctor(IntPtr clipboard);
		static extern (C) проц   wxClipboardLocker_dtor(IntPtr сам);
		static extern (C) бул   wxClipboardLocker_IsOpen(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	/* re-implement using D */
	public scope class ClipboardLocker // not wxObject
	{
		public this(Clipboard clipboard = null);
		public ~this();

		private Clipboard m_clipboard;
/*
		private IntPtr wxobj;

		public this();
		public this(Clipboard clipboard);
		public ~this();

		//-----------------------------------------------------------------------------

		public бул IsOpen() ;
*/
	}
