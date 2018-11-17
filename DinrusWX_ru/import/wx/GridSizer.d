module wx.GridSizer;
public import wx.common;
public import wx.Sizer;

		//! \cond EXTERN
		static extern (C) IntPtr wxGridSizer_ctor(цел rows, цел cols, цел vgap, цел hgap);
		static extern (C) проц wxGridSizer_RecalcSizes(IntPtr сам);
		static extern (C) проц wxGridSizer_CalcMin(IntPtr сам, inout Размер разм);
		static extern (C) проц wxGridSizer_SetCols(IntPtr сам, цел cols);
		static extern (C) проц wxGridSizer_SetRows(IntPtr сам, цел rows);
		static extern (C) проц wxGridSizer_SetVGap(IntPtr сам, цел gap);
		static extern (C) проц wxGridSizer_SetHGap(IntPtr сам, цел gap);
		static extern (C) цел wxGridSizer_GetCols(IntPtr сам);
		static extern (C) цел wxGridSizer_GetRows(IntPtr сам);
		static extern (C) цел wxGridSizer_GetVGap(IntPtr сам);
		static extern (C) цел wxGridSizer_GetHGap(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias GridSizer wxGridSizer;
	public class GridSizer : Сайзер
	{
		public this(IntPtr wxobj);
		public this(цел rows, цел cols, цел vgap, цел hgap);
		public this(цел cols, цел vgap = 0, цел hgap = 0);
		public override проц ПересчётРазмеров();
		public override Размер ВычислиМин();
		public проц Cols(цел значение);
		public цел Cols() ;
		public проц Rows(цел значение) ;
		public цел Rows() ;
		public проц VGap(цел значение) ;
		public цел VGap() ;
		public проц HGap(цел значение) ;
		public цел HGap() ;
	}
