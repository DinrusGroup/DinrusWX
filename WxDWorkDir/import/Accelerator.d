module wx.Accelerator;
public import wx.common;
public import wx.MenuItem;

		//! \cond EXTERN
		static extern (C) ЦУк wxAcceleratorEntry_ctor(цел флаги, цел кодКлавиши, цел команда, ЦУк элемент);
		static extern (C) проц   wxAcceleratorEntry_dtor(ЦУк сам);
		static extern (C) проц   wxAcceleratorEntry_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxAcceleratorEntry_Set(ЦУк сам, цел флаги, цел кодКлавиши, цел команда, ЦУк элемент);
		static extern (C) проц   wxAcceleratorEntry_SetMenuItem(ЦУк сам, ЦУк элемент);
		static extern (C) цел    wxAcceleratorEntry_GetFlags(ЦУк сам);
		static extern (C) цел    wxAcceleratorEntry_GetKeyCode(ЦУк сам);
		static extern (C) цел    wxAcceleratorEntry_GetCommand(ЦУк сам);
		static extern (C) ЦУк wxAcceleratorEntry_GetMenuItem(ЦУк сам);
		
		static extern (C) ЦУк wxAcceleratorEntry_GetAccelFromString(ткст надпись);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias AcceleratorEntry wxAcceleratorEntry;
	public class AcceleratorEntry : wxObject
	{
		public const цел wxACCEL_NORMAL	= 0x0000;
		public const цел wxACCEL_ALT	= 0x0001;
		public const цел wxACCEL_CTRL	= 0x0002;
		public const цел wxACCEL_SHIFT	= 0x0004;
		
		//-----------------------------------------------------------------------------
		
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
			
		public this()
			{ this(0, 0, 0, пусто);}
		
		public this(цел флаги)
			{ this(флаги, 0, 0, пусто);}
			
		public this(цел флаги, цел кодКлавиши)
			{ this(флаги, кодКлавиши, 0, пусто);}
			
		public this(цел флаги, цел кодКлавиши, цел команда)
			{ this(флаги, кодКлавиши, команда, пусто);}
			
		public this(цел флаги, цел кодКлавиши, цел команда, ЭлементМеню элемент)
		{
			this(wxAcceleratorEntry_ctor(флаги, кодКлавиши, команда, wxObject.SafePtr(элемент)), да);
			wxAcceleratorEntry_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Установи(цел флаги, цел кодКлавиши, цел команда)
		{
			Установи(флаги, кодКлавиши, команда);
		}
		
		public проц Установи(цел флаги, цел кодКлавиши, цел команда, ЭлементМеню элемент)
		{
			wxAcceleratorEntry_Set(шхобъ, флаги, кодКлавиши, команда, wxObject.SafePtr(элемент));
		}
		
		//-----------------------------------------------------------------------------
		
		public ЭлементМеню элементМеню() { return cast(ЭлементМеню)FindObject(wxAcceleratorEntry_GetMenuItem(шхобъ), &ЭлементМеню.New2); }		
		//-----------------------------------------------------------------------------
		
		public цел Флаги() { return wxAcceleratorEntry_GetFlags(шхобъ); }		
		//-----------------------------------------------------------------------------
		
		public цел КодКлавиши() { return wxAcceleratorEntry_GetKeyCode(шхобъ); }		
		//-----------------------------------------------------------------------------
		
		public цел Command() { return wxAcceleratorEntry_GetCommand(шхобъ); }		
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxAcceleratorEntry_dtor(шхобъ); }

		//---------------------------------------------------------------------
		
		public static AcceleratorEntry GetAccelFromString(ткст надпись)
		{
			return cast(AcceleratorEntry)FindObject(wxAcceleratorEntry_GetAccelFromString(надпись), &AcceleratorEntry.Нов);
		}
		
		public static wxObject Нов(ЦУк ptr) { return new AcceleratorEntry(ptr);}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxAcceleratorTable_ctor();
		static extern (C) бул   wxAcceleratorTable_Ok(ЦУк сам);
		//static extern (C) проц   wxAcceleratorTable_Add(ЦУк сам, ЦУк entry);
		//static extern (C) проц   wxAcceleratorTable_Remove(ЦУк сам, ЦУк entry);
		//static extern (C) ЦУк wxAcceleratorTable_GetMenuItem(ЦУк сам, ЦУк evt);
		//static extern (C) цел    wxAcceleratorTable_GetCommand(ЦУк сам, ЦУк evt);
		//static extern (C) ЦУк wxAcceleratorTable_GetEntry(ЦУк сам, ЦУк evt);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias AcceleratorTable wxAcceleratorTable;
	public class AcceleratorTable : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this(wxAcceleratorTable_ctor());}
			
		//! \cond VERSION
		version(__WXMAC__) {} else {
		//! \endcond
		//-----------------------------------------------------------------------------

		/*public проц Добавь(AcceleratorEntry entry)
		{
			wxAcceleratorTable_Add(шхобъ, wxObject.SafePtr(entry));
		}*/

		//-----------------------------------------------------------------------------

		/*public проц Remove(AcceleratorEntry entry)
		{
			wxAcceleratorTable_Remove(шхобъ, wxObject.SafePtr(entry));
		}*/

		//-----------------------------------------------------------------------------

		/*public ЭлементМеню GetMenuItem(СобКлавиши evt)
		{
			return cast(ЭлементМеню)FindObject(wxAcceleratorTable_GetMenuItem(шхобъ, wxObject.SafePtr(evt)),&ЭлементМеню.Нов);
		}*/

		//-----------------------------------------------------------------------------

		/*public AcceleratorEntry GetEntry(СобКлавиши evt)
		{
			return cast(AcceleratorEntry)FindObject(wxAcceleratorTable_GetEntry(шхобъ, wxObject.SafePtr(evt)),&AcceleratorEntry.Нов);
		}*/
		//! \cond VERSION
		} // version(__WXMAC__)
		//! \endcond

		//-----------------------------------------------------------------------------

		/*public цел GetCommand(СобКлавиши evt)
		{
			return wxAcceleratorTable_GetCommand(шхобъ, wxObject.SafePtr(evt));
		}*/

		//-----------------------------------------------------------------------------

		public бул Ок() { return wxAcceleratorTable_Ok(шхобъ); }

		public static wxObject Нов(ЦУк ptr) { return new AcceleratorTable(ptr); }
	}

