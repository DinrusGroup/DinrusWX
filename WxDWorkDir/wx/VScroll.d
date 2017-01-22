//-----------------------------------------------------------------------------
// wxD - VScroll.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - VScroll.cs
//
/// The wxVScrolledWindow wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: VScroll.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.VScroll;
public import wx.common;
public import wx.Panel;
public import wx.SizeEvent;
/+
		//-----------------------------------------------------------------------------
		
		//! \cond EXTERN
		extern (C) {
		alias цел function(VScrolledWindow объ, цел n) Virtual_IntInt;
		}

		static extern (C) ЦУк wxVScrolledWindow_ctor();
		static extern (C) ЦУк wxVScrolledWindow_ctor2(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxVScrolledWindow_RegisterVirtual(ЦУк сам, VScrolledWindow объ, Virtual_IntInt onGetLineHeight);
		static extern (C) бул wxVScrolledWindow_Create(ЦУк сам,ЦУк родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя);
		static extern (C) проц wxVScrolledWindow_SetLineCount(ЦУк сам, цел счёт);
		static extern (C) бул wxVScrolledWindow_ScrollToLine(ЦУк сам, цел line);
		static extern (C) бул wxVScrolledWindow_ScrollLines(ЦУк сам, цел lines);
		static extern (C) бул wxVScrolledWindow_ScrollPages(ЦУк сам, цел pages);
		static extern (C) проц wxVScrolledWindow_RefreshLine(ЦУк сам, цел line);
		static extern (C) проц wxVScrolledWindow_RefreshLines(ЦУк сам, цел from, цел to);
		static extern (C) цел wxVScrolledWindow_HitTest(ЦУк сам, цел x, цел y);
		static extern (C) цел wxVScrolledWindow_HitTest2(ЦУк сам, inout Точка pt);
		static extern (C) проц wxVScrolledWindow_RefreshAll(ЦУк сам);
		static extern (C) цел wxVScrolledWindow_GetLineCount(ЦУк сам);
		static extern (C) цел wxVScrolledWindow_GetFirstVisibleLine(ЦУк сам);
		static extern (C) цел wxVScrolledWindow_GetLastVisibleLine(ЦУк сам);
		static extern (C) бул wxVScrolledWindow_IsVisible(ЦУк сам, цел line);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	public abstract class VScrolledWindow : Panel
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this() {
			this(wxVScrolledWindow_ctor());
			wxVScrolledWindow_RegisterVirtual(шхобъ, this, &staticOnGetLineHeight);
		}
			
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль=0, ткст имя = wxPanelNameStr)
		{
			this(wxVScrolledWindow_ctor2(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя));
			wxVScrolledWindow_RegisterVirtual(шхобъ, this, &staticOnGetLineHeight);
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль=0, ткст имя = wxPanelNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------
		
		public override бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxVScrolledWindow_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, стиль, имя); 
		//	return super.Create(родитель, ид, поз, size, стиль | wxVSCROLL, имя);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private цел staticOnGetLineHeight(VScrolledWindow объ, цел n)
		{
			return объ.OnGetLineHeight(n);
		}
		protected abstract цел OnGetLineHeight(цел n);
		
		public проц LineCount(цел значение) { wxVScrolledWindow_SetLineCount(шхобъ, значение); }
		public цел LineCount() { return wxVScrolledWindow_GetLineCount(шхобъ); }
		
		public проц ScrollToLine(цел line)
		{
			wxVScrolledWindow_ScrollToLine(шхобъ, line);
		}
		
		public override бул ScrollLines(цел lines)
		{
			return wxVScrolledWindow_ScrollLines(шхобъ, lines);
		}
		
		public override бул ScrollPages(цел pages)
		{
			return wxVScrolledWindow_ScrollPages(шхобъ, pages);
		}
		
		public проц RefreshLine(цел line)
		{
			wxVScrolledWindow_RefreshLine(шхобъ, line);
		}
		
		public проц RefreshLines(цел from, цел to)
		{
			wxVScrolledWindow_RefreshLines(шхобъ, from, to);
		}
		
		public цел HitTest(цел x, цел y)
		{
			return wxVScrolledWindow_HitTest(шхобъ, x, y);
		}
		
		public цел HitTest(Точка pt)
		{
			return wxVScrolledWindow_HitTest2(шхобъ, pt);
		}
		
		public /+virtual+/ проц RefreshAll()
		{
			wxVScrolledWindow_RefreshAll(шхобъ);
		}
		
		public цел GetFirstVisibleLine()
		{
			return wxVScrolledWindow_GetFirstVisibleLine(шхобъ);
		}
		
		public цел GetLastVisibleLine()
		{
			return wxVScrolledWindow_GetLastVisibleLine(шхобъ);
		}	
		
		public бул IsVisible(цел line)
		{
			return wxVScrolledWindow_IsVisible(шхобъ, line);
		}
	}
+/