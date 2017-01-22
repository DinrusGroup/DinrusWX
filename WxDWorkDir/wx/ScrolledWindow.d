//-----------------------------------------------------------------------------
// wxD - ScrolledWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ScrolledWindow.cs
//
/// The wxScrolledWindow wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ScrolledWindow.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ScrolledWindow;
public import wx.common;
public import wx.Panel;

		//! \cond EXTERN
		static extern (C) ЦУк wxScrollWnd_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц   wxScrollWnd_PrepareDC(ЦУк сам, ЦУк dc);
		static extern (C) проц   wxScrollWnd_SetScrollbars(ЦУк сам, цел pixX, цел pixY, цел numX, цел numY, цел x, цел y, бул noRefresh);
		static extern (C) проц   wxScrollWnd_GetViewStart(ЦУк сам, inout цел x, inout цел y);
		static extern (C) проц   wxScrollWnd_GetScrollPixelsPerUnit(ЦУк сам, inout цел xUnit, inout цел yUnit);
		
		static extern (C) проц   wxScrollWnd_CalcScrolledPosition(ЦУк сам, цел x, цел y, inout цел xx, inout цел yy);
		static extern (C) проц   wxScrollWnd_CalcUnscrolledPosition(ЦУк сам, цел x, цел y, inout цел xx, inout цел yy);
		static extern (C) проц   wxScrollWnd_GetVirtualSize(ЦУк сам, inout цел x, inout цел y);
		static extern (C) проц   wxScrollWnd_Scroll(ЦУк сам, цел x, цел y);
		static extern (C) проц   wxScrollWnd_SetScrollRate(ЦУк сам, цел xstep, цел ystep);
		static extern (C) проц   wxScrollWnd_SetTargetWindow(ЦУк сам, ЦУк окно);
		//! \endcond

		//---------------------------------------------------------------------

	alias ScrolledWindow wxScrolledWindow;
	public class ScrolledWindow : Panel
	{
		enum {
			wxScrolledWindowStyle = (wxHSCROLL | wxVSCROLL),
		}
	
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxScrolledWindowStyle, ткст имя = wxPanelNameStr)
		{
			super(wxScrollWnd_ctor(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя));
			EVT_PAINT(&OnPaint);
		}

		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxScrolledWindowStyle, ткст имя = wxPanelNameStr)
		{
			this(родитель,Окно.UniqueID,поз,size,стиль,имя);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц OnDraw(DC dc)
		{
		}

		//---------------------------------------------------------------------

		public override проц PrepareDC(DC dc)
		{
			wxScrollWnd_PrepareDC(шхобъ, dc.шхобъ);
		}

		//---------------------------------------------------------------------

		public проц SetScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY)
		{ 
			SetScrollbars(pixelsPerUnitY, pixelsPerUnitY, noUnitsY, noUnitsY, 0, 0, нет); 
		}
		
		public проц SetScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY, цел x, цел y)
		{ 
			SetScrollbars(pixelsPerUnitY, pixelsPerUnitY, noUnitsY, noUnitsY, x, y, нет); 
		}
		
		public проц SetScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY, цел x, цел y, бул noRefresh)
		{
			wxScrollWnd_SetScrollbars(шхобъ, pixelsPerUnitX, pixelsPerUnitY, noUnitsX, noUnitsY, x, y, noRefresh);
		}

		//---------------------------------------------------------------------

		private проц OnPaint(Объект sender, Событие e)
		{
			PaintDC dc = new PaintDC(this);
			PrepareDC(dc);
			OnDraw(dc);
			dc.Dispose();
		}

		//---------------------------------------------------------------------

		public Точка ViewStart()
		{
			Точка pt;
			GetViewStart(pt.X, pt.Y);
			return pt;
		}

		public проц GetViewStart(inout цел x, inout цел y)
		{
			wxScrollWnd_GetViewStart(шхобъ, x, y);
		}

		//---------------------------------------------------------------------

		public проц GetScrollPixelsPerUnit(inout цел xUnit, inout цел yUnit)
		{
			wxScrollWnd_GetScrollPixelsPerUnit(шхобъ, xUnit, yUnit);
		}
		
		//---------------------------------------------------------------------
		
		public проц CalcScrolledPosition(цел x, цел y, inout цел xx, inout цел yy)
		{
			wxScrollWnd_CalcScrolledPosition(шхобъ, x, y, xx, yy);
		}
		
		//---------------------------------------------------------------------
		
		public проц CalcUnscrolledPosition(цел x, цел y, inout цел xx, inout цел yy)
		{
			wxScrollWnd_CalcUnscrolledPosition(шхобъ, x, y, xx, yy);
		}
		
		//---------------------------------------------------------------------
		
		public проц GetVirtualSize(inout цел x, inout цел y)
		{
			wxScrollWnd_GetVirtualSize(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц Scroll(цел x, цел y)
		{
			wxScrollWnd_Scroll(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetScrollRate(цел xstep, цел ystep)
		{
			wxScrollWnd_SetScrollRate(шхобъ, xstep, ystep);
		}
		
		//---------------------------------------------------------------------
		
		public проц TargetWindow(Окно значение) { wxScrollWnd_SetTargetWindow(шхобъ, wxObject.SafePtr(значение)); }
	}
