//-----------------------------------------------------------------------------
// wxD - SashWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SashWindow.cs
//
/// The wxSashWindow wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SashWindow.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SashWindow;
public import wx.common;
public import wx.Window;
public import wx.CommandEvent;

	public enum SashEdgePosition 
	{
		wxSASH_TOP = 0,
		wxSASH_RIGHT,
		wxSASH_BOTTOM,
		wxSASH_LEFT,
		wxSASH_NONE = 100
	}
	
	//-----------------------------------------------------------------------------
	
	public enum SashDragStatus
	{
		wxSASH_STATUS_OK,
		wxSASH_STATUS_OUT_OF_RANGE
	}
		
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxSashEdge_ctor();
		static extern (C) проц wxSashEdge_dtor(ЦУк сам);
		static extern (C) бул wxSashEdge_m_show(ЦУк сам);
		//static extern (C) бул wxSashEdge_m_border(ЦУк сам);
		static extern (C) цел wxSashEdge_m_margin(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias SashEdge wxSashEdge;
	public class SashEdge : wxObject
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
			
		public this()
			{ this(wxSashEdge_ctor(), да);}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxSashEdge_dtor(шхобъ); }
			
		//-----------------------------------------------------------------------------
		
		public бул m_show() { return wxSashEdge_m_show(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
	//	public бул m_border() { return wxSashEdge_m_border(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public цел m_margin() { return wxSashEdge_m_margin(шхобъ); }
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxSashWindow_ctor();
		static extern (C) бул wxSashWindow_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxSashWindow_SetSashVisible(ЦУк сам, SashEdgePosition edge, бул sash);
		static extern (C) бул wxSashWindow_GetSashVisible(ЦУк сам, SashEdgePosition edge);
		//static extern (C) проц wxSashWindow_SetSashBorder(ЦУк сам, SashEdgePosition edge, бул border);
		static extern (C) бул wxSashWindow_HasBorder(ЦУк сам, SashEdgePosition edge);
		static extern (C) цел wxSashWindow_GetEdgeMargin(ЦУк сам, SashEdgePosition edge);
		static extern (C) проц wxSashWindow_SetDefaultBorderSize(ЦУк сам, цел ширина);
		static extern (C) цел wxSashWindow_GetDefaultBorderSize(ЦУк сам);
		static extern (C) проц wxSashWindow_SetExtraBorderSize(ЦУк сам, цел ширина);
		static extern (C) цел wxSashWindow_GetExtraBorderSize(ЦУк сам);
		static extern (C) проц wxSashWindow_SetMinimumSizeX(ЦУк сам, цел min);
		static extern (C) проц wxSashWindow_SetMinimumSizeY(ЦУк сам, цел min);
		static extern (C) цел wxSashWindow_GetMinimumSizeX(ЦУк сам);
		static extern (C) цел wxSashWindow_GetMinimumSizeY(ЦУк сам);
		static extern (C) проц wxSashWindow_SetMaximumSizeX(ЦУк сам, цел max);
		static extern (C) проц wxSashWindow_SetMaximumSizeY(ЦУк сам, цел max);
		static extern (C) цел wxSashWindow_GetMaximumSizeX(ЦУк сам);
		static extern (C) цел wxSashWindow_GetMaximumSizeY(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias SashWindow wxSashWindow;
	public class SashWindow : Окно
	{
		enum {
			wxSW_NOBORDER	= 0x0000,
			wxSW_BORDER	= 0x0020,
			wxSW_3DSASH	= 0x0040,
			wxSW_3DBORDER	= 0x0080,
			wxSW_3D	= wxSW_3DSASH | wxSW_3DBORDER,
		}
		enum {
			wxSASH_DRAG_NONE	= 0,
			wxSASH_DRAG_DRAGGING	= 1,
			wxSASH_DRAG_LEFT_DOWN	= 2,
		}

		//-----------------------------------------------------------------------------
	
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxSashWindow_ctor());}
			
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя="sashWindow")
		{
			super(wxSashWindow_ctor());
			if (!Create(родитель, ид, поз, size, стиль, имя)) 
			{
				throw new InvalidOperationException("Failed to create SashWindow");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя="sashWindow")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------
		
		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxSashWindow_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, стиль, имя);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetSashVisible(SashEdgePosition edge, бул sash)
		{
			wxSashWindow_SetSashVisible(шхобъ, edge, sash);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул GetSashVisible(SashEdgePosition edge)
		{
			return wxSashWindow_GetSashVisible(шхобъ, edge);
		}
		
		//-----------------------------------------------------------------------------
	/+	
		public проц SetSashBorder(SashEdgePosition edge, бул border)
		{
			wxSashWindow_SetSashBorder(шхобъ, edge, border);
		}
		+/
		//-----------------------------------------------------------------------------
		
		public цел GetEdgeMargin(SashEdgePosition edge)
		{
			return wxSashWindow_GetEdgeMargin(шхобъ, edge);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел DefaultBorderSize() { return wxSashWindow_GetDefaultBorderSize(шхобъ); }
		public проц DefaultBorderSize(цел значение) { wxSashWindow_SetDefaultBorderSize(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public цел ExtraBorderSize() { return wxSashWindow_GetExtraBorderSize(шхобъ); }
		public проц ExtraBorderSize(цел значение) { wxSashWindow_SetExtraBorderSize(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public цел MinimumSizeX() { return wxSashWindow_GetMinimumSizeX(шхобъ); }
		public проц MinimumSizeX(цел значение) { wxSashWindow_SetMinimumSizeX(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public цел MinimumSizeY() { return wxSashWindow_GetMinimumSizeY(шхобъ); }
		public проц MinimumSizeY(цел значение) { wxSashWindow_SetMinimumSizeY(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public цел MaximumSizeX() { return wxSashWindow_GetMaximumSizeX(шхобъ); }
		public проц MaximumSizeX(цел значение) { wxSashWindow_SetMaximumSizeX(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public цел MaximumSizeY() { return wxSashWindow_GetMaximumSizeY(шхобъ); }
		public проц MaximumSizeY(цел значение) { wxSashWindow_SetMaximumSizeY(шхобъ, значение); }
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxSashEvent_ctor(цел ид, SashEdgePosition edge);
		static extern (C) проц wxSashEvent_SetEdge(ЦУк сам, SashEdgePosition edge);
		static extern (C) SashEdgePosition wxSashEvent_GetEdge(ЦУк сам);
		static extern (C) проц wxSashEvent_SetDragRect(ЦУк сам, inout Прямоугольник прям);
		static extern (C) проц wxSashEvent_GetDragRect(ЦУк сам, out Прямоугольник прям);
		static extern (C) проц wxSashEvent_SetDragStatus(ЦУк сам, SashDragStatus status);
		static extern (C) SashDragStatus wxSashEvent_GetDragStatus(ЦУк сам);
		//! \endcond
	
	alias SashEvent wxSashEvent;
	public class SashEvent : CommandEvent
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this(0, SashEdgePosition.wxSASH_NONE);}
			
		public this(цел ид)
			{ this(ид, SashEdgePosition.wxSASH_NONE);}
			
		public this(цел ид, SashEdgePosition edge)
			{ super(wxSashEvent_ctor(ид, edge));}
			
		//-----------------------------------------------------------------------------
		
		public SashEdgePosition Edge() { return wxSashEvent_GetEdge(шхобъ); }
		public проц Edge(SashEdgePosition значение) { wxSashEvent_SetEdge(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public Прямоугольник DragRect() { 
				Прямоугольник прям;
				wxSashEvent_GetDragRect(шхобъ, прям);
				return прям;
			}
		public проц DragRect(Прямоугольник значение) { wxSashEvent_SetDragRect(шхобъ, значение); }	
		
		//-----------------------------------------------------------------------------
		
		public SashDragStatus DragStatus() { return wxSashEvent_GetDragStatus(шхобъ); }
		public проц DragStatus(SashDragStatus значение) { wxSashEvent_SetDragStatus(шхобъ, значение); }

		private static Событие Нов(ЦУк объ) { return new SashEvent(объ); }

		static this()
		{
			wxEVT_SASH_DRAGGED = wxEvent_EVT_SASH_DRAGGED();

			ДобавьТипСоб(wxEVT_SASH_DRAGGED,                    &SashEvent.Нов);
		}
	}
