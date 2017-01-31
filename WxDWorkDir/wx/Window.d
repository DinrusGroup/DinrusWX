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

	public enum WindowVariant
	{
		wxWINDOW_VARIANT_NORMAL,  // Normal size
		wxWINDOW_VARIANT_SMALL,   // Smaller size (about 25 % smaller than normal)
		wxWINDOW_VARIANT_MINI,    // Mini size (about 33 % smaller than normal)
		wxWINDOW_VARIANT_LARGE,   // Large size (about 25 % larger than normal)
		wxWINDOW_VARIANT_MAX
	};	
	
	//---------------------------------------------------------------------
	
	public enum BackgroundStyle
	{
		wxBG_STYLE_SYSTEM,
		wxBG_STYLE_COLOUR,
		wxBG_STYLE_CUSTOM
	};
	
	//---------------------------------------------------------------------
	
	public enum Border
	{
		wxBORDER_DEFAULT = 0,

		wxBORDER_NONE   = 0x00200000,
		wxBORDER_STATIC = 0x01000000,
		wxBORDER_SIMPLE = 0x02000000,
		wxBORDER_RAISED = 0x04000000,
		wxBORDER_SUNKEN = 0x08000000,
		wxBORDER_DOUBLE = 0x10000000,

		wxBORDER_MASK   = 0x1f200000,
		
		wxDOUBLE_BORDER   = wxBORDER_DOUBLE,
		wxSUNKEN_BORDER   = wxBORDER_SUNKEN,
		wxRAISED_BORDER   = wxBORDER_RAISED,
		wxBORDER          = wxBORDER_SIMPLE,
		wxSIMPLE_BORDER   = wxBORDER_SIMPLE,
		wxSTATIC_BORDER   = wxBORDER_STATIC,
		wxNO_BORDER       = wxBORDER_NONE
	};
	
		//! \cond EXTERN
		static extern (C) ЦУк wxVisualAttributes_ctor();
		static extern (C) проц   wxVisualAttributes_dtor(ЦУк сам);
		static extern (C) проц   wxVisualAttributes_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxVisualAttributes_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) ЦУк wxVisualAttributes_GetFont(ЦУк сам);
		static extern (C) проц   wxVisualAttributes_SetColourFg(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxVisualAttributes_GetColourFg(ЦУк сам);
		static extern (C) проц   wxVisualAttributes_SetColourBg(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxVisualAttributes_GetColourBg(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias ВизАтры wxVisualAttributes;
	public class ВизАтры : wxObject
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
			this(wxVisualAttributes_ctor(), да);
			wxVisualAttributes_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		//---------------------------------------------------------------------

		public Шрифт шрифт() { return new Шрифт(wxVisualAttributes_GetFont(шхобъ), да); }
		public проц шрифт(Шрифт значение) { wxVisualAttributes_SetFont(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public Цвет цветПП() { return new Цвет(wxVisualAttributes_GetColourFg(шхобъ), да); }		
		//---------------------------------------------------------------------
		
		public Цвет цветЗП() { return new Цвет(wxVisualAttributes_GetColourBg(шхобъ), да); }		
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxVisualAttributes_dtor(шхобъ); }
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxWindow_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) бул   wxWindow_Close(ЦУк сам, бул force);
		static extern (C) проц   wxWindow_GetBestSize(ЦУк сам, out Размер size);
		static extern (C) проц   wxWindow_GetClientSize(ЦУк сам, out Размер size);
		static extern (C) цел    wxWindow_GetId(ЦУк сам);
		static extern (C) бцел   wxWindow_GetWindowStyleFlag(ЦУк сам);
		static extern (C) бцел   wxWindow_Layout(ЦУк сам);
		static extern (C) проц   wxWindow_SetAutoLayout(ЦУк сам, бул autoLayout);
		static extern (C) проц   wxWindow_SetBackgroundColour(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxWindow_GetBackgroundColour(ЦУк сам);
		static extern (C) проц   wxWindow_SetForegroundColour(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxWindow_GetForegroundColour(ЦУк сам);
		static extern (C) проц   wxWindow_SetCursor(ЦУк сам, ЦУк cursor);
		static extern (C) проц   wxWindow_SetId(ЦУк сам, цел ид);
		static extern (C) проц   wxWindow_SetSize(ЦУк сам, цел x, цел y, цел ширина, цел высота, бцел флаги);
		static extern (C) проц   wxWindow_SetSize2(ЦУк сам, цел ширина, цел высота);
		static extern (C) проц   wxWindow_SetSize3(ЦУк сам, inout Размер size);
		static extern (C) проц   wxWindow_SetSize4(ЦУк сам, inout Прямоугольник прям);
		static extern (C) проц   wxWindow_SetSizer(ЦУк сам, ЦУк sizer, бул deleteOld);
		static extern (C) проц   wxWindow_SetWindowStyleFlag(ЦУк сам, бцел стиль);
		static extern (C) бул   wxWindow_Show(ЦУк сам, бул show);
		static extern (C) бул   wxWindow_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) ЦУк wxWindow_GetFont(ЦУк сам);
		static extern (C) проц   wxWindow_SetToolTip(ЦУк сам, ткст tip);
		static extern (C) бул 	 wxWindow_Enable(ЦУк сам, бул enable);
		static extern (C) бул   wxWindow_IsEnabled(ЦУк сам);

		static extern (C) цел    wxWindow_EVT_TRANSFERDATAFROMWINDOW();
		static extern (C) цел    wxWindow_EVT_TRANSFERDATATOWINDOW();

		//static extern (C) бул wxWindow_LoadFromResource(ЦУк сам, ЦУк родитель, ткст resourceName, ЦУк table);
		//static extern (C) ЦУк wxWindow_CreateItem(ЦУк сам, ЦУк childResource, ЦУк parentResource, ЦУк table);
		static extern (C) бул   wxWindow_Destroy(ЦУк сам);
		static extern (C) бул   wxWindow_DestroyChildren(ЦУк сам);
		static extern (C) проц   wxWindow_SetTitle(ЦУк сам, ткст title);
		static extern (C) ЦУк wxWindow_GetTitle(ЦУк сам);
		static extern (C) проц   wxWindow_SetName(ЦУк сам, ткст имя);
		static extern (C) ЦУк wxWindow_GetName(ЦУк сам);
		static extern (C) цел    wxWindow_NewControlId();
		static extern (C) цел    wxWindow_NextControlId(цел ид);
		static extern (C) цел    wxWindow_PrevControlId(цел ид);
		static extern (C) проц   wxWindow_Move(ЦУк сам, цел x, цел y, цел флаги);
		static extern (C) проц   wxWindow_Raise(ЦУк сам);
		static extern (C) проц   wxWindow_Lower(ЦУк сам);
		static extern (C) проц   wxWindow_SetClientSize(ЦУк сам, цел ширина, цел высота);
		static extern (C) проц   wxWindow_GetPosition(ЦУк сам, out Точка point);
		static extern (C) проц   wxWindow_GetSize(ЦУк сам, out Размер size);
		static extern (C) проц   wxWindow_GetRect(ЦУк сам, out Прямоугольник прям);
		static extern (C) проц   wxWindow_GetClientAreaOrigin(ЦУк сам, out Точка point);
		static extern (C) проц   wxWindow_GetClientRect(ЦУк сам, out Прямоугольник прям);
		static extern (C) проц   wxWindow_GetAdjustedBestSize(ЦУк сам, out Размер size);
		static extern (C) проц   wxWindow_Center(ЦУк сам, цел direction);
		static extern (C) проц   wxWindow_CenterOnScreen(ЦУк сам, цел dir);
		static extern (C) проц   wxWindow_CenterOnParent(ЦУк сам, цел dir);
		static extern (C) проц   wxWindow_Fit(ЦУк сам);
		static extern (C) проц   wxWindow_FitInside(ЦУк сам);
		static extern (C) проц   wxWindow_SetSizeHints(ЦУк сам, цел minW, цел minH, цел maxW, цел maxH, цел incW, цел incH);
	//	static extern (C) проц   wxWindow_SetVirtualSizeHints(ЦУк сам, цел minW, цел minH, цел maxW, цел maxH);
		static extern (C) цел    wxWindow_GetMinWidth(ЦУк сам);
		static extern (C) цел    wxWindow_GetMinHeight(ЦУк сам);
		static extern (C) проц   wxWindow_GetMinSize(ЦУк сам, out Размер size);
		static extern (C) проц   wxWindow_SetMinSize(ЦУк сам, Размер* size);
		static extern (C) цел    wxWindow_GetMaxWidth(ЦУк сам);
		static extern (C) цел    wxWindow_GetMaxHeight(ЦУк сам);
		static extern (C) проц   wxWindow_GetMaxSize(ЦУк сам, out Размер size);
		static extern (C) проц   wxWindow_SetMaxSize(ЦУк сам, Размер* size);
		static extern (C) проц   wxWindow_SetVirtualSize(ЦУк сам, inout Размер size);
		static extern (C) проц   wxWindow_GetVirtualSize(ЦУк сам, out Размер size);
		static extern (C) проц   wxWindow_GetBestVirtualSize(ЦУк сам, out Размер size);
		static extern (C) бул   wxWindow_Hide(ЦУк сам);
		static extern (C) бул   wxWindow_Disable(ЦУк сам);
		static extern (C) бул   wxWindow_IsShown(ЦУк сам);
		static extern (C) проц   wxWindow_SetWindowStyle(ЦУк сам, бцел стиль);
		static extern (C) бцел   wxWindow_GetWindowStyle(ЦУк сам);
		static extern (C) бул   wxWindow_HasFlag(ЦУк сам, цел flag);
		static extern (C) бул   wxWindow_IsRetained(ЦУк сам);
		static extern (C) проц   wxWindow_SetExtraStyle(ЦУк сам, бцел exStyle);
		static extern (C) бцел   wxWindow_GetExtraStyle(ЦУк сам);
		//static extern (C) проц   wxWindow_MakeModal(ЦУк сам, бул modal);
		static extern (C) проц   wxWindow_SetThemeEnabled(ЦУк сам, бул enableTheme);
		static extern (C) бул   wxWindow_GetThemeEnabled(ЦУк сам);
		static extern (C) проц   wxWindow_SetFocus(ЦУк сам);
		static extern (C) проц   wxWindow_SetFocusFromKbd(ЦУк сам);
		static extern (C) ЦУк wxWindow_FindFocus();
		static extern (C) бул   wxWindow_AcceptsFocus(ЦУк сам);
		static extern (C) бул   wxWindow_AcceptsFocusFromKeyboard(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetParent(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetGrandParent(ЦУк сам);
		static extern (C) бул   wxWindow_IsTopLevel(ЦУк сам);
		static extern (C) проц   wxWindow_SetParent(ЦУк сам, ЦУк родитель);
		static extern (C) бул   wxWindow_Reparent(ЦУк сам, ЦУк newParent);
		static extern (C) проц   wxWindow_AddChild(ЦУк сам, ЦУк child);
		static extern (C) проц   wxWindow_RemoveChild(ЦУк сам, ЦУк child);
		static extern (C) ЦУк wxWindow_FindWindowId(ЦУк сам, цел ид);
		static extern (C) ЦУк wxWindow_FindWindowName(ЦУк сам, ткст имя);
		static extern (C) ЦУк wxWindow_FindWindowById(цел ид, ЦУк родитель);
		static extern (C) ЦУк wxWindow_FindWindowByName(ткст имя, ЦУк родитель);
		static extern (C) ЦУк wxWindow_FindWindowByLabel(ткст надпись, ЦУк родитель);
		static extern (C) ЦУк wxWindow_GetEventHandler(ЦУк сам);
		static extern (C) проц   wxWindow_SetEventHandler(ЦУк сам, ЦУк handler);
		static extern (C) проц   wxWindow_PushEventHandler(ЦУк сам, ЦУк handler);
		static extern (C) ЦУк wxWindow_PopEventHandler(ЦУк сам, бул deleteHandler);
		static extern (C) бул   wxWindow_RemoveEventHandler(ЦУк сам, ЦУк handler);
		static extern (C) проц   wxWindow_SetValidator(ЦУк сам, ЦУк validator);
		static extern (C) ЦУк wxWindow_GetValidator(ЦУк сам);
		static extern (C) бул   wxWindow_Validate(ЦУк сам);
		static extern (C) бул   wxWindow_TransferDataToWindow(ЦУк сам);
		static extern (C) бул   wxWindow_TransferDataFromWindow(ЦУк сам);
		static extern (C) проц   wxWindow_InitДиалог(ЦУк сам);
		static extern (C) проц   wxWindow_SetAcceleratorTable(ЦУк сам, ЦУк accel);
		static extern (C) ЦУк wxWindow_GetAcceleratorTable(ЦУк сам);
		static extern (C) проц   wxWindow_ConvertPixelsToДиалогPoint(ЦУк сам, inout Точка pt, out Точка point);
		static extern (C) проц   wxWindow_ConvertДиалогToPixelsPoint(ЦУк сам, inout Точка pt, out Точка point);
		static extern (C) проц   wxWindow_ConvertPixelsToДиалогSize(ЦУк сам, inout Размер sz, out Размер size);
		static extern (C) проц   wxWindow_ConvertДиалогToPixelsSize(ЦУк сам, inout Размер sz, out Размер size);
		static extern (C) проц   wxWindow_WarpPointer(ЦУк сам, цел x, цел y);
		static extern (C) проц   wxWindow_CaptureMouse(ЦУк сам);
		static extern (C) проц   wxWindow_ReleaseMouse(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetCapture();
		static extern (C) бул   wxWindow_HasCapture(ЦУк сам);
		static extern (C) проц   wxWindow_Refresh(ЦУк сам, бул eraseBackground, inout Прямоугольник прям);
		static extern (C) проц   wxWindow_RefreshRect(ЦУк сам, inout Прямоугольник прям);
		static extern (C) проц   wxWindow_Update(ЦУк сам);
		static extern (C) проц   wxWindow_ClearBackground(ЦУк сам);
		static extern (C) проц   wxWindow_Freeze(ЦУк сам);
		static extern (C) проц   wxWindow_Thaw(ЦУк сам);
		static extern (C) проц   wxWindow_PrepareDC(ЦУк сам, ЦУк dc);
		static extern (C) бул   wxWindow_IsExposed(ЦУк сам, цел x, цел y, цел w, цел h);
		static extern (C) проц   wxWindow_SetCaret(ЦУк сам, ЦУк caret);
		static extern (C) ЦУк wxWindow_GetCaret(ЦУк сам);
		static extern (C) цел    wxWindow_GetCharHeight(ЦУк сам);
		static extern (C) цел    wxWindow_GetCharWidth(ЦУк сам);
		static extern (C) проц   wxWindow_GetTextExtent(ЦУк сам, ткст str, out цел x, out цел y, out цел descent, out цел externalLeading, ЦУк theFont);
		static extern (C) проц   wxWindow_ClientToScreen(ЦУк сам, inout цел x, inout цел y);
		static extern (C) проц   wxWindow_ScreenToClient(ЦУк сам, inout цел x, inout цел y);
		static extern (C) проц   wxWindow_ClientToScreen(ЦУк сам, inout Точка pt, out Точка point);
		static extern (C) проц   wxWindow_ScreenToClient(ЦУк сам, inout Точка pt, out Точка point);
		//static extern (C) wxHitTest wxWindow_HitTest(ЦУк сам, Coord x, Coord y);
		//static extern (C) wxHitTest wxWindow_HitTest(ЦУк сам, inout Точка pt);
		static extern (C) цел    wxWindow_GetBorder(ЦУк сам);
		static extern (C) цел    wxWindow_GetBorderByFlags(ЦУк сам, бцел флаги);
		static extern (C) проц   wxWindow_UpdateWindowUI(ЦУк сам);
		static extern (C) бул   wxWindow_PopupMenu(ЦУк сам, ЦУк меню, inout Точка поз);
		static extern (C) бул   wxWindow_HasScrollbar(ЦУк сам, цел orient);
		static extern (C) проц   wxWindow_SetScrollbar(ЦУк сам, цел orient, цел поз, цел thumbvisible, цел range, бул refresh);
		static extern (C) проц   wxWindow_SetScrollPos(ЦУк сам, цел orient, цел поз, бул refresh);
		static extern (C) цел    wxWindow_GetScrollPos(ЦУк сам, цел orient);
		static extern (C) цел    wxWindow_GetScrollThumb(ЦУк сам, цел orient);
		static extern (C) цел    wxWindow_GetScrollRange(ЦУк сам, цел orient);
		static extern (C) проц   wxWindow_ScrollWindow(ЦУк сам, цел dx, цел dy, inout Прямоугольник прям);
		static extern (C) бул   wxWindow_ScrollLines(ЦУк сам, цел lines);
		static extern (C) бул   wxWindow_ScrollPages(ЦУк сам, цел pages);
		static extern (C) бул   wxWindow_LineUp(ЦУк сам);
		static extern (C) бул   wxWindow_LineDown(ЦУк сам);
		static extern (C) бул   wxWindow_PageUp(ЦУк сам);
		static extern (C) бул   wxWindow_PageDown(ЦУк сам);
		static extern (C) проц   wxWindow_SetHelpText(ЦУк сам, ткст текст);
		//static extern (C) проц   wxWindow_SetHelpTextForId(ЦУк сам, ткст текст);
		static extern (C) ЦУк wxWindow_GetHelpText(ЦУк сам);
		//static extern (C) проц wxWindow_SetToolTip(ЦУк сам, ЦУк tip);
		//static extern (C) ЦУк wxWindow_GetToolTip(ЦУк сам);
		static extern (C) проц   wxWindow_SetDropTarget(ЦУк сам, ЦУк dropTarget);
		static extern (C) ЦУк wxWindow_GetDropTarget(ЦУк сам);
		static extern (C) проц   wxWindow_SetConstraints(ЦУк сам, ЦУк constraints);
		static extern (C) ЦУк wxWindow_GetConstraints(ЦУк сам);
		static extern (C) бул   wxWindow_GetAutoLayout(ЦУк сам);
		static extern (C) проц   wxWindow_SetSizerAndFit(ЦУк сам, ЦУк sizer, бул deleteOld);
		static extern (C) ЦУк wxWindow_GetSizer(ЦУк сам);
		static extern (C) проц   wxWindow_SetContainingSizer(ЦУк сам, ЦУк sizer);
		static extern (C) ЦУк wxWindow_GetContainingSizer(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetPalette(ЦУк сам);
		static extern (C) проц   wxWindow_SetPalette(ЦУк сам, ЦУк pal);
		static extern (C) бул   wxWindow_HasCustomPalette(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetUpdateRegion(ЦУк сам);
		
		static extern (C) проц   wxWindow_SetWindowVariant(ЦУк сам, цел variant);
		static extern (C) цел    wxWindow_GetWindowVariant(ЦУк сам);
		static extern (C) бул   wxWindow_IsBeingDeleted(ЦУк сам);
		static extern (C) проц   wxWindow_InvalidateBestSize(ЦУк сам);
		static extern (C) проц   wxWindow_CacheBestSize(ЦУк сам, Размер size);
		static extern (C) проц   wxWindow_GetBestFittingSize(ЦУк сам, inout Размер size);
		static extern (C) проц   wxWindow_SetBestFittingSize(ЦУк сам, inout Размер size);
		static extern (C) ЦУк wxWindow_GetChildren(ЦУк сам, цел num);
		static extern (C) цел    wxWindow_GetChildrenCount(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetDefaultAttributes(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetClassDefaultAttributes(цел variant);
		static extern (C) проц   wxWindow_SetBackgroundStyle(ЦУк сам, цел стиль);
		static extern (C) цел    wxWindow_GetBackgroundStyle(ЦУк сам);
		//static extern (C) ЦУк wxWindow_GetToolTipText(ЦУк сам);
		static extern (C) ЦУк wxWindow_GetAncestorWithCustomPalette(ЦУк сам);
		static extern (C) проц   wxWindow_InheritAttributes(ЦУк сам);
		static extern (C) бул   wxWindow_ShouldInheritColours(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias Окно wxWindow;
	/// wxWindow is the base class for all windows and represents any
	/// visible object on screen. All controls, top level windows and so on
	/// are windows. Sizers and device contexts are not, however, as they don't
	/// appear on screen themselves.
	public class Окно : EvtHandler
	{
		enum {
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
	
			wxBORDER_DEFAULT		= 0x00000000,
			wxBORDER_NONE			= 0x00200000,
			wxBORDER_STATIC			= 0x01000000,
			wxBORDER_SIMPLE			= 0x02000000,
			wxBORDER_RAISED			= 0x04000000,
			wxBORDER_SUNKEN			= 0x08000000,
			wxBORDER_DOUBLE			= 0x10000000,
			wxBORDER_MASK			= 0x1f200000,
	
		// Border флаги
			wxDOUBLE_BORDER			= wxBORDER_DOUBLE,
			wxSUNKEN_BORDER			= wxBORDER_SUNKEN,
			wxRAISED_BORDER			= wxBORDER_RAISED,
			wxBORDER			= wxBORDER_SIMPLE,
			wxSIMPLE_BORDER			= wxBORDER_SIMPLE,
			wxSTATIC_BORDER			= wxBORDER_STATIC,
			wxNO_BORDER			= wxBORDER_NONE,
	
			wxWANTS_CHARS			= 0x00040000,
		
			wxDEFAULT_FRAME			= wxSYSTEM_MENU | wxRESIZE_BORDER |
									wxMINIMIZE_BOX | wxMAXIMIZE_BOX | wxCAPTION |
									wxCLIP_CHILDREN | wxCLOSE_BOX,
			wxDEFAULT_FRAME_STYLE		= wxDEFAULT_FRAME,

			wxDEFAULT_DIALOG_STYLE		= wxSYSTEM_MENU | wxCAPTION | wxCLOSE_BOX,
		}

		private static цел uniqueID			= 10000; // start with 10000 to not interfere with the old ид system

		//---------------------------------------------------------------------

		public const Точка wxDefaultPosition = {X:-1, Y:-1};
		public const Размер  wxDefaultSize     = {Ширина:-1, Высота:-1};
		const ткст wxPanelNameStr = "panel";

		//---------------------------------------------------------------------

		public this(Окно родитель, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxPanelNameStr)
			{ this(wxWindow_ctor(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя), 
				нет /*a Окно will always be destroyed by its родитель*/);}
			
		public this(Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxPanelNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}

		public this(ЦУк шхобъ) 
		{
			super(шхобъ);
			AddEventListener(wxWindow_EVT_TRANSFERDATATOWINDOW(), &OnTransferDataToWindow);
			AddEventListener(wxWindow_EVT_TRANSFERDATAFROMWINDOW(), &OnTransferDataFromWindow);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
			
			AddEventListener(wxWindow_EVT_TRANSFERDATATOWINDOW(), &OnTransferDataToWindow);
			AddEventListener(wxWindow_EVT_TRANSFERDATAFROMWINDOW(), &OnTransferDataFromWindow);
		}


		static wxObject Нов(ЦУк ptr) { return new Окно(ptr); }
		//---------------------------------------------------------------------

		public /+virtual+/ проц   ЦветЗП(Цвет значение)
		{
			wxWindow_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение));
		}
		public /+virtual+/ Цвет ЦветЗП()
		{
			return new Цвет(wxWindow_GetBackgroundColour(шхобъ), да);
		}

		public /+virtual+/ Цвет ЦветПП()
		{
			return new Цвет(wxWindow_GetForegroundColour(шхобъ), да);
		}
		public /+virtual+/ проц   ЦветПП(Цвет значение)
		{
			wxWindow_SetForegroundColour(шхобъ, wxObject.SafePtr(значение));
		}

		//---------------------------------------------------------------------

		// Note: was previously defined as WindowFont
		public /+virtual+/ проц шрифт(Шрифт значение)
		{
			wxWindow_SetFont(шхобъ, значение.шхобъ);
		}
		public /+virtual+/ Шрифт шрифт()
		{
			return new Шрифт(wxWindow_GetFont(шхобъ), да);
		}


		//---------------------------------------------------------------------

		public /+virtual+/ Размер BestSize()
		{
			Размер size;
			wxWindow_GetBestSize(шхобъ, size);
			return size;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер ClientSize()
		{
			Размер size;
			wxWindow_GetClientSize(шхобъ, size);
			return size;
		}
		public /+virtual+/ проц ClientSize(Размер значение)
		{
			wxWindow_SetClientSize(шхобъ, значение.Ширина, значение.Высота);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул Закрой()
		{
			return wxWindow_Close(шхобъ, нет);
		}

		public /+virtual+/ бул Закрой(бул force)
		{
			return wxWindow_Close(шхобъ, force);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ цел ИД() { return wxWindow_GetId(шхобъ); }
		public /+virtual+/ проц ИД(цел значение) { wxWindow_SetId(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public static цел UniqueID() { return ++uniqueID; }
		
		//---------------------------------------------------------------------

		public /+virtual+/ проц Layout()
		{
			wxWindow_Layout(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц cursor(Cursor значение)
		{
			wxWindow_SetCursor(шхобъ, wxObject.SafePtr(значение));
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц УстРазм(цел x, цел y, цел ширина, цел высота)
		{
			wxWindow_SetSize(шхобъ, x, y, ширина, высота, 0);
		}
		
		public /+virtual+/ проц УстРазм(цел ширина, цел высота)
		{
			wxWindow_SetSize2(шхобъ, ширина, высота);
		}
		
		public /+virtual+/ проц УстРазм(Размер size)
		{
			wxWindow_SetSize3(шхобъ, size);
		}

		public /+virtual+/ проц УстРазм(Прямоугольник прям)
		{
			wxWindow_SetSize4(шхобъ, прям);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц SetSizer(Sizer sizer, бул deleteOld=да)
		{
			wxWindow_SetSizer(шхобъ, sizer.шхобъ, deleteOld);
		}

		//---------------------------------------------------------------------
		
		public /+virtual+/ бул Show(бул show=да)
		{
			return wxWindow_Show(шхобъ, show);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ цел  StyleFlags()
		{
			return wxWindow_GetWindowStyleFlag(шхобъ);
		}
		public /+virtual+/ проц StyleFlags(бцел значение) 
		{
			wxWindow_SetWindowStyleFlag(шхобъ, значение);
		}

		//---------------------------------------------------------------------

		private проц OnTransferDataFromWindow(Объект sender, Событие e)
		{
			if (!TransferDataFromWindow())
				e.Пропусти();
		}

		//---------------------------------------------------------------------

		private проц OnTransferDataToWindow(Объект sender, Событие e)
		{
			if (!TransferDataToWindow())
				e.Пропусти();
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц toolTip(ткст значение)
		{
			wxWindow_SetToolTip(шхобъ, значение);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Enabled(бул значение)
		{
			wxWindow_Enable(шхобъ, значение);
		}
		public /+virtual+/ бул Enabled()
		{
			return wxWindow_IsEnabled(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул Разрушь()
		{
			return wxWindow_Destroy(шхобъ);
		}

		public /+virtual+/ бул DestroyChildren()
		{
			return wxWindow_DestroyChildren(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц  Title(ткст значение)
		{
			wxWindow_SetTitle(шхобъ, значение);
		}
		public /+virtual+/ ткст Title()
		{
			return cast(ткст) new wxString(wxWindow_GetTitle(шхобъ), да);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Имя(ткст значение)
			{
				wxWindow_SetName(шхобъ, значение);
			}
		public /+virtual+/ ткст Имя()
			{
				return cast(ткст) new wxString(wxWindow_GetName(шхобъ), да);
			}

		//---------------------------------------------------------------------

		public static цел NewControlId()
		{
			return wxWindow_NewControlId();
		}

		public static цел NextControlId(цел ид)
		{
			return wxWindow_NextControlId(ид);
		}

		public static цел PrevControlId(цел ид)
		{
			return wxWindow_PrevControlId(ид);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Move(цел x, цел y, цел флаги)
		{
			wxWindow_Move(шхобъ, x, y, флаги);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Raise()
		{
			wxWindow_Raise(шхобъ);
		}

		public /+virtual+/ проц Lower()
		{
			wxWindow_Lower(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Точка Положение()
			{
				Точка point;
				wxWindow_GetPosition(шхобъ, point);
				return point;
			}
		public /+virtual+/ проц  Положение(Точка значение)
			{
				Move(значение.X, значение.Y, 0);
			}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер size()
			{
				Размер size;
				wxWindow_GetSize(шхобъ, size);
				return size;
			}
		public /+virtual+/ проц size(Размер значение)
			{
				wxWindow_SetSize(шхобъ, Положение.X, Положение.Y,
								 значение.Ширина, значение.Высота, 0);
			}

		//---------------------------------------------------------------------

		public /+virtual+/ Прямоугольник Rect()
		{
				Прямоугольник прям;
				wxWindow_GetRect(шхобъ, прям);
				return прям;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Точка ClientAreaOrigin()
		{
				Точка point;
				wxWindow_GetClientAreaOrigin(шхобъ, point);
				return point;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Прямоугольник ClientRect()
		{
				Прямоугольник прям;
				wxWindow_GetClientRect(шхобъ, прям);
				return прям;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер AdjustedBestSize()
		{
				Размер size;
				wxWindow_GetAdjustedBestSize(шхобъ, size);
				return size;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Centre()
		{ 
			Center( Ориентация.wxBOTH ); 
		}
		
		public /+virtual+/ проц Center()
		{ 
			Center( Ориентация.wxBOTH ); 
		}
		
		public /+virtual+/ проц Centre(цел direction)
		{ 
			Center( direction ); 
		}
		
		public /+virtual+/ проц Center(цел direction)
		{
			wxWindow_Center(шхобъ, direction);
		}

		public /+virtual+/ проц CentreOnScreen()
		{ 
			CenterOnScreen( Ориентация.wxBOTH ); 
		}
		
		public /+virtual+/ проц CenterOnScreen()
		{ 
			CenterOnScreen( Ориентация.wxBOTH ); 
		}
		
		public /+virtual+/ проц CentreOnScreen(цел direction)
		{ 
			CenterOnScreen( direction ); 
		}
		
		public /+virtual+/ проц CenterOnScreen(цел direction)
		{
			wxWindow_CenterOnScreen(шхобъ, direction);
		}

		public /+virtual+/ проц CentreOnParent()
		{ 
			CenterOnParent( Ориентация.wxBOTH ); 
		}
		
		public /+virtual+/ проц CenterOnParent()
		{ 
			CenterOnParent( Ориентация.wxBOTH ); 
		}
		
		public /+virtual+/ проц CentreOnParent(цел direction)
		{ 
			CenterOnParent( direction ); 
		}
		
		public /+virtual+/ проц CenterOnParent(цел direction)
		{
			wxWindow_CenterOnParent(шхобъ, direction);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Fit()
		{
			wxWindow_Fit(шхобъ);
		}

		public /+virtual+/ проц FitInside()
		{
			wxWindow_FitInside(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц SetSizeHints(цел minW, цел minH)
		{ 
			SetSizeHints(minW, minH, -1, -1, -1, -1); 
		}
		
		public /+virtual+/ проц SetSizeHints(цел minW, цел minH, цел maxW, цел maxH)
		{ 
			SetSizeHints(minW, minH, maxW, maxH, -1, -1); 
		}
		
		public /+virtual+/ проц SetSizeHints(цел minW, цел minH, цел maxW, цел maxH, цел incW, цел incH)
		{
			wxWindow_SetSizeHints(шхобъ, minW, minH, maxW, maxH, incW, incH);
		}
/+
		public /+virtual+/ проц SetVirtualSizeHints(цел minW, цел minH, цел maxW, цел maxH)
		{
			wxWindow_SetVirtualSizeHints(шхобъ, minW, minH, maxW, maxH);
		}
+/
		//---------------------------------------------------------------------

		public /+virtual+/ цел MinWidth()
		{
				return wxWindow_GetMinWidth(шхобъ);
		}

		public /+virtual+/ цел MinHeight()
		{
				return wxWindow_GetMinHeight(шхобъ);
		}

		public /+virtual+/ цел MaxWidth()
		{
				return wxWindow_GetMaxWidth(шхобъ);
		}

		public /+virtual+/ цел MaxHeight()
		{
				return wxWindow_GetMaxHeight(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер MinSize()
		{
				Размер size;
				wxWindow_GetMinSize(шхобъ, size);
				return size;
		}

		public проц MinSize(Размер size)
		{
				wxWindow_SetMinSize(шхобъ, &size);
		}

		public /+virtual+/ Размер MaxSize()
		{
				Размер size;
				wxWindow_GetMaxSize(шхобъ, size);
				return size;
		}

		public проц MaxSize(Размер size)
		{
				wxWindow_SetMaxSize(шхобъ, &size);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер VirtualSize()
			{
				Размер size;
				wxWindow_GetVirtualSize(шхобъ, size);
				return size;
			}
		public /+virtual+/ проц  VirtualSize(Размер значение)
			{
				wxWindow_SetVirtualSize(шхобъ, значение);
			}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер BestVirtualSize()
		{
				Размер size;
				wxWindow_GetBestVirtualSize(шхобъ, size);
				return size;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул Hide()
		{
			return wxWindow_Hide(шхобъ);
		}

		public /+virtual+/ бул Disable()
		{
			return wxWindow_Disable(шхобъ);
		}

		public /+virtual+/ бул IsShown()
		{
			return wxWindow_IsShown(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ цел WindowStyle()
			{
				return wxWindow_GetWindowStyle(шхобъ);
			}
		public /+virtual+/ проц WindowStyle(бцел значение)
			{
				wxWindow_SetWindowStyle(шхобъ, значение);
			}

		public /+virtual+/ бул HasFlag(цел flag)
		{
			return wxWindow_HasFlag(шхобъ, flag);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул IsRetained()
		{
			return wxWindow_IsRetained(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ цел ExtraStyle()
			{
				return wxWindow_GetExtraStyle(шхобъ);
			}
		public /+virtual+/ проц ExtraStyle(бцел значение)
			{
				wxWindow_SetExtraStyle(шхобъ, значение);
			}

		//---------------------------------------------------------------------
/+
		public проц MakeModal(бул значение)
		{
			wxWindow_MakeModal(шхобъ, значение);
		}

	+/	//---------------------------------------------------------------------

		public бул ThemeEnabled()
		{
			return wxWindow_GetThemeEnabled(шхобъ);
		}
		public проц ThemeEnabled(бул значение)
		{
			wxWindow_SetThemeEnabled(шхобъ, значение);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц SetFocus()
		{
			wxWindow_SetFocus(шхобъ);
		}

		public /+virtual+/ проц SetFocusFromKbd()
		{
			wxWindow_SetFocusFromKbd(шхобъ);
		}

		public static Окно FindFocus()
		{
			return cast(Окно)FindObject(wxWindow_FindFocus());
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул AcceptsFocus()
		{
			return wxWindow_AcceptsFocus(шхобъ);
		}

		public /+virtual+/ бул AcceptsFocusFromKeyboard()
		{
			return wxWindow_AcceptsFocusFromKeyboard(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Окно Parent()
		{
			return cast(Окно)FindObject(wxWindow_GetParent(шхобъ));
		}
		public /+virtual+/ проц Parent(Окно значение)
		{
			wxWindow_SetParent(шхобъ, wxObject.SafePtr(значение));
		}

		public /+virtual+/ Окно GrandParent()
		{
			return cast(Окно)FindObject(wxWindow_GetGrandParent(шхобъ));
		}

		public /+virtual+/ бул Reparent(Окно newParent)
		{
			return wxWindow_Reparent(шхобъ, wxObject.SafePtr(newParent));
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул IsTopLevel()
		{
			return wxWindow_IsTopLevel(шхобъ);
		}
		//---------------------------------------------------------------------

		public /+virtual+/ проц AddChild(Окно child)
		{
			wxWindow_AddChild(шхобъ, wxObject.SafePtr(child));
		}

		public /+virtual+/ проц RemoveChild(Окно child)
		{
			wxWindow_RemoveChild(шхобъ, wxObject.SafePtr(child));
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Окно FindWindow(цел ид)
		{
			return cast(Окно)FindObject(wxWindow_FindWindowId(шхобъ, ид));
		}

		public /+virtual+/ Окно FindWindow(цел ид, newfunc func)
		{
			return cast(Окно)FindObject(wxWindow_FindWindowId(шхобъ, ид), func);
		}

		public /+virtual+/ Окно FindWindow(ткст имя)
		{
			return cast(Окно)FindObject(wxWindow_FindWindowName(шхобъ, имя));
		}

		//---------------------------------------------------------------------

		public static Окно FindWindowById(цел ид, Окно родитель)
		{
			return cast(Окно)FindObject(wxWindow_FindWindowById(ид, wxObject.SafePtr(родитель)));
		}

		public static Окно FindWindowByName(ткст имя, Окно родитель)
		{
			return cast(Окно)FindObject(wxWindow_FindWindowByName(имя, wxObject.SafePtr(родитель)));
		}

		public static Окно FindWindowByLabel(ткст надпись, Окно родитель)
		{
			return cast(Окно)FindObject(wxWindow_FindWindowByLabel(надпись, wxObject.SafePtr(родитель)));
		}

		//---------------------------------------------------------------------

		public EvtHandler EventHandler()
		{
			ЦУк ptr = wxWindow_GetEventHandler(шхобъ);
			wxObject o = FindObject(ptr);
			if (o) return cast(EvtHandler)o;
			else return new EvtHandler(ptr);
		//	return cast(EvtHandler)FindObject(wxWindow_GetEventHandler(шхобъ),&EvtHandler.Нов);
		}
		public проц EventHandler(EvtHandler значение)
		{
			wxWindow_SetEventHandler(шхобъ, wxObject.SafePtr(значение));
		}

		//---------------------------------------------------------------------

		public проц PushEventHandler(EvtHandler handler)
		{
			wxWindow_PushEventHandler(шхобъ, wxObject.SafePtr(handler));
		}

		public EvtHandler PopEventHandler(бул deleteHandler)
		{
			ЦУк ptr = wxWindow_PopEventHandler(шхобъ, deleteHandler);
			wxObject o = FindObject(ptr);
			if (o) return cast(EvtHandler)o;
			else return new EvtHandler(ptr);
		//	return cast(EvtHandler)FindObject(wxWindow_PopEventHandler(шхобъ, deleteHandler),&EvtHandler.Нов);
		}

		public бул RemoveEventHandler(EvtHandler handler)
		{
			return wxWindow_RemoveEventHandler(шхобъ, wxObject.SafePtr(handler));
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Validator validator()
		{
			return cast(Validator)FindObject(wxWindow_GetValidator(шхобъ));
		}
		public /+virtual+/ проц validator(Validator значение)
		{
			wxWindow_SetValidator(шхобъ, wxObject.SafePtr(значение));
		}

		public /+virtual+/ бул Validate()
		{
			return wxWindow_Validate(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул TransferDataToWindow()
		{
			//return wxWindow_TransferDataToWindow(шхобъ);
			return да;
		}

		public /+virtual+/ бул TransferDataFromWindow()
		{
			//return wxWindow_TransferDataFromWindow(шхобъ);
			return да;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц InitДиалог()
		{
			wxWindow_InitДиалог(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Точка ConvertPixelsToДиалог(Точка pt)
		{
			Точка point;
			wxWindow_ConvertPixelsToДиалогPoint(шхобъ, pt, point);
			return point;
		}

		public /+virtual+/ Точка ConvertДиалогToPixels(Точка pt)
		{
			Точка point;
			wxWindow_ConvertДиалогToPixelsPoint(шхобъ, pt, point);
			return point;
		}

		public /+virtual+/ Размер ConvertPixelsToДиалог(Размер sz)
		{
			Размер size;
			wxWindow_ConvertPixelsToДиалогSize(шхобъ, sz, size);
			return size;
		}

		public /+virtual+/ Размер ConvertДиалогToPixels(Размер sz)
		{
			Размер size;
			wxWindow_ConvertPixelsToДиалогSize(шхобъ, sz, size);
			return size;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц WarpPointer(цел x, цел y)
		{
			wxWindow_WarpPointer(шхобъ, x, y);
		}

		public /+virtual+/ проц CaptureMouse()
		{
			wxWindow_CaptureMouse(шхобъ);
		}

		public /+virtual+/ проц ReleaseMouse()
		{
			wxWindow_ReleaseMouse(шхобъ);
		}

		public static Окно GetCapture()
		{
			return cast(Окно)FindObject(wxWindow_GetCapture());
		}

		public /+virtual+/ бул HasCapture()
		{
			return wxWindow_HasCapture(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Refresh()
		{
			Refresh(да, ClientRect);
		}

		public /+virtual+/ проц Refresh(бул eraseBackground)
		{
			Refresh(eraseBackground, ClientRect);
		}

		public /+virtual+/ проц Refresh(бул eraseBackground, Прямоугольник прям)
		{
			wxWindow_Refresh(шхобъ, eraseBackground, прям);
		}

		public /+virtual+/ проц RefreshRectangle(Прямоугольник прям)
		{
			wxWindow_RefreshRect(шхобъ, прям);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Обнови()
		{
			wxWindow_Update(шхобъ);
		}

		public /+virtual+/ проц ClearBackground()
		{
			wxWindow_ClearBackground(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц Freeze()
		{
			wxWindow_Freeze(шхобъ);
		}

		public /+virtual+/ проц Thaw()
		{
			wxWindow_Thaw(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц PrepareDC(DC dc)
		{
			wxWindow_PrepareDC(шхобъ, wxObject.SafePtr(dc));
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул  IsExposed(цел x, цел y, цел w, цел h)
		{
			return wxWindow_IsExposed(шхобъ, x, y, w, h);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Caret caret()
		{
			return cast(Caret)FindObject(wxWindow_GetCaret(шхобъ),&Caret.Нов);
		}
		public /+virtual+/ проц caret(Caret значение)
		{
			wxWindow_SetCaret(шхобъ, wxObject.SafePtr(значение));
		}

		//---------------------------------------------------------------------

		public /+virtual+/ цел CharHeight()
		{
			return wxWindow_GetCharHeight(шхобъ);
		}

		public /+virtual+/ цел CharWidth()
		{
			return wxWindow_GetCharWidth(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц GetTextExtent(ткст str, out цел x, out цел y, out цел descent,
								  out цел externalLeading, Шрифт шрифт)
		{
			wxWindow_GetTextExtent(шхобъ, str, x, y, descent,
								   externalLeading, wxObject.SafePtr(шрифт));
		}

		//---------------------------------------------------------------------

		public проц ClientToScreen(inout цел x, inout цел y)
		{
			wxWindow_ClientToScreen(шхобъ, x, y);
		}

		public Точка ClientToScreen(Точка clientPoint)
		{
			Точка screenPoint;
			wxWindow_ClientToScreen(шхобъ, clientPoint, screenPoint);
			return screenPoint;
		}

		public /+virtual+/ проц ScreenToClient(inout цел x, inout цел y)
		{
			wxWindow_ScreenToClient(шхобъ, x, y);
		}

		public Точка ScreenToClient(Точка screenPoint)
		{
			Точка clientPoint;
			wxWindow_ScreenToClient(шхобъ, screenPoint, clientPoint);
			return clientPoint;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц UpdateWindowUI()
		{
			wxWindow_UpdateWindowUI(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул PopupMenu(Меню меню, Точка поз)
		{
			бул tmpbool = wxWindow_PopupMenu(шхобъ, wxObject.SafePtr(меню), поз);
			
			меню.ConnectEvents(this);
			
			return tmpbool;
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул HasScrollbar(цел orient)
		{
			return wxWindow_HasScrollbar(шхобъ, orient);
		}

		public /+virtual+/ проц SetScrollbar(цел orient, цел поз, цел thumbSize, цел range, бул refresh)
		{
			wxWindow_SetScrollbar(шхобъ, orient, поз, thumbSize, range, refresh);
		}

		public /+virtual+/ проц SetScrollPos(цел orient, цел поз, бул refresh)
		{
			wxWindow_SetScrollPos(шхобъ, orient, поз, refresh);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ цел GetScrollPos(цел orient)
		{
			return wxWindow_GetScrollPos(шхобъ, orient);
		}

		public /+virtual+/ цел GetScrollThumb(цел orient)
		{
			return wxWindow_GetScrollThumb(шхобъ, orient);
		}

		public /+virtual+/ цел GetScrollRange(цел orient)
		{
			return wxWindow_GetScrollRange(шхобъ, orient);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ проц ScrollWindow(цел dx, цел dy, Прямоугольник прям)
		{
			wxWindow_ScrollWindow(шхобъ, dx, dy, прям);
		}

		public /+virtual+/ бул ScrollLines(цел lines)
		{
			return wxWindow_ScrollLines(шхобъ, lines);
		}

		public /+virtual+/ бул ScrollPages(цел pages)
		{
			return wxWindow_ScrollPages(шхобъ, pages);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ бул LineUp()
		{
			return wxWindow_LineUp(шхобъ);
		}

		public /+virtual+/ бул LineDown()
		{
			return wxWindow_LineDown(шхобъ);
		}

		public /+virtual+/ бул PageUp()
		{
			return wxWindow_PageUp(шхобъ);
		}

		public /+virtual+/ бул PageDown()
		{
			return wxWindow_PageDown(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ ткст HelpText()
			{
				return cast(ткст) new wxString(wxWindow_GetHelpText(шхобъ), да);
			}
		public /+virtual+/ проц HelpText(ткст значение)
			{
				wxWindow_SetHelpText(шхобъ, значение);
			}
/+
		public /+virtual+/ проц SetHelpTextForId(ткст текст)
		{
			wxWindow_SetHelpTextForId(шхобъ, текст);
		}

+/		//---------------------------------------------------------------------
/+FIXME
		public /+virtual+/ DropTarget dropTarget()
			{
				return cast(DropTarget)FindObject(wxWindow_GetDropTarget(шхобъ),&DropTarget.Нов);
			}
+/
		public /+virtual+/ проц dropTarget(DropTarget значение)
			{
				wxWindow_SetDropTarget(шхобъ, wxObject.SafePtr(значение));
			}

		//---------------------------------------------------------------------

		// LayoutConstraints are now depreciated.  Should this be implemented?
		/*public LayoutContraints Constraints
		{
			get
			{
				return new LayoutConstraints(wxWindow_GetConstraints(шхобъ));
			}
			set
			{
				wxWindow_SetConstraints(шхобъ, wxObject.SafePtr(значение));
			}
		}*/

		//---------------------------------------------------------------------

		public /+virtual+/ бул AutoLayout()
			{
				return wxWindow_GetAutoLayout(шхобъ);
			}
		public /+virtual+/ проц AutoLayout(бул значение)
			{
				wxWindow_SetAutoLayout(шхобъ, значение);
			}

		//---------------------------------------------------------------------

		public /+virtual+/ проц SetSizerAndFit(Sizer sizer, бул deleteOld)
		{
			wxWindow_SetSizerAndFit(шхобъ, wxObject.SafePtr(sizer), deleteOld);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Sizer sizer()
			{
				return cast(Sizer)FindObject(wxWindow_GetSizer(шхобъ));
			}
		public /+virtual+/ проц  sizer(Sizer значение)
			{
				SetSizer(значение, да);
			}

		//---------------------------------------------------------------------

		public /+virtual+/ Sizer ContainingSizer()
			{
				return cast(Sizer)FindObject(wxWindow_GetContainingSizer(шхобъ));
			}
		public /+virtual+/ проц  ContainingSizer(Sizer значение)
			{
				wxWindow_SetContainingSizer(шхобъ, wxObject.SafePtr(значение));
			}

		//---------------------------------------------------------------------

		public /+virtual+/ Палитра палитра()
			{
				return new Палитра(wxWindow_GetPalette(шхобъ));
			}
		public /+virtual+/ проц палитра(Палитра значение)
			{
				wxWindow_SetPalette(шхобъ, wxObject.SafePtr(значение));
			}

		//---------------------------------------------------------------------

		public /+virtual+/ бул HasCustomPalette()
		{
			return wxWindow_HasCustomPalette(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Region UpdateRegion()
		{
			return new Region(wxWindow_GetUpdateRegion(шхобъ));
		}

		//---------------------------------------------------------------------
		
		// Implement very common System.Windows.Forms.Control members

		public /+virtual+/ цел Top() { return this.Положение.Y; }
		public /+virtual+/ проц Top(цел значение) { this.Move(this.Положение.X, значение,	0);	}

		public /+virtual+/ цел Left()	{ return this.Положение.X; }
		public /+virtual+/ проц Left(цел значение) { this.Move(значение, this.Положение.Y,	0);	}

		public /+virtual+/ цел Right() { return this.Положение.X + this.size.Ширина;	}
		public /+virtual+/ проц Right( цел значение) { this.Move(значение -	this.size.Ширина, this.Положение.Y, 0); }

		public /+virtual+/ цел Bottom() { return this.Положение.Y + this.size.Высота; }
		public /+virtual+/ проц Bottom(цел значение) { this.Move(this.Положение.X, значение - this.size.Высота, 0); }

		public /+virtual+/ цел Ширина() { return this.size.Ширина; }
		public /+virtual+/ проц Ширина(цел значение) { Размер size; size.Ширина = значение; size.Высота = this.size.Высота; this.size = size; }

		public /+virtual+/ цел Высота() { return this.size.Высота; }
		public /+virtual+/ проц Высота(цел значение) { Размер size; size.Ширина = this.size.Ширина; size.Высота = значение; this.size = size; }

		//---------------------------------------------------------------------
		
		public WindowVariant windowVariant() { return cast(WindowVariant)wxWindow_GetWindowVariant(шхобъ); }		
		//---------------------------------------------------------------------
		
		public бул IsBeingDeleted()
		{
			return wxWindow_IsBeingDeleted(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public проц CacheBestSize(Размер size)
		{
			wxWindow_CacheBestSize(шхобъ, size);
		}
		
		//---------------------------------------------------------------------
		
		public проц InvalidateBestSize()
		{
			wxWindow_InvalidateBestSize(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public Размер BestFittingSize()
		{
			Размер size;
			wxWindow_GetBestFittingSize(шхобъ, size);
			return size;
		}
		public проц BestFittingSize(Размер значение)
		{			
			wxWindow_SetBestFittingSize(шхобъ, значение);
		}
		
		//---------------------------------------------------------------------
		
		public Окно[] Children()
		{
			цел счёт = wxWindow_GetChildrenCount(шхобъ);
			Окно[] ret = new Окно[счёт];
			for (цел num = 0; num < счёт; num++)
			{
				ret[num] = cast(Окно)FindObject(wxWindow_GetChildren(шхобъ, num));
			}
			return ret;
		}
		
		//---------------------------------------------------------------------
		
		public AcceleratorTable acceleratorTable() { return cast(AcceleratorTable)FindObject(wxWindow_GetAcceleratorTable(шхобъ),&AcceleratorTable.Нов); }		
		//---------------------------------------------------------------------
		
		public /+virtual+/ ВизАтры DefaultAttributes()
		{
			return new ВизАтры(wxWindow_GetDefaultAttributes(шхобъ), да);
		}
		
		//---------------------------------------------------------------------
		
		public static ВизАтры ClassDefaultAttributes()
		{
			return ClassDefaultAttributes(WindowVariant.wxWINDOW_VARIANT_NORMAL);
		}
		
		public static ВизАтры ClassDefaultAttributes(WindowVariant variant)
		{
			return new ВизАтры(wxWindow_GetClassDefaultAttributes(cast(цел)variant), да);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ BackgroundStyle backgroundStyle()
		{
			return cast(BackgroundStyle)wxWindow_GetBackgroundStyle(шхобъ);
		}
		public /+virtual+/ проц backgroundStyle(BackgroundStyle значение)
		{
			wxWindow_SetBackgroundStyle(шхобъ, cast(цел)значение);
		}
		
		//---------------------------------------------------------------------
		
		public Border border() { return cast(Border)wxWindow_GetBorder(шхобъ); }		
		public Border BorderByFlags(бцел флаги)
		{
			return cast(Border)wxWindow_GetBorderByFlags(шхобъ, флаги);
		}
		
		//---------------------------------------------------------------------
		
                // TODO Not available in OS X
                /*
		public ткст ToolTipText() { return cast(ткст) new wxString(wxWindow_GetToolTipText(шхобъ), да); }                */
		
		//---------------------------------------------------------------------
		
		public Окно AncestorWithCustomPalette() { return cast(Окно)FindObject(wxWindow_GetAncestorWithCustomPalette(шхобъ),&Окно.Нов); }		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц InheritAttributes()
		{
			wxWindow_InheritAttributes(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ бул ShouldInheritColours()
		{
			return wxWindow_ShouldInheritColours(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public проц LeftUp_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_LEFT_UP, ИД, значение, this); }
		public проц LeftUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц RightUp_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_RIGHT_UP, ИД, значение, this); }
		public проц RightUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MiddleUp_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_MIDDLE_UP, ИД, значение, this); }
		public проц MiddleUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц LeftDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_LEFT_DOWN, ИД, значение, this); }
		public проц LeftDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MiddleDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_MIDDLE_DOWN, ИД, значение, this); }
		public проц MiddleDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц RightDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_RIGHT_DOWN, ИД, значение, this); }
		public проц RightDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц LeftDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_LEFT_DCLICK, ИД, значение, this); }
		public проц LeftDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц RightDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_RIGHT_DCLICK, ИД, значение, this); }
		public проц RightDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MiddleDoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_MIDDLE_DCLICK, ИД, значение, this); }
		public проц MiddleDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MouseMove_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_MOTION, ИД, значение, this); }
		public проц MouseMove_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MouseThumbTrack_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_SCROLL_THUMBTRACK, ИД, значение, this); }
		public проц MouseThumbTrack_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MouseEnter_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_ENTER_WINDOW, ИД, значение, this); }
		public проц MouseEnter_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MouseLeave_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_LEAVE_WINDOW, ИД, значение, this); }
		public проц MouseLeave_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ScrollLineUp_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_SCROLL_LINEUP, ИД, значение, this); }
		public проц ScrollLineUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ScrollLineDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_SCROLL_LINEDOWN, ИД, значение, this); }
		public проц ScrollLineDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц UpdateUI_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_UPDATE_UI, ИД, значение, this); }
		public проц UpdateUI_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц KeyDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_KEY_DOWN, ИД, значение, this); }
		public проц KeyDown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц KeyUp_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_KEY_UP, ИД, значение, this); }
		public проц KeyUp_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Char_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CHAR, ИД, значение, this); }
		public проц Char_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Closing_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CLOSE_WINDOW, ИД, значение, this); }
		public проц Closing_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Activated_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_ACTIVATE, ИД, значение, this); }
		public проц Activated_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Moved_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_MOVE, ИД, значение, this); }
		public проц Moved_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Resized_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_SIZE, ИД, значение, this); }
		public проц Resized_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}

