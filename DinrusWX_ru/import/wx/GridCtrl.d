module wx.GridCtrl;
public import wx.common;
public import wx.Grid;

		//! \cond EXTERN
		static extern (C) IntPtr wxGridCellDateTimeRenderer_ctor(ткст outformat, ткст informat);
		static extern (C) проц wxGridCellDateTimeRenderer_dtor(IntPtr сам);
		static extern (C) проц wxGridCellDateTimeRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellDateTimeRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
		static extern (C) IntPtr wxGridCellDateTimeRenderer_Clone(IntPtr сам);
		static extern (C) проц wxGridCellDateTimeRenderer_SetParameters(IntPtr сам, ткст parameter);
		//! \endcond
		
	alias GridCellDateTimeRenderer wxGridCellDateTimeRenderer;
	public class GridCellDateTimeRenderer : GridCellStringRenderer
	{
		public this();
		public this(ткст outformat);
		public this(ткст outformat, ткст informat);
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
		public override проц УстParameters(ткст parameter);
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
		public override GridCellRenderer Clone();
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxGridCellEnumRenderer_ctor(цел n, ткст* choices);
		static extern (C) проц wxGridCellEnumRenderer_dtor(IntPtr сам);
		static extern (C) проц wxGridCellEnumRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellEnumRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
		static extern (C) IntPtr wxGridCellEnumRenderer_Clone(IntPtr сам);
		static extern (C) проц wxGridCellEnumRenderer_SetParameters(IntPtr сам, ткст parameter);
		//! \endcond
		
	alias GridCellEnumRenderer wxGridCellEnumRenderer;
	public class GridCellEnumRenderer : GridCellStringRenderer
	{
		public this();
		public this(ткст[] choices);
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		private override проц dtor() ;
		public override проц УстParameters(ткст parameter);
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
		public override GridCellRenderer Clone();
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxGridCellEnumEditor_ctor(цел n, ткст[] choices);
		static extern (C) проц wxGridCellEnumEditor_dtor(IntPtr сам);
		static extern (C) проц wxGridCellEnumEditor_BeginEdit(IntPtr сам, цел row, цел col, IntPtr grid);
		static extern (C) бул wxGridCellEnumEditor_EndEdit(IntPtr сам, цел row, цел col, IntPtr grid);
		static extern (C) IntPtr wxGridCellEnumEditor_Clone(IntPtr сам);
		//! \endcond
		
	alias GridCellEnumEditor wxGridCellEnumEditor;
	public class GridCellEnumEditor : GridCellChoiceEditor
	{
		public this();
		public this(ткст[] choices);
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		private override проц dtor();
		public override проц BeginEdit(цел row, цел col, Grid grid);
		public override бул EndEdit(цел row, цел col, Grid grid);
		public override GridCellEditor Clone();
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxGridCellAutoWrapStringEditor_ctor();
		static extern (C) проц wxGridCellAutoWrapStringEditor_dtor(IntPtr сам);
		static extern (C) проц wxGridCellAutoWrapStringEditor_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц wxGridCellAutoWrapStringEditor_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr evtHandler);
		static extern (C) IntPtr wxGridCellAutoWrapStringEditor_Clone(IntPtr сам);
		//! \endcond
		
	alias GridCellAutoWrapStringEditor wxGridCellAutoWrapStringEditor;
	public class GridCellAutoWrapStringEditor : GridCellTextEditor
	{
		public this();
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
		public override проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
		public override GridCellEditor Clone();
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxGridCellAutoWrapStringRenderer_ctor();
		static extern (C) проц wxGridCellAutoWrapStringRenderer_dtor(IntPtr сам);
		static extern (C) проц   wxGridCellAutoWrapStringRenderer_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц wxGridCellAutoWrapStringRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellAutoWrapStringRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
		static extern (C) IntPtr wxGridCellAutoWrapStringRenderer_Clone(IntPtr сам);
		//! \endcond
		
	alias GridCellAutoWrapStringRenderer wxGridCellAutoWrapStringRenderer;
	public class GridCellAutoWrapStringRenderer : GridCellStringRenderer
	{
		public this();
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
		public override GridCellRenderer Clone();
	}
