module wx.Sizer;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) проц wxSizer_AddWindow(IntPtr сам, IntPtr окно, цел proportion, цел флаг, цел бордюр, IntPtr userData);
		static extern (C) проц wxSizer_AddSizer(IntPtr сам, IntPtr сайзер, цел proportion, цел флаг, цел бордюр, IntPtr userData);
		static extern (C) проц wxSizer_Add(IntPtr сам, цел ширь, цел высь, цел proportion, цел флаг, цел бордюр, IntPtr userData);

		static extern (C) проц wxSizer_Fit(IntPtr сам, IntPtr окно, inout Размер разм);
		static extern (C) проц wxSizer_FitInside(IntPtr сам, IntPtr окно);
		static extern (C) проц wxSizer_Layout(IntPtr сам);

		static extern (C) проц wxSizer_InsertWindow(IntPtr сам, цел before, IntPtr окно, цел option, бцел флаг, цел бордюр, IntPtr userData);
		static extern (C) проц wxSizer_InsertSizer(IntPtr сам, цел before, IntPtr сайзер, цел option, бцел флаг, цел бордюр, IntPtr userData);
		static extern (C) проц wxSizer_Insert(IntPtr сам, цел before, цел ширь, цел высь, цел option, бцел флаг, цел бордюр, IntPtr userData);

		static extern (C) проц wxSizer_PrependWindow(IntPtr сам, IntPtr окно, цел option, бцел флаг, цел бордюр, IntPtr userData);
		static extern (C) проц wxSizer_PrependSizer(IntPtr сам, IntPtr сайзер, цел option, бцел флаг, цел бордюр, IntPtr userData);
		static extern (C) проц wxSizer_Prepend(IntPtr сам, цел ширь, цел высь, цел option, бцел флаг, цел бордюр, IntPtr userData);

		//static extern (C) бул wxSizer_RemoveWindow(IntPtr сам, IntPtr окно);
		static extern (C) бул wxSizer_RemoveSizer(IntPtr сам, IntPtr сайзер);
		static extern (C) бул wxSizer_Remove(IntPtr сам, цел поз);

		static extern (C) проц wxSizer_Clear(IntPtr сам, бул delete_windows);
		static extern (C) проц wxSizer_DeleteWindows(IntPtr сам);

		static extern (C) проц wxSizer_SetMinSize(IntPtr сам, inout Размер разм);

		static extern (C) бул wxSizer_SetItemMinSizeWindow(IntPtr сам, IntPtr окно, inout Размер разм);
		static extern (C) бул wxSizer_SetItemMinSizeSizer(IntPtr сам, IntPtr сайзер, inout Размер разм);
		static extern (C) бул wxSizer_SetItemMinSize(IntPtr сам, цел поз, inout Размер разм);

		static extern (C) проц wxSizer_GetSize(IntPtr сам, out Размер разм);
		static extern (C) проц wxSizer_GetPosition(IntPtr сам, out Точка тчк);
		static extern (C) проц wxSizer_GetMinSize(IntPtr сам, out Размер разм);

		static extern (C) проц wxSizer_RecalcSizes(IntPtr сам);
		static extern (C) проц wxSizer_CalcMin(IntPtr сам, out Размер разм);

		static extern (C) проц wxSizer_SetSizeHints(IntPtr сам, IntPtr окно);
		static extern (C) проц wxSizer_SetVirtualSizeHints(IntPtr сам, IntPtr окно);
		static extern (C) проц wxSizer_SetDimension(IntPtr сам, цел x, цел y, цел ширь, цел высь);

		static extern (C) проц wxSizer_ShowWindow(IntPtr сам, IntPtr окно, бул покажи);
		static extern (C) проц wxSizer_HideWindow(IntPtr сам, IntPtr окно);
		static extern (C) проц wxSizer_ShowSizer(IntPtr сам, IntPtr сайзер, бул покажи);
		static extern (C) проц wxSizer_HideSizer(IntPtr сам, IntPtr сайзер);

		static extern (C) бул wxSizer_IsShownWindow(IntPtr сам, IntPtr окно);
		static extern (C) бул wxSizer_IsShownSizer(IntPtr сам, IntPtr сайзер);

		static extern (C) бул wxSizer_DetachWindow(IntPtr сам, IntPtr окно);
		static extern (C) бул wxSizer_DetachSizer(IntPtr сам, IntPtr сайзер);
		static extern (C) бул wxSizer_Detach(IntPtr сам, цел index);
		//! \endcond

		//---------------------------------------------------------------------

	public abstract class Сайзер : wxObject
	{
		public this(IntPtr wxobj);
		public проц Добавь(Окно окно, цел proportion=0, цел флаг=0, цел бордюр=0, wxObject userData=null);
		public проц Добавь(Сайзер сайзер, цел proportion=0, цел флаг=0, цел бордюр=0, wxObject userData=null);
		public проц Добавь(цел ширь, цел высь, цел proportion=0, цел флаг=0, цел бордюр=0, wxObject userData=null);
		public проц AddSpacer(цел разм);
		public проц AddStretchSpacer(цел proportion = 1);
		public Размер Встрой(Окно окно);
		public проц ВстройВнутрь(Окно окно);
		public проц Раскладка();
		public проц Insert(бцел index, Окно окно, цел proportion=0, цел флаг=0,
						   цел бордюр=0, wxObject userData=null);
		public проц Insert(бцел index, Сайзер сайзер, цел proportion=0, цел флаг=0,
						   цел бордюр=0, wxObject userData=null);
		public проц Insert(бцел index, цел ширь, цел высь, цел proportion=0,
						   цел флаг=0, цел бордюр=0, wxObject userData=null);
		public проц Prepend(Окно окно, цел proportion=0, цел флаг=0, цел бордюр=0,
							wxObject userData=null);
		public проц Prepend(Сайзер сайзер, цел proportion=0, цел флаг=0, цел бордюр=0,
							wxObject userData=null);
		public проц Prepend(цел ширь, цел высь, цел proportion=0, цел флаг=0,
						    цел бордюр=0, wxObject userData=null);
		public проц PrependSpacer(цел разм);
		public проц PrependStretchSpacer(цел proportion = 1);
		//public бул Remove(Окно окно);
		public бул Remove(Сайзер сайзер);
		public бул Remove(цел поз);
		public проц УстMinSize(Размер разм);
		public бул УстItemMinSize(Окно окно, Размер разм);
		public бул УстItemMinSize(Сайзер сайзер, Размер разм);
		public бул УстItemMinSize(цел поз, Размер разм);
		public Размер разм();
		public Точка Позиция();
		public Размер МинРазм();
		public  проц ПересчётРазмеров();
		public  Размер ВычислиМин();
		public проц УстРазмПодсказ(Окно окно);
		public проц УстВиртуалРазмПодсказ(Окно окно);
		public проц УстDimension(цел x, цел y, цел ширь, цел высь);
		public проц Покажи(Окно окно, бул покажи);
		public проц Покажи(Сайзер сайзер, бул покажи);
		public проц Покажи(бул покажи);
		public проц Clear(бул delete_windows);
		public проц DeleteWindows();
		public проц Спрячь(Окно окно);
		public проц Спрячь(Сайзер сайзер);
		public бул Виден(Окно окно);
		public бул Виден(Сайзер сайзер);
		public бул Detach(Окно окно);
		public бул Detach(Сайзер сайзер);
		public бул Detach(цел index);
	}
