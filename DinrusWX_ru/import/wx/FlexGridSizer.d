module wx.FlexGridSizer;
public import wx.common;
public import wx.GridSizer;

public enum FlexSizerGrowMode{
  NONE = 0,
  SPECIFIED,
  ALL
}

		//! \cond EXTERN
		static extern (C) IntPtr wxFlexGridSizer_ctor(цел rows, цел cols, цел vgap, цел hgap);
		static extern (C) проц wxFlexGridSizer_dtor(IntPtr сам);
		static extern (C) проц wxFlexGridSizer_RecalcSizes(IntPtr сам);
		static extern (C) проц wxFlexGridSizer_CalcMin(IntPtr сам, inout Размер разм);
		static extern (C) проц wxFlexGridSizer_AddGrowableRow(IntPtr сам, бцел idx);
		static extern (C) проц wxFlexGridSizer_RemoveGrowableRow(IntPtr сам, бцел idx);
		static extern (C) проц wxFlexGridSizer_AddGrowableCol(IntPtr сам, бцел idx);
		static extern (C) проц wxFlexGridSizer_RemoveGrowableCol(IntPtr сам, бцел idx);
                static extern (C) цел wxFlexGridSizer_GetFlexibleDirection(IntPtr сам);
                static extern (C) проц wxFlexGridSizer_SetFlexibleDirection(IntPtr сам, цел направление);
static extern (C) FlexSizerGrowMode wxFlexGridSizer_GetNonFlexibleGrowMode(IntPtr сам);
static extern (C) проц wxFlexGridSizer_SetNonFlexibleGrowMode(IntPtr сам,FlexSizerGrowMode mode);
		//! \endcond

		//---------------------------------------------------------------------

	alias FlexGridSizer wxFlexGridSizer;
	public class FlexGridSizer : GridSizer
	{
		public this(IntPtr wxobj);
        public this(цел cols, цел vgap, цел hgap);
		public this(цел rows, цел cols, цел vgap, цел hgap);
		public override проц ПересчётРазмеров();
		public override Размер ВычислиМин();
		public проц AddGrowableRow(цел idx);
		public проц RemoveGrowableRow(цел idx);
		public проц AddGrowableCol(цел idx);
		public проц RemoveGrowableCol(цел idx);
		public проц УстFlexibleDirection(цел направление);
		public цел GetFlexibleDirection();
		public проц УстNonFlexibleGrowMode(FlexSizerGrowMode mode);
		public FlexSizerGrowMode  GetNonFlexibleGrowMode();
	}
