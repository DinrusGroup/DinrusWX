module wx.Panel;
public import wx.common;
public import wx.Window;
public import wx.Button;

		//! \cond EXTERN
		static extern (C) IntPtr wxPanel_ctor();
		static extern (C) IntPtr wxPanel_ctor2(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) бул wxPanel_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxPanel_InitDialog(IntPtr сам);
		static extern (C) IntPtr wxPanel_GetDefaultItem(IntPtr сам);
		static extern (C) проц wxPanel_SetDefaultItem(IntPtr сам, IntPtr btn);
		//! \endcond

	alias Panel wxPanel;
	/// A panel is a окно on which controls are placed. It is usually
	/// placed within a frame. It contains minimal extra functionality over and
	/// above its родитель class wxWindow; its main purpose is to be similar in
	/// appearance and functionality to a dialog, but with the flexibility of
	/// having any окно as a родитель.
	public class Panel : Окно
	{
		//---------------------------------------------------------------------
		
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxTAB_TRAVERSAL|wxNO_BORDER, ткст имя = вхСтрИмяПанели);
		public this(Окно родитель, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxTAB_TRAVERSAL|wxNO_BORDER, ткст имя=вхСтрИмяПанели);
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public Кнопка DefaultItem() ;
		public проц DefaultItem(Кнопка значение) ;
		public override проц ИницДиалог();
	}
