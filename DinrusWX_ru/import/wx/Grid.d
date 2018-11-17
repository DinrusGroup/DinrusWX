
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
        static extern (C) IntPtr wxGridEvent_ctor(цел ид, цел тип, IntPtr объ, цел row, цел col, цел x, цел y, бул sel, бул control, бул shift, бул alt, бул meta);
        static extern (C) цел    wxGridEvent_GetRow(IntPtr сам);
        static extern (C) цел    wxGridEvent_GetCol(IntPtr сам);
        static extern (C) проц   wxGridEvent_GetPosition(IntPtr сам, inout Точка тчк);
        static extern (C) бул   wxGridEvent_Selecting(IntPtr сам);
        static extern (C) бул   wxGridEvent_ControlDown(IntPtr сам);
        static extern (C) бул   wxGridEvent_MetaDown(IntPtr сам);
        static extern (C) бул   wxGridEvent_ShiftDown(IntPtr сам);
        static extern (C) бул   wxGridEvent_AltDown(IntPtr сам);
        static extern (C) проц wxGridEvent_Veto(IntPtr сам);
        static extern (C) проц wxGridEvent_Allow(IntPtr сам);
        static extern (C) бул wxGridEvent_IsAllowed(IntPtr сам);      
		//! \endcond

        //-----------------------------------------------------------------------------

    alias GridEvent wxGridEvent;
    public class GridEvent : Событие 
    {
        public this(IntPtr wxobj);
        public this(цел ид, цел тип, wxObject объ, цел row, цел col, цел x, цел y, бул sel, бул control, бул shift, бул alt, бул meta);
        public цел Row() ;
        public цел Col();
        public Точка Позиция() ;
        public бул Selecting() ;
        public бул ControlDown();
        public бул MetaDown();
        public бул ShiftDown() ;
            public бул AltDown() ;
        public проц Veto();
        public проц Allow();
        public бул Allowed();
	private static Событие Нов(IntPtr объ) ;
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
        alias проц   function(GridCellEditor объ, IntPtr родитель, цел ид, IntPtr evtHandler) Virtual_Create;
        alias проц   function(GridCellEditor объ, цел row, цел col, IntPtr grid) Virtual_BeginEdit;
        alias бул   function(GridCellEditor объ, цел row, цел col, IntPtr grid) Virtual_EndEdit;
        alias проц   function(GridCellEditor объ) Virtual_Reset;
        alias IntPtr function(GridCellEditor объ) Virtual_Clone;
        alias проц   function(GridCellEditor объ, Прямоугольник прям) Virtual_SetSize;
        alias проц   function(GridCellEditor объ, бул покажи, IntPtr attr) Virtual_Show;
        alias проц   function(GridCellEditor объ, Прямоугольник прям, IntPtr attr) Virtual_PaintBackground;
        alias бул   function(GridCellEditor объ, IntPtr evt) Virtual_IsAcceptedKey;
        alias проц   function(GridCellEditor объ, IntPtr evt) Virtual_StartingKey;
        alias проц   function(GridCellEditor объ) Virtual_StartingClick;
        alias проц   function(GridCellEditor объ, IntPtr evt) Virtual_HandleReturn;
        alias проц   function(GridCellEditor объ) Virtual_Destroy;
        alias ткст function(GridCellEditor объ) Virtual_GetValue;
	}

        static extern (C) IntPtr wxGridCellEditor_ctor();
	static extern (C) проц wxGridCellEditor_dtor(IntPtr сам);
        static extern (C) проц wxGridCellEditor_RegisterVirtual(IntPtr сам, GridCellEditor объ,
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
        static extern (C) бул   wxGridCellEditor_IsCreated(IntPtr сам);
        static extern (C) проц   wxGridCellEditor_SetSize(IntPtr сам, inout Прямоугольник прям);
        static extern (C) проц   wxGridCellEditor_Show(IntPtr сам, бул покажи, IntPtr attr);
        static extern (C) проц   wxGridCellEditor_PaintBackground(IntPtr сам, inout Прямоугольник rectCell, IntPtr attr);
        static extern (C) бул   wxGridCellEditor_IsAcceptedKey(IntPtr сам, IntPtr evt);
        static extern (C) проц   wxGridCellEditor_StartingKey(IntPtr сам, IntPtr evt);
        static extern (C) проц   wxGridCellEditor_StartingClick(IntPtr сам);
        static extern (C) проц   wxGridCellEditor_HandleReturn(IntPtr сам, IntPtr evt);
        static extern (C) проц   wxGridCellEditor_Destroy(IntPtr сам);
        static extern (C) IntPtr wxGridCellEditor_GetValue(IntPtr сам);
		//! \endcond
	
        //-----------------------------------------------------------------------------
        
    public abstract class GridCellEditor : GridCellWorker
    {
        public this(IntPtr wxobj);
    	private this(IntPtr wxobj, бул memOwn);
        public this();
        //	public static wxObject Нов(IntPtr ptr) ;
	   override protected проц dtor();
        public бул IsCreated();
        static extern(C) private проц staticDoCreate(GridCellEditor объ, IntPtr родитель, цел ид, IntPtr evtHandler);
        public abstract проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
        static extern(C) private проц staticУстSize(GridCellEditor объ, Прямоугольник прям);
        public  проц УстРазм(Прямоугольник прям);
        static extern(C) private проц staticDoShow(GridCellEditor объ, бул покажи, IntPtr attr);
        public  проц Покажи(бул покажи, GridCellAttr attr);
        static extern(C) private проц staticDoPaintBackground(GridCellEditor объ, Прямоугольник rectCell, IntPtr attr);
        public  проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr);
        static extern(C) private проц staticDoBeginEdit(GridCellEditor объ, цел row, цел col, IntPtr grid);
        public abstract проц BeginEdit(цел row, цел col, Grid grid);        
        static extern(C) private бул staticDoEndEdit(GridCellEditor объ, цел row, цел col, IntPtr grid);
        public abstract бул EndEdit(цел row, цел col, Grid grid);
        static extern(C) private проц staticReset(GridCellEditor объ);
        public abstract проц Reset();
        static extern(C) private бул staticDoIsAcceptedKey(GridCellEditor объ, IntPtr evt);
        public  бул IsAcceptedKey(KeyEvent evt);
        static extern(C) private проц staticDoStartingKey(GridCellEditor объ, IntPtr evt);
        public  проц StartingKey(KeyEvent evt);
	    static extern(C) private проц staticStartingClick(GridCellEditor объ);
        public  проц StartingClick();
        static extern(C) private проц staticDoHandleReturn(GridCellEditor объ, IntPtr evt);
        public  проц HandleReturn(KeyEvent evt);
	    static extern(C) private проц staticDestroy(GridCellEditor объ);
        public  проц Разрушь();
        static extern(C) private IntPtr staticDoClone(GridCellEditor объ);
        public abstract GridCellEditor Clone();
        static extern(C) private ткст staticGetValue(GridCellEditor объ);
        public abstract ткст GetValue();
    }
    
    //-----------------------------------------------------------------------------
    
		//! \cond EXTERN
        static extern (C) IntPtr wxGridCellTextEditor_ctor();
	static extern (C) проц wxGridCellTextEditor_dtor(IntPtr сам);
        static extern (C) проц wxGridCellTextEditor_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr evtHandler);
        static extern (C) проц wxGridCellTextEditor_SetSize(IntPtr сам, inout Прямоугольник прям);
        static extern (C) проц wxGridCellTextEditor_PaintBackground(IntPtr сам, inout Прямоугольник rectCell, IntPtr attr);
        static extern (C) бул wxGridCellTextEditor_IsAcceptedKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellTextEditor_BeginEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) бул wxGridCellTextEditor_EndEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) проц wxGridCellTextEditor_Reset(IntPtr сам);
        static extern (C) проц wxGridCellTextEditor_StartingKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellTextEditor_SetParameters(IntPtr сам, ткст parameter);
        static extern (C) IntPtr wxGridCellTextEditor_Clone(IntPtr сам);
        static extern (C) IntPtr wxGridCellTextEditor_GetValue(IntPtr сам);
		//! \endcond
	
    alias GridCellTextEditor wxGridCellTextEditor;
    public class GridCellTextEditor : GridCellEditor
    {
        public this();
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor();
        public override проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
        public override проц УстРазм(Прямоугольник прям);
        public override проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr);
        public override бул IsAcceptedKey(KeyEvent evt);
        public override проц BeginEdit(цел row, цел col, Grid grid);
        public override бул EndEdit(цел row, цел col, Grid grid);
        public override проц Reset();
        public override проц StartingKey(KeyEvent evt);
        public override проц УстParameters(ткст parameter);
        public override GridCellEditor Clone();
        public override ткст GetValue();
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxGridCellNumberEditor_ctor(цел min, цел max);
	static extern (C) проц wxGridCellNumberEditor_dtor(IntPtr сам);
	static extern (C) проц wxGridCellNumberEditor_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellNumberEditor_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr evtHandler);
        static extern (C) бул wxGridCellNumberEditor_IsAcceptedKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellNumberEditor_BeginEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) бул wxGridCellNumberEditor_EndEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) проц wxGridCellNumberEditor_Reset(IntPtr сам);
        static extern (C) проц wxGridCellNumberEditor_StartingKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellNumberEditor_SetParameters(IntPtr сам, ткст parameter);
        static extern (C) IntPtr wxGridCellNumberEditor_Clone(IntPtr сам);
        static extern (C) IntPtr wxGridCellNumberEditor_GetValue(IntPtr сам);
		//! \endcond
	
    alias GridCellNumberEditor wxGridCellNumberEditor;
    public class GridCellNumberEditor : GridCellTextEditor
    {
        public this();
        public this(цел min);
        public this(цел min, цел max);
        public this(IntPtr wxobj);
    	private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor();
        public override проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
        public override бул IsAcceptedKey(KeyEvent evt);
        public override проц BeginEdit(цел row, цел col, Grid grid);
        public override бул EndEdit(цел row, цел col, Grid grid);
        public override проц Reset();
        public override проц StartingKey(KeyEvent evt);
        public override проц УстParameters(ткст parameter);
        public override GridCellEditor Clone();
        public override ткст GetValue();
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxGridCellFloatEditor_ctor(цел ширь, цел precision);
	static extern (C) проц wxGridCellFloatEditor_dtor(IntPtr сам);
        static extern (C) проц wxGridCellFloatEditor_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr evtHandler);
        static extern (C) бул wxGridCellFloatEditor_IsAcceptedKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellFloatEditor_BeginEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) бул wxGridCellFloatEditor_EndEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) проц wxGridCellFloatEditor_Reset(IntPtr сам);
        static extern (C) проц wxGridCellFloatEditor_StartingKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellFloatEditor_SetParameters(IntPtr сам, ткст parameter);
        static extern (C) IntPtr wxGridCellFloatEditor_Clone(IntPtr сам);
        static extern (C) IntPtr wxGridCellFloatEditor_GetValue(IntPtr сам);
		//! \endcond
	
    alias GridCellFloatEditor wxGridCellFloatEditor;
    public class GridCellFloatEditor : GridCellTextEditor
    {
        public this();
        public this(цел ширь);
        public this(цел ширь, цел precision);
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor() ;
        public override проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
        public override бул IsAcceptedKey(KeyEvent evt);
        public override проц BeginEdit(цел row, цел col, Grid grid);
        public override бул EndEdit(цел row, цел col, Grid grid);
        public override проц Reset();
        public override проц StartingKey(KeyEvent evt);
        public override проц УстParameters(ткст parameter);
        public override GridCellEditor Clone();
        public override ткст GetValue();
    }

    //-----------------------------------------------------------------------------
    
		//! \cond EXTERN
        static extern (C) IntPtr wxGridCellBoolEditor_ctor();
	static extern (C) проц wxGridCellBoolEditor_dtor(IntPtr сам);
	static extern (C) проц wxGridCellBoolEditor_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellBoolEditor_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr evtHandler);
        static extern (C) проц wxGridCellBoolEditor_SetSize(IntPtr сам, inout Прямоугольник прям);
        static extern (C) бул wxGridCellBoolEditor_IsAcceptedKey(IntPtr сам, IntPtr evt);
        static extern (C) проц wxGridCellBoolEditor_BeginEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) бул wxGridCellBoolEditor_EndEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) проц wxGridCellBoolEditor_Reset(IntPtr сам);
        static extern (C) проц wxGridCellBoolEditor_StartingClick(IntPtr сам);
        static extern (C) IntPtr wxGridCellBoolEditor_Clone(IntPtr сам);
        static extern (C) IntPtr wxGridCellBoolEditor_GetValue(IntPtr сам);
		//! \endcond
	
    alias GridCellBoolEditor wxGridCellBoolEditor;
    public class GridCellBoolEditor : GridCellEditor
    {
        public this();
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor();
        public override проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
        public override проц УстРазм(Прямоугольник прям);
        public override бул IsAcceptedKey(KeyEvent evt);
        public override проц BeginEdit(цел row, цел col, Grid grid);
        public override бул EndEdit(цел row, цел col, Grid grid);
        public override проц Reset();
        public override проц StartingClick();
        public override GridCellEditor Clone();
        public override ткст GetValue();
    }
    
    //-----------------------------------------------------------------------------
    
		//! \cond EXTERN
        static extern (C) IntPtr wxGridCellChoiceEditor_ctor(цел n, ткст* choices, бул allowOthers);
	static extern (C) проц wxGridCellChoiceEditor_dtor(IntPtr сам);
	static extern (C) проц wxGridCellChoiceEditor_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellChoiceEditor_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr evtHandler);
        static extern (C) проц wxGridCellChoiceEditor_PaintBackground(IntPtr сам, inout Прямоугольник rectCell, IntPtr attr);
        static extern (C) проц wxGridCellChoiceEditor_BeginEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) бул wxGridCellChoiceEditor_EndEdit(IntPtr сам, цел row, цел col, IntPtr grid);
        static extern (C) проц wxGridCellChoiceEditor_Reset(IntPtr сам);
        static extern (C) проц wxGridCellChoiceEditor_SetParameters(IntPtr сам, ткст parameter);
        static extern (C) IntPtr wxGridCellChoiceEditor_Clone(IntPtr сам);
        static extern (C) IntPtr wxGridCellChoiceEditor_GetValue(IntPtr сам);
		//! \endcond
	
    alias GridCellChoiceEditor wxGridCellChoiceEditor;
    public class GridCellChoiceEditor : GridCellEditor
    {
        public this();
        public this(ткст[] choices);
        public this(ткст[] choices, бул allowOthers);
        public this(IntPtr wxobj);
	private this(IntPtr wxobj, бул memOwn);
	override protected проц dtor() ;
        public override проц Создай(Окно родитель, цел ид, ОбработчикСоб evtHandler);
        public override проц PaintBackground(Прямоугольник rectCell, GridCellAttr attr);
        public override проц BeginEdit(цел row, цел col, Grid grid);
        public override бул EndEdit(цел row, цел col, Grid grid);
        public override проц Reset();
        public override проц УстParameters(ткст parameter);
        public override GridCellEditor Clone();
        public override ткст GetValue();
    }
    
    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxGridRangeSelectEvent_ctor(цел ид, цел тип, IntPtr объ, IntPtr topLeft, IntPtr bottomRight, бул sel, бул control, бул shift, бул alt, бул meta);
        static extern (C) IntPtr wxGridRangeSelectEvent_GetTopLeftCoords(IntPtr сам);
        static extern (C) IntPtr wxGridRangeSelectEvent_GetBottomRightCoords(IntPtr сам);
        static extern (C) цел wxGridRangeSelectEvent_GetTopRow(IntPtr сам);
        static extern (C) цел wxGridRangeSelectEvent_GetBottomRow(IntPtr сам);
        static extern (C) цел wxGridRangeSelectEvent_GetLeftCol(IntPtr сам);
        static extern (C) цел wxGridRangeSelectEvent_GetRightCol(IntPtr сам);
        static extern (C) бул wxGridRangeSelectEvent_Selecting(IntPtr сам);
        static extern (C) бул wxGridRangeSelectEvent_ControlDown(IntPtr сам);
        static extern (C) бул wxGridRangeSelectEvent_MetaDown(IntPtr сам);
        static extern (C) бул wxGridRangeSelectEvent_ShiftDown(IntPtr сам);
        static extern (C) бул wxGridRangeSelectEvent_AltDown(IntPtr сам);
        static extern (C) проц wxGridRangeSelectEvent_Veto(IntPtr сам);
        static extern (C) проц wxGridRangeSelectEvent_Allow(IntPtr сам);
        static extern (C) бул wxGridRangeSelectEvent_IsAllowed(IntPtr сам);       
		//! \endcond
    
        //-----------------------------------------------------------------------------
    
    alias GridRangeSelectEvent wxGridRangeSelectEvent;
    public class GridRangeSelectEvent : Событие
    {
        public this(IntPtr wxobj);
        public this(цел ид, цел тип, wxObject объ, GridCellCoords topLeft, GridCellCoords bottomRight, бул sel, бул control, бул shift, бул alt, бул meta);
        public GridCellCoords TopLeftCoords() ;    
        public GridCellCoords BottomRightCoords();
        public цел TopRow();
        public цел BottomRow() ;
        public цел LeftCol();
        public цел RightCol() ;
        public бул Selecting();
        public бул ControlDown() ;
        public бул MetaDown();
        public бул ShiftDown() ;
        public бул AltDown() ;
        public проц Veto();
        public проц Allow();
        public бул Allowed() ;
	    private static Событие Нов(IntPtr объ) ;
	    static this();
    }

		//! \cond EXTERN
	extern (C) {
        alias проц function(GridCellWorker объ, ткст param) Virtual_SetParameters;
	}

        static extern (C) IntPtr wxGridCellWorker_ctor();
        static extern (C) проц wxGridCellWorker_RegisterVirtual(IntPtr сам, GridCellWorker объ, Virtual_SetParameters setParameters);
        static extern (C) проц wxGridCellWorker_IncRef(IntPtr сам);
        static extern (C) проц wxGridCellWorker_DecRef(IntPtr сам);
        static extern (C) проц wxGridCellWorker_SetParameters(IntPtr сам, ткст parms);
		//! \endcond
	
        //-----------------------------------------------------------------------------
        
    alias GridCellWorker wxGridCellWorker;
    public class GridCellWorker : wxObject //ClientData
    {
        public this(IntPtr wxobj) ;
    	private this(IntPtr wxobj, бул memOwn);
        public this();
	    override protected проц dtor();
        public проц IncRef();
        public проц DecRef();
        static extern (C) private проц staticDoУстParameters(GridCellWorker объ, ткст param);
        public  проц УстParameters(ткст param);
    }
    
    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            static extern (C) IntPtr wxGridEditorCreatedEvent_ctor(цел ид, цел тип, IntPtr объ, цел row, цел col, IntPtr ctrl);
            static extern (C) цел    wxGridEditorCreatedEvent_GetRow(IntPtr сам);
            static extern (C) цел    wxGridEditorCreatedEvent_GetCol(IntPtr сам);
            static extern (C) IntPtr wxGridEditorCreatedEvent_GetControl(IntPtr сам);
            static extern (C) проц   wxGridEditorCreatedEvent_SetRow(IntPtr сам, цел row);
            static extern (C) проц   wxGridEditorCreatedEvent_SetCol(IntPtr сам, цел col);
            static extern (C) проц   wxGridEditorCreatedEvent_SetControl(IntPtr сам, IntPtr ctrl);
            //! \endcond

            //-----------------------------------------------------------------------------
    
    alias GridEditorCreatedEvent wxGridEditorCreatedEvent;
    public class GridEditorCreatedEvent : СобытиеКоманда 
    {
            public this(IntPtr wxobj);
            public this(цел ид, цел тип, wxObject объ, цел row, цел col, Control ctrl);
            public цел Row() ;
            public проц Row(цел значение);
            public цел Col();
            public проц Col(цел значение);
            public Control control();
            public проц control(Control значение) ;
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			ДобавьТипСоб(wxEVT_GRID_EDITOR_CREATED,             &GridEditorCreatedEvent.Нов);        
		}
    }
    
    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            static extern (C) IntPtr wxGrid_ctor();
            static extern (C) IntPtr wxGrid_ctorFull(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
            static extern (C) бул   wxGrid_CreateGrid(IntPtr сам, цел numRows, цел numCols,  цел selmode);
            static extern (C) проц   wxGrid_SetSelectionMode(IntPtr сам, цел selmode);
            static extern (C) цел    wxGrid_GetNumberRows(IntPtr сам);
            static extern (C) цел    wxGrid_GetNumberCols(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetTable(IntPtr сам);
            static extern (C) бул   wxGrid_SetTable(IntPtr сам, IntPtr table, бул takeOwnership, цел select);
            static extern (C) проц   wxGrid_ClearGrid(IntPtr сам);
            static extern (C) бул   wxGrid_InsertRows(IntPtr сам, цел поз, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_AppendRows(IntPtr сам, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_DeleteRows(IntPtr сам, цел поз, цел numRows, бул updateLabels);
            static extern (C) бул   wxGrid_InsertCols(IntPtr сам, цел поз, цел numCols, бул updateLabels);
            static extern (C) бул   wxGrid_AppendCols(IntPtr сам, цел numCols, бул updateLabels);
            static extern (C) бул   wxGrid_DeleteCols(IntPtr сам, цел поз, цел numCols, бул updateLabels);
            static extern (C) проц   wxGrid_BeginBatch(IntPtr сам);
            static extern (C) проц   wxGrid_EndBatch(IntPtr сам);
            static extern (C) цел    wxGrid_GetBatchCount(IntPtr сам);
            static extern (C) проц   wxGrid_ForceRefresh(IntPtr сам);
            static extern (C) бул   wxGrid_IsEditable(IntPtr сам);
            static extern (C) проц   wxGrid_EnableEditing(IntPtr сам, бул edit);
            static extern (C) проц   wxGrid_EnableCellEditControl(IntPtr сам, бул вкл);
            static extern (C) проц   wxGrid_DisableCellEditControl(IntPtr сам);
            static extern (C) бул   wxGrid_CanEnableCellControl(IntPtr сам);
            static extern (C) бул   wxGrid_IsCellEditControlEnabled(IntPtr сам);
            static extern (C) бул   wxGrid_IsCellEditControlShown(IntPtr сам);
            static extern (C) бул   wxGrid_IsCurrentCellReadOnly(IntPtr сам);
            static extern (C) проц   wxGrid_ShowCellEditControl(IntPtr сам);
            static extern (C) проц   wxGrid_HideCellEditControl(IntPtr сам);
            static extern (C) проц   wxGrid_SaveEditControlValue(IntPtr сам);
            static extern (C) цел    wxGrid_YToRow(IntPtr сам, цел y);
            static extern (C) цел    wxGrid_XToCol(IntPtr сам, цел x);
            static extern (C) цел    wxGrid_YToEdgeOfRow(IntPtr сам, цел y);
            static extern (C) цел    wxGrid_XToEdgeOfCol(IntPtr сам, цел x);
            static extern (C) проц   wxGrid_CellToRect(IntPtr сам, цел row, цел col, inout Прямоугольник прям);
            static extern (C) цел    wxGrid_GetGridCursorRow(IntPtr сам);
            static extern (C) цел    wxGrid_GetGridCursorCol(IntPtr сам);
            static extern (C) бул   wxGrid_IsVisible(IntPtr сам, цел row, цел col, бул wholeCellVisible);
            static extern (C) проц   wxGrid_MakeCellVisible(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetGridCursor(IntPtr сам, цел row, цел col);
            static extern (C) бул   wxGrid_MoveCursorUp(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorDown(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorLeft(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorRight(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MovePageDown(IntPtr сам);
            static extern (C) бул   wxGrid_MovePageUp(IntPtr сам);
            static extern (C) бул   wxGrid_MoveCursorUpBlock(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorDownBlock(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorLeftBlock(IntPtr сам, бул expandSelection);
            static extern (C) бул   wxGrid_MoveCursorRightBlock(IntPtr сам, бул expandSelection);
            static extern (C) цел    wxGrid_GetDefaultRowLabelSize(IntPtr сам);
            static extern (C) цел    wxGrid_GetRowLabelSize(IntPtr сам);
            static extern (C) цел    wxGrid_GetDefaultColLabelSize(IntPtr сам);
            static extern (C) цел    wxGrid_GetColLabelSize(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetLabelBackgroundColour(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetLabelTextColour(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetLabelFont(IntPtr сам);
            static extern (C) проц   wxGrid_GetRowLabelAlignment(IntPtr сам, out цел horiz, out цел vert);
            static extern (C) проц   wxGrid_GetColLabelAlignment(IntPtr сам, out цел horiz, out цел vert);
            static extern (C) IntPtr wxGrid_GetRowLabelValue(IntPtr сам, цел row);
            static extern (C) IntPtr wxGrid_GetColLabelValue(IntPtr сам, цел col);
            static extern (C) IntPtr wxGrid_GetGridLineColour(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellHighlightColour(IntPtr сам);
            static extern (C) цел    wxGrid_GetCellHighlightPenWidth(IntPtr сам);
            static extern (C) цел    wxGrid_GetCellHighlightROPenWidth(IntPtr сам);
            static extern (C) проц   wxGrid_SetRowLabelSize(IntPtr сам, цел ширь);
            static extern (C) проц   wxGrid_SetColLabelSize(IntPtr сам, цел высь);
            static extern (C) проц   wxGrid_SetLabelBackgroundColour(IntPtr сам, IntPtr col);
            static extern (C) проц   wxGrid_SetLabelTextColour(IntPtr сам, IntPtr col);
            static extern (C) проц   wxGrid_SetLabelFont(IntPtr сам, IntPtr fnt);
            static extern (C) проц   wxGrid_SetRowLabelAlignment(IntPtr сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetColLabelAlignment(IntPtr сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetRowLabelValue(IntPtr сам, цел row, ткст val);
            static extern (C) проц   wxGrid_SetColLabelValue(IntPtr сам, цел col, ткст val);
            static extern (C) проц   wxGrid_SetGridLineColour(IntPtr сам, IntPtr col);
            static extern (C) проц   wxGrid_SetCellHighlightColour(IntPtr сам, IntPtr col);
            static extern (C) проц   wxGrid_SetCellHighlightPenWidth(IntPtr сам, цел ширь);
            static extern (C) проц   wxGrid_SetCellHighlightROPenWidth(IntPtr сам, цел ширь);
            static extern (C) проц   wxGrid_EnableDragRowSize(IntPtr сам, бул вкл);
            static extern (C) проц   wxGrid_DisableDragRowSize(IntPtr сам);
            static extern (C) бул   wxGrid_CanDragRowSize(IntPtr сам);
            static extern (C) проц   wxGrid_EnableDragColSize(IntPtr сам, бул вкл);
            static extern (C) проц   wxGrid_DisableDragColSize(IntPtr сам);
            static extern (C) бул   wxGrid_CanDragColSize(IntPtr сам);
            static extern (C) проц   wxGrid_EnableDragGridSize(IntPtr сам, бул вкл);
            static extern (C) проц   wxGrid_DisableDragGridSize(IntPtr сам);
            static extern (C) бул   wxGrid_CanDragGridSize(IntPtr сам);
            static extern (C) проц   wxGrid_SetAttr(IntPtr сам, цел row, цел col, IntPtr attr);
            static extern (C) проц   wxGrid_SetRowAttr(IntPtr сам, цел row, IntPtr attr);
            static extern (C) проц   wxGrid_SetColAttr(IntPtr сам, цел col, IntPtr attr);
            static extern (C) проц   wxGrid_SetColFormatBool(IntPtr сам, цел col);
            static extern (C) проц   wxGrid_SetColFormatNumber(IntPtr сам, цел col);
            static extern (C) проц   wxGrid_SetColFormatFloat(IntPtr сам, цел col, цел ширь, цел precision);
            static extern (C) проц   wxGrid_SetColFormatCustom(IntPtr сам, цел col, ткст typeName);
            static extern (C) проц   wxGrid_EnableGridLines(IntPtr сам, бул вкл);
            static extern (C) бул   wxGrid_GridLinesEnabled(IntPtr сам);
            static extern (C) цел    wxGrid_GetDefaultRowSize(IntPtr сам);
            static extern (C) цел    wxGrid_GetRowSize(IntPtr сам, цел row);
            static extern (C) цел    wxGrid_GetDefaultColSize(IntPtr сам);
            static extern (C) цел    wxGrid_GetColSize(IntPtr сам, цел col);
            static extern (C) IntPtr wxGrid_GetDefaultCellBackgroundColour(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellBackgroundColour(IntPtr сам, цел row, цел col);
            static extern (C) IntPtr wxGrid_GetDefaultCellTextColour(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellTextColour(IntPtr сам, цел row, цел col);
            static extern (C) IntPtr wxGrid_GetDefaultCellFont(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellFont(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_GetDefaultCellAlignment(IntPtr сам, inout цел horiz, inout цел vert);
            static extern (C) проц   wxGrid_GetCellAlignment(IntPtr сам, цел row, цел col, inout цел horiz, inout цел vert);
            static extern (C) бул   wxGrid_GetDefaultCellOverflow(IntPtr сам);
            static extern (C) бул   wxGrid_GetCellOverflow(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_GetCellSize(IntPtr сам, цел row, цел col, inout цел num_rows, inout цел num_cols);
            static extern (C) проц   wxGrid_SetDefaultRowSize(IntPtr сам, цел высь, бул resizeExistingRows);
            static extern (C) проц   wxGrid_SetRowSize(IntPtr сам, цел row, цел высь);
            static extern (C) проц   wxGrid_SetDefaultColSize(IntPtr сам, цел ширь, бул resizeExistingCols);
            static extern (C) проц   wxGrid_SetColSize(IntPtr сам, цел col, цел ширь);
            static extern (C) проц   wxGrid_AutoSizeColumn(IntPtr сам, цел col, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeRow(IntPtr сам, цел row, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeColumns(IntPtr сам, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSizeRows(IntPtr сам, бул setAsMin);
            static extern (C) проц   wxGrid_AutoSize(IntPtr сам);
            static extern (C) проц   wxGrid_SetColMinimalWidth(IntPtr сам, цел col, цел ширь);
            static extern (C) проц   wxGrid_SetRowMinimalHeight(IntPtr сам, цел row, цел ширь);
            static extern (C) проц   wxGrid_SetColMinimalAcceptableWidth(IntPtr сам, цел ширь);
            static extern (C) проц   wxGrid_SetRowMinimalAcceptableHeight(IntPtr сам, цел ширь);
            static extern (C) цел    wxGrid_GetColMinimalAcceptableWidth(IntPtr сам);
            static extern (C) цел    wxGrid_GetRowMinimalAcceptableHeight(IntPtr сам);
            static extern (C) проц   wxGrid_SetDefaultCellBackgroundColour(IntPtr сам, IntPtr wxColour);
            static extern (C) проц   wxGrid_SetDefaultCellTextColour(IntPtr сам, IntPtr wxColour);
            static extern (C) проц   wxGrid_SetDefaultCellFont(IntPtr сам, IntPtr wxFont);
            static extern (C) проц   wxGrid_SetCellFont(IntPtr сам, цел row, цел col, IntPtr wxFont );
            static extern (C) проц   wxGrid_SetDefaultCellAlignment(IntPtr сам, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetCellAlignmentHV(IntPtr сам, цел row, цел col, цел horiz, цел vert);
            static extern (C) проц   wxGrid_SetDefaultCellOverflow(IntPtr сам, бул allow);
            static extern (C) проц   wxGrid_SetCellOverflow(IntPtr сам, цел row, цел col, бул allow);
            static extern (C) проц   wxGrid_SetCellSize(IntPtr сам, цел row, цел col, цел num_rows, цел num_cols);
            static extern (C) проц   wxGrid_SetDefaultRenderer(IntPtr сам, IntPtr renderer);
            static extern (C) проц   wxGrid_SetCellRenderer(IntPtr сам, цел row, цел col, IntPtr renderer);
            static extern (C) IntPtr wxGrid_GetDefaultRenderer(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellRenderer(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetDefaultEditor(IntPtr сам, IntPtr editor);
            static extern (C) проц   wxGrid_SetCellEditor(IntPtr сам, цел row, цел col, IntPtr editor);
            static extern (C) IntPtr wxGrid_GetDefaultEditor(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellEditor(IntPtr сам, цел row, цел col);
            static extern (C) IntPtr wxGrid_GetCellValue(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellValue(IntPtr сам, цел row, цел col, ткст s);
            static extern (C) бул   wxGrid_IsReadOnly(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetReadOnly(IntPtr сам, цел row, цел col, бул isReadOnly);
            static extern (C) проц   wxGrid_SelectRow(IntPtr сам, цел row, бул addToSelected);
            static extern (C) проц   wxGrid_SelectCol(IntPtr сам, цел col, бул addToSelected);
            static extern (C) проц   wxGrid_SelectBlock(IntPtr сам, цел topRow, цел leftCol, цел bottomRow, цел rightCol, бул addToSelected);
            static extern (C) проц   wxGrid_SelectAll(IntPtr сам);
            static extern (C) бул   wxGrid_IsSelection(IntPtr сам);
            static extern (C) проц   wxGrid_DeselectRow(IntPtr сам, цел row);
            static extern (C) проц   wxGrid_DeselectCol(IntPtr сам, цел col);
            static extern (C) проц   wxGrid_DeselectCell(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_ClearSelection(IntPtr сам);
            static extern (C) бул   wxGrid_IsInSelection(IntPtr сам, цел row, цел col);
            //static extern (C) IntPtr wxGrid_GetSelectedCells(IntPtr сам);
            //static extern (C) IntPtr wxGrid_GetSelectionBlockTopLeft(IntPtr сам);
            //static extern (C) IntPtr wxGrid_GetSelectionBlockBottomRight(IntPtr сам);
            //static extern (C) IntPtr wxGrid_GetSelectedRows(IntPtr сам);
            //static extern (C) IntPtr wxGrid_GetSelectedCols(IntPtr сам);
            static extern (C) проц   wxGrid_BlockToDeviceRect(IntPtr сам, IntPtr topLeft, IntPtr bottomRight, inout Прямоугольник прям);
            static extern (C) IntPtr wxGrid_GetSelectionBackground(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetSelectionForeground(IntPtr сам);
            static extern (C) проц   wxGrid_SetSelectionBackground(IntPtr сам, IntPtr c);
            static extern (C) проц   wxGrid_SetSelectionForeground(IntPtr сам, IntPtr c);
            static extern (C) проц   wxGrid_RegisterDataType(IntPtr сам, ткст typeName, IntPtr renderer, IntPtr editor);
            static extern (C) IntPtr wxGrid_GetDefaultEditorForCell(IntPtr сам, цел row, цел col);
            static extern (C) IntPtr wxGrid_GetDefaultRendererForCell(IntPtr сам, цел row, цел col);
            static extern (C) IntPtr wxGrid_GetDefaultEditorForType(IntPtr сам, ткст typeName);
            static extern (C) IntPtr wxGrid_GetDefaultRendererForType(IntPtr сам, ткст typeName);
            static extern (C) проц   wxGrid_SetMargins(IntPtr сам, цел extraWidth, цел extraHeight);
            static extern (C) IntPtr wxGrid_GetGridWindow(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetGridRowLabelWindow(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetGridColLabelWindow(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetGridCornerLabelWindow(IntPtr сам);
            static extern (C) проц   wxGrid_UpdateDimensions(IntPtr сам);
            static extern (C) цел    wxGrid_GetRows(IntPtr сам);
            static extern (C) цел    wxGrid_GetCols(IntPtr сам);
            static extern (C) цел    wxGrid_GetCursorRow(IntPtr сам);
            static extern (C) цел    wxGrid_GetCursorColumn(IntPtr сам);
            static extern (C) цел    wxGrid_GetScrollPosX(IntPtr сам);
            static extern (C) цел    wxGrid_GetScrollPosY(IntPtr сам);
            static extern (C) проц   wxGrid_SetScrollX(IntPtr сам, цел x);
            static extern (C) проц   wxGrid_SetScrollY(IntPtr сам, цел y);
            static extern (C) проц   wxGrid_SetColumnWidth(IntPtr сам, цел col, цел ширь);
            static extern (C) цел    wxGrid_GetColumnWidth(IntPtr сам, цел col);
            static extern (C) проц   wxGrid_SetRowHeight(IntPtr сам, цел row, цел высь);
            static extern (C) цел    wxGrid_GetViewHeight(IntPtr сам);
            static extern (C) цел    wxGrid_GetViewWidth(IntPtr сам);
            static extern (C) проц   wxGrid_SetLabelSize(IntPtr сам, цел orientation, цел рм);
            static extern (C) цел    wxGrid_GetLabelSize(IntPtr сам, цел orientation);
            static extern (C) проц   wxGrid_SetLabelAlignment(IntPtr сам, цел orientation, цел alignment);
            static extern (C) цел    wxGrid_GetLabelAlignment(IntPtr сам, цел orientation, цел alignment);
            static extern (C) проц   wxGrid_SetLabelValue(IntPtr сам, цел orientation, ткст val, цел поз);
            static extern (C) IntPtr wxGrid_GetLabelValue(IntPtr сам, цел orientation, цел поз);
            static extern (C) IntPtr wxGrid_GetCellTextFontGrid(IntPtr сам);
            static extern (C) IntPtr wxGrid_GetCellTextFont(IntPtr сам, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellTextFontGrid(IntPtr сам, IntPtr fnt);
            static extern (C) проц   wxGrid_SetCellTextFont(IntPtr сам, IntPtr fnt, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellTextColour(IntPtr сам, цел row, цел col, IntPtr val);
            static extern (C) проц   wxGrid_SetCellTextColourGrid(IntPtr сам, IntPtr col);
            static extern (C) проц   wxGrid_SetCellBackgroundColourGrid(IntPtr сам, IntPtr col);
            static extern (C) проц   wxGrid_SetCellBackgroundColour(IntPtr сам, цел row, цел col, IntPtr цвет);
            static extern (C) бул   wxGrid_GetEditable(IntPtr сам);
            static extern (C) проц   wxGrid_SetEditable(IntPtr сам, бул edit);
            static extern (C) бул   wxGrid_GetEditInPlace(IntPtr сам);
            static extern (C) проц   wxGrid_SetCellAlignment(IntPtr сам, цел alignment, цел row, цел col);
            static extern (C) проц   wxGrid_SetCellAlignmentGrid(IntPtr сам, цел alignment);
            static extern (C) проц   wxGrid_SetCellBitmap(IntPtr сам, IntPtr битмап, цел row, цел col);
            static extern (C) проц   wxGrid_SetDividerPen(IntPtr сам, IntPtr pen);
            static extern (C) IntPtr wxGrid_GetDividerPen(IntPtr сам);
            static extern (C) цел    wxGrid_GetRowHeight(IntPtr сам, цел row);
            //! \endcond

        //-----------------------------------------------------------------------------

    alias Grid wxGrid;
    public class Grid : ScrolledWindow
    {
        public this(IntPtr wxobj);
        public this();
        public this(Окно родитель, цел ид);
        public this(Окно родитель, цел ид, Точка поз);
        public this(Окно родитель, цел ид, Точка поз, Размер разм);
        public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль);
        public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, ткст имя);
	public this(Окно родитель);
        public this(Окно родитель, Точка поз);
        public this(Окно родитель, Точка поз, Размер разм);
        public this(Окно родитель, Точка поз, Размер разм, цел стиль);
        public this(Окно родитель, Точка поз, Размер разм, цел стиль, ткст имя);
        public бул CreateGrid(цел numRows, цел numCols);
            public бул CreateGrid(цел numRows, цел numCols, GridSelectionMode selmode);
            public проц SelectionMode(GridSelectionMode значение) ;
            public цел NumberRows();
            public цел NumberCols() ;
       //     public GridTableBase Table() ;
        public бул УстTable(GridTableBase table);
        public бул УстTable(GridTableBase table, бул takeOwnerShip);
            public бул УстTable(GridTableBase table, бул takeOwnership, GridSelectionMode select);
            public проц ClearGrid();
        public бул InsertRows();
        public бул InsertRows(цел поз);
        public бул InsertRows(цел поз, цел numRows);
            public бул InsertRows(цел поз, цел numRows, бул updateLabels);
        public бул AppendRows();        
        public бул AppendRows(цел numRows);    
            public бул AppendRows(цел numRows, бул updateLabels);
        public бул DeleteRows();
        public бул DeleteRows(цел поз);
        public бул DeleteRows(цел поз, цел numRows);
            public бул DeleteRows(цел поз, цел numRows, бул updateLabels);
        public бул InsertCols();
        public бул InsertCols(цел поз);
        public бул InsertCols(цел поз, цел numRows);
            public бул InsertCols(цел поз, цел numCols, бул updateLabels);
        public бул AppendCols();
        public бул AppendCols(цел numCols);
            public бул AppendCols(цел numCols, бул updateLabels);
        public бул DeleteCols();
        public бул DeleteCols(цел поз);
        public бул DeleteCols(цел поз, цел numRows);
            public бул DeleteCols(цел поз, цел numCols, бул updateLabels);
            public проц BeginBatch();
            public проц EndBatch();
            public цел BatchCount();
            public проц ForceRefresh();
            public бул IsEditable() ;
            public проц IsEditable(бул значение) ;
            public проц CellEditControlEnabled(бул значение) ;
            public бул CellEditControlEnabled() ;
            public проц DisableCellEditControl();
            public бул CanEnableCellControl() ;
            public бул IsCellEditControlShown() ;
            public бул IsCurrentCellReadOnly() ;
            public проц ShowCellEditControl();
            public проц HideCellEditControl();
            public проц SaveEditControlValue();
            //public проц XYToCell(цел x, цел y,  GridCellCoords );
            public цел YToRow(цел y);
            public цел XToCol(цел x);    
            public цел YToEdgeOfRow(цел y);    
            public цел XToEdgeOfCol(цел x);
            public Прямоугольник CellToRect(цел row, цел col);
            public цел GridCursorRow() ;
            public цел GridCursorCol();
            public бул Виден(цел row, цел col, бул wholeCellVisible);
            public проц MakeCellVisible(цел row, цел col);
            public проц УстGridCursor(цел row, цел col);
            public бул MoveCursorUp(бул expandSelection);
            public бул MoveCursorDown(бул expandSelection);
            public бул MoveCursorLeft(бул expandSelection);
            public бул MoveCursorRight(бул expandSelection);
            public бул MovePageDown();
            public бул MovePageUp();
            public бул MoveCursorUpBlock(бул expandSelection);
            public бул MoveCursorDownBlock(бул expandSelection);
            public бул MoveCursorLeftBlock(бул expandSelection);
            public бул MoveCursorRightBlock(бул expandSelection);
            public цел DefaultRowLabelSize();
            public цел RowLabelSize();
            public проц RowLabelSize(цел значение);
            public цел DefaultColLabelSize() ;
            public цел ColLabelSize();
            public проц ColLabelSize(цел значение);
            public Цвет LabelBackgroundColour() ;
            public проц LabelBackgroundColour(Цвет значение) ;
            public Цвет LabelTextColour() ;
            public проц LabelTextColour(Цвет значение) ;
            public Шрифт LabelFont();
            public проц LabelFont(Шрифт значение);
            public проц GetRowLabelAlignment(out цел horiz, out цел vert);
            public проц GetColLabelAlignment(out цел horiz, out цел vert);
            public ткст GetRowLabelValue(цел row);
            public ткст GetColLabelValue(цел col);
            public Цвет GridLineColour() ;
            public проц GridLineColour(Цвет значение) ;
            public Цвет CellHighlightColour() ;
            public проц CellHighlightColour(Цвет значение) ;
            public цел CellHighlightPenWidth();
            public проц CellHighlightPenWidth(цел значение) ;
            public цел CellHighlightROPenWidth() ;
            public проц CellHighlightROPenWidth(цел значение) ;
            public проц УстRowLabelAlignment(цел horiz, цел vert);
            public проц УстColLabelAlignment(цел horiz, цел vert);
            public проц УстRowLabelValue(цел row, ткст стр);
            public проц УстColLabelValue(цел col, ткст стр);
            public проц DragRowSizeEnabled(бул значение) ;
            public бул DragRowSizeEnabled() ;
            public проц DisableDragRowSize();
            public проц DragColSizeEnabled(бул значение);
            public бул DragColSizeEnabled() ;
            public проц DisableDragColSize();
            public проц DragGridSizeEnabled(бул значение) ;
            public бул DragGridSizeEnabled() ;
            public проц DisableDragGridSize();
            public проц УстАтр(цел row, цел col, GridCellAttr attr);
            public проц УстRowAttr(цел row, GridCellAttr attr);
            public проц УстColAttr(цел col, GridCellAttr attr);
            public проц ColFormatBool(цел значение) ;
            public проц ColFormatNumber(цел значение) ;
            public проц УстColFormatFloat(цел col);
            public проц УстColFormatFloat(цел col, цел ширь);
            public проц УстColFormatFloat(цел col, цел ширь, цел precision);
            public проц УстColFormatCustom(цел col, ткст typeName);
            public проц GridLinesEnabled(бул значение) ;
            public бул GridLinesEnabled() ;
            public цел DefaultRowSize();
            public цел GetRowSize(цел row);
            public цел DefaultColSize() ;
            public цел GetColSize(цел col);
            public Цвет DefaultCellBackgroundColour();
            public проц DefaultCellBackgroundColour(Цвет значение) ;
            public Цвет DefaultCellTextColour() ;
            public проц DefaultCellTextColour(Цвет значение);
            public Шрифт DefaultCellFont();
            public проц DefaultCellFont(Шрифт значение) ;
            public Шрифт GetCellFont(цел row, цел col);
            public проц GetDefaultCellAlignment(inout цел horiz, inout цел vert);
            public проц GetCellAlignment(цел row, цел col, inout цел horiz, inout цел vert);
            public бул DefaultCellOverflow();
            public проц DefaultCellOverflow(бул значение) ;
            public бул GetCellOverflow(цел row, цел col);
            public проц GetCellSize(цел row, цел col, inout цел num_rows, inout цел num_cols);
            public проц УстDefaultRowSize(цел высь, бул resizeExistingRows);
            public проц УстRowSize(цел row, цел высь);
            public проц УстDefaultColSize(цел ширь, бул resizeExistingCols);
            public проц УстColSize(цел col, цел ширь);
            public проц AutoSizeColumn(цел col, бул setAsMin);
            public проц AutoSizeRow(цел row, бул setAsMin);
            public проц AutoSizeColumns();
            public проц AutoSizeColumns(бул setAsMin);
            public проц AutoSizeRows();
            public проц AutoSizeRows(бул setAsMin);
            public проц AutoSize();
            public проц УстColMinimalWidth(цел col, цел ширь);
            public проц УстRowMinimalHeight(цел row, цел ширь);
            public проц ColMinimalAcceptableWidth(цел значение);
            public цел ColMinimalAcceptableWidth() ;
            public проц RowMinimalAcceptableHeight(цел значение);
            public цел RowMinimalAcceptableHeight();
            public проц УстCellFont(цел row, цел col, Шрифт fnt);
            public проц УстDefaultCellAlignment(цел horiz, цел vert);
            public проц УстCellAlignment(цел row, цел col, цел horiz, цел vert);
            public проц УстCellOverflow(цел row, цел col, бул allow);
            public проц УстCellSize(цел row, цел col, цел num_rows, цел num_cols);
            public проц DefaultRenderer(GridCellRenderer значение) ;
            public проц УстCellRenderer(цел row, цел col, GridCellRenderer renderer);
           // public GridCellRenderer GetCellRenderer(цел row, цел col);
            public проц DefaultEditor(GridCellEditor значение) ;
           // public GridCellEditor DefaultEditor() ;
            public проц УстCellEditor(цел row, цел col, GridCellEditor editor);
           // public GridCellEditor GetCellEditor(цел row, цел col);
            public ткст GetCellValue(цел row, цел col);
            public проц УстCellValue(цел row, цел col, ткст s);
            public бул IsReadOnly(цел row, цел col);
            public проц УстReadOnly(цел row, цел col);
            public проц УстReadOnly(цел row, цел col, бул isReadOnly);
            public проц SelectRow(цел row, бул addToSelected);
            public проц SelectCol(цел col, бул addToSelected);
            public проц SelectBlock(цел topRow, цел leftCol, цел bottomRow, цел rightCol, бул addToSelected);
            public проц SelectAll();
            public бул Выборка() ;
            public проц DeselectRow(цел row);
            public проц DeselectCol(цел col);
            public проц DeselectCell(цел row, цел col);
            public проц ClearSelection();
            public бул IsInSelection(цел row, цел col);
    
            //-----------------------------------------------------------------------------

//! \cond VERSION
version(NOT_IMPLEMENTED){
            public GridCellCoordsArray GetSelectedCells();
            public GridCellCoordsArray GetSelectionBlockTopLeft();
            public GridCellCoordsArray GetSelectionBlockBottomRight();
            public ЦелМассив GetSelectedRows();
            public ЦелМассив GetSelectedCols();
} // version(NOT_IMPLEMENTED)
//! \endcond
            //-----------------------------------------------------------------------------
    
            public Прямоугольник BlockToDeviceRect(GridCellCoords topLeft, GridCellCoords bottomRight);
            public Цвет SelectionBackground();
            public проц SelectionBackground(Цвет значение) ;
            public Цвет SelectionForeground();
            public проц SelectionForeground(Цвет значение);
            public проц RegisterDataType(ткст typeName, GridCellRenderer renderer, GridCellEditor editor);
           // public GridCellEditor GetDefaultEditorForCell(цел row, цел col);
           // public GridCellRenderer GetDefaultRendererForCell(цел row, цел col);
          //  public GridCellEditor GetDefaultEditorForType(ткст typeName);
          //  public GridCellRenderer GetDefaultRendererForType(ткст typeName);
            public проц УстMargins(цел extraWidth, цел extraHeight);
            public Окно GridWindow();
            public Окно GridRowLabelWindow() ;
            public Окно GridColLabelWindow();
            public Окно GridCornerLabelWindow() ;
            public проц UpdateDimensions();
            public цел Rows() ;
            public цел Cols();
            public цел CursorRow() ;
            public цел CursorColumn() ;
            public цел ScrollPosX();
            public проц ScrollPosX(цел значение);
            public цел ScrollPosY() ;
            public проц ScrollPosY(цел значение) ;
            public проц УстColumnWidth(цел col, цел ширь);
            public цел GetColumnWidth(цел col);
            public проц УстRowHeight(цел row, цел высь);
            public цел ViewHeight();
            public цел ViewWidth() ;
            public проц УстLabelSize(цел orientation, цел рм);
            public цел GetLabelSize(цел orientation);
            public проц УстLabelAlignment(цел orientation, цел alignment);
            public цел GetLabelAlignment(цел orientation, цел alignment);
            public проц УстLabelValue(цел orientation, ткст val, цел поз);
            public ткст GetLabelValue(цел orientation, цел поз);
            public Шрифт CellTextFont() ;
            public проц CellTextFont(Шрифт значение);
            public Шрифт GetCellTextFont(цел row, цел col);
            public проц УстCellTextFont(Шрифт fnt, цел row, цел col);
            public проц УстCellTextColour(цел row, цел col, Цвет val);
            public проц CellTextColour(Цвет значение) ;
            public Цвет GetCellTextColour(цел row, цел col);
            public проц CellBackgroundColour(Цвет значение);
            public проц УстCellBackgroundColour(цел row, цел col, Цвет цвет);
            public Цвет GetCellBackgroundColour(цел row, цел col);
            public бул Editable() { return wxGrid_GetEditable(wxobj); }
            public проц Editable(бул значение);
            public бул EditInPlace() ;
            public проц УстCellAlignment(цел alignment, цел row, цел col);
            public проц CellAlignment(цел значение);
            public проц УстCellBitmap(Битмап битмап, цел row, цел col);
            public проц DividerPen(Pen значение) ;
            public Pen DividerPen() ;
            public цел GetRowHeight(цел row);
		public проц CellLeftClick_Add(ДатчикСобытий значение);
		public проц CellLeftClick_Remove(ДатчикСобытий значение) ;
		public проц CellRightClick_Add(ДатчикСобытий значение) ;
		public проц CellRightClick_Remove(ДатчикСобытий значение);
		public проц CellLeftDoubleClick_Add(ДатчикСобытий значение) ;
		public проц CellLeftDoubleClick_Remove(ДатчикСобытий значение);
		public проц CellRightDoubleClick_Add(ДатчикСобытий значение);
		public проц CellRightDoubleClick_Remove(ДатчикСобытий значение);
		public проц LabelLeftClick_Add(ДатчикСобытий значение) ;
		public проц LabelLeftClick_Remove(ДатчикСобытий значение) ;
		public проц LabelRightClick_Add(ДатчикСобытий значение) ;
		public проц LabelRightClick_Remove(ДатчикСобытий значение) ;
		public проц LabelLeftDoubleClick_Add(ДатчикСобытий значение) ;
		public проц LabelLeftDoubleClick_Remove(ДатчикСобытий значение) ;
		public проц LabelRightDoubleClick_Add(ДатчикСобытий значение);
		public проц LabelRightDoubleClick_Remove(ДатчикСобытий значение) ;
		public проц RowSize_Add(ДатчикСобытий значение);
		public проц RowSize_Remove(ДатчикСобытий значение);
		public проц ColumnSize_Add(ДатчикСобытий значение) ;
		public проц ColumnSize_Remove(ДатчикСобытий значение) ;
		public проц RangeSelect_Add(ДатчикСобытий значение) ;
		public проц RangeSelect_Remove(ДатчикСобытий значение);
		public проц CellChange_Add(ДатчикСобытий значение);
		public проц CellChange_Remove(ДатчикСобытий значение);
		public проц SelectCell_Add(ДатчикСобытий значение) ;
		public проц SelectCell_Remove(ДатчикСобытий значение) ;
		public проц EditorShown_Add(ДатчикСобытий значение) ;
		public проц EditorShown_Remove(ДатчикСобытий значение) ;
		public проц EditorHidden_Add(ДатчикСобытий значение) ;
		public проц EditorHidden_Remove(ДатчикСобытий значение) ;
		public проц EditorCreate_Add(ДатчикСобытий значение);
		public проц EditorCreate_Remove(ДатчикСобытий значение);

    }

        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellCoords_ctor();
	static extern (C) проц   wxGridCellCoords_dtor(IntPtr сам);
        static extern (C) цел    wxGridCellCoords_GetRow(IntPtr сам);
        static extern (C) проц   wxGridCellCoords_SetRow(IntPtr сам, цел n);
        static extern (C) цел    wxGridCellCoords_GetCol(IntPtr сам);
        static extern (C) проц   wxGridCellCoords_SetCol(IntPtr сам, цел n);
        static extern (C) проц   wxGridCellCoords_Set(IntPtr сам, цел row, цел col);
        //! \endcond
	
        //-----------------------------------------------------------------------------
    
    alias GridCellCoords wxGridCellCoords;
    public class GridCellCoords : wxObject
    {
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
        public this();
        public this(цел r, цел c);
	    override protected проц dtor() ;
        public проц Row(цел значение);
        public цел Row();
        public проц Col(цел значение) ;
        public цел Col() ;
        public проц Уст(цел row, цел col);
    }

        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellAttr_ctor(IntPtr colText, IntPtr colBack, IntPtr шрифт, цел hAlign, цел vAlign);
        static extern (C) IntPtr wxGridCellAttr_ctor2();
        static extern (C) IntPtr wxGridCellAttr_ctor3(IntPtr attrDefault);
        static extern (C) IntPtr wxGridCellAttr_Clone(IntPtr сам);
        static extern (C) проц   wxGridCellAttr_MergeWith(IntPtr сам, IntPtr mergefrom);
        static extern (C) проц   wxGridCellAttr_IncRef(IntPtr сам);
        static extern (C) проц   wxGridCellAttr_DecRef(IntPtr сам);
        static extern (C) проц   wxGridCellAttr_SetTextColour(IntPtr сам, IntPtr colText);
        static extern (C) проц   wxGridCellAttr_SetBackgroundColour(IntPtr сам, IntPtr colBack);
        static extern (C) проц   wxGridCellAttr_SetFont(IntPtr сам, IntPtr шрифт);
        static extern (C) проц   wxGridCellAttr_SetAlignment(IntPtr сам, цел hAlign, цел vAlign);
        static extern (C) проц   wxGridCellAttr_SetSize(IntPtr сам, цел num_rows, цел num_cols);
        static extern (C) проц   wxGridCellAttr_SetOverflow(IntPtr сам, бул allow);
        static extern (C) проц   wxGridCellAttr_SetReadOnly(IntPtr сам, бул isReadOnly);
        static extern (C) проц   wxGridCellAttr_SetRenderer(IntPtr сам, IntPtr renderer);
        static extern (C) проц   wxGridCellAttr_SetEditor(IntPtr сам, IntPtr editor);
        static extern (C) бул   wxGridCellAttr_HasTextColour(IntPtr сам);
        static extern (C) бул   wxGridCellAttr_HasBackgroundColour(IntPtr сам);
        static extern (C) бул   wxGridCellAttr_HasFont(IntPtr сам);
        static extern (C) бул   wxGridCellAttr_HasAlignment(IntPtr сам);
        static extern (C) бул   wxGridCellAttr_HasRenderer(IntPtr сам);
        static extern (C) бул   wxGridCellAttr_HasEditor(IntPtr сам);
        static extern (C) бул   wxGridCellAttr_HasReadWriteMode(IntPtr сам);
        static extern (C) IntPtr wxGridCellAttr_GetTextColour(IntPtr сам);
        static extern (C) IntPtr wxGridCellAttr_GetBackgroundColour(IntPtr сам);
        static extern (C) IntPtr wxGridCellAttr_GetFont(IntPtr сам);
        static extern (C) проц   wxGridCellAttr_GetAlignment(IntPtr сам, inout цел hAlign, inout цел vAlign);
        static extern (C) проц   wxGridCellAttr_GetSize(IntPtr сам, inout цел num_rows, inout цел num_cols);
        static extern (C) бул   wxGridCellAttr_GetOverflow(IntPtr сам);
        static extern (C) IntPtr wxGridCellAttr_GetRenderer(IntPtr сам, IntPtr grid, цел row, цел col);
        static extern (C) IntPtr wxGridCellAttr_GetEditor(IntPtr сам, IntPtr grid, цел row, цел col);
        static extern (C) бул   wxGridCellAttr_IsReadOnly(IntPtr сам);
        static extern (C) проц   wxGridCellAttr_SetDefAttr(IntPtr сам, IntPtr defAttr);
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
    
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
        public this();
        public this(GridCellAttr attrDefault);
        public this(Цвет colText, Цвет colBack, Шрифт шрифт, цел hAlign, цел vAlign);
	    public static wxObject Нов(IntPtr ptr);
    	override protected проц dtor() ;
        public GridCellAttr Clone();
        public проц MergeWith(GridCellAttr mergefrom);
        public проц IncRef();
        public проц DecRef();
        public проц ЦветТекста(Цвет значение) ;
        public Цвет ЦветТекста() ;  
        public проц ЦветФона(Цвет значение);
        public Цвет ЦветФона();
        public проц шрифт(Шрифт значение) ;
        public Шрифт шрифт();
        public проц УстAlignment(цел hAlign, цел vAlign);
        public проц GetAlignment(inout цел hAlign, inout цел vAlign);
        public проц УстРазм(цел num_rows, цел num_cols);
        public проц GetSize(inout цел num_rows, inout цел num_cols);
        public проц Overflow(бул значение) ;
        public бул Overflow();
        public проц ReadOnly(бул значение) ;
        public бул ReadOnly();
        public проц УстRenderer(GridCellRenderer renderer);
        public проц Editor(GridCellEditor значение) ;       
        //public GridCellEditor GetEditor(Grid grid, цел row, цел col);
        public бул ЕстьЦветТекста() ;        
        public бул ЕстьЦветФона() ;
        public бул ЕстьШрифт() ;
        public бул HasAlignment() ;
        public бул HasRenderer() ;
        public бул HasEditor() ;
        public бул HasReadWriteMode();
       // public GridCellRenderer GetRenderer(Grid grid, цел row, цел col);
        public проц DefAttr(GridCellAttr значение) ;
    }

        //! \cond EXTERN
        static extern (C) IntPtr wxGridSizeEvent_ctor();
        static extern (C) IntPtr wxGridSizeEvent_ctorParam(цел ид, цел тип, IntPtr объ, цел rowOrCol, цел x, цел y, бул control, бул shift, бул alt, бул meta);
        static extern (C) цел    wxGridSizeEvent_GetRowOrCol(IntPtr сам);
        static extern (C) проц   wxGridSizeEvent_GetPosition(IntPtr сам, inout Точка тчк);
        static extern (C) бул   wxGridSizeEvent_ControlDown(IntPtr сам);
        static extern (C) бул   wxGridSizeEvent_MetaDown(IntPtr сам);
        static extern (C) бул   wxGridSizeEvent_ShiftDown(IntPtr сам);
        static extern (C) бул   wxGridSizeEvent_AltDown(IntPtr сам);
        static extern (C) проц wxGridSizeEvent_Veto(IntPtr сам);
        static extern (C) проц wxGridSizeEvent_Allow(IntPtr сам);
        static extern (C) бул wxGridSizeEvent_IsAllowed(IntPtr сам);          
        //! \endcond
    
        //-----------------------------------------------------------------------------
        
    alias GridSizeEvent wxGridSizeEvent;
    public class GridSizeEvent : Событие 
    {
        public this(IntPtr wxobj) ;
        public this();
        public this(цел ид, цел тип, wxObject объ, цел rowOrCol, цел x, цел y, бул control, бул shift, бул alt, бул meta);
        public цел RowOrCol();
        public Точка Позиция();
        public бул ControlDown() ;
        public бул MetaDown();
        public бул ShiftDown();
        public бул AltDown();
        public проц Veto();
        public проц Allow();
        public бул Allowed();
	    private static Событие Нов(IntPtr объ);
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
        alias проц function(GridCellRenderer объ, IntPtr grid, IntPtr attr, IntPtr dc, Прямоугольник прям, цел row, цел col, бул isSelected) Virtual_Draw;
        alias Размер function(GridCellRenderer объ, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col) Virtual_GetBestSize;
        alias IntPtr function(GridCellRenderer объ) Virtual_RendererClone;
	}

        //-----------------------------------------------------------------------------
        
        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellRenderer_ctor();
	    static extern (C) проц wxGridCellRenderer_dtor(IntPtr сам);
        static extern (C) проц wxGridCellRenderer_RegisterVirtual(IntPtr сам, GridCellRenderer объ, Virtual_Draw draw, Virtual_GetBestSize getBestSize, Virtual_RendererClone clone);
        //! \endcond
	
	//-----------------------------------------------------------------------------
	
    public abstract class GridCellRenderer : GridCellWorker
    {
        public this();        
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);	
	    //public static wxObject Нов(IntPtr ptr) ;
    	override protected проц dtor() ;
        static extern (C) private проц staticDoDraw(GridCellRenderer объ, IntPtr grid, IntPtr attr, IntPtr dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        public abstract проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) private Размер staticDoGetBestSize(GridCellRenderer объ, IntPtr grid, IntPtr attr, IntPtr dc,  цел row, цел col);
        public abstract Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
        static extern (C) private IntPtr staticDoClone(GridCellRenderer объ);
        public abstract GridCellRenderer Clone();
    }
    
    //-----------------------------------------------------------------------------
    
        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellStringRenderer_ctor();
	    static extern (C) проц wxGridCellStringRenderer_dtor(IntPtr сам);
	    static extern (C) проц wxGridCellStringRenderer_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellStringRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellStringRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
        static extern (C) IntPtr wxGridCellStringRenderer_Clone(IntPtr сам);
        //! \endcond
	
    alias GridCellStringRenderer wxGridCellStringRenderer;
    public class GridCellStringRenderer : GridCellRenderer
    {
        public this();            
        public this(IntPtr wxobj);
	private this(IntPtr wxobj, бул memOwn);
	override protected проц dtor() ;
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
        public override GridCellRenderer Clone();
    }
    
    //-----------------------------------------------------------------------------
    
        static extern (C) IntPtr wxGridCellNumberRenderer_ctor();
	    static extern (C) проц wxGridCellNumberRenderer_dtor(IntPtr сам);
        static extern (C) проц wxGridCellNumberRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellNumberRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
        static extern (C) IntPtr wxGridCellNumberRenderer_Clone(IntPtr сам);
	
    alias GridCellNumberRenderer wxGridCellNumberRenderer;
    public class GridCellNumberRenderer : GridCellStringRenderer
    {
        public this();
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor();
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
        public override GridCellRenderer Clone();
    }
    
    //-----------------------------------------------------------------------------
    
        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellFloatRenderer_ctor(цел ширь, цел precision);
	static extern (C) проц wxGridCellFloatRenderer_dtor(IntPtr сам);
        static extern (C) проц wxGridCellFloatRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellFloatRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
        static extern (C) IntPtr wxGridCellFloatRenderer_Clone(IntPtr сам);
        static extern (C) цел wxGridCellFloatRenderer_GetWidth(IntPtr сам);
        static extern (C) проц wxGridCellFloatRenderer_SetWidth(IntPtr сам, цел ширь);
        static extern (C) цел wxGridCellFloatRenderer_GetPrecision(IntPtr сам);
        static extern (C) проц wxGridCellFloatRenderer_SetPrecision(IntPtr сам, цел precision);
        static extern (C) проц wxGridCellFloatRenderer_SetParameters(IntPtr сам, ткст parameter);
        //! \endcond
	
    alias GridCellFloatRenderer wxGridCellFloatRenderer;
    public class GridCellFloatRenderer : GridCellStringRenderer
    {
        public this();
        public this(цел ширь);
        public this(цел ширь, цел precision);
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor();
        public override проц УстParameters(ткст parameter);
        public цел Ширь();
        public проц Ширь(цел значение) ;
        public цел Precision() ;
        public проц Precision(цел значение) ;
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
        public override GridCellRenderer Clone();
    }
    
    //-----------------------------------------------------------------------------
    
        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellBoolRenderer_ctor();
	    static extern (C) проц wxGridCellBoolRenderer_dtor(IntPtr сам);
	    static extern (C) проц wxGridCellBoolRenderer_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) проц wxGridCellBoolRenderer_Draw(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, inout Прямоугольник прям, цел row, цел col, бул isSelected);
        static extern (C) проц wxGridCellBoolRenderer_GetBestSize(IntPtr сам, IntPtr grid, IntPtr attr, IntPtr dc, цел row, цел col, out Размер разм);
        static extern (C) IntPtr wxGridCellBoolRenderer_Clone(IntPtr сам);
        //! \endcond
	
    alias GridCellBoolRenderer wxGridCellBoolRenderer;
    public class GridCellBoolRenderer : GridCellRenderer
    {
        public this();
        public this(IntPtr wxobj);
	    private this(IntPtr wxobj, бул memOwn);
	    override protected проц dtor() ;
        public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected);
        public override Размер GetBestSize(Grid grid, GridCellAttr attr, DC dc, цел row, цел col);
        public override GridCellRenderer Clone();
    }
    
    //-----------------------------------------------------------------------------
    
        extern (C) {
        alias цел  function(GridTableBase объ) Virtual_GetNumberRows;
        alias цел  function(GridTableBase объ) Virtual_GetNumberCols;
        alias бул function(GridTableBase объ, цел row, цел col) Virtual_IsEmptyCell;
        alias ткст function(GridTableBase объ, цел row, цел col) Virtual_GetValue_gt;
        alias проц function(GridTableBase объ, цел row, цел col, IntPtr val) Virtual_SetValue;
        alias бул function(GridTableBase объ, цел row, цел col, IntPtr typeName) Virtual_CanGetValueAs;
        alias цел  function(GridTableBase объ, цел row, цел col) Virtual_GetValueAsLong;
        alias double function(GridTableBase объ, цел row, цел col) Virtual_GetValueAsDouble;
        alias проц function(GridTableBase объ, цел row, цел col, цел значение) Virtual_SetValueAsLong;
        alias проц function(GridTableBase объ, цел row, цел col, double значение) Virtual_SetValueAsDouble;
        alias проц function(GridTableBase объ, цел row, цел col, бул значение) Virtual_SetValueAsBool;
        alias IntPtr function(GridTableBase объ, цел row, цел col, IntPtr typeName) Virtual_GetValueAsCustom;
        alias проц function(GridTableBase объ, цел row, цел col, IntPtr typeName, IntPtr значение) Virtual_SetValueAsCustom;
        alias ткст function(GridTableBase объ, цел col) Virtual_GetColLabelValue;
        alias проц function(GridTableBase объ, IntPtr grid) Virtual_SetView;
        alias IntPtr function(GridTableBase объ) Virtual_GetView;
        alias проц function(GridTableBase объ) Virtual_Clear;
        alias бул function(GridTableBase объ, цел поз, цел numRows) Virtual_InsertRows;
        alias бул function(GridTableBase объ, цел numRows) Virtual_AppendRows;
        alias проц function(GridTableBase объ, цел row, IntPtr val) Virtual_SetRowLabelValue;
        alias проц function(GridTableBase объ, IntPtr attrProvider) Virtual_SetAttrProvider;
        alias IntPtr function(GridTableBase объ) Virtual_GetAttrProvider;
        alias бул function(GridTableBase объ) Virtual_CanHaveAttributes;
        alias IntPtr function(GridTableBase объ, цел row, цел col, цел kind) Virtual_GetAttr_gt;
        alias проц function(GridTableBase объ, IntPtr attr, цел row, цел col) Virtual_SetAttr_gt;
        alias проц function(GridTableBase объ, IntPtr attr, цел row) Virtual_SetRowAttr_gt;
        }

        //! \cond EXTERN
        static extern (C) IntPtr wxGridTableBase_ctor();
        static extern (C) проц wxGridTableBase_RegisterVirtual(IntPtr сам, GridTableBase объ, 
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

        static extern (C) цел    wxGridTableBase_GetNumberRows(IntPtr сам);
        static extern (C) цел    wxGridTableBase_GetNumberCols(IntPtr сам);
        static extern (C) бул   wxGridTableBase_IsEmptyCell(IntPtr сам, цел row, цел col);
        static extern (C) IntPtr wxGridTableBase_GetValue(IntPtr сам, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetValue(IntPtr сам, цел row, цел col, IntPtr val);
        static extern (C) IntPtr wxGridTableBase_GetTypeName(IntPtr сам, цел row, цел col);
        static extern (C) бул   wxGridTableBase_CanGetValueAs(IntPtr сам, цел row, цел col, ткст typeName);
        static extern (C) бул   wxGridTableBase_CanУстValueAs(IntPtr сам, цел row, цел col, ткст typeName);
        static extern (C) цел   wxGridTableBase_GetValueAsLong(IntPtr сам, цел row, цел col);
        static extern (C) double wxGridTableBase_GetValueAsDouble(IntPtr сам, цел row, цел col);
        static extern (C) бул   wxGridTableBase_GetValueAsBool(IntPtr сам, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetValueAsLong(IntPtr сам, цел row, цел col, цел val);
        static extern (C) проц   wxGridTableBase_SetValueAsDouble(IntPtr сам, цел row, цел col, double val);
        static extern (C) проц   wxGridTableBase_SetValueAsBool(IntPtr сам, цел row, цел col, бул val);
        static extern (C) IntPtr wxGridTableBase_GetValueAsCustom(IntPtr сам, цел row, цел col, ткст typeName);
        static extern (C) проц   wxGridTableBase_SetValueAsCustom(IntPtr сам, цел row, цел col, ткст typeName, IntPtr val);
        static extern (C) проц   wxGridTableBase_SetView(IntPtr сам, IntPtr grid);
        static extern (C) IntPtr wxGridTableBase_GetView(IntPtr сам);
        static extern (C) проц   wxGridTableBase_Clear(IntPtr сам);
        static extern (C) бул   wxGridTableBase_InsertRows(IntPtr сам, цел поз, цел numRows);
        static extern (C) бул   wxGridTableBase_AppendRows(IntPtr сам, цел numRows);
        static extern (C) бул   wxGridTableBase_DeleteRows(IntPtr сам, цел поз, цел numRows);
        static extern (C) бул   wxGridTableBase_InsertCols(IntPtr сам, цел поз, цел numCols);
        static extern (C) бул   wxGridTableBase_AppendCols(IntPtr сам, цел numCols);
        static extern (C) бул   wxGridTableBase_DeleteCols(IntPtr сам, цел поз, цел numCols);
        static extern (C) IntPtr wxGridTableBase_GetRowLabelValue(IntPtr сам, цел row);
        static extern (C) IntPtr wxGridTableBase_GetColLabelValue(IntPtr сам, цел col);
        static extern (C) проц   wxGridTableBase_SetRowLabelValue(IntPtr сам, цел row, ткст val);
        static extern (C) проц   wxGridTableBase_SetColLabelValue(IntPtr сам, цел col, ткст val);
        static extern (C) проц   wxGridTableBase_SetAttrProvider(IntPtr сам, IntPtr attrProvider);
        static extern (C) IntPtr wxGridTableBase_GetAttrProvider(IntPtr сам);
        static extern (C) бул   wxGridTableBase_CanHaveAttributes(IntPtr сам);
        static extern (C) IntPtr wxGridTableBase_GetAttr(IntPtr сам, цел row, цел col, цел kind);
        static extern (C) проц   wxGridTableBase_SetAttr(IntPtr сам, IntPtr attr, цел row, цел col);
        static extern (C) проц   wxGridTableBase_SetRowAttr(IntPtr сам, IntPtr attr, цел row);
        static extern (C) проц   wxGridTableBase_SetColAttr(IntPtr сам, IntPtr attr, цел col);
        //! \endcond
        
        //-----------------------------------------------------------------------------
    
    public abstract class GridTableBase : wxObject//ClientData 
    {
        public this();        
        public this(IntPtr wxobj);
        //public static wxObject Нов(IntPtr ptr) ;
        static extern (C) private цел staticGetNumberRows(GridTableBase объ);
        public abstract цел GetNumberRows();
        static extern (C) private цел staticGetNumberCols(GridTableBase объ);
        public abstract цел GetNumberCols();
        static extern (C) private бул staticIsEmptyCell(GridTableBase объ, цел row, цел col);
        public abstract бул IsEmptyCell(цел row, цел col);
        static extern (C) private ткст staticGetValue(GridTableBase объ, цел row, цел col);
        public abstract ткст GetValue(цел row, цел col);
        static extern (C) private проц staticDoУстValue(GridTableBase объ, цел row, цел col, IntPtr val);
        public abstract проц УстValue(цел row, цел col, ткст val);
        static extern (C) private ткст staticGetTypeName(GridTableBase объ, цел row, цел col);
        public  ткст GetTypeName(цел row, цел col);
        static extern (C) private бул staticDoCanGetValueAs(GridTableBase объ, цел row, цел col, IntPtr typeName);
        public  бул CanGetValueAs(цел row, цел col, ткст typeName);
        static extern (C) private бул staticDoCanУстValueAs(GridTableBase объ, цел row, цел col, IntPtr typeName);
        public  бул CanУстValueAs(цел row, цел col, ткст typeName);
        static extern (C) private цел staticGetValueAsLong(GridTableBase объ, цел row, цел col);
        public  цел GetValueAsLong(цел row, цел col);
        static extern (C) private double staticGetValueAsDouble(GridTableBase объ, цел row, цел col);
        public  double GetValueAsDouble(цел row, цел col);
        static extern (C) private бул staticGetValueAsBool(GridTableBase объ, цел row, цел col);
        public  бул GetValueAsBool(цел row, цел col);
        static extern (C) private проц staticУстValueAsLong(GridTableBase объ, цел row, цел col, цел val);
        public  проц УстValueAsLong(цел row, цел col, цел val);
        static extern (C) private проц staticУстValueAsDouble(GridTableBase объ, цел row, цел col, double val);
        public  проц УстValueAsDouble(цел row, цел col, double val);
        static extern (C) private проц staticУстValueAsBool(GridTableBase объ, цел row, цел col, бул val);
        public  проц УстValueAsBool(цел row, цел col, бул val);
        static extern (C) private IntPtr staticDoGetValueAsCustom(GridTableBase объ, цел row, цел col, IntPtr typeName);
        public  wxObject GetValueAsCustom(цел row, цел col, ткст typeName);
        static extern (C) private проц staticDoУстValueAsCustom(GridTableBase объ, цел row, цел col, IntPtr typeName, IntPtr val);
        public  проц УстValueAsCustom(цел row, цел col, ткст typeName, wxObject val);
        static extern (C) private проц staticDoУстView(GridTableBase объ, IntPtr grid);
        public  проц УстView(Grid grid);
        static extern (C) private IntPtr staticDoGetView(GridTableBase объ);
        public  Grid GetView();
        static extern (C) private проц staticClear(GridTableBase объ);
        public  проц Clear();
        static extern (C) private бул staticInsertRows(GridTableBase объ, цел поз, цел numRows);
        public  бул InsertRows(цел поз, цел numRows);
        static extern (C) private бул staticAppendRows(GridTableBase объ, цел numRows);
        public  бул AppendRows(цел numRows);
        static extern (C) private бул staticDeleteRows(GridTableBase объ, цел поз, цел numRows);
        public  бул DeleteRows(цел поз, цел numRows);
        static extern (C) private бул staticInsertCols(GridTableBase объ, цел поз, цел numCols);
        public  бул InsertCols(цел поз, цел numCols);
        static extern (C) private бул staticAppendCols(GridTableBase объ, цел numCols);
        public  бул AppendCols(цел numCols);
        static extern (C) private бул staticDeleteCols(GridTableBase объ, цел поз, цел numCols);
        public  бул DeleteCols(цел поз, цел numCols);
        static extern (C) private ткст staticGetRowLabelValue(GridTableBase объ, цел row);
        public  ткст GetRowLabelValue(цел row);
        static extern (C) private ткст staticGetColLabelValue(GridTableBase объ, цел col);
        public  ткст GetColLabelValue(цел col);
        static extern (C) private проц staticDoУстRowLabelValue(GridTableBase объ, цел row, IntPtr val);
        public  проц УстRowLabelValue(цел row, ткст val);
        static extern (C) private проц staticDoУстColLabelValue(GridTableBase объ, цел col, IntPtr val);
        public  проц УстColLabelValue(цел col, ткст val);
        static extern (C) private проц staticDoУстAttrProvider(GridTableBase объ, IntPtr attrProvider);
        public проц УстAttrProvider(GridCellAttrProvider attrProvider);
        static extern (C) private IntPtr staticDoGetAttrProvider(GridTableBase объ);
        public GridCellAttrProvider GetAttrProvider();
        static extern (C) private бул staticCanHaveAttributes(GridTableBase объ);
        public  бул CanHaveAttributes();
        static extern (C) private IntPtr staticDoGetAttr(GridTableBase объ, цел row, цел col, цел kind);
        public  GridCellAttr ДайАтр(цел row, цел col, GridCellAttr.AttrKind kind);
        static extern (C) private проц staticDoУстAttr(GridTableBase объ, IntPtr attr, цел row, цел col);
        public  проц УстАтр(GridCellAttr attr, цел row, цел col);
        static extern (C) private проц staticDoУстRowAttr(GridTableBase объ, IntPtr attr, цел row);
        public  проц УстRowAttr(GridCellAttr attr, цел row);
        static extern (C) private проц staticDoУстColAttr(GridTableBase объ, IntPtr attr, цел col);
        public  проц УстColAttr(GridCellAttr attr, цел col);
    }
    
	extern (C) {
        alias IntPtr function(GridCellAttrProvider объ, цел row, цел col, цел kind) Virtual_GetAttr;
        alias проц function(GridCellAttrProvider объ, IntPtr attr, цел row, цел col) Virtual_SetAttr;
        alias проц function(GridCellAttrProvider объ, IntPtr attr, цел row) Virtual_SetRowAttr;
	}

        //! \cond EXTERN
        static extern (C) IntPtr wxGridCellAttrProvider_ctor();
	static extern (C) проц wxGridCellAttrProvider_dtor(IntPtr сам);
        static extern (C) проц wxGridCellAttrProvider_RegisterVirtual(IntPtr сам,GridCellAttrProvider объ, 
            Virtual_GetAttr getAttr,
            Virtual_SetAttr setAttr,
            Virtual_SetRowAttr setRowAttr,
            Virtual_SetRowAttr setColAttr);
	static extern (C) проц wxGridCellAttrProvider_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) IntPtr wxGridCellAttrProvider_GetAttr(IntPtr сам, цел row, цел col, цел kind);
        static extern (C) проц wxGridCellAttrProvider_SetAttr(IntPtr сам, IntPtr attr, цел row, цел col); 
        static extern (C) проц wxGridCellAttrProvider_SetRowAttr(IntPtr сам, IntPtr attr, цел row); 
        static extern (C) проц wxGridCellAttrProvider_SetColAttr(IntPtr сам, IntPtr attr, цел col); 
        static extern (C) проц wxGridCellAttrProvider_UpdateAttrRows(IntPtr сам, цел поз, цел numRows);
        static extern (C) проц wxGridCellAttrProvider_UpdateAttrCols(IntPtr сам, цел поз, цел numCols);
        //! \endcond
	
        //-----------------------------------------------------------------------------
        
    alias GridCellAttrProvider wxGridCellAttrProvider;
    public class GridCellAttrProvider : wxObject  // ClientData
    {
        public this(IntPtr wxobj);	
	    private this(IntPtr wxobj, бул memOwn);        
        public this();
	    public static wxObject Нов(IntPtr ptr);
	    override protected проц dtor();
        static extern (C) private IntPtr staticDoGetAttr(GridCellAttrProvider объ, цел row, цел col, цел kind);
        public  GridCellAttr ДайАтр(цел row, цел col, GridCellAttr.AttrKind kind);
        static extern (C) private проц staticDoУстAttr(GridCellAttrProvider объ, IntPtr attr, цел row, цел col);
        public  проц УстАтр(GridCellAttr attr, цел row, цел col);
        static extern (C) private проц staticDoУстRowAttr(GridCellAttrProvider объ, IntPtr attr, цел row);
        public  проц УстRowAttr(GridCellAttr attr, цел row);
        static extern (C) private проц staticDoУстColAttr(GridCellAttrProvider объ, IntPtr attr, цел col);
        public  проц УстColAttr(GridCellAttr attr, цел col);
        public проц UpdateAttrRows(цел поз, цел numRows);
        public проц UpdateAttrCols(цел поз, цел numCols);
    }
