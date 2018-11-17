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
static extern (C) ЦелУкз wxPaneInfo_ctor();
static extern (C) проц wxPaneInfo_Copy(ЦелУкз сам, ЦелУкз c);
static extern (C) бул wxPaneInfo_IsOk(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsFixed(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsResizable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsShown(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsFloating(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsDocked(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsToolbar(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsTopDockable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsBottomDockable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsLeftDockable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsRightDockable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsFloatable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_IsMovable(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasCaption(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasGripper(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasBorder(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasCloseButton(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasMaximizeButton(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasMinimizeButton(ЦелУкз сам);
static extern (C) бул wxPaneInfo_HasPinButton(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Window(ЦелУкз сам, ЦелУкз w);
static extern (C) ЦелУкз wxPaneInfo_Name(ЦелУкз сам, char[] n);
static extern (C) ЦелУкз wxPaneInfo_Caption(ЦелУкз сам, char[] c);
static extern (C) ЦелУкз wxPaneInfo_Left(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Right(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Top(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Bottom(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Center(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Centre(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Direction(ЦелУкз сам, цел направление);
static extern (C) ЦелУкз wxPaneInfo_Layer(ЦелУкз сам, цел layer);
static extern (C) ЦелУкз wxPaneInfo_Row(ЦелУкз сам, цел row);
static extern (C) ЦелУкз wxPaneInfo_Position(ЦелУкз сам, цел поз);
static extern (C) ЦелУкз wxPaneInfo_BestSize(ЦелУкз сам, inout Размер Размер);
static extern (C) ЦелУкз wxPaneInfo_MinSize(ЦелУкз сам, inout Размер Размер);
static extern (C) ЦелУкз wxPaneInfo_MaxSize(ЦелУкз сам, inout Размер Размер);
static extern (C) ЦелУкз wxPaneInfo_BestSizeXY(ЦелУкз сам, цел x, цел y);
static extern (C) ЦелУкз wxPaneInfo_MinSizeXY(ЦелУкз сам, цел x, цел y);
static extern (C) ЦелУкз wxPaneInfo_MaxSizeXY(ЦелУкз сам, цел x, цел y);
static extern (C) ЦелУкз wxPaneInfo_FloatingPosition(ЦелУкз сам, inout Точка поз);
static extern (C) ЦелУкз wxPaneInfo_FloatingPositionXY(ЦелУкз сам, цел x, цел y);
static extern (C) ЦелУкз wxPaneInfo_FloatingSize(ЦелУкз сам, inout Размер Размер);
static extern (C) ЦелУкз wxPaneInfo_FloatingSizeXY(ЦелУкз сам, цел x, цел y);
static extern (C) ЦелУкз wxPaneInfo_Fixed(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Resizable(ЦелУкз сам, бул resizable = да);
static extern (C) ЦелУкз wxPaneInfo_Dock(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Float(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Hide(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_Show(ЦелУкз сам, бул покажи = да);
static extern (C) ЦелУкз wxPaneInfo_CaptionVisible(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_PaneBorder(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_Gripper(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_CloseButton(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_MaximizeButton(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_MinimizeButton(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_PinButton(ЦелУкз сам, бул visible = да);
static extern (C) ЦелУкз wxPaneInfo_DestroyOnClose(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_TopDockable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_BottomDockable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_LeftDockable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_RightDockable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_Floatable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_Movable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_Dockable(ЦелУкз сам, бул b = да);
static extern (C) ЦелУкз wxPaneInfo_DefaultPane(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_CentrePane(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_CenterPane(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_ToolbarPane(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_SetFlag(ЦелУкз сам, бцел flag, бул option_state);
static extern (C) бул wxPaneInfo_HasFlag(ЦелУкз сам, бцел flag);
static extern (C) char[] wxPaneInfo_GetName(ЦелУкз сам);
static extern (C) char[] wxPaneInfo_GetCaption(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_GetWindow(ЦелУкз сам);
static extern (C) ЦелУкз wxPaneInfo_GetFrame(ЦелУкз сам);
static extern (C) бцел wxPaneInfo_GetState(ЦелУкз сам);
static extern (C) цел wxPaneInfo_GetDock_Direction(ЦелУкз сам);
static extern (C) цел wxPaneInfo_GetDock_Layer(ЦелУкз сам);
static extern (C) цел wxPaneInfo_GetDock_Row(ЦелУкз сам);
static extern (C) цел wxPaneInfo_GetDock_Pos(ЦелУкз сам);
static extern (C) проц wxPaneInfo_GetBest_Size(ЦелУкз сам, out Размер Размер);
static extern (C) проц wxPaneInfo_GetMin_Size(ЦелУкз сам, out Размер Размер);
static extern (C) проц wxPaneInfo_GetMax_Size(ЦелУкз сам, out Размер Размер);
static extern (C) проц wxPaneInfo_GetFloating_Pos(ЦелУкз сам, out Точка Точка);
static extern (C) проц wxPaneInfo_GetFloating_Size(ЦелУкз сам, out Размер Размер);
static extern (C) цел wxPaneInfo_GetDock_Proportion(ЦелУкз сам);
static extern (C) проц wxPaneInfo_GetRect(ЦелУкз сам, out Прямоугольник прям);
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxFrameManager_ctor(ЦелУкз frame = null, бцел флаги = wxFrameManagerOption.wxAUI_MGR_DEFAULT);
static extern (C) проц wxFrameManager_dtor(ЦелУкз сам);
static extern (C) проц wxFrameManager_UnInit(ЦелУкз сам);
static extern (C) проц wxFrameManager_SetФлаги(ЦелУкз сам, бцел флаги);
static extern (C) бцел wxFrameManager_GetFlags(ЦелУкз сам);
static extern (C) проц wxFrameManager_SetFrame(ЦелУкз сам, ЦелУкз frame);
static extern (C) ЦелУкз wxFrameManager_GetFrame(ЦелУкз сам);
static extern (C) проц wxFrameManager_SetArtProvider(ЦелУкз сам, ЦелУкз art_provider);
static extern (C) ЦелУкз wxFrameManager_GetArtProvider(ЦелУкз сам);
static extern (C) ЦелУкз wxFrameManager_GetPaneByWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) ЦелУкз wxFrameManager_GetPaneByName(ЦелУкз сам, char[] имя);
static extern (C) цел wxFrameManager_GetPaneCount(ЦелУкз сам);
static extern (C) ЦелУкз wxFrameManager_GetPane(ЦелУкз сам, цел index);
static extern (C) бул wxFrameManager_AddPane(ЦелУкз сам, ЦелУкз окно, ЦелУкз pane_info);
static extern (C) бул wxFrameManager_AddPane2(ЦелУкз сам, ЦелУкз окно, цел направление, ткст caption);
static extern (C) бул wxFrameManager_InsertPane(ЦелУкз сам, ЦелУкз окно, ЦелУкз pane_info, цел insert_level = wxPaneInsertLevel.wxAUI_INSERT_PANE);
static extern (C) бул wxFrameManager_DetachPane(ЦелУкз сам, ЦелУкз окно);
static extern (C) char[] wxFrameManager_SavePerspective(ЦелУкз сам);
static extern (C) бул wxFrameManager_LoadPerspective(ЦелУкз сам, char[] perspective, бул update = да);
static extern (C) проц wxFrameManager_Update(ЦелУкз сам);

static extern (C) ТипСобытия wxEvent_EVT_AUI_PANEBUTTON();
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) проц wxFrameManagerEvent_SetPane(ЦелУкз сам, ЦелУкз p);
static extern (C) ЦелУкз wxFrameManagerEvent_GetPane(ЦелУкз сам);
static extern (C) проц wxFrameManagerEvent_SetButton(ЦелУкз сам, цел b);
static extern (C) цел wxFrameManagerEvent_GetButton(ЦелУкз сам);
static extern (C) ЦелУкз wxFrameManagerEvent_Clone(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PaneInfo wxPaneInfo;
public class PaneInfo : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxPaneInfo_ctor());
    }

    public this(PaneInfo c)
    {
        this();
        wxPaneInfo_Copy(wxobj, c.wxobj);
    }

    public бул Ок()
    {
        return wxPaneInfo_IsOk(wxobj);
    }
    public бул IsFixed()
    {
        return wxPaneInfo_IsFixed(wxobj);
    }
    public бул IsResizable()
    {
        return wxPaneInfo_IsResizable(wxobj);
    }
    public бул Виден()
    {
        return wxPaneInfo_IsShown(wxobj);
    }
    public бул IsFloating()
    {
        return wxPaneInfo_IsFloating(wxobj);
    }
    public бул IsDocked()
    {
        return wxPaneInfo_IsDocked(wxobj);
    }
    public бул IsToolbar()
    {
        return wxPaneInfo_IsToolbar(wxobj);
    }
    public бул IsTopDockable()
    {
        return wxPaneInfo_IsTopDockable(wxobj);
    }
    public бул IsBottomDockable()
    {
        return wxPaneInfo_IsBottomDockable(wxobj);
    }
    public бул IsLeftDockable()
    {
        return wxPaneInfo_IsLeftDockable(wxobj);
    }
    public бул IsRightDockable()
    {
        return wxPaneInfo_IsRightDockable(wxobj);
    }
    public бул IsFloatable()
    {
        return wxPaneInfo_IsFloatable(wxobj);
    }
    public бул IsMovable()
    {
        return wxPaneInfo_IsMovable(wxobj);
    }
    public бул HasCaption()
    {
        return wxPaneInfo_HasCaption(wxobj);
    }
    public бул HasGripper()
    {
        return wxPaneInfo_HasGripper(wxobj);
    }
    public бул ЕстьБордюр()
    {
        return wxPaneInfo_HasBorder(wxobj);
    }
    public бул HasCloseButton()
    {
        return wxPaneInfo_HasCloseButton(wxobj);
    }
    public бул HasMaximizeButton()
    {
        return wxPaneInfo_HasMaximizeButton(wxobj);
    }
    public бул HasMinimizeButton()
    {
        return wxPaneInfo_HasMinimizeButton(wxobj);
    }
    public бул HasPinButton()
    {
        return wxPaneInfo_HasPinButton(wxobj);
    }

    public PaneInfo Окно(wxWindow w)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Window(wxobj, wxObject.SafePtr(w)));
    }
    public PaneInfo Имя(char[] n)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Name(wxobj, n));
    }
    public PaneInfo Caption(char[] c)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Caption(wxobj, c));
    }
    public PaneInfo Лево()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Left(wxobj));
    }
    public PaneInfo Право()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Right(wxobj));
    }
    public PaneInfo Верх()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Top(wxobj));
    }
    public PaneInfo Низ()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Bottom(wxobj));
    }
    public PaneInfo Центрируй()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Center(wxobj));
    }
    public PaneInfo Центр()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Centre(wxobj));
    }
    public PaneInfo Direction(цел направление)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Direction(wxobj, направление));
    }
    public PaneInfo Layer(цел layer)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Layer(wxobj, layer));
    }
    public PaneInfo Row(цел row)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Row(wxobj, row));
    }
    public PaneInfo Позиция(цел поз)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Position(wxobj, поз));
    }
    public PaneInfo ЛучшийРазмер(ref Размер Размер)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_BestSize(wxobj, Размер));
    }
    public PaneInfo МинРазм(ref Размер Размер)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_MinSize(wxobj, Размер));
    }
    public PaneInfo МаксРазм(ref Размер Размер)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_MaxSize(wxobj, Размер));
    }
    public PaneInfo ЛучшийРазмер(цел x, цел y)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_BestSizeXY(wxobj, x, y));
    }
    public PaneInfo МинРазм(цел x, цел y)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_MinSizeXY(wxobj, x, y));
    }
    public PaneInfo МаксРазм(цел x, цел y)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_MaxSizeXY(wxobj, x, y));
    }
    public PaneInfo FloatingPosition(ref Точка поз)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_FloatingPosition(wxobj, поз));
    }
    public PaneInfo FloatingPosition(цел x, цел y)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_FloatingPositionXY(wxobj, x, y));
    }
    public PaneInfo FloatingSize(ref Размер Размер)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_FloatingSize(wxobj, Размер));
    }
    public PaneInfo FloatingSize(цел x, цел y)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_FloatingSizeXY(wxobj, x, y));
    }
    public PaneInfo Fixed()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Fixed(wxobj));
    }
    public PaneInfo Resizable(бул resizable = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Resizable(wxobj, resizable));
    }
    public PaneInfo Dock()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Dock(wxobj));
    }
    public PaneInfo Float()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Float(wxobj));
    }
    public PaneInfo Спрячь()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Hide(wxobj));
    }
    public PaneInfo Покажи(бул покажи = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Show(wxobj, покажи));
    }
    public PaneInfo CaptionVisible(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_CaptionVisible(wxobj, visible));
    }
    public PaneInfo PaneBorder(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_PaneBorder(wxobj, visible));
    }
    public PaneInfo Gripper(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Gripper(wxobj, visible));
    }
    public PaneInfo CloseButton(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_CloseButton(wxobj, visible));
    }
    public PaneInfo MaximizeButton(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_MaximizeButton(wxobj, visible));
    }
    public PaneInfo MinimizeButton(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_MinimizeButton(wxobj, visible));
    }
    public PaneInfo PinButton(бул visible = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_PinButton(wxobj, visible));
    }
    public PaneInfo DestroyOnClose(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_DestroyOnClose(wxobj, b));
    }
    public PaneInfo TopDockable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_TopDockable(wxobj, b));
    }
    public PaneInfo BottomDockable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_BottomDockable(wxobj, b));
    }
    public PaneInfo LeftDockable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_LeftDockable(wxobj, b));
    }
    public PaneInfo RightDockable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_RightDockable(wxobj, b));
    }
    public PaneInfo Floatable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Floatable(wxobj, b));
    }
    public PaneInfo Movable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Movable(wxobj, b));
    }
    public PaneInfo Dockable(бул b = да)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_Dockable(wxobj, b));
    }
    public PaneInfo DefaultPane()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_DefaultPane(wxobj));
    }
    public PaneInfo CentrePane()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_CentrePane(wxobj));
    }
    public PaneInfo CenterPane()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_CenterPane(wxobj));
    }
    public PaneInfo ToolbarPane()
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_ToolbarPane(wxobj));
    }
    public PaneInfo УстFlag(бцел flag, бул option_state)
    {
        return cast(PaneInfo) НайдиОбъект(wxPaneInfo_SetFlag(wxobj, flag, option_state));
    }
    public бул ЕстьФлаг(бцел flag)
    {
        return wxPaneInfo_HasFlag(wxobj, flag);
    }

    public char[] имя()
    {
        return wxPaneInfo_GetName(wxobj);
    }
    public char[] caption()
    {
        return wxPaneInfo_GetCaption(wxobj);
    }

    public wxWindow окно()
    {
        ЦелУкз ptr = wxPaneInfo_GetWindow(wxobj);
        wxObject o = НайдиОбъект(ptr);
        return (o)? cast(wxWindow)o : new wxWindow(ptr);
    }
    public wxWindow frame()
    {
        ЦелУкз ptr = wxPaneInfo_GetFrame(wxobj);
        wxObject o = НайдиОбъект(ptr);
        return (o)? cast(wxWindow)o : new wxWindow(ptr);
    }
    public бцел state()
    {
        return wxPaneInfo_GetState(wxobj);
    }

    public цел dock_direction()
    {
        return wxPaneInfo_GetDock_Direction(wxobj);
    }
    public цел dock_layer()
    {
        return wxPaneInfo_GetDock_Layer(wxobj);
    }
    public цел dock_row()
    {
        return wxPaneInfo_GetDock_Row(wxobj);
    }
    public цел dock_pos()
    {
        return wxPaneInfo_GetDock_Pos(wxobj);
    }

    public Размер best_size()
    {
        Размер Размер;
        wxPaneInfo_GetBest_Size(wxobj, Размер);
        return Размер;
    }
    public Размер min_size()
    {
        Размер Размер;
        wxPaneInfo_GetMin_Size(wxobj, Размер);
        return Размер;
    }
    public Размер max_size()
    {
        Размер Размер;
        wxPaneInfo_GetMax_Size(wxobj, Размер);
        return Размер;
    }

    public Точка floating_pos()
    {
        Точка Точка;
        wxPaneInfo_GetFloating_Pos(wxobj, Точка);
        return Точка;
    }
    public Размер floating_size()
    {
        Размер Размер;
        wxPaneInfo_GetFloating_Size(wxobj, Размер);
        return Размер;
    }
    public цел dock_proportion()
    {
        return wxPaneInfo_GetDock_Proportion(wxobj);
    }

    public Прямоугольник прям()
    {
        Прямоугольник прям;
        wxPaneInfo_GetRect(wxobj, прям);
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
public class FrameManager : ОбработчикСоб
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Frame frame = null, бцел флаги = wxFrameManagerOption.wxAUI_MGR_DEFAULT)
    {
        this(wxFrameManager_ctor(wxObject.SafePtr(frame), флаги));
    }

    public проц UnInit()
    {
        wxFrameManager_UnInit(wxobj);
    }

    public проц УстФлаги(бцел флаги)
    {
        wxFrameManager_SetФлаги(wxobj, флаги);
    }
    public бцел GetФлаги()
    {
        return wxFrameManager_GetFlags(wxobj);
    }

    public проц УстFrame(Frame frame)
    {
        wxFrameManager_SetFrame(wxobj, wxObject.SafePtr(frame));
    }
    public Frame GetFrame()
    {
        ЦелУкз ptr = wxFrameManager_GetFrame(wxobj);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(Frame)o;
        else return new Frame(ptr);
    }

    public проц УстArtProvider(DockArt art_provider)
    {
        wxFrameManager_SetArtProvider(wxobj, wxObject.SafePtr(art_provider));
    }
    public DockArt GetArtProvider()
    {
        ЦелУкз ptr = wxFrameManager_GetArtProvider(wxobj);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(DockArt)o;
        else return new DockArt(ptr);
    }

    public PaneInfo GetPane(Окно окно)
    {
        ЦелУкз ptr = wxFrameManager_GetPaneByWindow(wxobj, wxObject.SafePtr(окно));
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(PaneInfo)o;
        else return new PaneInfo(ptr);
    }
    public PaneInfo GetPane(char[] имя)
    {
        ЦелУкз ptr = wxFrameManager_GetPaneByName(wxobj, имя);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(PaneInfo)o;
        else return new PaneInfo(ptr);
    }
    public цел GetPaneCount()
    {
        return wxFrameManager_GetPaneCount(wxobj);
    }
    public PaneInfo GetPane(цел index)
    {
        ЦелУкз ptr = wxFrameManager_GetPane(wxobj, index);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(PaneInfo)o;
        else return new PaneInfo(ptr);
    }

    public бул AddPane(Окно окно, PaneInfo pane_info)
    {
        return wxFrameManager_AddPane(wxobj, wxObject.SafePtr(окно), wxObject.SafePtr(pane_info));
    }

    public бул AddPane(Окно окно,
                        цел направление = Direction.wxLEFT,
                        ткст caption = "")
    {
        return wxFrameManager_AddPane2(wxobj, wxObject.SafePtr(окно), направление, caption);
    }

    public бул InsertPane(Окно окно,
                           PaneInfo pane_info,
                           цел insert_level = wxPaneInsertLevel.wxAUI_INSERT_PANE)
    {
        return wxFrameManager_InsertPane(wxobj, wxObject.SafePtr(окно), wxObject.SafePtr(pane_info), insert_level);
    }

    public бул DetachPane(Окно окно)
    {
        return wxFrameManager_DetachPane(wxobj, wxObject.SafePtr(окно));
    }

    public char[] SavePerspective()
    {
        return wxFrameManager_SavePerspective(wxobj);
    }

    public бул LoadPerspective(char[] perspective,
                                бул update = да)
    {
        return wxFrameManager_LoadPerspective(wxobj, perspective, update);
    }

    public проц Обнови()
    {
        return wxFrameManager_Update(wxobj);
    }


