module wx.StatusBar;
public import wx.common;
public import wx.Window;


		public const цел wxST_SIZEGRIP         = 0x0010;
		public const цел wxST_NO_AUTORESIZE    = 0x0001;
		
		public const цел wxSB_NORMAL	= 0x000;
		public const цел wxSB_FLAT	= 0x001;
		public const цел wxSB_RAISED	= 0x002; 
	
		//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxStatusBar_ctor();
		static extern (C) бул   wxStatusBar_Create(IntPtr сам, IntPtr родитель, цел ид, бцел стиль, ткст имя);
	
		static extern (C) проц   wxStatusBar_SetFieldsCount(IntPtr сам, цел number, цел* widths);
		static extern (C) бул   wxStatusBar_GetFieldRect(IntPtr сам, цел i, inout Прямоугольник прям);
		static extern (C) цел    wxStatusBar_GetBorderY(IntPtr сам);
		static extern (C) IntPtr wxStatusBar_GetStatusText(IntPtr сам, цел number);
		static extern (C) цел    wxStatusBar_GetBorderX(IntPtr сам);
		static extern (C) проц   wxStatusBar_SetStatusText(IntPtr сам, ткст текст, цел number);
		static extern (C) проц   wxStatusBar_SetStatusWidths(IntPtr сам, цел n, цел* widths);
		
		static extern (C) цел    wxStatusBar_GetFieldsCount(IntPtr сам);
		static extern (C) проц   wxStatusBar_PopStatusText(IntPtr сам, цел field);
		static extern (C) проц   wxStatusBar_PushStatusText(IntPtr сам, ткст xstring, цел field);
		static extern (C) проц   wxStatusBar_SetMinHeight(IntPtr сам, цел высь);
		static extern (C) проц   wxStatusBar_SetStatusStyles(IntPtr сам, цел n, цел* styles);
		//! \endcond
	
		//-----------------------------------------------------------------------------

	alias StatusBar wxStatusBar;
	public class StatusBar : Окно
	{
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, цел стиль = wxST_SIZEGRIP, ткст имя="");
		public this(Окно родитель, цел стиль = wxST_SIZEGRIP, ткст имя="");
		public бул Создай(Окно родитель, цел ид, цел стиль, ткст имя);
		public проц УстFieldsCount(цел number, цел[] widths);
		public цел FieldsCount() ;
		public цел BorderY();
		public цел BorderX() ;
		public бул GetFieldRect(цел i, inout Прямоугольник прям);
		public проц StatusText(ткст значение) { УстStatusText(значение); }
		public ткст StatusText() ;
		public проц УстStatusText(ткст текст);
		public проц УстStatusText(ткст текст, цел number);
		public ткст GetStatusText(цел number);
		public проц StatusWidths(цел[] значение);
		public проц УстStatusWidths(цел n, цел* widths);
		public проц PopStatusText();
		public проц PopStatusText(цел field);
		public проц PushStatusText(ткст xstring);
		public проц PushStatusText(ткст xstring, цел field);
		public проц МинВысь(цел значение);
		public проц StatusStyles(цел[] значение);

	}

