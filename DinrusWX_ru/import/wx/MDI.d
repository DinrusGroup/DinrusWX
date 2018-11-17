module  wx.MDI;
public import wx.common;
public import wx.Frame;

		//! \cond EXTERN
		extern (C) {
		alias IntPtr function(MDIParentFrame объ) Virtual_OnCreateClient;
		}

		static extern (C) IntPtr wxMDIParentFrame_ctor();
		static extern (C) проц wxMDIParentFrame_RegisterVirtual(IntPtr сам, MDIParentFrame объ, Virtual_OnCreateClient onCreateClient);
		static extern (C) IntPtr wxMDIParentFrame_OnCreateClient(IntPtr сам);
		static extern (C) бул   wxMDIParentFrame_Create(IntPtr сам, IntPtr родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);

		static extern (C) IntPtr wxMDIParentFrame_GetActiveChild(IntPtr сам);
		//static extern (C) проц   wxMDIParentFrame_SetActiveChild(IntPtr сам, IntPtr pChildFrame);

		static extern (C) IntPtr wxMDIParentFrame_GetClientWindow(IntPtr сам);

		static extern (C) проц   wxMDIParentFrame_Cascade(IntPtr сам);
		static extern (C) проц   wxMDIParentFrame_Tile(IntPtr сам);

		static extern (C) проц   wxMDIParentFrame_ArrangeIcons(IntPtr сам);

		static extern (C) проц   wxMDIParentFrame_ActivateNext(IntPtr сам);
		static extern (C) проц   wxMDIParentFrame_ActivatePrevious(IntPtr сам);

		static extern (C) проц   wxMDIParentFrame_GetClientSize(IntPtr сам, out цел ширь, out цел высь);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias MDIParentFrame wxMDIParentFrame;
	public class MDIParentFrame : Frame
	{
		enum { wxDEFAULT_MDI_FRAME_STYLE = wxDEFAULT_FRAME_STYLE | wxVSCROLL | wxHSCROLL }

		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_MDI_FRAME_STYLE, ткст имя=wxFrameNameStr);
		public this(Окно родитель, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_MDI_FRAME_STYLE, ткст имя=wxFrameNameStr);
		public override бул Создай(Окно родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		static extern(C) private IntPtr staticDoOnCreateClient(MDIParentFrame объ);
		public  MDIClientWindow OnCreateClient();
		public MDIChildFrame GetActiveChild();
		//public проц УстActiveChild(MDIChildFrame pChildFrame);
		public MDIClientWindow GetClientWindow();
		public  проц Cascade();
		public  проц Tile();
		public  проц ArrangeIcons();
		public  проц ActivateNext();
		public  проц ActivatePrevious();
		public  проц GetClientSize(out цел ширь, out цел высь);
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxMDIChildFrame_ctor();
		static extern (C) бул   wxMDIChildFrame_Create(IntPtr сам, IntPtr родитель, цел ид, ткст title, inout  Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц   wxMDIChildFrame_Activate(IntPtr сам);
		static extern (C) проц   wxMDIChildFrame_Restore(IntPtr сам);
		static extern (C) проц   wxMDIChildFrame_Maximize(IntPtr сам, бул maximize);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias MDIChildFrame wxMDIChildFrame;
	public class MDIChildFrame : Frame
	{
		public this(IntPtr wxobj) ;
		public this();
		public this(MDIParentFrame родитель, цел ид, ткст title, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr);
		static wxObject Нов(IntPtr ptr);
		public this(MDIParentFrame родитель, ткст title, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr);
		public бул Создай(MDIParentFrame родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public  проц Activate();
		public  проц Restore();
		public  проц OnActivate(Объект отправитель, Событие e);
		public  проц Maximize();
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxMDIClientWindow_ctor();
		static extern (C) бул   wxMDIClientWindow_CreateClient(IntPtr сам, IntPtr родитель, бцел стиль);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias MDIClientWindow wxMDIClientWindow;
	public class MDIClientWindow : Окно
	{
		public this(IntPtr wxobj);
		public  this();
		public this(MDIParentFrame родитель, цел стиль=0);
		static wxObject Нов(IntPtr ptr);
		public бул CreateClient(MDIParentFrame родитель, цел стиль);
	}

