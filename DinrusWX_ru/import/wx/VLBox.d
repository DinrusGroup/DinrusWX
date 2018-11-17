module wx.VLBox;
public import wx.common;
public import wx.VScroll;

		//! \cond EXTERN
		extern (C) {
		alias цел function(VListBox объ, цел n) Virtual_IntInt;
		alias проц function(VListBox объ, IntPtr dc, Прямоугольник прям, цел n) Virtual_VoidDcRectSizeT;
		}

		static extern (C) IntPtr wxVListBox_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxVListBox_RegisterVirtual(IntPtr сам, VListBox объ,
			Virtual_VoidDcRectSizeT onDrawItem,
			Virtual_IntInt onMeasureItem,
			Virtual_VoidDcRectSizeT onDrawSeparator,
			Virtual_VoidDcRectSizeT onDrawBackground,
			Virtual_IntInt onGetLineHeight);
		static extern (C) бул wxVListBox_Create(IntPtr сам,IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		static extern (C) проц wxVListBox_OnDrawSeparator(IntPtr сам, IntPtr dc, inout Прямоугольник прям, цел n);
		static extern (C) проц wxVListBox_OnDrawBackground(IntPtr сам, IntPtr dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxVListBox_OnGetLineHeight(IntPtr сам, цел line);
		static extern (C) цел wxVListBox_GetItemCount(IntPtr сам);
		static extern (C) бул wxVListBox_HasMultipleSelection(IntPtr сам);
		static extern (C) цел wxVListBox_GetSelection(IntPtr сам);
		static extern (C) бул wxVListBox_IsCurrent(IntPtr сам, цел элт);
		static extern (C) бул wxVListBox_IsSelected(IntPtr сам, цел элт);
		static extern (C) цел wxVListBox_GetSelectedCount(IntPtr сам);
		static extern (C) цел wxVListBox_GetFirstSelected(IntPtr сам, out бцел cookie);
		static extern (C) цел wxVListBox_GetNextSelected(IntPtr сам, inout бцел cookie);
		static extern (C) проц wxVListBox_GetMargins(IntPtr сам, out Точка тчк);
		static extern (C) IntPtr wxVListBox_GetSelectionBackground(IntPtr сам);
		static extern (C) проц wxVListBox_SetItemCount(IntPtr сам, цел count);
		static extern (C) проц wxVListBox_Clear(IntPtr сам);
		static extern (C) проц wxVListBox_SetSelection(IntPtr сам, цел selection);
		static extern (C) бул wxVListBox_Select(IntPtr сам, цел элт, бул select);
		static extern (C) бул wxVListBox_SelectRange(IntPtr сам, цел from, цел to);
		static extern (C) проц wxVListBox_Toggle(IntPtr сам, цел элт);
		static extern (C) бул wxVListBox_SelectAll(IntPtr сам);
		static extern (C) бул wxVListBox_DeselectAll(IntPtr сам);
		static extern (C) проц wxVListBox_SetMargins(IntPtr сам, inout Точка тчк);
		static extern (C) проц wxVListBox_SetMargins2(IntPtr сам, цел x, цел y);
		static extern (C) проц wxVListBox_SetSelectionBackground(IntPtr сам, IntPtr col);
		//! \endcond

	public abstract class VListBox : VScrolledWindow
	{
		const ткст wxVListBoxNameStr = "wxVListBox";

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxVListBoxNameStr);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxVListBoxNameStr);
		public override бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		protected abstract проц OnDrawItem(DC dc, Прямоугольник прям, цел n);
		static extern(C) private проц staticDoOnDrawItem(VListBox объ, IntPtr dc, Прямоугольник прям, цел n);
		protected abstract цел OnMeasureItem(цел n);
		static extern(C) private цел staticOnMeasureItem(VListBox объ, цел n);
		protected  проц OnDrawSeparator(DC dc, Прямоугольник прям, цел n);
		static extern(C) private проц staticDoOnDrawSeparator(VListBox объ, IntPtr dc, Прямоугольник прям, цел n);
		protected  проц OnDrawBackground(DC dc, Прямоугольник прям, цел n);
		static extern(C) private проц staticDoOnDrawBackground(VListBox объ, IntPtr dc, Прямоугольник прям, цел n);
		protected override цел OnGetLineHeight(цел line);
		static extern(C) private override цел staticOnGetLineHeight(VListBox объ, цел line);
		public цел ItemCount();
		public проц ItemCount(цел значение);
		public бул HasMultipleSelection() ;
		public цел Выбор();
		public проц Выбор(цел значение) ;
		public бул IsCurrent(цел элт);
		public бул IsSelected(цел элт);
		public цел SelectedCount() ;
		public цел GetFirstSelected(out бцел cookie);
		public цел GetNextSelected(inout бцел cookie);
		public Точка Margins() ;
		public проц Margins(Точка значение);
		public проц УстMargins(цел x, цел y);
		public Цвет SelectionBackground() ;
		public проц SelectionBackground(Цвет значение);
		public проц Clear();
		public бул Select(цел элт);
		public бул Select(цел элт, бул select);
		public бул SelectRange(цел from, цел to);
		public проц Toggle(цел элт);
		public бул SelectAll();
		public бул DeselectAll();
	}
