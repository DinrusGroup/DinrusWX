//-----------------------------------------------------------------------------
// wxD - ЭлементМеню.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ЭлементМеню.cs
//
/// The wxMenuItem wrapper class.
//
// Written by Achim Breunig(achim.breunig@web.de)
// (C) 2003 
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ЭлементМеню.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.MenuItem;
public import wx.common;
public import wx.Accelerator;
public import wx.Menu;
public import wx.Bitmap;
public import wx.EvtHandler;

		//! \cond EXTERN
		static extern (C) ЦУк wxMenuItem_GetMenu(ЦУк сам);
		static extern (C) проц   wxMenuItem_SetMenu(ЦУк сам, ЦУк меню);
		static extern (C) проц   wxMenuItem_SetId(ЦУк сам, цел ид);
		static extern (C) цел    wxMenuItem_GetId(ЦУк сам);
		static extern (C) бул   wxMenuItem_IsSeparator(ЦУк сам);
		//static extern (C) проц   wxMenuItem_SetText(ЦУк сам, ткст str);
		//static extern (C) ЦУк wxMenuItem_GetLabel(ЦУк сам);
		//static extern (C) ЦУк wxMenuItem_GetText(ЦУк сам);
		//static extern (C) ЦУк wxMenuItem_GetLabelFromText(ЦУк сам, ткст текст);
		static extern (C) цел    wxMenuItem_GetKind(ЦУк сам);
		static extern (C) проц   wxMenuItem_SetCheckable(ЦУк сам, бул checkable);
		static extern (C) бул   wxMenuItem_IsCheckable(ЦУк сам);
		static extern (C) бул   wxMenuItem_IsSubMenu(ЦУк сам);
		static extern (C) проц   wxMenuItem_SetSubMenu(ЦУк сам, ЦУк меню);
		static extern (C) ЦУк wxMenuItem_GetSubMenu(ЦУк сам);
		static extern (C) проц   wxMenuItem_Enable(ЦУк сам, бул enable);
		static extern (C) бул   wxMenuItem_IsEnabled(ЦУк сам);
		static extern (C) проц   wxMenuItem_Check(ЦУк сам, бул check);
		static extern (C) бул   wxMenuItem_IsChecked(ЦУк сам);
		static extern (C) проц   wxMenuItem_Toggle(ЦУк сам);
		static extern (C) проц   wxMenuItem_SetHelp(ЦУк сам, ткст str);
		static extern (C) ЦУк wxMenuItem_GetHelp(ЦУк сам);
		static extern (C) ЦУк wxMenuItem_GetAccel(ЦУк сам);
		static extern (C) проц   wxMenuItem_SetAccel(ЦУк сам, ЦУк accel);
		//static extern (C) проц   wxMenuItem_SetName(ЦУк сам, ткст str);
		//static extern (C) ЦУк wxMenuItem_GetName(ЦУк сам);
		static extern (C) ЦУк wxMenuItem_NewCheck(ЦУк менюРодитель, цел ид, ткст текст, ткст справка, бул isCheckable, ЦУк подменю);
		static extern (C) ЦУк wxMenuItem_New(ЦУк менюРодитель, цел ид, ткст текст, ткст справка, цел вид, ЦУк подменю);
		static extern (C) проц   wxMenuItem_SetBitmap(ЦУк сам, ЦУк битмап);
		static extern (C) ЦУк wxMenuItem_GetBitmap(ЦУк сам);
		static extern (C) ЦУк wxMenuItem_ctor(ЦУк менюРодитель, цел ид, ткст текст, ткст справка, цел вид, ЦУк подменю);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ЭлементМеню wxMenuItem;
	public class ЭлементМеню : wxObject
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public  this(Меню менюРодитель = пусто, цел ид =  wxID_SEPARATOR, ткст текст = "", ткст справка = "", ItemKind вид = ItemKind.wxITEM_NORMAL, Меню подменю = пусто)
			{ this(wxMenuItem_ctor(wxObject.SafePtr(менюРодитель), ид, текст, справка, cast(цел)вид, wxObject.SafePtr(подменю))); }
			
		public static wxObject New2(ЦУк ptr) { return new ЭлементМеню(ptr); }
		//-----------------------------------------------------------------------------

		public static ЭлементМеню Нов(Меню менюРодитель = пусто, цел ид = wxID_SEPARATOR, ткст текст = "", ткст справка = "", ItemKind вид=ItemKind.wxITEM_NORMAL, Меню подменю = пусто)
		{
			return new ЭлементМеню(wxMenuItem_New(wxObject.SafePtr(менюРодитель), ид, текст, справка, cast(цел)вид, wxObject.SafePtr(подменю)));
		}
	/* OLD API
		public static ЭлементМеню Нов(Меню менюРодитель, цел ид, ткст текст, ткст справка, бул isCheckable, Меню подменю)
		{
			return new ЭлементМеню(wxMenuItem_NewCheck(wxObject.SafePtr(менюРодитель), ид, текст, справка, isCheckable, wxObject.SafePtr(подменю)));
		}

	*/	//-----------------------------------------------------------------------------

		public Меню меню() { return cast(Меню)FindObject(wxMenuItem_GetMenu(шхобъ), &Меню.Нов); }
		public проц меню(Меню значение) { wxMenuItem_SetMenu(шхобъ, wxObject.SafePtr(значение)); }

		//-----------------------------------------------------------------------------

		public цел ИД() { return wxMenuItem_GetId(шхобъ); }
		public проц ИД(цел значение) { wxMenuItem_SetId(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public бул Разделитель_ли() { return wxMenuItem_IsSeparator(шхобъ); }
		
		//-----------------------------------------------------------------------------
	/+	
		public проц Текст(ткст значение) { wxMenuItem_SetText(шхобъ, значение); } 
		public ткст Текст() { return cast(ткст) new wxString(wxMenuItem_GetText(шхобъ), да); }
+/
		//-----------------------------------------------------------------------------
/+
		public ткст Label() { return cast(ткст) new wxString(wxMenuItem_GetLabel(шхобъ), да); }
+/
		//-----------------------------------------------------------------------------
/+
		public ткст GetLabelFromText(ткст текст)
		{
			return cast(ткст) new wxString(wxMenuItem_GetLabelFromText(шхобъ, текст), да);
		}
+/
		//-----------------------------------------------------------------------------

		public ItemKind Вид() { return cast(ItemKind)wxMenuItem_GetKind(шхобъ); }

		//-----------------------------------------------------------------------------

		public проц Checkable(бул значение) { wxMenuItem_SetCheckable(шхобъ, значение); }
		public бул Checkable() { return wxMenuItem_IsCheckable(шхобъ); }

		//-----------------------------------------------------------------------------

		public бул Подменю_ли() { return wxMenuItem_IsSubMenu(шхобъ); }

		public проц Подменю(Меню значение) { wxMenuItem_SetSubMenu(шхобъ, wxObject.SafePtr(значение)); }
		public Меню Подменю() { return cast(Меню)FindObject(wxMenuItem_GetSubMenu(шхобъ), &Меню.Нов); }

		//-----------------------------------------------------------------------------

		public проц Enabled(бул значение) { wxMenuItem_Enable(шхобъ, значение); }
		public бул Enabled() { return wxMenuItem_IsEnabled(шхобъ); }

		//-----------------------------------------------------------------------------

		public проц Checked(бул значение) { wxMenuItem_Check(шхобъ, значение); }
		public бул Checked() { return wxMenuItem_IsChecked(шхобъ); }

		//-----------------------------------------------------------------------------

		public проц Toggle()
		{
			wxMenuItem_Toggle(шхобъ);
		}

		//-----------------------------------------------------------------------------

		public проц Справка(ткст значение) { wxMenuItem_SetHelp(шхобъ, значение); }
		public ткст Справка() { return cast(ткст) new wxString(wxMenuItem_GetHelp(шхобъ), да); }

		//-----------------------------------------------------------------------------

		public AcceleratorEntry Accel() { return cast(AcceleratorEntry)FindObject(wxMenuItem_GetAccel(шхобъ), &AcceleratorEntry.Нов); }
		public проц Accel(AcceleratorEntry значение) { wxMenuItem_SetAccel(шхобъ, wxObject.SafePtr(значение)); }

		//-----------------------------------------------------------------------------
	/+	
		public проц Имя(ткст значение) { wxMenuItem_SetName(шхобъ, значение); }
		public ткст Имя() { return cast(ткст) new wxString(wxMenuItem_GetName(шхобъ), да); }
		+/
		//-----------------------------------------------------------------------------
		
		public проц битмап(Битмап значение) { wxMenuItem_SetBitmap(шхобъ, wxObject.SafePtr(значение)); }
		public Битмап битмап() { return cast(Битмап)FindObject(wxMenuItem_GetBitmap(шхобъ), &Битмап.Нов); }
		
		//---------------------------------------------------------------------
		
		public проц Click_Add(EventListener значение) { this.меню.AddEvent(ИД, значение, this); }
		public проц Click_Remove(EventListener значение) { }

        public проц Select_Add(EventListener значение) { this.меню.AddEvent(ИД, значение, this); }
        public проц Select_Remove(EventListener значение) { }
	}

