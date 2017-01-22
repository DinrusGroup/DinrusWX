//-----------------------------------------------------------------------------
// wxD - GridCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - GridCtrl.cs
//
/// The wxGrid controls wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GridCtrl.d,v 1.10 2007/01/08 23:19:14 afb Exp $
//-----------------------------------------------------------------------------

module wx.GridCtrl;
public import wx.common;
public import wx.Grid;
/+
		//! \cond EXTERN
		static extern (C) ЦУк wxGridCellDateTimeRenderer_ctor(ткст outformat, ткст informat);
		static extern (C) проц wxGridCellDateTimeRenderer_dtor(ЦУк сам);
		static extern (C) проц wxGridCellDateTimeRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellDateTimeRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
		static extern (C) ЦУк wxGridCellDateTimeRenderer_Clone(ЦУк сам);
		static extern (C) проц wxGridCellDateTimeRenderer_SetParameters(ЦУк сам, ткст parameter);
		//! \endcond
		
	alias GridCellDateTimeRenderer wxGridCellDateTimeRenderer;
	public class GridCellDateTimeRenderer : GridCellStringRenderer
	{
		public this()
			{ this("%c", "%c");}
			
		public this(ткст outformat)
			{ this(outformat, "%c");}
			
		public this(ткст outformat, ткст informat)
			{ this(wxGridCellDateTimeRenderer_ctor(outformat, informat), да);}
				
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxGridCellDateTimeRenderer_dtor(шхобъ); }
		
		public override проц SetParameters(ткст parameter)
		{
			wxGridCellDateTimeRenderer_SetParameters(шхобъ, parameter);
		}
		
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			wxGridCellDateTimeRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
		}
		
		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
		{
			Размер size;
			wxGridCellDateTimeRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);			
			return size;
		}
		
		public override GridCellRenderer Clone()
		{
//			return cast(GridCellRenderer)FindObject(wxGridCellDateTimeRenderer_Clone(шхобъ), &GridCellRendererer.Нов);
			return new GridCellDateTimeRenderer(wxGridCellDateTimeRenderer_Clone(шхобъ));
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxGridCellEnumRenderer_ctor(цел n, ткст* choices);
		static extern (C) проц wxGridCellEnumRenderer_dtor(ЦУк сам);
		static extern (C) проц wxGridCellEnumRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellEnumRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
		static extern (C) ЦУк wxGridCellEnumRenderer_Clone(ЦУк сам);
		static extern (C) проц wxGridCellEnumRenderer_SetParameters(ЦУк сам, ткст parameter);
		//! \endcond
		
	alias GridCellEnumRenderer wxGridCellEnumRenderer;
	public class GridCellEnumRenderer : GridCellStringRenderer
	{
		public this()
			{ this(cast(ткст[])пусто);}
			
		public this(ткст[] choices)
			{ this(wxGridCellEnumRenderer_ctor(choices.length, choices.ptr), да);}
				
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
		
		private override проц dtor() { wxGridCellEnumRenderer_dtor(шхобъ); }
		
		public override проц SetParameters(ткст parameter)
		{
			wxGridCellEnumRenderer_SetParameters(шхобъ, parameter);
		}
		
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			wxGridCellEnumRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
		}
		
		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
		{
			Размер size;
			wxGridCellEnumRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);			
			return size;
		}
		
		public override GridCellRenderer Clone()
		{
//			return cast(GridCellRenderer)FindObject(wxGridCellEnumRenderer_Clone(шхобъ), &GridCellRenderer.Нов);
			return new GridCellEnumRenderer(wxGridCellEnumRenderer_Clone(шхобъ));
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxGridCellEnumEditor_ctor(цел n, ткст[] choices);
		static extern (C) проц wxGridCellEnumEditor_dtor(ЦУк сам);
		static extern (C) проц wxGridCellEnumEditor_BeginEdit(ЦУк сам, цел row, цел col, ЦУк grid);
		static extern (C) бул wxGridCellEnumEditor_EndEdit(ЦУк сам, цел row, цел col, ЦУк grid);
		static extern (C) ЦУк wxGridCellEnumEditor_Clone(ЦУк сам);
		//! \endcond
		
	alias GridCellEnumEditor wxGridCellEnumEditor;
	public class GridCellEnumEditor : GridCellChoiceEditor
	{
		public this()
			{ this(cast(ткст[])пусто);}
		
		public this(ткст[] choices)
			{ this(wxGridCellEnumEditor_ctor(choices.length, choices), да);}
		
		public this(ЦУк шхобъ)
		{	
			super(шхобъ);
		}		
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
				
		private override проц dtor() { wxGridCellEnumEditor_dtor(шхобъ); }
			
		public override проц BeginEdit(цел row, цел col, Grid grid)
		{
			wxGridCellEnumEditor_BeginEdit(шхобъ, row, col, wxObject.SafePtr(grid));
		}
		
		public override бул EndEdit(цел row, цел col, Grid grid)
		{
			return wxGridCellEnumEditor_EndEdit(шхобъ, row, col, wxObject.SafePtr(grid));
		}	

		public override GridCellEditor Clone()
		{
//			return cast(GridCellEditor)FindObject(wxGridCellEnumEditor_Clone(шхобъ), &GridCellEditor.Нов);
			return new GridCellEnumEditor(wxGridCellEnumEditor_Clone(шхобъ));
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxGridCellAutoWrapStringEditor_ctor();
		static extern (C) проц wxGridCellAutoWrapStringEditor_dtor(ЦУк сам);
		static extern (C) проц wxGridCellAutoWrapStringEditor_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц wxGridCellAutoWrapStringEditor_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк evtHandler);
		static extern (C) ЦУк wxGridCellAutoWrapStringEditor_Clone(ЦУк сам);
		//! \endcond
		
	alias GridCellAutoWrapStringEditor wxGridCellAutoWrapStringEditor;
	public class GridCellAutoWrapStringEditor : GridCellTextEditor
	{
		public this()
		{
			this(wxGridCellAutoWrapStringEditor_ctor(), да);
			wxGridCellAutoWrapStringEditor_RegisterDisposable(шхобъ, &VirtualDispose);
		}

		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxGridCellAutoWrapStringEditor_dtor(шхобъ); }
			
		public override проц Create(Окно родитель, цел ид, EvtHandler evtHandler)
		{
			wxGridCellAutoWrapStringEditor_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
		}
		
		public override GridCellEditor Clone()
		{
//			return cast(GridCellEditor)FindObject(wxGridCellAutoWrapStringEditor_Clone(шхобъ), &GridCellEditor.Нов);
			return new GridCellAutoWrapStringEditor(wxGridCellAutoWrapStringEditor_Clone(шхобъ));

		}		
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxGridCellAutoWrapStringRenderer_ctor();
		static extern (C) проц wxGridCellAutoWrapStringRenderer_dtor(ЦУк сам);
		static extern (C) проц   wxGridCellAutoWrapStringRenderer_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц wxGridCellAutoWrapStringRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellAutoWrapStringRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
		static extern (C) ЦУк wxGridCellAutoWrapStringRenderer_Clone(ЦУк сам);
		//! \endcond
		
	alias GridCellAutoWrapStringRenderer wxGridCellAutoWrapStringRenderer;
	public class GridCellAutoWrapStringRenderer : GridCellStringRenderer
	{
		public this()
		{
			this(wxGridCellAutoWrapStringRenderer_ctor(), да);
			wxGridCellAutoWrapStringRenderer_RegisterDisposable(шхобъ, &VirtualDispose);
		}
				
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxGridCellAutoWrapStringRenderer_dtor(шхобъ); }
		
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			wxGridCellAutoWrapStringRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
		}
		
		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
		{
			Размер size;
			wxGridCellAutoWrapStringRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);			
			return size;
		}
		
		public override GridCellRenderer Clone()
		{
		//	return cast(GridCellRenderer)FindObject(wxGridCellAutoWrapStringRenderer_Clone(шхобъ), &GridCellRenderer.Нов);
			return new GridCellAutoWrapStringRenderer(wxGridCellAutoWrapStringRenderer_Clone(шхобъ));
		}			
	}
+/