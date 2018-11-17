/// The wxArrayString wrapper class
module wx.ArrayString;
public import wx.common;

		//! \cond EXTERN
		static extern (C) IntPtr wxArrayString_ctor();
		static extern (C) проц   wxArrayString_dtor(IntPtr сам);
		static extern (C) проц   wxArrayString_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxArrayString_Add(IntPtr сам, ткст доб);
		static extern (C) IntPtr wxArrayString_Item(IntPtr сам, цел чис);
		static extern (C) цел    wxArrayString_GetCount(IntPtr сам);
		//! \endcond
		
	alias ТкстМассив wxArrayString;
	public class ТкстМассив : wxObject
	{
		
		public this(IntPtr wxobj);			
		public this(IntPtr wxobj, бул memOwn);
		public this();
		public ткст[] вМассив();
		public ткст Элемент(цел чис);
		public проц Добавь(ткст доб);
		public цел Счёт();
		override protected проц dtor() ;
	}
	
