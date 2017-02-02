//-----------------------------------------------------------------------------
// wxD - LayoutWin.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - LayoutWin.cs
//
/// The wxSashLayoutWindow proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: LayoutWin.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.LayoutWin;
public import wx.common;
public import wx.SashWindow;
public import wx.Event;
public import wx.Frame;
public import wx.MDI;

	public enum LayoutOrientation
	{
		wxLAYOUT_HORIZONTAL,
		wxLAYOUT_VERTICAL
	}
	
	//-----------------------------------------------------------------------------

	public enum LayoutAlignment
	{
		wxLAYOUT_NONE,
		wxLAYOUT_TOP,
		wxLAYOUT_LEFT,
		wxLAYOUT_RIGHT,
		wxLAYOUT_BOTTOM
	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxSashLayoutWindow_ctor();
		static extern (C) бул wxSashLayoutWindow_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) LayoutAlignment wxSashLayoutWindow_GetAlignment(ЦУк сам);
		static extern (C) LayoutOrientation wxSashLayoutWindow_GetOrientation(ЦУк сам);
		static extern (C) проц wxSashLayoutWindow_SetAlignment(ЦУк сам, LayoutAlignment alignment);
		static extern (C) проц wxSashLayoutWindow_SetOrientation(ЦУк сам, LayoutOrientation orient);
		static extern (C) проц wxSashLayoutWindow_SetDefaultSize(ЦУк сам, inout Размер size);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias SashLayoutWindow wxSashLayoutWindow;
	public class SashLayoutWindow : SashWindow
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxSashLayoutWindow_ctor());}
			
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя = "layoutWindow")
		{
			super(wxSashLayoutWindow_ctor());
			if (!Create(родитель, ид, поз, size, стиль, имя)) 
			{
				throw new InvalidOperationException("Failed to create SashLayoutWindow");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя = "layoutWindow")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------
		
		public override бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxSashLayoutWindow_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя);
		}
		
		//-----------------------------------------------------------------------------
		
		public LayoutAlignment Alignment() { return wxSashLayoutWindow_GetAlignment(шхобъ); }
		public проц Alignment(LayoutAlignment значение) { wxSashLayoutWindow_SetAlignment(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public LayoutOrientation Ориентация() { return wxSashLayoutWindow_GetOrientation(шхобъ); }
		public проц Ориентация(LayoutOrientation значение) { wxSashLayoutWindow_SetOrientation(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public проц DefaultSize(Размер значение) { wxSashLayoutWindow_SetDefaultSize(шхобъ, значение); }
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxLayoutAlgorithm_ctor();
		static extern (C) бул wxLayoutAlgorithm_LayoutMDIFrame(ЦУк сам, ЦУк frame, inout Прямоугольник прям);
		static extern (C) бул wxLayoutAlgorithm_LayoutFrame(ЦУк сам, ЦУк frame, ЦУк mainWindow);
		static extern (C) бул wxLayoutAlgorithm_LayoutWindow(ЦУк сам, ЦУк frame, ЦУк mainWindow);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias LayoutAlgorithm wxLayoutAlgorithm;
	public class LayoutAlgorithm : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxLayoutAlgorithm_ctor());}
			
		//-----------------------------------------------------------------------------
		
		public бул LayoutMDIFrame(MDIParentFrame frame)
		{
			// FIXME
			Прямоугольник dummy;
			return LayoutMDIFrame(frame, dummy);
		}
		
		public бул LayoutMDIFrame(MDIParentFrame frame, Прямоугольник прям)
		{
			return wxLayoutAlgorithm_LayoutMDIFrame(шхобъ, wxObject.SafePtr(frame), прям);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул LayoutFrame(Фрейм frame)
		{
			return LayoutFrame(frame, пусто);
		}
		
		public бул LayoutFrame(Фрейм frame, Окно mainWindow)
		{
			return wxLayoutAlgorithm_LayoutFrame(шхобъ, wxObject.SafePtr(frame), wxObject.SafePtr(mainWindow));
		}
		
		//-----------------------------------------------------------------------------
		
		public бул LayoutWindow(Окно frame)
		{
			return LayoutWindow(frame, пусто);
		}
		
		public бул LayoutWindow(Окно frame, Окно mainWindow)
		{
			return wxLayoutAlgorithm_LayoutWindow(шхобъ, wxObject.SafePtr(frame), wxObject.SafePtr(mainWindow));
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxQueryLayoutInfoEvent_ctor(цел ид);
		static extern (C) проц wxQueryLayoutInfoEvent_SetRequestedLength(ЦУк сам, цел length);
		static extern (C) цел wxQueryLayoutInfoEvent_GetRequestedLength(ЦУк сам);
		static extern (C) проц wxQueryLayoutInfoEvent_SetFlags(ЦУк сам, цел флаги);
		static extern (C) цел wxQueryLayoutInfoEvent_GetFlags(ЦУк сам);
		static extern (C) проц wxQueryLayoutInfoEvent_SetSize(ЦУк сам, inout Размер size);
		static extern (C) проц wxQueryLayoutInfoEvent_GetSize(ЦУк сам, out Размер size);
		static extern (C) проц wxQueryLayoutInfoEvent_SetOrientation(ЦУк сам, LayoutOrientation orient);
		static extern (C) LayoutOrientation wxQueryLayoutInfoEvent_GetOrientation(ЦУк сам);
		static extern (C) проц wxQueryLayoutInfoEvent_SetAlignment(ЦУк сам, LayoutAlignment alignment);
		static extern (C) LayoutAlignment wxQueryLayoutInfoEvent_GetAlignment(ЦУк сам);
		//! \endcond
	
		//-----------------------------------------------------------------------------
		
	alias QueryLayoutInfoEvent wxQueryLayoutInfoEvent;
	public class QueryLayoutInfoEvent : Событие
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this(0);}
			
		public this(цел ид)
			{ super(wxQueryLayoutInfoEvent_ctor(ид));}
			
		//-----------------------------------------------------------------------------
		
		public цел RequestedLength() { return wxQueryLayoutInfoEvent_GetRequestedLength(шхобъ); }
		public проц RequestedLength(цел значение) { wxQueryLayoutInfoEvent_SetRequestedLength(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public цел Флаги() { return wxQueryLayoutInfoEvent_GetFlags(шхобъ); }
		public проц Флаги(цел значение) { wxQueryLayoutInfoEvent_SetFlags(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public Размер size() {
				Размер size;
				wxQueryLayoutInfoEvent_GetSize(шхобъ, size);
				return size;
			}
		public проц size(Размер значение) { wxQueryLayoutInfoEvent_SetSize(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public LayoutOrientation Ориентация() { return wxQueryLayoutInfoEvent_GetOrientation(шхобъ); }
		public проц Ориентация(LayoutOrientation значение) { wxQueryLayoutInfoEvent_SetOrientation(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public LayoutAlignment Alignment() { return wxQueryLayoutInfoEvent_GetAlignment(шхобъ); }
		public проц Alignment(LayoutAlignment значение) { wxQueryLayoutInfoEvent_SetAlignment(шхобъ, значение); }

		private static Событие Нов(ЦУк объ) { return new QueryLayoutInfoEvent(объ); }

		static this()
		{
			wxEVT_QUERY_LAYOUT_INFO = wxEvent_EVT_QUERY_LAYOUT_INFO();

			ДобавьТипСоб(wxEVT_QUERY_LAYOUT_INFO,               &QueryLayoutInfoEvent.Нов);
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxCalculateLayoutEvent_ctor(цел ид);
		static extern (C) проц wxCalculateLayoutEvent_SetFlags(ЦУк сам, цел флаги);
		static extern (C) цел wxCalculateLayoutEvent_GetFlags(ЦУк сам);
		static extern (C) проц wxCalculateLayoutEvent_SetRect(ЦУк сам, inout Прямоугольник прям);
		static extern (C) проц wxCalculateLayoutEvent_GetRect(ЦУк сам, out Прямоугольник прям);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias CalculateLayoutEvent wxCalculateLayoutEvent;
	public class CalculateLayoutEvent : Событие
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this(0);}
			
		public this(цел ид)
			{ super(wxCalculateLayoutEvent_ctor(ид));}
		
		//-----------------------------------------------------------------------------
		
		public цел Флаги() { return wxCalculateLayoutEvent_GetFlags(шхобъ); }
		public проц Флаги(цел значение) { wxCalculateLayoutEvent_SetFlags(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public Прямоугольник Rect() {
				Прямоугольник прям;
				wxCalculateLayoutEvent_GetRect(шхобъ, прям);
				return прям;
			}
			
		public проц Rect(Прямоугольник значение) { wxCalculateLayoutEvent_SetRect(шхобъ, значение); }

		private static Событие Нов(ЦУк объ) { return new CalculateLayoutEvent(объ); }

		static this()
		{
			wxEVT_CALCULATE_LAYOUT = wxEvent_EVT_CALCULATE_LAYOUT();

			ДобавьТипСоб(wxEVT_CALCULATE_LAYOUT,                &CalculateLayoutEvent.Нов);
		}
	}
