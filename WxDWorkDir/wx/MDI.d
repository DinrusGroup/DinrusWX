//-----------------------------------------------------------------------------
// wxD - MDI.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MDI.cs
//
/// The wxMDI* wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MDI.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.MDI;
public import wx.common;
public import wx.Frame;

		//! \cond EXTERN
		extern (C) {
		alias ЦУк function(MDIParentFrame объ) Virtual_OnCreateClient;
		}

		static extern (C) ЦУк wxMDIParentFrame_ctor();
		static extern (C) проц wxMDIParentFrame_RegisterVirtual(ЦУк сам, MDIParentFrame объ, Virtual_OnCreateClient onCreateClient);
		static extern (C) ЦУк wxMDIParentFrame_OnCreateClient(ЦУк сам);
		static extern (C) бул   wxMDIParentFrame_Create(ЦУк сам, ЦУк родитель, цел ид, ткст title, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
	
		static extern (C) ЦУк wxMDIParentFrame_GetActiveChild(ЦУк сам);
		//static extern (C) проц   wxMDIParentFrame_SetActiveChild(ЦУк сам, ЦУк pChildFrame);
	
	//	static extern (C) ЦУк wxMDIParentFrame_GetClientWindow(ЦУк сам);
	
		static extern (C) проц   wxMDIParentFrame_Cascade(ЦУк сам);
		static extern (C) проц   wxMDIParentFrame_Tile(ЦУк сам);
	
		static extern (C) проц   wxMDIParentFrame_ArrangeIcons(ЦУк сам);
	
		static extern (C) проц   wxMDIParentFrame_ActivateNext(ЦУк сам);
		static extern (C) проц   wxMDIParentFrame_ActivatePrevious(ЦУк сам);
		
		static extern (C) проц   wxMDIParentFrame_GetClientSize(ЦУк сам, out цел ширина, out цел высота);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias MDIParentFrame wxMDIParentFrame;
	public class MDIParentFrame : Frame
	{
		enum { wxDEFAULT_MDI_FRAME_STYLE = wxDEFAULT_FRAME_STYLE | wxVSCROLL | wxHSCROLL }
		
		//-----------------------------------------------------------------------------
		
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public this()
		{ 
			super(wxMDIParentFrame_ctor());
			wxMDIParentFrame_RegisterVirtual(шхобъ, this, &staticDoOnCreateClient);
		}

		public this(Окно родитель, цел ид, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_MDI_FRAME_STYLE, ткст имя=wxFrameNameStr)
		{
			this();
			
			if (!Create(родитель, ид, title, поз, size, стиль, имя)) 
			{
				throw new InvalidOperationException("Could not create MDIParentFrame");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_MDI_FRAME_STYLE, ткст имя=wxFrameNameStr)
			{ this(родитель, Окно.UniqueID, title, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------

		public override бул Create(Окно родитель, цел ид, ткст title, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxMDIParentFrame_Create(шхобъ, wxObject.SafePtr(родитель), ид, title, поз, size, cast(бцел)стиль, имя);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private ЦУк staticDoOnCreateClient(MDIParentFrame объ)
		{
			return wxObject.SafePtr(объ.OnCreateClient());
		}
		
		public /+virtual+/ MDIClientWindow OnCreateClient()
		{
			return cast(MDIClientWindow)FindObject(wxMDIParentFrame_OnCreateClient(шхобъ), &MDIClientWindow.Нов);
		}

		//-----------------------------------------------------------------------------

		public MDIChildFrame GetActiveChild()
		{
			return cast(MDIChildFrame)FindObject(wxMDIParentFrame_GetActiveChild(шхобъ), &MDIChildFrame.Нов);
		}

		/*
		public проц SetActiveChild(MDIChildFrame pChildFrame)
		{
			wxMDIParentFrame_SetActiveChild(шхобъ, wxObject.SafePtr(pChildFrame));
		}
		*/

		//-----------------------------------------------------------------------------
/+
		public MDIClientWindow GetClientWindow()
		{
			return cast(MDIClientWindow)FindObject(wxMDIParentFrame_GetClientWindow(шхобъ), &MDIClientWindow.Нов);
		}
+/
		//-----------------------------------------------------------------------------

		public /+virtual+/ проц Cascade()
		{
			wxMDIParentFrame_Cascade(шхобъ);
		}

		public /+virtual+/ проц Tile()
		{
			wxMDIParentFrame_Tile(шхобъ);
		}

		//-----------------------------------------------------------------------------

		public /+virtual+/ проц ArrangeIcons()
		{
			wxMDIParentFrame_ArrangeIcons(шхобъ);
		}

		//-----------------------------------------------------------------------------

		public /+virtual+/ проц ActivateNext()
		{
			wxMDIParentFrame_ActivateNext(шхобъ);
		}

		public /+virtual+/ проц ActivatePrevious()
		{
			wxMDIParentFrame_ActivatePrevious(шхобъ);
		}

		//-----------------------------------------------------------------------------
		
		public /+virtual+/ проц GetClientSize(out цел ширина, out цел высота)
		{
			wxMDIParentFrame_GetClientSize(шхобъ, ширина, высота);
		}
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxMDIChildFrame_ctor();
		static extern (C) бул   wxMDIChildFrame_Create(ЦУк сам, ЦУк родитель, цел ид, ткст title, inout  Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц   wxMDIChildFrame_Activate(ЦУк сам);
		static extern (C) проц   wxMDIChildFrame_Restore(ЦУк сам);
		static extern (C) проц   wxMDIChildFrame_Maximize(ЦУк сам, бул maximize);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias MDIChildFrame wxMDIChildFrame;
	public class MDIChildFrame : Frame 
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxMDIChildFrame_ctor());}

		public this(MDIParentFrame родитель, цел ид, ткст title, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
		{
			super(wxMDIChildFrame_ctor());
			if (!Create(родитель, ид, title, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Could not create MDIChildFrame");
			}
	    
			EVT_ACTIVATE( &OnActivate );
		}
		
		static wxObject Нов(ЦУк ptr) { return new MDIChildFrame(ptr); }
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(MDIParentFrame родитель, ткст title, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
			{ this(родитель, Окно.UniqueID, title, поз, size, стиль, имя); }
		
		//-----------------------------------------------------------------------------

		public бул Create(MDIParentFrame родитель, цел ид, ткст title, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			бул ret = wxMDIChildFrame_Create(шхобъ, wxObject.SafePtr(родитель), ид, title, поз, size, стиль, имя);
			version(__WXMAC__){
				// Bug in wxMac 2.5.2; it always returns FALSE
				return да;
			} else {
				return ret;
			} // version(__WXMAC__)
		}

		//-----------------------------------------------------------------------------

		public /+virtual+/ проц Activate()
		{
			wxMDIChildFrame_Activate(шхобъ);
		}

		//-----------------------------------------------------------------------------

		public /+virtual+/ проц Restore()
		{
			wxMDIChildFrame_Restore(шхобъ);
		}

		//-----------------------------------------------------------------------------
	
		public /+virtual+/ проц OnActivate(Объект sender, Событие e)
		{
		}
		
		//-----------------------------------------------------------------------------
		
		public /+virtual+/ проц Maximize()
		{
			wxMDIChildFrame_Maximize(шхобъ, да);
		}
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxMDIClientWindow_ctor();
		static extern (C) бул   wxMDIClientWindow_CreateClient(ЦУк сам, ЦУк родитель, бцел стиль);
		//! \endcond
	
		//-----------------------------------------------------------------------------
	
	alias MDIClientWindow wxMDIClientWindow;
	public class MDIClientWindow : Окно
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public  this()
			{ super(wxMDIClientWindow_ctor()); }

		public this(MDIParentFrame родитель, цел стиль=0)
		{
			super(wxMDIClientWindow_ctor());
			if (!CreateClient(родитель, стиль))
			{
				throw new InvalidOperationException("Could not create MDIClientWindow");
			}
		}
		
		static wxObject Нов(ЦУк ptr) { return new MDIClientWindow(ptr); }
		
		//-----------------------------------------------------------------------------

		public бул CreateClient(MDIParentFrame родитель, цел стиль)
		{
			return wxMDIClientWindow_CreateClient(шхобъ, wxObject.SafePtr(родитель), стиль);
		}
	}

