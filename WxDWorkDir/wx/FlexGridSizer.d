//-----------------------------------------------------------------------------
// wxD - FlexGridSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FlexGridSizer.cs
//
/// The wxFlexGridSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FlexGridSizer.d,v 1.10 2007/10/24 07:53:34 afb Exp $
//-----------------------------------------------------------------------------

module wx.FlexGridSizer;
public import wx.common;
public import wx.GridSizer;

public enum FlexSizerGrowMode{
  NONE = 0,
  SPECIFIED,
  ALL
}

		//! \cond EXTERN
		static extern (C) ЦУк wxFlexGridSizer_ctor(цел rows, цел cols, цел vgap, цел hgap);
		static extern (C) проц wxFlexGridSizer_dtor(ЦУк сам);
		static extern (C) проц wxFlexGridSizer_RecalcSizes(ЦУк сам);
		static extern (C) проц wxFlexGridSizer_CalcMin(ЦУк сам, inout Размер size);
		static extern (C) проц wxFlexGridSizer_AddGrowableRow(ЦУк сам, бцел idx);
		static extern (C) проц wxFlexGridSizer_RemoveGrowableRow(ЦУк сам, бцел idx);
		static extern (C) проц wxFlexGridSizer_AddGrowableCol(ЦУк сам, бцел idx);
		static extern (C) проц wxFlexGridSizer_RemoveGrowableCol(ЦУк сам, бцел idx);
                static extern (C) цел wxFlexGridSizer_GetFlexibleDirection(ЦУк сам);
                static extern (C) проц wxFlexGridSizer_SetFlexibleDirection(ЦУк сам, цел direction);
static extern (C) FlexSizerGrowMode wxFlexGridSizer_GetNonFlexibleGrowMode(ЦУк сам);
static extern (C) проц wxFlexGridSizer_SetNonFlexibleGrowMode(ЦУк сам,FlexSizerGrowMode mode);
		//! \endcond

		//---------------------------------------------------------------------

	alias FlexGridSizer wxFlexGridSizer;
	public class FlexGridSizer : GridSizer
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }

        public this(цел cols, цел vgap, цел hgap)
            { this(0, cols, vgap, hgap); }

		public this(цел rows, цел cols, цел vgap, цел hgap)
			{ super(wxFlexGridSizer_ctor(rows, cols, vgap, hgap)); }

		//---------------------------------------------------------------------

		public override проц RecalcSizes()
		{
			wxFlexGridSizer_RecalcSizes(шхобъ);
		}

		//---------------------------------------------------------------------

		public override Размер CalcMin()
		{
			Размер size;
			wxFlexGridSizer_CalcMin(шхобъ, size);
			return size;
		}

		//---------------------------------------------------------------------

		public проц AddGrowableRow(цел idx)
		{
			wxFlexGridSizer_AddGrowableRow(шхобъ, cast(бцел)idx);
		}

		public проц RemoveGrowableRow(цел idx)
		{
			wxFlexGridSizer_RemoveGrowableRow(шхобъ, cast(бцел)idx);
		}

		//---------------------------------------------------------------------

		public проц AddGrowableCol(цел idx)
		{
			wxFlexGridSizer_AddGrowableCol(шхобъ, cast(бцел)idx);
		}

		public проц RemoveGrowableCol(цел idx)
		{
			wxFlexGridSizer_RemoveGrowableCol(шхобъ, cast(бцел)idx);
		}

		//---------------------------------------------------------------------

		public проц SetFlexibleDirection(цел direction)
		{
		  wxFlexGridSizer_SetFlexibleDirection(шхобъ, direction);
		}

		public цел GetFlexibleDirection()
		{
		  return wxFlexGridSizer_GetFlexibleDirection(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц SetNonFlexibleGrowMode(FlexSizerGrowMode mode){
		  wxFlexGridSizer_SetNonFlexibleGrowMode(шхобъ, mode);
		}

		public FlexSizerGrowMode  GetNonFlexibleGrowMode(){
		  return wxFlexGridSizer_GetNonFlexibleGrowMode(шхобъ);
		}
	}
