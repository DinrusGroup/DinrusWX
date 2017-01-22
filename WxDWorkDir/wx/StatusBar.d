//-----------------------------------------------------------------------------
// wxD - statusbr.h
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - statusbr.h
//
/// The wxStatusBar wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StatusBar.d,v 1.11 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

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
		static extern (C) ЦУк wxStatusBar_ctor();
		static extern (C) бул   wxStatusBar_Create(ЦУк сам, ЦУк родитель, цел ид, бцел стиль, ткст имя);
	
		static extern (C) проц   wxStatusBar_SetFieldsCount(ЦУк сам, цел number, цел* widths);
		static extern (C) бул   wxStatusBar_GetFieldRect(ЦУк сам, цел i, inout Прямоугольник прям);
		static extern (C) цел    wxStatusBar_GetBorderY(ЦУк сам);
		static extern (C) ЦУк wxStatusBar_GetStatusText(ЦУк сам, цел number);
		static extern (C) цел    wxStatusBar_GetBorderX(ЦУк сам);
		static extern (C) проц   wxStatusBar_SetStatusText(ЦУк сам, ткст текст, цел number);
		static extern (C) проц   wxStatusBar_SetStatusWidths(ЦУк сам, цел n, цел* widths);
		
		static extern (C) цел    wxStatusBar_GetFieldsCount(ЦУк сам);
		static extern (C) проц   wxStatusBar_PopStatusText(ЦУк сам, цел field);
		static extern (C) проц   wxStatusBar_PushStatusText(ЦУк сам, ткст xstring, цел field);
		static extern (C) проц   wxStatusBar_SetMinHeight(ЦУк сам, цел высота);
		static extern (C) проц   wxStatusBar_SetStatusStyles(ЦУк сам, цел n, цел* styles);
		//! \endcond
	
		//-----------------------------------------------------------------------------

	alias StatusBar wxStatusBar;
	public class StatusBar : Окно
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxStatusBar_ctor()); }

		public this(Окно родитель, цел ид /*= wxID_ANY*/, цел стиль = wxST_SIZEGRIP, ткст имя="")
		{
			this();
			if (!Create(родитель, ид, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create StatusBar");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, цел стиль = wxST_SIZEGRIP, ткст имя="")
			{ this(родитель, Окно.UniqueID, стиль, имя);}
		
		//-----------------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, цел стиль, ткст имя)
		{
			return wxStatusBar_Create(шхобъ, wxObject.SafePtr(родитель), ид, cast(бцел)стиль, имя);
		}

		//-----------------------------------------------------------------------------
        
		public проц SetFieldsCount(цел number, цел[] widths)
		{
			wxStatusBar_SetFieldsCount(шхобъ, number, widths.ptr);
		}
		
		public цел FieldsCount() { return wxStatusBar_GetFieldsCount(шхобъ); }

		//-----------------------------------------------------------------------------

		public цел BorderY() { return wxStatusBar_GetBorderY(шхобъ); }

		public цел BorderX() { return wxStatusBar_GetBorderX(шхобъ); }

		//-----------------------------------------------------------------------------

		public бул GetFieldRect(цел i, inout Прямоугольник прям)
		{
			return wxStatusBar_GetFieldRect(шхобъ, i, прям);
		}

		//-----------------------------------------------------------------------------

		public проц StatusText(ткст значение) { SetStatusText(значение); }
		public ткст StatusText() { return GetStatusText(0); }

		public проц SetStatusText(ткст текст) { SetStatusText(текст, 0); }

		public проц SetStatusText(ткст текст, цел number)
		{
			wxStatusBar_SetStatusText(шхобъ, текст, number);
		}

		public ткст GetStatusText(цел number)
		{
			return cast(ткст) new wxString(wxStatusBar_GetStatusText(шхобъ, number), да);
		}

		//-----------------------------------------------------------------------------

		public проц StatusWidths(цел[] значение)
		{
			SetStatusWidths(значение.length, значение.ptr);
		}

		public проц SetStatusWidths(цел n, цел* widths)
		{
			wxStatusBar_SetStatusWidths(шхобъ, n, widths);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц PopStatusText()
		{
			PopStatusText(0);
		}
		
		public проц PopStatusText(цел field)
		{
			wxStatusBar_PopStatusText(шхобъ, field);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц PushStatusText(ткст xstring)
		{
			PushStatusText(xstring, 0);
		}
		
		public проц PushStatusText(ткст xstring, цел field)
		{
			wxStatusBar_PushStatusText(шхобъ, xstring, field);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц MinHeight(цел значение)
		{
			wxStatusBar_SetMinHeight(шхобъ, значение); 
		}
		
		//-----------------------------------------------------------------------------
		
		public проц StatusStyles(цел[] значение)
		{
			wxStatusBar_SetStatusStyles(шхобъ, значение.length, значение.ptr);
		}

	}

