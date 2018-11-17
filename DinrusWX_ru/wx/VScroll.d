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

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел function(VScrolledWindow объ, цел n) Virtual_IntInt;
		}

		static extern (C) ЦелУкз wxVScrolledWindow_ctor();
		static extern (C) ЦелУкз wxVScrolledWindow_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
		static extern (C) проц wxVScrolledWindow_RegisterVirtual(ЦелУкз сам, VScrolledWindow объ, Virtual_IntInt onGetLineHeight);
		static extern (C) бул wxVScrolledWindow_Create(ЦелУкз сам,ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя);
		static extern (C) проц wxVScrolledWindow_SetLineCount(ЦелУкз сам, цел count);
		static extern (C) бул wxVScrolledWindow_ScrollToLine(ЦелУкз сам, цел line);
		static extern (C) бул wxVScrolledWindow_ScrollLines(ЦелУкз сам, цел строки);
		static extern (C) бул wxVScrolledWindow_ScrollPages(ЦелУкз сам, цел страницы);
		static extern (C) проц wxVScrolledWindow_RefreshLine(ЦелУкз сам, цел line);
		static extern (C) проц wxVScrolledWindow_RefreshLines(ЦелУкз сам, цел from, цел to);
		static extern (C) цел wxVScrolledWindow_HitTest(ЦелУкз сам, цел x, цел y);
		static extern (C) цел wxVScrolledWindow_HitTest2(ЦелУкз сам, inout Точка тчк);
		static extern (C) проц wxVScrolledWindow_RefreshAll(ЦелУкз сам);
		static extern (C) цел wxVScrolledWindow_GetLineCount(ЦелУкз сам);
		static extern (C) цел wxVScrolledWindow_GetFirstVisibleLine(ЦелУкз сам);
		static extern (C) цел wxVScrolledWindow_GetLastVisibleLine(ЦелУкз сам);
		static extern (C) бул wxVScrolledWindow_IsVisible(ЦелУкз сам, цел line);
		//! \endcond

		//-----------------------------------------------------------------------------

	public abstract class VScrolledWindow : Panel
	{
		public this(ЦелУкз wxobj)
			{ super(wxobj); }

		public this() {
			this(wxVScrolledWindow_ctor());
			wxVScrolledWindow_RegisterVirtual(wxobj, this, &staticOnGetLineHeight);
		}

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль=0, ткст имя = вхСтрИмяПанели)
		{
			this(wxVScrolledWindow_ctor2(wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя));
			wxVScrolledWindow_RegisterVirtual(wxobj, this, &staticOnGetLineHeight);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль=0, ткст имя = вхСтрИмяПанели)
			{ this(родитель, Окно.УникИД, поз, Размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		public override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
		{
			return wxVScrolledWindow_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя);
		//	return super.создай(родитель, ид, поз, Размер, стиль | wxVSCROLL, имя);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private цел staticOnGetLineHeight(VScrolledWindow объ, цел n)
		{
			return объ.OnGetLineHeight(n);
		}
		protected abstract цел OnGetLineHeight(цел n);

		public проц LineCount(цел значение) { wxVScrolledWindow_SetLineCount(wxobj, значение); }
		public цел LineCount() { return wxVScrolledWindow_GetLineCount(wxobj); }

		public проц ScrollToLine(цел line)
		{
			wxVScrolledWindow_ScrollToLine(wxobj, line);
		}

		public override бул ПрокрутиСтроки(цел строки)
		{
			return wxVScrolledWindow_ScrollLines(wxobj, строки);
		}

		public override бул ПрокрутиСтраницы(цел страницы)
		{
			return wxVScrolledWindow_ScrollPages(wxobj, страницы);
		}

		public проц RefreshLine(цел line)
		{
			wxVScrolledWindow_RefreshLine(wxobj, line);
		}

		public проц RefreshLines(цел from, цел to)
		{
			wxVScrolledWindow_RefreshLines(wxobj, from, to);
		}

		public цел ТестНажатия(цел x, цел y)
		{
			return wxVScrolledWindow_HitTest(wxobj, x, y);
		}

		public цел ТестНажатия(Точка тчк)
		{
			return wxVScrolledWindow_HitTest2(wxobj, тчк);
		}

		public  проц RefreshAll()
		{
			wxVScrolledWindow_RefreshAll(wxobj);
		}

		public цел GetFirstVisibleLine()
		{
			return wxVScrolledWindow_GetFirstVisibleLine(wxobj);
		}

		public цел GetLastVisibleLine()
		{
			return wxVScrolledWindow_GetLastVisibleLine(wxobj);
		}

		public бул Виден(цел line)
		{
			return wxVScrolledWindow_IsVisible(wxobj, line);
		}
	}
