
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
		static extern (C) IntPtr wxSashEdge_ctor();
		static extern (C) проц wxSashEdge_dtor(IntPtr сам);
		static extern (C) бул wxSashEdge_m_show(IntPtr сам);
		static extern (C) бул wxSashEdge_m_border(IntPtr сам);
		static extern (C) цел wxSashEdge_m_margin(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias SashEdge wxSashEdge;
	public class SashEdge : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);			
		public this();
		override protected проц dtor();
		public бул m_show() ;
		public бул m_border() ;
		public цел m_margin() ;
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxSashWindow_ctor();
		static extern (C) бул wxSashWindow_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxSashWindow_SetSashVisible(IntPtr сам, SashEdgePosition edge, бул sash);
		static extern (C) бул wxSashWindow_GetSashVisible(IntPtr сам, SashEdgePosition edge);
		static extern (C) проц wxSashWindow_SetSashBorder(IntPtr сам, SashEdgePosition edge, бул бордюр);
		static extern (C) бул wxSashWindow_HasBorder(IntPtr сам, SashEdgePosition edge);
		static extern (C) цел wxSashWindow_GetEdgeMargin(IntPtr сам, SashEdgePosition edge);
		static extern (C) проц wxSashWindow_SetDefaultBorderSize(IntPtr сам, цел ширь);
		static extern (C) цел wxSashWindow_GetDefaultBorderSize(IntPtr сам);
		static extern (C) проц wxSashWindow_SetExtraBorderSize(IntPtr сам, цел ширь);
		static extern (C) цел wxSashWindow_GetExtraBorderSize(IntPtr сам);
		static extern (C) проц wxSashWindow_SetMinimumSizeX(IntPtr сам, цел min);
		static extern (C) проц wxSashWindow_SetMinimumSizeY(IntPtr сам, цел min);
		static extern (C) цел wxSashWindow_GetMinimumSizeX(IntPtr сам);
		static extern (C) цел wxSashWindow_GetMinimumSizeY(IntPtr сам);
		static extern (C) проц wxSashWindow_SetMaximumSizeX(IntPtr сам, цел max);
		static extern (C) проц wxSashWindow_SetMaximumSizeY(IntPtr сам, цел max);
		static extern (C) цел wxSashWindow_GetMaximumSizeX(IntPtr сам);
		static extern (C) цел wxSashWindow_GetMaximumSizeY(IntPtr сам);
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
	
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя="sashWindow");
		public this(Окно родитель, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя="sashWindow");
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public проц УстSashVisible(SashEdgePosition edge, бул sash);
		public бул GetSashVisible(SashEdgePosition edge);
		public проц УстSashBorder(SashEdgePosition edge, бул бордюр);
		public цел GetEdgeMargin(SashEdgePosition edge);
		public цел DefaultBorderSize() ;
		public проц DefaultBorderSize(цел значение);
		public цел ExtraBorderSize();
		public проц ExtraBorderSize(цел значение);
		public цел MinimumSizeX();
		public проц MinimumSizeX(цел значение) ;
		public цел MinimumSizeY();
		public проц MinimumSizeY(цел значение);
		public цел MaximumSizeX() ;
		public проц MaximumSizeX(цел значение) ;
		public цел MaximumSizeY();
		public проц MaximumSizeY(цел значение);
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxSashEvent_ctor(цел ид, SashEdgePosition edge);
		static extern (C) проц wxSashEvent_SetEdge(IntPtr сам, SashEdgePosition edge);
		static extern (C) SashEdgePosition wxSashEvent_GetEdge(IntPtr сам);
		static extern (C) проц wxSashEvent_SetDragRect(IntPtr сам, inout Прямоугольник прям);
		static extern (C) проц wxSashEvent_GetDragRect(IntPtr сам, out Прямоугольник прям);
		static extern (C) проц wxSashEvent_SetDragStatus(IntPtr сам, SashDragStatus status);
		static extern (C) SashDragStatus wxSashEvent_GetDragStatus(IntPtr сам);
		//! \endcond
	
	alias SashEvent wxSashEvent;
	public class SashEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj);
		public this();
		public this(цел ид);
		public this(цел ид, SashEdgePosition edge);
		public SashEdgePosition Edge() ;
		public проц Edge(SashEdgePosition значение) ;
		public Прямоугольник DragRect() ;
		public проц DragRect(Прямоугольник значение) ;
		public SashDragStatus DragStatus() ;
		public проц DragStatus(SashDragStatus значение) ;
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
