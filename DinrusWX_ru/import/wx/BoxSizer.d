module wx.BoxSizer;
public import wx.common;
public import wx.Sizer;

		//! \cond EXTERN
		extern(C) {
		alias проц function(БоксСайзер объ) Virtual_voidvoid;
		alias проц function(БоксСайзер объ,out Размер разм) Virtual_wxSizevoid;
		}

		static extern (C) проц wxBoxSizer_RegisterVirtual(IntPtr сам, БоксСайзер объ, Virtual_voidvoid recalcSizes, Virtual_wxSizevoid calcMin);
		static extern (C) проц wxBoxSizer_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);

		static extern (C) IntPtr wxBoxSizer_ctor(цел ориент);
		static extern (C) проц wxBoxSizer_RecalcSizes(IntPtr сам);
		static extern (C) проц wxBoxSizer_CalcMin(IntPtr сам,out Размер разм);
		static extern (C) цел wxBoxSizer_GetOrientation(IntPtr сам);
		static extern (C) проц wxBoxSizer_SetOrientation(IntPtr сам, цел ориент);
		//! \endcond

		//---------------------------------------------------------------------

	alias БоксСайзер wxBoxSizer;
	public class БоксСайзер : Сайзер
	{
		public this(IntPtr wxobj);
		public this(цел ориент);
		extern(C) private static проц staticRecalcSizes(БоксСайзер объ);
		extern(C) private static проц staticCalcMin(БоксСайзер объ,out Размер разм);
		public override проц ПересчётРазмеров();
		public override Размер ВычислиМин();
		public цел Ориентация() ;
		public проц Ориентация(цел значение);
	}
