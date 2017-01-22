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
/+
    public enum GridSelectionMode
    {
        wxGridSelectCells,
        wxGridSelectRows,
        wxGridSelectColumns
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxGridEvent_ctor(цел ид, цел тип, ЦУк объ, цел row, цел col, цел x, цел y, бул sel, бул control, бул shift, бул alt, бул meta);
        static extern (C) цел    wxGridEvent_GetRow(ЦУк сам);
        static extern (C) цел    wxGridEvent_GetCol(ЦУк сам);
        static extern (C) проц   wxGridEvent_GetPosition(ЦУк сам, inout Точка pt);
        static extern (C) бул   wxGridEvent_Selecting(ЦУк сам);
        static extern (C) бул   wxGridEvent_ControlDown(ЦУк сам);
        static extern (C) бул   wxGridEvent_MetaDown(ЦУк сам);
        static extern (C) бул   wxGridEvent_ShiftDown(ЦУк сам);
        static extern (C) бул   wxGridEvent_AltDown(ЦУк сам);
        static extern (C) проц wxGridEvent_Veto(ЦУк сам);
        static extern (C) проц wxGridEvent_Allow(ЦУк сам);
        static extern (C) бул wxGridEvent_IsAllowed(ЦУк сам);      
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GridEvent wxGridEvent;
    public class GridEvent : Событие 
    {
        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(цел ид, цел тип, wxObject объ, цел row, цел col, цел x, цел y, бул sel, бул control, бул shift, бул alt, бул meta)
            { this(wxGridEvent_ctor(ид, тип, wxObject.SafePtr(объ), row, col, x, y, sel, control, shift, alt, meta)); }

        //-----------------------------------------------------------------------------

        public цел Row() { return wxGridEvent_GetRow(шхобъ); }

        public цел Col() { return wxGridEvent_GetCol(шхобъ); }

        //-----------------------------------------------------------------------------

        public Точка Положение() { 
                Точка pt;
                wxGridEvent_GetPosition(шхобъ, pt);
                return pt;
            }

        //-----------------------------------------------------------------------------

        public бул Selecting() { return wxGridEvent_Selecting(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул НажатКонтрол() { return wxGridEvent_ControlDown(шхобъ); }

        public бул НажатМета() { return wxGridEvent_MetaDown(шхобъ); }

        public бул НажатШифт() { return wxGridEvent_ShiftDown(шхобъ); }

            public бул НажатАльт() { return wxGridEvent_AltDown(шхобъ); }
        
        //-----------------------------------------------------------------------------     
        
        public проц Veto()
        {
            wxGridEvent_Veto(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        public проц Allow()
        {
            wxGridEvent_Allow(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        public бул Allowed() { return wxGridEvent_IsAllowed(шхобъ); }

	private static Событие Нов(ЦУк объ) { return new GridEvent(объ); }

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
        alias проц   function(GridCellEditor объ, ЦУк родитель, цел ид, ЦУк evtHandler) Virtual_Create;
        alias проц   function(GridCellEditor объ, цел row, цел col, ЦУк grid) Virtual_BeginEdit;
        alias бул   function(GridCellEditor объ, цел row, цел col, ЦУк grid) Virtual_EndEdit;
        alias проц   function(GridCellEditor объ) Virtual_Reset;
        alias ЦУк function(GridCellEditor объ) Virtual_Clone;
        alias проц   function(GridCellEditor объ, Прямоугольник прям) Virtual_SetSize;
        alias проц   function(GridCellEditor объ, бул show, ЦУк attr) Virtual_Show;
        alias проц   function(GridCellEditor объ, Прямоугольник прям, ЦУк attr) Virtual_PaintBackground;
        alias бул   function(GridCellEditor объ, ЦУк evt) Virtual_IsAcceptedKey;
        alias проц   function(GridCellEditor объ, ЦУк evt) Virtual_StartingKey;
        alias проц   function(GridCellEditor объ) Virtual_StartingClick;
        alias проц   function(GridCellEditor объ, ЦУк evt) Virtual_HandleReturn;
        alias проц   function(GridCellEditor объ) Virtual_Destroy;
        alias ткст function(GridCellEditor объ) Virtual_GetValue;
	}

        static extern (C) ЦУк wxGridCellEditor_ctor();
	static extern (C) проц wxGridCellEditor_dtor(ЦУк сам);
        static extern (C) проц wxGridCellEditor_RegisterVirtual(ЦУк сам, GridCellEditor объ,
            Virtual_Create create, 
            Virtual_BeginEdit beginEdit, 
            Virtual_EndEdit endEdit, 
            Virtual_Reset reset, 
            Virtual_Clone clone,
            Virtual_SetSize setSize,
            Virtual_Show show,
            Virtual_PaintBackground paintBackground,
            Virtual_IsAcceptedKey isAcceptedKey,
            Virtual_StartingKey startingKey,
            Virtual_StartingClick startingClick,
            Virtual_HandleReturn handleReturn,
            Virtual_Destroy destroy,
            Virtual_GetValue getvalue);
        static extern (C) бул   wxGridCellEditor_IsCreated(ЦУк сам);
        static extern (C) проц   wxGridCellEditor_SetSize(ЦУк сам, inout Прямоугольник прям);
        static extern (C) проц   wxGridCellEditor_Show(ЦУк сам, бул show, ЦУк attr);
        static extern (C) проц   wxGridCellEditor_PaintBackground(ЦУк сам, inout Прямоугольник rectCell, ЦУк attr);
        static extern (C) бул   wxGridCellEditor_IsAcceptedKey(ЦУк сам, ЦУк evt);
        static extern (C) проц   wxGridCellEditor_StartingKey(ЦУк сам, ЦУк evt);
        static extern (C) проц   wxGridCellEditor_StartingClick(ЦУк сам);
        static extern (C) проц   wxGridCellEditor_HandleReturn(ЦУк сам, ЦУк evt);
        static extern (C) проц   wxGridCellEditor_Destroy(ЦУк сам);
        static extern (C) ЦУк wxGridCellEditor_GetValue(ЦУк сам);
		//! \endcond
	
        //-----------------------------------------------------------------------------
        
    public abstract class GridCellEditor : GridCellWorker
    {
        public this(ЦУк шхобъ)
	{ 
		super(шхобъ);
	}
	
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}
            
        public this()
        {
        	this(wxGridCellEditor_ctor(), да);
            wxGridCellEditor_RegisterVirtual(шхобъ, this,
                    &staticDoCreate,
                    &staticDoBeginEdit,
                    &staticDoEndEdit,
                    &staticReset,
                    &staticDoClone,
                    &staticSetSize,
                    &staticDoShow,
                    &staticDoPaintBackground,
                    &staticDoIsAcceptedKey,
                    &staticDoStartingKey,
                    &staticStartingClick,
                    &staticDoHandleReturn,
                    &staticDestroy,
                    &staticGetValue);                                    
        }

//	public static wxObject Нов(ЦУк ptr) { return new GridCellEditor(ptr); }
	//---------------------------------------------------------------------
	
	override protected проц dtor() { wxGridCellEditor_dtor(шхобъ); }
            
        //-----------------------------------------------------------------------------
    
        public бул IsCreated() { return wxGridCellEditor_IsCreated(шхобъ); }
    
        //-----------------------------------------------------------------------------
        
        static extern(C) private проц staticDoCreate(GridCellEditor объ, ЦУк родитель, цел ид, ЦУк evtHandler)
        {
            объ.Create(cast(Окно)wxObject.FindObject(родитель), ид, cast(EvtHandler)FindObject(evtHandler, &EvtHandler.Нов));
        }
    
        public abstract проц Create(Окно родитель, цел ид, EvtHandler evtHandler);
    
        //-----------------------------------------------------------------------------
        
        static extern(C) private проц staticSetSize(GridCellEditor объ, Прямоугольник прям)
        {
        	объ.УстРазм(прям);
        }

        public /+virtual+/ проц УстРазм(Прямоугольник прям)
        {
            wxGridCellEditor_SetSize(шхобъ, прям);
        }

        //-----------------------------------------------------------------------------
        
        static extern(C) private проц staticDoShow(GridCellEditor объ, бул show, ЦУк attr)
        {
            объ.Show(show, cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов));
        }

        public /+virtual+/ проц Show(бул show, GridCellAttr attr)
        {
            wxGridCellEditor_Show(шхобъ, show, wxObject.SafePtr(attr));
        }

        //-----------------------------------------------------------------------------
        
        static extern(C) private проц staticDoPaintBackground(GridCellEditor объ, Прямоугольник rectCell, ЦУк attr)
        {
            объ.PaintBackground(rectCell, cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов));
        }

        public /+virtual+/ проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr)
        {
            wxGridCellEditor_PaintBackground(шхобъ, rectCell, wxObject.SafePtr(attr));
        }

        //-----------------------------------------------------------------------------
        
        static extern(C) private проц staticDoBeginEdit(GridCellEditor объ, цел row, цел col, ЦУк grid)
        {
            объ.BeginEdit(row, col, cast(Grid)FindObject(grid, &Grid.Нов));
        }
    
        public abstract проц BeginEdit(цел row, цел col, Grid grid);
        
        static extern(C) private бул staticDoEndEdit(GridCellEditor объ, цел row, цел col, ЦУк grid)
        {
            return объ.EndEdit(row, col, cast(Grid)FindObject(grid, &Grid.Нов));
        }
        
        public abstract бул EndEdit(цел row, цел col, Grid grid);
    
        //-----------------------------------------------------------------------------
    
        static extern(C) private проц staticReset(GridCellEditor объ)
        {
            return объ.Reset();
        }

        public abstract проц Reset();
    
        //-----------------------------------------------------------------------------
        
        static extern(C) private бул staticDoIsAcceptedKey(GridCellEditor объ, ЦУк evt)
        {
            return объ.IsAcceptedKey(cast(СобКлавиши)wxObject.FindObject(evt, cast(wxObject function(ЦУк))&СобКлавиши.Нов));
        }
        
        public /+virtual+/ бул IsAcceptedKey(СобКлавиши evt)
        {
            return wxGridCellEditor_IsAcceptedKey(шхобъ, wxObject.SafePtr(evt));
        }
        
        static extern(C) private проц staticDoStartingKey(GridCellEditor объ, ЦУк evt)
        {
            объ.StartingKey(cast(СобКлавиши)wxObject.FindObject(evt, cast(wxObject function(ЦУк))&СобКлавиши.Нов));
        }
    
        public /+virtual+/ проц StartingKey(СобКлавиши evt)
        {
            wxGridCellEditor_StartingKey(шхобъ, wxObject.SafePtr(evt));
        }

	static extern(C) private проц staticStartingClick(GridCellEditor объ)
	{
	    объ.StartingClick();
	}
        public /+virtual+/ проц StartingClick()
        {
            wxGridCellEditor_StartingClick(шхобъ);
        }

        //-----------------------------------------------------------------------------
        
        static extern(C) private проц staticDoHandleReturn(GridCellEditor объ, ЦУк evt)
        {
            объ.HandleReturn(cast(СобКлавиши)wxObject.FindObject(evt, cast(wxObject function(ЦУк))&СобКлавиши.Нов));
        }

        public /+virtual+/ проц HandleReturn(СобКлавиши evt)
        {
            wxGridCellEditor_HandleReturn(шхобъ, wxObject.SafePtr(evt));
        }

        //-----------------------------------------------------------------------------

	static extern(C) private проц staticDestroy(GridCellEditor объ)
	{
		объ.Разрушь();
	}

        public /+virtual+/ проц Разрушь()
        {
            wxGridCellEditor_Destroy(шхобъ);
        }

        //-----------------------------------------------------------------------------
        
        static extern(C) private ЦУк staticDoClone(GridCellEditor объ)
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
//            return cast(ткст) new wxString(wxGridCellEditor_GetValue(шхобъ), да);
//        }
    }
    
    //-----------------------------------------------------------------------------
    
		//! \cond EXTERN
        static extern (C) ЦУк wxGridCellTextEditor_ctor();
	static extern (C) проц wxGridCellTextEditor_dtor(ЦУк сам);
        static extern (C) проц wxGridCellTextEditor_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк evtHandler);
        static extern (C) проц wxGridCellTextEditor_SetSize(ЦУк сам, inout Прямоугольник прям);
        static extern (C) проц wxGridCellTextEditor_PaintBackground(ЦУк сам, inout Прямоугольник rectCell, ЦУк attr);
        static extern (C) бул wxGridCellTextEditor_IsAcceptedKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellTextEditor_BeginEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) бул wxGridCellTextEditor_EndEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) проц wxGridCellTextEditor_Reset(ЦУк сам);
        static extern (C) проц wxGridCellTextEditor_StartingKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellTextEditor_SetParameters(ЦУк сам, ткст parameter);
        static extern (C) ЦУк wxGridCellTextEditor_Clone(ЦУк сам);
        static extern (C) ЦУк wxGridCellTextEditor_GetValue(ЦУк сам);
		//! \endcond
	
    alias GridCellTextEditor wxGridCellTextEditor;
    public class GridCellTextEditor : GridCellEditor
    {
        public this()
            { this(wxGridCellTextEditor_ctor(), да); }

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
				
	override protected проц dtor() { wxGridCellTextEditor_dtor(шхобъ); }

        public override проц Create(Окно родитель, цел ид, EvtHandler evtHandler)
        {
            wxGridCellTextEditor_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override проц УстРазм(Прямоугольник прям)
        {
            wxGridCellTextEditor_SetSize(шхобъ, прям);
        }

        public override проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr)
        {
            wxGridCellTextEditor_PaintBackground(шхобъ, rectCell, wxObject.SafePtr(attr));
        }

        public override бул IsAcceptedKey(СобКлавиши evt)
        {
            return wxGridCellTextEditor_IsAcceptedKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellTextEditor_BeginEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellTextEditor_EndEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellTextEditor_Reset(шхобъ);
        }

        public override проц StartingKey(СобКлавиши evt)
        {
            wxGridCellTextEditor_StartingKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц SetParameters(ткст parameter)
        {
            wxGridCellTextEditor_SetParameters(шхобъ, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)FindObject(wxGridCellTextEditor_Clone(шхобъ), &GridCellEditor.Нов);
              return new GridCellTextEditor(wxGridCellTextEditor_Clone(шхобъ));
        }
        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellTextEditor_GetValue(шхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxGridCellNumberEditor_ctor(цел min, цел max);
	static extern (C) проц wxGridCellNumberEditor_dtor(ЦУк сам);
	static extern (C) проц wxGridCellNumberEditor_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellNumberEditor_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк evtHandler);
        static extern (C) бул wxGridCellNumberEditor_IsAcceptedKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellNumberEditor_BeginEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) бул wxGridCellNumberEditor_EndEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) проц wxGridCellNumberEditor_Reset(ЦУк сам);
        static extern (C) проц wxGridCellNumberEditor_StartingKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellNumberEditor_SetParameters(ЦУк сам, ткст parameter);
        static extern (C) ЦУк wxGridCellNumberEditor_Clone(ЦУк сам);
        static extern (C) ЦУк wxGridCellNumberEditor_GetValue(ЦУк сам);
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
		wxGridCellNumberEditor_RegisterDisposable(шхобъ, &VirtualDispose);
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
				
	override protected проц dtor() { wxGridCellNumberEditor_dtor(шхобъ); }

        public override проц Create(Окно родитель, цел ид, EvtHandler evtHandler)
        {
            wxGridCellNumberEditor_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override бул IsAcceptedKey(СобКлавиши evt)
        {
            return wxGridCellNumberEditor_IsAcceptedKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellNumberEditor_BeginEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellNumberEditor_EndEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellNumberEditor_Reset(шхобъ);
        }

        public override проц StartingKey(СобКлавиши evt)
        {
            wxGridCellNumberEditor_StartingKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц SetParameters(ткст parameter)
        {
            wxGridCellNumberEditor_SetParameters(шхобъ, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)FindObject(wxGridCellNumberEditor_Clone(шхобъ), &GridCellEditor.Нов);
              return new GridCellNumberEditor(wxGridCellNumberEditor_Clone(шхобъ));
        }

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellNumberEditor_GetValue(шхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxGridCellFloatEditor_ctor(цел ширина, цел precision);
	static extern (C) проц wxGridCellFloatEditor_dtor(ЦУк сам);
        static extern (C) проц wxGridCellFloatEditor_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк evtHandler);
        static extern (C) бул wxGridCellFloatEditor_IsAcceptedKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellFloatEditor_BeginEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) бул wxGridCellFloatEditor_EndEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) проц wxGridCellFloatEditor_Reset(ЦУк сам);
        static extern (C) проц wxGridCellFloatEditor_StartingKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellFloatEditor_SetParameters(ЦУк сам, ткст parameter);
        static extern (C) ЦУк wxGridCellFloatEditor_Clone(ЦУк сам);
        static extern (C) ЦУк wxGridCellFloatEditor_GetValue(ЦУк сам);
		//! \endcond
	
    alias GridCellFloatEditor wxGridCellFloatEditor;
    public class GridCellFloatEditor : GridCellTextEditor
    {
        public this()
            { this(-1, -1); }

        public this(цел ширина)
            { this(ширина, -1); }

        public this(цел ширина, цел precision)
            { this(wxGridCellFloatEditor_ctor(ширина, precision), да); }

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
				
	override protected проц dtor() { wxGridCellFloatEditor_dtor(шхобъ); }

        public override проц Create(Окно родитель, цел ид, EvtHandler evtHandler)
        {
            wxGridCellFloatEditor_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override бул IsAcceptedKey(СобКлавиши evt)
        {
            return wxGridCellFloatEditor_IsAcceptedKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellFloatEditor_BeginEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }

        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellFloatEditor_EndEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }

        public override проц Reset()
        {
            wxGridCellFloatEditor_Reset(шхобъ);
        }

        public override проц StartingKey(СобКлавиши evt)
        {
            wxGridCellFloatEditor_StartingKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц SetParameters(ткст parameter)
        {
            wxGridCellFloatEditor_SetParameters(шхобъ, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)FindObject(wxGridCellFloatEditor_Clone(шхобъ), &GridCellEditor.Нов);
              return new GridCellFloatEditor(wxGridCellFloatEditor_Clone(шхобъ));
        }

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellFloatEditor_GetValue(шхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------
    
		//! \cond EXTERN
        static extern (C) ЦУк wxGridCellBoolEditor_ctor();
	static extern (C) проц wxGridCellBoolEditor_dtor(ЦУк сам);
	static extern (C) проц wxGridCellBoolEditor_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellBoolEditor_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк evtHandler);
        static extern (C) проц wxGridCellBoolEditor_SetSize(ЦУк сам, inout Прямоугольник прям);
        static extern (C) бул wxGridCellBoolEditor_IsAcceptedKey(ЦУк сам, ЦУк evt);
        static extern (C) проц wxGridCellBoolEditor_BeginEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) бул wxGridCellBoolEditor_EndEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) проц wxGridCellBoolEditor_Reset(ЦУк сам);
        static extern (C) проц wxGridCellBoolEditor_StartingClick(ЦУк сам);
        static extern (C) ЦУк wxGridCellBoolEditor_Clone(ЦУк сам);
        static extern (C) ЦУк wxGridCellBoolEditor_GetValue(ЦУк сам);
		//! \endcond
	
    alias GridCellBoolEditor wxGridCellBoolEditor;
    public class GridCellBoolEditor : GridCellEditor
    {
        public this()
	{ 
		this(wxGridCellBoolEditor_ctor(), да);
		wxGridCellBoolEditor_RegisterDisposable(шхобъ, &VirtualDispose);
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
				
	override protected проц dtor() { wxGridCellBoolEditor_dtor(шхобъ); }

        public override проц Create(Окно родитель, цел ид, EvtHandler evtHandler)
        {
            wxGridCellBoolEditor_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override проц УстРазм(Прямоугольник прям)
        {
            wxGridCellBoolEditor_SetSize(шхобъ, прям);
        }

        public override бул IsAcceptedKey(СобКлавиши evt)
        {
            return wxGridCellBoolEditor_IsAcceptedKey(шхобъ, wxObject.SafePtr(evt));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellBoolEditor_BeginEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }
        
        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellBoolEditor_EndEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }
        
        public override проц Reset()
        {
            wxGridCellBoolEditor_Reset(шхобъ);
        }

        public override проц StartingClick()
        {
            wxGridCellBoolEditor_StartingClick(шхобъ);
        }
        
        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)FindObject(wxGridCellBoolEditor_Clone(шхобъ), &GridCellEditor.Нов);
              return new GridCellBoolEditor(wxGridCellBoolEditor_Clone(шхобъ));
        }       

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellBoolEditor_GetValue(шхобъ), да);
        }
    }
    
    //-----------------------------------------------------------------------------
    
		//! \cond EXTERN
        static extern (C) ЦУк wxGridCellChoiceEditor_ctor(цел n, ткст* choices, бул allowOthers);
	static extern (C) проц wxGridCellChoiceEditor_dtor(ЦУк сам);
	static extern (C) проц wxGridCellChoiceEditor_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellChoiceEditor_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк evtHandler);
        static extern (C) проц wxGridCellChoiceEditor_PaintBackground(ЦУк сам, inout Прямоугольник rectCell, ЦУк attr);
        static extern (C) проц wxGridCellChoiceEditor_BeginEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) бул wxGridCellChoiceEditor_EndEdit(ЦУк сам, цел row, цел col, ЦУк grid);
        static extern (C) проц wxGridCellChoiceEditor_Reset(ЦУк сам);
        static extern (C) проц wxGridCellChoiceEditor_SetParameters(ЦУк сам, ткст parameter);
        static extern (C) ЦУк wxGridCellChoiceEditor_Clone(ЦУк сам);
        static extern (C) ЦУк wxGridCellChoiceEditor_GetValue(ЦУк сам);
		//! \endcond
	
    alias GridCellChoiceEditor wxGridCellChoiceEditor;
    public class GridCellChoiceEditor : GridCellEditor
    {
        public this()
            { this(cast(ткст[])пусто, нет); }
        
        public this(ткст[] choices)
            { this(choices, нет); }
        
        public this(ткст[] choices, бул allowOthers)
	{ 
		this(wxGridCellChoiceEditor_ctor(choices.length, choices.ptr, allowOthers), да);
		wxGridCellChoiceEditor_RegisterDisposable(шхобъ, &VirtualDispose);
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
				
	override protected проц dtor() { wxGridCellChoiceEditor_dtor(шхобъ); }

        public override проц Create(Окно родитель, цел ид, EvtHandler evtHandler)
        {
            wxGridCellChoiceEditor_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(evtHandler));
        }

        public override проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr)
        {
            wxGridCellChoiceEditor_PaintBackground(шхобъ, rectCell, wxObject.SafePtr(attr));
        }

        public override проц BeginEdit(цел row, цел col, Grid grid)
        {
            wxGridCellChoiceEditor_BeginEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }
        
        public override бул EndEdit(цел row, цел col, Grid grid)
        {
            return wxGridCellChoiceEditor_EndEdit(шхобъ, row, col, wxObject.SafePtr(grid));
        }
        
        public override проц Reset()
        {
            wxGridCellChoiceEditor_Reset(шхобъ);
        }

        public override проц SetParameters(ткст parameter)
        {
            wxGridCellChoiceEditor_SetParameters(шхобъ, parameter);
        }

        public override GridCellEditor Clone()
        {
//            return cast(GridCellEditor)FindObject(wxGridCellChoiceEditor_Clone(шхобъ), &GridCellEditor.Нов);
              return new GridCellChoiceEditor(wxGridCellChoiceEditor_Clone(шхобъ));
        }       

        public override ткст GetValue()
        {
            return cast(ткст) new wxString(wxGridCellChoiceEditor_GetValue(шхобъ), да);
        }
    }
    
    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxGridRangeSelectEvent_ctor(цел ид, цел тип, ЦУк объ, ЦУк topLeft, ЦУк bottomRight, бул sel, бул control, бул shift, бул alt, бул meta);
        static extern (C) ЦУк wxGridRangeSelectEvent_GetTopLeftCoords(ЦУк сам);
        static extern (C) ЦУк wxGridRangeSelectEvent_GetBottomRightCoords(ЦУк сам);
        static extern (C) цел wxGridRangeSelectEvent_GetTopRow(ЦУк сам);
        static extern (C) цел wxGridRangeSelectEvent_GetBottomRow(ЦУк сам);
        static extern (C) цел wxGridRangeSelectEvent_GetLeftCol(ЦУк сам);
        static extern (C) цел wxGridRangeSelectEvent_GetRightCol(ЦУк сам);
        static extern (C) бул wxGridRangeSelectEvent_Selecting(ЦУк сам);
        static extern (C) бул wxGridRangeSelectEvent_ControlDown(ЦУк сам);
        static extern (C) бул wxGridRangeSelectEvent_MetaDown(ЦУк сам);
        static extern (C) бул wxGridRangeSelectEvent_ShiftDown(ЦУк сам);
        static extern (C) бул wxGridRangeSelectEvent_AltDown(ЦУк сам);
        static extern (C) проц wxGridRangeSelectEvent_Veto(ЦУк сам);
        static extern (C) проц wxGridRangeSelectEvent_Allow(ЦУк сам);
        static extern (C) бул wxGridRangeSelectEvent_IsAllowed(ЦУк сам);       
		//! \endcond
    
        //-----------------------------------------------------------------------------
    
    alias GridRangeSelectEvent wxGridRangeSelectEvent;
    public class GridRangeSelectEvent : Событие
    {
        public this(ЦУк шхобъ)
            { super(шхобъ); }
    
        public this(цел ид, цел тип, wxObject объ, GridCellCoords topLeft, GridCellCoords bottomRight, бул sel, бул control, бул shift, бул alt, бул meta)
            { super(wxGridRangeSelectEvent_ctor(ид, тип, wxObject.SafePtr(объ), wxObject.SafePtr(topLeft), wxObject.SafePtr(bottomRight), sel, control, shift, alt, meta)); }
    
            //-----------------------------------------------------------------------------
    
        public GridCellCoords TopLeftCoords() { return new GridCellCoords(wxGridRangeSelectEvent_GetTopLeftCoords(шхобъ)); }
    
        public GridCellCoords BottomRightCoords() { return new GridCellCoords(wxGridRangeSelectEvent_GetBottomRightCoords(шхобъ)); }
    
        //-----------------------------------------------------------------------------
    
        public цел TopRow() { return wxGridRangeSelectEvent_GetTopRow(шхобъ); }
    
        public цел BottomRow() { return wxGridRangeSelectEvent_GetBottomRow(шхобъ); }
    
        //-----------------------------------------------------------------------------
    
        public цел LeftCol() { return wxGridRangeSelectEvent_GetLeftCol(шхобъ); }
    
        public цел RightCol() { return wxGridRangeSelectEvent_GetRightCol(шхобъ); }
    
        //-----------------------------------------------------------------------------
    
        public бул Selecting() { return wxGridRangeSelectEvent_Selecting(шхобъ); }
    
        //-----------------------------------------------------------------------------
    
        public бул НажатКонтрол() { return wxGridRangeSelectEvent_ControlDown(шхобъ); }
    
        public бул НажатМета() { return wxGridRangeSelectEvent_MetaDown(шхобъ); }
    
        public бул НажатШифт() { return wxGridRangeSelectEvent_ShiftDown(шхобъ); }
    
        public бул НажатАльт() { return wxGridRangeSelectEvent_AltDown(шхобъ); }
        
        //-----------------------------------------------------------------------------     
        
        public проц Veto()
        {
            wxGridRangeSelectEvent_Veto(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        public проц Allow()
        {
            wxGridRangeSelectEvent_Allow(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        public бул Allowed() { return wxGridRangeSelectEvent_IsAllowed(шхобъ); }

	private static Событие Нов(ЦУк объ) { return new GridRangeSelectEvent(объ); }

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

        static extern (C) ЦУк wxGridCellWorker_ctor();
        static extern (C) проц wxGridCellWorker_RegisterVirtual(ЦУк сам, GridCellWorker объ, Virtual_SetParameters setParameters);
        static extern (C) проц wxGridCellWorker_IncRef(ЦУк сам);
        static extern (C) проц wxGridCellWorker_DecRef(ЦУк сам);
        static extern (C) проц wxGridCellWorker_SetParameters(ЦУк сам, ткст parms);
		//! \endcond
	
        //-----------------------------------------------------------------------------
        
    alias GridCellWorker wxGridCellWorker;
    public class GridCellWorker : wxObject //ClientData
    {
        public this(ЦУк шхобъ) 
	{ 
		super(шхобъ);
	}
	
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}
	
        public this()
        { 
        	this(wxGridCellWorker_ctor(), да);
            wxGridCellWorker_RegisterVirtual(шхобъ, this, &staticDoSetParameters);
        }
	
	//---------------------------------------------------------------------
				
	override protected проц dtor() {}
        
        //-----------------------------------------------------------------------------
        
        public проц IncRef()
        {
            wxGridCellWorker_IncRef(шхобъ);
        }
        
        public проц DecRef()
        {
            wxGridCellWorker_DecRef(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticDoSetParameters(GridCellWorker объ, ткст param)
        {
            объ.SetParameters(param);
        }
        
        public /+virtual+/ проц SetParameters(ткст param)
        {
            wxGridCellWorker_SetParameters(шхобъ, param);
        }
    }
    
    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            static extern (C) ЦУк wxGridEditorCreatedEvent_ctor(цел ид, цел тип, ЦУк объ, цел row, цел col, ЦУк ctrl);
            static extern (C) цел    wxGridEditorCreatedEvent_GetRow(ЦУк сам);
            static extern (C) цел    wxGridEditorCreatedEvent_GetCol(ЦУк сам);
            static extern (C) ЦУк wxGridEditorCreatedEvent_GetControl(ЦУк сам);
            static extern (C) проц   wxGridEditorCreatedEvent_SetRow(ЦУк сам, цел row);
            static extern (C) проц   wxGridEditorCreatedEvent_SetCol(ЦУк сам, цел col);
            static extern (C) проц   wxGridEditorCreatedEvent_SetControl(ЦУк сам, ЦУк ctrl);
            //! \endcond

            //-----------------------------------------------------------------------------
    
    alias GridEditorCreatedEvent wxGridEditorCreatedEvent;
    public class GridEditorCreatedEvent : CommandEvent 
    {
            public this(ЦУк шхобъ)
            { super(шхобъ); }
    
            public this(цел ид, цел тип, wxObject объ, цел row, цел col, Control ctrl)
            { this(wxGridEditorCreatedEvent_ctor(ид, тип, wxObject.SafePtr(объ), row, col, wxObject.SafePtr(ctrl))); }
    
            //-----------------------------------------------------------------------------
    
            public цел Row() { return wxGridEditorCreatedEvent_GetRow(шхобъ); }
            public проц Row(цел значение) { wxGridEditorCreatedEvent_SetRow(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public цел Col() { return wxGridEditorCreatedEvent_GetCol(шхобъ); }
            public проц Col(цел значение) { wxGridEditorCreatedEvent_SetCol(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public Control control() { return cast(Control)FindObject(wxGridEditorCreatedEvent_GetControl(шхобъ), &Control.Нов); }
            public проц control(Control значение) { wxGridEditorCreatedEvent_SetControl(шхобъ, wxObject.SafePtr(значение)); }

		private static Событие Нов(ЦУк объ) { return new GridEditorCreatedEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_GRID_EDITOR_CREATED,             &GridEditorCreatedEvent.Нов);        
		}
    }
    
    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            static extern (C) ЦУк wxGrid_ctor();
            static extern (C) ЦУк wxGrid_ctorFull(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
            static extern (C) бул   wxGrid_CreateGrid(ЦУк сам, цел numRows, цел numCols,  цел selmode);
            static extern (C) проц   wxGrid_SetSelectionMode(ЦУк сам, цел selmode);
            static extern (C) цел    wxGrid_GetNumberRows(ЦУк сам);
            static extern (C) цел    wxGrid_GetNumberCols(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetTable(ЦУк сам);
            static extern (C) бул   wxGrid_SetTable(ЦУк сам, ЦУк table, бул takeOwnership, цел select);
            static extern (C) проц   wxGrid_ClearGrid(ЦУк сам);
            static extern (C) бул   wxGrid_InsertRows(ЦУк сам, цел поз, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_AppendRows(ЦУк сам, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_DeleteRows(ЦУк сам, цел поз, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_InsertCols(ЦУк сам, цел поз, цел numCols, бул updateLabels);
            static extern (C) бул   wxGrid_AppendCols(ЦУк сам, цел numCols, бул updateLabels);
            static extern (C) бул   wxGrid_DeleteCols(ЦУк сам, цел поз, цел numCols, бул updateLabels);
            static extern (C) проц   wxGrid_BeginBatch(ЦУк сам);
            static extern (C) проц   wxGrid_EndBatch(ЦУк сам);
            static extern (C) цел    wxGrid_GetBatchCount(ЦУк сам);
            static extern (C) проц   wxGrid_ForceRefresh(ЦУк сам);
            static extern (C) бул   wxGrid_IsEditable(ЦУк сам);
            static extern (C) проц   wxGrid_EnableEditing(ЦУк сам, бул edit);
            static extern (C) проц   wxGrid_EnableCellEditControl(ЦУк сам, бул enable);
            static extern (C) проц   wxGrid_DisableCellEditControl(ЦУк сам);
            static extern (C) бул   wxGrid_CanEnableCellControl(ЦУк сам);
            static extern (C) бул   wxGrid_IsCellEditControlEnabled(ЦУк сам);
            static extern (C) бул   wxGrid_IsCellEditControlShown(ЦУк сам);
            static extern (C) бул   wxGrid_IsCurrentCellReadOnly(ЦУк сам);
            static extern (C) проц   wxGrid_ShowCellEditControl(ЦУк сам);
            static extern (C) проц   wxGrid_HideCellEditControl(ЦУк сам);
            static extern (C) проц   wxGrid_SaveEditControlValue(ЦУк сам);
            static extern (C) цел    wxGrid_YToRow(ЦУк сам, цел y);
            static extern (C) цел    wxGrid_XToCol(ЦУк сам, цел x);
            static extern (C) цел    wxGrid_YToEdgeOfRow(ЦУк сам, цел y);
            static extern (C) цел    wxGrid_XToEdgeOfCol(ЦУк сам, цел x);
            static extern (C) проц   wxGrid_CellToRect(ЦУк сам, цел row, цел col, inout Прямоугольник прям);
            static extern (C) цел    wxGrid_GetGridCursorRow(ЦУк сам);
            static extern (C) цел    wxGrid_GetGridCursorCol(ЦУк сам);
            static extern (C) бул   wxGrid_IsVisible(ЦУк сам, цел row, цел col, бул wholeCellVisible);
            static extern (C) проц   wxGrid_MakeCellVisible(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetGridCursor(ЦУк сам, цел row, цел col);
            static extern (C) бул   wxGrid_MoveCursorUp(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorDown(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorLeft(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorRight(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MovePageDown(ЦУк сам);
            static extern (C) бул   wxGrid_MovePageUp(ЦУк сам);
            static extern (C) бул   wxGrid_MoveCursorUpBlock(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorDownBlock(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorLeftBlock(ЦУк сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorRightBlock(ЦУк сам, бул expandSelection);
            static extern (C) цел    wxGrid_GetDefaultRowLabelSize(ЦУк сам);
            static extern (C) цел    wxGrid_GetRowLabelSize(ЦУк сам);
            static extern (C) цел    wxGrid_GetDefaultColLabelSize(ЦУк сам);
            static extern (C) цел    wxGrid_GetColLabelSize(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetLabelBackgroundColour(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetLabelTextColour(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetLabelFont(ЦУк сам);
            static extern (C) проц   wxGrid_GetRowLabelAlignment(ЦУк сам, out цел horiz, out цел vert);
            static extern (C) проц   wxGrid_GetColLabelAlignment(ЦУк сам, out цел horiz, out цел vert);
            static extern (C) ЦУк wxGrid_GetRowLabelValue(ЦУк сам, цел row);
            static extern (C) ЦУк wxGrid_GetColLabelValue(ЦУк сам, цел col);
            static extern (C) ЦУк wxGrid_GetGridLineColour(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellHighlightColour(ЦУк сам);
            static extern (C) цел    wxGrid_GetCellHighlightPenWidth(ЦУк сам);
            static extern (C) цел    wxGrid_GetCellHighlightROPenWidth(ЦУк сам);
            static extern (C) проц   wxGrid_SetRowLabelSize(ЦУк сам, цел ширина);
            static extern (C) проц   wxGrid_SetColLabelSize(ЦУк сам, цел высота);
            static extern (C) проц   wxGrid_SetLabelBackgroundColour(ЦУк сам, ЦУк col);
            static extern (C) проц   wxGrid_SetLabelTextColour(ЦУк сам, ЦУк col);
            static extern (C) проц   wxGrid_SetLabelFont(ЦУк сам, ЦУк fnt);
            static extern (C) проц   wxGrid_SetRowLabelAlignment(ЦУк сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetColLabelAlignment(ЦУк сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetRowLabelValue(ЦУк сам, цел row, ткст val);
            static extern (C) проц   wxGrid_SetColLabelValue(ЦУк сам, цел col, ткст val);
            static extern (C) проц   wxGrid_SetGridLineColour(ЦУк сам, ЦУк col);
            static extern (C) проц   wxGrid_SetCellHighlightColour(ЦУк сам, ЦУк col);
            static extern (C) проц   wxGrid_SetCellHighlightPenWidth(ЦУк сам, цел ширина);
            static extern (C) проц   wxGrid_SetCellHighlightROPenWidth(ЦУк сам, цел ширина);
            static extern (C) проц   wxGrid_EnableDragRowSize(ЦУк сам, бул enable);
            static extern (C) проц   wxGrid_DisableDragRowSize(ЦУк сам);
            static extern (C) бул   wxGrid_CanDragRowSize(ЦУк сам);
            static extern (C) проц   wxGrid_EnableDragColSize(ЦУк сам, бул enable);
            static extern (C) проц   wxGrid_DisableDragColSize(ЦУк сам);
            static extern (C) бул   wxGrid_CanDragColSize(ЦУк сам);
            static extern (C) проц   wxGrid_EnableDragGridSize(ЦУк сам, бул enable);
            static extern (C) проц   wxGrid_DisableDragGridSize(ЦУк сам);
            static extern (C) бул   wxGrid_CanDragGridSize(ЦУк сам);
            static extern (C) проц   wxGrid_SetAttr(ЦУк сам, цел row, цел col, ЦУк attr);
            static extern (C) проц   wxGrid_SetRowAttr(ЦУк сам, цел row, ЦУк attr);
            static extern (C) проц   wxGrid_SetColAttr(ЦУк сам, цел col, ЦУк attr);
            static extern (C) проц   wxGrid_SetColFormatBool(ЦУк сам, цел col);
            static extern (C) проц   wxGrid_SetColFormatNumber(ЦУк сам, цел col);
            static extern (C) проц   wxGrid_SetColFormatFloat(ЦУк сам, цел col, цел ширина, цел precision);
            static extern (C) проц   wxGrid_SetColFormatCustom(ЦУк сам, цел col, ткст typeName);
            static extern (C) проц   wxGrid_EnableGridLines(ЦУк сам, бул enable);
            static extern (C) бул   wxGrid_GridLinesEnabled(ЦУк сам);
            static extern (C) цел    wxGrid_GetDefaultRowSize(ЦУк сам);
            static extern (C) цел    wxGrid_GetRowSize(ЦУк сам, цел row);
            static extern (C) цел    wxGrid_GetDefaultColSize(ЦУк сам);
            static extern (C) цел    wxGrid_GetColSize(ЦУк сам, цел col);
            static extern (C) ЦУк wxGrid_GetDefaultCellBackgroundColour(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellBackgroundColour(ЦУк сам, цел row, цел col);
            static extern (C) ЦУк wxGrid_GetDefaultCellTextColour(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellTextColour(ЦУк сам, цел row, цел col);
            static extern (C) ЦУк wxGrid_GetDefaultCellFont(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellFont(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_GetDefaultCellAlignment(ЦУк сам, inout цел horiz, inout цел vert);
            static extern (C) проц   wxGrid_GetCellAlignment(ЦУк сам, цел row, цел col, inout цел horiz, inout цел vert);
            static extern (C) бул   wxGrid_GetDefaultCellOverflow(ЦУк сам);
            static extern (C) бул   wxGrid_GetCellOverflow(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_GetCellSize(ЦУк сам, цел row, цел col, inout цел num_rows, inout цел num_cols);
            static extern (C) проц   wxGrid_SetDefaultRowSize(ЦУк сам, цел высота, бул resizeExistingRows);
            static extern (C) проц   wxGrid_SetRowSize(ЦУк сам, цел row, цел высота);
            static extern (C) проц   wxGrid_SetDefaultColSize(ЦУк сам, цел ширина, бул resizeExistingCols);
            static extern (C) проц   wxGrid_SetColSize(ЦУк сам, цел col, цел ширина);
            static extern (C) проц   wxGrid_AutoSizeColumn(ЦУк сам, цел col, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeRow(ЦУк сам, цел row, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeColumns(ЦУк сам, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeRows(ЦУк сам, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSize(ЦУк сам);
            static extern (C) проц   wxGrid_SetColMinimalWidth(ЦУк сам, цел col, цел ширина);
            static extern (C) проц   wxGrid_SetRowMinimalHeight(ЦУк сам, цел row, цел ширина);
            static extern (C) проц   wxGrid_SetColMinimalAcceptableWidth(ЦУк сам, цел ширина);
            static extern (C) проц   wxGrid_SetRowMinimalAcceptableHeight(ЦУк сам, цел ширина);
            static extern (C) цел    wxGrid_GetColMinimalAcceptableWidth(ЦУк сам);
            static extern (C) цел    wxGrid_GetRowMinimalAcceptableHeight(ЦУк сам);
            static extern (C) проц   wxGrid_SetDefaultCellBackgroundColour(ЦУк сам, ЦУк wxColour);
            static extern (C) проц   wxGrid_SetDefaultCellTextColour(ЦУк сам, ЦУк wxColour);
            static extern (C) проц   wxGrid_SetDefaultCellFont(ЦУк сам, ЦУк wxFont);
            static extern (C) проц   wxGrid_SetCellFont(ЦУк сам, цел row, цел col, ЦУк wxFont );
            static extern (C) проц   wxGrid_SetDefaultCellAlignment(ЦУк сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetCellAlignmentHV(ЦУк сам, цел row, цел col, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetDefaultCellOverflow(ЦУк сам, бул allow);
            static extern (C) проц   wxGrid_SetCellOverflow(ЦУк сам, цел row, цел col, бул allow);
            static extern (C) проц   wxGrid_SetCellSize(ЦУк сам, цел row, цел col, цел num_rows, цел num_cols);
            static extern (C) проц   wxGrid_SetDefaultRenderer(ЦУк сам, ЦУк renderer);
            static extern (C) проц   wxGrid_SetCellRenderer(ЦУк сам, цел row, цел col, ЦУк renderer);
            static extern (C) ЦУк wxGrid_GetDefaultRenderer(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellRenderer(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetDefaultEditor(ЦУк сам, ЦУк editor);
            static extern (C) проц   wxGrid_SetCellEditor(ЦУк сам, цел row, цел col, ЦУк editor);
            static extern (C) ЦУк wxGrid_GetDefaultEditor(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellEditor(ЦУк сам, цел row, цел col);
            static extern (C) ЦУк wxGrid_GetCellValue(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellValue(ЦУк сам, цел row, цел col, ткст s);
            static extern (C) бул   wxGrid_IsReadOnly(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetReadOnly(ЦУк сам, цел row, цел col, бул isReadOnly);
            static extern (C) проц   wxGrid_SelectRow(ЦУк сам, цел row, бул addToSelected);
            static extern (C) проц   wxGrid_SelectCol(ЦУк сам, цел col, бул addToSelected);
            static extern (C) проц   wxGrid_SelectBlock(ЦУк сам, цел topRow, цел leftCol, цел bottomRow, цел rightCol, бул addToSelected);
            static extern (C) проц   wxGrid_SelectAll(ЦУк сам);
            static extern (C) бул   wxGrid_IsSelection(ЦУк сам);
            static extern (C) проц   wxGrid_DeselectRow(ЦУк сам, цел row);
            static extern (C) проц   wxGrid_DeselectCol(ЦУк сам, цел col);
            static extern (C) проц   wxGrid_DeselectCell(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_ClearSelection(ЦУк сам);
            static extern (C) бул   wxGrid_IsInSelection(ЦУк сам, цел row, цел col);
            //static extern (C) ЦУк wxGrid_GetSelectedCells(ЦУк сам);
            //static extern (C) ЦУк wxGrid_GetSelectionBlockTopLeft(ЦУк сам);
            //static extern (C) ЦУк wxGrid_GetSelectionBlockBottomRight(ЦУк сам);
            //static extern (C) ЦУк wxGrid_GetSelectedRows(ЦУк сам);
            //static extern (C) ЦУк wxGrid_GetSelectedCols(ЦУк сам);
            static extern (C) проц   wxGrid_BlockToDeviceRect(ЦУк сам, ЦУк topLeft, ЦУк bottomRight, inout Прямоугольник прям);
            static extern (C) ЦУк wxGrid_GetSelectionBackground(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetSelectionForeground(ЦУк сам);
            static extern (C) проц   wxGrid_SetSelectionBackground(ЦУк сам, ЦУк c);
            static extern (C) проц   wxGrid_SetSelectionForeground(ЦУк сам, ЦУк c);
            static extern (C) проц   wxGrid_RegisterDataType(ЦУк сам, ткст typeName, ЦУк renderer, ЦУк editor);
            static extern (C) ЦУк wxGrid_GetDefaultEditorForCell(ЦУк сам, цел row, цел col);
            static extern (C) ЦУк wxGrid_GetDefaultRendererForCell(ЦУк сам, цел row, цел col);
            static extern (C) ЦУк wxGrid_GetDefaultEditorForType(ЦУк сам, ткст typeName);
            static extern (C) ЦУк wxGrid_GetDefaultRendererForType(ЦУк сам, ткст typeName);
            static extern (C) проц   wxGrid_SetMargins(ЦУк сам, цел extraWidth, цел extraHeight);
            static extern (C) ЦУк wxGrid_GetGridWindow(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetGridRowLabelWindow(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetGridColLabelWindow(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetGridCornerLabelWindow(ЦУк сам);
            static extern (C) проц   wxGrid_UpdateDimensions(ЦУк сам);
            static extern (C) цел    wxGrid_GetRows(ЦУк сам);
            static extern (C) цел    wxGrid_GetCols(ЦУк сам);
            static extern (C) цел    wxGrid_GetCursorRow(ЦУк сам);
            static extern (C) цел    wxGrid_GetCursorColumn(ЦУк сам);
            static extern (C) цел    wxGrid_GetScrollPosX(ЦУк сам);
            static extern (C) цел    wxGrid_GetScrollPosY(ЦУк сам);
            static extern (C) проц   wxGrid_SetScrollX(ЦУк сам, цел x);
            static extern (C) проц   wxGrid_SetScrollY(ЦУк сам, цел y);
            static extern (C) проц   wxGrid_SetColumnWidth(ЦУк сам, цел col, цел ширина);
            static extern (C) цел    wxGrid_GetColumnWidth(ЦУк сам, цел col);
            static extern (C) проц   wxGrid_SetRowHeight(ЦУк сам, цел row, цел высота);
            static extern (C) цел    wxGrid_GetViewHeight(ЦУк сам);
            static extern (C) цел    wxGrid_GetViewWidth(ЦУк сам);
            static extern (C) проц   wxGrid_SetLabelSize(ЦУк сам, цел orientation, цел sz);
            static extern (C) цел    wxGrid_GetLabelSize(ЦУк сам, цел orientation);
            static extern (C) проц   wxGrid_SetLabelAlignment(ЦУк сам, цел orientation, цел alignment);
            static extern (C) цел    wxGrid_GetLabelAlignment(ЦУк сам, цел orientation, цел alignment);
            static extern (C) проц   wxGrid_SetLabelValue(ЦУк сам, цел orientation, ткст val, цел поз);
            static extern (C) ЦУк wxGrid_GetLabelValue(ЦУк сам, цел orientation, цел поз);
            static extern (C) ЦУк wxGrid_GetCellTextFontGrid(ЦУк сам);
            static extern (C) ЦУк wxGrid_GetCellTextFont(ЦУк сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellTextFontGrid(ЦУк сам, ЦУк fnt);
            static extern (C) проц   wxGrid_SetCellTextFont(ЦУк сам, ЦУк fnt, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellTextColour(ЦУк сам, цел row, цел col, ЦУк val);
            static extern (C) проц   wxGrid_SetCellTextColourGrid(ЦУк сам, ЦУк col);
            static extern (C) проц   wxGrid_SetCellBackgroundColourGrid(ЦУк сам, ЦУк col);
            static extern (C) проц   wxGrid_SetCellBackgroundColour(ЦУк сам, цел row, цел col, ЦУк colour);
            static extern (C) бул   wxGrid_GetEditable(ЦУк сам);
            static extern (C) проц   wxGrid_SetEditable(ЦУк сам, бул edit);
            static extern (C) бул   wxGrid_GetEditInPlace(ЦУк сам);
            static extern (C) проц   wxGrid_SetCellAlignment(ЦУк сам, цел alignment, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellAlignmentGrid(ЦУк сам, цел alignment);
            static extern (C) проц   wxGrid_SetCellBitmap(ЦУк сам, ЦУк битмап, цел row, цел col);
            static extern (C) проц   wxGrid_SetDividerPen(ЦУк сам, ЦУк перо);
            static extern (C) ЦУк wxGrid_GetDividerPen(ЦУк сам);
            static extern (C) цел    wxGrid_GetRowHeight(ЦУк сам, цел row);
            //! \endcond

        //-----------------------------------------------------------------------------

    alias Grid wxGrid;
    public class Grid : ScrolledWindow
    {
        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this()
            { this(wxGrid_ctor()); }

        public this(Окно родитель, цел ид)
            { this(родитель, ид, wxDefaultPosition, wxDefaultSize, wxWANTS_CHARS, "grid"); }
	    
        public this(Окно родитель, цел ид, Точка поз)
            { this(родитель, ид, поз, wxDefaultSize, wxWANTS_CHARS, "grid"); }
	    
        public this(Окно родитель, цел ид, Точка поз, Размер size)
            { this(родитель, ид, поз, size, wxWANTS_CHARS, "grid"); }
	    
        public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль)
            { this(родитель, ид, поз, size, стиль, "grid"); }

        public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, ткст имя)
            { this(wxGrid_ctorFull(wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя)); }

        //public  this(Окно родитель, цел x, цел y, цел w, цел h, цел стиль, ткст имя)
        //    { super(wxGrid_ctor(wxObject.SafePtr(родитель), x, y, w, h, стиль, имя)); }
	
	//---------------------------------------------------------------------
	// ctors with сам created ид
	
	public this(Окно родитель)
            { this(родитель, Окно.UniqueID, wxDefaultPosition, wxDefaultSize, wxWANTS_CHARS, "grid"); }
	    
        public this(Окно родитель, Точка поз)
            { this(родитель, Окно.UniqueID, поз, wxDefaultSize, wxWANTS_CHARS, "grid"); }
	    
        public this(Окно родитель, Точка поз, Размер size)
            { this(родитель, Окно.UniqueID, поз, size, wxWANTS_CHARS, "grid"); }
	    
        public this(Окно родитель, Точка поз, Размер size, цел стиль)
            { this(родитель, Окно.UniqueID, поз, size, стиль, "grid"); }

        public this(Окно родитель, Точка поз, Размер size, цел стиль, ткст имя)
		{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}

        //-----------------------------------------------------------------------------

        public бул CreateGrid(цел numRows, цел numCols)
        { return CreateGrid(numRows, numCols, GridSelectionMode.wxGridSelectCells); }

            public бул CreateGrid(цел numRows, цел numCols, GridSelectionMode selmode)
            {
            return wxGrid_CreateGrid(шхобъ, numRows, numCols, cast(цел)selmode);
            }

        //-----------------------------------------------------------------------------

            public проц SelectionMode(GridSelectionMode значение) { wxGrid_SetSelectionMode(шхобъ, cast(цел)значение); }
            //get { return wxGrid_GetSelectionMode(шхобъ); }
    
            //-----------------------------------------------------------------------------

            public цел NumberRows() { return wxGrid_GetNumberRows(шхобъ); }
    
            public цел NumberCols() { return wxGrid_GetNumberCols(шхобъ); }

        //-----------------------------------------------------------------------------

       //     public GridTableBase Table() { return cast(GridTableBase)FindObject(wxGrid_GetTable(шхобъ), &GridTableBase.Нов); }
        
        public бул SetTable(GridTableBase table)
        {
            return SetTable(table, нет, GridSelectionMode.wxGridSelectCells ); 
        }
        
        public бул SetTable(GridTableBase table, бул takeOwnerShip)
        {
            return SetTable(table, takeOwnerShip, GridSelectionMode.wxGridSelectCells);
        }
    
            public бул SetTable(GridTableBase table, бул takeOwnership, GridSelectionMode select)
            {
            return wxGrid_SetTable(шхобъ, wxObject.SafePtr(table), takeOwnership, cast(цел)select);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц ClearGrid()
            {
            wxGrid_ClearGrid(шхобъ);
            }

            //-----------------------------------------------------------------------------
        
        public бул InsertRows()
        {
            return InsertRows(0, 1, да);
        }
        
        public бул InsertRows(цел поз)
        {
            return InsertRows(поз, 1, да);
        }
        
        public бул InsertRows(цел поз, цел numRows)
        {
            return InsertRows(поз, numRows, да);
        }   
    
            public бул InsertRows(цел поз, цел numRows, бул updateLabels)
            {
            return wxGrid_InsertRows(шхобъ, поз, numRows, updateLabels);
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
            return wxGrid_AppendRows(шхобъ, numRows, updateLabels);
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
            return wxGrid_DeleteRows(шхобъ, поз, numRows, updateLabels);
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
            return wxGrid_InsertCols(шхобъ, поз, numCols, updateLabels);
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
            return wxGrid_AppendCols(шхобъ, numCols, updateLabels);
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
            return wxGrid_DeleteCols(шхобъ, поз, numCols, updateLabels);
            }

            //-----------------------------------------------------------------------------
    
            public проц BeginBatch()
            {
            wxGrid_BeginBatch(шхобъ);
            }
    
            public проц EndBatch()
            {
            wxGrid_EndBatch(шхобъ);
            }
    
            public цел BatchCount() { return wxGrid_GetBatchCount(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public проц ForceRefresh()
            {
            wxGrid_ForceRefresh(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул IsEditable() { return wxGrid_IsEditable(шхобъ); }
            public проц IsEditable(бул значение) { wxGrid_EnableEditing(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public проц CellEditControlEnabled(бул значение) { wxGrid_EnableCellEditControl(шхобъ, значение); }
            public бул CellEditControlEnabled() { return wxGrid_IsCellEditControlEnabled(шхобъ); }
    
            public проц DisableCellEditControl()
            {
            wxGrid_DisableCellEditControl(шхобъ);
            }
    
            public бул CanEnableCellControl() { return wxGrid_CanEnableCellControl(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public бул IsCellEditControlShown() { return wxGrid_IsCellEditControlShown(шхобъ); }
    
            public бул IsCurrentCellReadOnly() { return wxGrid_IsCurrentCellReadOnly(шхобъ); }

            //-----------------------------------------------------------------------------
    
            public проц ShowCellEditControl()
            {
            wxGrid_ShowCellEditControl(шхобъ);
            }
    
            public проц HideCellEditControl()
            {
            wxGrid_HideCellEditControl(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SaveEditControlValue()
            {
            wxGrid_SaveEditControlValue(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            /*public проц XYToCell(цел x, цел y,  GridCellCoords )
            {
                    wxGrid_XYToCell(шхобъ, x, y, wxObject.SafePtr(GridCellCoords ));
            }*/
    
            //-----------------------------------------------------------------------------
    
            public цел YToRow(цел y)
            {
            return wxGrid_YToRow(шхобъ, y);
            }
    
            public цел XToCol(цел x)
            {
            return wxGrid_XToCol(шхобъ, x);
            }
    
            public цел YToEdgeOfRow(цел y)
            {
            return wxGrid_YToEdgeOfRow(шхобъ, y);
            }
    
            public цел XToEdgeOfCol(цел x)
            {
            return wxGrid_XToEdgeOfCol(шхобъ, x);
            }
    
            //-----------------------------------------------------------------------------
    
            public Прямоугольник CellToRect(цел row, цел col)
            {
            Прямоугольник прям;
            wxGrid_CellToRect(шхобъ, row, col, прям);
            return прям;
            }
    
            //-----------------------------------------------------------------------------
    
            public цел GridCursorRow() { return wxGrid_GetGridCursorRow(шхобъ); }
    
            public цел GridCursorCol() { return wxGrid_GetGridCursorCol(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public бул IsVisible(цел row, цел col, бул wholeCellVisible)
            {
            return wxGrid_IsVisible(шхобъ, row, col, wholeCellVisible);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц MakeCellVisible(цел row, цел col)
            {
            wxGrid_MakeCellVisible(шхобъ, row, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetGridCursor(цел row, цел col)
            {
            wxGrid_SetGridCursor(шхобъ, row, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул MoveCursorUp(бул expandSelection)
            {
            return wxGrid_MoveCursorUp(шхобъ, expandSelection);
            }
    
            public бул MoveCursorDown(бул expandSelection)
            {
            return wxGrid_MoveCursorDown(шхобъ, expandSelection);
            }
    
            public бул MoveCursorLeft(бул expandSelection)
            {
            return wxGrid_MoveCursorLeft(шхобъ, expandSelection);
            }
    
            public бул MoveCursorRight(бул expandSelection)
            {
            return wxGrid_MoveCursorRight(шхобъ, expandSelection);
            }
    
            public бул MovePageDown()
            {
            return wxGrid_MovePageDown(шхобъ);
            }
    
            public бул MovePageUp()
            {
            return wxGrid_MovePageUp(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул MoveCursorUpBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorUpBlock(шхобъ, expandSelection);
            }
    
            public бул MoveCursorDownBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorDownBlock(шхобъ, expandSelection);
            }
    
            public бул MoveCursorLeftBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorLeftBlock(шхобъ, expandSelection);
            }
    
            public бул MoveCursorRightBlock(бул expandSelection)
            {
            return wxGrid_MoveCursorRightBlock(шхобъ, expandSelection);
            }
    
            //-----------------------------------------------------------------------------
    
            public цел DefaultRowLabelSize() { return wxGrid_GetDefaultRowLabelSize(шхобъ); }
    
            public цел RowLabelSize() { return wxGrid_GetRowLabelSize(шхобъ); }
            public проц RowLabelSize(цел значение) { wxGrid_SetRowLabelSize(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public цел DefaultColLabelSize() { return wxGrid_GetDefaultColLabelSize(шхобъ); }
    
            public цел ColLabelSize() { return wxGrid_GetColLabelSize(шхобъ); }
            public проц ColLabelSize(цел значение) { wxGrid_SetColLabelSize(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public Цвет LabelBackgroundColour() { return new Цвет(wxGrid_GetLabelBackgroundColour(шхобъ), да); }
            public проц LabelBackgroundColour(Цвет значение) { wxGrid_SetLabelBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
    
            public Цвет LabelTextColour() { return new Цвет(wxGrid_GetLabelTextColour(шхобъ), да); }
            public проц LabelTextColour(Цвет значение) { wxGrid_SetLabelTextColour(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public Шрифт LabelFont() { return new Шрифт(wxGrid_GetLabelFont(шхобъ)); }
            public проц LabelFont(Шрифт значение) { wxGrid_SetLabelFont(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public проц GetRowLabelAlignment(out цел horiz, out цел vert)
            {
            wxGrid_GetRowLabelAlignment(шхобъ, horiz, vert);
            }
    
            public проц GetColLabelAlignment(out цел horiz, out цел vert)
            {
            wxGrid_GetColLabelAlignment(шхобъ, horiz, vert);
            }
    
            //-----------------------------------------------------------------------------
    
            public ткст GetRowLabelValue(цел row)
            {
            return cast(ткст) new wxString(wxGrid_GetRowLabelValue(шхобъ, row), да);
            }
    
            public ткст GetColLabelValue(цел col)
            {
            return cast(ткст) new wxString(wxGrid_GetColLabelValue(шхобъ, col), да);
            }
    
            //-----------------------------------------------------------------------------
    
            public Цвет GridLineColour() { return new Цвет(wxGrid_GetGridLineColour(шхобъ), да); }
            public проц GridLineColour(Цвет значение) { wxGrid_SetGridLineColour(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public Цвет CellHighlightColour() { return new Цвет(wxGrid_GetCellHighlightColour(шхобъ), да); }
            public проц CellHighlightColour(Цвет значение) { wxGrid_SetCellHighlightColour(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public цел CellHighlightPenWidth() { return wxGrid_GetCellHighlightPenWidth(шхобъ); }
            public проц CellHighlightPenWidth(цел значение) { wxGrid_SetCellHighlightPenWidth(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public цел CellHighlightROPenWidth() { return wxGrid_GetCellHighlightROPenWidth(шхобъ); }
            public проц CellHighlightROPenWidth(цел значение) { wxGrid_SetCellHighlightROPenWidth(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetRowLabelAlignment(цел horiz, цел vert)
            {
            wxGrid_SetRowLabelAlignment(шхобъ, horiz, vert);
            }
    
            public проц SetColLabelAlignment(цел horiz, цел vert)
            {
            wxGrid_SetColLabelAlignment(шхобъ, horiz, vert);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetRowLabelValue(цел row, ткст str)
            {
            wxGrid_SetRowLabelValue(шхобъ, row, str);
            }
    
            public проц SetColLabelValue(цел col, ткст str)
            {
            wxGrid_SetColLabelValue(шхобъ, col, str);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц DragRowSizeEnabled(бул значение) { wxGrid_EnableDragRowSize(шхобъ, значение); }
            public бул DragRowSizeEnabled() { return wxGrid_CanDragRowSize(шхобъ); }
    
            public проц DisableDragRowSize()
            {
            wxGrid_DisableDragRowSize(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц DragColSizeEnabled(бул значение) { wxGrid_EnableDragColSize(шхобъ, значение); }
            public бул DragColSizeEnabled() { return wxGrid_CanDragColSize(шхобъ); }
    
            public проц DisableDragColSize()
            {
            wxGrid_DisableDragColSize(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц DragGridSizeEnabled(бул значение) { wxGrid_EnableDragGridSize(шхобъ, значение); }
            public бул DragGridSizeEnabled() { return wxGrid_CanDragGridSize(шхобъ); }
    
            public проц DisableDragGridSize()
            {
            wxGrid_DisableDragGridSize(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetAttr(цел row, цел col, GridCellAttr attr)
            {
            wxGrid_SetAttr(шхобъ, row, col, wxObject.SafePtr(attr));
            }
    
            public проц SetRowAttr(цел row, GridCellAttr attr)
            {
            wxGrid_SetRowAttr(шхобъ, row, wxObject.SafePtr(attr));
            }
    
            public проц SetColAttr(цел col, GridCellAttr attr)
            {
            wxGrid_SetColAttr(шхобъ, col, wxObject.SafePtr(attr));
            }
    
            //-----------------------------------------------------------------------------
    
            public проц ColFormatBool(цел значение) { wxGrid_SetColFormatBool(шхобъ, значение); }
    
            public проц ColFormatNumber(цел значение) { wxGrid_SetColFormatNumber(шхобъ, значение); }
        
        public проц SetColFormatFloat(цел col)
        {
            SetColFormatFloat(col, -1, -1);
        }
        
        public проц SetColFormatFloat(цел col, цел ширина)
        {
            SetColFormatFloat(col, ширина, -1);
        }
    
            public проц SetColFormatFloat(цел col, цел ширина, цел precision)
            {
            wxGrid_SetColFormatFloat(шхобъ, col, ширина, precision);
            }
    
            public проц SetColFormatCustom(цел col, ткст typeName)
            {
            wxGrid_SetColFormatCustom(шхобъ, col, typeName);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц GridLinesEnabled(бул значение) { wxGrid_EnableGridLines(шхобъ, значение); } 
            public бул GridLinesEnabled() { return wxGrid_GridLinesEnabled(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public цел DefaultRowSize() { return wxGrid_GetDefaultRowSize(шхобъ); }
    
            public цел GetRowSize(цел row)
            {
            return wxGrid_GetRowSize(шхобъ, row);
            }
    
            public цел DefaultColSize() { return wxGrid_GetDefaultColSize(шхобъ); }
    
            public цел GetColSize(цел col)
            {
            return wxGrid_GetColSize(шхобъ, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public Цвет DefaultCellBackgroundColour() { return new Цвет(wxGrid_GetDefaultCellBackgroundColour(шхобъ), да); }
            public проц DefaultCellBackgroundColour(Цвет значение) { wxGrid_SetDefaultCellBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
    
            public Цвет DefaultCellTextColour() { return new Цвет(wxGrid_GetDefaultCellTextColour(шхобъ), да); }
            public проц DefaultCellTextColour(Цвет значение) { wxGrid_SetDefaultCellTextColour(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public Шрифт DefaultCellFont() { return new Шрифт(wxGrid_GetDefaultCellFont(шхобъ)); }
            public проц DefaultCellFont(Шрифт значение) { wxGrid_SetDefaultCellFont(шхобъ, wxObject.SafePtr(значение)); }
    
            public Шрифт GetCellFont(цел row, цел col)
            {
            return new Шрифт(wxGrid_GetCellFont(шхобъ, row, col));
            }
    
            //-----------------------------------------------------------------------------
    
            public проц GetDefaultCellAlignment(inout цел horiz, inout цел vert)
            {
            wxGrid_GetDefaultCellAlignment(шхобъ, horiz, vert);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц GetCellAlignment(цел row, цел col, inout цел horiz, inout цел vert)
            {
            wxGrid_GetCellAlignment(шхобъ, row, col, horiz, vert);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул DefaultCellOverflow() { return wxGrid_GetDefaultCellOverflow(шхобъ); }
            public проц DefaultCellOverflow(бул значение) { wxGrid_SetDefaultCellOverflow(шхобъ, значение); }
    
            public бул GetCellOverflow(цел row, цел col)
            {
            return wxGrid_GetCellOverflow(шхобъ, row, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц GetCellSize(цел row, цел col, inout цел num_rows, inout цел num_cols)
            {
            wxGrid_GetCellSize(шхобъ, row, col, num_rows, num_cols);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetDefaultRowSize(цел высота, бул resizeExistingRows)
            {
            wxGrid_SetDefaultRowSize(шхобъ, высота, resizeExistingRows);
            }
    
            public проц SetRowSize(цел row, цел высота)
            {
            wxGrid_SetRowSize(шхобъ, row, высота);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetDefaultColSize(цел ширина, бул resizeExistingCols)
            {
            wxGrid_SetDefaultColSize(шхобъ, ширина, resizeExistingCols);
            }
    
            public проц SetColSize(цел col, цел ширина)
            {
            wxGrid_SetColSize(шхобъ, col, ширина);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц AutoSizeColumn(цел col, бул setAsMin)
            {
            wxGrid_AutoSizeColumn(шхобъ, col, setAsMin);
            }
    
            public проц AutoSizeRow(цел row, бул setAsMin)
            {
            wxGrid_AutoSizeRow(шхобъ, row, setAsMin);
            }
    
            //-----------------------------------------------------------------------------
        
        public проц AutoSizeColumns()
        {
            AutoSizeColumns(да);
        }
    
            public проц AutoSizeColumns(бул setAsMin)
            {
            wxGrid_AutoSizeColumns(шхобъ, setAsMin);
            }
        
        public проц AutoSizeRows()
        {
            AutoSizeRows(да);
        }
    
            public проц AutoSizeRows(бул setAsMin)
            {
            wxGrid_AutoSizeRows(шхобъ, setAsMin);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц AutoSize()
            {
            wxGrid_AutoSize(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetColMinimalWidth(цел col, цел ширина)
            {
            wxGrid_SetColMinimalWidth(шхобъ, col, ширина);
            }
    
            public проц SetRowMinimalHeight(цел row, цел ширина)
            {
            wxGrid_SetRowMinimalHeight(шхобъ, row, ширина);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц ColMinimalAcceptableWidth(цел значение) { wxGrid_SetColMinimalAcceptableWidth(шхобъ, значение); }
            public цел ColMinimalAcceptableWidth() { return wxGrid_GetColMinimalAcceptableWidth(шхобъ); }
    
            public проц RowMinimalAcceptableHeight(цел значение) { wxGrid_SetRowMinimalAcceptableHeight(шхобъ, значение); }
            public цел RowMinimalAcceptableHeight() { return wxGrid_GetRowMinimalAcceptableHeight(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellFont(цел row, цел col, Шрифт fnt)
            {
            wxGrid_SetCellFont(шхобъ, row, col, wxObject.SafePtr(fnt));
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetDefaultCellAlignment(цел horiz, цел vert)
            {
            wxGrid_SetDefaultCellAlignment(шхобъ, horiz, vert);
            }
    
            public проц SetCellAlignment(цел row, цел col, цел horiz, цел vert)
            {
            wxGrid_SetCellAlignmentHV(шхобъ, row, col, horiz, vert);
            }
    
            public проц SetCellOverflow(цел row, цел col, бул allow)
            {
            wxGrid_SetCellOverflow(шхобъ, row, col, allow);
            }
    
            public проц SetCellSize(цел row, цел col, цел num_rows, цел num_cols)
            {
            wxGrid_SetCellSize(шхобъ, row, col, num_rows, num_cols);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц DefaultRenderer(GridCellRenderer значение) { wxGrid_SetDefaultRenderer(шхобъ, wxObject.SafePtr(значение)); }
            //get { return wxGrid_GetDefaultRenderer(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellRenderer(цел row, цел col, GridCellRenderer renderer)
            {
            wxGrid_SetCellRenderer(шхобъ, row, col, wxObject.SafePtr(renderer));
            }
    
            //-----------------------------------------------------------------------------
    /+
            public GridCellRenderer GetCellRenderer(цел row, цел col)
            {
                    return cast(GridCellRenderer)FindObject(wxGrid_GetCellRenderer(шхобъ, row, col), &GridCellRenderer.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    
            public проц DefaultEditor(GridCellEditor значение) { wxGrid_SetDefaultEditor(шхобъ, wxObject.SafePtr(значение)); }/+
            public GridCellEditor DefaultEditor() { return cast(GridCellEditor)FindObject(wxGrid_GetDefaultEditor(шхобъ), &GridCellEditor.Нов); }
    +/
            //-----------------------------------------------------------------------------
    
            public проц SetCellEditor(цел row, цел col, GridCellEditor editor)
            {
                wxGrid_SetCellEditor(шхобъ, row, col, wxObject.SafePtr(editor));
            }
    
            //-----------------------------------------------------------------------------
    /+
            public GridCellEditor GetCellEditor(цел row, цел col)
            {
                return cast(GridCellEditor)FindObject(wxGrid_GetCellEditor(шхобъ, row, col), &GridCellEditor.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    
            public ткст GetCellValue(цел row, цел col)
            {
                return cast(ткст) new wxString(wxGrid_GetCellValue(шхобъ, row, col), да);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellValue(цел row, цел col, ткст s)
            {
                wxGrid_SetCellValue(шхобъ, row, col, s);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул IsReadOnly(цел row, цел col)
            {
                return wxGrid_IsReadOnly(шхобъ, row, col);
            }
        
        public проц SetReadOnly(цел row, цел col)
        {
            SetReadOnly(row, col, да);
        }
    
            public проц SetReadOnly(цел row, цел col, бул isReadOnly)
            {
            wxGrid_SetReadOnly(шхобъ, row, col, isReadOnly);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SelectRow(цел row, бул addToSelected)
            {
            wxGrid_SelectRow(шхобъ, row, addToSelected);
            }
    
            public проц SelectCol(цел col, бул addToSelected)
            {
            wxGrid_SelectCol(шхобъ, col, addToSelected);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SelectBlock(цел topRow, цел leftCol, цел bottomRow, цел rightCol, бул addToSelected)
            {
            wxGrid_SelectBlock(шхобъ, topRow, leftCol, bottomRow, rightCol, addToSelected);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SelectAll()
            {
            wxGrid_SelectAll(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул IsSelection() { return wxGrid_IsSelection(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public проц DeselectRow(цел row)
            {
            wxGrid_DeselectRow(шхобъ, row);
            }
    
            public проц DeselectCol(цел col)
            {
            wxGrid_DeselectCol(шхобъ, col);
            }
    
            public проц DeselectCell(цел row, цел col)
            {
            wxGrid_DeselectCell(шхобъ, row, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц ClearSelection()
            {
            wxGrid_ClearSelection(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public бул IsInSelection(цел row, цел col)
            {
            return wxGrid_IsInSelection(шхобъ, row, col);
            }
    
            //-----------------------------------------------------------------------------

//! \cond VERSION
version(NOT_IMPLEMENTED){
            public GridCellCoordsArray GetSelectedCells()
        {
            return wxGrid_GetSelectedCells(шхобъ);
            }

            //-----------------------------------------------------------------------------
    
            public GridCellCoordsArray GetSelectionBlockTopLeft()
            {
            return wxGrid_GetSelectionBlockTopLeft(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public GridCellCoordsArray GetSelectionBlockBottomRight()
            {
            return wxGrid_GetSelectionBlockBottomRight(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public МассивЦел GetSelectedRows()
            {
            return wxGrid_GetSelectedRows(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public МассивЦел GetSelectedCols()
            {
            return wxGrid_GetSelectedCols(шхобъ);
            }
} // version(NOT_IMPLEMENTED)
//! \endcond
            //-----------------------------------------------------------------------------
    
            public Прямоугольник BlockToDeviceRect(GridCellCoords topLeft, GridCellCoords bottomRight)
            {
            Прямоугольник прям;
            wxGrid_BlockToDeviceRect(шхобъ, wxObject.SafePtr(topLeft), wxObject.SafePtr(bottomRight), прям);
            return прям;
            }
    
            //-----------------------------------------------------------------------------
    
            public Цвет SelectionBackground() { return new Цвет(wxGrid_GetSelectionBackground(шхобъ), да); }
            public проц SelectionBackground(Цвет значение) { wxGrid_SetSelectionBackground(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public Цвет SelectionForeground() { return new Цвет(wxGrid_GetSelectionForeground(шхобъ), да); }
            public проц SelectionForeground(Цвет значение) { wxGrid_SetSelectionForeground(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public проц RegisterDataType(ткст typeName, GridCellRenderer renderer, GridCellEditor editor)
            {
            wxGrid_RegisterDataType(шхобъ, typeName, wxObject.SafePtr(renderer), wxObject.SafePtr(editor));
            }
    
            //-----------------------------------------------------------------------------
    /+
            public GridCellEditor GetDefaultEditorForCell(цел row, цел col)
            {
            return cast(GridCellEditor)FindObject(wxGrid_GetDefaultEditorForCell(шхобъ, row, col), &GridCellEditor.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            public GridCellRenderer GetDefaultRendererForCell(цел row, цел col)
            {
                    return cast(GridCellRenderer)FindObject(wxGrid_GetDefaultRendererForCell(шхобъ, row, col), &GridCellRenderer.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            public GridCellEditor GetDefaultEditorForType(ткст typeName)
            {
            return cast(GridCellEditor)FindObject(wxGrid_GetDefaultEditorForType(шхобъ, typeName), &GridCellEditor.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            public GridCellRenderer GetDefaultRendererForType(ткст typeName)
            {
                    return cast(GridCellRenderer)FindObject(wxGrid_GetDefaultRendererForType(шхобъ, typeName), &GridCellRenderer.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    
            public проц SetMargins(цел extraWidth, цел extraHeight)
            {
            wxGrid_SetMargins(шхобъ, extraWidth, extraHeight);
            }
    
            //-----------------------------------------------------------------------------
    
            public Окно GridWindow() { return cast(Окно)FindObject(wxGrid_GetGridWindow(шхобъ)); }
    
            public Окно GridRowLabelWindow() { return cast(Окно)FindObject(wxGrid_GetGridRowLabelWindow(шхобъ)); }
    
            public Окно GridColLabelWindow() { return cast(Окно)FindObject(wxGrid_GetGridColLabelWindow(шхобъ)); }
    
            public Окно GridCornerLabelWindow() { return cast(Окно)FindObject(wxGrid_GetGridCornerLabelWindow(шхобъ)); }
    
            //-----------------------------------------------------------------------------
    
            public проц UpdateDimensions()
            {
            wxGrid_UpdateDimensions(шхобъ);
            }
    
            //-----------------------------------------------------------------------------
    
            public цел Rows() { return wxGrid_GetRows(шхобъ); }
    
            public цел Cols() { return wxGrid_GetCols(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public цел CursorRow() { return wxGrid_GetCursorRow(шхобъ); }
    
            public цел CursorColumn() { return wxGrid_GetCursorColumn(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public цел ScrollPosX() { return wxGrid_GetScrollPosX(шхобъ); }
            public проц ScrollPosX(цел значение) { wxGrid_SetScrollX(шхобъ, значение); }
    
            public цел ScrollPosY() { return wxGrid_GetScrollPosY(шхобъ); }
            public проц ScrollPosY(цел значение) { wxGrid_SetScrollY(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetColumnWidth(цел col, цел ширина)
            {
            wxGrid_SetColumnWidth(шхобъ, col, ширина);
            }
    
            public цел GetColumnWidth(цел col)
            {
            return wxGrid_GetColumnWidth(шхобъ, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetRowHeight(цел row, цел высота)
            {
            wxGrid_SetRowHeight(шхобъ, row, высота);
            }
    
            //-----------------------------------------------------------------------------
    
            public цел ViewHeight() { return wxGrid_GetViewHeight(шхобъ); }
    
            public цел ViewWidth() { return wxGrid_GetViewWidth(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetLabelSize(цел orientation, цел sz)
            {
            wxGrid_SetLabelSize(шхобъ, orientation, sz);
            }
    
            public цел GetLabelSize(цел orientation)
            {
            return wxGrid_GetLabelSize(шхобъ, orientation);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetLabelAlignment(цел orientation, цел alignment)
            {
            wxGrid_SetLabelAlignment(шхобъ, orientation, alignment);
            }
    
            public цел GetLabelAlignment(цел orientation, цел alignment)
            {
            return wxGrid_GetLabelAlignment(шхобъ, orientation, alignment);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetLabelValue(цел orientation, ткст val, цел поз)
            {
            wxGrid_SetLabelValue(шхобъ, orientation, val, поз);
            }
    
            public ткст GetLabelValue(цел orientation, цел поз)
            {
            return cast(ткст) new wxString(wxGrid_GetLabelValue(шхобъ, orientation, поз), да);
            }
    
            //-----------------------------------------------------------------------------
    
            public Шрифт CellTextFont() { return new Шрифт(wxGrid_GetCellTextFontGrid(шхобъ)); }
            public проц CellTextFont(Шрифт значение) { wxGrid_SetCellTextFontGrid(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public Шрифт GetCellTextFont(цел row, цел col)
            {
            return new Шрифт(wxGrid_GetCellTextFont(шхобъ, row, col));
            }
    
            public проц SetCellTextFont(Шрифт fnt, цел row, цел col)
            {
            wxGrid_SetCellTextFont(шхобъ, wxObject.SafePtr(fnt), row, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellTextColour(цел row, цел col, Цвет val)
            {
            wxGrid_SetCellTextColour(шхобъ, row, col, wxObject.SafePtr(val));
            }
    
            //-----------------------------------------------------------------------------
    
            public проц CellTextColour(Цвет значение) { wxGrid_SetCellTextColourGrid(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
                
            public Цвет GetCellTextColour(цел row, цел col)
            {
            return new Цвет(wxGrid_GetCellTextColour(шхобъ, row, col), да); 
            }
    
            //-----------------------------------------------------------------------------
    
            public проц CellBackgroundColour(Цвет значение) { wxGrid_SetCellBackgroundColourGrid(шхобъ, wxObject.SafePtr(значение)); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellBackgroundColour(цел row, цел col, Цвет colour)
            {
            wxGrid_SetCellBackgroundColour(шхобъ, row, col, wxObject.SafePtr(colour));
            }
    
            public Цвет GetCellBackgroundColour(цел row, цел col)
            {
            return new Цвет(wxGrid_GetCellBackgroundColour(шхобъ, row, col), да); 
            }
    
            //-----------------------------------------------------------------------------
    
            public бул Editable() { return wxGrid_GetEditable(шхобъ); }
            public проц Editable(бул значение) { wxGrid_SetEditable(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public бул EditInPlace() { return wxGrid_GetEditInPlace(шхобъ); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellAlignment(цел alignment, цел row, цел col)
            {
            wxGrid_SetCellAlignment(шхобъ, alignment, row, col);
            }
    
            public проц CellAlignment(цел значение) { wxGrid_SetCellAlignmentGrid(шхобъ, значение); }
    
            //-----------------------------------------------------------------------------
    
            public проц SetCellBitmap(Битмап битмап, цел row, цел col)
            {
            wxGrid_SetCellBitmap(шхобъ, wxObject.SafePtr(битмап), row, col);
            }
    
            //-----------------------------------------------------------------------------
    
            public проц DividerPen(Перо значение) { wxGrid_SetDividerPen(шхобъ, wxObject.SafePtr(значение)); }
            public Перо DividerPen() { return new Перо(wxGrid_GetDividerPen(шхобъ)); }
    
            //-----------------------------------------------------------------------------
    
            public цел GetRowHeight(цел row)
            {
            return wxGrid_GetRowHeight(шхобъ, row);
            }

        //-----------------------------------------------------------------------------

		public проц CellLeftClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_LEFT_CLICK, ИД, значение, this); }
		public проц CellLeftClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц CellRightClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_RIGHT_CLICK, ИД, значение, this); }
		public проц CellRightClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц CellLeftDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_LEFT_DCLICK, ИД, значение, this); }
		public проц CellLeftDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц CellRightDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_RIGHT_DCLICK, ИД, значение, this); }
		public проц CellRightDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц LabelLeftClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_LEFT_CLICK, ИД, значение, this); }
		public проц LabelLeftClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц LabelRightClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_RIGHT_CLICK, ИД, значение, this); }
		public проц LabelRightClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц LabelLeftDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_LEFT_DCLICK, ИД, значение, this); }
		public проц LabelLeftDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц LabelRightDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_LABEL_RIGHT_DCLICK, ИД, значение, this); }
		public проц LabelRightDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц RowSize_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_ROW_SIZE, ИД, значение, this); }
		public проц RowSize_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ColumnSize_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_COL_SIZE, ИД, значение, this); }
		public проц ColumnSize_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц RangeSelect_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_RANGE_SELECT, ИД, значение, this); }
		public проц RangeSelect_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц CellChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_CELL_CHANGE, ИД, значение, this); }
		public проц CellChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SelectCell_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_SELECT_CELL, ИД, значение, this); }
		public проц SelectCell_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц EditorShown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_EDITOR_SHOWN, ИД, значение, this); }
		public проц EditorShown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц EditorHidden_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_EDITOR_HIDDEN, ИД, значение, this); }
		public проц EditorHidden_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц EditorCreate_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_GRID_EDITOR_CREATED, ИД, значение, this); }
		public проц EditorCreate_Remove(EventListener значение) { RemoveHandler(значение, this); }

    }

        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellCoords_ctor();
	static extern (C) проц   wxGridCellCoords_dtor(ЦУк сам);
        static extern (C) цел    wxGridCellCoords_GetRow(ЦУк сам);
        static extern (C) проц   wxGridCellCoords_SetRow(ЦУк сам, цел n);
        static extern (C) цел    wxGridCellCoords_GetCol(ЦУк сам);
        static extern (C) проц   wxGridCellCoords_SetCol(ЦУк сам, цел n);
        static extern (C) проц   wxGridCellCoords_Set(ЦУк сам, цел row, цел col);
        //! \endcond
	
        //-----------------------------------------------------------------------------
    
    alias GridCellCoords wxGridCellCoords;
    public class GridCellCoords : wxObject
    {
        public this(ЦУк шхобъ)
	{ 
		super(шхобъ);
	}
	
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}
    
        public this()
            { this(wxGridCellCoords_ctor(), да); }
    
        public this(цел к, цел c)
        {
        	this();
            Установи(к, c);
        }
	
	//---------------------------------------------------------------------
				
	override protected проц dtor() { wxGridCellCoords_dtor(шхобъ); }
    
        //-----------------------------------------------------------------------------
    
        public проц Row(цел значение) { wxGridCellCoords_SetRow(шхобъ, значение); }
        public цел Row() { return wxGridCellCoords_GetRow(шхобъ); }
    
        //-----------------------------------------------------------------------------
    
        public проц Col(цел значение) { wxGridCellCoords_SetCol(шхобъ, значение); }
        public цел Col() { return wxGridCellCoords_GetCol(шхобъ); }
    
        //-----------------------------------------------------------------------------
    
        public проц Установи(цел row, цел col)
        {
            wxGridCellCoords_Set(шхобъ, row, col);
        }
    }

        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellAttr_ctor(ЦУк colText, ЦУк colBack, ЦУк шрифт, цел hAlign, цел vAlign);
        static extern (C) ЦУк wxGridCellAttr_ctor2();
        static extern (C) ЦУк wxGridCellAttr_ctor3(ЦУк attrDefault);
        static extern (C) ЦУк wxGridCellAttr_Clone(ЦУк сам);
        static extern (C) проц   wxGridCellAttr_MergeWith(ЦУк сам, ЦУк mergefrom);
        static extern (C) проц   wxGridCellAttr_IncRef(ЦУк сам);
        static extern (C) проц   wxGridCellAttr_DecRef(ЦУк сам);
        static extern (C) проц   wxGridCellAttr_SetTextColour(ЦУк сам, ЦУк colText);
        static extern (C) проц   wxGridCellAttr_SetBackgroundColour(ЦУк сам, ЦУк colBack);
        static extern (C) проц   wxGridCellAttr_SetFont(ЦУк сам, ЦУк шрифт);
        static extern (C) проц   wxGridCellAttr_SetAlignment(ЦУк сам, цел hAlign, цел vAlign);
        static extern (C) проц   wxGridCellAttr_SetSize(ЦУк сам, цел num_rows, цел num_cols);
        static extern (C) проц   wxGridCellAttr_SetOverflow(ЦУк сам, бул allow);
        static extern (C) проц   wxGridCellAttr_SetReadOnly(ЦУк сам, бул isReadOnly);
        static extern (C) проц   wxGridCellAttr_SetRenderer(ЦУк сам, ЦУк renderer);
        static extern (C) проц   wxGridCellAttr_SetEditor(ЦУк сам, ЦУк editor);
        static extern (C) бул   wxGridCellAttr_HasTextColour(ЦУк сам);
        static extern (C) бул   wxGridCellAttr_HasBackgroundColour(ЦУк сам);
        static extern (C) бул   wxGridCellAttr_HasFont(ЦУк сам);
        static extern (C) бул   wxGridCellAttr_HasAlignment(ЦУк сам);
        static extern (C) бул   wxGridCellAttr_HasRenderer(ЦУк сам);
        static extern (C) бул   wxGridCellAttr_HasEditor(ЦУк сам);
        static extern (C) бул   wxGridCellAttr_HasReadWriteMode(ЦУк сам);
        static extern (C) ЦУк wxGridCellAttr_GetTextColour(ЦУк сам);
        static extern (C) ЦУк wxGridCellAttr_GetBackgroundColour(ЦУк сам);
        static extern (C) ЦУк wxGridCellAttr_GetFont(ЦУк сам);
        static extern (C) проц   wxGridCellAttr_GetAlignment(ЦУк сам, inout цел hAlign, inout цел vAlign);
        static extern (C) проц   wxGridCellAttr_GetSize(ЦУк сам, inout цел num_rows, inout цел num_cols);
        static extern (C) бул   wxGridCellAttr_GetOverflow(ЦУк сам);
        static extern (C) ЦУк wxGridCellAttr_GetRenderer(ЦУк сам, ЦУк grid, цел row, цел col);
        static extern (C) ЦУк wxGridCellAttr_GetEditor(ЦУк сам, ЦУк grid, цел row, цел col);
        static extern (C) бул   wxGridCellAttr_IsReadOnly(ЦУк сам);
        static extern (C) проц   wxGridCellAttr_SetDefAttr(ЦУк сам, ЦУк defAttr);
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
    
        public this(ЦУк шхобъ) 
	{ 
		super(шхобъ);
	}
	
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}
            
        public this()
            { this(wxGridCellAttr_ctor2(), да); }
            
        public this(GridCellAttr attrDefault)
            { this(wxGridCellAttr_ctor3(wxObject.SafePtr(attrDefault)), да); }
    
        public this(Цвет colText, Цвет colBack, Шрифт шрифт, цел hAlign, цел vAlign)
            { this(wxGridCellAttr_ctor(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт), hAlign, vAlign), да); }
	    
	public static wxObject Нов(ЦУк ptr) { return new GridCellAttr(ptr); }
	//---------------------------------------------------------------------
				
	override protected проц dtor() {}
    
        //-----------------------------------------------------------------------------
    
        public GridCellAttr Clone()
        {
            return new GridCellAttr(wxGridCellAttr_Clone(шхобъ));
        }
    
        //-----------------------------------------------------------------------------
    
        public проц MergeWith(GridCellAttr mergefrom)
        {
            wxGridCellAttr_MergeWith(шхобъ, wxObject.SafePtr(mergefrom));
        }
    
        //-----------------------------------------------------------------------------
    
        public проц IncRef()
        {
            wxGridCellAttr_IncRef(шхобъ);
        }
    
        //-----------------------------------------------------------------------------
    
        public проц DecRef()
        {
            wxGridCellAttr_DecRef(шхобъ);
        }
    
        //-----------------------------------------------------------------------------
    
        public проц TextColour(Цвет значение) { wxGridCellAttr_SetTextColour(шхобъ, wxObject.SafePtr(значение)); }
        public Цвет TextColour() { return new Цвет(wxGridCellAttr_GetTextColour(шхобъ), да); }
    
        //-----------------------------------------------------------------------------
        
        public проц ЦветЗП(Цвет значение) { wxGridCellAttr_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
        public Цвет ЦветЗП() { return new Цвет(wxGridCellAttr_GetBackgroundColour(шхобъ), да); }
        
        //-----------------------------------------------------------------------------
        
        public проц шрифт(Шрифт значение) { wxGridCellAttr_SetFont(шхобъ, wxObject.SafePtr(значение)); }
        public Шрифт шрифт() { return new Шрифт(wxGridCellAttr_GetFont(шхобъ)); }
        
        //-----------------------------------------------------------------------------
        
        public проц SetAlignment(цел hAlign, цел vAlign)
        {
            wxGridCellAttr_SetAlignment(шхобъ, hAlign, vAlign);
        }
        
        public проц GetAlignment(inout цел hAlign, inout цел vAlign)
        {
            wxGridCellAttr_GetAlignment(шхобъ, hAlign, vAlign);
        }
        
        public проц УстРазм(цел num_rows, цел num_cols)
        {
            wxGridCellAttr_SetSize(шхобъ, num_rows, num_cols);
        }
        
        public проц GetSize(inout цел num_rows, inout цел num_cols)
        {
            wxGridCellAttr_GetSize(шхобъ, num_rows, num_cols);
        }
        
        //-----------------------------------------------------------------------------
        
        public проц Overflow(бул значение) { wxGridCellAttr_SetOverflow(шхобъ, значение); }
        public бул Overflow() { return wxGridCellAttr_GetOverflow(шхобъ); }
        
        //-----------------------------------------------------------------------------
        
        public проц ReadOnly(бул значение) { wxGridCellAttr_SetReadOnly(шхобъ, значение); }
        public бул ReadOnly() { return wxGridCellAttr_IsReadOnly(шхобъ); }
        
        //-----------------------------------------------------------------------------
        
        public проц SetRenderer(GridCellRenderer renderer)
        {
            wxGridCellAttr_SetRenderer(шхобъ, wxObject.SafePtr(renderer));
        }
        
        //-----------------------------------------------------------------------------
        
        public проц Editor(GridCellEditor значение) { wxGridCellAttr_SetEditor(шхобъ, wxObject.SafePtr(значение)); }
        /+
        public GridCellEditor GetEditor(Grid grid, цел row, цел col)
        {
            return cast(GridCellEditor)FindObject(wxGridCellAttr_GetEditor(шхобъ, wxObject.SafePtr(grid), row, col), &GridCellEditor.Нов);
        }
        +/
        //-----------------------------------------------------------------------------
        
        public бул HasTextColour() { return wxGridCellAttr_HasTextColour(шхобъ); }
        
        public бул HasBackgroundColour() { return wxGridCellAttr_HasBackgroundColour(шхобъ); }
        
        public бул HasFont() { return wxGridCellAttr_HasFont(шхобъ); }
        
        public бул HasAlignment() { return wxGridCellAttr_HasAlignment(шхобъ); }
        
        public бул HasRenderer() { return wxGridCellAttr_HasRenderer(шхобъ); }
        
        public бул HasEditor() { return wxGridCellAttr_HasEditor(шхобъ); }
        
        public бул HasReadWriteMode() { return wxGridCellAttr_HasReadWriteMode(шхобъ); }
        
        //-----------------------------------------------------------------------------
        /+
        public GridCellRenderer GetRenderer(Grid grid, цел row, цел col)
        {
            return cast(GridCellRenderer)FindObject(wxGridCellAttr_GetRenderer(шхобъ, wxObject.SafePtr(grid), row, col), &GridCellRenderer.Нов);
        }
        +/
        //-----------------------------------------------------------------------------
        
        public проц DefAttr(GridCellAttr значение) { wxGridCellAttr_SetDefAttr(шхобъ, wxObject.SafePtr(значение)); }
    }

        //! \cond EXTERN
        static extern (C) ЦУк wxGridSizeEvent_ctor();
        static extern (C) ЦУк wxGridSizeEvent_ctorParam(цел ид, цел тип, ЦУк объ, цел rowOrCol, цел x, цел y, бул control, бул shift, бул alt, бул meta);
        static extern (C) цел    wxGridSizeEvent_GetRowOrCol(ЦУк сам);
        static extern (C) проц   wxGridSizeEvent_GetPosition(ЦУк сам, inout Точка pt);
        static extern (C) бул   wxGridSizeEvent_ControlDown(ЦУк сам);
        static extern (C) бул   wxGridSizeEvent_MetaDown(ЦУк сам);
        static extern (C) бул   wxGridSizeEvent_ShiftDown(ЦУк сам);
        static extern (C) бул   wxGridSizeEvent_AltDown(ЦУк сам);
        static extern (C) проц wxGridSizeEvent_Veto(ЦУк сам);
        static extern (C) проц wxGridSizeEvent_Allow(ЦУк сам);
        static extern (C) бул wxGridSizeEvent_IsAllowed(ЦУк сам);          
        //! \endcond
    
        //-----------------------------------------------------------------------------
        
    alias GridSizeEvent wxGridSizeEvent;
    public class GridSizeEvent : Событие 
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }
        
        public this()
            { this(wxGridSizeEvent_ctor()); }
        
        public this(цел ид, цел тип, wxObject объ, цел rowOrCol, цел x, цел y, бул control, бул shift, бул alt, бул meta)
            { this(wxGridSizeEvent_ctorParam(ид, тип, wxObject.SafePtr(объ), rowOrCol, x, y, control, shift, alt, meta)); }
        
        //-----------------------------------------------------------------------------
        
        public цел RowOrCol() { return wxGridSizeEvent_GetRowOrCol(шхобъ); }
        
        //-----------------------------------------------------------------------------
        
        public Точка Положение() { 
                Точка pt;
                wxGridSizeEvent_GetPosition(шхобъ, pt); 
                return pt;
            }
        
        //-----------------------------------------------------------------------------
        
        public бул НажатКонтрол() { return wxGridSizeEvent_ControlDown(шхобъ); }
    
        public бул НажатМета() { return wxGridSizeEvent_MetaDown(шхобъ); }
        
        public бул НажатШифт() { return wxGridSizeEvent_ShiftDown(шхобъ); }
        
        public бул НажатАльт() { return wxGridSizeEvent_AltDown(шхобъ); }
        
        //-----------------------------------------------------------------------------     
        
        public проц Veto()
        {
            wxGridSizeEvent_Veto(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        public проц Allow()
        {
            wxGridSizeEvent_Allow(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        public бул Allowed() { return wxGridSizeEvent_IsAllowed(шхобъ); }

	private static Событие Нов(ЦУк объ) { return new GridSizeEvent(объ); }

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
        alias проц function(GridCellRenderer объ, ЦУк grid, ЦУк attr, ЦУк dc, Прямоугольник прям, цел row, цел col, бул isSelected) Virtual_Draw;
        alias Размер function(GridCellRenderer объ, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col) Virtual_GetBestSize;
        alias ЦУк function(GridCellRenderer объ) Virtual_RendererClone;
	}

        //-----------------------------------------------------------------------------
        
        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellRenderer_ctor();
	static extern (C) проц wxGridCellRenderer_dtor(ЦУк сам);
        static extern (C) проц wxGridCellRenderer_RegisterVirtual(ЦУк сам, GridCellRenderer объ, Virtual_Draw draw, Virtual_GetBestSize getBestSize, Virtual_RendererClone clone);
        //! \endcond
	
	//-----------------------------------------------------------------------------
	
    public abstract class GridCellRenderer : GridCellWorker
    {
        public this()
        {
        	this(wxGridCellRenderer_ctor(), да);

            wxGridCellRenderer_RegisterVirtual(шхобъ, this,
                &staticDoDraw,
                &staticDoGetBestSize,
                &staticDoClone);
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
	
	//public static wxObject Нов(ЦУк ptr) { return new GridCellRenderer(ptr);}
	
	//---------------------------------------------------------------------
	
	override protected проц dtor() { wxGridCellRenderer_dtor(шхобъ); }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticDoDraw(GridCellRenderer объ, ЦУк grid, ЦУк attr, ЦУк dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            //if ( FindObject(grid) === пусто ) Console.WriteLine("grid == пусто"); else Console.WriteLine("grid found");
            объ.Draw(cast(Grid)FindObject(grid, &Grid.Нов), cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), cast(DC)wxObject.FindObject(dc), прям, row, col, isSelected);
        }
        
        public abstract проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private Размер staticDoGetBestSize(GridCellRenderer объ, ЦУк grid, ЦУк attr, ЦУк dc,  цел row, цел col)
        {
            return объ.GetBestSize(cast(Grid)FindObject(grid, &Grid.Нов), cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), cast(DC)wxObject.FindObject(dc, &DC.Нов), row, col);
            
        }
        
        public abstract Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ЦУк staticDoClone(GridCellRenderer объ)
        {
            return wxObject.SafePtr(объ.Clone());
        }
        
        public abstract GridCellRenderer Clone();
    }
    
    //-----------------------------------------------------------------------------
    
        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellStringRenderer_ctor();
	static extern (C) проц wxGridCellStringRenderer_dtor(ЦУк сам);
	static extern (C) проц wxGridCellStringRenderer_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellStringRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellStringRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
        static extern (C) ЦУк wxGridCellStringRenderer_Clone(ЦУк сам);
        //! \endcond
	
    alias GridCellStringRenderer wxGridCellStringRenderer;
    public class GridCellStringRenderer : GridCellRenderer
    {
        public this()
	{ 
		this(wxGridCellStringRenderer_ctor(), да);
		wxGridCellStringRenderer_RegisterDisposable(шхобъ, &VirtualDispose);
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
	
	override protected проц dtor() { wxGridCellStringRenderer_dtor(шхобъ); }

	//---------------------------------------------------------------------

        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellStringRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }
        
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер size;
            wxGridCellStringRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);         
            return size;
        }
        
        public override GridCellRenderer Clone()
        {
//            return cast(GridCellRenderer)FindObject(wxGridCellStringRenderer_Clone(шхобъ), &GridCellRenderer.Нов);
              return new GridCellStringRenderer(wxGridCellStringRenderer_Clone(шхобъ));
        }       
    }
    
    //-----------------------------------------------------------------------------
    
        static extern (C) ЦУк wxGridCellNumberRenderer_ctor();
	static extern (C) проц wxGridCellNumberRenderer_dtor(ЦУк сам);
        static extern (C) проц wxGridCellNumberRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellNumberRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
        static extern (C) ЦУк wxGridCellNumberRenderer_Clone(ЦУк сам);
	
    alias GridCellNumberRenderer wxGridCellNumberRenderer;
    public class GridCellNumberRenderer : GridCellStringRenderer
    {
        public this()
            { this(wxGridCellNumberRenderer_ctor(), да); }
            
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
				
	override protected проц dtor() { wxGridCellNumberRenderer_dtor(шхобъ); }
        
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellNumberRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }
        
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер size;
            wxGridCellNumberRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);         
            return size;
        }
        
        public override GridCellRenderer Clone()
        {
        //    return cast(GridCellRenderer)FindObject(wxGridCellNumberRenderer_Clone(шхобъ), &GridCellRenderer.Нов);
            return new GridCellNumberRenderer(wxGridCellNumberRenderer_Clone(шхобъ));
        }               
    }
    
    //-----------------------------------------------------------------------------
    
        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellFloatRenderer_ctor(цел ширина, цел precision);
	static extern (C) проц wxGridCellFloatRenderer_dtor(ЦУк сам);
        static extern (C) проц wxGridCellFloatRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellFloatRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
        static extern (C) ЦУк wxGridCellFloatRenderer_Clone(ЦУк сам);
        static extern (C) цел wxGridCellFloatRenderer_GetWidth(ЦУк сам);
        static extern (C) проц wxGridCellFloatRenderer_SetWidth(ЦУк сам, цел ширина);
        static extern (C) цел wxGridCellFloatRenderer_GetPrecision(ЦУк сам);
        static extern (C) проц wxGridCellFloatRenderer_SetPrecision(ЦУк сам, цел precision);
        static extern (C) проц wxGridCellFloatRenderer_SetParameters(ЦУк сам, ткст parameter);
        //! \endcond
	
    alias GridCellFloatRenderer wxGridCellFloatRenderer;
    public class GridCellFloatRenderer : GridCellStringRenderer
    {
        public this()
            { this(-1, -1); }
            
        public this(цел ширина)
            { this(ширина, -1); }
            
        public this(цел ширина, цел precision)
            { this(wxGridCellFloatRenderer_ctor(ширина, precision), да); }
                
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
				
	override protected проц dtor() { wxGridCellFloatRenderer_dtor(шхобъ); }
        
        public override проц SetParameters(ткст parameter)
        {
            wxGridCellFloatRenderer_SetParameters(шхобъ, parameter);
        }
        
        public цел Ширина() { return wxGridCellFloatRenderer_GetWidth(шхобъ); }
        public проц Ширина(цел значение) { wxGridCellFloatRenderer_SetWidth(шхобъ,значение); }
        
        public цел Precision() { return wxGridCellFloatRenderer_GetPrecision(шхобъ); }
        public проц Precision(цел значение) { wxGridCellFloatRenderer_SetPrecision(шхобъ, значение); }
        
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellFloatRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }
        
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер size;
            wxGridCellFloatRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);          
            return size;
        }
        
        public override GridCellRenderer Clone()
        {
//            return cast(GridCellRenderer)FindObject(wxGridCellFloatRenderer_Clone(шхобъ), &GridCellRenderer.Нов);
            return new GridCellFloatRenderer(wxGridCellFloatRenderer_Clone(шхобъ));
        }                       
    }
    
    //-----------------------------------------------------------------------------
    
        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellBoolRenderer_ctor();
	static extern (C) проц wxGridCellBoolRenderer_dtor(ЦУк сам);
	static extern (C) проц wxGridCellBoolRenderer_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellBoolRenderer_Draw(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellBoolRenderer_GetBestSize(ЦУк сам, ЦУк grid, ЦУк attr, ЦУк dc, цел row, цел col, out Размер size);
        static extern (C) ЦУк wxGridCellBoolRenderer_Clone(ЦУк сам);
        //! \endcond
	
    alias GridCellBoolRenderer wxGridCellBoolRenderer;
    public class GridCellBoolRenderer : GridCellRenderer
    {
        public this()
	{ 
		this(wxGridCellBoolRenderer_ctor(), да);
		wxGridCellBoolRenderer_RegisterDisposable(шхобъ, &VirtualDispose);
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
				
	override protected проц dtor() { wxGridCellBoolRenderer_dtor(шхобъ); }
        
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
        {
            wxGridCellBoolRenderer_Draw(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), прям, row, col, isSelected);
        }
        
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col)
        {
            Размер size;
            wxGridCellBoolRenderer_GetBestSize(шхобъ, wxObject.SafePtr(grid), wxObject.SafePtr(attr), wxObject.SafePtr(dc), row, col, size);           
            return size;
        }
        
        public override GridCellRenderer Clone()
        {
//            return cast(GridCellRenderer)FindObject(wxGridCellBoolRenderer_Clone(шхобъ), &GridCellRenderer.Нов);
            return new GridCellBoolRenderer(wxGridCellBoolRenderer_Clone(шхобъ));
        }
    }
    
    //-----------------------------------------------------------------------------
    
        extern (C) {
        alias цел  function(GridTableBase объ) Virtual_GetNumberRows;
        alias цел  function(GridTableBase объ) Virtual_GetNumberCols;
        alias бул function(GridTableBase объ, цел row, цел col) Virtual_IsEmptyCell;
        alias ткст function(GridTableBase объ, цел row, цел col) Virtual_GetValue_gt;
        alias проц function(GridTableBase объ, цел row, цел col, ЦУк val) Virtual_SetValue;
        alias бул function(GridTableBase объ, цел row, цел col, ЦУк typeName) Virtual_CanGetValueAs;
        alias цел  function(GridTableBase объ, цел row, цел col) Virtual_GetValueAsLong;
        alias дво function(GridTableBase объ, цел row, цел col) Virtual_GetValueAsDouble;
        alias проц function(GridTableBase объ, цел row, цел col, цел значение) Virtual_SetValueAsLong;
        alias проц function(GridTableBase объ, цел row, цел col, дво значение) Virtual_SetValueAsDouble;
        alias проц function(GridTableBase объ, цел row, цел col, бул значение) Virtual_SetValueAsBool;
        alias ЦУк function(GridTableBase объ, цел row, цел col, ЦУк typeName) Virtual_GetValueAsCustom;
        alias проц function(GridTableBase объ, цел row, цел col, ЦУк typeName, ЦУк значение) Virtual_SetValueAsCustom;
        alias ткст function(GridTableBase объ, цел col) Virtual_GetColLabelValue;
        alias проц function(GridTableBase объ, ЦУк grid) Virtual_SetView;
        alias ЦУк function(GridTableBase объ) Virtual_GetView;
        alias проц function(GridTableBase объ) Virtual_Clear;
        alias бул function(GridTableBase объ, цел поз, цел numRows) Virtual_InsertRows;
        alias бул function(GridTableBase объ, цел numRows) Virtual_AppendRows;
        alias проц function(GridTableBase объ, цел row, ЦУк val) Virtual_SetRowLabelValue;
        alias проц function(GridTableBase объ, ЦУк attrProvider) Virtual_SetAttrProvider;
        alias ЦУк function(GridTableBase объ) Virtual_GetAttrProvider;
        alias бул function(GridTableBase объ) Virtual_CanHaveAttributes;
        alias ЦУк function(GridTableBase объ, цел row, цел col, цел вид) Virtual_GetAttr_gt;
        alias проц function(GridTableBase объ, ЦУк attr, цел row, цел col) Virtual_SetAttr_gt;
        alias проц function(GridTableBase объ, ЦУк attr, цел row) Virtual_SetRowAttr_gt;
        }

        //! \cond EXTERN
        static extern (C) ЦУк wxGridTableBase_ctor();
        static extern (C) проц wxGridTableBase_RegisterVirtual(ЦУк сам, GridTableBase объ, 
            Virtual_GetNumberRows getNumberRows, 
            Virtual_GetNumberCols getNumberCols, 
            Virtual_IsEmptyCell isEmptyCell, 
            Virtual_GetValue_gt getValue, 
            Virtual_SetValue setValue, 
            Virtual_GetValue_gt getTypeName, 
            Virtual_CanGetValueAs canGetValueAs, 
            Virtual_CanGetValueAs canSetValueAs, 
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

        static extern (C) цел    wxGridTableBase_GetNumberRows(ЦУк сам);
        static extern (C) цел    wxGridTableBase_GetNumberCols(ЦУк сам);
        static extern (C) бул   wxGridTableBase_IsEmptyCell(ЦУк сам, цел row, цел col);
        static extern (C) ЦУк wxGridTableBase_GetValue(ЦУк сам, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetValue(ЦУк сам, цел row, цел col, ЦУк val);
        static extern (C) ЦУк wxGridTableBase_GetTypeName(ЦУк сам, цел row, цел col);
        static extern (C) бул   wxGridTableBase_CanGetValueAs(ЦУк сам, цел row, цел col, ткст typeName);
        static extern (C) бул   wxGridTableBase_CanSetValueAs(ЦУк сам, цел row, цел col, ткст typeName);
        static extern (C) цел   wxGridTableBase_GetValueAsLong(ЦУк сам, цел row, цел col);
        static extern (C) дво wxGridTableBase_GetValueAsDouble(ЦУк сам, цел row, цел col);
        static extern (C) бул   wxGridTableBase_GetValueAsBool(ЦУк сам, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetValueAsLong(ЦУк сам, цел row, цел col, цел val);
        static extern (C) проц   wxGridTableBase_SetValueAsDouble(ЦУк сам, цел row, цел col, дво val);
        static extern (C) проц   wxGridTableBase_SetValueAsBool(ЦУк сам, цел row, цел col, бул val);
        static extern (C) ЦУк wxGridTableBase_GetValueAsCustom(ЦУк сам, цел row, цел col, ткст typeName);
        static extern (C) проц   wxGridTableBase_SetValueAsCustom(ЦУк сам, цел row, цел col, ткст typeName, ЦУк val);
        static extern (C) проц   wxGridTableBase_SetView(ЦУк сам, ЦУк grid);
        static extern (C) ЦУк wxGridTableBase_GetView(ЦУк сам);
        static extern (C) проц   wxGridTableBase_Clear(ЦУк сам);
        static extern (C) бул   wxGridTableBase_InsertRows(ЦУк сам, цел поз, цел numRows);
        static extern (C) бул   wxGridTableBase_AppendRows(ЦУк сам, цел numRows);
        static extern (C) бул   wxGridTableBase_DeleteRows(ЦУк сам, цел поз, цел numRows);
        static extern (C) бул   wxGridTableBase_InsertCols(ЦУк сам, цел поз, цел numCols);
        static extern (C) бул   wxGridTableBase_AppendCols(ЦУк сам, цел numCols);
        static extern (C) бул   wxGridTableBase_DeleteCols(ЦУк сам, цел поз, цел numCols);
        static extern (C) ЦУк wxGridTableBase_GetRowLabelValue(ЦУк сам, цел row);
        static extern (C) ЦУк wxGridTableBase_GetColLabelValue(ЦУк сам, цел col);
        static extern (C) проц   wxGridTableBase_SetRowLabelValue(ЦУк сам, цел row, ткст val);
        static extern (C) проц   wxGridTableBase_SetColLabelValue(ЦУк сам, цел col, ткст val);
        static extern (C) проц   wxGridTableBase_SetAttrProvider(ЦУк сам, ЦУк attrProvider);
        static extern (C) ЦУк wxGridTableBase_GetAttrProvider(ЦУк сам);
        static extern (C) бул   wxGridTableBase_CanHaveAttributes(ЦУк сам);
        static extern (C) ЦУк wxGridTableBase_GetAttr(ЦУк сам, цел row, цел col, цел вид);
        static extern (C) проц   wxGridTableBase_SetAttr(ЦУк сам, ЦУк attr, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetRowAttr(ЦУк сам, ЦУк attr, цел row);
        static extern (C) проц   wxGridTableBase_SetColAttr(ЦУк сам, ЦУк attr, цел col);
        //! \endcond
        
        //-----------------------------------------------------------------------------
    
    public abstract class GridTableBase : wxObject//ClientData 
    {
        public this()
        {
        	this(wxGridTableBase_ctor());
            wxGridTableBase_RegisterVirtual(шхобъ, this, 
                &staticGetNumberRows,
                &staticGetNumberCols,
                &staticIsEmptyCell,
                &staticGetValue,
                &staticDoSetValue,
                &staticGetTypeName,
                &staticDoCanGetValueAs,
                &staticDoCanSetValueAs,
                &staticGetValueAsLong,
                &staticGetValueAsDouble,
                &staticGetValueAsBool,
                &staticSetValueAsLong,
                &staticSetValueAsDouble,
                &staticSetValueAsBool,
                &staticDoGetValueAsCustom,
                &staticDoSetValueAsCustom,
                &staticDoSetView,
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
                &staticDoSetRowLabelValue,
                &staticDoSetColLabelValue,
                &staticDoSetAttrProvider,
                &staticDoGetAttrProvider,
                &staticCanHaveAttributes,
                &staticDoGetAttr,
                &staticDoSetAttr,
                &staticDoSetRowAttr,
                &staticDoSetColAttr
            );
        }
        
        public this(ЦУк шхобъ)
            { super(шхобъ); }
        
        //public static wxObject Нов(ЦУк ptr) { return new GridTableBase(ptr); }
        //-----------------------------------------------------------------------------
        
        static extern (C) private цел staticGetNumberRows(GridTableBase объ)
        {
            return объ.GetNumberRows();
        }
        public abstract цел GetNumberRows();
//        {
//            return wxGridTableBase_GetNumberRows(шхобъ);
//        }
        
        static extern (C) private цел staticGetNumberCols(GridTableBase объ)
        {
            return объ.GetNumberCols();
        }
        public abstract цел GetNumberCols();
//        {
//            return wxGridTableBase_GetNumberCols(шхобъ);
//        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private бул staticIsEmptyCell(GridTableBase объ, цел row, цел col)
        {
            return объ.IsEmptyCell(row,col);
        }
        public abstract бул IsEmptyCell(цел row, цел col);
//        {
//            return wxGridTableBase_IsEmptyCell(шхобъ, row, col);
//        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ткст staticGetValue(GridTableBase объ, цел row, цел col)
        {
            return объ.GetValue(row,col);
        }
        public abstract ткст GetValue(цел row, цел col);
//        {
//            return cast(ткст) new wxString(wxGridTableBase_GetValue(шхобъ, row, col), да);
//        }

        static extern (C) private проц staticDoSetValue(GridTableBase объ, цел row, цел col, ЦУк val)
        {
            объ.SetValue(row, col, cast(ткст) new wxString(val));
        }       
        
        public abstract проц SetValue(цел row, цел col, ткст val);
//        {
//            wxGridTableBase_SetValue(шхобъ, row, col, val);
//        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ткст staticGetTypeName(GridTableBase объ, цел row, цел col)
        {
            return объ.GetTypeName(row,col);
        }
        public /+virtual+/ ткст GetTypeName(цел row, цел col)
        {
            return cast(ткст) new wxString(wxGridTableBase_GetTypeName(шхобъ, row, col), да);
        }
        
        static extern (C) private бул staticDoCanGetValueAs(GridTableBase объ, цел row, цел col, ЦУк typeName)
        {
            return объ.CanGetValueAs(row, col, cast(ткст) new wxString(typeName));
        }
        
        public /+virtual+/ бул CanGetValueAs(цел row, цел col, ткст typeName)
        {
            return wxGridTableBase_CanGetValueAs(шхобъ, row, col, typeName);
        }

        static extern (C) private бул staticDoCanSetValueAs(GridTableBase объ, цел row, цел col, ЦУк typeName)
        {
            return объ.CanSetValueAs(row, col, cast(ткст) new wxString(typeName));
        }
        
        public /+virtual+/ бул CanSetValueAs(цел row, цел col, ткст typeName)
        {
            return wxGridTableBase_CanSetValueAs(шхобъ, row, col, typeName);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private цел staticGetValueAsLong(GridTableBase объ, цел row, цел col)
	{
	    return объ.GetValueAsLong(row,col);
	}
        public /+virtual+/ цел GetValueAsLong(цел row, цел col)
        {
            return wxGridTableBase_GetValueAsLong(шхобъ, row, col);
        }
        
        static extern (C) private дво staticGetValueAsDouble(GridTableBase объ, цел row, цел col)
	{
	    return объ.GetValueAsDouble(row,col);
	}
        public /+virtual+/ дво GetValueAsDouble(цел row, цел col)
        {
            return wxGridTableBase_GetValueAsDouble(шхобъ, row, col);
        }
        
        static extern (C) private бул staticGetValueAsBool(GridTableBase объ, цел row, цел col)
	{
	    return объ.GetValueAsBool(row,col);
	}
        public /+virtual+/ бул GetValueAsBool(цел row, цел col)
        {
            return wxGridTableBase_GetValueAsBool(шхобъ, row, col);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticSetValueAsLong(GridTableBase объ, цел row, цел col, цел val)
	{
	    return объ.SetValueAsLong(row,col,val);
	}
        public /+virtual+/ проц SetValueAsLong(цел row, цел col, цел val)
        {
            wxGridTableBase_SetValueAsLong(шхобъ, row, col, val);
        }
        
        static extern (C) private проц staticSetValueAsDouble(GridTableBase объ, цел row, цел col, дво val)
	{
	    return объ.SetValueAsDouble(row,col,val);
	}
        public /+virtual+/ проц SetValueAsDouble(цел row, цел col, дво val)
        {
            wxGridTableBase_SetValueAsDouble(шхобъ, row, col, val);
        }
        
        static extern (C) private проц staticSetValueAsBool(GridTableBase объ, цел row, цел col, бул val)
	{
	    return объ.SetValueAsBool(row,col,val);
	}
        public /+virtual+/ проц SetValueAsBool(цел row, цел col, бул val)
        {
            wxGridTableBase_SetValueAsBool(шхобъ, row, col, val);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ЦУк staticDoGetValueAsCustom(GridTableBase объ, цел row, цел col, ЦУк typeName)
        {
            return wxObject.SafePtr(объ.GetValueAsCustom(row, col, cast(ткст) new wxString(typeName)));
        }
        
        public /+virtual+/ wxObject GetValueAsCustom(цел row, цел col, ткст typeName)
        {
            return FindObject(wxGridTableBase_GetValueAsCustom(шхобъ, row, col, typeName));
        }
        
        static extern (C) private проц staticDoSetValueAsCustom(GridTableBase объ, цел row, цел col, ЦУк typeName, ЦУк val)
        {
            объ.SetValueAsCustom(row, col, cast(ткст) new wxString(typeName), FindObject(val));
        }
        
        public /+virtual+/ проц SetValueAsCustom(цел row, цел col, ткст typeName, wxObject val)
        {
            wxGridTableBase_SetValueAsCustom(шхобъ, row, col, typeName, wxObject.SafePtr(val));
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticDoSetView(GridTableBase объ, ЦУк grid)
        {
            объ.SetView(cast(Grid)FindObject(grid, &Grid.Нов));
        }
        
        public /+virtual+/ проц SetView(Grid grid)
        {
            wxGridTableBase_SetView(шхобъ, wxObject.SafePtr(grid));
        }
        
        static extern (C) private ЦУк staticDoGetView(GridTableBase объ)
        {
            return wxObject.SafePtr(объ.GetView());
        }
        
        public /+virtual+/ Grid GetView()
        {
            return cast(Grid)FindObject(wxGridTableBase_GetView(шхобъ), &Grid.Нов);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticClear(GridTableBase объ)
	{
	    объ.Очисть();
	}
        public /+virtual+/ проц Очисть()
        {
            wxGridTableBase_Clear(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private бул staticInsertRows(GridTableBase объ, цел поз, цел numRows)
	{
	    return объ.InsertRows(поз, numRows);
	}
        public /+virtual+/ бул InsertRows(цел поз, цел numRows)
        {
            return wxGridTableBase_InsertRows(шхобъ, поз, numRows);
        }
        
        static extern (C) private бул staticAppendRows(GridTableBase объ, цел numRows)
        {
            return объ.AppendRows(numRows);
        }
        public /+virtual+/ бул AppendRows(цел numRows)
        {
            return wxGridTableBase_AppendRows(шхобъ, numRows);
        }
        
        static extern (C) private бул staticDeleteRows(GridTableBase объ, цел поз, цел numRows)
	{
	    return объ.DeleteRows(поз, numRows);
	}
        public /+virtual+/ бул DeleteRows(цел поз, цел numRows)
        {
            return wxGridTableBase_DeleteRows(шхобъ, поз, numRows);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private бул staticInsertCols(GridTableBase объ, цел поз, цел numCols)
	{
	    return объ.InsertCols(поз, numCols);
	}
        public /+virtual+/ бул InsertCols(цел поз, цел numCols)
        {
            return wxGridTableBase_InsertCols(шхобъ, поз, numCols);
        }
        
        static extern (C) private бул staticAppendCols(GridTableBase объ, цел numCols)
        {
            return объ.AppendCols(numCols);
        }
        public /+virtual+/ бул AppendCols(цел numCols)
        {
            return wxGridTableBase_AppendCols(шхобъ, numCols);
        }
        
        static extern (C) private бул staticDeleteCols(GridTableBase объ, цел поз, цел numCols)
	{
	    return объ.DeleteCols(поз, numCols);
	}
        public /+virtual+/ бул DeleteCols(цел поз, цел numCols)
        {
            return wxGridTableBase_DeleteCols(шхобъ, поз, numCols);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ткст staticGetRowLabelValue(GridTableBase объ, цел row)
        {
            return объ.GetRowLabelValue(row);
        }
        public /+virtual+/ ткст GetRowLabelValue(цел row)
        {
            return cast(ткст) new wxString(wxGridTableBase_GetRowLabelValue(шхобъ, row), да);
        }
        
        static extern (C) private ткст staticGetColLabelValue(GridTableBase объ, цел col)
        {
            return объ.GetColLabelValue(col);
        }
        public /+virtual+/ ткст GetColLabelValue(цел col)
        {
            return cast(ткст) new wxString(wxGridTableBase_GetColLabelValue(шхобъ, col), да);
        }
        
        static extern (C) private проц staticDoSetRowLabelValue(GridTableBase объ, цел row, ЦУк val)
        {
            объ.SetRowLabelValue(row, cast(ткст) new wxString(val));
        }       
        
        public /+virtual+/ проц SetRowLabelValue(цел row, ткст val)
        {
            wxGridTableBase_SetRowLabelValue(шхобъ, row, val);
        }
        
        static extern (C) private проц staticDoSetColLabelValue(GridTableBase объ, цел col, ЦУк val)
        {
            объ.SetColLabelValue(col, cast(ткст) new wxString(val));
        }       
        
        public /+virtual+/ проц SetColLabelValue(цел col, ткст val)
        {
            wxGridTableBase_SetColLabelValue(шхобъ, col, val);
        }       
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticDoSetAttrProvider(GridTableBase объ, ЦУк attrProvider)
        {
            объ.SetAttrProvider(cast(GridCellAttrProvider)FindObject(attrProvider, &GridCellAttrProvider.Нов));
        }
        
        public проц SetAttrProvider(GridCellAttrProvider attrProvider)
        {
            wxGridTableBase_SetAttrProvider(шхобъ, wxObject.SafePtr(attrProvider));
        }
        
        static extern (C) private ЦУк staticDoGetAttrProvider(GridTableBase объ)
        {
            return wxObject.SafePtr(объ.GetAttrProvider());
        }
        
        public GridCellAttrProvider GetAttrProvider()
        {
            return new GridCellAttrProvider(wxGridTableBase_GetAttrProvider(шхобъ));
        }
        
        static extern (C) private бул staticCanHaveAttributes(GridTableBase объ)
        {
            return объ.CanHaveAttributes();
        }
        public /+virtual+/ бул CanHaveAttributes()
        {
            return wxGridTableBase_CanHaveAttributes(шхобъ);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ЦУк staticDoGetAttr(GridTableBase объ, цел row, цел col, цел вид)
        {
            return wxObject.SafePtr(объ.GetAttr(row, col, cast(GridCellAttr.AttrKind) вид));
        }
        
        public /+virtual+/ GridCellAttr GetAttr(цел row, цел col, GridCellAttr.AttrKind вид)
        {
            return cast(GridCellAttr)FindObject(wxGridTableBase_GetAttr(шхобъ, row, col, cast(цел)вид), &GridCellAttr.Нов);
        }
        
        static extern (C) private проц staticDoSetAttr(GridTableBase объ, ЦУк attr, цел row, цел col)
        {
            объ.SetAttr(cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), row, col);
        }
        
        public /+virtual+/ проц SetAttr(GridCellAttr attr, цел row, цел col)
        {
            wxGridTableBase_SetAttr(шхобъ, wxObject.SafePtr(attr), row, col);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticDoSetRowAttr(GridTableBase объ, ЦУк attr, цел row)
        {
            объ.SetRowAttr(cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), row);
        }
        
        public /+virtual+/ проц SetRowAttr(GridCellAttr attr, цел row)
        {
            wxGridTableBase_SetRowAttr(шхобъ, wxObject.SafePtr(attr), row);
        }
        
        static extern (C) private проц staticDoSetColAttr(GridTableBase объ, ЦУк attr, цел col)
        {
            объ.SetColAttr(cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), col);
        }       
        
        public /+virtual+/ проц SetColAttr(GridCellAttr attr, цел col)
        {
            wxGridTableBase_SetColAttr(шхобъ, wxObject.SafePtr(attr), col);
        }
    }
    
	extern (C) {
        alias ЦУк function(GridCellAttrProvider объ, цел row, цел col, цел вид) Virtual_GetAttr;
        alias проц function(GridCellAttrProvider объ, ЦУк attr, цел row, цел col) Virtual_SetAttr;
        alias проц function(GridCellAttrProvider объ, ЦУк attr, цел row) Virtual_SetRowAttr;
	}

        //! \cond EXTERN
        static extern (C) ЦУк wxGridCellAttrProvider_ctor();
	static extern (C) проц wxGridCellAttrProvider_dtor(ЦУк сам);
        static extern (C) проц wxGridCellAttrProvider_RegisterVirtual(ЦУк сам,GridCellAttrProvider объ, 
            Virtual_GetAttr getAttr,
            Virtual_SetAttr setAttr,
            Virtual_SetRowAttr setRowAttr,
            Virtual_SetRowAttr setColAttr);
	static extern (C) проц wxGridCellAttrProvider_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) ЦУк wxGridCellAttrProvider_GetAttr(ЦУк сам, цел row, цел col, цел вид);
        static extern (C) проц wxGridCellAttrProvider_SetAttr(ЦУк сам, ЦУк attr, цел row, цел col); 
        static extern (C) проц wxGridCellAttrProvider_SetRowAttr(ЦУк сам, ЦУк attr, цел row); 
        static extern (C) проц wxGridCellAttrProvider_SetColAttr(ЦУк сам, ЦУк attr, цел col); 
        static extern (C) проц wxGridCellAttrProvider_UpdateAttrRows(ЦУк сам, цел поз, цел numRows);
        static extern (C) проц wxGridCellAttrProvider_UpdateAttrCols(ЦУк сам, цел поз, цел numCols);
        //! \endcond
	
        //-----------------------------------------------------------------------------
        
    alias GridCellAttrProvider wxGridCellAttrProvider;
    public class GridCellAttrProvider : wxObject  // ClientData
    {
        public this(ЦУк шхобъ) 
	{ 
		super(шхобъ);
	}
	
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}
        
        public this()
        { 
        	this(wxGridCellAttrProvider_ctor(), да);

            wxGridCellAttrProvider_RegisterVirtual(шхобъ,this,
                &staticDoGetAttr,
                &staticDoSetAttr,
                &staticDoSetRowAttr,
                &staticDoSetColAttr);
		
		wxGridCellAttrProvider_RegisterDisposable(шхобъ, &VirtualDispose);
        }
	
	public static wxObject Нов(ЦУк ptr) { return new GridCellAttrProvider(ptr); }
	//---------------------------------------------------------------------
				
	override protected проц dtor() { wxGridCellAttrProvider_dtor(шхобъ); }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private ЦУк staticDoGetAttr(GridCellAttrProvider объ, цел row, цел col, цел вид)
        {
            return wxObject.SafePtr(объ.GetAttr(row, col, cast(GridCellAttr.AttrKind) вид));
        }
        
        public /+virtual+/ GridCellAttr GetAttr(цел row, цел col, GridCellAttr.AttrKind вид)
        {
            return cast(GridCellAttr)FindObject(wxGridCellAttrProvider_GetAttr(шхобъ, row, col, cast(цел)вид), &GridCellAttr.Нов);
        }
        
        static extern (C) private проц staticDoSetAttr(GridCellAttrProvider объ, ЦУк attr, цел row, цел col)
        {
            объ.SetAttr(cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), row, col);
        }
        
        public /+virtual+/ проц SetAttr(GridCellAttr attr, цел row, цел col)
        {
            wxGridCellAttrProvider_SetAttr(шхобъ, wxObject.SafePtr(attr), row, col);
        }
        
        //-----------------------------------------------------------------------------
        
        static extern (C) private проц staticDoSetRowAttr(GridCellAttrProvider объ, ЦУк attr, цел row)
        {
            объ.SetRowAttr(cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), row);
        }
        
        public /+virtual+/ проц SetRowAttr(GridCellAttr attr, цел row)
        {
            wxGridCellAttrProvider_SetRowAttr(шхобъ, wxObject.SafePtr(attr), row);
        }
        
        static extern (C) private проц staticDoSetColAttr(GridCellAttrProvider объ, ЦУк attr, цел col)
        {
            объ.SetColAttr(cast(GridCellAttr)FindObject(attr, &GridCellAttr.Нов), col);
        }       
        
        public /+virtual+/ проц SetColAttr(GridCellAttr attr, цел col)
        {
            wxGridCellAttrProvider_SetColAttr(шхобъ, wxObject.SafePtr(attr), col);
        }
        
        //-----------------------------------------------------------------------------
        
        public проц UpdateAttrRows(цел поз, цел numRows)
        {
            wxGridCellAttrProvider_UpdateAttrRows(шхобъ, поз, numRows);
        }
        
        public проц UpdateAttrCols(цел поз, цел numCols)
        {
            wxGridCellAttrProvider_UpdateAttrCols(шхобъ, поз, numCols);
        }       
    }
+/