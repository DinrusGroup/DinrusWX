//-----------------------------------------------------------------------------
// wxD - BoxSizer.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - BoxSizer.cs
//
/// The wxBoxSizer wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: BoxSizer.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.BoxSizer;
public import wx.common;
public import wx.Sizer;

		//! \cond EXTERN
		extern(C) {
		alias проц function(BoxSizer объ) Virtual_voidvoid;
		alias проц function(BoxSizer объ,out Размер size) Virtual_wxSizevoid;
		}
		
		static extern (C) проц wxBoxSizer_RegisterVirtual(ЦУк сам, BoxSizer объ, Virtual_voidvoid recalcSizes, Virtual_wxSizevoid calcMin);	
		static extern (C) проц wxBoxSizer_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
	
		static extern (C) ЦУк wxBoxSizer_ctor(цел orient);
		static extern (C) проц wxBoxSizer_RecalcSizes(ЦУк сам);
		static extern (C) проц wxBoxSizer_CalcMin(ЦУк сам,out Размер size);
		static extern (C) цел wxBoxSizer_GetOrientation(ЦУк сам);
		static extern (C) проц wxBoxSizer_SetOrientation(ЦУк сам, цел orient);
		//! \endcond

		//---------------------------------------------------------------------

	alias BoxSizer wxBoxSizer;
	public class BoxSizer : Sizer
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this(цел orient)
		{ 
			this(wxBoxSizer_ctor(cast(цел)orient));
			wxBoxSizer_RegisterVirtual(шхобъ, this, &staticRecalcSizes, &staticCalcMin);
			wxBoxSizer_RegisterDisposable(шхобъ, &VirtualDispose);
		}
			
		//---------------------------------------------------------------------
		extern(C) private static проц staticRecalcSizes(BoxSizer объ) { return объ.RecalcSizes(); }
		extern(C) private static проц staticCalcMin(BoxSizer объ,out Размер size) { size = объ.CalcMin(); }

		public override проц RecalcSizes()
		{
			wxBoxSizer_RecalcSizes(шхобъ);
		}
		
		//---------------------------------------------------------------------
		public override Размер CalcMin()
		{
			Размер size;
			wxBoxSizer_CalcMin(шхобъ,size);
			return size;
		}
		
		//---------------------------------------------------------------------
		
		public цел Ориентация() { return wxBoxSizer_GetOrientation(шхобъ); }
		public проц Ориентация(цел значение) { wxBoxSizer_SetOrientation(шхобъ, значение); }
	}
