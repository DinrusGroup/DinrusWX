//-----------------------------------------------------------------------------
// wxD - HtmlListBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - HtmlListBox.cs
//
/// The wxHtmlListBox wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HtmlListBox.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.HtmlListBox;
public import wx.common;
public import wx.VLBox;

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias проц function(HtmlListBox объ) Virtual_VoidNoParams;
		alias проц function(HtmlListBox объ, цел n) Virtual_VoidSizeT;
		alias ткст function(HtmlListBox объ, цел n) Virtual_wxStringSizeT;
		alias ЦелУкз function(HtmlListBox объ, ЦелУкз цвет) Virtual_wxColourwxColour;
		alias проц function(HtmlListBox объ, ЦелУкз dc, inout Прямоугольник прям, цел n) Virtual_OnDrawItem;
		alias цел function(HtmlListBox объ, цел n) Virtual_OnMeasureItem;
		}

		static extern (C) ЦелУкз wxHtmlListBox_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
		static extern (C) проц wxHtmlListBox_RegisterVirtual(ЦелУкз сам,HtmlListBox объ,
			Virtual_VoidNoParams refreshAll,
			Virtual_VoidSizeT setItemCount,
			Virtual_wxStringSizeT onGetItem,
			Virtual_wxStringSizeT onGetItemMarkup,
			Virtual_wxColourwxColour getSelectedTextColour,
			Virtual_wxColourwxColour getSelectedTextBgColour,
			Virtual_OnDrawItem onDrawItem,
			Virtual_OnMeasureItem onMeasureItem,
			Virtual_OnDrawItem onDrawSeparator,
			Virtual_OnDrawItem onDrawBackground,
			Virtual_OnMeasureItem onGetLineHeight);
		static extern (C) бул wxHtmlListBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя);
		static extern (C) проц wxHtmlListBox_RefreshAll(ЦелУкз сам);
		static extern (C) проц wxHtmlListBox_SetItemCount(ЦелУкз сам, цел count);
		static extern (C) ЦелУкз wxHtmlListBox_OnGetItemMarkup(ЦелУкз сам, цел n);
		static extern (C) ЦелУкз wxHtmlListBox_GetSelectedTextColour(ЦелУкз сам, ЦелУкз цветПП);
		static extern (C) ЦелУкз wxHtmlListBox_GetSelectedTextBgColour(ЦелУкз сам, ЦелУкз цветЗП);
		static extern (C) проц wxHtmlListBox_OnDrawItem(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxHtmlListBox_OnMeasureItem(ЦелУкз сам, цел n);
		static extern (C) проц wxHtmlListBox_OnSize(ЦелУкз сам, ЦелУкз evt);
		static extern (C) проц wxHtmlListBox_Init(ЦелУкз сам);
		static extern (C) проц wxHtmlListBox_CacheItem(ЦелУкз сам, цел n);

		static extern (C) проц wxHtmlListBox_OnDrawSeparator(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, цел n);
		static extern (C) проц wxHtmlListBox_OnDrawBackground(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxHtmlListBox_OnGetLineHeight(ЦелУкз сам, цел line);
		//! \endcond

		//-----------------------------------------------------------------------------

	public abstract class HtmlListBox : VListBox
	{
		public this(ЦелУкз wxobj)
			{ super(wxobj); }

		public this()
			{ this(null, Окно.УникИД, вхДефПоз, вхДефРазм, 0, "");}

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя=wxVListBoxNameStr)
		{
			this(wxHtmlListBox_ctor2(wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя));

			wxHtmlListBox_RegisterVirtual(wxobj, this,
				&staticRefreshAll,
				&staticУстItemCount,
				&staticOnGetItem,
				&staticOnGetItemMarkup,
				&staticDoGetSelectedTextColour,
				&staticDoGetSelectedTextBgColour,
				&staticDoOnDrawItem,
				&staticOnMeasureItem,
				&staticDoOnDrawSeparator,
				&staticDoOnDrawBackground,
				&staticOnGetLineHeight);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя=wxVListBoxNameStr)
			{ this(родитель, Окно.УникИД, поз, Размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		public override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
		{
			return wxHtmlListBox_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private проц staticRefreshAll(HtmlListBox объ)
		{
			return объ.RefreshAll();
		}
		public override проц RefreshAll()
		{
			wxHtmlListBox_RefreshAll(wxobj);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private проц staticУстItemCount(HtmlListBox объ,цел count)
		{
			объ.УстItemCount(count);
		}
		public  проц УстItemCount(цел count)
		{
			wxHtmlListBox_SetItemCount(wxobj, count);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private ткст staticOnGetItem(HtmlListBox объ,цел n)
		{
			return объ.OnGetItem(n);
		}
		protected abstract ткст OnGetItem(цел n);

		//-----------------------------------------------------------------------------

		static extern(C) private ткст staticOnGetItemMarkup(HtmlListBox объ,цел n)
		{
			return объ.OnGetItem(n);
		}
		protected  ткст OnGetItemMarkup(цел n)
		{
			return cast(ткст) new wxString(wxHtmlListBox_OnGetItemMarkup(wxobj, n), да);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private ЦелУкз staticDoGetSelectedTextColour(HtmlListBox объ,ЦелУкз цветПП)
		{
			return wxObject.SafePtr(объ.GetSelectedTextColour(cast(Цвет)НайдиОбъект(цветПП, &Цвет.Нов)));
		}

		protected  Цвет GetSelectedTextColour(Цвет цветПП)
		{
			return new Цвет(wxHtmlListBox_GetSelectedTextColour(wxobj, wxObject.SafePtr(цветПП)), да);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private ЦелУкз staticDoGetSelectedTextBgColour(HtmlListBox объ, ЦелУкз цветЗП)
		{
			return wxObject.SafePtr(объ.GetSelectedTextBgColour(cast(Цвет)НайдиОбъект(цветЗП, &Цвет.Нов)));
		}

		protected  Цвет GetSelectedTextBgColour(Цвет цветЗП)
		{
			return new Цвет(wxHtmlListBox_GetSelectedTextBgColour(wxobj, wxObject.SafePtr(цветЗП)), да);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private проц staticDoOnDrawItem(HtmlListBox объ, ЦелУкз dc, inout Прямоугольник прям, цел n)
		{
			объ.OnDrawItem(cast(DC)НайдиОбъект(dc, &DC.Нов), прям, n);
		}

		protected override проц OnDrawItem(DC dc, Прямоугольник прям, цел n)
		{
			wxHtmlListBox_OnDrawItem(wxobj, wxObject.SafePtr(dc), прям, n);
		}

		//-----------------------------------------------------------------------------

		static extern(C) private цел staticOnMeasureItem(HtmlListBox объ, цел n)
		{
			return объ.OnMeasureItem(n);
		}
		protected override цел OnMeasureItem(цел n)
		{
			return wxHtmlListBox_OnMeasureItem(wxobj, n);
		}

		//-----------------------------------------------------------------------------

		protected проц OnSize(SizeEvent evt)
		{
			wxHtmlListBox_OnSize(wxobj, wxObject.SafePtr(evt));
		}

		//-----------------------------------------------------------------------------

		protected проц Init()
		{
			wxHtmlListBox_Init(wxobj);
		}

		//-----------------------------------------------------------------------------

		protected проц CacheItem(цел n)
		{
			wxHtmlListBox_CacheItem(wxobj, n);
		}

		//-----------------------------------------------------------------------------

		protected override проц OnDrawSeparator(DC dc, Прямоугольник прям, цел n)
		{
			wxHtmlListBox_OnDrawSeparator(wxobj, wxObject.SafePtr(dc), прям, n);
		}

		static extern(C) private проц staticDoOnDrawSeparator(HtmlListBox объ,ЦелУкз dc, inout Прямоугольник прям, цел n)
		{
			объ.OnDrawSeparator(cast(DC)НайдиОбъект(dc, &DC.Нов), прям, n);
		}

		//-----------------------------------------------------------------------------

		protected override проц OnDrawBackground(DC dc, Прямоугольник прям, цел n)
		{
			wxHtmlListBox_OnDrawBackground(wxobj, wxObject.SafePtr(dc), прям, n);
		}

		static extern(C) private проц staticDoOnDrawBackground(HtmlListBox объ,ЦелУкз dc, inout Прямоугольник прям, цел n)
		{
			объ.OnDrawBackground(cast(DC)НайдиОбъект(dc, &DC.Нов), прям, n);
		}

		//-----------------------------------------------------------------------------

		protected override цел OnGetLineHeight(цел line)
		{
			return wxHtmlListBox_OnGetLineHeight(wxobj, line);
		}
		static extern(C) private цел staticOnGetLineHeight(HtmlListBox объ, цел line)
		{
			return объ.OnGetLineHeight(line);
		}

	}
