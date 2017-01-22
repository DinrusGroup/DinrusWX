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
/+
		//-----------------------------------------------------------------------------
		
		//! \cond EXTERN
		extern (C) {
		alias проц function(HtmlListBox объ) Virtual_VoidNoParams;
		alias проц function(HtmlListBox объ, цел n) Virtual_VoidSizeT;
		alias ткст function(HtmlListBox объ, цел n) Virtual_wxStringSizeT;
		alias ЦУк function(HtmlListBox объ, ЦУк colour) Virtual_wxColourwxColour;
		alias проц function(HtmlListBox объ, ЦУк dc, inout Прямоугольник прям, цел n) Virtual_OnDrawItem;
		alias цел function(HtmlListBox объ, цел n) Virtual_OnMeasureItem;
		}

		static extern (C) ЦУк wxHtmlListBox_ctor2(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxHtmlListBox_RegisterVirtual(ЦУк сам,HtmlListBox объ,
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
		static extern (C) бул wxHtmlListBox_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя);
		static extern (C) проц wxHtmlListBox_RefreshAll(ЦУк сам);
		static extern (C) проц wxHtmlListBox_SetItemCount(ЦУк сам, цел счёт);
		static extern (C) ЦУк wxHtmlListBox_OnGetItemMarkup(ЦУк сам, цел n);
		static extern (C) ЦУк wxHtmlListBox_GetSelectedTextColour(ЦУк сам, ЦУк цветПП);
		static extern (C) ЦУк wxHtmlListBox_GetSelectedTextBgColour(ЦУк сам, ЦУк цветЗП);
		static extern (C) проц wxHtmlListBox_OnDrawItem(ЦУк сам, ЦУк dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxHtmlListBox_OnMeasureItem(ЦУк сам, цел n);
		static extern (C) проц wxHtmlListBox_OnSize(ЦУк сам, ЦУк evt);
		static extern (C) проц wxHtmlListBox_Init(ЦУк сам);
		static extern (C) проц wxHtmlListBox_CacheItem(ЦУк сам, цел n);
		
		static extern (C) проц wxHtmlListBox_OnDrawSeparator(ЦУк сам, ЦУк dc, inout Прямоугольник прям, цел n);
		static extern (C) проц wxHtmlListBox_OnDrawBackground(ЦУк сам, ЦУк dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxHtmlListBox_OnGetLineHeight(ЦУк сам, цел line);		
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	public abstract class HtmlListBox : VListBox
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
            
		public this()
			{ this(пусто, Окно.UniqueID, wxDefaultPosition, wxDefaultSize, 0, "");}
			
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя=wxVListBoxNameStr)
		{
			this(wxHtmlListBox_ctor2(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя));

			wxHtmlListBox_RegisterVirtual(шхобъ, this,
				&staticRefreshAll,
				&staticSetItemCount,
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
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя=wxVListBoxNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------
		
		public override бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxHtmlListBox_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, стиль, имя);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticRefreshAll(HtmlListBox объ)
		{
			return объ.RefreshAll();
		}
		public override проц RefreshAll()
		{
			wxHtmlListBox_RefreshAll(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticSetItemCount(HtmlListBox объ,цел счёт)
		{
			объ.SetItemCount(счёт);
		}
		public /+virtual+/ проц SetItemCount(цел счёт)
		{
			wxHtmlListBox_SetItemCount(шхобъ, счёт);
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
		protected /+virtual+/ ткст OnGetItemMarkup(цел n)
		{
			return cast(ткст) new wxString(wxHtmlListBox_OnGetItemMarkup(шхобъ, n), да);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private ЦУк staticDoGetSelectedTextColour(HtmlListBox объ,ЦУк цветПП)
		{
			return wxObject.SafePtr(объ.GetSelectedTextColour(cast(Цвет)FindObject(цветПП, &Цвет.Нов)));
		}
		
		protected /+virtual+/ Цвет GetSelectedTextColour(Цвет цветПП)
		{
			return new Цвет(wxHtmlListBox_GetSelectedTextColour(шхобъ, wxObject.SafePtr(цветПП)), да);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private ЦУк staticDoGetSelectedTextBgColour(HtmlListBox объ, ЦУк цветЗП)
		{
			return wxObject.SafePtr(объ.GetSelectedTextBgColour(cast(Цвет)FindObject(цветЗП, &Цвет.Нов)));
		}
		
		protected /+virtual+/ Цвет GetSelectedTextBgColour(Цвет цветЗП)
		{
			return new Цвет(wxHtmlListBox_GetSelectedTextBgColour(шхобъ, wxObject.SafePtr(цветЗП)), да);
		}		
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticDoOnDrawItem(HtmlListBox объ, ЦУк dc, inout Прямоугольник прям, цел n)
		{
			объ.OnDrawItem(cast(DC)FindObject(dc, &DC.Нов), прям, n);
		}
		
		protected override проц OnDrawItem(DC dc, Прямоугольник прям, цел n)
		{
			wxHtmlListBox_OnDrawItem(шхобъ, wxObject.SafePtr(dc), прям, n);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private цел staticOnMeasureItem(HtmlListBox объ, цел n)
		{
			return объ.OnMeasureItem(n);
		}
		protected override цел OnMeasureItem(цел n)
		{
			return wxHtmlListBox_OnMeasureItem(шхобъ, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected проц OnSize(SizeEvent evt)
		{
			wxHtmlListBox_OnSize(шхобъ, wxObject.SafePtr(evt));
		}
		
		//-----------------------------------------------------------------------------
		
		protected проц Init()
		{
			wxHtmlListBox_Init(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		protected проц CacheItem(цел n)
		{
			wxHtmlListBox_CacheItem(шхобъ, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected override проц OnDrawSeparator(DC dc, Прямоугольник прям, цел n)
		{
			wxHtmlListBox_OnDrawSeparator(шхобъ, wxObject.SafePtr(dc), прям, n);
		}
		
		static extern(C) private проц staticDoOnDrawSeparator(HtmlListBox объ,ЦУк dc, inout Прямоугольник прям, цел n)
		{
			объ.OnDrawSeparator(cast(DC)FindObject(dc, &DC.Нов), прям, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected override проц OnDrawBackground(DC dc, Прямоугольник прям, цел n)
		{
			wxHtmlListBox_OnDrawBackground(шхобъ, wxObject.SafePtr(dc), прям, n);
		}
		
		static extern(C) private проц staticDoOnDrawBackground(HtmlListBox объ,ЦУк dc, inout Прямоугольник прям, цел n)
		{
			объ.OnDrawBackground(cast(DC)FindObject(dc, &DC.Нов), прям, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected override цел OnGetLineHeight(цел line)
		{
			return wxHtmlListBox_OnGetLineHeight(шхобъ, line);
		}
		static extern(C) private цел staticOnGetLineHeight(HtmlListBox объ, цел line)
		{
			return объ.OnGetLineHeight(line);
		}
		
	}
+/