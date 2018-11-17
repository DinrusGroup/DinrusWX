//-----------------------------------------------------------------------------
// wxD - Окно.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Окно.cs
//
/// The wxWindow wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Окно.d,v 1.13 2009/02/08 13:16:40 afb Exp $
//-----------------------------------------------------------------------------

module wx.Window;
public import wx.common;
public import wx.EvtHandler;
public import wx.Cursor;
public import wx.Font;
public import wx.Colour;
public import wx.Region;
public import wx.Validator;
public import wx.Palette;
public import wx.Accelerator;

public import wx.Caret;
public import wx.DC;
public import wx.DND;
public import wx.Sizer;
public import wx.Menu;
public import wx.ToolTip;

public enum ПВариантОкна
{
    НОРМАЛЬНЫЙ,  // Normal Размер
    МАЛЕНЬКИЙ,   // Smaller Размер (about 25 % smaller than normal)
    МИНИ,    // Mini Размер (about 33 % smaller than normal)
    БОЛЬШОЙ,   // Large Размер (about 25 % larger than normal)
    МАКС
};

//---------------------------------------------------------------------

public enum ПСтильФона
{
    СИСТЕМНЫЙ,
    ЦВЕТНОЙ,
    ОСОБЫЙ
};

//---------------------------------------------------------------------

public enum ПБордюр
{
    ДЕФОЛТ = 0,

    НИКАКОЙ   = 0x00200000,
    СТАТИЧЕСКИЙ = 0x01000000,
    ПРОСТОЙ = 0x02000000,
    ПОДНЯТЫЙ = 0x04000000,
    УТОПЛЕННЫЙ = 0x08000000,
    ДВОЙНОЙ = 0x10000000,

    МАСКА   = 0x1f200000,

    wxDOUBLE_BORDER   = ДВОЙНОЙ,
    wxSUNKEN_BORDER   = УТОПЛЕННЫЙ,
    wxRAISED_BORDER   = ПОДНЯТЫЙ,
    wxBORDER          = ПРОСТОЙ,
    wxSIMPLE_BORDER   = ПРОСТОЙ,
    wxSTATIC_BORDER   = СТАТИЧЕСКИЙ,
    wxNO_BORDER       = НИКАКОЙ
};

