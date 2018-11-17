module wx.aui.FrameManager;

public import wx.wx;
public import wx.MiniFrame;
public import wx.Image;
public import wx.Event;
public import wx.EvtHandler;

public import wx.aui.DockArt;

enum wxFrameManagerDock
{
    wxAUI_DOCK_NONE = 0,
    wxAUI_DOCK_TOP = 1,
    wxAUI_DOCK_RIGHT = 2,
    wxAUI_DOCK_BOTTOM = 3,
    wxAUI_DOCK_LEFT = 4,
    wxAUI_DOCK_CENTER = 5,
    wxAUI_DOCK_CENTRE = wxAUI_DOCK_CENTER
};

enum wxFrameManagerOption
{
    wxAUI_MGR_ALLOW_FLOATING        = 1 << 0,
    wxAUI_MGR_ALLOW_ACTIVE_PANE     = 1 << 1,
    wxAUI_MGR_TRANSPARENT_DRAG      = 1 << 2,
    wxAUI_MGR_TRANSPARENT_HINT      = 1 << 3,
    wxAUI_MGR_TRANSPARENT_HINT_FADE = 1 << 4,

    wxAUI_MGR_DEFAULT = wxAUI_MGR_ALLOW_FLOATING |
                        wxAUI_MGR_TRANSPARENT_HINT |
                        wxAUI_MGR_TRANSPARENT_HINT_FADE
};

enum wxPaneDockArtУстting
{
    wxAUI_ART_SASH_SIZE = 0,
    wxAUI_ART_CAPTION_SIZE = 1,
    wxAUI_ART_GRIPPER_SIZE = 2,
    wxAUI_ART_PANE_BORDER_SIZE = 3,
    wxAUI_ART_PANE_BUTTON_SIZE = 4,
    wxAUI_ART_BACKGROUND_COLOUR = 5,
    wxAUI_ART_SASH_COLOUR = 6,
    wxAUI_ART_ACTIVE_CAPTION_COLOUR = 7,
    wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR = 8,
    wxAUI_ART_INACTIVE_CAPTION_COLOUR = 9,
    wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR = 10,
    wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR = 11,
    wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR = 12,
    wxAUI_ART_BORDER_COLOUR = 13,
    wxAUI_ART_GRIPPER_COLOUR = 14,
    wxAUI_ART_CAPTION_FONT = 15,
    wxAUI_ART_GRADIENT_TYPE = 16
};

enum wxPaneDockArtGradients
{
    wxAUI_GRADIENT_NONE = 0,
    wxAUI_GRADIENT_VERTICAL = 1,
    wxAUI_GRADIENT_HORIZONTAL = 2
};

enum wxPaneButtonState
{
    wxAUI_BUTTON_STATE_NORMAL = 0,
    wxAUI_BUTTON_STATE_HOVER = 1,
    wxAUI_BUTTON_STATE_PRESSED = 2
};

