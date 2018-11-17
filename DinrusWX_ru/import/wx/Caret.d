module wx.Caret;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxCaret_ctor();
		static extern (C) проц wxCaret_dtor(IntPtr сам);
		static extern (C) бул wxCaret_Create(IntPtr сам, IntPtr окно, цел ширь, цел высь);
		static extern (C) бул wxCaret_IsOk(IntPtr сам);
		static extern (C) бул wxCaret_IsVisible(IntPtr сам);
		static extern (C) проц wxCaret_GetPosition(IntPtr сам, out цел x, out цел y);
		static extern (C) проц wxCaret_GetSize(IntPtr сам, out цел ширь, out цел высь);
		static extern (C) IntPtr wxCaret_GetWindow(IntPtr сам);
		static extern (C) проц wxCaret_SetSize(IntPtr сам, цел ширь, цел высь);
		static extern (C) проц wxCaret_Move(IntPtr сам, цел x, цел y);
		static extern (C) проц wxCaret_Show(IntPtr сам, бул покажи);
		static extern (C) проц wxCaret_Hide(IntPtr сам);
		static extern (C) цел wxCaret_GetBlinkTime();
		static extern (C) проц wxCaret_SetBlinkTime(цел milliseconds);
		//! \endcond

		//---------------------------------------------------------------------

	alias Каретка wxCaret;
	public class Каретка : wxObject
	{
		public this();
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this(Окно окно, Размер разм);
		public this(Окно окно, цел ширь, цел высь);
		override protected проц dtor() ;
		public бул Создай(Окно окно, цел ширь, цел высь);
		public бул Ок();
		public бул Виден() ;
		public Точка Позиция() ;
		public проц Позиция(Точка значение) ;
		public Размер размер() ;
		public проц разм(Размер значение) ;
		public Окно окно() ;
		public проц Покажи(бул покажи);
		public проц Спрячь();
		static цел ВремяМигания();
		static проц ВремяМигания(цел значение) ;
		public static wxObject Нов(IntPtr ptr);
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxCaretSuspend_ctor(IntPtr win);
		static extern (C) проц wxCaretSuspend_dtor(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias CaretSuspend wxCaretSuspend;
	public class CaretSuspend : wxObject
	{
		public this(Окно win);
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
	}
