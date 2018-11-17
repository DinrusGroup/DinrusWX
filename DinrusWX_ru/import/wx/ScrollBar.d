module wx.ScrollBar;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxScrollBar_ctor();
		static extern (C) бул   wxScrollBar_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) цел    wxScrollBar_GetThumbPosition(IntPtr сам);
		static extern (C) цел    wxScrollBar_GetThumbSize(IntPtr сам);
		static extern (C) цел    wxScrollBar_GetPageSize(IntPtr сам);
		static extern (C) цел    wxScrollBar_GetRange(IntPtr сам);
		static extern (C) бул   wxScrollBar_IsVertical(IntPtr сам);
		static extern (C) проц   wxScrollBar_SetThumbPosition(IntPtr сам, цел viewStart);
		static extern (C) проц   wxScrollBar_SetScrollbar(IntPtr сам, цел position, цел размТумб, цел диапазон, цел pageSize, бул освежи);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ScrollBar wxScrollBar;
	public class ScrollBar : Control
	{
		enum {
			wxSB_HORIZONTAL   = Ориентация.wxHORIZONTAL,
			wxSB_VERTICAL     = Ориентация.wxVERTICAL,
		}

		public const ткст wxScrollBarNameStr = "scrollBar";
		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSB_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxScrollBarNameStr);
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSB_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxScrollBarNameStr);
		public бул Создай(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public цел ThumbPosition() ;
		public проц ThumbPosition(цел значение) ;
		public цел ThumbSize() ;
		public цел PageSize();
		public цел Range() ;
		public бул IsVertical();
		public override проц УстСкроллбар(цел position, цел размТумб, цел диапазон, цел pageSize, бул освежи);
	}