enum wxPaneInsertLevel
{
    wxAUI_INSERT_PANE = 0,
    wxAUI_INSERT_ROW = 1,
    wxAUI_INSERT_DOCK = 2
};

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) IntPtr wxPaneInfo_ctor();
static extern (C) проц wxPaneInfo_Copy(IntPtr сам, IntPtr c);
static extern (C) бул wxPaneInfo_IsOk(IntPtr сам);
static extern (C) бул wxPaneInfo_IsFixed(IntPtr сам);
static extern (C) бул wxPaneInfo_IsResizable(IntPtr сам);
static extern (C) бул wxPaneInfo_IsShown(IntPtr сам);
static extern (C) бул wxPaneInfo_IsFloating(IntPtr сам);
static extern (C) бул wxPaneInfo_IsDocked(IntPtr сам);
static extern (C) бул wxPaneInfo_IsToolbar(IntPtr сам);
static extern (C) бул wxPaneInfo_IsTopDockable(IntPtr сам);
static extern (C) бул wxPaneInfo_IsBottomDockable(IntPtr сам);
static extern (C) бул wxPaneInfo_IsLeftDockable(IntPtr сам);
static extern (C) бул wxPaneInfo_IsRightDockable(IntPtr сам);
static extern (C) бул wxPaneInfo_IsFloatable(IntPtr сам);
static extern (C) бул wxPaneInfo_IsMovable(IntPtr сам);
static extern (C) бул wxPaneInfo_HasCaption(IntPtr сам);
static extern (C) бул wxPaneInfo_HasGripper(IntPtr сам);
static extern (C) бул wxPaneInfo_HasBorder(IntPtr сам);
static extern (C) бул wxPaneInfo_HasCloseButton(IntPtr сам);
static extern (C) бул wxPaneInfo_HasMaximizeButton(IntPtr сам);
static extern (C) бул wxPaneInfo_HasMinimizeButton(IntPtr сам);
static extern (C) бул wxPaneInfo_HasPinButton(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Window(IntPtr сам, IntPtr w);
static extern (C) IntPtr wxPaneInfo_Name(IntPtr сам, char[] n);
static extern (C) IntPtr wxPaneInfo_Caption(IntPtr сам, char[] c);
static extern (C) IntPtr wxPaneInfo_Left(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Right(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Top(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Bottom(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Center(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Centre(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Direction(IntPtr сам, цел направление);
static extern (C) IntPtr wxPaneInfo_Layer(IntPtr сам, цел layer);
static extern (C) IntPtr wxPaneInfo_Row(IntPtr сам, цел row);
static extern (C) IntPtr wxPaneInfo_Position(IntPtr сам, цел поз);
static extern (C) IntPtr wxPaneInfo_BestSize(IntPtr сам, inout Размер разм);
static extern (C) IntPtr wxPaneInfo_MinSize(IntPtr сам, inout Размер разм);
static extern (C) IntPtr wxPaneInfo_MaxSize(IntPtr сам, inout Размер разм);
static extern (C) IntPtr wxPaneInfo_BestSizeXY(IntPtr сам, цел x, цел y);
static extern (C) IntPtr wxPaneInfo_MinSizeXY(IntPtr сам, цел x, цел y);
static extern (C) IntPtr wxPaneInfo_MaxSizeXY(IntPtr сам, цел x, цел y);
static extern (C) IntPtr wxPaneInfo_FloatingPosition(IntPtr сам, inout Точка поз);
static extern (C) IntPtr wxPaneInfo_FloatingPositionXY(IntPtr сам, цел x, цел y);
static extern (C) IntPtr wxPaneInfo_FloatingSize(IntPtr сам, inout Размер разм);
static extern (C) IntPtr wxPaneInfo_FloatingSizeXY(IntPtr сам, цел x, цел y);
static extern (C) IntPtr wxPaneInfo_Fixed(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Resizable(IntPtr сам, бул resizable = да);
static extern (C) IntPtr wxPaneInfo_Dock(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Float(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Hide(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_Show(IntPtr сам, бул покажи = да);
static extern (C) IntPtr wxPaneInfo_CaptionVisible(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_PaneBorder(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_Gripper(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_CloseButton(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_MaximizeButton(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_MinimizeButton(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_PinButton(IntPtr сам, бул visible = да);
static extern (C) IntPtr wxPaneInfo_DestroyOnClose(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_TopDockable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_BottomDockable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_LeftDockable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_RightDockable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_Floatable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_Movable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_Dockable(IntPtr сам, бул b = да);
static extern (C) IntPtr wxPaneInfo_DefaultPane(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_CentrePane(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_CenterPane(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_ToolbarPane(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_SetFlag(IntPtr сам, бцел флаг, бул option_state);
static extern (C) бул wxPaneInfo_HasFlag(IntPtr сам, бцел флаг);
static extern (C) char[] wxPaneInfo_GetName(IntPtr сам);
static extern (C) char[] wxPaneInfo_GetCaption(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_GetWindow(IntPtr сам);
static extern (C) IntPtr wxPaneInfo_GetFrame(IntPtr сам);
static extern (C) бцел wxPaneInfo_GetState(IntPtr сам);
static extern (C) цел wxPaneInfo_GetDock_Direction(IntPtr сам);
static extern (C) цел wxPaneInfo_GetDock_Layer(IntPtr сам);
static extern (C) цел wxPaneInfo_GetDock_Row(IntPtr сам);
static extern (C) цел wxPaneInfo_GetDock_Pos(IntPtr сам);
static extern (C) проц wxPaneInfo_GetBest_Size(IntPtr сам, out Размер разм);
static extern (C) проц wxPaneInfo_GetMin_Size(IntPtr сам, out Размер разм);
static extern (C) проц wxPaneInfo_GetMax_Size(IntPtr сам, out Размер разм);
static extern (C) проц wxPaneInfo_GetFloating_Pos(IntPtr сам, out Точка Точка);
static extern (C) проц wxPaneInfo_GetFloating_Size(IntPtr сам, out Размер разм);
static extern (C) цел wxPaneInfo_GetDock_Proportion(IntPtr сам);
static extern (C) проц wxPaneInfo_GetRect(IntPtr сам, out Прямоугольник прям);
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) IntPtr wxFrameManager_ctor(IntPtr frame = null, бцел флаги = wxFrameManagerOption.wxAUI_MGR_DEFAULT);
static extern (C) проц wxFrameManager_dtor(IntPtr сам);
static extern (C) проц wxFrameManager_UnInit(IntPtr сам);
static extern (C) проц wxFrameManager_SetФлаги(IntPtr сам, бцел флаги);
static extern (C) бцел wxFrameManager_GetFlags(IntPtr сам);
static extern (C) проц wxFrameManager_SetFrame(IntPtr сам, IntPtr frame);
static extern (C) IntPtr wxFrameManager_GetFrame(IntPtr сам);
static extern (C) проц wxFrameManager_SetArtProvider(IntPtr сам, IntPtr art_provider);
static extern (C) IntPtr wxFrameManager_GetArtProvider(IntPtr сам);
static extern (C) IntPtr wxFrameManager_GetPaneByWindow(IntPtr сам, IntPtr окно);
static extern (C) IntPtr wxFrameManager_GetPaneByName(IntPtr сам, char[] имя);
static extern (C) цел wxFrameManager_GetPaneCount(IntPtr сам);
static extern (C) IntPtr wxFrameManager_GetPane(IntPtr сам, цел index);
static extern (C) бул wxFrameManager_AddPane(IntPtr сам, IntPtr окно, IntPtr pane_info);
static extern (C) бул wxFrameManager_AddPane2(IntPtr сам, IntPtr окно, цел направление, ткст caption);
static extern (C) бул wxFrameManager_InsertPane(IntPtr сам, IntPtr окно, IntPtr pane_info, цел insert_level = wxPaneInsertLevel.wxAUI_INSERT_PANE);
static extern (C) бул wxFrameManager_DetachPane(IntPtr сам, IntPtr окно);
static extern (C) char[] wxFrameManager_SavePerspective(IntPtr сам);
static extern (C) бул wxFrameManager_LoadPerspective(IntPtr сам, char[] perspective, бул update = да);
static extern (C) проц wxFrameManager_Update(IntPtr сам);

static extern (C) EventType wxEvent_EVT_AUI_PANEBUTTON();
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) проц wxFrameManagerEvent_SetPane(IntPtr сам, IntPtr p);
static extern (C) IntPtr wxFrameManagerEvent_GetPane(IntPtr сам);
static extern (C) проц wxFrameManagerEvent_SetButton(IntPtr сам, цел b);
static extern (C) цел wxFrameManagerEvent_GetButton(IntPtr сам);
static extern (C) IntPtr wxFrameManagerEvent_Clone(IntPtr сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PaneInfo wxPaneInfo;
public class PaneInfo : wxObject
{
    public this(IntPtr wxobj);
    public this();
    public this(PaneInfo c);

    public бул Ок();
    public бул IsFixed();
    public бул IsResizable() ;
    public бул Виден();
    public бул IsFloating();
    public бул IsDocked();
    public бул IsToolbar() ;
    public бул IsTopDockable() ;
    public бул IsBottomDockable();
    public бул IsLeftDockable() ;
    public бул IsRightDockable();
    public бул IsFloatable();
    public бул IsMovable();
    public бул HasCaption() ;
    public бул HasGripper() ;
    public бул ЕстьБордюр() ;
    public бул HasCloseButton() ;
    public бул HasMaximizeButton() ;
    public бул HasMinimizeButton() ;
    public бул HasPinButton() ;

    public PaneInfo Окно(wxWindow w) ;
    public PaneInfo Имя(char[] n) ;
    public PaneInfo Caption(char[] c);
    public PaneInfo Лево();
    public PaneInfo Право() ;
    public PaneInfo Верх();
    public PaneInfo Низ();
    public PaneInfo Центрируй();
    public PaneInfo Центр() ;
    public PaneInfo Direction(цел направление) ;
    public PaneInfo Layer(цел layer) ;
    public PaneInfo Row(цел row) ;
    public PaneInfo Позиция(цел поз);
    public PaneInfo ЛучшийРазмер(ref Размер разм);
    public PaneInfo МинРазм(ref Размер разм) ;
    public PaneInfo МаксРазм(ref Размер разм) ;
    public PaneInfo ЛучшийРазмер(цел x, цел y) ;
    public PaneInfo МинРазм(цел x, цел y);
    public PaneInfo МаксРазм(цел x, цел y) ;
    public PaneInfo FloatingPosition(ref Точка поз);
    public PaneInfo FloatingPosition(цел x, цел y) ;
    public PaneInfo FloatingSize(ref Размер разм);
    public PaneInfo FloatingSize(цел x, цел y);
    public PaneInfo Fixed();
    public PaneInfo Resizable(бул resizable = да) ;
    public PaneInfo Dock() ;
    public PaneInfo Float();
    public PaneInfo Спрячь();
    public PaneInfo Покажи(бул покажи = да) ;
    public PaneInfo CaptionVisible(бул visible = да) ;
    public PaneInfo PaneBorder(бул visible = да) ;
    public PaneInfo Gripper(бул visible = да);
    public PaneInfo CloseButton(бул visible = да);
    public PaneInfo MaximizeButton(бул visible = да) ;
    public PaneInfo MinimizeButton(бул visible = да);
    public PaneInfo PinButton(бул visible = да);
    public PaneInfo DestroyOnClose(бул b = да);
    public PaneInfo TopDockable(бул b = да);
    public PaneInfo BottomDockable(бул b = да);
    public PaneInfo LeftDockable(бул b = да);
    public PaneInfo RightDockable(бул b = да) ;
    public PaneInfo Floatable(бул b = да) ;
    public PaneInfo Movable(бул b = да) ;
    public PaneInfo Dockable(бул b = да) ;
    public PaneInfo DefaultPane() ;
    public PaneInfo CentrePane() ;
    public PaneInfo CenterPane() ;
    public PaneInfo ToolbarPane() ;
    public PaneInfo УстFlag(бцел флаг, бул option_state) ;
    public бул ЕстьФлаг(бцел флаг) ;

    public char[] имя();
    public char[] caption() ;

    public wxWindow окно();
    public wxWindow frame();
    public бцел state() ;

    public цел dock_direction() ;
    public цел dock_layer() ;
    public цел dock_row();
    public цел dock_pos() ;

    public Размер best_size();
    public Размер min_size();
    public Размер max_size();

    public Точка floating_pos();
    public Размер floating_size();
    public цел dock_proportion() ;

    public Прямоугольник прям();

    public enum wxPaneState
    {
      optionFloating        = 1 << 0,
      optionHidden          = 1 << 1,
      optionLeftDockable    = 1 << 2,
      optionRightDockable   = 1 << 3,
      optionTopDockable     = 1 << 4,
      optionBottomDockable  = 1 << 5,
      optionFloatable       = 1 << 6,
      optionMovable         = 1 << 7,
      optionResizable       = 1 << 8,
      optionPaneBorder      = 1 << 9,
      optionCaption         = 1 << 10,
      optionGripper         = 1 << 11,
      optionDestroyOnClose  = 1 << 12,
      optionToolbar         = 1 << 13,
      optionActive          = 1 << 14,

      buttonClose           = 1 << 24,
      buttonMaximize        = 1 << 25,
      buttonMinimize        = 1 << 26,
      buttonPin             = 1 << 27,
      buttonCustom1         = 1 << 28,
      buttonCustom2         = 1 << 29,
      buttonCustom3         = 1 << 30,
      actionPane            = 1 << 31  // used internally
    }
}



alias FrameManager wxFrameManager;
public class FrameManager : ОбработчикСоб
{
    public this(IntPtr wxobj);
    public this(Frame frame = null, бцел флаги = wxFrameManagerOption.wxAUI_MGR_DEFAULT);
    public проц UnInit();
    public проц УстФлаги(бцел флаги);
    public бцел GetФлаги();
    public проц УстFrame(Frame frame) ;
    public Frame GetFrame();
    public проц УстArtProvider(DockArt art_provider) ;
    public DockArt GetArtProvider();
    public PaneInfo GetPane(Окно окно);
    public PaneInfo GetPane(char[] имя);
    public цел GetPaneCount();
    public PaneInfo GetPane(цел index);
    public бул AddPane(Окно окно, PaneInfo pane_info);
    public бул AddPane(Окно окно,
                 цел направление = Direction.wxLEFT,
                 ткст caption = "");
    public бул InsertPane(Окно окно,
                 PaneInfo pane_info,
                 цел insert_level = wxPaneInsertLevel.wxAUI_INSERT_PANE);
    public бул DetachPane(Окно окно);
    public char[] SavePerspective() ;
    public бул LoadPerspective(char[] perspective,
                 бул update = да);
    public проц Обнови() ;

// wx event machinery

// right now the only event that works is wxEVT_AUI_PANEBUTTON. A full
// spectrum of events will be implemented in the next incremental version

    public static EventType wxEVT_AUI_PANEBUTTON;

    static this();
    public проц EVT_AUI_PANEBUTTON(ДатчикСобытий lsnr);
}

// event declarations/classes
alias FrameManagerEvent wxFrameManagerEvent;
public class FrameManagerEvent : Событие
{
    public this(IntPtr wxobj);
    public Событие Clone();
    public проц УстPane(PaneInfo p);
    public проц УстButton(цел b) ;
    public PaneInfo GetPane();
    public цел GetButton() ;
}


