
module wx.HtmlListBox;
public import wx.common;
public import wx.VLBox;

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias проц function(HtmlListBox объ) Virtual_VoidNoParams;
		alias проц function(HtmlListBox объ, цел n) Virtual_VoidSizeT;
		alias ткст function(HtmlListBox объ, цел n) Virtual_wxStringSizeT;
		alias IntPtr function(HtmlListBox объ, IntPtr цвет) Virtual_wxColourwxColour;
		alias проц function(HtmlListBox объ, IntPtr dc, inout Прямоугольник прям, цел n) Virtual_OnDrawItem;
		alias цел function(HtmlListBox объ, цел n) Virtual_OnMeasureItem;
		}

		static extern (C) IntPtr wxHtmlListBox_ctor2(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxHtmlListBox_RegisterVirtual(IntPtr сам,HtmlListBox объ,
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
		static extern (C) бул wxHtmlListBox_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		static extern (C) проц wxHtmlListBox_RefreshAll(IntPtr сам);
		static extern (C) проц wxHtmlListBox_SetItemCount(IntPtr сам, цел count);
		static extern (C) IntPtr wxHtmlListBox_OnGetItemMarkup(IntPtr сам, цел n);
		static extern (C) IntPtr wxHtmlListBox_GetSelectedTextColour(IntPtr сам, IntPtr цветПП);
		static extern (C) IntPtr wxHtmlListBox_GetSelectedTextBgColour(IntPtr сам, IntPtr цветЗП);
		static extern (C) проц wxHtmlListBox_OnDrawItem(IntPtr сам, IntPtr dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxHtmlListBox_OnMeasureItem(IntPtr сам, цел n);
		static extern (C) проц wxHtmlListBox_OnSize(IntPtr сам, IntPtr evt);
		static extern (C) проц wxHtmlListBox_Init(IntPtr сам);
		static extern (C) проц wxHtmlListBox_CacheItem(IntPtr сам, цел n);

		static extern (C) проц wxHtmlListBox_OnDrawSeparator(IntPtr сам, IntPtr dc, inout Прямоугольник прям, цел n);
		static extern (C) проц wxHtmlListBox_OnDrawBackground(IntPtr сам, IntPtr dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxHtmlListBox_OnGetLineHeight(IntPtr сам, цел line);
		//! \endcond

		//-----------------------------------------------------------------------------

	public abstract class HtmlListBox : VListBox
	{
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя=wxVListBoxNameStr);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя=wxVListBoxNameStr);
		public override бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		static extern(C) private проц staticRefreshAll(HtmlListBox объ);
		public override проц RefreshAll();
		static extern(C) private проц staticУстItemCount(HtmlListBox объ,цел count);
		public  проц УстItemCount(цел count);
		static extern(C) private ткст staticOnGetItem(HtmlListBox объ,цел n);
		protected abstract ткст OnGetItem(цел n);
		static extern(C) private ткст staticOnGetItemMarkup(HtmlListBox объ,цел n);
		protected  ткст OnGetItemMarkup(цел n);
		static extern(C) private IntPtr staticDoGetSelectedTextColour(HtmlListBox объ,IntPtr цветПП);
		protected  Цвет GetSelectedTextColour(Цвет цветПП);
		static extern(C) private IntPtr staticDoGetSelectedTextBgColour(HtmlListBox объ, IntPtr цветЗП);
		protected  Цвет GetSelectedTextBgColour(Цвет цветЗП);
		static extern(C) private проц staticDoOnDrawItem(HtmlListBox объ, IntPtr dc, inout Прямоугольник прям, цел n);
		protected override проц OnDrawItem(DC dc, Прямоугольник прям, цел n);
		static extern(C) private цел staticOnMeasureItem(HtmlListBox объ, цел n);
		protected override цел OnMeasureItem(цел n);
		protected проц OnSize(SizeEvent evt);
		protected проц Init();
		protected проц CacheItem(цел n);
		protected override проц OnDrawSeparator(DC dc, Прямоугольник прям, цел n);
		static extern(C) private проц staticDoOnDrawSeparator(HtmlListBox объ,IntPtr dc, inout Прямоугольник прям, цел n);
		protected override проц OnDrawBackground(DC dc, Прямоугольник прям, цел n);
		static extern(C) private проц staticDoOnDrawBackground(HtmlListBox объ,IntPtr dc, inout Прямоугольник прям, цел n);
		protected override цел OnGetLineHeight(цел line);
		static extern(C) private цел staticOnGetLineHeight(HtmlListBox объ, цел line);

	}
