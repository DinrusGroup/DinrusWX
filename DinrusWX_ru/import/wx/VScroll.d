module wx.VScroll;
public import wx.common;
public import wx.Panel;
public import wx.SizeEvent;

		//-----------------------------------------------------------------------------
		
		//! \cond EXTERN
		extern (C) {
		alias цел function(VScrolledWindow объ, цел n) Virtual_IntInt;
		}

		static extern (C) IntPtr wxVScrolledWindow_ctor();
		static extern (C) IntPtr wxVScrolledWindow_ctor2(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxVScrolledWindow_RegisterVirtual(IntPtr сам, VScrolledWindow объ, Virtual_IntInt onGetLineHeight);
		static extern (C) бул wxVScrolledWindow_Create(IntPtr сам,IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		static extern (C) проц wxVScrolledWindow_SetLineCount(IntPtr сам, цел count);
		static extern (C) бул wxVScrolledWindow_ScrollToLine(IntPtr сам, цел line);
		static extern (C) бул wxVScrolledWindow_ScrollLines(IntPtr сам, цел строки);
		static extern (C) бул wxVScrolledWindow_ScrollPages(IntPtr сам, цел страницы);
		static extern (C) проц wxVScrolledWindow_RefreshLine(IntPtr сам, цел line);
		static extern (C) проц wxVScrolledWindow_RefreshLines(IntPtr сам, цел from, цел to);
		static extern (C) цел wxVScrolledWindow_HitTest(IntPtr сам, цел x, цел y);
		static extern (C) цел wxVScrolledWindow_HitTest2(IntPtr сам, inout Точка тчк);
		static extern (C) проц wxVScrolledWindow_RefreshAll(IntPtr сам);
		static extern (C) цел wxVScrolledWindow_GetLineCount(IntPtr сам);
		static extern (C) цел wxVScrolledWindow_GetFirstVisibleLine(IntPtr сам);
		static extern (C) цел wxVScrolledWindow_GetLastVisibleLine(IntPtr сам);
		static extern (C) бул wxVScrolledWindow_IsVisible(IntPtr сам, цел line);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	public abstract class VScrolledWindow : Panel
	{
		public this(IntPtr wxobj);
		public this() ;
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль=0, ткст имя = вхСтрИмяПанели);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль=0, ткст имя = вхСтрИмяПанели);
		public override бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		static extern(C) private цел staticOnGetLineHeight(VScrolledWindow объ, цел n);
		protected abstract цел OnGetLineHeight(цел n);		
		public проц LineCount(цел значение) ;
		public цел LineCount();		
		public проц ScrollToLine(цел line);
		public override бул ПрокрутиСтроки(цел строки);
		public override бул ПрокрутиСтраницы(цел страницы);
		public проц RefreshLine(цел line);
		public проц RefreshLines(цел from, цел to);
		public цел ТестНажатия(цел x, цел y);
		public цел ТестНажатия(Точка тчк);
		public  проц RefreshAll();
		public цел GetFirstVisibleLine();
		public цел GetLastVisibleLine();
		public бул Виден(цел line);
	}
