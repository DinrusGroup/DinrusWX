module wx.StaticBoxSizer;
public import wx.common;
public import wx.BoxSizer;
public import wx.StaticBox;

		//! \cond EXTERN
		static extern (C) IntPtr wxStaticBoxSizer_ctor(IntPtr box, цел ориент);
		static extern (C) IntPtr wxStaticBoxSizer_GetStaticBox(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias StaticBoxSizer wxStaticBoxSizer;
	public class StaticBoxSizer : БоксСайзер
	{
		public this(IntPtr wxobj);
		public this(StaticBox box, цел ориент);
		public this(цел ориент, Окно родитель, ткст ярлык);
		public StaticBox staticBox() ;
	}
