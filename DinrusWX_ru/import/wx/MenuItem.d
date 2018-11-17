module wx.MenuItem;
public import wx.common;
public import wx.Accelerator;
public import wx.Menu;
public import wx.Bitmap;
public import wx.EvtHandler;

		//! \cond EXTERN
		static extern (C) IntPtr wxЭлтМеню_GetMenu(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_SetMenu(IntPtr сам, IntPtr меню);
		static extern (C) проц   wxЭлтМеню_SetId(IntPtr сам, цел ид);
		static extern (C) цел    wxЭлтМеню_GetId(IntPtr сам);
		static extern (C) бул   wxЭлтМеню_IsSeparator(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_SetText(IntPtr сам, ткст стр);
		static extern (C) IntPtr wxЭлтМеню_GetLabel(IntPtr сам);
		static extern (C) IntPtr wxЭлтМеню_GetText(IntPtr сам);
		static extern (C) IntPtr wxЭлтМеню_GetLabelFromText(IntPtr сам, ткст текст);
		static extern (C) цел    wxЭлтМеню_GetKind(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_SetCheckable(IntPtr сам, бул checkable);
		static extern (C) бул   wxЭлтМеню_IsCheckable(IntPtr сам);
		static extern (C) бул   wxЭлтМеню_IsSubMenu(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_SetSubMenu(IntPtr сам, IntPtr меню);
		static extern (C) IntPtr wxЭлтМеню_GetSubMenu(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_Enable(IntPtr сам, бул вкл);
		static extern (C) бул   wxЭлтМеню_IsEnabled(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_Check(IntPtr сам, бул check);
		static extern (C) бул   wxЭлтМеню_IsChecked(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_Toggle(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_SetHelp(IntPtr сам, ткст стр);
		static extern (C) IntPtr wxЭлтМеню_GetHelp(IntPtr сам);
		static extern (C) IntPtr wxЭлтМеню_GetAccel(IntPtr сам);
		static extern (C) проц   wxЭлтМеню_SetAccel(IntPtr сам, IntPtr accel);
		static extern (C) проц   wxЭлтМеню_SetName(IntPtr сам, ткст стр);
		static extern (C) IntPtr wxЭлтМеню_GetName(IntPtr сам);
		static extern (C) IntPtr wxЭлтМеню_NewCheck(IntPtr parentMenu, цел ид, ткст текст, ткст help, бул isCheckable, IntPtr subMenu);
		static extern (C) IntPtr wxЭлтМеню_New(IntPtr parentMenu, цел ид, ткст текст, ткст help, цел kind, IntPtr subMenu);
		//static extern (C) проц   wxЭлтМеню_SetBitmap(IntPtr сам, IntPtr битмап);
		//static extern (C) IntPtr wxЭлтМеню_GetBitmap(IntPtr сам);
		static extern (C) IntPtr wxЭлтМеню_ctor(IntPtr parentMenu, цел ид, ткст текст, ткст help, цел kind, IntPtr subMenu);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ЭлтМеню wxЭлтМеню;
	public class ЭлтМеню : wxObject
	{
		public this(IntPtr wxobj);
		public  this(Меню parentMenu = null, цел ид =  wxID_SEPARATOR, ткст текст = "", ткст help = "", ItemKind kind = ItemKind.wxITEM_NORMAL, Меню subMenu = null);
		public static wxObject New2(IntPtr ptr) ;
		public static ЭлтМеню Нов(Меню parentMenu = null, цел ид = wxID_SEPARATOR, ткст текст = "", ткст help = "", ItemKind kind=ItemKind.wxITEM_NORMAL, Меню subMenu = null);
		public Меню меню();
		public проц меню(Меню значение);
		public цел ИД();
		public проц ИД(цел значение);
		public бул IsSeparator();
		public проц Text(ткст значение);
		public ткст Text() ;
		public ткст Ярлык();
		public ткст GetLabelFromText(ткст текст);
		public ItemKind Kind();
		public проц Checkable(бул значение);
		public бул Checkable() ;
		public бул IsSubMenu() ;
		public проц SubMenu(Меню значение) ;
		public Меню SubMenu();
		public проц Активен(бул значение);
		public бул Активен();
		public проц Checked(бул значение) ;
		public бул Checked() ;
		public проц Toggle();
		public проц Help(ткст значение);
		public ткст Help() ;
		public ЗаписьАкселератора Accel() ;
		public проц Accel(ЗаписьАкселератора значение) ;
		public проц Имя(ткст значение) ;
		public ткст Имя() ;
		//public проц битмап(Битмап значение);
		public проц Click_Add(ДатчикСобытий значение) ;
		public проц Click_Remove(ДатчикСобытий значение);
        public проц Select_Add(ДатчикСобытий значение);
        public проц Select_Remove(ДатчикСобытий значение);
	}

