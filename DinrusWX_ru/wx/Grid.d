//-----------------------------------------------------------------------------
// wxD - Grid.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Grid.cs
//
/// The wxGrid wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Grid.d,v 1.11 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.Grid;
public import wx.common;
public import wx.Event;
public import wx.KeyEvent;
public import wx.CommandEvent;
public import wx.Window;
public import wx.Control;
public import wx.ScrolledWindow;

    public enum GridSelectionMode
    {
        wxGridSelectCells,
        wxGridSelectRows,
        wxGridSelectColumns
    }

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridEvent_ctor(цел ид, цел тип, ЦелУкз объ, цел row, цел col, цел x, цел y, бул sel, бул control, бул shift, бул alt, бул meta);
        static extern (C) цел    wxGridEvent_GetRow(ЦелУкз сам);
        static extern (C) цел    wxGridEvent_GetCol(ЦелУкз сам);
        static extern (C) проц   wxGridEvent_GetPosition(ЦелУкз сам, inout Точка тчк);
        static extern (C) бул   wxGridEvent_Selecting(ЦелУкз сам);
        static extern (C) бул   wxGridEvent_ControlDown(ЦелУкз сам);
        static extern (C) бул   wxGridEvent_MetaDown(ЦелУкз сам);
        static extern (C) бул   wxGridEvent_ShiftDown(ЦелУкз сам);
        static extern (C) бул   wxGridEvent_AltDown(ЦелУкз сам);
        static extern (C) проц wxGridEvent_Veto(ЦелУкз сам);
        static extern (C) проц wxGridEvent_Allow(ЦелУкз сам);
        static extern (C) бул wxGridEvent_IsAllowed(ЦелУкз сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GridEvent wxGridEvent;
    public class GridEvent : Событие
    {
        public this(ЦелУкз wxobj)
            { super(wxobj); }

        public this(цел ид, цел тип, wxObject объ, цел row, цел col, цел x, цел y, бул sel, бул control, бул shift, бул alt, бул meta)
            { this(wxGridEvent_ctor(ид, тип, wxObject.SafePtr(объ), row, col, x, y, sel, control, shift, alt, meta)); }

        //-----------------------------------------------------------------------------

        public цел Row() { return wxGridEvent_GetRow(wxobj); }

        public цел Col() { return wxGridEvent_GetCol(wxobj); }

        //-----------------------------------------------------------------------------

        public Точка Позиция() {
                Точка тчк;
                wxGridEvent_GetPosition(wxobj, тчк);
                return тчк;
            }

        //-----------------------------------------------------------------------------

        public бул Selecting() { return wxGridEvent_Selecting(wxobj); }

        //-----------------------------------------------------------------------------

        public бул ControlDown() { return wxGridEvent_ControlDown(wxobj); }

        public бул MetaDown() { return wxGridEvent_MetaDown(wxobj); }

        public бул ShiftDown() { return wxGridEvent_ShiftDown(wxobj); }

            public бул AltDown() { return wxGridEvent_AltDown(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Veto()
        {
            wxGridEvent_Veto(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Allow()
        {
            wxGridEvent_Allow(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул Allowed() { return wxGridEvent_IsAllowed(wxobj); }

	private static Событие Нов(ЦелУкз объ) { return new GridEvent(объ); }

	static this()
	{
			wxEVT_GRID_CELL_LEFT_CLICK = wxEvent_EVT_GRID_CELL_LEFT_CLICK();
			wxEVT_GRID_CELL_RIGHT_CLICK = wxEvent_EVT_GRID_CELL_RIGHT_CLICK();
			wxEVT_GRID_CELL_LEFT_DCLICK = wxEvent_EVT_GRID_CELL_LEFT_DCLICK();
			wxEVT_GRID_CELL_RIGHT_DCLICK = wxEvent_EVT_GRID_CELL_RIGHT_DCLICK();
			wxEVT_GRID_LABEL_LEFT_CLICK = wxEvent_EVT_GRID_LABEL_LEFT_CLICK();
			wxEVT_GRID_LABEL_RIGHT_CLICK = wxEvent_EVT_GRID_LABEL_RIGHT_CLICK();
			wxEVT_GRID_LABEL_LEFT_DCLICK = wxEvent_EVT_GRID_LABEL_LEFT_DCLICK();
			wxEVT_GRID_LABEL_RIGHT_DCLICK = wxEvent_EVT_GRID_LABEL_RIGHT_DCLICK();
			wxEVT_GRID_CELL_CHANGE = wxEvent_EVT_GRID_CELL_CHANGE();
			wxEVT_GRID_SELECT_CELL = wxEvent_EVT_GRID_SELECT_CELL();
			wxEVT_GRID_EDITOR_SHOWN = wxEvent_EVT_GRID_EDITOR_SHOWN();
			wxEVT_GRID_EDITOR_HIDDEN = wxEvent_EVT_GRID_EDITOR_HIDDEN();
			wxEVT_GRID_EDITOR_CREATED = wxEvent_EVT_GRID_EDITOR_CREATED();

			ДобавьТипСоб(wxEVT_GRID_CELL_LEFT_CLICK,            &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_CELL_RIGHT_CLICK,           &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_CELL_LEFT_DCLICK,           &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_CELL_RIGHT_DCLICK,          &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_LABEL_LEFT_CLICK,           &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_LABEL_RIGHT_CLICK,          &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_LABEL_LEFT_DCLICK,          &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_LABEL_RIGHT_DCLICK,         &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_CELL_CHANGE,                &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_SELECT_CELL,                &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_EDITOR_SHOWN,               &GridEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_EDITOR_HIDDEN,              &GridEvent.Нов);
	}
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
	extern (C) {
        alias проц   function(GridCellEditor объ, ЦелУкз родитель, цел ид, ЦелУкз evtHandler) Virtual_Create;
        alias проц   function(GridCellEditor объ, цел row, цел col, ЦелУкз grid) Virtual_BeginEdit;
        alias бул   function(GridCellEditor объ, цел row, цел col, ЦелУкз grid) Virtual_EndEdit;
        alias проц   function(GridCellEditor объ) Virtual_Reset;
        alias ЦелУкз function(GridCellEditor объ) Virtual_Clone;
        alias проц   function(GridCellEditor объ, Прямоугольник прям) Virtual_SetSize;
        alias проц   function(GridCellEditor объ, бул покажи, ЦелУкз attr) Virtual_Show;
        alias проц   function(GridCellEditor объ, Прямоугольник прям, ЦелУкз attr) Virtual_PaintBackground;
        alias бул   function(GridCellEditor объ, ЦелУкз evt) Virtual_IsAcceptedKey;
        alias проц   function(GridCellEditor объ, ЦелУкз evt) Virtual_StartingKey;
        alias проц   function(GridCellEditor объ) Virtual_StartingClick;
        alias проц   function(GridCellEditor объ, ЦелУкз evt) Virtual_HandleReturn;
        alias проц   function(GridCellEditor объ) Virtual_Destroy;
        alias ткст function(GridCellEditor объ) Virtual_GetValue;
	}

        static extern (C) ЦелУкз wxGridCellEditor_ctor();
	static extern (C) проц wxGridCellEditor_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellEditor_RegisterVirtual(ЦелУкз сам, GridCellEditor объ,
            Virtual_Create create,
            Virtual_BeginEdit beginEdit,
            Virtual_EndEdit endEdit,
            Virtual_Reset reset,
            Virtual_Clone clone,
            Virtual_SetSize setSize,
            Virtual_Show покажи,
            Virtual_PaintBackground paintBackground,
            Virtual_IsAcceptedKey isAcceptedKey,
            Virtual_StartingKey startingKey,
            Virtual_StartingClick startingClick,
            Virtual_HandleReturn handleReturn,
            Virtual_Destroy destroy,
            Virtual_GetValue getvalue);
        static extern (C) бул   wxGridCellEditor_IsCreated(ЦелУкз сам);
        static extern (C) проц   wxGridCellEditor_SetSize(ЦелУкз сам, inout Прямоугольник прям);
        static extern (C) проц   wxGridCellEditor_Show(ЦелУкз сам, бул покажи, ЦелУкз attr);
        static extern (C) проц   wxGridCellEditor_PaintBackground(ЦелУкз сам, inout Прямоугольник rectCell, ЦелУкз attr);
        static extern (C) бул   wxGridCellEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц   wxGridCellEditor_StartingKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц   wxGridCellEditor_StartingClick(ЦелУкз сам);
        static extern (C) проц   wxGridCellEditor_HandleReturn(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц   wxGridCellEditor_Destroy(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellEditor_GetValue(ЦелУкз сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    public abstract class GridCellEditor : GridCellWorker
    {
        public this(ЦелУкз wxobj)
	{
		super(wxobj);
	}

	private this(ЦелУкз wxobj, бул memOwn)
	{
		super(wxobj);
		this.memOwn = memOwn;
	}

        public this()
        {
        	this(wxGridCellEditor_ctor(), да);
            wxGridCellEditor_RegisterVirtual(wxobj, this,
                    &staticDoCreate,
                    &staticDoBeginEdit,
                    &staticDoEndEdit,
                    &staticReset,
                    &staticDoClone,
                    &staticУстSize,
                    &staticDoShow,
                    &staticDoPaintBackground,
                    &staticDoIsAcceptedKey,
                    &staticDoStartingKey,
                    &staticStartingClick,
                    &staticDoHandleReturn,
                    &staticDestroy,
                    &staticGetValue);
        }

//	public static wxObject Нов(ЦелУкз ptr) { return new GridCellEditor(ptr); }
	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellEditor_dtor(wxobj); }

        //-----------------------------------------------------------------------------

        public бул IsCreated() { return wxGridCellEditor_IsCreated(wxobj); }

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticDoCreate(GridCellEditor объ, ЦелУкз родитель, цел ид, ЦелУкз evtHandler)
        {
            объ.создай(cast(Окно)wxObject.НайдиОбъект(родитель), ид, cast(ОбработчикСоб)НайдиОбъект(evtHandler, &ОбработчикСоб.Нов));
        }

        public abstract проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticУстSize(GridCellEditor объ, Прямоугольник прям)
        {
        	объ.устРазм(прям);
        }

        public  проц устРазм(Прямоугольник прям)
        {
            wxGridCellEditor_SetSize(wxobj, прям);
        }

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticDoShow(GridCellEditor объ, бул покажи, ЦелУкз attr)
        {
            объ.Покажи(покажи, cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов));
        }

        public  проц Покажи(бул покажи, GridCellAttr attr)
        {
            wxGridCellEditor_Show(wxobj, покажи, wxObject.SafePtr(attr));
        }

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticDoPaintBackground(GridCellEditor объ, Прямоугольник rectCell, ЦелУкз attr)
        {
            объ.PaintBackground(rectCell, cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов));
        }

        public  проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr)
        {
            wxGridCellEditor_PaintBackground(wxobj, rectCell, wxObject.SafePtr(attr));
        }

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticDoBeginEdit(GridCellEditor объ, цел row, цел col, ЦелУкз grid)
        {
            объ.BeginEdit(row, col, cast(Grid)НайдиОбъект(grid, &Grid.Нов));
        }

        public abstract проц BeginEdit(цел row, цел col, Grid grid);

        static extern(C) private бул staticDoEndEdit(GridCellEditor объ, цел row, цел col, ЦелУкз grid)
        {
            return объ.EndEdit(row, col, cast(Grid)НайдиОбъект(grid, &Grid.Нов));
        }

        public abstract бул EndEdit(цел row, цел col, Grid grid);

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticReset(GridCellEditor объ)
        {
            return объ.Reset();
        }

        public abstract проц Reset();

        //-----------------------------------------------------------------------------

        static extern(C) private бул staticDoIsAcceptedKey(GridCellEditor объ, ЦелУкз evt)
        {
            return объ.IsAcceptedKey(cast(KeyEvent)wxObject.НайдиОбъект(evt, cast(wxObject function(ЦелУкз))&KeyEvent.Нов));
        }

        public  бул IsAcceptedKey(KeyEvent evt)
        {
            return wxGridCellEditor_IsAcceptedKey(wxobj, wxObject.SafePtr(evt));
        }

        static extern(C) private проц staticDoStartingKey(GridCellEditor объ, ЦелУкз evt)
        {
            объ.StartingKey(cast(KeyEvent)wxObject.НайдиОбъект(evt, cast(wxObject function(ЦелУкз))&KeyEvent.Нов));
        }

        public  проц StartingKey(KeyEvent evt)
        {
            wxGridCellEditor_StartingKey(wxobj, wxObject.SafePtr(evt));
        }

	static extern(C) private проц staticStartingClick(GridCellEditor объ)
	{
	    объ.StartingClick();
	}
        public  проц StartingClick()
        {
            wxGridCellEditor_StartingClick(wxobj);
        }

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticDoHandleReturn(GridCellEditor объ, ЦелУкз evt)
        {
            объ.HandleReturn(cast(KeyEvent)wxObject.НайдиОбъект(evt, cast(wxObject function(ЦелУкз))&KeyEvent.Нов));
        }

        public  проц HandleReturn(KeyEvent evt)
        {
            wxGridCellEditor_HandleReturn(wxobj, wxObject.SafePtr(evt));
        }

        //-----------------------------------------------------------------------------

	static extern(C) private проц staticDestroy(GridCellEditor объ)
	{
		объ.Разрушь();
	}

        public  проц Разрушь()
        {
            wxGridCellEditor_Destroy(wxobj);
        }

        //-----------------------------------------------------------------------------

        static extern(C) private ЦелУкз staticDoClone(GridCellEditor объ)
        {
            return wxObject.SafePtr(объ.Clone());
        }

        public abstract GridCellEditor Clone();

        //-----------------------------------------------------------------------------

        static extern(C) private ткст staticGetValue(GridCellEditor объ)
        {
            return объ.GetValue();
        }
        public abstract ткст GetValue();
//        {
//            return cast(ткст) new wxString(wxGridCellEditor_GetValue(wxobj), да);
//        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellTextEditor_ctor();
	static extern (C) проц wxGridCellTextEditor_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellTextEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз evtHandler);
        static extern (C) проц wxGridCellTextEditor_SetSize(ЦелУкз сам, inout Прямоугольник прям);
        static extern (C) проц wxGridCellTextEditor_PaintBackground(ЦелУкз сам, inout Прямоугольник rectCell, ЦелУкз attr);
        static extern (C) бул wxGridCellTextEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellTextEditor_BeginEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) бул wxGridCellTextEditor_EndEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) проц wxGridCellTextEditor_Reset(ЦелУкз сам);
        static extern (C) проц wxGridCellTextEditor_StartingKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellTextEditor_SetParameters(ЦелУкз сам, ткст parameter);
        static extern (C) ЦелУкз wxGridCellTextEditor_Clone(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellTextEditor_GetValue(ЦелУкз сам);
		//! \endcond

    alias GridCellTextEditor wxGridCellTextEditor;
    public class GridCellTextEditor : GridCellEditor
    {
        public this()
            { this(wxGridCellTextEditor_ctor(), да); }

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

	override protected проц dtor() { wxGridCellTextEditor_dtor(wxobj); }

        public override проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler)
        {
            wxGridCellTextEditor_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override проц устРазм(Прямоугольник прям)
        {
            wxGridCellTextEditor_SetSize(wxobj, прям);
        }

        public override проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr)
        {
            wxGridCellTextEditor_PaintBackground(wxobj, rectCell, wxObject.SafePtr(attr));
        }

        public override бул IsAcceptedKey(KeyEvent evt)
        {
            return wxGridCellTextEditor_IsAcceptedKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellTextEditor_BeginEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellTextEditor_EndEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellTextEditor_Reset(wxobj);
        }

        public override проц StartingKey(KeyEvent evt)
        {
            wxGridCellTextEditor_StartingKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц УстParameters(ткст parameter)
        {
            wxGridCellTextEditor_SetParameters(wxobj, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)НайдиОбъект(wxGridCellTextEditor_Clone(wxobj), &GridCellEditor.Нов);
              return new GridCellTextEditor(wxGridCellTextEditor_Clone(wxobj));
        }
        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellTextEditor_GetValue(wxobj), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellNumberEditor_ctor(цел min, цел max);
	static extern (C) проц wxGridCellNumberEditor_dtor(ЦелУкз сам);
	static extern (C) проц wxGridCellNumberEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellNumberEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз evtHandler);
        static extern (C) бул wxGridCellNumberEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellNumberEditor_BeginEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) бул wxGridCellNumberEditor_EndEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) проц wxGridCellNumberEditor_Reset(ЦелУкз сам);
        static extern (C) проц wxGridCellNumberEditor_StartingKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellNumberEditor_SetParameters(ЦелУкз сам, ткст parameter);
        static extern (C) ЦелУкз wxGridCellNumberEditor_Clone(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellNumberEditor_GetValue(ЦелУкз сам);
		//! \endcond

    alias GridCellNumberEditor wxGridCellNumberEditor;
    public class GridCellNumberEditor : GridCellTextEditor
    {
        public this()
            { this(-1, -1); }

        public this(цел min)
            { this(min, -1); }

        public this(цел min, цел max)
	{
		this(wxGridCellNumberEditor_ctor(min, max), да);
		wxGridCellNumberEditor_RegisterDisposable(wxobj, &VirtualDispose);
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

	override protected проц dtor() { wxGridCellNumberEditor_dtor(wxobj); }

        public override проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler)
        {
            wxGridCellNumberEditor_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override бул IsAcceptedKey(KeyEvent evt)
        {
            return wxGridCellNumberEditor_IsAcceptedKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellNumberEditor_BeginEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellNumberEditor_EndEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellNumberEditor_Reset(wxobj);
        }

        public override проц StartingKey(KeyEvent evt)
        {
            wxGridCellNumberEditor_StartingKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц УстParameters(ткст parameter)
        {
            wxGridCellNumberEditor_SetParameters(wxobj, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)НайдиОбъект(wxGridCellNumberEditor_Clone(wxobj), &GridCellEditor.Нов);
              return new GridCellNumberEditor(wxGridCellNumberEditor_Clone(wxobj));
        }

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellNumberEditor_GetValue(wxobj), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellFloatEditor_ctor(цел ширь, цел precision);
	static extern (C) проц wxGridCellFloatEditor_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellFloatEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз evtHandler);
        static extern (C) бул wxGridCellFloatEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellFloatEditor_BeginEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) бул wxGridCellFloatEditor_EndEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) проц wxGridCellFloatEditor_Reset(ЦелУкз сам);
        static extern (C) проц wxGridCellFloatEditor_StartingKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellFloatEditor_SetParameters(ЦелУкз сам, ткст parameter);
        static extern (C) ЦелУкз wxGridCellFloatEditor_Clone(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellFloatEditor_GetValue(ЦелУкз сам);
		//! \endcond

    alias GridCellFloatEditor wxGridCellFloatEditor;
    public class GridCellFloatEditor : GridCellTextEditor
    {
        public this()
            { this(-1, -1); }

        public this(цел ширь)
            { this(ширь, -1); }

        public this(цел ширь, цел precision)
            { this(wxGridCellFloatEditor_ctor(ширь, precision), да); }

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

	override protected проц dtor() { wxGridCellFloatEditor_dtor(wxobj); }

        public override проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler)
        {
            wxGridCellFloatEditor_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override бул IsAcceptedKey(KeyEvent evt)
        {
            return wxGridCellFloatEditor_IsAcceptedKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellFloatEditor_BeginEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellFloatEditor_EndEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellFloatEditor_Reset(wxobj);
        }

        public override проц StartingKey(KeyEvent evt)
        {
            wxGridCellFloatEditor_StartingKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц УстParameters(ткст parameter)
        {
            wxGridCellFloatEditor_SetParameters(wxobj, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)НайдиОбъект(wxGridCellFloatEditor_Clone(wxobj), &GridCellEditor.Нов);
              return new GridCellFloatEditor(wxGridCellFloatEditor_Clone(wxobj));
        }

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellFloatEditor_GetValue(wxobj), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellBoolEditor_ctor();
	static extern (C) проц wxGridCellBoolEditor_dtor(ЦелУкз сам);
	static extern (C) проц wxGridCellBoolEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellBoolEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз evtHandler);
        static extern (C) проц wxGridCellBoolEditor_SetSize(ЦелУкз сам, inout Прямоугольник прям);
        static extern (C) бул wxGridCellBoolEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз evt);
        static extern (C) проц wxGridCellBoolEditor_BeginEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) бул wxGridCellBoolEditor_EndEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) проц wxGridCellBoolEditor_Reset(ЦелУкз сам);
        static extern (C) проц wxGridCellBoolEditor_StartingClick(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellBoolEditor_Clone(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellBoolEditor_GetValue(ЦелУкз сам);
		//! \endcond

    alias GridCellBoolEditor wxGridCellBoolEditor;
    public class GridCellBoolEditor : GridCellEditor
    {
        public this()
	{
		this(wxGridCellBoolEditor_ctor(), да);
		wxGridCellBoolEditor_RegisterDisposable(wxobj, &VirtualDispose);
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

	override protected проц dtor() { wxGridCellBoolEditor_dtor(wxobj); }

        public override проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler)
        {
            wxGridCellBoolEditor_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override проц устРазм(Прямоугольник прям)
        {
            wxGridCellBoolEditor_SetSize(wxobj, прям);
        }

        public override бул IsAcceptedKey(KeyEvent evt)
        {
            return wxGridCellBoolEditor_IsAcceptedKey(wxobj, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellBoolEditor_BeginEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellBoolEditor_EndEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellBoolEditor_Reset(wxobj);
        }

        public override проц StartingClick()
        {
            wxGridCellBoolEditor_StartingClick(wxobj);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)НайдиОбъект(wxGridCellBoolEditor_Clone(wxobj), &GridCellEditor.Нов);
              return new GridCellBoolEditor(wxGridCellBoolEditor_Clone(wxobj));
        }

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellBoolEditor_GetValue(wxobj), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellChoiceEditor_ctor(цел n, ткст* choices, бул allowOthers);
	static extern (C) проц wxGridCellChoiceEditor_dtor(ЦелУкз сам);
	static extern (C) проц wxGridCellChoiceEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellChoiceEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз evtHandler);
        static extern (C) проц wxGridCellChoiceEditor_PaintBackground(ЦелУкз сам, inout Прямоугольник rectCell, ЦелУкз attr);
        static extern (C) проц wxGridCellChoiceEditor_BeginEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) бул wxGridCellChoiceEditor_EndEdit(ЦелУкз сам, цел row, цел col, ЦелУкз grid);
        static extern (C) проц wxGridCellChoiceEditor_Reset(ЦелУкз сам);
        static extern (C) проц wxGridCellChoiceEditor_SetParameters(ЦелУкз сам, ткст parameter);
        static extern (C) ЦелУкз wxGridCellChoiceEditor_Clone(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellChoiceEditor_GetValue(ЦелУкз сам);
		//! \endcond

    alias GridCellChoiceEditor wxGridCellChoiceEditor;
    public class GridCellChoiceEditor : GridCellEditor
    {
        public this()
            { this(cast(ткст[])null, false); }

        public this(ткст[] choices)
            { this(choices, false); }

        public this(ткст[] choices, бул allowOthers)
	{
		this(wxGridCellChoiceEditor_ctor(choices.length, choices.ptr, allowOthers), да);
		wxGridCellChoiceEditor_RegisterDisposable(wxobj, &VirtualDispose);
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

	override protected проц dtor() { wxGridCellChoiceEditor_dtor(wxobj); }

        public override проц создай(Окно родитель, цел ид, ОбработчикСоб evtHandler)
        {
            wxGridCellChoiceEditor_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr)
        {
            wxGridCellChoiceEditor_PaintBackground(wxobj, rectCell, wxObject.SafePtr(attr));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellChoiceEditor_BeginEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellChoiceEditor_EndEdit(wxobj, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellChoiceEditor_Reset(wxobj);
        }

        public override проц УстParameters(ткст parameter)
        {
            wxGridCellChoiceEditor_SetParameters(wxobj, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)НайдиОбъект(wxGridCellChoiceEditor_Clone(wxobj), &GridCellEditor.Нов);
              return new GridCellChoiceEditor(wxGridCellChoiceEditor_Clone(wxobj));
        }

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellChoiceEditor_GetValue(wxobj), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦелУкз wxGridRangeSelectEvent_ctor(цел ид, цел тип, ЦелУкз объ, ЦелУкз topLeft, ЦелУкз bottomRight, бул sel, бул control, бул shift, бул alt, бул meta);
        static extern (C) ЦелУкз wxGridRangeSelectEvent_GetTopLeftCoords(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridRangeSelectEvent_GetBottomRightCoords(ЦелУкз сам);
        static extern (C) цел wxGridRangeSelectEvent_GetTopRow(ЦелУкз сам);
        static extern (C) цел wxGridRangeSelectEvent_GetBottomRow(ЦелУкз сам);
        static extern (C) цел wxGridRangeSelectEvent_GetLeftCol(ЦелУкз сам);
        static extern (C) цел wxGridRangeSelectEvent_GetRightCol(ЦелУкз сам);
        static extern (C) бул wxGridRangeSelectEvent_Selecting(ЦелУкз сам);
        static extern (C) бул wxGridRangeSelectEvent_ControlDown(ЦелУкз сам);
        static extern (C) бул wxGridRangeSelectEvent_MetaDown(ЦелУкз сам);
        static extern (C) бул wxGridRangeSelectEvent_ShiftDown(ЦелУкз сам);
        static extern (C) бул wxGridRangeSelectEvent_AltDown(ЦелУкз сам);
        static extern (C) проц wxGridRangeSelectEvent_Veto(ЦелУкз сам);
        static extern (C) проц wxGridRangeSelectEvent_Allow(ЦелУкз сам);
        static extern (C) бул wxGridRangeSelectEvent_IsAllowed(ЦелУкз сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GridRangeSelectEvent wxGridRangeSelectEvent;
    public class GridRangeSelectEvent : Событие
    {
        public this(ЦелУкз wxobj)
            { super(wxobj); }

        public this(цел ид, цел тип, wxObject объ, GridCellCoords topLeft, GridCellCoords bottomRight, бул sel, бул control, бул shift, бул alt, бул meta)
            { super(wxGridRangeSelectEvent_ctor(ид, тип, wxObject.SafePtr(объ), wxObject.SafePtr(topLeft), wxObject.SafePtr(bottomRight), sel, control, shift, alt, meta)); }

            //-----------------------------------------------------------------------------

        public GridCellCoords TopLeftCoords() { return new GridCellCoords(wxGridRangeSelectEvent_GetTopLeftCoords(wxobj)); }

        public GridCellCoords BottomRightCoords() { return new GridCellCoords(wxGridRangeSelectEvent_GetBottomRightCoords(wxobj)); }

        //-----------------------------------------------------------------------------

        public цел TopRow() { return wxGridRangeSelectEvent_GetTopRow(wxobj); }

        public цел BottomRow() { return wxGridRangeSelectEvent_GetBottomRow(wxobj); }

        //-----------------------------------------------------------------------------

        public цел LeftCol() { return wxGridRangeSelectEvent_GetLeftCol(wxobj); }

        public цел RightCol() { return wxGridRangeSelectEvent_GetRightCol(wxobj); }

        //-----------------------------------------------------------------------------

        public бул Selecting() { return wxGridRangeSelectEvent_Selecting(wxobj); }

        //-----------------------------------------------------------------------------

        public бул ControlDown() { return wxGridRangeSelectEvent_ControlDown(wxobj); }

        public бул MetaDown() { return wxGridRangeSelectEvent_MetaDown(wxobj); }

        public бул ShiftDown() { return wxGridRangeSelectEvent_ShiftDown(wxobj); }

        public бул AltDown() { return wxGridRangeSelectEvent_AltDown(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Veto()
        {
            wxGridRangeSelectEvent_Veto(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Allow()
        {
            wxGridRangeSelectEvent_Allow(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул Allowed() { return wxGridRangeSelectEvent_IsAllowed(wxobj); }

	private static Событие Нов(ЦелУкз объ) { return new GridRangeSelectEvent(объ); }

	static this()
	{
			wxEVT_GRID_RANGE_SELECT = wxEvent_EVT_GRID_RANGE_SELECT();

			ДобавьТипСоб(wxEVT_GRID_RANGE_SELECT,               &GridRangeSelectEvent.Нов);
	}
    }

		//! \cond EXTERN
	extern (C) {
        alias проц function(GridCellWorker объ, ткст param) Virtual_SetParameters;
	}

        static extern (C) ЦелУкз wxGridCellWorker_ctor();
        static extern (C) проц wxGridCellWorker_RegisterVirtual(ЦелУкз сам, GridCellWorker объ, Virtual_SetParameters setParameters);
        static extern (C) проц wxGridCellWorker_IncRef(ЦелУкз сам);
        static extern (C) проц wxGridCellWorker_DecRef(ЦелУкз сам);
        static extern (C) проц wxGridCellWorker_SetParameters(ЦелУкз сам, ткст parms);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GridCellWorker wxGridCellWorker;
    public class GridCellWorker : wxObject //ClientData
    {
        public this(ЦелУкз wxobj)
	{
		super(wxobj);
	}

	private this(ЦелУкз wxobj, бул memOwn)
	{
		super(wxobj);
		this.memOwn = memOwn;
	}

        public this()
        {
        	this(wxGridCellWorker_ctor(), да);
            wxGridCellWorker_RegisterVirtual(wxobj, this, &staticDoУстParameters);
        }

	//---------------------------------------------------------------------

	override protected проц dtor() {}

        //-----------------------------------------------------------------------------

        public проц IncRef()
        {
            wxGridCellWorker_IncRef(wxobj);
        }

        public проц DecRef()
        {
            wxGridCellWorker_DecRef(wxobj);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticDoУстParameters(GridCellWorker объ, ткст param)
        {
            объ.УстParameters(param);
        }

        public  проц УстParameters(ткст param)
        {
            wxGridCellWorker_SetParameters(wxobj, param);
        }
    }

    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            static extern (C) ЦелУкз wxGridEditorCreatedEvent_ctor(цел ид, цел тип, ЦелУкз объ, цел row, цел col, ЦелУкз ctrl);
            static extern (C) цел    wxGridEditorCreatedEvent_GetRow(ЦелУкз сам);
            static extern (C) цел    wxGridEditorCreatedEvent_GetCol(ЦелУкз сам);
            static extern (C) ЦелУкз wxGridEditorCreatedEvent_GetControl(ЦелУкз сам);
            static extern (C) проц   wxGridEditorCreatedEvent_SetRow(ЦелУкз сам, цел row);
            static extern (C) проц   wxGridEditorCreatedEvent_SetCol(ЦелУкз сам, цел col);
            static extern (C) проц   wxGridEditorCreatedEvent_SetControl(ЦелУкз сам, ЦелУкз ctrl);
            //! \endcond

            //-----------------------------------------------------------------------------

    alias GridEditorCreatedEvent wxGridEditorCreatedEvent;
    public class GridEditorCreatedEvent : СобытиеКоманда
    {
            public this(ЦелУкз wxobj)
            { super(wxobj); }

            public this(цел ид, цел тип, wxObject объ, цел row, цел col, Control ctrl)
            { this(wxGridEditorCreatedEvent_ctor(ид, тип, wxObject.SafePtr(объ), row, col, wxObject.SafePtr(ctrl))); }

            //-----------------------------------------------------------------------------

            public цел Row() { return wxGridEditorCreatedEvent_GetRow(wxobj); }
            public проц Row(цел значение) { wxGridEditorCreatedEvent_SetRow(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public цел Col() { return wxGridEditorCreatedEvent_GetCol(wxobj); }
            public проц Col(цел значение) { wxGridEditorCreatedEvent_SetCol(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public Control control() { return cast(Control)НайдиОбъект(wxGridEditorCreatedEvent_GetControl(wxobj), &Control.Нов); }
            public проц control(Control значение) { wxGridEditorCreatedEvent_SetControl(wxobj, wxObject.SafePtr(значение)); }

		private static Событие Нов(ЦелУкз объ) { return new GridEditorCreatedEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_GRID_EDITOR_CREATED,             &GridEditorCreatedEvent.Нов);
		}
    }

    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            static extern (C) ЦелУкз wxGrid_ctor();
            static extern (C) ЦелУкз wxGrid_ctorFull(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
            static extern (C) бул   wxGrid_CreateGrid(ЦелУкз сам, цел numRows, цел numCols,  цел selmode);
            static extern (C) проц   wxGrid_SetSelectionMode(ЦелУкз сам, цел selmode);
            static extern (C) цел    wxGrid_GetNumberRows(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetNumberCols(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetTable(ЦелУкз сам);
            static extern (C) бул   wxGrid_SetTable(ЦелУкз сам, ЦелУкз table, бул takeOwnership, цел select);
            static extern (C) проц   wxGrid_ClearGrid(ЦелУкз сам);
            static extern (C) бул   wxGrid_InsertRows(ЦелУкз сам, цел поз, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_AppendRows(ЦелУкз сам, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_DeleteRows(ЦелУкз сам, цел поз, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_InsertCols(ЦелУкз сам, цел поз, цел numCols, бул updateLabels);
            static extern (C) бул   wxGrid_AppendCols(ЦелУкз сам, цел numCols, бул updateLabels);
            static extern (C) бул   wxGrid_DeleteCols(ЦелУкз сам, цел поз, цел numCols, бул updateLabels);
            static extern (C) проц   wxGrid_BeginBatch(ЦелУкз сам);
            static extern (C) проц   wxGrid_EndBatch(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetBatchCount(ЦелУкз сам);
            static extern (C) проц   wxGrid_ForceRefresh(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsEditable(ЦелУкз сам);
            static extern (C) проц   wxGrid_EnableEditing(ЦелУкз сам, бул edit);
            static extern (C) проц   wxGrid_EnableCellEditControl(ЦелУкз сам, бул вкл);
            static extern (C) проц   wxGrid_DisableCellEditControl(ЦелУкз сам);
            static extern (C) бул   wxGrid_CanEnableCellControl(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsCellEditControlEnabled(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsCellEditControlShown(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsCurrentCellReadOnly(ЦелУкз сам);
            static extern (C) проц   wxGrid_ShowCellEditControl(ЦелУкз сам);
            static extern (C) проц   wxGrid_HideCellEditControl(ЦелУкз сам);
            static extern (C) проц   wxGrid_SaveEditControlValue(ЦелУкз сам);
            static extern (C) цел    wxGrid_YToRow(ЦелУкз сам, цел y);
            static extern (C) цел    wxGrid_XToCol(ЦелУкз сам, цел x);
            static extern (C) цел    wxGrid_YToEdgeOfRow(ЦелУкз сам, цел y);
            static extern (C) цел    wxGrid_XToEdgeOfCol(ЦелУкз сам, цел x);
            static extern (C) проц   wxGrid_CellToRect(ЦелУкз сам, цел row, цел col, inout Прямоугольник прям);
            static extern (C) цел    wxGrid_GetGridCursorRow(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetGridCursorCol(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsVisible(ЦелУкз сам, цел row, цел col, бул wholeCellVisible);
            static extern (C) проц   wxGrid_MakeCellVisible(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetGridCursor(ЦелУкз сам, цел row, цел col);
            static extern (C) бул   wxGrid_MoveCursorUp(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorDown(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorLeft(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorRight(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MovePageDown(ЦелУкз сам);
            static extern (C) бул   wxGrid_MovePageUp(ЦелУкз сам);
            static extern (C) бул   wxGrid_MoveCursorUpBlock(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorDownBlock(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorLeftBlock(ЦелУкз сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorRightBlock(ЦелУкз сам, бул expandSelection);
            static extern (C) цел    wxGrid_GetDefaultRowLabelSize(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetRowLabelSize(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetDefaultColLabelSize(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetColLabelSize(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetLabelBackgroundColour(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetLabelTextColour(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetLabelFont(ЦелУкз сам);
            static extern (C) проц   wxGrid_GetRowLabelAlignment(ЦелУкз сам, out цел horiz, out цел vert);
            static extern (C) проц   wxGrid_GetColLabelAlignment(ЦелУкз сам, out цел horiz, out цел vert);
            static extern (C) ЦелУкз wxGrid_GetRowLabelValue(ЦелУкз сам, цел row);
            static extern (C) ЦелУкз wxGrid_GetColLabelValue(ЦелУкз сам, цел col);
            static extern (C) ЦелУкз wxGrid_GetGridLineColour(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellHighlightColour(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetCellHighlightPenWidth(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetCellHighlightROPenWidth(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetRowLabelSize(ЦелУкз сам, цел ширь);
            static extern (C) проц   wxGrid_SetColLabelSize(ЦелУкз сам, цел высь);
            static extern (C) проц   wxGrid_SetLabelBackgroundColour(ЦелУкз сам, ЦелУкз col);
            static extern (C) проц   wxGrid_SetLabelTextColour(ЦелУкз сам, ЦелУкз col);
            static extern (C) проц   wxGrid_SetLabelFont(ЦелУкз сам, ЦелУкз fnt);
            static extern (C) проц   wxGrid_SetRowLabelAlignment(ЦелУкз сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetColLabelAlignment(ЦелУкз сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetRowLabelValue(ЦелУкз сам, цел row, ткст val);
            static extern (C) проц   wxGrid_SetColLabelValue(ЦелУкз сам, цел col, ткст val);
            static extern (C) проц   wxGrid_SetGridLineColour(ЦелУкз сам, ЦелУкз col);
            static extern (C) проц   wxGrid_SetCellHighlightColour(ЦелУкз сам, ЦелУкз col);
            static extern (C) проц   wxGrid_SetCellHighlightPenWidth(ЦелУкз сам, цел ширь);
            static extern (C) проц   wxGrid_SetCellHighlightROPenWidth(ЦелУкз сам, цел ширь);
            static extern (C) проц   wxGrid_EnableDragRowSize(ЦелУкз сам, бул вкл);
            static extern (C) проц   wxGrid_DisableDragRowSize(ЦелУкз сам);
            static extern (C) бул   wxGrid_CanDragRowSize(ЦелУкз сам);
            static extern (C) проц   wxGrid_EnableDragColSize(ЦелУкз сам, бул вкл);
            static extern (C) проц   wxGrid_DisableDragColSize(ЦелУкз сам);
            static extern (C) бул   wxGrid_CanDragColSize(ЦелУкз сам);
            static extern (C) проц   wxGrid_EnableDragGridSize(ЦелУкз сам, бул вкл);
            static extern (C) проц   wxGrid_DisableDragGridSize(ЦелУкз сам);
            static extern (C) бул   wxGrid_CanDragGridSize(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetAttr(ЦелУкз сам, цел row, цел col, ЦелУкз attr);
            static extern (C) проц   wxGrid_SetRowAttr(ЦелУкз сам, цел row, ЦелУкз attr);
            static extern (C) проц   wxGrid_SetColAttr(ЦелУкз сам, цел col, ЦелУкз attr);
            static extern (C) проц   wxGrid_SetColFormatBool(ЦелУкз сам, цел col);
            static extern (C) проц   wxGrid_SetColFormatNumber(ЦелУкз сам, цел col);
            static extern (C) проц   wxGrid_SetColFormatFloat(ЦелУкз сам, цел col, цел ширь, цел precision);
            static extern (C) проц   wxGrid_SetColFormatCustom(ЦелУкз сам, цел col, ткст typeName);
            static extern (C) проц   wxGrid_EnableGridLines(ЦелУкз сам, бул вкл);
            static extern (C) бул   wxGrid_GridLinesEnabled(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetDefaultRowSize(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetRowSize(ЦелУкз сам, цел row);
            static extern (C) цел    wxGrid_GetDefaultColSize(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetColSize(ЦелУкз сам, цел col);
            static extern (C) ЦелУкз wxGrid_GetDefaultCellBackgroundColour(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellBackgroundColour(ЦелУкз сам, цел row, цел col);
            static extern (C) ЦелУкз wxGrid_GetDefaultCellTextColour(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellTextColour(ЦелУкз сам, цел row, цел col);
            static extern (C) ЦелУкз wxGrid_GetDefaultCellFont(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellFont(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_GetDefaultCellAlignment(ЦелУкз сам, inout цел horiz, inout цел vert);
            static extern (C) проц   wxGrid_GetCellAlignment(ЦелУкз сам, цел row, цел col, inout цел horiz, inout цел vert);
            static extern (C) бул   wxGrid_GetDefaultCellOverflow(ЦелУкз сам);
            static extern (C) бул   wxGrid_GetCellOverflow(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_GetCellSize(ЦелУкз сам, цел row, цел col, inout цел num_rows, inout цел num_cols);
            static extern (C) проц   wxGrid_SetDefaultRowSize(ЦелУкз сам, цел высь, бул resizeExistingRows);
            static extern (C) проц   wxGrid_SetRowSize(ЦелУкз сам, цел row, цел высь);
            static extern (C) проц   wxGrid_SetDefaultColSize(ЦелУкз сам, цел ширь, бул resizeExistingCols);
            static extern (C) проц   wxGrid_SetColSize(ЦелУкз сам, цел col, цел ширь);
            static extern (C) проц   wxGrid_AutoSizeColumn(ЦелУкз сам, цел col, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeRow(ЦелУкз сам, цел row, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeColumns(ЦелУкз сам, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeRows(ЦелУкз сам, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSize(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetColMinimalWidth(ЦелУкз сам, цел col, цел ширь);
            static extern (C) проц   wxGrid_SetRowMinimalHeight(ЦелУкз сам, цел row, цел ширь);
            static extern (C) проц   wxGrid_SetColMinimalAcceptableWidth(ЦелУкз сам, цел ширь);
            static extern (C) проц   wxGrid_SetRowMinimalAcceptableHeight(ЦелУкз сам, цел ширь);
            static extern (C) цел    wxGrid_GetColMinimalAcceptableWidth(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetRowMinimalAcceptableHeight(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetDefaultCellBackgroundColour(ЦелУкз сам, ЦелУкз wxColour);
            static extern (C) проц   wxGrid_SetDefaultCellTextColour(ЦелУкз сам, ЦелУкз wxColour);
            static extern (C) проц   wxGrid_SetDefaultCellFont(ЦелУкз сам, ЦелУкз wxFont);
            static extern (C) проц   wxGrid_SetCellFont(ЦелУкз сам, цел row, цел col, ЦелУкз wxFont );
            static extern (C) проц   wxGrid_SetDefaultCellAlignment(ЦелУкз сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetCellAlignmentHV(ЦелУкз сам, цел row, цел col, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetDefaultCellOverflow(ЦелУкз сам, бул allow);
            static extern (C) проц   wxGrid_SetCellOverflow(ЦелУкз сам, цел row, цел col, бул allow);
            static extern (C) проц   wxGrid_SetCellSize(ЦелУкз сам, цел row, цел col, цел num_rows, цел num_cols);
            static extern (C) проц   wxGrid_SetDefaultRenderer(ЦелУкз сам, ЦелУкз renderer);
            static extern (C) проц   wxGrid_SetCellRenderer(ЦелУкз сам, цел row, цел col, ЦелУкз renderer);
            static extern (C) ЦелУкз wxGrid_GetDefaultRenderer(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellRenderer(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetDefaultEditor(ЦелУкз сам, ЦелУкз editor);
            static extern (C) проц   wxGrid_SetCellEditor(ЦелУкз сам, цел row, цел col, ЦелУкз editor);
            static extern (C) ЦелУкз wxGrid_GetDefaultEditor(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellEditor(ЦелУкз сам, цел row, цел col);
            static extern (C) ЦелУкз wxGrid_GetCellValue(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellValue(ЦелУкз сам, цел row, цел col, ткст s);
            static extern (C) бул   wxGrid_IsReadOnly(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetReadOnly(ЦелУкз сам, цел row, цел col, бул isReadOnly);
            static extern (C) проц   wxGrid_SelectRow(ЦелУкз сам, цел row, бул addToSelected);
            static extern (C) проц   wxGrid_SelectCol(ЦелУкз сам, цел col, бул addToSelected);
            static extern (C) проц   wxGrid_SelectBlock(ЦелУкз сам, цел topRow, цел leftCol, цел bottomRow, цел rightCol, бул addToSelected);
            static extern (C) проц   wxGrid_SelectAll(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsSelection(ЦелУкз сам);
            static extern (C) проц   wxGrid_DeselectRow(ЦелУкз сам, цел row);
            static extern (C) проц   wxGrid_DeselectCol(ЦелУкз сам, цел col);
            static extern (C) проц   wxGrid_DeselectCell(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_ClearSelection(ЦелУкз сам);
            static extern (C) бул   wxGrid_IsInSelection(ЦелУкз сам, цел row, цел col);
            //static extern (C) ЦелУкз wxGrid_GetSelectedCells(ЦелУкз сам);
            //static extern (C) ЦелУкз wxGrid_GetSelectionBlockTopLeft(ЦелУкз сам);
            //static extern (C) ЦелУкз wxGrid_GetSelectionBlockBottomRight(ЦелУкз сам);
            //static extern (C) ЦелУкз wxGrid_GetSelectedRows(ЦелУкз сам);
            //static extern (C) ЦелУкз wxGrid_GetSelectedCols(ЦелУкз сам);
            static extern (C) проц   wxGrid_BlockToDeviceRect(ЦелУкз сам, ЦелУкз topLeft, ЦелУкз bottomRight, inout Прямоугольник прям);
            static extern (C) ЦелУкз wxGrid_GetSelectionBackground(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetSelectionForeground(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetSelectionBackground(ЦелУкз сам, ЦелУкз c);
            static extern (C) проц   wxGrid_SetSelectionForeground(ЦелУкз сам, ЦелУкз c);
            static extern (C) проц   wxGrid_RegisterDataType(ЦелУкз сам, ткст typeName, ЦелУкз renderer, ЦелУкз editor);
            static extern (C) ЦелУкз wxGrid_GetDefaultEditorForCell(ЦелУкз сам, цел row, цел col);
            static extern (C) ЦелУкз wxGrid_GetDefaultRendererForCell(ЦелУкз сам, цел row, цел col);
            static extern (C) ЦелУкз wxGrid_GetDefaultEditorForType(ЦелУкз сам, ткст typeName);
            static extern (C) ЦелУкз wxGrid_GetDefaultRendererForType(ЦелУкз сам, ткст typeName);
            static extern (C) проц   wxGrid_SetMargins(ЦелУкз сам, цел extraWidth, цел extraHeight);
            static extern (C) ЦелУкз wxGrid_GetGridWindow(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetGridRowLabelWindow(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetGridColLabelWindow(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetGridCornerLabelWindow(ЦелУкз сам);
            static extern (C) проц   wxGrid_UpdateDimensions(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetRows(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetCols(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetCursorRow(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetCursorColumn(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetScrollPosX(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetScrollPosY(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetScrollX(ЦелУкз сам, цел x);
            static extern (C) проц   wxGrid_SetScrollY(ЦелУкз сам, цел y);
            static extern (C) проц   wxGrid_SetColumnWidth(ЦелУкз сам, цел col, цел ширь);
            static extern (C) цел    wxGrid_GetColumnWidth(ЦелУкз сам, цел col);
            static extern (C) проц   wxGrid_SetRowHeight(ЦелУкз сам, цел row, цел высь);
            static extern (C) цел    wxGrid_GetViewHeight(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetViewWidth(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetLabelSize(ЦелУкз сам, цел orientation, цел рм);
            static extern (C) цел    wxGrid_GetLabelSize(ЦелУкз сам, цел orientation);
            static extern (C) проц   wxGrid_SetLabelAlignment(ЦелУкз сам, цел orientation, цел alignment);
            static extern (C) цел    wxGrid_GetLabelAlignment(ЦелУкз сам, цел orientation, цел alignment);
            static extern (C) проц   wxGrid_SetLabelValue(ЦелУкз сам, цел orientation, ткст val, цел поз);
            static extern (C) ЦелУкз wxGrid_GetLabelValue(ЦелУкз сам, цел orientation, цел поз);
            static extern (C) ЦелУкз wxGrid_GetCellTextFontGrid(ЦелУкз сам);
            static extern (C) ЦелУкз wxGrid_GetCellTextFont(ЦелУкз сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellTextFontGrid(ЦелУкз сам, ЦелУкз fnt);
            static extern (C) проц   wxGrid_SetCellTextFont(ЦелУкз сам, ЦелУкз fnt, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellTextColour(ЦелУкз сам, цел row, цел col, ЦелУкз val);
            static extern (C) проц   wxGrid_SetCellTextColourGrid(ЦелУкз сам, ЦелУкз col);
            static extern (C) проц   wxGrid_SetCellBackgroundColourGrid(ЦелУкз сам, ЦелУкз col);
            static extern (C) проц   wxGrid_SetCellBackgroundColour(ЦелУкз сам, цел row, цел col, ЦелУкз цвет);
            static extern (C) бул   wxGrid_GetEditable(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetEditable(ЦелУкз сам, бул edit);
            static extern (C) бул   wxGrid_GetEditInPlace(ЦелУкз сам);
            static extern (C) проц   wxGrid_SetCellAlignment(ЦелУкз сам, цел alignment, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellAlignmentGrid(ЦелУкз сам, цел alignment);
            static extern (C) проц   wxGrid_SetCellBitmap(ЦелУкз сам, ЦелУкз битмап, цел row, цел col);
            static extern (C) проц   wxGrid_SetDividerPen(ЦелУкз сам, ЦелУкз pen);
            static extern (C) ЦелУкз wxGrid_GetDividerPen(ЦелУкз сам);
            static extern (C) цел    wxGrid_GetRowHeight(ЦелУкз сам, цел row);
            //! \endcond

        //-----------------------------------------------------------------------------

    alias Grid wxGrid;
    public class Grid : ScrolledWindow
    {
        public this(ЦелУкз wxobj)
            { super(wxobj); }

        public this()
            { this(wxGrid_ctor()); }

        public this(Окно родитель, цел ид)
            { this(родитель, ид, вхДефПоз, вхДефРазм, wxWANTS_CHARS, "grid"); }

        public this(Окно родитель, цел ид, Точка поз)
            { this(родитель, ид, поз, вхДефРазм, wxWANTS_CHARS, "grid"); }

        public this(Окно родитель, цел ид, Точка поз, Размер Размер)
            { this(родитель, ид, поз, Размер, wxWANTS_CHARS, "grid"); }

        public this(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль)
            { this(родитель, ид, поз, Размер, стиль, "grid"); }

        public this(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль, ткст имя)
            { this(wxGrid_ctorFull(wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя)); }

        //public  this(Окно родитель, цел x, цел y, цел w, цел h, цел стиль, ткст имя)
        //    { super(wxGrid_ctor(wxObject.SafePtr(родитель), x, y, w, h, стиль, имя)); }

	//---------------------------------------------------------------------
	// ctors with сам created ид

	public this(Окно родитель)
            { this(родитель, Окно.УникИД, вхДефПоз, вхДефРазм, wxWANTS_CHARS, "grid"); }

        public this(Окно родитель, Точка поз)
            { this(родитель, Окно.УникИД, поз, вхДефРазм, wxWANTS_CHARS, "grid"); }

        public this(Окно родитель, Точка поз, Размер Размер)
            { this(родитель, Окно.УникИД, поз, Размер, wxWANTS_CHARS, "grid"); }

        public this(Окно родитель, Точка поз, Размер Размер, цел стиль)
            { this(родитель, Окно.УникИД, поз, Размер, стиль, "grid"); }

        public this(Окно родитель, Точка поз, Размер Размер, цел стиль, ткст имя)
		{ this(родитель, Окно.УникИД, поз, Размер, стиль, имя);}

        //-----------------------------------------------------------------------------

        public бул CreateGrid(цел numRows, цел numCols)
        { return CreateGrid(numRows, numCols, GridSelectionMode.wxGridSelectCells); }

            public бул CreateGrid(цел numRows, цел numCols, GridSelectionMode selmode)
            {
            return wxGrid_CreateGrid(wxobj, numRows, numCols, cast(цел)selmode);
            }

        //-----------------------------------------------------------------------------

            public проц SelectionMode(GridSelectionMode значение) { wxGrid_SetSelectionMode(wxobj, cast(цел)значение); }
            //get { return wxGrid_GetSelectionMode(wxobj); }

            //-----------------------------------------------------------------------------

            public цел NumberRows() { return wxGrid_GetNumberRows(wxobj); }

            public цел NumberCols() { return wxGrid_GetNumberCols(wxobj); }

        //-----------------------------------------------------------------------------

       //     public GridTableBase Table() { return cast(GridTableBase)НайдиОбъект(wxGrid_GetTable(wxobj), &GridTableBase.Нов); }

        public бул УстTable(GridTableBase table)
        {
            return УстTable(table, false, GridSelectionMode.wxGridSelectCells );
        }

        public бул УстTable(GridTableBase table, бул takeOwnerShip)
        {
            return УстTable(table, takeOwnerShip, GridSelectionMode.wxGridSelectCells);
        }

            public бул УстTable(GridTableBase table, бул takeOwnership, GridSelectionMode select)
            {
            return wxGrid_SetTable(wxobj, wxObject.SafePtr(table), takeOwnership, cast(цел)select);
            }

            //-----------------------------------------------------------------------------

            public проц ClearGrid()
            {
            wxGrid_ClearGrid(wxobj);
            }

            //-----------------------------------------------------------------------------

        public бул вставьРяды()
        {
            return вставьРяды(0, 1, да);
        }

        public бул вставьРяды(цел поз)
        {
            return вставьРяды(поз, 1, да);
        }

        public бул вставьРяды(цел поз, цел numRows)
        {
            return вставьРяды(поз, numRows, да);
        }

            public бул вставьРяды(цел поз, цел numRows, бул updateLabels)
            {
            return wxGrid_InsertRows(wxobj, поз, numRows, updateLabels);
        }

        public бул AppendRows()
        {
            return AppendRows(1, да);
        }

        public бул AppendRows(цел numRows)
        {
            return AppendRows(numRows, да);
        }

            public бул AppendRows(цел numRows, бул updateLabels)
            {
            return wxGrid_AppendRows(wxobj, numRows, updateLabels);
            }

        public бул DeleteRows()
        {
            return DeleteRows(0, 1, да);
        }

        public бул DeleteRows(цел поз)
        {
            return DeleteRows(поз, 1, да);
        }

        public бул DeleteRows(цел поз, цел numRows)
        {
            return DeleteRows(поз, numRows, да);
        }

            public бул DeleteRows(цел поз, цел numRows, бул updateLabels)
            {
            return wxGrid_DeleteRows(wxobj, поз, numRows, updateLabels);
            }

        //-----------------------------------------------------------------------------

        public бул InsertCols()
        {
            return InsertCols(0, 1, да);
        }

        public бул InsertCols(цел поз)
        {
            return InsertCols(поз, 1, да);
        }

        public бул InsertCols(цел поз, цел numRows)
        {
            return InsertCols(поз, numRows, да);
        }

            public бул InsertCols(цел поз, цел numCols, бул updateLabels)
            {
            return wxGrid_InsertCols(wxobj, поз, numCols, updateLabels);
            }

        public бул AppendCols()
        {
            return AppendCols(1, да);
        }

        public бул AppendCols(цел numCols)
        {
            return AppendCols(numCols, да);
        }

            public бул AppendCols(цел numCols, бул updateLabels)
            {
            return wxGrid_AppendCols(wxobj, numCols, updateLabels);
            }

        public бул DeleteCols()
        {
            return DeleteCols(0, 1, да);
        }

        public бул DeleteCols(цел поз)
        {
            return DeleteCols(поз, 1, да);
        }

        public бул DeleteCols(цел поз, цел numRows)
        {
            return DeleteCols(поз, numRows, да);
        }

            public бул DeleteCols(цел поз, цел numCols, бул updateLabels)
            {
            return wxGrid_DeleteCols(wxobj, поз, numCols, updateLabels);
            }

            //-----------------------------------------------------------------------------

            public проц BeginBatch()
            {
            wxGrid_BeginBatch(wxobj);
            }

            public проц EndBatch()
            {
            wxGrid_EndBatch(wxobj);
            }

            public цел BatchCount() { return wxGrid_GetBatchCount(wxobj); }

            //-----------------------------------------------------------------------------

            public проц ForceRefresh()
            {
            wxGrid_ForceRefresh(wxobj);
            }

            //-----------------------------------------------------------------------------

            public бул IsEditable() { return wxGrid_IsEditable(wxobj); }
            public проц IsEditable(бул значение) { wxGrid_EnableEditing(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public проц CellEditControlEnabled(бул значение) { wxGrid_EnableCellEditControl(wxobj, значение); }
            public бул CellEditControlEnabled() { return wxGrid_IsCellEditControlEnabled(wxobj); }

            public проц DisableCellEditControl()
            {
            wxGrid_DisableCellEditControl(wxobj);
            }

            public бул CanEnableCellControl() { return wxGrid_CanEnableCellControl(wxobj); }

            //-----------------------------------------------------------------------------

            public бул IsCellEditControlShown() { return wxGrid_IsCellEditControlShown(wxobj); }

            public бул IsCurrentCellReadOnly() { return wxGrid_IsCurrentCellReadOnly(wxobj); }

            //-----------------------------------------------------------------------------

            public проц ShowCellEditControl()
            {
            wxGrid_ShowCellEditControl(wxobj);
            }

            public проц HideCellEditControl()
            {
            wxGrid_HideCellEditControl(wxobj);
            }

            //-----------------------------------------------------------------------------

            public проц SaveEditControlValue()
            {
            wxGrid_SaveEditControlValue(wxobj);
            }

            //-----------------------------------------------------------------------------

            /*public проц XYToCell(цел x, цел y,  GridCellCoords )
            {
                    wxGrid_XYToCell(wxobj, x, y, wxObject.SafePtr(GridCellCoords ));
            }*/

            //-----------------------------------------------------------------------------

            public цел YToRow(цел y)
            {
            return wxGrid_YToRow(wxobj, y);
            }

            public цел XToCol(цел x)
            {
            return wxGrid_XToCol(wxobj, x);
            }

            public цел YToEdgeOfRow(цел y)
            {
            return wxGrid_YToEdgeOfRow(wxobj, y);
            }

            public цел XToEdgeOfCol(цел x)
            {
            return wxGrid_XToEdgeOfCol(wxobj, x);
            }

            //-----------------------------------------------------------------------------

            public Прямоугольник CellToRect(цел row, цел col)
            {
            Прямоугольник прям;
            wxGrid_CellToRect(wxobj, row, col, прям);
            return прям;
            }

            //-----------------------------------------------------------------------------

            public цел GridCursorRow() { return wxGrid_GetGridCursorRow(wxobj); }

            public цел GridCursorCol() { return wxGrid_GetGridCursorCol(wxobj); }

            //-----------------------------------------------------------------------------

            public бул Виден(цел row, цел col, бул wholeCellVisible)
            {
            return wxGrid_IsVisible(wxobj, row, col, wholeCellVisible);
            }

            //-----------------------------------------------------------------------------

            public проц MakeCellVisible(цел row, цел col)
            {
            wxGrid_MakeCellVisible(wxobj, row, col);
            }

            //-----------------------------------------------------------------------------

            public проц УстGridCursor(цел row, цел col)
            {
            wxGrid_SetGridCursor(wxobj, row, col);
            }

            //-----------------------------------------------------------------------------

            public бул MoveCursorUp(бул expandSelection)
            {
            return wxGrid_MoveCursorUp(wxobj, expandSelection);
            }

            public бул MoveCursorDown(бул expandSelection)
            {
            return wxGrid_MoveCursorDown(wxobj, expandSelection);
            }

            public бул MoveCursorLeft(бул expandSelection)
            {
            return wxGrid_MoveCursorLeft(wxobj, expandSelection);
            }

            public бул MoveCursorRight(бул expandSelection)
            {
            return wxGrid_MoveCursorRight(wxobj, expandSelection);
            }

            public бул MovePageDown()
            {
            return wxGrid_MovePageDown(wxobj);
            }

            public бул MovePageUp()
            {
            return wxGrid_MovePageUp(wxobj);
            }

            //-----------------------------------------------------------------------------

            public бул MoveCursorUpBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorUpBlock(wxobj, expandSelection);
            }

            public бул MoveCursorDownBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorDownBlock(wxobj, expandSelection);
            }

            public бул MoveCursorLeftBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorLeftBlock(wxobj, expandSelection);
            }

            public бул MoveCursorRightBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorRightBlock(wxobj, expandSelection);
            }

            //-----------------------------------------------------------------------------

            public цел DefaultRowLabelSize() { return wxGrid_GetDefaultRowLabelSize(wxobj); }

            public цел RowLabelSize() { return wxGrid_GetRowLabelSize(wxobj); }
            public проц RowLabelSize(цел значение) { wxGrid_SetRowLabelSize(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public цел DefaultColLabelSize() { return wxGrid_GetDefaultColLabelSize(wxobj); }

            public цел ColLabelSize() { return wxGrid_GetColLabelSize(wxobj); }
            public проц ColLabelSize(цел значение) { wxGrid_SetColLabelSize(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public Цвет LabelBackgroundColour() { return new Цвет(wxGrid_GetLabelBackgroundColour(wxobj), да); }
            public проц LabelBackgroundColour(Цвет значение) { wxGrid_SetLabelBackgroundColour(wxobj, wxObject.SafePtr(значение)); }

            public Цвет LabelTextColour() { return new Цвет(wxGrid_GetLabelTextColour(wxobj), да); }
            public проц LabelTextColour(Цвет значение) { wxGrid_SetLabelTextColour(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public Шрифт LabelFont() { return new Шрифт(wxGrid_GetLabelFont(wxobj)); }
            public проц LabelFont(Шрифт значение) { wxGrid_SetLabelFont(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public проц GetRowLabelAlignment(out цел horiz, out цел vert)
            {
            wxGrid_GetRowLabelAlignment(wxobj, horiz, vert);
            }

            public проц GetColLabelAlignment(out цел horiz, out цел vert)
            {
            wxGrid_GetColLabelAlignment(wxobj, horiz, vert);
            }

            //-----------------------------------------------------------------------------

            public ткст GetRowLabelValue(цел row)
            {
            return cast(ткст) new wxString(wxGrid_GetRowLabelValue(wxobj, row), да);
            }

            public ткст GetColLabelValue(цел col)
            {
            return cast(ткст) new wxString(wxGrid_GetColLabelValue(wxobj, col), да);
            }

            //-----------------------------------------------------------------------------

            public Цвет GridLineColour() { return new Цвет(wxGrid_GetGridLineColour(wxobj), да); }
            public проц GridLineColour(Цвет значение) { wxGrid_SetGridLineColour(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public Цвет CellHighlightColour() { return new Цвет(wxGrid_GetCellHighlightColour(wxobj), да); }
            public проц CellHighlightColour(Цвет значение) { wxGrid_SetCellHighlightColour(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public цел CellHighlightPenWidth() { return wxGrid_GetCellHighlightPenWidth(wxobj); }
            public проц CellHighlightPenWidth(цел значение) { wxGrid_SetCellHighlightPenWidth(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public цел CellHighlightROPenWidth() { return wxGrid_GetCellHighlightROPenWidth(wxobj); }
            public проц CellHighlightROPenWidth(цел значение) { wxGrid_SetCellHighlightROPenWidth(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public проц УстRowLabelAlignment(цел horiz, цел vert)
            {
            wxGrid_SetRowLabelAlignment(wxobj, horiz, vert);
            }

            public проц УстColLabelAlignment(цел horiz, цел vert)
            {
            wxGrid_SetColLabelAlignment(wxobj, horiz, vert);
            }

            //-----------------------------------------------------------------------------

            public проц УстRowLabelValue(цел row, ткст стр)
            {
            wxGrid_SetRowLabelValue(wxobj, row, стр);
            }

            public проц УстColLabelValue(цел col, ткст стр)
            {
            wxGrid_SetColLabelValue(wxobj, col, стр);
            }

            //-----------------------------------------------------------------------------

            public проц DragRowSizeEnabled(бул значение) { wxGrid_EnableDragRowSize(wxobj, значение); }
            public бул DragRowSizeEnabled() { return wxGrid_CanDragRowSize(wxobj); }

            public проц DisableDragRowSize()
            {
            wxGrid_DisableDragRowSize(wxobj);
            }

            //-----------------------------------------------------------------------------

            public проц DragColSizeEnabled(бул значение) { wxGrid_EnableDragColSize(wxobj, значение); }
            public бул DragColSizeEnabled() { return wxGrid_CanDragColSize(wxobj); }

            public проц DisableDragColSize()
            {
            wxGrid_DisableDragColSize(wxobj);
            }

            //-----------------------------------------------------------------------------

            public проц DragGridSizeEnabled(бул значение) { wxGrid_EnableDragGridSize(wxobj, значение); }
            public бул DragGridSizeEnabled() { return wxGrid_CanDragGridSize(wxobj); }

            public проц DisableDragGridSize()
            {
            wxGrid_DisableDragGridSize(wxobj);
            }

            //-----------------------------------------------------------------------------

            public проц УстАтр(цел row, цел col, GridCellAttr attr)
            {
            wxGrid_SetAttr(wxobj, row, col, wxObject.SafePtr(attr));
            }

            public проц УстRowAttr(цел row, GridCellAttr attr)
            {
            wxGrid_SetRowAttr(wxobj, row, wxObject.SafePtr(attr));
            }

            public проц УстColAttr(цел col, GridCellAttr attr)
            {
            wxGrid_SetColAttr(wxobj, col, wxObject.SafePtr(attr));
            }

            //-----------------------------------------------------------------------------

            public проц ColFormatBool(цел значение) { wxGrid_SetColFormatBool(wxobj, значение); }

            public проц ColFormatNumber(цел значение) { wxGrid_SetColFormatNumber(wxobj, значение); }

        public проц УстColFormatFloat(цел col)
        {
            УстColFormatFloat(col, -1, -1);
        }

        public проц УстColFormatFloat(цел col, цел ширь)
        {
            УстColFormatFloat(col, ширь, -1);
        }

            public проц УстColFormatFloat(цел col, цел ширь, цел precision)
            {
            wxGrid_SetColFormatFloat(wxobj, col, ширь, precision);
            }

            public проц УстColFormatCustom(цел col, ткст typeName)
            {
            wxGrid_SetColFormatCustom(wxobj, col, typeName);
            }

            //-----------------------------------------------------------------------------

            public проц GridLinesEnabled(бул значение) { wxGrid_EnableGridLines(wxobj, значение); }
            public бул GridLinesEnabled() { return wxGrid_GridLinesEnabled(wxobj); }

            //-----------------------------------------------------------------------------

            public цел DefaultRowSize() { return wxGrid_GetDefaultRowSize(wxobj); }

            public цел GetRowSize(цел row)
            {
            return wxGrid_GetRowSize(wxobj, row);
            }

            public цел DefaultColSize() { return wxGrid_GetDefaultColSize(wxobj); }

            public цел GetColSize(цел col)
            {
            return wxGrid_GetColSize(wxobj, col);
            }

            //-----------------------------------------------------------------------------

            public Цвет DefaultCellBackgroundColour() { return new Цвет(wxGrid_GetDefaultCellBackgroundColour(wxobj), да); }
            public проц DefaultCellBackgroundColour(Цвет значение) { wxGrid_SetDefaultCellBackgroundColour(wxobj, wxObject.SafePtr(значение)); }

            public Цвет DefaultCellTextColour() { return new Цвет(wxGrid_GetDefaultCellTextColour(wxobj), да); }
            public проц DefaultCellTextColour(Цвет значение) { wxGrid_SetDefaultCellTextColour(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public Шрифт DefaultCellFont() { return new Шрифт(wxGrid_GetDefaultCellFont(wxobj)); }
            public проц DefaultCellFont(Шрифт значение) { wxGrid_SetDefaultCellFont(wxobj, wxObject.SafePtr(значение)); }

            public Шрифт GetCellFont(цел row, цел col)
            {
            return new Шрифт(wxGrid_GetCellFont(wxobj, row, col));
            }

            //-----------------------------------------------------------------------------

            public проц GetDefaultCellAlignment(inout цел horiz, inout цел vert)
            {
            wxGrid_GetDefaultCellAlignment(wxobj, horiz, vert);
            }

            //-----------------------------------------------------------------------------

            public проц GetCellAlignment(цел row, цел col, inout цел horiz, inout цел vert)
            {
            wxGrid_GetCellAlignment(wxobj, row, col, horiz, vert);
            }

            //-----------------------------------------------------------------------------

            public бул DefaultCellOverflow() { return wxGrid_GetDefaultCellOverflow(wxobj); }
            public проц DefaultCellOverflow(бул значение) { wxGrid_SetDefaultCellOverflow(wxobj, значение); }

            public бул GetCellOverflow(цел row, цел col)
            {
            return wxGrid_GetCellOverflow(wxobj, row, col);
            }

            //-----------------------------------------------------------------------------

            public проц GetCellSize(цел row, цел col, inout цел num_rows, inout цел num_cols)
            {
            wxGrid_GetCellSize(wxobj, row, col, num_rows, num_cols);
            }

            //-----------------------------------------------------------------------------

            public проц УстDefaultRowSize(цел высь, бул resizeExistingRows)
            {
            wxGrid_SetDefaultRowSize(wxobj, высь, resizeExistingRows);
            }

            public проц УстRowSize(цел row, цел высь)
            {
            wxGrid_SetRowSize(wxobj, row, высь);
            }

            //-----------------------------------------------------------------------------

            public проц УстDefaultColSize(цел ширь, бул resizeExistingCols)
            {
            wxGrid_SetDefaultColSize(wxobj, ширь, resizeExistingCols);
            }

            public проц УстColSize(цел col, цел ширь)
            {
            wxGrid_SetColSize(wxobj, col, ширь);
            }

            //-----------------------------------------------------------------------------

            public проц AutoSizeColumn(цел col, бул setAsMin)
            {
            wxGrid_AutoSizeColumn(wxobj, col, setAsMin);
            }

            public проц AutoSizeRow(цел row, бул setAsMin)
            {
            wxGrid_AutoSizeRow(wxobj, row, setAsMin);
            }

            //-----------------------------------------------------------------------------

        public проц AutoSizeColumns()
        {
            AutoSizeColumns(да);
        }

            public проц AutoSizeColumns(бул setAsMin)
            {
            wxGrid_AutoSizeColumns(wxobj, setAsMin);
            }

        public проц AutoSizeRows()
        {
            AutoSizeRows(да);
        }

            public проц AutoSizeRows(бул setAsMin)
            {
            wxGrid_AutoSizeRows(wxobj, setAsMin);
            }

            //-----------------------------------------------------------------------------

            public проц AutoSize()
            {
            wxGrid_AutoSize(wxobj);
            }

            //-----------------------------------------------------------------------------

            public проц УстColMinimalWidth(цел col, цел ширь)
            {
            wxGrid_SetColMinimalWidth(wxobj, col, ширь);
            }

            public проц УстRowMinimalHeight(цел row, цел ширь)
            {
            wxGrid_SetRowMinimalHeight(wxobj, row, ширь);
            }

            //-----------------------------------------------------------------------------

            public проц ColMinimalAcceptableWidth(цел значение) { wxGrid_SetColMinimalAcceptableWidth(wxobj, значение); }
            public цел ColMinimalAcceptableWidth() { return wxGrid_GetColMinimalAcceptableWidth(wxobj); }

            public проц RowMinimalAcceptableHeight(цел значение) { wxGrid_SetRowMinimalAcceptableHeight(wxobj, значение); }
            public цел RowMinimalAcceptableHeight() { return wxGrid_GetRowMinimalAcceptableHeight(wxobj); }

            //-----------------------------------------------------------------------------

            public проц УстCellFont(цел row, цел col, Шрифт fnt)
            {
            wxGrid_SetCellFont(wxobj, row, col, wxObject.SafePtr(fnt));
            }

            //-----------------------------------------------------------------------------

            public проц УстDefaultCellAlignment(цел horiz, цел vert)
            {
            wxGrid_SetDefaultCellAlignment(wxobj, horiz, vert);
            }

            public проц УстCellAlignment(цел row, цел col, цел horiz, цел vert)
            {
            wxGrid_SetCellAlignmentHV(wxobj, row, col, horiz, vert);
            }

            public проц УстCellOverflow(цел row, цел col, бул allow)
            {
            wxGrid_SetCellOverflow(wxobj, row, col, allow);
            }

            public проц УстCellSize(цел row, цел col, цел num_rows, цел num_cols)
            {
            wxGrid_SetCellSize(wxobj, row, col, num_rows, num_cols);
            }

            //-----------------------------------------------------------------------------

            public проц DefaultRenderer(GridCellRenderer значение) { wxGrid_SetDefaultRenderer(wxobj, wxObject.SafePtr(значение)); }
            //get { return wxGrid_GetDefaultRenderer(wxobj); }

            //-----------------------------------------------------------------------------

            public проц УстCellRenderer(цел row, цел col, GridCellRenderer renderer)
            {
            wxGrid_SetCellRenderer(wxobj, row, col, wxObject.SafePtr(renderer));
            }

            //-----------------------------------------------------------------------------
    /+
            public GridCellRenderer GetCellRenderer(цел row, цел col)
            {
                    return cast(GridCellRenderer)НайдиОбъект(wxGrid_GetCellRenderer(wxobj, row, col), &GridCellRenderer.Нов);
            }
    +/
            //-----------------------------------------------------------------------------

            public проц DefaultEditor(GridCellEditor значение) { wxGrid_SetDefaultEditor(wxobj, wxObject.SafePtr(значение)); }/+
            public GridCellEditor DefaultEditor() { return cast(GridCellEditor)НайдиОбъект(wxGrid_GetDefaultEditor(wxobj), &GridCellEditor.Нов); }
    +/
            //-----------------------------------------------------------------------------

            public проц УстCellEditor(цел row, цел col, GridCellEditor editor)
            {
                wxGrid_SetCellEditor(wxobj, row, col, wxObject.SafePtr(editor));
            }

            //-----------------------------------------------------------------------------
    /+
            public GridCellEditor GetCellEditor(цел row, цел col)
            {
                return cast(GridCellEditor)НайдиОбъект(wxGrid_GetCellEditor(wxobj, row, col), &GridCellEditor.Нов);
            }
    +/
            //-----------------------------------------------------------------------------

            public ткст GetCellValue(цел row, цел col)
            {
                return cast(ткст) new wxString(wxGrid_GetCellValue(wxobj, row, col), да);
            }

            //-----------------------------------------------------------------------------

            public проц УстCellValue(цел row, цел col, ткст s)
            {
                wxGrid_SetCellValue(wxobj, row, col, s);
            }

            //-----------------------------------------------------------------------------

            public бул IsReadOnly(цел row, цел col)
            {
                return wxGrid_IsReadOnly(wxobj, row, col);
            }

        public проц УстReadOnly(цел row, цел col)
        {
            УстReadOnly(row, col, да);
        }

            public проц УстReadOnly(цел row, цел col, бул isReadOnly)
            {
            wxGrid_SetReadOnly(wxobj, row, col, isReadOnly);
            }

            //-----------------------------------------------------------------------------

            public проц SelectRow(цел row, бул addToSelected)
            {
            wxGrid_SelectRow(wxobj, row, addToSelected);
            }

            public проц SelectCol(цел col, бул addToSelected)
            {
            wxGrid_SelectCol(wxobj, col, addToSelected);
            }

            //-----------------------------------------------------------------------------

            public проц SelectBlock(цел topRow, цел leftCol, цел bottomRow, цел rightCol, бул addToSelected)
            {
            wxGrid_SelectBlock(wxobj, topRow, leftCol, bottomRow, rightCol, addToSelected);
            }

            //-----------------------------------------------------------------------------

            public проц SelectAll()
            {
            wxGrid_SelectAll(wxobj);
            }

            //-----------------------------------------------------------------------------

            public бул IsSelection() { return wxGrid_IsSelection(wxobj); }

            //-----------------------------------------------------------------------------

            public проц DeselectRow(цел row)
            {
            wxGrid_DeselectRow(wxobj, row);
            }

            public проц DeselectCol(цел col)
            {
            wxGrid_DeselectCol(wxobj, col);
            }

            public проц DeselectCell(цел row, цел col)
            {
            wxGrid_DeselectCell(wxobj, row, col);
            }

            //-----------------------------------------------------------------------------

            public проц ClearSelection()
            {
            wxGrid_ClearSelection(wxobj);
            }

            //-----------------------------------------------------------------------------

            public бул IsInSelection(цел row, цел col)
            {
            return wxGrid_IsInSelection(wxobj, row, col);
            }

            //-----------------------------------------------------------------------------

//! \cond VERSION
version(NOT_IMPLEMENTED){
            public GridCellCoordsArray GetSelectedCells()
        {
            return wxGrid_GetSelectedCells(wxobj);
            }

            //-----------------------------------------------------------------------------

            public GridCellCoordsArray GetSelectionBlockTopLeft()
            {
            return wxGrid_GetSelectionBlockTopLeft(wxobj);
            }

            //-----------------------------------------------------------------------------

            public GridCellCoordsArray GetSelectionBlockBottomRight()
            {
            return wxGrid_GetSelectionBlockBottomRight(wxobj);
            }

            //-----------------------------------------------------------------------------

            public ЦелМассив GetSelectedRows()
            {
            return wxGrid_GetSelectedRows(wxobj);
            }

            //-----------------------------------------------------------------------------

            public ЦелМассив GetSelectedCols()
            {
            return wxGrid_GetSelectedCols(wxobj);
            }
} // version(NOT_IMPLEMENTED)
//! \endcond
            //-----------------------------------------------------------------------------

            public Прямоугольник BlockToDeviceRect(GridCellCoords topLeft, GridCellCoords bottomRight)
            {
            Прямоугольник прям;
            wxGrid_BlockToDeviceRect(wxobj, wxObject.SafePtr(topLeft), wxObject.SafePtr(bottomRight), прям);
            return прям;
            }

            //-----------------------------------------------------------------------------

            public Цвет SelectionBackground() { return new Цвет(wxGrid_GetSelectionBackground(wxobj), да); }
            public проц SelectionBackground(Цвет значение) { wxGrid_SetSelectionBackground(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public Цвет SelectionForeground() { return new Цвет(wxGrid_GetSelectionForeground(wxobj), да); }
            public проц SelectionForeground(Цвет значение) { wxGrid_SetSelectionForeground(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public проц RegisterDataType(ткст typeName, GridCellRenderer renderer, GridCellEditor editor)
            {
            wxGrid_RegisterDataType(wxobj, typeName, wxObject.SafePtr(renderer), wxObject.SafePtr(editor));
            }

            //-----------------------------------------------------------------------------
    /+
            public GridCellEditor GetDefaultEditorForCell(цел row, цел col)
            {
            return cast(GridCellEditor)НайдиОбъект(wxGrid_GetDefaultEditorForCell(wxobj, row, col), &GridCellEditor.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            public GridCellRenderer GetDefaultRendererForCell(цел row, цел col)
            {
                    return cast(GridCellRenderer)НайдиОбъект(wxGrid_GetDefaultRendererForCell(wxobj, row, col), &GridCellRenderer.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            public GridCellEditor GetDefaultEditorForType(ткст typeName)
            {
            return cast(GridCellEditor)НайдиОбъект(wxGrid_GetDefaultEditorForType(wxobj, typeName), &GridCellEditor.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            public GridCellRenderer GetDefaultRendererForType(ткст typeName)
            {
                    return cast(GridCellRenderer)НайдиОбъект(wxGrid_GetDefaultRendererForType(wxobj, typeName), &GridCellRenderer.Нов);
            }
    +/
            //-----------------------------------------------------------------------------

            public проц УстMargins(цел extraWidth, цел extraHeight)
            {
            wxGrid_SetMargins(wxobj, extraWidth, extraHeight);
            }

            //-----------------------------------------------------------------------------

            public Окно GridWindow() { return cast(Окно)НайдиОбъект(wxGrid_GetGridWindow(wxobj)); }

            public Окно GridRowLabelWindow() { return cast(Окно)НайдиОбъект(wxGrid_GetGridRowLabelWindow(wxobj)); }

            public Окно GridColLabelWindow() { return cast(Окно)НайдиОбъект(wxGrid_GetGridColLabelWindow(wxobj)); }

            public Окно GridCornerLabelWindow() { return cast(Окно)НайдиОбъект(wxGrid_GetGridCornerLabelWindow(wxobj)); }

            //-----------------------------------------------------------------------------

            public проц UpdateDimensions()
            {
            wxGrid_UpdateDimensions(wxobj);
            }

            //-----------------------------------------------------------------------------

            public цел Ряды() { return wxGrid_GetRows(wxobj); }

            public цел Колонки() { return wxGrid_GetCols(wxobj); }

            //-----------------------------------------------------------------------------

            public цел CursorRow() { return wxGrid_GetCursorRow(wxobj); }

            public цел CursorColumn() { return wxGrid_GetCursorColumn(wxobj); }

            //-----------------------------------------------------------------------------

            public цел ScrollPosX() { return wxGrid_GetScrollPosX(wxobj); }
            public проц ScrollPosX(цел значение) { wxGrid_SetScrollX(wxobj, значение); }

            public цел ScrollPosY() { return wxGrid_GetScrollPosY(wxobj); }
            public проц ScrollPosY(цел значение) { wxGrid_SetScrollY(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public проц УстColumnWidth(цел col, цел ширь)
            {
            wxGrid_SetColumnWidth(wxobj, col, ширь);
            }

            public цел GetColumnWidth(цел col)
            {
            return wxGrid_GetColumnWidth(wxobj, col);
            }

            //-----------------------------------------------------------------------------

            public проц УстRowHeight(цел row, цел высь)
            {
            wxGrid_SetRowHeight(wxobj, row, высь);
            }

            //-----------------------------------------------------------------------------

            public цел ViewHeight() { return wxGrid_GetViewHeight(wxobj); }

            public цел ViewWidth() { return wxGrid_GetViewWidth(wxobj); }

            //-----------------------------------------------------------------------------

            public проц УстLabelSize(цел orientation, цел рм)
            {
            wxGrid_SetLabelSize(wxobj, orientation, рм);
            }

            public цел GetLabelSize(цел orientation)
            {
            return wxGrid_GetLabelSize(wxobj, orientation);
            }

            //-----------------------------------------------------------------------------

            public проц УстLabelAlignment(цел orientation, цел alignment)
            {
            wxGrid_SetLabelAlignment(wxobj, orientation, alignment);
            }

            public цел GetLabelAlignment(цел orientation, цел alignment)
            {
            return wxGrid_GetLabelAlignment(wxobj, orientation, alignment);
            }

            //-----------------------------------------------------------------------------

            public проц УстLabelValue(цел orientation, ткст val, цел поз)
            {
            wxGrid_SetLabelValue(wxobj, orientation, val, поз);
            }

            public ткст GetLabelValue(цел orientation, цел поз)
            {
            return cast(ткст) new wxString(wxGrid_GetLabelValue(wxobj, orientation, поз), да);
            }

            //-----------------------------------------------------------------------------

            public Шрифт CellTextFont() { return new Шрифт(wxGrid_GetCellTextFontGrid(wxobj)); }
            public проц CellTextFont(Шрифт значение) { wxGrid_SetCellTextFontGrid(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public Шрифт GetCellTextFont(цел row, цел col)
            {
            return new Шрифт(wxGrid_GetCellTextFont(wxobj, row, col));
            }

            public проц УстCellTextFont(Шрифт fnt, цел row, цел col)
            {
            wxGrid_SetCellTextFont(wxobj, wxObject.SafePtr(fnt), row, col);
            }

            //-----------------------------------------------------------------------------

            public проц УстCellTextColour(цел row, цел col, Цвет val)
            {
            wxGrid_SetCellTextColour(wxobj, row, col, wxObject.SafePtr(val));
            }

            //-----------------------------------------------------------------------------

            public проц CellTextColour(Цвет значение) { wxGrid_SetCellTextColourGrid(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public Цвет GetCellTextColour(цел row, цел col)
            {
            return new Цвет(wxGrid_GetCellTextColour(wxobj, row, col), да);
            }

            //-----------------------------------------------------------------------------

            public проц CellBackgroundColour(Цвет значение) { wxGrid_SetCellBackgroundColourGrid(wxobj, wxObject.SafePtr(значение)); }

            //-----------------------------------------------------------------------------

            public проц УстCellBackgroundColour(цел row, цел col, Цвет цвет)
            {
            wxGrid_SetCellBackgroundColour(wxobj, row, col, wxObject.SafePtr(цвет));
            }

            public Цвет GetCellBackgroundColour(цел row, цел col)
            {
            return new Цвет(wxGrid_GetCellBackgroundColour(wxobj, row, col), да);
            }

            //-----------------------------------------------------------------------------

            public бул Editable() { return wxGrid_GetEditable(wxobj); }
            public проц Editable(бул значение) { wxGrid_SetEditable(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public бул EditInPlace() { return wxGrid_GetEditInPlace(wxobj); }

            //-----------------------------------------------------------------------------

            public проц УстCellAlignment(цел alignment, цел row, цел col)
            {
            wxGrid_SetCellAlignment(wxobj, alignment, row, col);
            }

            public проц CellAlignment(цел значение) { wxGrid_SetCellAlignmentGrid(wxobj, значение); }

            //-----------------------------------------------------------------------------

            public проц УстCellBitmap(Битмап битмап, цел row, цел col)
            {
            wxGrid_SetCellBitmap(wxobj, wxObject.SafePtr(битмап), row, col);
            }

            //-----------------------------------------------------------------------------

            public проц DividerPen(Pen значение) { wxGrid_SetDividerPen(wxobj, wxObject.SafePtr(значение)); }
            public Pen DividerPen() { return new Pen(wxGrid_GetDividerPen(wxobj)); }

            //-----------------------------------------------------------------------------

            public цел GetRowHeight(цел row)
            {
            return wxGrid_GetRowHeight(wxobj, row);
            }

        //-----------------------------------------------------------------------------

		public проц CellLeftClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_LEFT_CLICK, ИД, значение, this); }
		public проц CellLeftClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц CellRightClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_RIGHT_CLICK, ИД, значение, this); }
		public проц CellRightClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц CellLeftDoubleClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_LEFT_DCLICK, ИД, значение, this); }
		public проц CellLeftDoubleClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц CellRightDoubleClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_RIGHT_DCLICK, ИД, значение, this); }
		public проц CellRightDoubleClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц LabelLeftClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_LEFT_CLICK, ИД, значение, this); }
		public проц LabelLeftClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц LabelRightClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_RIGHT_CLICK, ИД, значение, this); }
		public проц LabelRightClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц LabelLeftDoubleClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_LEFT_DCLICK, ИД, значение, this); }
		public проц LabelLeftDoubleClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц LabelRightDoubleClick_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_RIGHT_DCLICK, ИД, значение, this); }
		public проц LabelRightDoubleClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц RowSize_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_ROW_SIZE, ИД, значение, this); }
		public проц RowSize_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц ColumnSize_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_COL_SIZE, ИД, значение, this); }
		public проц ColumnSize_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц RangeSelect_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_RANGE_SELECT, ИД, значение, this); }
		public проц RangeSelect_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц CellChange_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_CHANGE, ИД, значение, this); }
		public проц CellChange_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц SelectCell_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_SELECT_CELL, ИД, значение, this); }
		public проц SelectCell_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц EditorShown_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_EDITOR_SHOWN, ИД, значение, this); }
		public проц EditorShown_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц EditorHidden_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_EDITOR_HIDDEN, ИД, значение, this); }
		public проц EditorHidden_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц EditorCreate_Add(ДатчикСобытий значение) { AddCommandListener(Событие.wxEVT_GRID_EDITOR_CREATED, ИД, значение, this); }
		public проц EditorCreate_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

    }

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellCoords_ctor();
	static extern (C) проц   wxGridCellCoords_dtor(ЦелУкз сам);
        static extern (C) цел    wxGridCellCoords_GetRow(ЦелУкз сам);
        static extern (C) проц   wxGridCellCoords_SetRow(ЦелУкз сам, цел n);
        static extern (C) цел    wxGridCellCoords_GetCol(ЦелУкз сам);
        static extern (C) проц   wxGridCellCoords_SetCol(ЦелУкз сам, цел n);
        static extern (C) проц   wxGridCellCoords_Set(ЦелУкз сам, цел row, цел col);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias GridCellCoords wxGridCellCoords;
    public class GridCellCoords : wxObject
    {
        public this(ЦелУкз wxobj)
	{
		super(wxobj);
	}

	private this(ЦелУкз wxobj, бул memOwn)
	{
		super(wxobj);
		this.memOwn = memOwn;
	}

        public this()
            { this(wxGridCellCoords_ctor(), да); }

        public this(цел r, цел c)
        {
        	this();
            Уст(r, c);
        }

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellCoords_dtor(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Row(цел значение) { wxGridCellCoords_SetRow(wxobj, значение); }
        public цел Row() { return wxGridCellCoords_GetRow(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Col(цел значение) { wxGridCellCoords_SetCol(wxobj, значение); }
        public цел Col() { return wxGridCellCoords_GetCol(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Уст(цел row, цел col)
        {
            wxGridCellCoords_Set(wxobj, row, col);
        }
    }

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellAttr_ctor(ЦелУкз colText, ЦелУкз colBack, ЦелУкз шрифт, цел hAlign, цел vAlign);
        static extern (C) ЦелУкз wxGridCellAttr_ctor2();
        static extern (C) ЦелУкз wxGridCellAttr_ctor3(ЦелУкз attrDefault);
        static extern (C) ЦелУкз wxGridCellAttr_Clone(ЦелУкз сам);
        static extern (C) проц   wxGridCellAttr_MergeWith(ЦелУкз сам, ЦелУкз mergefrom);
        static extern (C) проц   wxGridCellAttr_IncRef(ЦелУкз сам);
        static extern (C) проц   wxGridCellAttr_DecRef(ЦелУкз сам);
        static extern (C) проц   wxGridCellAttr_SetTextColour(ЦелУкз сам, ЦелУкз colText);
        static extern (C) проц   wxGridCellAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз colBack);
        static extern (C) проц   wxGridCellAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
        static extern (C) проц   wxGridCellAttr_SetAlignment(ЦелУкз сам, цел hAlign, цел vAlign);
        static extern (C) проц   wxGridCellAttr_SetSize(ЦелУкз сам, цел num_rows, цел num_cols);
        static extern (C) проц   wxGridCellAttr_SetOverflow(ЦелУкз сам, бул allow);
        static extern (C) проц   wxGridCellAttr_SetReadOnly(ЦелУкз сам, бул isReadOnly);
        static extern (C) проц   wxGridCellAttr_SetRenderer(ЦелУкз сам, ЦелУкз renderer);
        static extern (C) проц   wxGridCellAttr_SetEditor(ЦелУкз сам, ЦелУкз editor);
        static extern (C) бул   wxGridCellAttr_HasTextColour(ЦелУкз сам);
        static extern (C) бул   wxGridCellAttr_HasBackgroundColour(ЦелУкз сам);
        static extern (C) бул   wxGridCellAttr_HasFont(ЦелУкз сам);
        static extern (C) бул   wxGridCellAttr_HasAlignment(ЦелУкз сам);
        static extern (C) бул   wxGridCellAttr_HasRenderer(ЦелУкз сам);
        static extern (C) бул   wxGridCellAttr_HasEditor(ЦелУкз сам);
        static extern (C) бул   wxGridCellAttr_HasReadWriteMode(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellAttr_GetTextColour(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellAttr_GetBackgroundColour(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellAttr_GetFont(ЦелУкз сам);
        static extern (C) проц   wxGridCellAttr_GetAlignment(ЦелУкз сам, inout цел hAlign, inout цел vAlign);
        static extern (C) проц   wxGridCellAttr_GetSize(ЦелУкз сам, inout цел num_rows, inout цел num_cols);
        static extern (C) бул   wxGridCellAttr_GetOverflow(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridCellAttr_GetRenderer(ЦелУкз сам, ЦелУкз grid, цел row, цел col);
        static extern (C) ЦелУкз wxGridCellAttr_GetEditor(ЦелУкз сам, ЦелУкз grid, цел row, цел col);
        static extern (C) бул   wxGridCellAttr_IsReadOnly(ЦелУкз сам);
        static extern (C) проц   wxGridCellAttr_SetDefAttr(ЦелУкз сам, ЦелУкз defAttr);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias GridCellAttr wxGridCellAttr;
    public class GridCellAttr : wxObject
    {
        public enum AttrKind
        {
            Any, Default, Cell, Row, Col, Merged
        }

        //-----------------------------------------------------------------------------

        public this(ЦелУкз wxobj)
	{
		super(wxobj);
	}

	private this(ЦелУкз wxobj, бул memOwn)
	{
		super(wxobj);
		this.memOwn = memOwn;
	}

        public this()
            { this(wxGridCellAttr_ctor2(), да); }

        public this(GridCellAttr attrDefault)
            { this(wxGridCellAttr_ctor3(wxObject.SafePtr(attrDefault)), да); }

        public this(Цвет colText, Цвет colBack, Шрифт шрифт, цел hAlign, цел vAlign)
            { this(wxGridCellAttr_ctor(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт), hAlign, vAlign), да); }

	public static wxObject Нов(ЦелУкз ptr) { return new GridCellAttr(ptr); }
	//---------------------------------------------------------------------

	override protected проц dtor() {}

        //-----------------------------------------------------------------------------

        public GridCellAttr Clone()
        {
            return new GridCellAttr(wxGridCellAttr_Clone(wxobj));
        }

        //-----------------------------------------------------------------------------

        public проц MergeWith(GridCellAttr mergefrom)
        {
            wxGridCellAttr_MergeWith(wxobj, wxObject.SafePtr(mergefrom));
        }

        //-----------------------------------------------------------------------------

        public проц IncRef()
        {
            wxGridCellAttr_IncRef(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц DecRef()
        {
            wxGridCellAttr_DecRef(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц цветТекста(Цвет значение) { wxGridCellAttr_SetTextColour(wxobj, wxObject.SafePtr(значение)); }
        public Цвет цветТекста() { return new Цвет(wxGridCellAttr_GetTextColour(wxobj), да); }

        //-----------------------------------------------------------------------------

        public проц цветФона(Цвет значение) { wxGridCellAttr_SetBackgroundColour(wxobj, wxObject.SafePtr(значение)); }
        public Цвет цветФона() { return new Цвет(wxGridCellAttr_GetBackgroundColour(wxobj), да); }

        //-----------------------------------------------------------------------------

        public проц шрифт(Шрифт значение) { wxGridCellAttr_SetFont(wxobj, wxObject.SafePtr(значение)); }
        public Шрифт шрифт() { return new Шрифт(wxGridCellAttr_GetFont(wxobj)); }

        //-----------------------------------------------------------------------------

        public проц УстAlignment(цел hAlign, цел vAlign)
        {
            wxGridCellAttr_SetAlignment(wxobj, hAlign, vAlign);
        }

        public проц GetAlignment(inout цел hAlign, inout цел vAlign)
        {
            wxGridCellAttr_GetAlignment(wxobj, hAlign, vAlign);
        }

        public проц устРазм(цел num_rows, цел num_cols)
        {
            wxGridCellAttr_SetSize(wxobj, num_rows, num_cols);
        }

        public проц GetSize(inout цел num_rows, inout цел num_cols)
        {
            wxGridCellAttr_GetSize(wxobj, num_rows, num_cols);
        }

        //-----------------------------------------------------------------------------

        public проц Overflow(бул значение) { wxGridCellAttr_SetOverflow(wxobj, значение); }
        public бул Overflow() { return wxGridCellAttr_GetOverflow(wxobj); }

        //-----------------------------------------------------------------------------

        public проц ReadOnly(бул значение) { wxGridCellAttr_SetReadOnly(wxobj, значение); }
        public бул ReadOnly() { return wxGridCellAttr_IsReadOnly(wxobj); }

        //-----------------------------------------------------------------------------

        public проц УстRenderer(GridCellRenderer renderer)
        {
            wxGridCellAttr_SetRenderer(wxobj, wxObject.SafePtr(renderer));
        }

        //-----------------------------------------------------------------------------

        public проц Editor(GridCellEditor значение) { wxGridCellAttr_SetEditor(wxobj, wxObject.SafePtr(значение)); }
        /+
        public GridCellEditor GetEditor(Grid grid, цел row, цел col)
        {
            return cast(GridCellEditor)НайдиОбъект(wxGridCellAttr_GetEditor(wxobj, wxObject.SafePtr(grid), row, col), &GridCellEditor.Нов);
        }
        +/
        //-----------------------------------------------------------------------------

        public бул ЕстьЦветТекста() { return wxGridCellAttr_HasTextColour(wxobj); }

        public бул ЕстьЦветФона() { return wxGridCellAttr_HasBackgroundColour(wxobj); }

        public бул ЕстьШрифт() { return wxGridCellAttr_HasFont(wxobj); }

        public бул HasAlignment() { return wxGridCellAttr_HasAlignment(wxobj); }

        public бул HasRenderer() { return wxGridCellAttr_HasRenderer(wxobj); }

        public бул HasEditor() { return wxGridCellAttr_HasEditor(wxobj); }

        public бул HasReadWriteMode() { return wxGridCellAttr_HasReadWriteMode(wxobj); }

        //-----------------------------------------------------------------------------
        /+
        public GridCellRenderer GetRenderer(Grid grid, цел row, цел col)
        {
            return cast(GridCellRenderer)НайдиОбъект(wxGridCellAttr_GetRenderer(wxobj, wxObject.SafePtr(grid), row, col), &GridCellRenderer.Нов);
        }
        +/
        //-----------------------------------------------------------------------------

        public проц DefAttr(GridCellAttr значение) { wxGridCellAttr_SetDefAttr(wxobj, wxObject.SafePtr(значение)); }
    }

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridSizeEvent_ctor();
        static extern (C) ЦелУкз wxGridSizeEvent_ctorParam(цел ид, цел тип, ЦелУкз объ, цел rowOrCol, цел x, цел y, бул control, бул shift, бул alt, бул meta);
        static extern (C) цел    wxGridSizeEvent_GetRowOrCol(ЦелУкз сам);
        static extern (C) проц   wxGridSizeEvent_GetPosition(ЦелУкз сам, inout Точка тчк);
        static extern (C) бул   wxGridSizeEvent_ControlDown(ЦелУкз сам);
        static extern (C) бул   wxGridSizeEvent_MetaDown(ЦелУкз сам);
        static extern (C) бул   wxGridSizeEvent_ShiftDown(ЦелУкз сам);
        static extern (C) бул   wxGridSizeEvent_AltDown(ЦелУкз сам);
        static extern (C) проц wxGridSizeEvent_Veto(ЦелУкз сам);
        static extern (C) проц wxGridSizeEvent_Allow(ЦелУкз сам);
        static extern (C) бул wxGridSizeEvent_IsAllowed(ЦелУкз сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias GridSizeEvent wxGridSizeEvent;
    public class GridSizeEvent : Событие
    {
        public this(ЦелУкз wxobj)
            { super(wxobj); }

        public this()
            { this(wxGridSizeEvent_ctor()); }

        public this(цел ид, цел тип, wxObject объ, цел rowOrCol, цел x, цел y, бул control, бул shift, бул alt, бул meta)
            { this(wxGridSizeEvent_ctorParam(ид, тип, wxObject.SafePtr(объ), rowOrCol, x, y, control, shift, alt, meta)); }

        //-----------------------------------------------------------------------------

        public цел RowOrCol() { return wxGridSizeEvent_GetRowOrCol(wxobj); }

        //-----------------------------------------------------------------------------

        public Точка Позиция() {
                Точка тчк;
                wxGridSizeEvent_GetPosition(wxobj, тчк);
                return тчк;
            }

        //-----------------------------------------------------------------------------

        public бул ControlDown() { return wxGridSizeEvent_ControlDown(wxobj); }

        public бул MetaDown() { return wxGridSizeEvent_MetaDown(wxobj); }

        public бул ShiftDown() { return wxGridSizeEvent_ShiftDown(wxobj); }

        public бул AltDown() { return wxGridSizeEvent_AltDown(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Veto()
        {
            wxGridSizeEvent_Veto(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Allow()
        {
            wxGridSizeEvent_Allow(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул Allowed() { return wxGridSizeEvent_IsAllowed(wxobj); }

	private static Событие Нов(ЦелУкз объ) { return new GridSizeEvent(объ); }

	static this()
	{
			wxEVT_GRID_ROW_SIZE = wxEvent_EVT_GRID_ROW_SIZE();
			wxEVT_GRID_COL_SIZE = wxEvent_EVT_GRID_COL_SIZE();

			ДобавьТипСоб(wxEVT_GRID_ROW_SIZE,                   &GridSizeEvent.Нов);
			ДобавьТипСоб(wxEVT_GRID_COL_SIZE,                   &GridSizeEvent.Нов);
	}
    }

    //-----------------------------------------------------------------------------

	extern (C) {
        alias проц function(GridCellRenderer объ, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, Прямоугольник прям, цел row, цел col, бул isSelected) Virtual_Draw;
        alias Размер function(GridCellRenderer объ, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col) Virtual_GetBestSize;
        alias ЦелУкз function(GridCellRenderer объ) Virtual_RendererClone;
	}

        //-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellRenderer_ctor();
	static extern (C) проц wxGridCellRenderer_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellRenderer_RegisterVirtual(ЦелУкз сам, GridCellRenderer объ, Virtual_Draw draw, Virtual_GetBestSize getBestSize, Virtual_RendererClone clone);
        //! \endcond

	//-----------------------------------------------------------------------------

    public abstract class GridCellRenderer : GridCellWorker
    {
        public this()
        {
        	this(wxGridCellRenderer_ctor(), да);

            wxGridCellRenderer_RegisterVirtual(wxobj, this,
                &staticDoDraw,
                &staticDoGetBestSize,
                &staticDoClone);
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

	//public static wxObject Нов(ЦелУкз ptr) { return new GridCellRenderer(ptr);}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellRenderer_dtor(wxobj); }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticDoDraw(GridCellRenderer объ, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            //if ( НайдиОбъект(grid) === null ) Console.WriteLine("grid == null"); else Console.WriteLine("grid found");
            объ.Draw(cast(Grid)НайдиОбъект(grid, &Grid.Нов), cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), cast(DC)wxObject.НайдиОбъект(dc), прям, row, col, isSelected);
        }

        public abstract проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);

        //-----------------------------------------------------------------------------

        static extern (C) private Размер staticDoGetBestSize(GridCellRenderer объ, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc,  цел row, цел col)
        {
            return объ.GetBestSize(cast(Grid)НайдиОбъект(grid, &Grid.Нов), cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), cast(DC)wxObject.НайдиОбъект(dc, &DC.Нов), row, col);

        }

        public abstract Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);

        //-----------------------------------------------------------------------------

        static extern (C) private ЦелУкз staticDoClone(GridCellRenderer объ)
        {
            return wxObject.SafePtr(объ.Clone());
        }

        public abstract GridCellRenderer Clone();
    }

    //-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellStringRenderer_ctor();
	static extern (C) проц wxGridCellStringRenderer_dtor(ЦелУкз сам);
	static extern (C) проц wxGridCellStringRenderer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellStringRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellStringRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
        static extern (C) ЦелУкз wxGridCellStringRenderer_Clone(ЦелУкз сам);
        //! \endcond

    alias GridCellStringRenderer wxGridCellStringRenderer;
    public class GridCellStringRenderer : GridCellRenderer
    {
        public this()
	{
		this(wxGridCellStringRenderer_ctor(), да);
		wxGridCellStringRenderer_RegisterDisposable(wxobj, &VirtualDispose);
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

	override protected проц dtor() { wxGridCellStringRenderer_dtor(wxobj); }

	//---------------------------------------------------------------------

        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellStringRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }

        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер Размер;
            wxGridCellStringRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
            return Размер;
        }

        public override GridCellRenderer Clone()
        {
//            return cast(GridCellRenderer)НайдиОбъект(wxGridCellStringRenderer_Clone(wxobj), &GridCellRenderer.Нов);
              return new GridCellStringRenderer(wxGridCellStringRenderer_Clone(wxobj));
        }
    }

    //-----------------------------------------------------------------------------

        static extern (C) ЦелУкз wxGridCellNumberRenderer_ctor();
	static extern (C) проц wxGridCellNumberRenderer_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellNumberRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellNumberRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
        static extern (C) ЦелУкз wxGridCellNumberRenderer_Clone(ЦелУкз сам);

    alias GridCellNumberRenderer wxGridCellNumberRenderer;
    public class GridCellNumberRenderer : GridCellStringRenderer
    {
        public this()
            { this(wxGridCellNumberRenderer_ctor(), да); }

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

	override protected проц dtor() { wxGridCellNumberRenderer_dtor(wxobj); }

        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellNumberRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }

        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер Размер;
            wxGridCellNumberRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
            return Размер;
        }

        public override GridCellRenderer Clone()
        {
        //    return cast(GridCellRenderer)НайдиОбъект(wxGridCellNumberRenderer_Clone(wxobj), &GridCellRenderer.Нов);
            return new GridCellNumberRenderer(wxGridCellNumberRenderer_Clone(wxobj));
        }
    }

    //-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellFloatRenderer_ctor(цел ширь, цел precision);
	static extern (C) проц wxGridCellFloatRenderer_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellFloatRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellFloatRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
        static extern (C) ЦелУкз wxGridCellFloatRenderer_Clone(ЦелУкз сам);
        static extern (C) цел wxGridCellFloatRenderer_GetWidth(ЦелУкз сам);
        static extern (C) проц wxGridCellFloatRenderer_SetWidth(ЦелУкз сам, цел ширь);
        static extern (C) цел wxGridCellFloatRenderer_GetPrecision(ЦелУкз сам);
        static extern (C) проц wxGridCellFloatRenderer_SetPrecision(ЦелУкз сам, цел precision);
        static extern (C) проц wxGridCellFloatRenderer_SetParameters(ЦелУкз сам, ткст parameter);
        //! \endcond

    alias GridCellFloatRenderer wxGridCellFloatRenderer;
    public class GridCellFloatRenderer : GridCellStringRenderer
    {
        public this()
            { this(-1, -1); }

        public this(цел ширь)
            { this(ширь, -1); }

        public this(цел ширь, цел precision)
            { this(wxGridCellFloatRenderer_ctor(ширь, precision), да); }

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

	override protected проц dtor() { wxGridCellFloatRenderer_dtor(wxobj); }

        public override проц УстParameters(ткст parameter)
        {
            wxGridCellFloatRenderer_SetParameters(wxobj, parameter);
        }

        public цел Ширь() { return wxGridCellFloatRenderer_GetWidth(wxobj); }
        public проц Ширь(цел значение) { wxGridCellFloatRenderer_SetWidth(wxobj,значение); }

        public цел Precision() { return wxGridCellFloatRenderer_GetPrecision(wxobj); }
        public проц Precision(цел значение) { wxGridCellFloatRenderer_SetPrecision(wxobj, значение); }

        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellFloatRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }

        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер Размер;
            wxGridCellFloatRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
            return Размер;
        }

        public override GridCellRenderer Clone()
        {
//            return cast(GridCellRenderer)НайдиОбъект(wxGridCellFloatRenderer_Clone(wxobj), &GridCellRenderer.Нов);
            return new GridCellFloatRenderer(wxGridCellFloatRenderer_Clone(wxobj));
        }
    }

    //-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellBoolRenderer_ctor();
	static extern (C) проц wxGridCellBoolRenderer_dtor(ЦелУкз сам);
	static extern (C) проц wxGridCellBoolRenderer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellBoolRenderer_Draw(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellBoolRenderer_GetBestSize(ЦелУкз сам, ЦелУкз grid, ЦелУкз attr, ЦелУкз dc, цел row, цел col, out Размер Размер);
        static extern (C) ЦелУкз wxGridCellBoolRenderer_Clone(ЦелУкз сам);
        //! \endcond

    alias GridCellBoolRenderer wxGridCellBoolRenderer;
    public class GridCellBoolRenderer : GridCellRenderer
    {
        public this()
	{
		this(wxGridCellBoolRenderer_ctor(), да);
		wxGridCellBoolRenderer_RegisterDisposable(wxobj, &VirtualDispose);
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

	override protected проц dtor() { wxGridCellBoolRenderer_dtor(wxobj); }

        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellBoolRenderer_Draw(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }

        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер Размер;
            wxGridCellBoolRenderer_GetBestSize(wxobj, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, Размер);
            return Размер;
        }

        public override GridCellRenderer Clone()
        {
//            return cast(GridCellRenderer)НайдиОбъект(wxGridCellBoolRenderer_Clone(wxobj), &GridCellRenderer.Нов);
            return new GridCellBoolRenderer(wxGridCellBoolRenderer_Clone(wxobj));
        }
    }

    //-----------------------------------------------------------------------------

        extern (C) {
        alias цел  function(GridTableBase объ) Virtual_GetNumberRows;
        alias цел  function(GridTableBase объ) Virtual_GetNumberCols;
        alias бул function(GridTableBase объ, цел row, цел col) Virtual_IsEmptyCell;
        alias ткст function(GridTableBase объ, цел row, цел col) Virtual_GetValue_gt;
        alias проц function(GridTableBase объ, цел row, цел col, ЦелУкз val) Virtual_SetValue;
        alias бул function(GridTableBase объ, цел row, цел col, ЦелУкз typeName) Virtual_CanGetValueAs;
        alias цел  function(GridTableBase объ, цел row, цел col) Virtual_GetValueAsLong;
        alias double function(GridTableBase объ, цел row, цел col) Virtual_GetValueAsDouble;
        alias проц function(GridTableBase объ, цел row, цел col, цел значение) Virtual_SetValueAsLong;
        alias проц function(GridTableBase объ, цел row, цел col, double значение) Virtual_SetValueAsDouble;
        alias проц function(GridTableBase объ, цел row, цел col, бул значение) Virtual_SetValueAsBool;
        alias ЦелУкз function(GridTableBase объ, цел row, цел col, ЦелУкз typeName) Virtual_GetValueAsCustom;
        alias проц function(GridTableBase объ, цел row, цел col, ЦелУкз typeName, ЦелУкз значение) Virtual_SetValueAsCustom;
        alias ткст function(GridTableBase объ, цел col) Virtual_GetColLabelValue;
        alias проц function(GridTableBase объ, ЦелУкз grid) Virtual_SetView;
        alias ЦелУкз function(GridTableBase объ) Virtual_GetView;
        alias проц function(GridTableBase объ) Virtual_Clear;
        alias бул function(GridTableBase объ, цел поз, цел numRows) Virtual_InsertRows;
        alias бул function(GridTableBase объ, цел numRows) Virtual_AppendRows;
        alias проц function(GridTableBase объ, цел row, ЦелУкз val) Virtual_SetRowLabelValue;
        alias проц function(GridTableBase объ, ЦелУкз attrProvider) Virtual_SetAttrProvider;
        alias ЦелУкз function(GridTableBase объ) Virtual_GetAttrProvider;
        alias бул function(GridTableBase объ) Virtual_CanHaveAttributes;
        alias ЦелУкз function(GridTableBase объ, цел row, цел col, цел kind) Virtual_GetAttr_gt;
        alias проц function(GridTableBase объ, ЦелУкз attr, цел row, цел col) Virtual_SetAttr_gt;
        alias проц function(GridTableBase объ, ЦелУкз attr, цел row) Virtual_SetRowAttr_gt;
        }

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridTableBase_ctor();
        static extern (C) проц wxGridTableBase_RegisterVirtual(ЦелУкз сам, GridTableBase объ,
            Virtual_GetNumberRows getNumberRows,
            Virtual_GetNumberCols getNumberCols,
            Virtual_IsEmptyCell isEmptyCell,
            Virtual_GetValue_gt getValue,
            Virtual_SetValue setValue,
            Virtual_GetValue_gt getTypeName,
            Virtual_CanGetValueAs canGetValueAs,
            Virtual_CanGetValueAs canУстValueAs,
            Virtual_GetValueAsLong getValueAsLong,
            Virtual_GetValueAsDouble getValueAsDouble,
            Virtual_IsEmptyCell getValueAsBool,
            Virtual_SetValueAsLong setValueAsLong,
            Virtual_SetValueAsDouble setValueAsDouble,
            Virtual_SetValueAsBool setValueAsBool,
            Virtual_GetValueAsCustom getValueAsCustom,
            Virtual_SetValueAsCustom setValueAsCustom,
            Virtual_SetView setView,
            Virtual_GetView getView,
            Virtual_Clear clear,
            Virtual_InsertRows insertRows,
            Virtual_AppendRows appendRows,
            Virtual_InsertRows deleteRows,
            Virtual_InsertRows insertCols,
            Virtual_AppendRows appendCols,
            Virtual_InsertRows deleteCols,
            Virtual_GetColLabelValue getRowLabelValue,
            Virtual_GetColLabelValue getColLabelValue,
            Virtual_SetRowLabelValue setRowLabelValue,
            Virtual_SetRowLabelValue setColLabelValue,
            Virtual_SetAttrProvider setAttrProvider,
            Virtual_GetAttrProvider getAttrProvider,
            Virtual_CanHaveAttributes canHaveAttributes,
            Virtual_GetAttr_gt getAttr,
            Virtual_SetAttr_gt setAttr,
            Virtual_SetRowAttr_gt setRowAttr,
            Virtual_SetRowAttr_gt setColAttr);

        static extern (C) цел    wxGridTableBase_GetNumberRows(ЦелУкз сам);
        static extern (C) цел    wxGridTableBase_GetNumberCols(ЦелУкз сам);
        static extern (C) бул   wxGridTableBase_IsEmptyCell(ЦелУкз сам, цел row, цел col);
        static extern (C) ЦелУкз wxGridTableBase_GetValue(ЦелУкз сам, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetValue(ЦелУкз сам, цел row, цел col, ЦелУкз val);
        static extern (C) ЦелУкз wxGridTableBase_GetTypeName(ЦелУкз сам, цел row, цел col);
        static extern (C) бул   wxGridTableBase_CanGetValueAs(ЦелУкз сам, цел row, цел col, ткст typeName);
        static extern (C) бул   wxGridTableBase_CanУстValueAs(ЦелУкз сам, цел row, цел col, ткст typeName);
        static extern (C) цел   wxGridTableBase_GetValueAsLong(ЦелУкз сам, цел row, цел col);
        static extern (C) double wxGridTableBase_GetValueAsDouble(ЦелУкз сам, цел row, цел col);
        static extern (C) бул   wxGridTableBase_GetValueAsBool(ЦелУкз сам, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetValueAsLong(ЦелУкз сам, цел row, цел col, цел val);
        static extern (C) проц   wxGridTableBase_SetValueAsDouble(ЦелУкз сам, цел row, цел col, double val);
        static extern (C) проц   wxGridTableBase_SetValueAsBool(ЦелУкз сам, цел row, цел col, бул val);
        static extern (C) ЦелУкз wxGridTableBase_GetValueAsCustom(ЦелУкз сам, цел row, цел col, ткст typeName);
        static extern (C) проц   wxGridTableBase_SetValueAsCustom(ЦелУкз сам, цел row, цел col, ткст typeName, ЦелУкз val);
        static extern (C) проц   wxGridTableBase_SetView(ЦелУкз сам, ЦелУкз grid);
        static extern (C) ЦелУкз wxGridTableBase_GetView(ЦелУкз сам);
        static extern (C) проц   wxGridTableBase_Clear(ЦелУкз сам);
        static extern (C) бул   wxGridTableBase_InsertRows(ЦелУкз сам, цел поз, цел numRows);
        static extern (C) бул   wxGridTableBase_AppendRows(ЦелУкз сам, цел numRows);
        static extern (C) бул   wxGridTableBase_DeleteRows(ЦелУкз сам, цел поз, цел numRows);
        static extern (C) бул   wxGridTableBase_InsertCols(ЦелУкз сам, цел поз, цел numCols);
        static extern (C) бул   wxGridTableBase_AppendCols(ЦелУкз сам, цел numCols);
        static extern (C) бул   wxGridTableBase_DeleteCols(ЦелУкз сам, цел поз, цел numCols);
        static extern (C) ЦелУкз wxGridTableBase_GetRowLabelValue(ЦелУкз сам, цел row);
        static extern (C) ЦелУкз wxGridTableBase_GetColLabelValue(ЦелУкз сам, цел col);
        static extern (C) проц   wxGridTableBase_SetRowLabelValue(ЦелУкз сам, цел row, ткст val);
        static extern (C) проц   wxGridTableBase_SetColLabelValue(ЦелУкз сам, цел col, ткст val);
        static extern (C) проц   wxGridTableBase_SetAttrProvider(ЦелУкз сам, ЦелУкз attrProvider);
        static extern (C) ЦелУкз wxGridTableBase_GetAttrProvider(ЦелУкз сам);
        static extern (C) бул   wxGridTableBase_CanHaveAttributes(ЦелУкз сам);
        static extern (C) ЦелУкз wxGridTableBase_GetAttr(ЦелУкз сам, цел row, цел col, цел kind);
        static extern (C) проц   wxGridTableBase_SetAttr(ЦелУкз сам, ЦелУкз attr, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetRowAttr(ЦелУкз сам, ЦелУкз attr, цел row);
        static extern (C) проц   wxGridTableBase_SetColAttr(ЦелУкз сам, ЦелУкз attr, цел col);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class GridTableBase : wxObject//ClientData
    {
        public this()
        {
        	this(wxGridTableBase_ctor());
            wxGridTableBase_RegisterVirtual(wxobj, this,
                &staticGetNumberRows,
                &staticGetNumberCols,
                &staticIsEmptyCell,
                &staticGetValue,
                &staticDoУстValue,
                &staticGetTypeName,
                &staticDoCanGetValueAs,
                &staticDoCanУстValueAs,
                &staticGetValueAsLong,
                &staticGetValueAsDouble,
                &staticGetValueAsBool,
                &staticУстValueAsLong,
                &staticУстValueAsDouble,
                &staticУстValueAsBool,
                &staticDoGetValueAsCustom,
                &staticDoУстValueAsCustom,
                &staticDoУстView,
                &staticDoGetView,
                &staticClear,
                &staticInsertRows,
                &staticAppendRows,
                &staticDeleteRows,
                &staticInsertCols,
                &staticAppendCols,
                &staticDeleteCols,
                &staticGetRowLabelValue,
                &staticGetColLabelValue,
                &staticDoУстRowLabelValue,
                &staticDoУстColLabelValue,
                &staticDoУстAttrProvider,
                &staticDoGetAttrProvider,
                &staticCanHaveAttributes,
                &staticDoGetAttr,
                &staticDoУстAttr,
                &staticDoУстRowAttr,
                &staticDoУстColAttr
            );
        }

        public this(ЦелУкз wxobj)
            { super(wxobj); }

        //public static wxObject Нов(ЦелУкз ptr) { return new GridTableBase(ptr); }
        //-----------------------------------------------------------------------------

        static extern (C) private цел staticGetNumberRows(GridTableBase объ)
        {
            return объ.GetNumberRows();
        }
        public abstract цел GetNumberRows();
//        {
//            return wxGridTableBase_GetNumberRows(wxobj);
//        }

        static extern (C) private цел staticGetNumberCols(GridTableBase объ)
        {
            return объ.GetNumberCols();
        }
        public abstract цел GetNumberCols();
//        {
//            return wxGridTableBase_GetNumberCols(wxobj);
//        }

        //-----------------------------------------------------------------------------

        static extern (C) private бул staticIsEmptyCell(GridTableBase объ, цел row, цел col)
        {
            return объ.IsEmptyCell(row,col);
        }
        public abstract бул IsEmptyCell(цел row, цел col);
//        {
//            return wxGridTableBase_IsEmptyCell(wxobj, row, col);
//        }

        //-----------------------------------------------------------------------------

        static extern (C) private ткст staticGetValue(GridTableBase объ, цел row, цел col)
        {
            return объ.GetValue(row,col);
        }
        public abstract ткст GetValue(цел row, цел col);
//        {
//            return cast(ткст) new wxString(wxGridTableBase_GetValue(wxobj, row, col), да);
//        }

        static extern (C) private проц staticDoУстValue(GridTableBase объ, цел row, цел col, ЦелУкз val)
        {
            объ.УстValue(row, col, cast(ткст) new wxString(val));
        }

        public abstract проц УстValue(цел row, цел col, ткст val);
//        {
//            wxGridTableBase_SetValue(wxobj, row, col, val);
//        }

        //-----------------------------------------------------------------------------

        static extern (C) private ткст staticGetTypeName(GridTableBase объ, цел row, цел col)
        {
            return объ.GetTypeName(row,col);
        }
        public  ткст GetTypeName(цел row, цел col)
        {
            return cast(ткст) new wxString(wxGridTableBase_GetTypeName(wxobj, row, col), да);
        }

        static extern (C) private бул staticDoCanGetValueAs(GridTableBase объ, цел row, цел col, ЦелУкз typeName)
        {
            return объ.CanGetValueAs(row, col, cast(ткст) new wxString(typeName));
        }

        public  бул CanGetValueAs(цел row, цел col, ткст typeName)
        {
            return wxGridTableBase_CanGetValueAs(wxobj, row, col, typeName);
        }

        static extern (C) private бул staticDoCanУстValueAs(GridTableBase объ, цел row, цел col, ЦелУкз typeName)
        {
            return объ.CanУстValueAs(row, col, cast(ткст) new wxString(typeName));
        }

        public  бул CanУстValueAs(цел row, цел col, ткст typeName)
        {
            return wxGridTableBase_CanУстValueAs(wxobj, row, col, typeName);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private цел staticGetValueAsLong(GridTableBase объ, цел row, цел col)
	{
	    return объ.GetValueAsLong(row,col);
	}
        public  цел GetValueAsLong(цел row, цел col)
        {
            return wxGridTableBase_GetValueAsLong(wxobj, row, col);
        }

        static extern (C) private double staticGetValueAsDouble(GridTableBase объ, цел row, цел col)
	{
	    return объ.GetValueAsDouble(row,col);
	}
        public  double GetValueAsDouble(цел row, цел col)
        {
            return wxGridTableBase_GetValueAsDouble(wxobj, row, col);
        }

        static extern (C) private бул staticGetValueAsBool(GridTableBase объ, цел row, цел col)
	{
	    return объ.GetValueAsBool(row,col);
	}
        public  бул GetValueAsBool(цел row, цел col)
        {
            return wxGridTableBase_GetValueAsBool(wxobj, row, col);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticУстValueAsLong(GridTableBase объ, цел row, цел col, цел val)
	{
	    return объ.УстValueAsLong(row,col,val);
	}
        public  проц УстValueAsLong(цел row, цел col, цел val)
        {
            wxGridTableBase_SetValueAsLong(wxobj, row, col, val);
        }

        static extern (C) private проц staticУстValueAsDouble(GridTableBase объ, цел row, цел col, double val)
	{
	    return объ.УстValueAsDouble(row,col,val);
	}
        public  проц УстValueAsDouble(цел row, цел col, double val)
        {
            wxGridTableBase_SetValueAsDouble(wxobj, row, col, val);
        }

        static extern (C) private проц staticУстValueAsBool(GridTableBase объ, цел row, цел col, бул val)
	{
	    return объ.УстValueAsBool(row,col,val);
	}
        public  проц УстValueAsBool(цел row, цел col, бул val)
        {
            wxGridTableBase_SetValueAsBool(wxobj, row, col, val);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private ЦелУкз staticDoGetValueAsCustom(GridTableBase объ, цел row, цел col, ЦелУкз typeName)
        {
            return wxObject.SafePtr(объ.GetValueAsCustom(row, col, cast(ткст) new wxString(typeName)));
        }

        public  wxObject GetValueAsCustom(цел row, цел col, ткст typeName)
        {
            return НайдиОбъект(wxGridTableBase_GetValueAsCustom(wxobj, row, col, typeName));
        }

        static extern (C) private проц staticDoУстValueAsCustom(GridTableBase объ, цел row, цел col, ЦелУкз typeName, ЦелУкз val)
        {
            объ.УстValueAsCustom(row, col, cast(ткст) new wxString(typeName), НайдиОбъект(val));
        }

        public  проц УстValueAsCustom(цел row, цел col, ткст typeName, wxObject val)
        {
            wxGridTableBase_SetValueAsCustom(wxobj, row, col, typeName, wxObject.SafePtr(val));
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticDoУстView(GridTableBase объ, ЦелУкз grid)
        {
            объ.УстView(cast(Grid)НайдиОбъект(grid, &Grid.Нов));
        }

        public  проц УстView(Grid grid)
        {
            wxGridTableBase_SetView(wxobj, wxObject.SafePtr(grid));
        }

        static extern (C) private ЦелУкз staticDoGetView(GridTableBase объ)
        {
            return wxObject.SafePtr(объ.GetView());
        }

        public  Grid GetView()
        {
            return cast(Grid)НайдиОбъект(wxGridTableBase_GetView(wxobj), &Grid.Нов);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticClear(GridTableBase объ)
	{
	    объ.очисть();
	}
        public  проц очисть()
        {
            wxGridTableBase_Clear(wxobj);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private бул staticInsertRows(GridTableBase объ, цел поз, цел numRows)
	{
	    return объ.вставьРяды(поз, numRows);
	}
        public  бул вставьРяды(цел поз, цел numRows)
        {
            return wxGridTableBase_InsertRows(wxobj, поз, numRows);
        }

        static extern (C) private бул staticAppendRows(GridTableBase объ, цел numRows)
        {
            return объ.AppendRows(numRows);
        }
        public  бул AppendRows(цел numRows)
        {
            return wxGridTableBase_AppendRows(wxobj, numRows);
        }

        static extern (C) private бул staticDeleteRows(GridTableBase объ, цел поз, цел numRows)
	{
	    return объ.DeleteRows(поз, numRows);
	}
        public  бул DeleteRows(цел поз, цел numRows)
        {
            return wxGridTableBase_DeleteRows(wxobj, поз, numRows);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private бул staticInsertCols(GridTableBase объ, цел поз, цел numCols)
	{
	    return объ.InsertCols(поз, numCols);
	}
        public  бул InsertCols(цел поз, цел numCols)
        {
            return wxGridTableBase_InsertCols(wxobj, поз, numCols);
        }

        static extern (C) private бул staticAppendCols(GridTableBase объ, цел numCols)
        {
            return объ.AppendCols(numCols);
        }
        public  бул AppendCols(цел numCols)
        {
            return wxGridTableBase_AppendCols(wxobj, numCols);
        }

        static extern (C) private бул staticDeleteCols(GridTableBase объ, цел поз, цел numCols)
	{
	    return объ.DeleteCols(поз, numCols);
	}
        public  бул DeleteCols(цел поз, цел numCols)
        {
            return wxGridTableBase_DeleteCols(wxobj, поз, numCols);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private ткст staticGetRowLabelValue(GridTableBase объ, цел row)
        {
            return объ.GetRowLabelValue(row);
        }
        public  ткст GetRowLabelValue(цел row)
        {
            return cast(ткст) new wxString(wxGridTableBase_GetRowLabelValue(wxobj, row), да);
        }

        static extern (C) private ткст staticGetColLabelValue(GridTableBase объ, цел col)
        {
            return объ.GetColLabelValue(col);
        }
        public  ткст GetColLabelValue(цел col)
        {
            return cast(ткст) new wxString(wxGridTableBase_GetColLabelValue(wxobj, col), да);
        }

        static extern (C) private проц staticDoУстRowLabelValue(GridTableBase объ, цел row, ЦелУкз val)
        {
            объ.УстRowLabelValue(row, cast(ткст) new wxString(val));
        }

        public  проц УстRowLabelValue(цел row, ткст val)
        {
            wxGridTableBase_SetRowLabelValue(wxobj, row, val);
        }

        static extern (C) private проц staticDoУстColLabelValue(GridTableBase объ, цел col, ЦелУкз val)
        {
            объ.УстColLabelValue(col, cast(ткст) new wxString(val));
        }

        public  проц УстColLabelValue(цел col, ткст val)
        {
            wxGridTableBase_SetColLabelValue(wxobj, col, val);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticDoУстAttrProvider(GridTableBase объ, ЦелУкз attrProvider)
        {
            объ.УстAttrProvider(cast(GridCellAttrProvider)НайдиОбъект(attrProvider, &GridCellAttrProvider.Нов));
        }

        public проц УстAttrProvider(GridCellAttrProvider attrProvider)
        {
            wxGridTableBase_SetAttrProvider(wxobj, wxObject.SafePtr(attrProvider));
        }

        static extern (C) private ЦелУкз staticDoGetAttrProvider(GridTableBase объ)
        {
            return wxObject.SafePtr(объ.GetAttrProvider());
        }

        public GridCellAttrProvider GetAttrProvider()
        {
            return new GridCellAttrProvider(wxGridTableBase_GetAttrProvider(wxobj));
        }

        static extern (C) private бул staticCanHaveAttributes(GridTableBase объ)
        {
            return объ.CanHaveAttributes();
        }
        public  бул CanHaveAttributes()
        {
            return wxGridTableBase_CanHaveAttributes(wxobj);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private ЦелУкз staticDoGetAttr(GridTableBase объ, цел row, цел col, цел kind)
        {
            return wxObject.SafePtr(объ.ДайАтр(row, col, cast(GridCellAttr.AttrKind) kind));
        }

        public  GridCellAttr ДайАтр(цел row, цел col, GridCellAttr.AttrKind kind)
        {
            return cast(GridCellAttr)НайдиОбъект(wxGridTableBase_GetAttr(wxobj, row, col, cast(цел)kind), &GridCellAttr.Нов);
        }

        static extern (C) private проц staticDoУстAttr(GridTableBase объ, ЦелУкз attr, цел row, цел col)
        {
            объ.УстАтр(cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), row, col);
        }

        public  проц УстАтр(GridCellAttr attr, цел row, цел col)
        {
            wxGridTableBase_SetAttr(wxobj, wxObject.SafePtr(attr), row, col);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticDoУстRowAttr(GridTableBase объ, ЦелУкз attr, цел row)
        {
            объ.УстRowAttr(cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), row);
        }

        public  проц УстRowAttr(GridCellAttr attr, цел row)
        {
            wxGridTableBase_SetRowAttr(wxobj, wxObject.SafePtr(attr), row);
        }

        static extern (C) private проц staticDoУстColAttr(GridTableBase объ, ЦелУкз attr, цел col)
        {
            объ.УстColAttr(cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), col);
        }

        public  проц УстColAttr(GridCellAttr attr, цел col)
        {
            wxGridTableBase_SetColAttr(wxobj, wxObject.SafePtr(attr), col);
        }
    }

	extern (C) {
        alias ЦелУкз function(GridCellAttrProvider объ, цел row, цел col, цел kind) Virtual_GetAttr;
        alias проц function(GridCellAttrProvider объ, ЦелУкз attr, цел row, цел col) Virtual_SetAttr;
        alias проц function(GridCellAttrProvider объ, ЦелУкз attr, цел row) Virtual_SetRowAttr;
	}

        //! \cond EXTERN
        static extern (C) ЦелУкз wxGridCellAttrProvider_ctor();
	static extern (C) проц wxGridCellAttrProvider_dtor(ЦелУкз сам);
        static extern (C) проц wxGridCellAttrProvider_RegisterVirtual(ЦелУкз сам,GridCellAttrProvider объ,
            Virtual_GetAttr getAttr,
            Virtual_SetAttr setAttr,
            Virtual_SetRowAttr setRowAttr,
            Virtual_SetRowAttr setColAttr);
	static extern (C) проц wxGridCellAttrProvider_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        static extern (C) ЦелУкз wxGridCellAttrProvider_GetAttr(ЦелУкз сам, цел row, цел col, цел kind);
        static extern (C) проц wxGridCellAttrProvider_SetAttr(ЦелУкз сам, ЦелУкз attr, цел row, цел col);
        static extern (C) проц wxGridCellAttrProvider_SetRowAttr(ЦелУкз сам, ЦелУкз attr, цел row);
        static extern (C) проц wxGridCellAttrProvider_SetColAttr(ЦелУкз сам, ЦелУкз attr, цел col);
        static extern (C) проц wxGridCellAttrProvider_UpdateAttrRows(ЦелУкз сам, цел поз, цел numRows);
        static extern (C) проц wxGridCellAttrProvider_UpdateAttrCols(ЦелУкз сам, цел поз, цел numCols);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias GridCellAttrProvider wxGridCellAttrProvider;
    public class GridCellAttrProvider : wxObject  // ClientData
    {
        public this(ЦелУкз wxobj)
	{
		super(wxobj);
	}

	private this(ЦелУкз wxobj, бул memOwn)
	{
		super(wxobj);
		this.memOwn = memOwn;
	}

        public this()
        {
        	this(wxGridCellAttrProvider_ctor(), да);

            wxGridCellAttrProvider_RegisterVirtual(wxobj,this,
                &staticDoGetAttr,
                &staticDoУстAttr,
                &staticDoУстRowAttr,
                &staticDoУстColAttr);

		wxGridCellAttrProvider_RegisterDisposable(wxobj, &VirtualDispose);
        }

	public static wxObject Нов(ЦелУкз ptr) { return new GridCellAttrProvider(ptr); }
	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellAttrProvider_dtor(wxobj); }

        //-----------------------------------------------------------------------------

        static extern (C) private ЦелУкз staticDoGetAttr(GridCellAttrProvider объ, цел row, цел col, цел kind)
        {
            return wxObject.SafePtr(объ.ДайАтр(row, col, cast(GridCellAttr.AttrKind) kind));
        }

        public  GridCellAttr ДайАтр(цел row, цел col, GridCellAttr.AttrKind kind)
        {
            return cast(GridCellAttr)НайдиОбъект(wxGridCellAttrProvider_GetAttr(wxobj, row, col, cast(цел)kind), &GridCellAttr.Нов);
        }

        static extern (C) private проц staticDoУстAttr(GridCellAttrProvider объ, ЦелУкз attr, цел row, цел col)
        {
            объ.УстАтр(cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), row, col);
        }

        public  проц УстАтр(GridCellAttr attr, цел row, цел col)
        {
            wxGridCellAttrProvider_SetAttr(wxobj, wxObject.SafePtr(attr), row, col);
        }

        //-----------------------------------------------------------------------------

        static extern (C) private проц staticDoУстRowAttr(GridCellAttrProvider объ, ЦелУкз attr, цел row)
        {
            объ.УстRowAttr(cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), row);
        }

        public  проц УстRowAttr(GridCellAttr attr, цел row)
        {
            wxGridCellAttrProvider_SetRowAttr(wxobj, wxObject.SafePtr(attr), row);
        }

        static extern (C) private проц staticDoУстColAttr(GridCellAttrProvider объ, ЦелУкз attr, цел col)
        {
            объ.УстColAttr(cast(GridCellAttr)НайдиОбъект(attr, &GridCellAttr.Нов), col);
        }

        public  проц УстColAttr(GridCellAttr attr, цел col)
        {
            wxGridCellAttrProvider_SetColAttr(wxobj, wxObject.SafePtr(attr), col);
        }

        //-----------------------------------------------------------------------------

        public проц UpdateAttrRows(цел поз, цел numRows)
        {
            wxGridCellAttrProvider_UpdateAttrRows(wxobj, поз, numRows);
        }

        public проц UpdateAttrCols(цел поз, цел numCols)
        {
            wxGridCellAttrProvider_UpdateAttrCols(wxobj, поз, numCols);
        }
    }
