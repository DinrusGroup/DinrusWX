//-----------------------------------------------------------------------------
// wxD - FrameManager.d
// (C) 2006 David Gileadi
//
/// The wxAUI wrapper class.
//
// Written by David Gileadi <gileadis@gmail.com>
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FrameManager.d,v 1.2 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

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

enum wxPaneDockArtSetting
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
static extern (C) ЦУк wxPaneInfo_ctor();
static extern (C) проц wxPaneInfo_Copy(ЦУк сам, ЦУк c);
static extern (C) бул wxPaneInfo_IsOk(ЦУк сам);
static extern (C) бул wxPaneInfo_IsFixed(ЦУк сам);
static extern (C) бул wxPaneInfo_IsResizable(ЦУк сам);
static extern (C) бул wxPaneInfo_IsShown(ЦУк сам);
static extern (C) бул wxPaneInfo_IsFloating(ЦУк сам);
static extern (C) бул wxPaneInfo_IsDocked(ЦУк сам);
static extern (C) бул wxPaneInfo_IsToolbar(ЦУк сам);
static extern (C) бул wxPaneInfo_IsTopDockable(ЦУк сам);
static extern (C) бул wxPaneInfo_IsBottomDockable(ЦУк сам);
static extern (C) бул wxPaneInfo_IsLeftDockable(ЦУк сам);
static extern (C) бул wxPaneInfo_IsRightDockable(ЦУк сам);
static extern (C) бул wxPaneInfo_IsFloatable(ЦУк сам);
static extern (C) бул wxPaneInfo_IsMovable(ЦУк сам);
static extern (C) бул wxPaneInfo_HasCaption(ЦУк сам);
static extern (C) бул wxPaneInfo_HasGripper(ЦУк сам);
static extern (C) бул wxPaneInfo_HasBorder(ЦУк сам);
static extern (C) бул wxPaneInfo_HasCloseButton(ЦУк сам);
static extern (C) бул wxPaneInfo_HasMaximizeButton(ЦУк сам);
static extern (C) бул wxPaneInfo_HasMinimizeButton(ЦУк сам);
static extern (C) бул wxPaneInfo_HasPinButton(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Window(ЦУк сам, ЦУк w);
static extern (C) ЦУк wxPaneInfo_Name(ЦУк сам, сим[] n);
static extern (C) ЦУк wxPaneInfo_Caption(ЦУк сам, сим[] c);
static extern (C) ЦУк wxPaneInfo_Left(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Right(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Top(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Bottom(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Center(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Centre(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Direction(ЦУк сам, цел direction);
static extern (C) ЦУк wxPaneInfo_Layer(ЦУк сам, цел layer);
static extern (C) ЦУк wxPaneInfo_Row(ЦУк сам, цел row);
static extern (C) ЦУк wxPaneInfo_Position(ЦУк сам, цел поз);
static extern (C) ЦУк wxPaneInfo_BestSize(ЦУк сам, inout Размер size);
static extern (C) ЦУк wxPaneInfo_MinSize(ЦУк сам, inout Размер size);
static extern (C) ЦУк wxPaneInfo_MaxSize(ЦУк сам, inout Размер size);
static extern (C) ЦУк wxPaneInfo_BestSizeXY(ЦУк сам, цел x, цел y);
static extern (C) ЦУк wxPaneInfo_MinSizeXY(ЦУк сам, цел x, цел y);
static extern (C) ЦУк wxPaneInfo_MaxSizeXY(ЦУк сам, цел x, цел y);
static extern (C) ЦУк wxPaneInfo_FloatingPosition(ЦУк сам, inout Точка поз);
static extern (C) ЦУк wxPaneInfo_FloatingPositionXY(ЦУк сам, цел x, цел y);
static extern (C) ЦУк wxPaneInfo_FloatingSize(ЦУк сам, inout Размер size);
static extern (C) ЦУк wxPaneInfo_FloatingSizeXY(ЦУк сам, цел x, цел y);
static extern (C) ЦУк wxPaneInfo_Fixed(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Resizable(ЦУк сам, бул resizable = да);
static extern (C) ЦУк wxPaneInfo_Dock(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Float(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Hide(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_Show(ЦУк сам, бул show = да);
static extern (C) ЦУк wxPaneInfo_CaptionVisible(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_PaneBorder(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_Gripper(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_CloseButton(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_MaximizeButton(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_MinimizeButton(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_PinButton(ЦУк сам, бул visible = да);
static extern (C) ЦУк wxPaneInfo_DestroyOnClose(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_TopDockable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_BottomDockable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_LeftDockable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_RightDockable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_Floatable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_Movable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_Dockable(ЦУк сам, бул с = да);
static extern (C) ЦУк wxPaneInfo_DefaultPane(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_CentrePane(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_CenterPane(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_ToolbarPane(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_SetFlag(ЦУк сам, бцел flag, бул option_state);
static extern (C) бул wxPaneInfo_HasFlag(ЦУк сам, бцел flag);
static extern (C) сим[] wxPaneInfo_GetName(ЦУк сам);
static extern (C) сим[] wxPaneInfo_GetCaption(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_GetWindow(ЦУк сам);
static extern (C) ЦУк wxPaneInfo_GetFrame(ЦУк сам);
static extern (C) бцел wxPaneInfo_GetState(ЦУк сам);
static extern (C) цел wxPaneInfo_GetDock_Direction(ЦУк сам);
static extern (C) цел wxPaneInfo_GetDock_Layer(ЦУк сам);
static extern (C) цел wxPaneInfo_GetDock_Row(ЦУк сам);
static extern (C) цел wxPaneInfo_GetDock_Pos(ЦУк сам);
static extern (C) проц wxPaneInfo_GetBest_Size(ЦУк сам, out Размер size);
static extern (C) проц wxPaneInfo_GetMin_Size(ЦУк сам, out Размер size);
static extern (C) проц wxPaneInfo_GetMax_Size(ЦУк сам, out Размер size);
static extern (C) проц wxPaneInfo_GetFloating_Pos(ЦУк сам, out Точка point);
static extern (C) проц wxPaneInfo_GetFloating_Size(ЦУк сам, out Размер size);
static extern (C) цел wxPaneInfo_GetDock_Proportion(ЦУк сам);
static extern (C) проц wxPaneInfo_GetRect(ЦУк сам, out Прямоугольник прям);
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦУк wxFrameManager_ctor(ЦУк frame = пусто, бцел флаги = wxFrameManagerOption.wxAUI_MGR_DEFAULT);
static extern (C) проц wxFrameManager_dtor(ЦУк сам);
static extern (C) проц wxFrameManager_UnInit(ЦУк сам);
static extern (C) проц wxFrameManager_SetFlags(ЦУк сам, бцел флаги);
static extern (C) бцел wxFrameManager_GetFlags(ЦУк сам);
static extern (C) проц wxFrameManager_SetFrame(ЦУк сам, ЦУк frame);
static extern (C) ЦУк wxFrameManager_GetFrame(ЦУк сам);
static extern (C) проц wxFrameManager_SetArtProvider(ЦУк сам, ЦУк art_provider);
static extern (C) ЦУк wxFrameManager_GetArtProvider(ЦУк сам);
static extern (C) ЦУк wxFrameManager_GetPaneByWindow(ЦУк сам, ЦУк окно);
static extern (C) ЦУк wxFrameManager_GetPaneByName(ЦУк сам, сим[] имя);
static extern (C) цел wxFrameManager_GetPaneCount(ЦУк сам);
static extern (C) ЦУк wxFrameManager_GetPane(ЦУк сам, цел индекс);
static extern (C) бул wxFrameManager_AddPane(ЦУк сам, ЦУк окно, ЦУк pane_info);
static extern (C) бул wxFrameManager_AddPane2(ЦУк сам, ЦУк окно, цел direction, ткст caption);
static extern (C) бул wxFrameManager_InsertPane(ЦУк сам, ЦУк окно, ЦУк pane_info, цел insert_level = wxPaneInsertLevel.wxAUI_INSERT_PANE);
static extern (C) бул wxFrameManager_DetachPane(ЦУк сам, ЦУк окно);
static extern (C) сим[] wxFrameManager_SavePerspective(ЦУк сам);
static extern (C) бул wxFrameManager_LoadPerspective(ЦУк сам, сим[] perspective, бул update = да);
static extern (C) проц wxFrameManager_Update(ЦУк сам);

static extern (C) ТипСобытия wxEvent_EVT_AUI_PANEBUTTON();
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) проц wxFrameManagerEvent_SetPane(ЦУк сам, ЦУк p);
static extern (C) ЦУк wxFrameManagerEvent_GetPane(ЦУк сам);
static extern (C) проц wxFrameManagerEvent_SetButton(ЦУк сам, цел с);
static extern (C) цел wxFrameManagerEvent_GetButton(ЦУк сам);
static extern (C) ЦУк wxFrameManagerEvent_Clone(ЦУк сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PaneInfo wxPaneInfo;
public class PaneInfo : wxObject
{
    public this(ЦУк шхобъ)
    {
      super(шхобъ);
    }

    public this()
    {
      this(wxPaneInfo_ctor());
    }

    public this(PaneInfo c)
    {
        this();
        wxPaneInfo_Copy(шхобъ, c.шхобъ);
    }

    public бул IsOk() { return wxPaneInfo_IsOk(шхобъ); }
    public бул IsFixed() { return wxPaneInfo_IsFixed(шхобъ); }
    public бул IsResizable() { return wxPaneInfo_IsResizable(шхобъ); }
    public бул IsShown() { return wxPaneInfo_IsShown(шхобъ); }
    public бул IsFloating() { return wxPaneInfo_IsFloating(шхобъ); }
    public бул IsDocked() { return wxPaneInfo_IsDocked(шхобъ); }
    public бул IsToolbar() { return wxPaneInfo_IsToolbar(шхобъ); }
    public бул IsTopDockable() { return wxPaneInfo_IsTopDockable(шхобъ); }
    public бул IsBottomDockable() { return wxPaneInfo_IsBottomDockable(шхобъ); }
    public бул IsLeftDockable() { return wxPaneInfo_IsLeftDockable(шхобъ); }
    public бул IsRightDockable() { return wxPaneInfo_IsRightDockable(шхобъ); }
    public бул IsFloatable() { return wxPaneInfo_IsFloatable(шхобъ); }
    public бул IsMovable() { return wxPaneInfo_IsMovable(шхобъ); }
    public бул HasCaption() { return wxPaneInfo_HasCaption(шхобъ); }
    public бул HasGripper() { return wxPaneInfo_HasGripper(шхобъ); }
    public бул HasBorder() { return wxPaneInfo_HasBorder(шхобъ); }
    public бул HasCloseButton() { return wxPaneInfo_HasCloseButton(шхобъ); }
    public бул HasMaximizeButton() { return wxPaneInfo_HasMaximizeButton(шхобъ); }
    public бул HasMinimizeButton() { return wxPaneInfo_HasMinimizeButton(шхобъ); }
    public бул HasPinButton() { return wxPaneInfo_HasPinButton(шхобъ); }

    public PaneInfo Окно(wxWindow w) { return cast(PaneInfo) FindObject(wxPaneInfo_Window(шхобъ, wxObject.SafePtr(w))); }
    public PaneInfo Имя(сим[] n) { return cast(PaneInfo) FindObject(wxPaneInfo_Name(шхобъ, n)); }
    public PaneInfo Caption(сим[] c) { return cast(PaneInfo) FindObject(wxPaneInfo_Caption(шхобъ, c)); }
    public PaneInfo Left() { return cast(PaneInfo) FindObject(wxPaneInfo_Left(шхобъ)); }
    public PaneInfo Right() { return cast(PaneInfo) FindObject(wxPaneInfo_Right(шхобъ)); }
    public PaneInfo Top() { return cast(PaneInfo) FindObject(wxPaneInfo_Top(шхобъ)); }
    public PaneInfo Bottom() { return cast(PaneInfo) FindObject(wxPaneInfo_Bottom(шхобъ)); }
    public PaneInfo Center() { return cast(PaneInfo) FindObject(wxPaneInfo_Center(шхобъ)); }
    public PaneInfo Centre() { return cast(PaneInfo) FindObject(wxPaneInfo_Centre(шхобъ)); }
    public PaneInfo Direction(цел direction) { return cast(PaneInfo) FindObject(wxPaneInfo_Direction(шхобъ, direction)); }
    public PaneInfo Layer(цел layer) { return cast(PaneInfo) FindObject(wxPaneInfo_Layer(шхобъ, layer)); }
    public PaneInfo Row(цел row) { return cast(PaneInfo) FindObject(wxPaneInfo_Row(шхобъ, row)); }
    public PaneInfo Положение(цел поз) { return cast(PaneInfo) FindObject(wxPaneInfo_Position(шхобъ, поз)); }
    public PaneInfo BestSize(ref Размер size) { return cast(PaneInfo) FindObject(wxPaneInfo_BestSize(шхобъ, size)); }
    public PaneInfo MinSize(ref Размер size) { return cast(PaneInfo) FindObject(wxPaneInfo_MinSize(шхобъ, size)); }
    public PaneInfo MaxSize(ref Размер size) { return cast(PaneInfo) FindObject(wxPaneInfo_MaxSize(шхобъ, size)); }
    public PaneInfo BestSize(цел x, цел y) { return cast(PaneInfo) FindObject(wxPaneInfo_BestSizeXY(шхобъ, x, y)); }
    public PaneInfo MinSize(цел x, цел y) { return cast(PaneInfo) FindObject(wxPaneInfo_MinSizeXY(шхобъ, x, y)); }
    public PaneInfo MaxSize(цел x, цел y) { return cast(PaneInfo) FindObject(wxPaneInfo_MaxSizeXY(шхобъ, x, y)); }
    public PaneInfo FloatingPosition(ref Точка поз) { return cast(PaneInfo) FindObject(wxPaneInfo_FloatingPosition(шхобъ, поз)); }
    public PaneInfo FloatingPosition(цел x, цел y) { return cast(PaneInfo) FindObject(wxPaneInfo_FloatingPositionXY(шхобъ, x, y)); }
    public PaneInfo FloatingSize(ref Размер size) { return cast(PaneInfo) FindObject(wxPaneInfo_FloatingSize(шхобъ, size)); }
    public PaneInfo FloatingSize(цел x, цел y) { return cast(PaneInfo) FindObject(wxPaneInfo_FloatingSizeXY(шхобъ, x, y)); }
    public PaneInfo Fixed() { return cast(PaneInfo) FindObject(wxPaneInfo_Fixed(шхобъ)); }
    public PaneInfo Resizable(бул resizable = да) { return cast(PaneInfo) FindObject(wxPaneInfo_Resizable(шхобъ, resizable)); }
    public PaneInfo Dock() { return cast(PaneInfo) FindObject(wxPaneInfo_Dock(шхобъ)); }
    public PaneInfo Float() { return cast(PaneInfo) FindObject(wxPaneInfo_Float(шхобъ)); }
    public PaneInfo Hide() { return cast(PaneInfo) FindObject(wxPaneInfo_Hide(шхобъ)); }
    public PaneInfo Show(бул show = да) { return cast(PaneInfo) FindObject(wxPaneInfo_Show(шхобъ, show)); }
    public PaneInfo CaptionVisible(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_CaptionVisible(шхобъ, visible)); }
    public PaneInfo PaneBorder(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_PaneBorder(шхобъ, visible)); }
    public PaneInfo Gripper(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_Gripper(шхобъ, visible)); }
    public PaneInfo CloseButton(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_CloseButton(шхобъ, visible)); }
    public PaneInfo MaximizeButton(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_MaximizeButton(шхобъ, visible)); }
    public PaneInfo MinimizeButton(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_MinimizeButton(шхобъ, visible)); }
    public PaneInfo PinButton(бул visible = да) { return cast(PaneInfo) FindObject(wxPaneInfo_PinButton(шхобъ, visible)); }
    public PaneInfo DestroyOnClose(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_DestroyOnClose(шхобъ, с)); }
    public PaneInfo TopDockable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_TopDockable(шхобъ, с)); }
    public PaneInfo BottomDockable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_BottomDockable(шхобъ, с)); }
    public PaneInfo LeftDockable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_LeftDockable(шхобъ, с)); }
    public PaneInfo RightDockable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_RightDockable(шхобъ, с)); }
    public PaneInfo Floatable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_Floatable(шхобъ, с)); }
    public PaneInfo Movable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_Movable(шхобъ, с)); }
    public PaneInfo Dockable(бул с = да) { return cast(PaneInfo) FindObject(wxPaneInfo_Dockable(шхобъ, с)); }
    public PaneInfo DefaultPane() { return cast(PaneInfo) FindObject(wxPaneInfo_DefaultPane(шхобъ)); }
    public PaneInfo CentrePane() { return cast(PaneInfo) FindObject(wxPaneInfo_CentrePane(шхобъ)); }
    public PaneInfo CenterPane() { return cast(PaneInfo) FindObject(wxPaneInfo_CenterPane(шхобъ)); }
    public PaneInfo ToolbarPane() { return cast(PaneInfo) FindObject(wxPaneInfo_ToolbarPane(шхобъ)); }
    public PaneInfo SetFlag(бцел flag, бул option_state) { return cast(PaneInfo) FindObject(wxPaneInfo_SetFlag(шхобъ, flag, option_state)); }
    public бул HasFlag(бцел flag) { return wxPaneInfo_HasFlag(шхобъ, flag); }

    public сим[] имя() { return wxPaneInfo_GetName(шхобъ); }
    public сим[] caption() { return wxPaneInfo_GetCaption(шхобъ); }

    public wxWindow окно()
    {
      ЦУк ptr = wxPaneInfo_GetWindow(шхобъ);
      wxObject o = FindObject(ptr);
      return (o)? cast(wxWindow)o : new wxWindow(ptr);
    }
    public wxWindow frame()
    {
      ЦУк ptr = wxPaneInfo_GetFrame(шхобъ);
      wxObject o = FindObject(ptr);
      return (o)? cast(wxWindow)o : new wxWindow(ptr);
    }
    public бцел state() { return wxPaneInfo_GetState(шхобъ); }

    public цел dock_direction() { return wxPaneInfo_GetDock_Direction(шхобъ); }
    public цел dock_layer() { return wxPaneInfo_GetDock_Layer(шхобъ); }
    public цел dock_row() { return wxPaneInfo_GetDock_Row(шхобъ); }
    public цел dock_pos() { return wxPaneInfo_GetDock_Pos(шхобъ); }

    public Размер best_size()
    {
      Размер size;
      wxPaneInfo_GetBest_Size(шхобъ, size);
      return size;
    }
    public Размер min_size()
    {
      Размер size;
      wxPaneInfo_GetMin_Size(шхобъ, size);
      return size;
    }
    public Размер max_size()
    {
      Размер size;
      wxPaneInfo_GetMax_Size(шхобъ, size);
      return size;
    }

    public Точка floating_pos()
    {
      Точка point;
      wxPaneInfo_GetFloating_Pos(шхобъ, point);
      return point;
    }
    public Размер floating_size()
    {
      Размер size;
      wxPaneInfo_GetFloating_Size(шхобъ, size);
      return size;
    }
    public цел dock_proportion() { return wxPaneInfo_GetDock_Proportion(шхобъ); }

    public Прямоугольник прям()
    {
      Прямоугольник прям;
      wxPaneInfo_GetRect(шхобъ, прям);
      return прям;
    }

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
public class FrameManager : EvtHandler
{
    public this(ЦУк шхобъ)
    {
      super(шхобъ);
    }

    public this(Фрейм frame = пусто, бцел флаги = wxFrameManagerOption.wxAUI_MGR_DEFAULT)
    {
      this(wxFrameManager_ctor(wxObject.SafePtr(frame), флаги));
    }

    public проц UnInit() { wxFrameManager_UnInit(шхобъ); }

    public проц SetFlags(бцел флаги) { wxFrameManager_SetFlags(шхобъ, флаги); }
    public бцел GetFlags() { return wxFrameManager_GetFlags(шхобъ); }

    public проц SetFrame(Фрейм frame) { wxFrameManager_SetFrame(шхобъ, wxObject.SafePtr(frame)); }
    public Фрейм GetFrame()
    {
      ЦУк ptr = wxFrameManager_GetFrame(шхобъ);
      wxObject o = FindObject(ptr);
      if (o) return cast(Фрейм)o;
      else return new Фрейм(ptr);
    }

    public проц SetArtProvider(DockArt art_provider) { wxFrameManager_SetArtProvider(шхобъ, wxObject.SafePtr(art_provider)); }
    public DockArt GetArtProvider()
    {
      ЦУк ptr = wxFrameManager_GetArtProvider(шхобъ);
      wxObject o = FindObject(ptr);
      if (o) return cast(DockArt)o;
      else return new DockArt(ptr);
    }

    public PaneInfo GetPane(Окно окно)
    {
      ЦУк ptr = wxFrameManager_GetPaneByWindow(шхобъ, wxObject.SafePtr(окно));
      wxObject o = FindObject(ptr);
      if (o) return cast(PaneInfo)o;
      else return new PaneInfo(ptr);
    }
    public PaneInfo GetPane(сим[] имя)
    {
      ЦУк ptr = wxFrameManager_GetPaneByName(шхобъ, имя);
      wxObject o = FindObject(ptr);
      if (o) return cast(PaneInfo)o;
      else return new PaneInfo(ptr);
    }
    public цел GetPaneCount() { return wxFrameManager_GetPaneCount(шхобъ); }
    public PaneInfo GetPane(цел индекс)
    {
      ЦУк ptr = wxFrameManager_GetPane(шхобъ, индекс);
      wxObject o = FindObject(ptr);
      if (o) return cast(PaneInfo)o;
      else return new PaneInfo(ptr);
    }

    public бул AddPane(Окно окно, PaneInfo pane_info)
    {
      return wxFrameManager_AddPane(шхобъ, wxObject.SafePtr(окно), wxObject.SafePtr(pane_info));
    }

    public бул AddPane(Окно окно,
                 цел direction = Direction.wxLEFT,
                 ткст caption = "")
    {
      return wxFrameManager_AddPane2(шхобъ, wxObject.SafePtr(окно), direction, caption);
    }

    public бул InsertPane(Окно окно,
                 PaneInfo pane_info,
                 цел insert_level = wxPaneInsertLevel.wxAUI_INSERT_PANE)
    {
      return wxFrameManager_InsertPane(шхобъ, wxObject.SafePtr(окно), wxObject.SafePtr(pane_info), insert_level);
    }

    public бул DetachPane(Окно окно)
    {
      return wxFrameManager_DetachPane(шхобъ, wxObject.SafePtr(окно));
    }

    public сим[] SavePerspective() { return wxFrameManager_SavePerspective(шхобъ); }

    public бул LoadPerspective(сим[] perspective,
                 бул update = да)
    {
      return wxFrameManager_LoadPerspective(шхобъ, perspective, update);
    }

    public проц Обнови() { return wxFrameManager_Update(шхобъ); }


// wx event machinery


// right now the only event that works is wxEVT_AUI_PANEBUTTON. A full
// spectrum of events will be implemented in the next incremental version

    public static ТипСобытия wxEVT_AUI_PANEBUTTON;

    static this()
    {
      wxEVT_AUI_PANEBUTTON = wxEvent_EVT_AUI_PANEBUTTON();
    }

    public проц EVT_AUI_PANEBUTTON(EventListener lsnr)
    {
      AddEventListener(wxEVT_AUI_PANEBUTTON, lsnr);
    }
}



// event declarations/classes
alias FrameManagerEvent wxFrameManagerEvent;
public class FrameManagerEvent : Событие
{
    public this(ЦУк шхобъ)
    {
      super(шхобъ);
    }

    public Событие Clone()
    {
      return new FrameManagerEvent(wxFrameManagerEvent_Clone(шхобъ));
    }

    public проц SetPane(PaneInfo p) { wxFrameManagerEvent_SetPane(шхобъ, wxObject.SafePtr(p)); }
    public проц SetButton(цел с) { wxFrameManagerEvent_SetButton(шхобъ, с); }
    public PaneInfo GetPane()
    {
      ЦУк ptr = wxFrameManagerEvent_GetPane(шхобъ);
      wxObject o = FindObject(ptr);
      if (o) return cast(PaneInfo)o;
      else return new PaneInfo(ptr);
    }
    public цел GetButton() { return wxFrameManagerEvent_GetButton(шхобъ); }
}


