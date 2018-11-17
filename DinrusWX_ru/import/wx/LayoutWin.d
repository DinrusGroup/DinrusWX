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
		static extern (C) IntPtr wxSashLayoutWindow_ctor();
		static extern (C) бул wxSashLayoutWindow_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) LayoutAlignment wxSashLayoutWindow_GetAlignment(IntPtr сам);
		static extern (C) LayoutOrientation wxSashLayoutWindow_GetOrientation(IntPtr сам);
		static extern (C) проц wxSashLayoutWindow_SetAlignment(IntPtr сам, LayoutAlignment alignment);
		static extern (C) проц wxSashLayoutWindow_SetOrientation(IntPtr сам, LayoutOrientation ориент);
		static extern (C) проц wxSashLayoutWindow_SetDefaultSize(IntPtr сам, inout Размер разм);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias SashLayoutWindow wxSashLayoutWindow;
	public class SashLayoutWindow : SashWindow
	{
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя = "layoutWindow");
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя = "layoutWindow");
		public override бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public LayoutAlignment Alignment();
		public проц Alignment(LayoutAlignment значение) ;
		public LayoutOrientation Ориентация() ;
		public проц Ориентация(LayoutOrientation значение) ;
		public проц DefaultSize(Размер значение) ;
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxLayoutAlgorithm_ctor();
		static extern (C) бул wxLayoutAlgorithm_LayoutMDIFrame(IntPtr сам, IntPtr frame, inout Прямоугольник прям);
		static extern (C) бул wxLayoutAlgorithm_LayoutFrame(IntPtr сам, IntPtr frame, IntPtr mainWindow);
		static extern (C) бул wxLayoutAlgorithm_LayoutWindow(IntPtr сам, IntPtr frame, IntPtr mainWindow);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias LayoutAlgorithm wxLayoutAlgorithm;
	public class LayoutAlgorithm : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		public бул LayoutMDIFrame(MDIParentFrame frame);
		public бул LayoutMDIFrame(MDIParentFrame frame, Прямоугольник прям);
		public бул LayoutFrame(Frame frame);
		public бул LayoutFrame(Frame frame, Окно mainWindow);
		public бул LayoutWindow(Окно frame);
		public бул LayoutWindow(Окно frame, Окно mainWindow);
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxQueryLayoutInfoEvent_ctor(цел ид);
		static extern (C) проц wxQueryLayoutInfoEvent_SetRequestedLength(IntPtr сам, цел length);
		static extern (C) цел wxQueryLayoutInfoEvent_GetRequestedLength(IntPtr сам);
		static extern (C) проц wxQueryLayoutInfoEvent_SetФлаги(IntPtr сам, цел флаги);
		static extern (C) цел wxQueryLayoutInfoEvent_GetFlags(IntPtr сам);
		static extern (C) проц wxQueryLayoutInfoEvent_SetSize(IntPtr сам, inout Размер разм);
		static extern (C) проц wxQueryLayoutInfoEvent_GetSize(IntPtr сам, out Размер разм);
		static extern (C) проц wxQueryLayoutInfoEvent_SetOrientation(IntPtr сам, LayoutOrientation ориент);
		static extern (C) LayoutOrientation wxQueryLayoutInfoEvent_GetOrientation(IntPtr сам);
		static extern (C) проц wxQueryLayoutInfoEvent_SetAlignment(IntPtr сам, LayoutAlignment alignment);
		static extern (C) LayoutAlignment wxQueryLayoutInfoEvent_GetAlignment(IntPtr сам);
		//! \endcond
	
		//-----------------------------------------------------------------------------
		
	alias QueryLayoutInfoEvent wxQueryLayoutInfoEvent;
	public class QueryLayoutInfoEvent : Событие
	{
		public this(IntPtr wxobj);
		public this();
		public this(цел ид);
		public цел RequestedLength();
		public проц RequestedLength(цел значение) ;
		public цел Флаги() ;
		public проц Флаги(цел значение);
		public Размер разм() ;
		public проц разм(Размер значение) ;
		public LayoutOrientation Ориентация();
		public проц Ориентация(LayoutOrientation значение) ;
		public LayoutAlignment Alignment() ;
		public проц Alignment(LayoutAlignment значение) ;
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			wxEVT_QUERY_LAYOUT_INFO = wxEvent_EVT_QUERY_LAYOUT_INFO();

			ДобавьТипСоб(wxEVT_QUERY_LAYOUT_INFO,               &QueryLayoutInfoEvent.Нов);
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxCalculateLayoutEvent_ctor(цел ид);
		static extern (C) проц wxCalculateLayoutEvent_SetФлаги(IntPtr сам, цел флаги);
		static extern (C) цел wxCalculateLayoutEvent_GetFlags(IntPtr сам);
		static extern (C) проц wxCalculateLayoutEvent_SetRect(IntPtr сам, inout Прямоугольник прям);
		static extern (C) проц wxCalculateLayoutEvent_GetRect(IntPtr сам, out Прямоугольник прям);
		//! \endcond
		
		//-----------------------------------------------------------------------------
	
	alias CalculateLayoutEvent wxCalculateLayoutEvent;
	public class CalculateLayoutEvent : Событие
	{
		public this(IntPtr wxobj);
		public this();
		public this(цел ид);
		public цел Флаги();
		public проц Флаги(цел значение);
		public Прямоугольник Прям();
		public проц Прям(Прямоугольник значение);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			wxEVT_CALCULATE_LAYOUT = wxEvent_EVT_CALCULATE_LAYOUT();

			ДобавьТипСоб(wxEVT_CALCULATE_LAYOUT,                &CalculateLayoutEvent.Нов);
		}
	}
