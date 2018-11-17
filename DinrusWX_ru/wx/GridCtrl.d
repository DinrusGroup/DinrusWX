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

		//! \cond EXTERN
		static extern (C) ЦелУкз wxGridCellDateTimeRenderer_ctor(ткст outformat, ткст informat);
		static extern (C) проц wxGridCellDateTimeRenderer_dtor(ЦелУкз сам);
		static extern (C) проц wxGridCellDateTimeRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellDateTimeRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
		static extern (C) ЦелУкз wxGridCellDateTimeRenderer_Clone(ЦелУкз сам);
		static extern (C) проц wxGridCellDateTimeRenderer_SetParameters(ЦелУкз сам, ткст parameter);
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

		public this(ЦелУкз wxobj)
		{
			super(wxobj);
		}

		private this(ЦелУкз wxobj, бул memOwn)
		{
			super(wxobj);
			this.memOwn = memOwn;
		}

		//---------------------------------------------------------------------

		override protected проц dtor() { wxGridCellDateTimeRenderer_dtor(wxobj); }

		public override проц УстParameters(ткст parameter)
		{
			wxGridCellDateTimeRenderer_SetParameters(wxobj, parameter);
		}

		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			wxGridCellDateTimeRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
		}

		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
		{
			Размер Размер;
			wxGridCellDateTimeRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
			return Размер;
		}

		public override GridCellRenderer Clone()
		{
//			return cast(GridCellRenderer)НайдиОбъект(wxGridCellDateTimeRenderer_Clone(wxobj), &GridCellRendererer.Нов);
			return new GridCellDateTimeRenderer(wxGridCellDateTimeRenderer_Clone(wxobj));
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦелУкз wxGridCellEnumRenderer_ctor(цел n, ткст* choices);
		static extern (C) проц wxGridCellEnumRenderer_dtor(ЦелУкз сам);
		static extern (C) проц wxGridCellEnumRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellEnumRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
		static extern (C) ЦелУкз wxGridCellEnumRenderer_Clone(ЦелУкз сам);
		static extern (C) проц wxGridCellEnumRenderer_SetParameters(ЦелУкз сам, ткст parameter);
		//! \endcond

	alias GridCellEnumRenderer wxGridCellEnumRenderer;
	public class GridCellEnumRenderer : GridCellStringRenderer
	{
		public this()
			{ this(cast(ткст[])null);}

		public this(ткст[] choices)
			{ this(wxGridCellEnumRenderer_ctor(choices.length, choices.ptr), да);}

		public this(ЦелУкз wxobj)
		{
			super(wxobj);
		}

		private this(ЦелУкз wxobj, бул memOwn)
		{
			super(wxobj);
			this.memOwn = memOwn;
		}

		//---------------------------------------------------------------------

		private override проц dtor() { wxGridCellEnumRenderer_dtor(wxobj); }

		public override проц УстParameters(ткст parameter)
		{
			wxGridCellEnumRenderer_SetParameters(wxobj, parameter);
		}

		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			wxGridCellEnumRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
		}

		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
		{
			Размер Размер;
			wxGridCellEnumRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
			return Размер;
		}

		public override GridCellRenderer Clone()
		{
//			return cast(GridCellRenderer)НайдиОбъект(wxGridCellEnumRenderer_Clone(wxobj), &GridCellRenderer.Нов);
			return new GridCellEnumRenderer(wxGridCellEnumRenderer_Clone(wxobj));
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦелУкз wxGridCellEnumEditor_ctor(цел n, ткст[] choices);
		static extern (C) проц wxGridCellEnumEditor_dtor(ЦелУкз сам);
		static extern (C) проц wxGridCellEnumEditor_BeginEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
		static extern (C) бул wxGridCellEnumEditor_EndEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
		static extern (C) ЦелУкз wxGridCellEnumEditor_Clone(ЦелУкз сам);
		//! \endcond

	alias GridCellEnumEditor wxGridCellEnumEditor;
	public class GridCellEnumEditor : GridCellChoiceEditor
	{
		public this()
			{ this(cast(ткст[])null);}

		public this(ткст[] choices)
			{ this(wxGridCellEnumEditor_ctor(choices.length, choices), да);}

		public this(ЦелУкз wxobj)
		{
			super(wxobj);
		}

		private this(ЦелУкз wxobj, бул memOwn)
		{
			super(wxobj);
			this.memOwn = memOwn;
		}

		//---------------------------------------------------------------------

		private override проц dtor() { wxGridCellEnumEditor_dtor(wxobj); }

		public override проц BeginEdit(цел row, цел col, Grid grid)
		{
			wxGridCellEnumEditor_BeginEdit(wxobj, row, col, wxObject.SafePtr(grid));
		}

		public override бул EndEdit(цел row, цел col, Grid grid)
		{
			return wxGridCellEnumEditor_EndEdit(wxobj, row, col, wxObject.SafePtr(grid));
		}

		public override GridCellEditor Clone()
		{
//			return cast(GridCellEditor)НайдиОбъект(wxGridCellEnumEditor_Clone(wxobj), &GridCellEditor.Нов);
			return new GridCellEnumEditor(wxGridCellEnumEditor_Clone(wxobj));
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦелУкз wxGridCellAutoWrapStringEditor_ctor();
		static extern (C) проц wxGridCellAutoWrapStringEditor_dtor(ЦелУкз сам);
		static extern (C) проц wxGridCellAutoWrapStringEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
		static extern (C) проц wxGridCellAutoWrapStringEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз evtHandler);
		static extern (C) ЦелУкз wxGridCellAutoWrapStringEditor_Clone(ЦелУкз сам);
		//! \endcond

	alias GridCellAutoWrapStringEditor wxGridCellAutoWrapStringEditor;
	public class GridCellAutoWrapStringEditor : GridCellTextEditor
	{
		public this()
		{
			this(wxGridCellAutoWrapStringEditor_ctor(), да);
			wxGridCellAutoWrapStringEditor_RegisterDisposable(wxobj, &VirtualDispose);
		}

		public this(ЦелУкз wxobj)
		{
			super(wxobj);
		}

		private this(ЦелУкз wxobj, бул memOwn)
		{
			super(wxobj);
			this.memOwn = memOwn;
		}

		//---------------------------------------------------------------------

		override protected проц dtor() { wxGridCellAutoWrapStringEditor_dtor(wxobj); }

		public override проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler)
		{
			wxGridCellAutoWrapStringEditor_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
		}

		public override GridCellEditor Clone()
		{
//			return cast(GridCellEditor)НайдиОбъект(wxGridCellAutoWrapStringEditor_Clone(wxobj), &GridCellEditor.Нов);
			return new GridCellAutoWrapStringEditor(wxGridCellAutoWrapStringEditor_Clone(wxobj));

		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦелУкз wxGridCellAutoWrapStringRenderer_ctor();
		static extern (C) проц wxGridCellAutoWrapStringRenderer_dtor(ЦелУкз сам);
		static extern (C) проц   wxGridCellAutoWrapStringRenderer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
		static extern (C) проц wxGridCellAutoWrapStringRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
		static extern (C) проц wxGridCellAutoWrapStringRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
		static extern (C) ЦелУкз wxGridCellAutoWrapStringRenderer_Clone(ЦелУкз сам);
		//! \endcond

	alias GridCellAutoWrapStringRenderer wxGridCellAutoWrapStringRenderer;
	public class GridCellAutoWrapStringRenderer : GridCellStringRenderer
	{
		public this()
		{
			this(wxGridCellAutoWrapStringRenderer_ctor(), да);
			wxGridCellAutoWrapStringRenderer_RegisterDisposable(wxobj, &VirtualDispose);
		}

		public this(ЦелУкз wxobj)
		{
			super(wxobj);
		}

		private this(ЦелУкз wxobj, бул memOwn)
		{
			super(wxobj);
			this.memOwn = memOwn;
		}

		//---------------------------------------------------------------------

		override protected проц dtor() { wxGridCellAutoWrapStringRenderer_dtor(wxobj); }

		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			wxGridCellAutoWrapStringRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
		}

		public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
		{
			Размер Размер;
			wxGridCellAutoWrapStringRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
			return Размер;
		}

		public override GridCellRenderer Clone()
		{
		//	return cast(GridCellRenderer)НайдиОбъект(wxGridCellAutoWrapStringRenderer_Clone(wxobj), &GridCellRenderer.Нов);
			return new GridCellAutoWrapStringRenderer(wxGridCellAutoWrapStringRenderer_Clone(wxobj));
		}
	}
