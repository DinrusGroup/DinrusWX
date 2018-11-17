/// The wxArrayInt wrapper class
module wx.ArrayInt;
public import wx.common;

		//! \cond EXTERN
		static extern (C) IntPtr wxArrayInt_ctor();
		static extern (C) проц   wxArrayInt_dtor(IntPtr сам);
		static extern (C) проц   wxArrayInt_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxArrayInt_Add(IntPtr сам, цел доб);
		static extern (C) цел    wxArrayInt_Item(IntPtr сам, цел чис);
		static extern (C) цел    wxArrayInt_GetCount(IntPtr сам);
		//! \endcond
		
	alias ЦелМассив wxArrayInt;
	public class ЦелМассив : wxObject
	{
		public this(IntPtr wxobj);			
		public this(IntPtr wxobj, бул memOwn);
		public this();
		public цел[] вМассив();
		public проц Добавь(цел доб);
		public цел Элемент(цел чис);
		public цел Счёт() ;
		override protected проц dtor();
	}
	
