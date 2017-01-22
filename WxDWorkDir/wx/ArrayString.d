/// The wxArrayString wrapper class
module wx.ArrayString;
public import wx.common;

		//! \cond EXTERN
		static extern (C) ЦУк wxArrayString_ctor();
		static extern (C) проц   wxArrayString_dtor(ЦУк сам);
		static extern (C) проц   wxArrayString_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxArrayString_Add(ЦУк сам, ткст добавка);
		static extern (C) ЦУк wxArrayString_Item(ЦУк сам, цел num);
		static extern (C) цел    wxArrayString_GetCount(ЦУк сам);
		//! \endcond
		
	alias МасТкст wxArrayString;
	public class МасТкст : wxObject
	{
		//---------------------------------------------------------------------

		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
			
		public this(ЦУк шхобъ, бул memOwn)
		{
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
		{
			this(wxArrayString_ctor(), да);
			wxArrayString_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------

		public ткст[] вМассив()
		{
			цел счёт = this.Счёт;
			ткст[] tmps = new ткст[счёт];
			for (цел i = 0; i < счёт; i++)
				tmps[i] = this.Элемент(i);
			return tmps;
		}
	
		public ткст Элемент(цел num)
		{
			return cast(ткст) new wxString(wxArrayString_Item(шхобъ, num), да);
		}	
	
		public проц Добавь(ткст добавка)
		{
			wxArrayString_Add(шхобъ, добавка);
		}

		public цел Счёт() { return wxArrayString_GetCount(шхобъ); }
        
		//---------------------------------------------------------------------

		override protected проц dtor() { wxArrayString_dtor(шхобъ); }
	}
	
