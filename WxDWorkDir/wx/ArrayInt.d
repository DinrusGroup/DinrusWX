/// The wxArrayInt wrapper class
module wx.ArrayInt;
public import wx.common;

		//! \cond EXTERN
		static extern (C) ЦУк wxArrayInt_ctor();
		static extern (C) проц   wxArrayInt_dtor(ЦУк сам);
		static extern (C) проц   wxArrayInt_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxArrayInt_Add(ЦУк сам, цел добавка);
		static extern (C) цел    wxArrayInt_Item(ЦУк сам, цел num);
		static extern (C) цел    wxArrayInt_GetCount(ЦУк сам);
		//! \endcond
		
	alias МассивЦел wxArrayInt;
	public class МассивЦел : wxObject
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
			this(wxArrayInt_ctor(), да);
			wxArrayInt_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------

		public цел[] вМассив()
		{
			цел счёт = this.Счёт;
			цел[] tmpi = new цел[счёт];
			for (цел i = 0; i < счёт; i++)
				tmpi[i] = this.Элемент(i);
			return tmpi;
		}

		public проц Добавь(цел добавка)
		{
			wxArrayInt_Add(шхобъ, добавка);
		}

		public цел Элемент(цел num)
		{
			return wxArrayInt_Item(шхобъ, num);
		}

		public цел Счёт() { return wxArrayInt_GetCount(шхобъ); }
                
		//---------------------------------------------------------------------

		override protected проц dtor() { wxArrayInt_dtor(шхобъ); }
	}
	
