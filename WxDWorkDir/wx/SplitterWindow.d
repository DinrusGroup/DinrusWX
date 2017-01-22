//-----------------------------------------------------------------------------
// wxD - SplitterWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SplitterWindow.cs
//
/// The wxSplitterWindow wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SplitterWindow.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.SplitterWindow;
public import wx.common;
public import wx.Window;

	public enum SplitMode
	{
		wxSPLIT_HORIZONTAL	= 1,
		wxSPLIT_VERTICAL
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias проц function(SplitterWindow объ, цел x, цел y) Virtual_OnDoubleClickSash;
		alias проц function(SplitterWindow объ, ЦУк removed) Virtual_OnUnsplit;
		alias бул function(SplitterWindow объ, цел newSashPosition) Virtual_OnSashPositionChange;
		}
		
		static extern (C) ЦУк wxSplitWnd_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц   wxSplitWnd_RegisterVirtual(ЦУк сам, SplitterWindow объ, Virtual_OnDoubleClickSash onDoubleClickSash, Virtual_OnUnsplit onUnsplit, Virtual_OnSashPositionChange onSashPositionChange);
		static extern (C) проц   wxSplitWnd_OnDoubleClickSash(ЦУк сам, цел x, цел y);
		static extern (C) проц   wxSplitWnd_OnUnsplit(ЦУк сам, ЦУк removed);
		static extern (C) бул   wxSplitWnd_OnSashPositionChange(ЦУк сам, цел newSashPosition);
		static extern (C) цел    wxSplitWnd_GetSplitMode(ЦУк сам);
		static extern (C) бул   wxSplitWnd_IsSplit(ЦУк сам);
		static extern (C) бул   wxSplitWnd_SplitHorizontally(ЦУк сам, ЦУк wnd1, ЦУк wnd2, цел sashPos);
		static extern (C) бул   wxSplitWnd_SplitVertically(ЦУк сам, ЦУк wnd1, ЦУк wnd2, цел sashPos);
		static extern (C) бул   wxSplitWnd_Unsplit(ЦУк сам, ЦУк toRemove);
		static extern (C) проц   wxSplitWnd_SetSashPosition(ЦУк сам, цел position, бул redraw);
		static extern (C) цел    wxSplitWnd_GetSashPosition(ЦУк сам);
		
		static extern (C) цел    wxSplitWnd_GetMinimumPaneSize(ЦУк сам);
		static extern (C) ЦУк wxSplitWnd_GetWindow1(ЦУк сам);
		static extern (C) ЦУк wxSplitWnd_GetWindow2(ЦУк сам);
		static extern (C) проц   wxSplitWnd_Initialize(ЦУк сам, ЦУк окно);
		static extern (C) бул   wxSplitWnd_ReplaceWindow(ЦУк сам, ЦУк winOld, ЦУк winNew);
		static extern (C) проц   wxSplitWnd_SetMinimumPaneSize(ЦУк сам, цел paneSize);
		static extern (C) проц   wxSplitWnd_SetSplitMode(ЦУк сам, цел mode);
		static extern (C) проц   wxSplitWnd_UpdateSize(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias SplitterWindow wxSplitterWindow;
	public class SplitterWindow : Окно
	{
		enum {
			wxSP_3DBORDER		= 0x00000200,
			wxSP_LIVE_UPDATE	= 0x00000080,
			wxSP_3DSASH		= 0x00000100,
			wxSP_3D			= (wxSP_3DBORDER | wxSP_3DSASH),
		}
		
		//---------------------------------------------------------------------

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSP_3D, ткст имя="splitter")
		{ 
			super(wxSplitWnd_ctor(wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя));
			
			wxSplitWnd_RegisterVirtual(шхобъ, this, &staticOnDoubleClickSash, &staticDoOnUnsplit, &staticOnSashPositionChange);
		}
			
		//---------------------------------------------------------------------
		// ctors with сам created ид
			
		public this(Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxSP_3D, ткст имя="splitter")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}

		//---------------------------------------------------------------------
		
		static extern(C) private проц staticOnDoubleClickSash(SplitterWindow объ, цел x, цел y)
		{
			объ.OnDoubleClickSash(x, y);
		}
		public /+virtual+/ проц OnDoubleClickSash(цел x, цел y)
		{
			wxSplitWnd_OnDoubleClickSash(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		static extern(C) private проц staticDoOnUnsplit(SplitterWindow объ, ЦУк removed)
		{
			объ.OnUnsplit(cast(Окно)FindObject(removed));
		}
		
		public /+virtual+/ проц OnUnsplit(Окно removed)
		{
			wxSplitWnd_OnUnsplit(шхобъ, wxObject.SafePtr(removed));
		}
		
		//---------------------------------------------------------------------
		
		static extern(C) private бул staticOnSashPositionChange(SplitterWindow объ, цел newSashPosition)
		{
			return объ.OnSashPositionChange(newSashPosition);
		}
		public /+virtual+/ бул OnSashPositionChange(цел newSashPosition)
		{
			return wxSplitWnd_OnSashPositionChange(шхобъ, newSashPosition);
		}
		
		//---------------------------------------------------------------------

		public бул IsSplit() { return wxSplitWnd_IsSplit(шхобъ); }

		//---------------------------------------------------------------------

		public бул SplitHorizontally(Окно wnd1, Окно wnd2, цел sashPos=0)
		{
			return wxSplitWnd_SplitHorizontally(шхобъ, wxObject.SafePtr(wnd1), wxObject.SafePtr(wnd2), sashPos);
		}

		//---------------------------------------------------------------------

		public SplitMode splitMode() { return cast(SplitMode)wxSplitWnd_GetSplitMode(шхобъ); }
		public проц splitMode(SplitMode значение) { wxSplitWnd_SetSplitMode(шхобъ, cast(цел)значение); }

		//---------------------------------------------------------------------

		public бул SplitVertically(Окно wnd1, Окно wnd2, цел sashPos=0)
		{
			return wxSplitWnd_SplitVertically(шхобъ, wxObject.SafePtr(wnd1), wxObject.SafePtr(wnd2), sashPos);
		}

		//---------------------------------------------------------------------

		public бул Unsplit(Окно toRemove=пусто)
		{
			return wxSplitWnd_Unsplit(шхобъ, wxObject.SafePtr(toRemove));
		}

		//---------------------------------------------------------------------

		public проц SashPosition(цел значение) { SetSashPosition(значение, да); }
		public цел SashPosition() { return wxSplitWnd_GetSashPosition(шхобъ); }

		public проц SetSashPosition(цел position, бул redraw=да)
		{
			wxSplitWnd_SetSashPosition(шхобъ, position, redraw);
		}
		
		//---------------------------------------------------------------------
		
		public цел MinimumPaneSize() { return wxSplitWnd_GetMinimumPaneSize(шхобъ); }
		public проц MinimumPaneSize(цел значение) { wxSplitWnd_SetMinimumPaneSize(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public static wxObject myNew(ЦУк ptr) { return new Окно(ptr); }
		public Окно Window1() { return cast(Окно)FindObject(wxSplitWnd_GetWindow1(шхобъ), &myNew); }
		
		//---------------------------------------------------------------------
		
		public Окно Window2() { return cast(Окно)FindObject(wxSplitWnd_GetWindow2(шхобъ), &myNew); }
		
		//---------------------------------------------------------------------
		
		public проц Инициализуй(Окно окно)
		{
			wxSplitWnd_Initialize(шхобъ, wxObject.SafePtr(окно));
		}
		
		//---------------------------------------------------------------------
		
		public бул ReplaceWindow(Окно winOld, Окно winNew)
		{
			return wxSplitWnd_ReplaceWindow(шхобъ, wxObject.SafePtr(winOld), wxObject.SafePtr(winNew));
		}
		
		//---------------------------------------------------------------------
		
		public проц UpdateSize()
		{
			wxSplitWnd_UpdateSize(шхобъ);
		}
	}