//! \cond EXTERN
static extern (C) ЦелУкз wxVisualAttributes_ctor();
static extern (C) проц   wxVisualAttributes_dtor(ЦелУкз сам);
static extern (C) проц   wxVisualAttributes_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxVisualAttributes_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxVisualAttributes_GetFont(ЦелУкз сам);
static extern (C) проц   wxVisualAttributes_SetColourFg(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxVisualAttributes_GetColourFg(ЦелУкз сам);
static extern (C) проц   wxVisualAttributes_SetColourBg(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxVisualAttributes_GetColourBg(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias ВизАтрибуты wxVisualAttributes;
public class ВизАтрибуты : wxObject
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
        this(wxVisualAttributes_ctor(), да);
        wxVisualAttributes_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    public Шрифт шрифт()
    {
        return new Шрифт(wxVisualAttributes_GetFont(wxobj), да);
    }
    public проц шрифт(Шрифт значение)
    {
        wxVisualAttributes_SetFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Цвет цветПП()
    {
        return new Цвет(wxVisualAttributes_GetColourFg(wxobj), да);
    }
    //---------------------------------------------------------------------

    public Цвет цветЗП()
    {
        return new Цвет(wxVisualAttributes_GetColourBg(wxobj), да);
    }
    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxVisualAttributes_dtor(wxobj);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxWindow_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) бул   wxWindow_Close(ЦелУкз сам, бул сила);
static extern (C) проц   wxWindow_GetBestSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц   wxWindow_GetClientSize(ЦелУкз сам, out Размер Размер);
static extern (C) цел    wxWindow_GetId(ЦелУкз сам);
static extern (C) бцел   wxWindow_GetWindowStyleFlag(ЦелУкз сам);
static extern (C) бцел   wxWindow_Layout(ЦелУкз сам);
static extern (C) проц   wxWindow_SetAutoLayout(ЦелУкз сам, бул autoLayout);
static extern (C) проц   wxWindow_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxWindow_GetBackgroundColour(ЦелУкз сам);
static extern (C) проц   wxWindow_SetForegroundColour(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxWindow_GetForegroundColour(ЦелУкз сам);
static extern (C) проц   wxWindow_SetCursor(ЦелУкз сам, ЦелУкз курсор);
static extern (C) проц   wxWindow_SetId(ЦелУкз сам, цел ид);
static extern (C) проц   wxWindow_SetSize(ЦелУкз сам, цел x, цел y, цел ширь, цел высь, бцел флаги);
static extern (C) проц   wxWindow_SetSize2(ЦелУкз сам, цел ширь, цел высь);
static extern (C) проц   wxWindow_SetSize3(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxWindow_SetSize4(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) проц   wxWindow_SetSizer(ЦелУкз сам, ЦелУкз сайзер, бул удалитьСтар);
static extern (C) проц   wxWindow_SetWindowStyleFlag(ЦелУкз сам, бцел стиль);
static extern (C) бул   wxWindow_Show(ЦелУкз сам, бул покажи);
static extern (C) бул   wxWindow_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxWindow_GetFont(ЦелУкз сам);
static extern (C) проц   wxWindow_SetToolTip(ЦелУкз сам, ткст tip);
static extern (C) бул 	 wxWindow_Enable(ЦелУкз сам, бул вкл);
static extern (C) бул   wxWindow_IsEnabled(ЦелУкз сам);

static extern (C) цел    wxWindow_EVT_TRANSFERDATAFROMWINDOW();
static extern (C) цел    wxWindow_EVT_TRANSFERDATATOWINDOW();

//static extern (C) бул wxWindow_LoadFromResource(ЦелУкз сам, ЦелУкз родитель, ткст resourceName, ЦелУкз table);
//static extern (C) ЦелУкз wxWindow_CreateItem(ЦелУкз сам, ЦелУкз childResource, ЦелУкз parentResource, ЦелУкз table);
static extern (C) бул   wxWindow_Destroy(ЦелУкз сам);
static extern (C) бул   wxWindow_DestroyChildren(ЦелУкз сам);
static extern (C) проц   wxWindow_SetTitle(ЦелУкз сам, ткст титул);
static extern (C) ЦелУкз wxWindow_GetTitle(ЦелУкз сам);
static extern (C) проц   wxWindow_SetName(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxWindow_GetName(ЦелУкз сам);
static extern (C) цел    wxWindow_NewControlId();
static extern (C) цел    wxWindow_NextControlId(цел ид);
static extern (C) цел    wxWindow_PrevControlId(цел ид);
static extern (C) проц   wxWindow_Move(ЦелУкз сам, цел x, цел y, цел флаги);
static extern (C) проц   wxWindow_Raise(ЦелУкз сам);
static extern (C) проц   wxWindow_Lower(ЦелУкз сам);
static extern (C) проц   wxWindow_SetClientSize(ЦелУкз сам, цел ширь, цел высь);
static extern (C) проц   wxWindow_GetPosition(ЦелУкз сам, out Точка Точка);
static extern (C) проц   wxWindow_GetSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц   wxWindow_GetRect(ЦелУкз сам, out Прямоугольник прям);
static extern (C) проц   wxWindow_GetClientAreaOrigin(ЦелУкз сам, out Точка Точка);
static extern (C) проц   wxWindow_GetClientRect(ЦелУкз сам, out Прямоугольник прям);
static extern (C) проц   wxWindow_GetAdjustedBestSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц   wxWindow_Center(ЦелУкз сам, цел направление);
static extern (C) проц   wxWindow_CenterOnScreen(ЦелУкз сам, цел dir);
static extern (C) проц   wxWindow_CenterOnParent(ЦелУкз сам, цел dir);
static extern (C) проц   wxWindow_Fit(ЦелУкз сам);
static extern (C) проц   wxWindow_FitInside(ЦелУкз сам);
static extern (C) проц   wxWindow_SetSizeHints(ЦелУкз сам, цел minW, цел minH, цел maxW, цел maxH, цел incW, цел incH);
static extern (C) проц   wxWindow_SetVirtualSizeHints(ЦелУкз сам, цел minW, цел minH, цел maxW, цел maxH);
static extern (C) цел    wxWindow_GetMinWidth(ЦелУкз сам);
static extern (C) цел    wxWindow_GetMinHeight(ЦелУкз сам);
static extern (C) проц   wxWindow_GetMinSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц   wxWindow_SetMinSize(ЦелУкз сам, Размер* Размер);
static extern (C) цел    wxWindow_GetMaxWidth(ЦелУкз сам);
static extern (C) цел    wxWindow_GetMaxHeight(ЦелУкз сам);
static extern (C) проц   wxWindow_GetMaxSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц   wxWindow_SetMaxSize(ЦелУкз сам, Размер* Размер);
static extern (C) проц   wxWindow_SetVirtualSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxWindow_GetVirtualSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц   wxWindow_GetBestVirtualSize(ЦелУкз сам, out Размер Размер);
static extern (C) бул   wxWindow_Hide(ЦелУкз сам);
static extern (C) бул   wxWindow_Disable(ЦелУкз сам);
static extern (C) бул   wxWindow_IsShown(ЦелУкз сам);
static extern (C) проц   wxWindow_SetWindowStyle(ЦелУкз сам, бцел стиль);
static extern (C) бцел   wxWindow_GetWindowStyle(ЦелУкз сам);
static extern (C) бул   wxWindow_HasFlag(ЦелУкз сам, цел flag);
static extern (C) бул   wxWindow_IsRetained(ЦелУкз сам);
static extern (C) проц   wxWindow_SetExtraStyle(ЦелУкз сам, бцел exStyle);
static extern (C) бцел   wxWindow_GetExtraStyle(ЦелУкз сам);
static extern (C) проц   wxWindow_MakeModal(ЦелУкз сам, бул modal);
static extern (C) проц   wxWindow_SetThemeEnabled(ЦелУкз сам, бул enableTheme);
static extern (C) бул   wxWindow_GetThemeEnabled(ЦелУкз сам);
static extern (C) проц   wxWindow_SetFocus(ЦелУкз сам);
static extern (C) проц   wxWindow_SetFocusFromKbd(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_FindFocus();
static extern (C) бул   wxWindow_AcceptsFocus(ЦелУкз сам);
static extern (C) бул   wxWindow_AcceptsFocusFromKeyboard(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetParent(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetGrandParent(ЦелУкз сам);
static extern (C) бул   wxWindow_IsTopLevel(ЦелУкз сам);
static extern (C) проц   wxWindow_SetParent(ЦелУкз сам, ЦелУкз родитель);
static extern (C) бул   wxWindow_Reparent(ЦелУкз сам, ЦелУкз newParent);
static extern (C) проц   wxWindow_AddChild(ЦелУкз сам, ЦелУкз child);
static extern (C) проц   wxWindow_RemoveChild(ЦелУкз сам, ЦелУкз child);
static extern (C) ЦелУкз wxWindow_FindWindowId(ЦелУкз сам, цел ид);
static extern (C) ЦелУкз wxWindow_FindWindowName(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxWindow_FindWindowById(цел ид, ЦелУкз родитель);
static extern (C) ЦелУкз wxWindow_FindWindowByName(ткст имя, ЦелУкз родитель);
static extern (C) ЦелУкз wxWindow_FindWindowByLabel(ткст ярлык, ЦелУкз родитель);
static extern (C) ЦелУкз wxWindow_GetEventHandler(ЦелУкз сам);
static extern (C) проц   wxWindow_SetEventHandler(ЦелУкз сам, ЦелУкз обработчик);
static extern (C) проц   wxWindow_PushEventHandler(ЦелУкз сам, ЦелУкз обработчик);
static extern (C) ЦелУкз wxWindow_PopEventHandler(ЦелУкз сам, бул удалиОбраб);
static extern (C) бул   wxWindow_RemoveEventHandler(ЦелУкз сам, ЦелУкз обработчик);
static extern (C) проц   wxWindow_SetValidator(ЦелУкз сам, ЦелУкз оценщик);
static extern (C) ЦелУкз wxWindow_GetValidator(ЦелУкз сам);
static extern (C) бул   wxWindow_Validate(ЦелУкз сам);
static extern (C) бул   wxWindow_TransferDataToWindow(ЦелУкз сам);
static extern (C) бул   wxWindow_TransferDataFromWindow(ЦелУкз сам);
static extern (C) проц   wxWindow_InitDialog(ЦелУкз сам);
static extern (C) проц   wxWindow_SetAcceleratorTable(ЦелУкз сам, ЦелУкз accel);
static extern (C) ЦелУкз wxWindow_GetAcceleratorTable(ЦелУкз сам);
static extern (C) проц   wxWindow_ConvertPixelsToDialogPoint(ЦелУкз сам, inout Точка тчк, out Точка Точка);
static extern (C) проц   wxWindow_ConvertDialogToPixelsPoint(ЦелУкз сам, inout Точка тчк, out Точка Точка);
static extern (C) проц   wxWindow_ConvertPixelsToDialogSize(ЦелУкз сам, inout Размер рм, out Размер Размер);
static extern (C) проц   wxWindow_ConvertDialogToPixelsSize(ЦелУкз сам, inout Размер рм, out Размер Размер);
static extern (C) проц   wxWindow_WarpPointer(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxWindow_CaptureMouse(ЦелУкз сам);
static extern (C) проц   wxWindow_ReleaseMouse(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetCapture();
static extern (C) бул   wxWindow_HasCapture(ЦелУкз сам);
static extern (C) проц   wxWindow_Refresh(ЦелУкз сам, бул eraseBackground, inout Прямоугольник прям);
static extern (C) проц   wxWindow_RefreshRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) проц   wxWindow_Update(ЦелУкз сам);
static extern (C) проц   wxWindow_ClearBackground(ЦелУкз сам);
static extern (C) проц   wxWindow_Freeze(ЦелУкз сам);
static extern (C) проц   wxWindow_Thaw(ЦелУкз сам);
static extern (C) проц   wxWindow_PrepareDC(ЦелУкз сам, ЦелУкз dc);
static extern (C) бул   wxWindow_IsExposed(ЦелУкз сам, цел x, цел y, цел w, цел h);
static extern (C) проц   wxWindow_SetCaret(ЦелУкз сам, ЦелУкз каретка);
static extern (C) ЦелУкз wxWindow_GetCaret(ЦелУкз сам);
static extern (C) цел    wxWindow_GetCharHeight(ЦелУкз сам);
static extern (C) цел    wxWindow_GetCharWidth(ЦелУкз сам);
static extern (C) проц   wxWindow_GetTextExtent(ЦелУкз сам, ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, ЦелУкз theFont);
static extern (C) проц   wxWindow_ClientToScreen(ЦелУкз сам, inout цел x, inout цел y);
static extern (C) проц   wxWindow_ScreenToClient(ЦелУкз сам, inout цел x, inout цел y);
static extern (C) проц   wxWindow_ClientToScreen(ЦелУкз сам, inout Точка тчк, out Точка Точка);
static extern (C) проц   wxWindow_ScreenToClient(ЦелУкз сам, inout Точка тчк, out Точка Точка);
//static extern (C) wxHitTest wxWindow_HitTest(ЦелУкз сам, Coord x, Coord y);
//static extern (C) wxHitTest wxWindow_HitTest(ЦелУкз сам, inout Точка тчк);
static extern (C) цел    wxWindow_GetBorder(ЦелУкз сам);
static extern (C) цел    wxWindow_GetBorderByФлаги(ЦелУкз сам, бцел флаги);
static extern (C) проц   wxWindow_UpdateWindowUI(ЦелУкз сам);
static extern (C) бул   wxWindow_PopupMenu(ЦелУкз сам, ЦелУкз меню, inout Точка поз);
static extern (C) бул   wxWindow_HasScrollbar(ЦелУкз сам, цел ориент);
static extern (C) проц   wxWindow_SetScrollbar(ЦелУкз сам, цел ориент, цел поз, цел thumbvisible, цел диапазон, бул освежи);
static extern (C) проц   wxWindow_SetScrollPos(ЦелУкз сам, цел ориент, цел поз, бул освежи);
static extern (C) цел    wxWindow_GetScrollPos(ЦелУкз сам, цел ориент);
static extern (C) цел    wxWindow_GetScrollThumb(ЦелУкз сам, цел ориент);
static extern (C) цел    wxWindow_GetScrollRange(ЦелУкз сам, цел ориент);
static extern (C) проц   wxWindow_ScrollWindow(ЦелУкз сам, цел dx, цел dy, inout Прямоугольник прям);
static extern (C) бул   wxWindow_ScrollLines(ЦелУкз сам, цел строки);
static extern (C) бул   wxWindow_ScrollPages(ЦелУкз сам, цел страницы);
static extern (C) бул   wxWindow_LineUp(ЦелУкз сам);
static extern (C) бул   wxWindow_LineDown(ЦелУкз сам);
static extern (C) бул   wxWindow_PageUp(ЦелУкз сам);
static extern (C) бул   wxWindow_PageDown(ЦелУкз сам);
static extern (C) проц   wxWindow_SetHelpText(ЦелУкз сам, ткст текст);
static extern (C) проц   wxWindow_SetHelpTextForId(ЦелУкз сам, ткст текст);
static extern (C) ЦелУкз wxWindow_GetHelpText(ЦелУкз сам);
//static extern (C) проц wxWindow_SetToolTip(ЦелУкз сам, ЦелУкз tip);
//static extern (C) ЦелУкз wxWindow_GetToolTip(ЦелУкз сам);
static extern (C) проц   wxWindow_SetDropTarget(ЦелУкз сам, ЦелУкз мишеньСброса);
static extern (C) ЦелУкз wxWindow_GetDropTarget(ЦелУкз сам);
static extern (C) проц   wxWindow_SetConstraints(ЦелУкз сам, ЦелУкз constraints);
static extern (C) ЦелУкз wxWindow_GetConstraints(ЦелУкз сам);
static extern (C) бул   wxWindow_GetAutoLayout(ЦелУкз сам);
static extern (C) проц   wxWindow_SetSizerAndFit(ЦелУкз сам, ЦелУкз сайзер, бул удалитьСтар);
static extern (C) ЦелУкз wxWindow_GetSizer(ЦелУкз сам);
static extern (C) проц   wxWindow_SetContainingSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) ЦелУкз wxWindow_GetContainingSizer(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetPalette(ЦелУкз сам);
static extern (C) проц   wxWindow_SetPalette(ЦелУкз сам, ЦелУкз pal);
static extern (C) бул   wxWindow_HasCustomPalette(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetUpdateRegion(ЦелУкз сам);

static extern (C) проц   wxWindow_SetWindowVariant(ЦелУкз сам, цел вариант);
static extern (C) цел    wxWindow_GetWindowVariant(ЦелУкз сам);
static extern (C) бул   wxWindow_IsBeingDeleted(ЦелУкз сам);
static extern (C) проц   wxWindow_InvalidateBestSize(ЦелУкз сам);
static extern (C) проц   wxWindow_CacheBestSize(ЦелУкз сам, Размер Размер);
static extern (C) проц   wxWindow_GetBestFittingSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxWindow_SetBestFittingSize(ЦелУкз сам, inout Размер Размер);
static extern (C) ЦелУкз wxWindow_GetChildren(ЦелУкз сам, цел чис);
static extern (C) цел    wxWindow_GetChildrenCount(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetDefaultAttributes(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetClassDefaultAttributes(цел вариант);
static extern (C) проц   wxWindow_SetBackgroundStyle(ЦелУкз сам, цел стиль);
static extern (C) цел    wxWindow_GetBackgroundStyle(ЦелУкз сам);
//static extern (C) ЦелУкз wxWindow_GetToolTipText(ЦелУкз сам);
static extern (C) ЦелУкз wxWindow_GetAncestorWithCustomPalette(ЦелУкз сам);
static extern (C) проц   wxWindow_InheritAttributes(ЦелУкз сам);
static extern (C) бул   wxWindow_ShouldInheritColours(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Окно wxWindow;
/// wxWindow is the base class for all windows and represents any
/// visible object on screen. All controls, top level windows and so on
/// are windows. Sizers and device contexts are not, however, as they don't
/// appear on screen themselves.
public class Окно : ОбработчикСоб
{
    enum
    {
        wxVSCROLL			= cast(цел)0x80000000,
        wxHSCROLL			= 0x40000000,
        wxCAPTION			= 0x20000000,

        wxCLIP_CHILDREN			= 0x00400000,
        wxMINIMIZE_BOX 			= 0x00000400,
        wxCLOSE_BOX			= 0x1000,
        wxMAXIMIZE_BOX			= 0x0200,
        wxNO_3D				= 0x00800000,
        wxRESIZE_BORDER			= 0x00000040,
        wxSYSTEM_MENU			= 0x00000800,
        wxTAB_TRAVERSAL			= 0x00008000,

        wxNO_FULL_REPAINT_ON_RESIZE	= 0x00010000,

        wxID_OK			= 5100,
        wxID_CANCEL			= 5101,
        wxID_YES			= 5103,
        wxID_NO			= 5104,

        wxID_ANY			= -1,
        wxID_ABOUT			= 5013,

        wxSTAY_ON_TOP			= 0x8000,
        wxICONIZE			= 0x4000,
        wxMINIMIZE			= wxICONIZE,
        wxMAXIMIZE			= 0x2000,

        wxTINY_CAPTION_HORIZ		= 0x0100,
        wxTINY_CAPTION_VERT		= 0x0080,

        wxDIALOG_NO_PARENT		= 0x0001,
        wxFRAME_NO_TASKBAR		= 0x0002,
        wxFRAME_TOOL_WINDOW		= 0x0004,
        wxFRAME_FLOAT_ON_PARENT		= 0x0008,
        wxFRAME_SHAPED			= 0x0010,
        wxFRAME_EX_CONTEXTHELP		= 0x00000004,

        //---------------------------------------------------------------------

        ДЕФОЛТ		= 0x00000000,
        НИКАКОЙ			= 0x00200000,
        СТАТИЧЕСКИЙ			= 0x01000000,
        ПРОСТОЙ			= 0x02000000,
        ПОДНЯТЫЙ			= 0x04000000,
        УТОПЛЕННЫЙ			= 0x08000000,
        ДВОЙНОЙ			= 0x10000000,
        МАСКА			= 0x1f200000,

        // ПБордюр флаги
        wxDOUBLE_BORDER			= ДВОЙНОЙ,
        wxSUNKEN_BORDER			= УТОПЛЕННЫЙ,
        wxRAISED_BORDER			= ПОДНЯТЫЙ,
        wxBORDER			= ПРОСТОЙ,
        wxSIMPLE_BORDER			= ПРОСТОЙ,
        wxSTATIC_BORDER			= СТАТИЧЕСКИЙ,
        wxNO_BORDER			= НИКАКОЙ,

        wxWANTS_CHARS			= 0x00040000,

        wxDEFAULT_FRAME			= wxSYSTEM_MENU | wxRESIZE_BORDER |
                                  wxMINIMIZE_BOX | wxMAXIMIZE_BOX | wxCAPTION |
                                  wxCLIP_CHILDREN | wxCLOSE_BOX,
        wxDEFAULT_FRAME_STYLE		= wxDEFAULT_FRAME,

        wxDEFAULT_DIALOG_STYLE		= wxSYSTEM_MENU | wxCAPTION | wxCLOSE_BOX,
    }

    private static цел уникИД			= 10000; // start with 10000 to not interfere with the old ид system

    //---------------------------------------------------------------------

    public const Точка вхДефПоз = {X:-1, Y:-1};
    public const wx.common.Размер  вхДефРазм     = {Ширь:-1, Высь:-1};
    const ткст вхСтрИмяПанели = "panel";

    //---------------------------------------------------------------------

    public this(Окно родитель, цел ид, Точка поз=вхДефПоз, wx.common.Размер размер=вхДефРазм, цел стиль=0, ткст имя=вхСтрИмяПанели)
    {
        this(wxWindow_ctor(wxObject.SafePtr(родитель), ид, поз, размер, стиль, имя),
             false /*a Окно will always be destroyed by its родитель*/);
    }

    public this(Окно родитель, Точка поз=вхДефПоз, wx.common.Размер размер=вхДефРазм, цел стиль=0, ткст имя=вхСтрИмяПанели)
    {
        this(родитель, Окно.УникИД, поз, размер, стиль, имя);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
        AddEventListener(wxWindow_EVT_TRANSFERDATATOWINDOW(), &ПоПередачеДанныхОкну);
        AddEventListener(wxWindow_EVT_TRANSFERDATAFROMWINDOW(), &ПоПередачеДанныхОтОкна);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;

        AddEventListener(wxWindow_EVT_TRANSFERDATATOWINDOW(), &ПоПередачеДанныхОкну);
        AddEventListener(wxWindow_EVT_TRANSFERDATAFROMWINDOW(), &ПоПередачеДанныхОтОкна);
    }


    static wxObject Нов(ЦелУкз ptr)
    {
        return new Окно(ptr);
    }
    //---------------------------------------------------------------------

    public  проц   цветФона(Цвет значение)
    {
        wxWindow_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }
    public  Цвет цветФона()
    {
        return new Цвет(wxWindow_GetBackgroundColour(wxobj), да);
    }

    public  Цвет ЦветПП()
    {
        return new Цвет(wxWindow_GetForegroundColour(wxobj), да);
    }
    public  проц   ЦветПП(Цвет значение)
    {
        wxWindow_SetForegroundColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    // Note: was previously defined as WindowFont
    public  проц шрифт(Шрифт значение)
    {
        wxWindow_SetFont(wxobj, значение.wxobj);
    }
    public  Шрифт шрифт()
    {
        return new Шрифт(wxWindow_GetFont(wxobj), да);
    }


    //---------------------------------------------------------------------

    public  wx.common.Размер ЛучшийРазмер()
    {
        Размер размер;
        wxWindow_GetBestSize(wxobj, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    public  wx.common.Размер РазмерКлиента()
    {
        Размер размер;
        wxWindow_GetClientSize(wxobj, размер);
        return размер;
    }
    public  проц РазмерКлиента(wx.common.Размер значение)
    {
        wxWindow_SetClientSize(wxobj, значение.Ширь, значение.Высь);
    }

    //---------------------------------------------------------------------

    public  бул Закрой()
    {
        return wxWindow_Close(wxobj, false);
    }

    public  бул Закрой(бул сила)
    {
        return wxWindow_Close(wxobj, сила);
    }

    //---------------------------------------------------------------------

    public  цел ИД()
    {
        return wxWindow_GetId(wxobj);
    }
    public  проц устИД(цел значение)
    {
        wxWindow_SetId(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public static цел УникИД()
    {
        return ++уникИД;
    }

    //---------------------------------------------------------------------

    public  проц Раскладка()
    {
        wxWindow_Layout(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц устКурсор(Курсор значение)
    {
        wxWindow_SetCursor(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public  проц устРазм(цел x, цел y, цел ширь, цел высь)
    {
        wxWindow_SetSize(wxobj, x, y, ширь, высь, 0);
    }

    public  проц устРазм(цел ширь, цел высь)
    {
        wxWindow_SetSize2(wxobj, ширь, высь);
    }

    public  проц устРазм(wx.common.Размер размер)
    {
        wxWindow_SetSize3(wxobj, размер);
    }

    public  проц устРазм(Прямоугольник прям)
    {
        wxWindow_SetSize4(wxobj, прям);
    }

    //---------------------------------------------------------------------

    public  проц УстСайзер(Сайзер сайзер, бул удалитьСтар=да)
    {
        wxWindow_SetSizer(wxobj, сайзер.wxobj, удалитьСтар);
    }

    //---------------------------------------------------------------------

    public  бул Покажи(бул покажи=да)
    {
        return wxWindow_Show(wxobj, покажи);
    }

    //---------------------------------------------------------------------

    public  цел  ФлагиСтиля()
    {
        return wxWindow_GetWindowStyleFlag(wxobj);
    }
    public  проц ФлагиСтиля(бцел значение)
    {
        wxWindow_SetWindowStyleFlag(wxobj, значение);
    }

    //---------------------------------------------------------------------

    private проц ПоПередачеДанныхОтОкна(Объект отправитель, Событие e)
    {
        if (!ПередайДанныеОтОкна())
            e.Skip();
    }

    //---------------------------------------------------------------------

    private проц ПоПередачеДанныхОкну(Объект отправитель, Событие e)
    {
        if (!ПередайДанныеОкну())
            e.Skip();
    }

    //---------------------------------------------------------------------

    public  проц тулТип(ткст значение)
    {
        wxWindow_SetToolTip(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public  проц Активен(бул значение)
    {
        wxWindow_Enable(wxobj, значение);
    }
    public  бул Активен()
    {
        return wxWindow_IsEnabled(wxobj);
    }

    //---------------------------------------------------------------------

    public  бул Разрушь()
    {
        return wxWindow_Destroy(wxobj);
    }

    public  бул РазрушьОтпрыски()
    {
        return wxWindow_DestroyChildren(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц  Титул(ткст значение)
    {
        wxWindow_SetTitle(wxobj, значение);
    }
    public  ткст Титул()
    {
        return cast(ткст) new wxString(wxWindow_GetTitle(wxobj), да);
    }

    //---------------------------------------------------------------------

    public  проц Имя(ткст значение)
    {
        wxWindow_SetName(wxobj, значение);
    }
    public  ткст Имя()
    {
        return cast(ткст) new wxString(wxWindow_GetName(wxobj), да);
    }

    //---------------------------------------------------------------------

    public static цел НовИдУпрЭлта()
    {
        return wxWindow_NewControlId();
    }

    public static цел СледщИдУпрЭлта(цел ид)
    {
        return wxWindow_NextControlId(ид);
    }

    public static цел ПредшИдУпрЭлта(цел ид)
    {
        return wxWindow_PrevControlId(ид);
    }

    //---------------------------------------------------------------------

    public  проц Сдвинь(цел x, цел y, цел флаги)
    {
        wxWindow_Move(wxobj, x, y, флаги);
    }

    //---------------------------------------------------------------------

    public  проц Повысь()
    {
        wxWindow_Raise(wxobj);
    }

    public  проц Понизь()
    {
        wxWindow_Lower(wxobj);
    }

    //---------------------------------------------------------------------

    public  Точка Позиция()
    {
        Точка Точка;
        wxWindow_GetPosition(wxobj, Точка);
        return Точка;
    }
    public  проц  Позиция(Точка значение)
    {
        Сдвинь(значение.X, значение.Y, 0);
    }

    //---------------------------------------------------------------------

    public  wx.common.Размер размер()
    {
        Размер размер;
        wxWindow_GetSize(wxobj, размер);
        return размер;
    }
    public  проц размер(wx.common.Размер значение)
    {
        wxWindow_SetSize(wxobj, Позиция.X, Позиция.Y,
                         значение.Ширь, значение.Высь, 0);
    }

    //---------------------------------------------------------------------

    public  Прямоугольник Прям()
    {
        Прямоугольник прям;
        wxWindow_GetRect(wxobj, прям);
        return прям;
    }

    //---------------------------------------------------------------------

    public  Точка ИсходнаяЗоныКлиента()
    {
        Точка Точка;
        wxWindow_GetClientAreaOrigin(wxobj, Точка);
        return Точка;
    }

    //---------------------------------------------------------------------

    public  Прямоугольник ПрямКлиента()
    {
        Прямоугольник прям;
        wxWindow_GetClientRect(wxobj, прям);
        return прям;
    }

    //---------------------------------------------------------------------

    public  Размер НастроенныйЛучшийРазм()
    {
        Размер Размер;
        wxWindow_GetAdjustedBestSize(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public  проц Центр()
    {
        Центрируй( Ориентация.wxBOTH );
    }

    public  проц Центрируй()
    {
        Центрируй( Ориентация.wxBOTH );
    }

    public  проц Центр(цел направление)
    {
        Центрируй( направление );
    }

    public  проц Центрируй(цел направление)
    {
        wxWindow_Center(wxobj, направление);
    }

    public  проц ЦентрНаЭкране()
    {
        ЦентрируйНаЭкране( Ориентация.wxBOTH );
    }

    public  проц ЦентрируйНаЭкране()
    {
        ЦентрируйНаЭкране( Ориентация.wxBOTH );
    }

    public  проц ЦентрНаЭкране(цел направление)
    {
        ЦентрируйНаЭкране( направление );
    }

    public  проц ЦентрируйНаЭкране(цел направление)
    {
        wxWindow_CenterOnScreen(wxobj, направление);
    }

    public  проц ЦентрНаРодителе()
    {
        ЦентрируйНаРодителе( Ориентация.wxBOTH );
    }

    public  проц ЦентрируйНаРодителе()
    {
        ЦентрируйНаРодителе( Ориентация.wxBOTH );
    }

    public  проц ЦентрНаРодителе(цел направление)
    {
        ЦентрируйНаРодителе( направление );
    }

    public  проц ЦентрируйНаРодителе(цел направление)
    {
        wxWindow_CenterOnParent(wxobj, направление);
    }

    //---------------------------------------------------------------------

    public  проц Встрой()
    {
        wxWindow_Fit(wxobj);
    }

    public  проц ВстройВнутрь()
    {
        wxWindow_FitInside(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц УстРазмПодсказ(цел minW, цел minH)
    {
        УстРазмПодсказ(minW, minH, -1, -1, -1, -1);
    }

    public  проц УстРазмПодсказ(цел minW, цел minH, цел maxW, цел maxH)
    {
        УстРазмПодсказ(minW, minH, maxW, maxH, -1, -1);
    }

    public  проц УстРазмПодсказ(цел minW, цел minH, цел maxW, цел maxH, цел incW, цел incH)
    {
        wxWindow_SetSizeHints(wxobj, minW, minH, maxW, maxH, incW, incH);
    }

    public  проц УстВиртуалРазмПодсказ(цел minW, цел minH, цел maxW, цел maxH)
    {
        wxWindow_SetVirtualSizeHints(wxobj, minW, minH, maxW, maxH);
    }

    //---------------------------------------------------------------------

    public  цел МинШирь()
    {
        return wxWindow_GetMinWidth(wxobj);
    }

    public  цел МинВысь()
    {
        return wxWindow_GetMinHeight(wxobj);
    }

    public  цел МаксШирь()
    {
        return wxWindow_GetMaxWidth(wxobj);
    }

    public  цел МаксВысь()
    {
        return wxWindow_GetMaxHeight(wxobj);
    }

    //---------------------------------------------------------------------

    public  Размер МинРазм()
    {
        Размер Размер;
        wxWindow_GetMinSize(wxobj, Размер);
        return Размер;
    }

    public проц МинРазм(Размер Размер)
    {
        wxWindow_SetMinSize(wxobj, &Размер);
    }

    public  Размер МаксРазм()
    {
        Размер Размер;
        wxWindow_GetMaxSize(wxobj, Размер);
        return Размер;
    }

    public проц МаксРазм(Размер Размер)
    {
        wxWindow_SetMaxSize(wxobj, &Размер);
    }

    //---------------------------------------------------------------------

    public  Размер ВиртуалРазм()
    {
        Размер Размер;
        wxWindow_GetVirtualSize(wxobj, Размер);
        return Размер;
    }
    public  проц  ВиртуалРазм(Размер значение)
    {
        wxWindow_SetVirtualSize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public  Размер ЛучшийВиртуалРазм()
    {
        Размер Размер;
        wxWindow_GetBestVirtualSize(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public  бул Спрячь()
    {
        return wxWindow_Hide(wxobj);
    }

    public  бул Отключи()
    {
        return wxWindow_Disable(wxobj);
    }

    public  бул Виден()
    {
        return wxWindow_IsShown(wxobj);
    }

    //---------------------------------------------------------------------

    public  цел СтильОкна()
    {
        return wxWindow_GetWindowStyle(wxobj);
    }
    public  проц СтильОкна(бцел значение)
    {
        wxWindow_SetWindowStyle(wxobj, значение);
    }

    public  бул ЕстьФлаг(цел flag)
    {
        return wxWindow_HasFlag(wxobj, flag);
    }

    //---------------------------------------------------------------------

    public  бул IsRetained()
    {
        return wxWindow_IsRetained(wxobj);
    }

    //---------------------------------------------------------------------

    public  цел ЭкстраСтиль()
    {
        return wxWindow_GetExtraStyle(wxobj);
    }
    public  проц ЭкстраСтиль(бцел значение)
    {
        wxWindow_SetExtraStyle(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц СделайМодал(бул значение)
    {
        wxWindow_MakeModal(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул ТемаАктивна()
    {
        return wxWindow_GetThemeEnabled(wxobj);
    }
    public проц ТемаАктивна(бул значение)
    {
        wxWindow_SetThemeEnabled(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public  проц УстФокус()
    {
        wxWindow_SetFocus(wxobj);
    }

    public  проц УстФокусПоКлв()
    {
        wxWindow_SetFocusFromKbd(wxobj);
    }

    public static Окно НайдиФокус()
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindFocus());
    }

    //---------------------------------------------------------------------

    public  бул фокусируем()
    {
        return wxWindow_AcceptsFocus(wxobj);
    }

    public  бул фокусируемПоКлавиатуре()
    {
        return wxWindow_AcceptsFocusFromKeyboard(wxobj);
    }

    //---------------------------------------------------------------------

    public  Окно родитель()
    {
        return cast(Окно)НайдиОбъект(wxWindow_GetParent(wxobj));
    }
    public  проц родитель(Окно значение)
    {
        wxWindow_SetParent(wxobj, wxObject.SafePtr(значение));
    }

    public  Окно ПраРодитель()
    {
        return cast(Окно)НайдиОбъект(wxWindow_GetGrandParent(wxobj));
    }

    public  бул Reparent(Окно newParent)
    {
        return wxWindow_Reparent(wxobj, wxObject.SafePtr(newParent));
    }

    //---------------------------------------------------------------------

    public  бул ВерхнеУровневое()
    {
        return wxWindow_IsTopLevel(wxobj);
    }
    //---------------------------------------------------------------------

    public  проц ДобавьОтпрыск(Окно child)
    {
        wxWindow_AddChild(wxobj, wxObject.SafePtr(child));
    }

    public  проц УдалиОтпрыск(Окно child)
    {
        wxWindow_RemoveChild(wxobj, wxObject.SafePtr(child));
    }

    //---------------------------------------------------------------------

    public  Окно НайдиОкно(цел ид)
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindWindowId(wxobj, ид));
    }

    public  Окно НайдиОкно(цел ид, newfunc func)
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindWindowId(wxobj, ид), func);
    }

    public  Окно НайдиОкно(ткст имя)
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindWindowName(wxobj, имя));
    }

    //---------------------------------------------------------------------

    public static Окно НайдиОкноПоИд(цел ид, Окно родитель)
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindWindowById(ид, wxObject.SafePtr(родитель)));
    }

    public static Окно НайдиОкноПоИмени(ткст имя, Окно родитель)
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindWindowByName(имя, wxObject.SafePtr(родитель)));
    }

    public static Окно НайдиОкноПоЯрлыку(ткст ярлык, Окно родитель)
    {
        return cast(Окно)НайдиОбъект(wxWindow_FindWindowByLabel(ярлык, wxObject.SafePtr(родитель)));
    }

    //---------------------------------------------------------------------

    public ОбработчикСоб ОбработчикСобытий()
    {
        ЦелУкз ptr = wxWindow_GetEventHandler(wxobj);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(ОбработчикСоб)o;
        else return new ОбработчикСоб(ptr);
        //	return cast(ОбработчикСоб)НайдиОбъект(wxWindow_GetEventHandler(wxobj),&ОбработчикСоб.Нов);
    }
    public проц ОбработчикСобытий(ОбработчикСоб значение)
    {
        wxWindow_SetEventHandler(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public проц СуньОбрСоб(ОбработчикСоб обработчик)
    {
        wxWindow_PushEventHandler(wxobj, wxObject.SafePtr(обработчик));
    }

    public ОбработчикСоб ВыньОбрСоб(бул удалиОбраб)
    {
        ЦелУкз ptr = wxWindow_PopEventHandler(wxobj, удалиОбраб);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(ОбработчикСоб)o;
        else return new ОбработчикСоб(ptr);
        //	return cast(ОбработчикСоб)НайдиОбъект(wxWindow_PopEventHandler(wxobj, удалиОбраб),&ОбработчикСоб.Нов);
    }

    public бул УдалиОбрСоб(ОбработчикСоб обработчик)
    {
        return wxWindow_RemoveEventHandler(wxobj, wxObject.SafePtr(обработчик));
    }

    //---------------------------------------------------------------------

    public  Оценщик оценщик()
    {
        return cast(Оценщик)НайдиОбъект(wxWindow_GetValidator(wxobj));
    }
    public  проц оценщик(Оценщик значение)
    {
        wxWindow_SetValidator(wxobj, wxObject.SafePtr(значение));
    }

    public  бул Оцени()
    {
        return wxWindow_Validate(wxobj);
    }

    //---------------------------------------------------------------------

    public  бул ПередайДанныеОкну()
    {
        //return wxWindow_TransferDataToWindow(wxobj);
        return да;
    }

    public  бул ПередайДанныеОтОкна()
    {
        //return wxWindow_TransferDataFromWindow(wxobj);
        return да;
    }

    //---------------------------------------------------------------------

    public  проц ИницДиалог()
    {
        wxWindow_InitDialog(wxobj);
    }

    //---------------------------------------------------------------------

    public  Точка ПреобразуйПикселиВДиалог(Точка тчк)
    {
        Точка Точка;
        wxWindow_ConvertPixelsToDialogPoint(wxobj, тчк, Точка);
        return Точка;
    }

    public  Точка ПреобразуйДиалогВПиксели(Точка тчк)
    {
        Точка Точка;
        wxWindow_ConvertDialogToPixelsPoint(wxobj, тчк, Точка);
        return Точка;
    }

    public  Размер ПреобразуйПикселиВДиалог(Размер рм)
    {
        Размер Размер;
        wxWindow_ConvertPixelsToDialogSize(wxobj, рм, Размер);
        return Размер;
    }

    public  Размер ПреобразуйДиалогВПиксели(Размер рм)
    {
        Размер Размер;
        wxWindow_ConvertPixelsToDialogSize(wxobj, рм, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public  проц WarpPointer(цел x, цел y)
    {
        wxWindow_WarpPointer(wxobj, x, y);
    }

    public  проц ЗахватиМышь()
    {
        wxWindow_CaptureMouse(wxobj);
    }

    public  проц ОтпустиМышь()
    {
        wxWindow_ReleaseMouse(wxobj);
    }

    public static Окно ПолучиЗахват()
    {
        return cast(Окно)НайдиОбъект(wxWindow_GetCapture());
    }

    public  бул ЕстьЗахват()
    {
        return wxWindow_HasCapture(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц Освежи()
    {
        Освежи(да, ПрямКлиента);
    }

    public  проц Освежи(бул eraseBackground)
    {
        Освежи(eraseBackground, ПрямКлиента);
    }

    public  проц Освежи(бул eraseBackground, Прямоугольник прям)
    {
        wxWindow_Refresh(wxobj, eraseBackground, прям);
    }

    public  проц ОсвежиПрямоугольник(Прямоугольник прям)
    {
        wxWindow_RefreshRect(wxobj, прям);
    }

    //---------------------------------------------------------------------

    public  проц Обнови()
    {
        wxWindow_Update(wxobj);
    }

    public  проц ОчистьФон()
    {
        wxWindow_ClearBackground(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц Заморозь()
    {
        wxWindow_Freeze(wxobj);
    }

    public  проц Оттай()
    {
        wxWindow_Thaw(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц ПодготовьКР(DC dc)
    {
        wxWindow_PrepareDC(wxobj, wxObject.SafePtr(dc));
    }

    //---------------------------------------------------------------------

    public  бул  Выставлен(цел x, цел y, цел w, цел h)
    {
        return wxWindow_IsExposed(wxobj, x, y, w, h);
    }

    //---------------------------------------------------------------------

    public  Каретка каретка()
    {
        return cast(Каретка)НайдиОбъект(wxWindow_GetCaret(wxobj),&Каретка.Нов);
    }
    public  проц каретка(Каретка значение)
    {
        wxWindow_SetCaret(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public  цел ВысьСим()
    {
        return wxWindow_GetCharHeight(wxobj);
    }

    public  цел ШирьСим()
    {
        return wxWindow_GetCharWidth(wxobj);
    }

    //---------------------------------------------------------------------

    public проц ДайПротяженностьТекста(ткст стр, out цел x, out цел y, out цел descent,
                              out цел внешнееВступление, Шрифт шрифт)
    {
        wxWindow_GetTextExtent(wxobj, стр, x, y, descent,
                               внешнееВступление, wxObject.SafePtr(шрифт));
    }

    //---------------------------------------------------------------------

    public проц КлиентКЭкрану(inout цел x, inout цел y)
    {
        wxWindow_ClientToScreen(wxobj, x, y);
    }

    public Точка КлиентКЭкрану(Точка точкаКлиента)
    {
        Точка точкаЭкрана;
        wxWindow_ClientToScreen(wxobj, точкаКлиента, точкаЭкрана);
        return точкаЭкрана;
    }

    public  проц ЭкранККлиенту(inout цел x, inout цел y)
    {
        wxWindow_ScreenToClient(wxobj, x, y);
    }

    public Точка ЭкранККлиенту(Точка точкаЭкрана)
    {
        Точка точкаКлиента;
        wxWindow_ScreenToClient(wxobj, точкаЭкрана, точкаКлиента);
        return точкаКлиента;
    }

    //---------------------------------------------------------------------

    public  проц ОбновиИПОкна()
    {
        wxWindow_UpdateWindowUI(wxobj);
    }

    //---------------------------------------------------------------------

    public  бул ВсплывающееМеню(Меню меню, Точка поз)
    {
        бул tmpbool = wxWindow_PopupMenu(wxobj, wxObject.SafePtr(меню), поз);

        меню.ConnectEvents(this);

        return tmpbool;
    }

    //---------------------------------------------------------------------

    public  бул ЕстьСкроллбар(цел ориент)
    {
        return wxWindow_HasScrollbar(wxobj, ориент);
    }

    public  проц УстСкроллбар(цел ориент, цел поз, цел размТумб, цел диапазон, бул освежи)
    {
        wxWindow_SetScrollbar(wxobj, ориент, поз, размТумб, диапазон, освежи);
    }

    public  проц УстПозПрокр(цел ориент, цел поз, бул освежи)
    {
        wxWindow_SetScrollPos(wxobj, ориент, поз, освежи);
    }

    //---------------------------------------------------------------------

    public  цел ДайПозПрокр(цел ориент)
    {
        return wxWindow_GetScrollPos(wxobj, ориент);
    }

    public  цел ДайПрокрТумб(цел ориент)
    {
        return wxWindow_GetScrollThumb(wxobj, ориент);
    }

    public  цел ДайПрокрДиапазон(цел ориент)
    {
        return wxWindow_GetScrollRange(wxobj, ориент);
    }

    //---------------------------------------------------------------------

    public  проц ПрокрутиОкно(цел dx, цел dy, Прямоугольник прям)
    {
        wxWindow_ScrollWindow(wxobj, dx, dy, прям);
    }

    public  бул ПрокрутиСтроки(цел строки)
    {
        return wxWindow_ScrollLines(wxobj, строки);
    }

    public  бул ПрокрутиСтраницы(цел страницы)
    {
        return wxWindow_ScrollPages(wxobj, страницы);
    }

    //---------------------------------------------------------------------

    public  бул СтрокаВыше()
    {
        return wxWindow_LineUp(wxobj);
    }

    public  бул СтрокаНиже()
    {
        return wxWindow_LineDown(wxobj);
    }

    public  бул СтраницаВыше()
    {
        return wxWindow_PageUp(wxobj);
    }

    public  бул СтраницаНиже()
    {
        return wxWindow_PageDown(wxobj);
    }

    //---------------------------------------------------------------------

    public  ткст ТекстСправки()
    {
        return cast(ткст) new wxString(wxWindow_GetHelpText(wxobj), да);
    }
    public  проц ТекстСправки(ткст значение)
    {
        wxWindow_SetHelpText(wxobj, значение);
    }

    public  проц УстТекстСправкиДляИд(ткст текст)
    {
        wxWindow_SetHelpTextForId(wxobj, текст);
    }

    //---------------------------------------------------------------------
    /+FIXME
    public  МишеньСброса мишеньСброса()
    {
        return cast(МишеньСброса)НайдиОбъект(wxWindow_GetDropTarget(wxobj),&МишеньСброса.Нов);
    }
    +/
    public  проц мишеньСброса(МишеньСброса значение)
    {
        wxWindow_SetDropTarget(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    // LayoutConstraints are now depreciated.  Should this be implemented?
    /*public LayoutContraints Constraints
    {
    	get
    	{
    		return new LayoutConstraints(wxWindow_GetConstraints(wxobj));
    	}
    	set
    	{
    		wxWindow_SetConstraints(wxobj, wxObject.SafePtr(значение));
    	}
    }*/

    //---------------------------------------------------------------------

    public  бул АвтоРаскладка()
    {
        return wxWindow_GetAutoLayout(wxobj);
    }
    public  проц АвтоРаскладка(бул значение)
    {
        wxWindow_SetAutoLayout(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public  проц УстСайзерИВстрой(Сайзер сайзер, бул удалитьСтар)
    {
        wxWindow_SetSizerAndFit(wxobj, wxObject.SafePtr(сайзер), удалитьСтар);
    }

    //---------------------------------------------------------------------

    public  Сайзер сайзер()
    {
        return cast(Сайзер)НайдиОбъект(wxWindow_GetSizer(wxobj));
    }
    public  проц  сайзер(Сайзер значение)
    {
        УстСайзер(значение, да);
    }

    //---------------------------------------------------------------------

    public  Сайзер ВключающийСайзер()
    {
        return cast(Сайзер)НайдиОбъект(wxWindow_GetContainingSizer(wxobj));
    }
    public  проц  ВключающийСайзер(Сайзер значение)
    {
        wxWindow_SetContainingSizer(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public  Палитра палитра()
    {
        return new Палитра(wxWindow_GetPalette(wxobj));
    }
    public  проц палитра(Палитра значение)
    {
        wxWindow_SetPalette(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public  бул ОсобаяПалитра()
    {
        return wxWindow_HasCustomPalette(wxobj);
    }

    //---------------------------------------------------------------------

    public  Регион ОбновиРегион()
    {
        return new Регион(wxWindow_GetUpdateRegion(wxobj));
    }

    //---------------------------------------------------------------------

    // Implement very common System.Windows.Forms.Control members

    public  цел Верх()
    {
        return this.Позиция.Y;
    }
    public  проц Верх(цел значение)
    {
        this.Сдвинь(this.Позиция.X, значение,	0);
    }

    public  цел Лево()
    {
        return this.Позиция.X;
    }
    public  проц Лево(цел значение)
    {
        this.Сдвинь(значение, this.Позиция.Y,	0);
    }

    public  цел Право()
    {
        return this.Позиция.X + this.размер.Ширь;
    }
    public  проц Право( цел значение)
    {
        this.Сдвинь(значение -	this.размер.Ширь, this.Позиция.Y, 0);
    }

    public  цел Низ()
    {
        return this.Позиция.Y + this.размер.Высь;
    }
    public  проц Низ(цел значение)
    {
        this.Сдвинь(this.Позиция.X, значение - this.размер.Высь, 0);
    }

    public  цел Ширь()
    {
        return this.размер.Ширь;
    }
    public  проц Ширь(цел значение)
    {
        Размер размер;
        размер.Ширь = значение;
        размер.Высь = this.размер.Высь;
        this.размер = размер;
    }

    public  цел Высь()
    {
        return this.размер.Высь;
    }
    public  проц Высь(цел значение)
    {
        Размер размер;
        размер.Ширь = this.размер.Ширь;
        размер.Высь = значение;
        this.размер = размер;
    }

    //---------------------------------------------------------------------

    public ПВариантОкна вариантОкна()
    {
        return cast(ПВариантОкна)wxWindow_GetWindowVariant(wxobj);
    }
    //---------------------------------------------------------------------

    public бул Удаляется()
    {
        return wxWindow_IsBeingDeleted(wxobj);
    }

    //---------------------------------------------------------------------

    public проц ЛучшийРазмКэша(Размер размер)
    {
        wxWindow_CacheBestSize(wxobj, размер);
    }

    //---------------------------------------------------------------------

    public проц ИнвалидируйЛучшийРазм()
    {
        wxWindow_InvalidateBestSize(wxobj);
    }

    //---------------------------------------------------------------------

    public Размер ЛучшийРазмСовмещения()
    {
        Размер размер;
        wxWindow_GetBestFittingSize(wxobj, размер);
        return размер;
    }
    public проц ЛучшийРазмСовмещения(Размер значение)
    {
        wxWindow_SetBestFittingSize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Окно[] Отпрыски()
    {
        цел count = wxWindow_GetChildrenCount(wxobj);
        Окно[] ret = new Окно[count];
        for (цел чис = 0; чис < count; чис++)
        {
            ret[чис] = cast(Окно)НайдиОбъект(wxWindow_GetChildren(wxobj, чис));
        }
        return ret;
    }

    //---------------------------------------------------------------------

    public ТаблицаАкселераторов табАкселераторов()
    {
        return cast(ТаблицаАкселераторов)НайдиОбъект(wxWindow_GetAcceleratorTable(wxobj),&ТаблицаАкселераторов.Нов);
    }
    //---------------------------------------------------------------------

    public  ВизАтрибуты ДефАтры()
    {
        return new ВизАтрибуты(wxWindow_GetDefaultAttributes(wxobj), да);
    }

    //---------------------------------------------------------------------

    public static ВизАтрибуты ДефАтрыКласса()
    {
        return ДефАтрыКласса(ПВариантОкна.НОРМАЛЬНЫЙ);
    }

    public static ВизАтрибуты ДефАтрыКласса(ПВариантОкна вариант)
    {
        return new ВизАтрибуты(wxWindow_GetClassDefaultAttributes(cast(цел)вариант), да);
    }

    //---------------------------------------------------------------------

    public  ПСтильФона стильФона()
    {
        return cast(ПСтильФона)wxWindow_GetBackgroundStyle(wxobj);
    }
    public  проц стильФона(ПСтильФона значение)
    {
        wxWindow_SetBackgroundStyle(wxobj, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    public ПБордюр бордюр()
    {
        return cast(ПБордюр)wxWindow_GetBorder(wxobj);
    }
    public ПБордюр БордюрПоФлагам(бцел флаги)
    {
        return cast(ПБордюр)wxWindow_GetBorderByФлаги(wxobj, флаги);
    }

    //---------------------------------------------------------------------

    // TODO Not available in OS X
    /*
    public ткст ToolTipText() { return cast(ткст) new wxString(wxWindow_GetToolTipText(wxobj), да); }                */

    //---------------------------------------------------------------------

    public Окно ПредокСОсобойПалитрой()
    {
        return cast(Окно)НайдиОбъект(wxWindow_GetAncestorWithCustomPalette(wxobj),&Окно.Нов);
    }
    //---------------------------------------------------------------------

    public  проц НаследуйАтрибуты()
    {
        wxWindow_InheritAttributes(wxobj);
    }

    //---------------------------------------------------------------------

    public  бул НаследоватьЦвета()
    {
        return wxWindow_ShouldInheritColours(wxobj);
    }

    //---------------------------------------------------------------------

    public проц LeftUp_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_LEFT_UP, ИД, значение, this);
    }
    public проц LeftUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц RightUp_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_RIGHT_UP, ИД, значение, this);
    }
    public проц RightUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MiddleUp_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_MIDDLE_UP, ИД, значение, this);
    }
    public проц MiddleUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц LeftDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_LEFT_DOWN, ИД, значение, this);
    }
    public проц LeftDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MiddleDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_MIDDLE_DOWN, ИД, значение, this);
    }
    public проц MiddleDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц RightDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_RIGHT_DOWN, ИД, значение, this);
    }
    public проц RightDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц LeftDoubleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_LEFT_DCLICK, ИД, значение, this);
    }
    public проц LeftDoubleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц RightDoubleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_RIGHT_DCLICK, ИД, значение, this);
    }
    public проц RightDoubleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MiddleDoubleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_MIDDLE_DCLICK, ИД, значение, this);
    }
    public проц MiddleDoubleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MouseMove_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_MOTION, ИД, значение, this);
    }
    public проц MouseMove_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MouseThumbTrack_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_SCROLL_THUMBTRACK, ИД, значение, this);
    }
    public проц MouseThumbTrack_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MouseEnter_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_ENTER_WINDOW, ИД, значение, this);
    }
    public проц MouseEnter_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MouseLeave_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_LEAVE_WINDOW, ИД, значение, this);
    }
    public проц MouseLeave_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ScrollLineUp_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_SCROLL_LINEUP, ИД, значение, this);
    }
    public проц ScrollLineUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц ScrollLineDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_SCROLL_LINEDOWN, ИД, значение, this);
    }
    public проц ScrollLineDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц UpdateUI_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_UPDATE_UI, ИД, значение, this);
    }
    public проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц KeyDown_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_KEY_DOWN, ИД, значение, this);
    }
    public проц KeyDown_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц KeyUp_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_KEY_UP, ИД, значение, this);
    }
    public проц KeyUp_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц Char_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CHAR, ИД, значение, this);
    }
    public проц Char_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц Closing_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CLOSE_WINDOW, ИД, значение, this);
    }
    public проц Closing_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц Activated_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_ACTIVATE, ИД, значение, this);
    }
    public проц Activated_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц Moved_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_MOVE, ИД, значение, this);
    }
    public проц Moved_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц Resized_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_SIZE, ИД, значение, this);
    }
    public проц Resized_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

