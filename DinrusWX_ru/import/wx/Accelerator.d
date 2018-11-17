
module wx.Accelerator;
public import wx.common;
public import wx.MenuItem;

		//! \cond EXTERN
		static extern (C) IntPtr wxAcceleratorEntry_ctor(цел флаги, цел кодКл, цел кмд, IntPtr элт);
		static extern (C) проц   wxAcceleratorEntry_dtor(IntPtr сам);
		static extern (C) проц   wxAcceleratorEntry_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxAcceleratorEntry_Set(IntPtr сам, цел флаги, цел кодКл, цел кмд, IntPtr элт);
		static extern (C) проц   wxAcceleratorEntry_SetMenuItem(IntPtr сам, IntPtr элт);
		static extern (C) цел    wxAcceleratorEntry_GetFlags(IntPtr сам);
		static extern (C) цел    wxAcceleratorEntry_GetKeyCode(IntPtr сам);
		static extern (C) цел    wxAcceleratorEntry_GetCommand(IntPtr сам);
		static extern (C) IntPtr wxAcceleratorEntry_GetMenuItem(IntPtr сам);
		
		static extern (C) IntPtr wxAcceleratorEntry_GetAccelFromString(ткст ярлык);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias ЗаписьАкселератора wxAcceleratorEntry;
	public class ЗаписьАкселератора : wxObject
	{
		public const цел wxACCEL_NORMAL	= 0x0000;
		public const цел wxACCEL_ALT	= 0x0001;
		public const цел wxACCEL_CTRL	= 0x0002;
		public const цел wxACCEL_SHIFT	= 0x0004;
		
		//-----------------------------------------------------------------------------
		
		public this(IntPtr wxobj);			
		private this(IntPtr wxobj, бул memOwn);			
		public this();		
		public this(цел флаги);
		public this(цел флаги, цел кодКл);
		public this(цел флаги, цел кодКл, цел кмд);
		public this(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт);
		public проц Уст(цел флаги, цел кодКл, цел кмд);		
		public проц Уст(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт);
		public ЭлтМеню элтМеню() ;
		public цел Флаги() ;
		public цел КодКл() ;
		public цел Команда() ;
		override protected проц dtor();
		public static ЗаписьАкселератора ДайАксельИзТкст(ткст ярлык);
		public static wxObject Нов(IntPtr ptr) ;
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxAcceleratorTable_ctor();
		static extern (C) бул   wxAcceleratorTable_Ok(IntPtr сам);
		//static extern (C) проц   wxAcceleratorTable_Add(IntPtr сам, IntPtr entry);
		//static extern (C) проц   wxAcceleratorTable_Remove(IntPtr сам, IntPtr entry);
		//static extern (C) IntPtr wxAcceleratorTable_GetMenuItem(IntPtr сам, IntPtr evt);
		//static extern (C) цел    wxAcceleratorTable_GetCommand(IntPtr сам, IntPtr evt);
		//static extern (C) IntPtr wxAcceleratorTable_GetEntry(IntPtr сам, IntPtr evt);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ТаблицаАкселераторов wxAcceleratorTable;
	public class ТаблицаАкселераторов : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		//public проц Добавь(ЗаписьАкселератора entry);
		//public проц Remove(ЗаписьАкселератора entry);
		//public ЭлтМеню GetЭлтМеню(KeyEvent evt);
		//public ЗаписьАкселератора GetEntry(KeyEvent evt);
		//public цел GetКоманда(KeyEvent evt);
		public бул Ок() ;

		public static wxObject Нов(IntPtr ptr) ;
	}

