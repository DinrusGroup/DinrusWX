module wx.ScrolledWindow;
public import wx.common;
public import wx.Panel;

		//! \cond EXTERN
		static extern (C) IntPtr wxScrollWnd_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц   wxScrollWnd_PrepareDC(IntPtr сам, IntPtr dc);
		static extern (C) проц   wxScrollWnd_SetScrollbars(IntPtr сам, цел pixX, цел pixY, цел numX, цел numY, цел x, цел y, бул noRefresh);
		static extern (C) проц   wxScrollWnd_GetViewStart(IntPtr сам, inout цел x, inout цел y);
		static extern (C) проц   wxScrollWnd_GetScrollPixelsPerUnit(IntPtr сам, inout цел xUnit, inout цел yUnit);
		
		static extern (C) проц   wxScrollWnd_CalcScrolledPosition(IntPtr сам, цел x, цел y, inout цел xx, inout цел yy);
		static extern (C) проц   wxScrollWnd_CalcUnscrolledPosition(IntPtr сам, цел x, цел y, inout цел xx, inout цел yy);
		static extern (C) проц   wxScrollWnd_GetVirtualSize(IntPtr сам, inout цел x, inout цел y);
		static extern (C) проц   wxScrollWnd_Scroll(IntPtr сам, цел x, цел y);
		static extern (C) проц   wxScrollWnd_SetScrollRate(IntPtr сам, цел xstep, цел ystep);
		static extern (C) проц   wxScrollWnd_SetTargetWindow(IntPtr сам, IntPtr окно);
		//! \endcond

		//---------------------------------------------------------------------

	alias ScrolledWindow wxScrolledWindow;
	public class ScrolledWindow : Panel
	{
		enum {
			wxScrolledWindowStyle = (wxHSCROLL | wxVSCROLL),
		}
	
		public this(IntPtr wxobj) ;
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxScrolledWindowStyle, ткст имя = вхСтрИмяПанели);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxScrolledWindowStyle, ткст имя = вхСтрИмяПанели);
		public  проц OnDraw(DC dc);
		public override проц ПодготовьКР(DC dc);
		public проц УстScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY);
		public проц УстScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY, цел x, цел y);
		public проц УстScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY, цел x, цел y, бул noRefresh);
		private проц OnPaint(Объект отправитель, Событие e);
		public Точка ViewStart();
		public проц GetViewStart(inout цел x, inout цел y);
		public проц GetScrollPixelsPerUnit(inout цел xUnit, inout цел yUnit);
		public проц CalcScrolledPosition(цел x, цел y, inout цел xx, inout цел yy);
		public проц CalcUnscrolledPosition(цел x, цел y, inout цел xx, inout цел yy);
		public проц GetVirtualSize(inout цел x, inout цел y);
		public проц Scroll(цел x, цел y);
		public проц УстScrollRate(цел xstep, цел ystep);
		public проц TargetWindow(Окно значение) ;
	}
