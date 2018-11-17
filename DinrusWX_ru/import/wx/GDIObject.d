
module wx.GDIObject;
public import wx.common;

		//! \cond EXTERN
		static extern (C) проц wxGDIObj_dtor(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias GDIObject wxGDIObject;
	public class GDIObject : wxObject
	{
		public this(IntPtr wxobj) ;
		//public override проц Dispose();
	}
