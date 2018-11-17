
module wx.Frame;
public import wx.common;
public import wx.Window;
public import wx.ToolBar;
public import wx.MenuBar;
public import wx.StatusBar;
public import wx.Icon;

		//! \cond EXTERN
		static extern (C) IntPtr wxFrame_ctor();
		static extern (C) бул   wxFrame_Create(IntPtr сам, IntPtr родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);

		static extern (C) IntPtr wxFrame_CreateStatusBar(IntPtr сам, цел number, бцел стиль, цел ид, ткст имя);

		static extern (C) проц   wxFrame_SendSizeEvent(IntPtr сам);

		static extern (C) проц   wxFrame_SetIcon(IntPtr сам, IntPtr пиктограмма);

		static extern (C) проц   wxFrame_SetMenuBar(IntPtr сам, IntPtr menuBar);
		static extern (C) IntPtr wxFrame_GetMenuBar(IntPtr сам);

		static extern (C) проц   wxFrame_SetStatusText(IntPtr сам, ткст текст, цел number);

		static extern (C) IntPtr wxFrame_CreateToolBar(IntPtr сам, бцел стиль, цел ид, ткст имя);
		static extern (C) IntPtr wxFrame_GetToolBar(IntPtr сам);
		static extern (C) проц   wxFrame_SetToolBar(IntPtr сам, IntPtr toolbar);

		static extern (C) бул   wxFrame_ShowFullScreen(IntPtr сам, бул покажи, бцел стиль);
		static extern (C) бул   wxFrame_IsFullScreen(IntPtr сам);

		static extern (C) IntPtr wxFrame_GetStatusBar(IntPtr wxobj);
		static extern (C) проц   wxFrame_SetStatusBar(IntPtr wxobj, IntPtr statusbar);

		static extern (C) цел    wxFrame_GetStatusBarPane(IntPtr wxobj);
		static extern (C) проц   wxFrame_SetStatusBarPane(IntPtr wxobj, цел n);

		static extern (C) проц   wxFrame_SetStatusWidths(IntPtr сам, цел n, цел* widths);

		static extern (C) проц   wxFrame_Iconize(IntPtr wxobj, бул iconize);
		static extern (C) бул   wxFrame_IsIconized(IntPtr wxobj);

		static extern (C) проц   wxFrame_Maximize(IntPtr wxobj, бул maximize);
		static extern (C) бул   wxFrame_IsMaximized(IntPtr wxobj);

		//static extern (C) бул   wxFrame_SetShape(IntPtr сам, IntPtr region);

		static extern (C) проц   wxFrame_GetClientAreaOrigin(IntPtr сам, inout Точка тчк);
		//! \endcond

		//---------------------------------------------------------------------

	alias Frame wxFrame;
	/// A frame is a окно whose разм and position can (usually) be
	/// changed by the user. It usually has thick borders and a title bar,
	/// and can optionally contain a меню bar, toolbar and status bar.
	/// A frame can contain any окно that is not a frame or dialog.
	public class Frame : Окно
	{
		public const цел wxFULLSCREEN_NOMENUBAR   = 0x0001;
		public const цел wxFULLSCREEN_NOTOOLBAR   = 0x0002;
		public const цел wxFULLSCREEN_NOSTATUSBAR = 0x0004;
		public const цел wxFULLSCREEN_NOBORDER    = 0x0008;
		public const цел wxFULLSCREEN_NOCAPTION   = 0x0010;
		public const цел wxFULLSCREEN_ALL         =
                    wxFULLSCREEN_NOMENUBAR | wxFULLSCREEN_NOTOOLBAR |
                    wxFULLSCREEN_NOSTATUSBAR | wxFULLSCREEN_NOBORDER |
                    wxFULLSCREEN_NOCAPTION;

		//-----------------------------------------------------------------------------
		const ткст wxFrameNameStr="frame";

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr);
		public this(Окно родитель, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr);
		public бул Создай(Окно родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public this(ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE);
		public бул ShowFullScreen(бул покажи, цел стиль);
		public бул ShowFullScreen(бул покажи);
		public бул IsFullScreen() ;
		public StatusBar CreateStatusBar();
		public StatusBar CreateStatusBar(цел number);
		public StatusBar CreateStatusBar(цел number, цел стиль);
		public StatusBar CreateStatusBar(цел number, цел стиль, цел ид);
		public StatusBar CreateStatusBar(цел number, цел стиль, цел ид, ткст имя);
		public StatusBar statusBar() ;
		public проц statusBar(StatusBar значение) ;
		public цел StatusBarPane();
		public проц StatusBarPane(цел значение);
		public проц SendSizeEvent();
		public проц пиктограмма(Пиктограмма значение) ;
		public проц menuBar(MenuBar значение) ;
		public MenuBar menuBar();
		public проц StatusText(ткст значение) ;
		public проц УстStatusText(ткст текст);
		public проц УстStatusText(ткст текст, цел number);
		public проц StatusWidths(цел[] значение);
		public проц УстStatusWidths(цел n, цел[] widths);
		public ToolBar CreateToolBar();
		public ToolBar CreateToolBar(цел стиль);
		public ToolBar CreateToolBar(цел стиль, цел ид);
		public ToolBar CreateToolBar(цел стиль, цел ид, ткст имя);
		public ToolBar toolBar() ;
		public проц toolBar(ToolBar значение);
		public бул Iconized() ;
		public проц Iconized(бул значение) ;
		public бул Maximized();
		public проц Maximized(бул значение);
		//public бул УстShape(wx.Region region);
		public override Точка ИсходнаяЗоныКлиента();
		override public  бул Закрой();
        override public  бул Закрой(бул сила);
	}
