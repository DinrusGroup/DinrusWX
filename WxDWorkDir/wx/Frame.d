//-----------------------------------------------------------------------------
// wxD - Frame.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Frame.cs
//
/// The wxFrame wrapper class.
//
// Written by Jason Perkins (jason@379.com), Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Frame.d,v 1.12 2008/11/04 14:29:16 afb Exp $
//-----------------------------------------------------------------------------

module wx.Frame;
public import wx.common;
public import wx.Window;
public import wx.ToolBar;
public import wx.MenuBar;
public import wx.StatusBar;
public import wx.Icon;

		//! \cond EXTERN
		static extern (C) ЦУк wxFrame_ctor();
		static extern (C) бул   wxFrame_Create(ЦУк сам, ЦУк родитель, цел ид, ткст title, inout Точка поз, inout Размер size, бцел стиль, ткст имя);

		static extern (C) ЦУк wxFrame_CreateStatusBar(ЦУк сам, цел number, бцел стиль, цел ид, ткст имя);

		static extern (C) проц   wxFrame_SendSizeEvent(ЦУк сам);

		static extern (C) проц   wxFrame_SetIcon(ЦУк сам, ЦУк иконка);

		static extern (C) проц   wxFrame_SetMenuBar(ЦУк сам, ЦУк menuBar);
		static extern (C) ЦУк wxFrame_GetMenuBar(ЦУк сам);

		static extern (C) проц   wxFrame_SetStatusText(ЦУк сам, ткст текст, цел number);

		static extern (C) ЦУк wxFrame_CreateToolBar(ЦУк сам, бцел стиль, цел ид, ткст имя);
		static extern (C) ЦУк wxFrame_GetToolBar(ЦУк сам);
		static extern (C) проц   wxFrame_SetToolBar(ЦУк сам, ЦУк toolbar);

		static extern (C) бул   wxFrame_ShowFullScreen(ЦУк сам, бул show, бцел стиль);
		static extern (C) бул   wxFrame_IsFullScreen(ЦУк сам);

		static extern (C) ЦУк wxFrame_GetStatusBar(ЦУк шхобъ); 
		static extern (C) проц   wxFrame_SetStatusBar(ЦУк шхобъ, ЦУк statusbar);

		static extern (C) цел    wxFrame_GetStatusBarPane(ЦУк шхобъ); 
		static extern (C) проц   wxFrame_SetStatusBarPane(ЦУк шхобъ, цел n); 

		static extern (C) проц   wxFrame_SetStatusWidths(ЦУк сам, цел n, цел* widths);

		static extern (C) проц   wxFrame_Iconize(ЦУк шхобъ, бул iconize); 
		static extern (C) бул   wxFrame_IsIconized(ЦУк шхобъ); 

		static extern (C) проц   wxFrame_Maximize(ЦУк шхобъ, бул maximize); 
		static extern (C) бул   wxFrame_IsMaximized(ЦУк шхобъ); 

		//static extern (C) бул   wxFrame_SetShape(ЦУк сам, ЦУк region);
		
		static extern (C) проц   wxFrame_GetClientAreaOrigin(ЦУк сам, inout Точка pt);
		//! \endcond
            
		//---------------------------------------------------------------------

	alias Frame wxFrame;
	/// A frame is a окно whose size and position can (usually) be
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

		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this()
			{ this(wxFrame_ctor());}
			
		public this(Окно родитель, цел ид, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
		{
			this(wxFrame_ctor());
			if (!Create(родитель, ид, title, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create Frame");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
			{ this(родитель, Окно.UniqueID, title, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст title, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxFrame_Create(шхобъ, wxObject.SafePtr(родитель), ид, title, поз, size, стиль, имя);
		}

		//---------------------------------------------------------------------
        
		// Helper constructors

		public this(ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_FRAME_STYLE)
			{ this(пусто, -1, title, поз, size, стиль); }

		//---------------------------------------------------------------------
        
		public бул ShowFullScreen(бул show, цел стиль) 
		{
			return wxFrame_ShowFullScreen(шхобъ, show, cast(бцел)стиль);
		}

		public бул ShowFullScreen(бул show) 
		{
			return ShowFullScreen(show, wxFULLSCREEN_ALL);
		}

		public бул IsFullScreen() { return wxFrame_IsFullScreen(шхобъ); }

		//---------------------------------------------------------------------

		public StatusBar CreateStatusBar()
		{ 
			return CreateStatusBar(1, 0, -1, "statusBar"); 
		}
		
		public StatusBar CreateStatusBar(цел number)
		{ 
			return CreateStatusBar(number, 0, -1, "statusBar"); 
		}
		
		public StatusBar CreateStatusBar(цел number, цел стиль)
		{ 
			return CreateStatusBar(number, стиль, -1, "statusBar"); 
		}
		
		public StatusBar CreateStatusBar(цел number, цел стиль, цел ид)
		{ 
			return CreateStatusBar(number, стиль, ид, "statusBar"); 
		}

		public StatusBar CreateStatusBar(цел number, цел стиль, цел ид, ткст имя)
		{
			return new StatusBar(wxFrame_CreateStatusBar(шхобъ, number, cast(бцел)стиль, ид, имя));
		}

		public StatusBar statusBar() { return cast(StatusBar)FindObject(wxFrame_GetStatusBar(шхобъ), &StatusBar.Нов); }
		public проц statusBar(StatusBar значение) { wxFrame_SetStatusBar(шхобъ, wxObject.SafePtr(значение)); }

		public цел StatusBarPane() { return wxFrame_GetStatusBarPane(шхобъ); }
		public проц StatusBarPane(цел значение) { wxFrame_SetStatusBarPane(шхобъ, значение); }

		//---------------------------------------------------------------------

		public проц SendSizeEvent()
		{
			wxFrame_SendSizeEvent(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц иконка(Icon значение) { wxFrame_SetIcon(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------

		public проц menuBar(MenuBar значение) { 
				wxFrame_SetMenuBar(шхобъ, wxObject.SafePtr(значение)); 
				// add меню events...
			if (значение)
			{
				for ( цел i = 0; i < menuBar.MenuCount; ++i )
				{
					Меню меню = значение.GetMenu(i);
					меню.ConnectEvents(this);
				}
			}
		}
		public MenuBar menuBar() { return cast(MenuBar)FindObject(wxFrame_GetMenuBar(шхобъ), &MenuBar.Нов); }

		//---------------------------------------------------------------------

		public проц StatusText(ткст значение) { SetStatusText(значение); }

		public проц SetStatusText(ткст текст) 
		{ SetStatusText(текст, 0); }

		public проц SetStatusText(ткст текст, цел number)
		{
			wxFrame_SetStatusText(шхобъ, текст, number);
		}

		//---------------------------------------------------------------------

		public проц StatusWidths(цел[] значение)
		{
			SetStatusWidths(значение.length, значение);
		}

		public проц SetStatusWidths(цел n, цел[] widths)
		{
			wxFrame_SetStatusWidths(шхобъ, n, widths.ptr);
		}

		//---------------------------------------------------------------------
/+
		public ToolBar CreateToolBar()
		{ return CreateToolBar(/*Border.*/wxNO_BORDER | ToolBar.wxTB_HORIZONTAL, -1, "toolBar"); }
		public ToolBar CreateToolBar(цел стиль)
		{ return CreateToolBar(стиль, -1, "toolBar"); }
		public ToolBar CreateToolBar(цел стиль, цел ид)
		{ return CreateToolBar(стиль, ид, "toolBar"); }

		public ToolBar CreateToolBar(цел стиль, цел ид, ткст имя)
		{
			return new ToolBar(wxFrame_CreateToolBar(шхобъ, cast(бцел)стиль, ид, имя));
		}

		public ToolBar toolBar() { return cast(ToolBar)FindObject(wxFrame_GetToolBar(шхобъ)); }
		public проц toolBar(ToolBar значение) { wxFrame_SetToolBar(шхобъ, wxObject.SafePtr(значение)); }
+/
		//---------------------------------------------------------------------

		public бул Iconized() { return wxFrame_IsIconized(шхобъ); }
		public проц Iconized(бул значение) { wxFrame_Iconize(шхобъ, значение); }

		//---------------------------------------------------------------------

		public бул Maximized() { return wxFrame_IsMaximized(шхобъ); }
		public проц Maximized(бул значение) { wxFrame_Maximize(шхобъ, значение); }

		//---------------------------------------------------------------------

		/*public бул SetShape(wx.Region region)
		{
			return wxFrame_SetShape(шхобъ, wxObject.SafePtr(region));
		}*/

		//---------------------------------------------------------------------
		
		public override Точка ClientAreaOrigin()
		{
			Точка pt;
			wxFrame_GetClientAreaOrigin(шхобъ, pt);
			return pt;
		}
	}
