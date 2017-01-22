//-----------------------------------------------------------------------------
// wxD - GDIObject.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - GDIObject.cs
//
/// The wxGDIObject wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GDIObject.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.GDIObject;
public import wx.common;

		//! \cond EXTERN
		static extern (C) проц wxGDIObj_dtor(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias GDIObject wxGDIObject;
	public class GDIObject : wxObject
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		/*public override проц Dispose()
		{
			шхобъ = ЦУк.init;
			Dispose(нет);
		}*/		

		//---------------------------------------------------------------------
	}
