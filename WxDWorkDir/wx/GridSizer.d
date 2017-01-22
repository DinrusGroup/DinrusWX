//-----------------------------------------------------------------------------
// wxD - GridSizer.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - GridSizer.cs
//
/// The wxGridSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GridSizer.d,v 1.10 2007/08/20 08:39:16 afb Exp $
//-----------------------------------------------------------------------------

module wx.GridSizer;
public import wx.common;
public import wx.Sizer;

		//! \cond EXTERN
		static extern (C) ЦУк wxGridSizer_ctor(цел rows, цел cols, цел vgap, цел hgap);
		static extern (C) проц wxGridSizer_RecalcSizes(ЦУк сам);
		static extern (C) проц wxGridSizer_CalcMin(ЦУк сам, inout Размер size);
		static extern (C) проц wxGridSizer_SetCols(ЦУк сам, цел cols);
		static extern (C) проц wxGridSizer_SetRows(ЦУк сам, цел rows);
		static extern (C) проц wxGridSizer_SetVGap(ЦУк сам, цел gap);
		static extern (C) проц wxGridSizer_SetHGap(ЦУк сам, цел gap);
		static extern (C) цел wxGridSizer_GetCols(ЦУк сам);
		static extern (C) цел wxGridSizer_GetRows(ЦУк сам);
		static extern (C) цел wxGridSizer_GetVGap(ЦУк сам);
		static extern (C) цел wxGridSizer_GetHGap(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias GridSizer wxGridSizer;
	public class GridSizer : Sizer
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}

		public this(цел rows, цел cols, цел vgap, цел hgap)
		{
			super(wxGridSizer_ctor(rows, cols, vgap, hgap));
		}

		public this(цел cols, цел vgap = 0, цел hgap = 0)
		{
			this(cols == 0 ? 1 : 0, cols, vgap, hgap);
		}

		//---------------------------------------------------------------------

		public override проц RecalcSizes()
		{
			wxGridSizer_RecalcSizes(шхобъ);
		}

		//---------------------------------------------------------------------

		public override Размер CalcMin()
		{
			Размер size;
			wxGridSizer_CalcMin(шхобъ, size);
			return size;
		}

		//---------------------------------------------------------------------

		public проц Cols(цел значение) 
			{
				wxGridSizer_SetCols(шхобъ, значение);
			}
		public цел Cols() 
			{
				return wxGridSizer_GetCols(шхобъ);
			}

		public проц Rows(цел значение) 
			{
				wxGridSizer_SetRows(шхобъ, значение);
			}
		public цел Rows() 
			{
				return wxGridSizer_GetRows(шхобъ);
			}

		//---------------------------------------------------------------------

		public проц VGap(цел значение) 
			{
				wxGridSizer_SetVGap(шхобъ, значение);
			}
		public цел VGap() 
			{
				return wxGridSizer_GetVGap(шхобъ);
			}

		public проц HGap(цел значение) 
			{
				wxGridSizer_SetHGap(шхобъ, значение);
			}
		public цел HGap() 
			{
				return wxGridSizer_GetHGap(шхобъ);
			}

		//---------------------------------------------------------------------
	}