// wx event machinery


// right now the only event that works is wxEVT_AUI_PANEBUTTON. A full
// spectrum of events will be implemented in the next incremental version

    public static ТипСобытия wxEVT_AUI_PANEBUTTON;

    static this()
    {
        wxEVT_AUI_PANEBUTTON = wxEvent_EVT_AUI_PANEBUTTON();
    }

    public проц EVT_AUI_PANEBUTTON(ДатчикСобытий lsnr)
    {
        AddEventListener(wxEVT_AUI_PANEBUTTON, lsnr);
    }
}



// event declarations/classes
alias FrameManagerEvent wxFrameManagerEvent;
public class FrameManagerEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public Событие Clone()
    {
        return new FrameManagerEvent(wxFrameManagerEvent_Clone(wxobj));
    }

    public проц УстPane(PaneInfo p)
    {
        wxFrameManagerEvent_SetPane(wxobj, wxObject.SafePtr(p));
    }
    public проц УстButton(цел b)
    {
        wxFrameManagerEvent_SetButton(wxobj, b);
    }
    public PaneInfo GetPane()
    {
        ЦелУкз ptr = wxFrameManagerEvent_GetPane(wxobj);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(PaneInfo)o;
        else return new PaneInfo(ptr);
    }
    public цел GetButton()
    {
        return wxFrameManagerEvent_GetButton(wxobj);
    }
}


