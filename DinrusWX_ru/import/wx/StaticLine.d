module wx.StaticLine;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxStaticLine_ctor();
		static extern (C) бул wxStaticLine_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) бул wxStaticLine_IsVertical(IntPtr сам);
		static extern (C) цел  wxStaticLine_GetDefaultSize(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias StaticLine wxStaticLine;
	public class StaticLine : Control
	{
		enum {
			wxLI_HORIZONTAL	= Ориентация.wxHORIZONTAL,
			wxLI_VERTICAL		= Ориентация.wxVERTICAL,
		}
		
		public const ткст wxStaticTextNameStr = "message";
		//---------------------------------------------------------------------
		
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxLI_HORIZONTAL, ткст имя = wxStaticTextNameStr);
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxLI_HORIZONTAL, ткст имя = wxStaticTextNameStr);
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public бул IsVertical();
		public цел DefaultSize() ;
	}
