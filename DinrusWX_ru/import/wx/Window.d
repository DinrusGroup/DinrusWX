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
		НОРМАЛЬНЫЙ,  // Normal разм
		МАЛЕНЬКИЙ,   // Smaller разм (about 25 % smaller than normal)
		МИНИ,    // Mini разм (about 33 % smaller than normal)
		БОЛЬШОЙ,   // Large разм (about 25 % larger than normal)
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
		static extern (C) IntPtr wxVisualAttributes_ctor();
		static extern (C) проц   wxVisualAttributes_dtor(IntPtr сам);
		static extern (C) проц   wxVisualAttributes_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxVisualAttributes_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxVisualAttributes_GetFont(IntPtr сам);
		static extern (C) проц   wxVisualAttributes_SetColourFg(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxVisualAttributes_GetColourFg(IntPtr сам);
		static extern (C) проц   wxVisualAttributes_SetColourBg(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxVisualAttributes_GetColourBg(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias ВизАтрибуты wxVisualAttributes;
	public class ВизАтрибуты : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public Шрифт шрифт();
		public проц шрифт(Шрифт значение) ;
		public Цвет цветПП();
		public Цвет цветЗП();
		override protected проц dtor() ;
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxWindow_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) бул   wxWindow_Close(IntPtr сам, бул сила);
		static extern (C) проц   wxWindow_GetBestSize(IntPtr сам, out Размер разм);
		static extern (C) проц   wxWindow_GetClientSize(IntPtr сам, out Размер разм);
		static extern (C) цел    wxWindow_GetId(IntPtr сам);
		static extern (C) бцел   wxWindow_GetWindowStyleFlag(IntPtr сам);
		static extern (C) бцел   wxWindow_Layout(IntPtr сам);
		static extern (C) проц   wxWindow_SetAutoLayout(IntPtr сам, бул autoLayout);
		static extern (C) проц   wxWindow_SetBackgroundColour(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxWindow_GetBackgroundColour(IntPtr сам);
		static extern (C) проц   wxWindow_SetForegroundColour(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxWindow_GetForegroundColour(IntPtr сам);
		static extern (C) проц   wxWindow_SetCursor(IntPtr сам, IntPtr курсор);
		static extern (C) проц   wxWindow_SetId(IntPtr сам, цел ид);
		static extern (C) проц   wxWindow_SetSize(IntPtr сам, цел x, цел y, цел ширь, цел высь, бцел флаги);
		static extern (C) проц   wxWindow_SetSize2(IntPtr сам, цел ширь, цел высь);
		static extern (C) проц   wxWindow_SetSize3(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxWindow_SetSize4(IntPtr сам, inout Прямоугольник прям);
		static extern (C) проц   wxWindow_SetSizer(IntPtr сам, IntPtr сайзер, бул удалитьСтар);
		static extern (C) проц   wxWindow_SetWindowStyleFlag(IntPtr сам, бцел стиль);
		static extern (C) бул   wxWindow_Show(IntPtr сам, бул покажи);
		static extern (C) бул   wxWindow_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxWindow_GetFont(IntPtr сам);
		static extern (C) проц   wxWindow_SetToolTip(IntPtr сам, ткст tip);
		static extern (C) бул 	 wxWindow_Enable(IntPtr сам, бул вкл);
		static extern (C) бул   wxWindow_IsEnabled(IntPtr сам);

		static extern (C) цел    wxWindow_EVT_TRANSFERDATAFROMWINDOW();
		static extern (C) цел    wxWindow_EVT_TRANSFERDATATOWINDOW();

		//static extern (C) бул wxWindow_LoadFromResource(IntPtr сам, IntPtr родитель, ткст resourceName, IntPtr table);
		//static extern (C) IntPtr wxWindow_CreateItem(IntPtr сам, IntPtr childResource, IntPtr parentResource, IntPtr table);
		static extern (C) бул   wxWindow_Destroy(IntPtr сам);
		static extern (C) бул   wxWindow_DestroyChildren(IntPtr сам);
		static extern (C) проц   wxWindow_SetTitle(IntPtr сам, ткст title);
		static extern (C) IntPtr wxWindow_GetTitle(IntPtr сам);
		static extern (C) проц   wxWindow_SetName(IntPtr сам, ткст имя);
		static extern (C) IntPtr wxWindow_GetName(IntPtr сам);
		static extern (C) цел    wxWindow_NewControlId();
		static extern (C) цел    wxWindow_NextControlId(цел ид);
		static extern (C) цел    wxWindow_PrevControlId(цел ид);
		static extern (C) проц   wxWindow_Move(IntPtr сам, цел x, цел y, цел флаги);
		static extern (C) проц   wxWindow_Raise(IntPtr сам);
		static extern (C) проц   wxWindow_Lower(IntPtr сам);
		static extern (C) проц   wxWindow_SetClientSize(IntPtr сам, цел ширь, цел высь);
		static extern (C) проц   wxWindow_GetPosition(IntPtr сам, out Точка Точка);
		static extern (C) проц   wxWindow_GetSize(IntPtr сам, out Размер разм);
		static extern (C) проц   wxWindow_GetRect(IntPtr сам, out Прямоугольник прям);
		static extern (C) проц   wxWindow_GetClientAreaOrigin(IntPtr сам, out Точка Точка);
		static extern (C) проц   wxWindow_GetClientRect(IntPtr сам, out Прямоугольник прям);
		static extern (C) проц   wxWindow_GetAdjustedBestSize(IntPtr сам, out Размер разм);
		static extern (C) проц   wxWindow_Center(IntPtr сам, цел направление);
		static extern (C) проц   wxWindow_CenterOnScreen(IntPtr сам, цел dir);
		static extern (C) проц   wxWindow_CenterOnParent(IntPtr сам, цел dir);
		static extern (C) проц   wxWindow_Fit(IntPtr сам);
		static extern (C) проц   wxWindow_FitInside(IntPtr сам);
		static extern (C) проц   wxWindow_SetSizeHints(IntPtr сам, цел minW, цел minH, цел maxW, цел maxH, цел incW, цел incH);
		static extern (C) проц   wxWindow_SetVirtualSizeHints(IntPtr сам, цел minW, цел minH, цел maxW, цел maxH);
		static extern (C) цел    wxWindow_GetMinWidth(IntPtr сам);
		static extern (C) цел    wxWindow_GetMinHeight(IntPtr сам);
		static extern (C) проц   wxWindow_GetMinSize(IntPtr сам, out Размер разм);
		static extern (C) проц   wxWindow_SetMinSize(IntPtr сам, Размер* разм);
		static extern (C) цел    wxWindow_GetMaxWidth(IntPtr сам);
		static extern (C) цел    wxWindow_GetMaxHeight(IntPtr сам);
		static extern (C) проц   wxWindow_GetMaxSize(IntPtr сам, out Размер разм);
		static extern (C) проц   wxWindow_SetMaxSize(IntPtr сам, Размер* разм);
		static extern (C) проц   wxWindow_SetVirtualSize(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxWindow_GetVirtualSize(IntPtr сам, out Размер разм);
		static extern (C) проц   wxWindow_GetBestVirtualSize(IntPtr сам, out Размер разм);
		static extern (C) бул   wxWindow_Hide(IntPtr сам);
		static extern (C) бул   wxWindow_Disable(IntPtr сам);
		static extern (C) бул   wxWindow_IsShown(IntPtr сам);
		static extern (C) проц   wxWindow_SetWindowStyle(IntPtr сам, бцел стиль);
		static extern (C) бцел   wxWindow_GetWindowStyle(IntPtr сам);
		static extern (C) бул   wxWindow_HasFlag(IntPtr сам, цел флаг);
		static extern (C) бул   wxWindow_IsRetained(IntPtr сам);
		static extern (C) проц   wxWindow_SetExtraStyle(IntPtr сам, бцел exStyle);
		static extern (C) бцел   wxWindow_GetExtraStyle(IntPtr сам);
		static extern (C) проц   wxWindow_MakeModal(IntPtr сам, бул modal);
		static extern (C) проц   wxWindow_SetThemeEnabled(IntPtr сам, бул enableTheme);
		static extern (C) бул   wxWindow_GetThemeEnabled(IntPtr сам);
		static extern (C) проц   wxWindow_SetFocus(IntPtr сам);
		static extern (C) проц   wxWindow_SetFocusFromKbd(IntPtr сам);
		static extern (C) IntPtr wxWindow_FindFocus();
		static extern (C) бул   wxWindow_AcceptsFocus(IntPtr сам);
		static extern (C) бул   wxWindow_AcceptsFocusFromKeyboard(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetParent(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetGrandParent(IntPtr сам);
		static extern (C) бул   wxWindow_IsTopLevel(IntPtr сам);
		static extern (C) проц   wxWindow_SetParent(IntPtr сам, IntPtr родитель);
		static extern (C) бул   wxWindow_Reparent(IntPtr сам, IntPtr новРодитель);
		static extern (C) проц   wxWindow_AddChild(IntPtr сам, IntPtr отпрыск);
		static extern (C) проц   wxWindow_RemoveChild(IntPtr сам, IntPtr отпрыск);
		static extern (C) IntPtr wxWindow_FindWindowId(IntPtr сам, цел ид);
		static extern (C) IntPtr wxWindow_FindWindowName(IntPtr сам, ткст имя);
		static extern (C) IntPtr wxWindow_FindWindowById(цел ид, IntPtr родитель);
		static extern (C) IntPtr wxWindow_FindWindowByName(ткст имя, IntPtr родитель);
		static extern (C) IntPtr wxWindow_FindWindowByLabel(ткст ярлык, IntPtr родитель);
		static extern (C) IntPtr wxWindow_GetEventHandler(IntPtr сам);
		static extern (C) проц   wxWindow_SetEventHandler(IntPtr сам, IntPtr обработчик);
		static extern (C) проц   wxWindow_PushEventHandler(IntPtr сам, IntPtr обработчик);
		static extern (C) IntPtr wxWindow_PopEventHandler(IntPtr сам, бул удалиОбраб);
		static extern (C) бул   wxWindow_RemoveEventHandler(IntPtr сам, IntPtr обработчик);
		static extern (C) проц   wxWindow_SetValidator(IntPtr сам, IntPtr оценщик);
		static extern (C) IntPtr wxWindow_GetValidator(IntPtr сам);
		static extern (C) бул   wxWindow_Validate(IntPtr сам);
		static extern (C) бул   wxWindow_TransferDataToWindow(IntPtr сам);
		static extern (C) бул   wxWindow_TransferDataFromWindow(IntPtr сам);
		static extern (C) проц   wxWindow_InitDialog(IntPtr сам);
		static extern (C) проц   wxWindow_SetAcceleratorTable(IntPtr сам, IntPtr accel);
		static extern (C) IntPtr wxWindow_GetAcceleratorTable(IntPtr сам);
		static extern (C) проц   wxWindow_ConvertPixelsToDialogPoint(IntPtr сам, inout Точка тчк, out Точка Точка);
		static extern (C) проц   wxWindow_ConvertDialogToPixelsPoint(IntPtr сам, inout Точка тчк, out Точка Точка);
		static extern (C) проц   wxWindow_ConvertPixelsToDialogSize(IntPtr сам, inout Размер рм, out Размер разм);
		static extern (C) проц   wxWindow_ConvertDialogToPixelsSize(IntPtr сам, inout Размер рм, out Размер разм);
		static extern (C) проц   wxWindow_WarpPointer(IntPtr сам, цел x, цел y);
		static extern (C) проц   wxWindow_CaptureMouse(IntPtr сам);
		static extern (C) проц   wxWindow_ReleaseMouse(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetCapture();
		static extern (C) бул   wxWindow_HasCapture(IntPtr сам);
		static extern (C) проц   wxWindow_Refresh(IntPtr сам, бул eraseBackground, inout Прямоугольник прям);
		static extern (C) проц   wxWindow_RefreshRect(IntPtr сам, inout Прямоугольник прям);
		static extern (C) проц   wxWindow_Update(IntPtr сам);
		static extern (C) проц   wxWindow_ClearBackground(IntPtr сам);
		static extern (C) проц   wxWindow_Freeze(IntPtr сам);
		static extern (C) проц   wxWindow_Thaw(IntPtr сам);
		static extern (C) проц   wxWindow_PrepareDC(IntPtr сам, IntPtr dc);
		static extern (C) бул   wxWindow_IsExposed(IntPtr сам, цел x, цел y, цел w, цел h);
		static extern (C) проц   wxWindow_SetCaret(IntPtr сам, IntPtr каретка);
		static extern (C) IntPtr wxWindow_GetCaret(IntPtr сам);
		static extern (C) цел    wxWindow_GetCharHeight(IntPtr сам);
		static extern (C) цел    wxWindow_GetCharWidth(IntPtr сам);
		static extern (C) проц   wxWindow_GetTextExtent(IntPtr сам, ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, IntPtr theFont);
		static extern (C) проц   wxWindow_ClientToScreen(IntPtr сам, inout цел x, inout цел y);
		static extern (C) проц   wxWindow_ScreenToClient(IntPtr сам, inout цел x, inout цел y);
		static extern (C) проц   wxWindow_ClientToScreen(IntPtr сам, inout Точка тчк, out Точка Точка);
		static extern (C) проц   wxWindow_ScreenToClient(IntPtr сам, inout Точка тчк, out Точка Точка);
		//static extern (C) wxHitTest wxWindow_HitTest(IntPtr сам, Coord x, Coord y);
		//static extern (C) wxHitTest wxWindow_HitTest(IntPtr сам, inout Точка тчк);
		static extern (C) цел    wxWindow_GetBorder(IntPtr сам);
		static extern (C) цел    wxWindow_GetBorderByФлаги(IntPtr сам, бцел флаги);
		static extern (C) проц   wxWindow_UpdateWindowUI(IntPtr сам);
		static extern (C) бул   wxWindow_PopupMenu(IntPtr сам, IntPtr меню, inout Точка поз);
		static extern (C) бул   wxWindow_HasScrollbar(IntPtr сам, цел ориент);
		static extern (C) проц   wxWindow_SetScrollbar(IntPtr сам, цел ориент, цел поз, цел thumbvisible, цел диапазон, бул освежи);
		static extern (C) проц   wxWindow_SetScrollPos(IntPtr сам, цел ориент, цел поз, бул освежи);
		static extern (C) цел    wxWindow_GetScrollPos(IntPtr сам, цел ориент);
		static extern (C) цел    wxWindow_GetScrollThumb(IntPtr сам, цел ориент);
		static extern (C) цел    wxWindow_GetScrollRange(IntPtr сам, цел ориент);
		static extern (C) проц   wxWindow_ScrollWindow(IntPtr сам, цел dx, цел dy, inout Прямоугольник прям);
		static extern (C) бул   wxWindow_ScrollLines(IntPtr сам, цел строки);
		static extern (C) бул   wxWindow_ScrollPages(IntPtr сам, цел страницы);
		static extern (C) бул   wxWindow_LineUp(IntPtr сам);
		static extern (C) бул   wxWindow_LineDown(IntPtr сам);
		static extern (C) бул   wxWindow_PageUp(IntPtr сам);
		static extern (C) бул   wxWindow_PageDown(IntPtr сам);
		static extern (C) проц   wxWindow_SetHelpText(IntPtr сам, ткст текст);
		static extern (C) проц   wxWindow_SetHelpTextForId(IntPtr сам, ткст текст);
		static extern (C) IntPtr wxWindow_GetHelpText(IntPtr сам);
		//static extern (C) проц wxWindow_SetToolTip(IntPtr сам, IntPtr tip);
		//static extern (C) IntPtr wxWindow_GetToolTip(IntPtr сам);
		static extern (C) проц   wxWindow_SetDropTarget(IntPtr сам, IntPtr мишеньСброса);
		static extern (C) IntPtr wxWindow_GetDropTarget(IntPtr сам);
		static extern (C) проц   wxWindow_SetConstraints(IntPtr сам, IntPtr constraints);
		static extern (C) IntPtr wxWindow_GetConstraints(IntPtr сам);
		static extern (C) бул   wxWindow_GetAutoLayout(IntPtr сам);
		static extern (C) проц   wxWindow_SetSizerAndFit(IntPtr сам, IntPtr сайзер, бул удалитьСтар);
		static extern (C) IntPtr wxWindow_GetSizer(IntPtr сам);
		static extern (C) проц   wxWindow_SetContainingSizer(IntPtr сам, IntPtr сайзер);
		static extern (C) IntPtr wxWindow_GetContainingSizer(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetPalette(IntPtr сам);
		static extern (C) проц   wxWindow_SetPalette(IntPtr сам, IntPtr pal);
		static extern (C) бул   wxWindow_HasCustomPalette(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetUpdateRegion(IntPtr сам);

		static extern (C) проц   wxWindow_SetWindowVariant(IntPtr сам, цел вариант);
		static extern (C) цел    wxWindow_GetWindowVariant(IntPtr сам);
		static extern (C) бул   wxWindow_IsBeingDeleted(IntPtr сам);
		static extern (C) проц   wxWindow_InvalidateBestSize(IntPtr сам);
		static extern (C) проц   wxWindow_CacheBestSize(IntPtr сам, Размер разм);
		static extern (C) проц   wxWindow_GetBestFittingSize(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxWindow_SetBestFittingSize(IntPtr сам, inout Размер разм);
		static extern (C) IntPtr wxWindow_GetChildren(IntPtr сам, цел чис);
		static extern (C) цел    wxWindow_GetChildrenCount(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetDefaultAttributes(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetClassDefaultAttributes(цел вариант);
		static extern (C) проц   wxWindow_SetBackgroundStyle(IntPtr сам, цел стиль);
		static extern (C) цел    wxWindow_GetBackgroundStyle(IntPtr сам);
		//static extern (C) IntPtr wxWindow_GetToolTipText(IntPtr сам);
		static extern (C) IntPtr wxWindow_GetAncestorWithCustomPalette(IntPtr сам);
		static extern (C) проц   wxWindow_InheritAttributes(IntPtr сам);
		static extern (C) бул   wxWindow_ShouldInheritColours(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias Окно wxWindow;
	/// wxWindow is the base class for all windows and represents any
	/// visible object on screen. All controls, top level windows and so on
	/// are windows. Sizers and device contexts are not, however, as they don't
	/// appear on screen themselves.
	public class Окно : ОбработчикСоб
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
		public const Размер  вхДефРазм     = {Ширь:-1, Высь:-1};
		const ткст вхСтрИмяПанели = "panel";

		//---------------------------------------------------------------------

		public this(Окно родитель, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=вхСтрИмяПанели);
		public this(Окно родитель, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=вхСтрИмяПанели);
		public this(IntPtr wxobj) ;
		private this(IntPtr wxobj, бул memOwn);
		static wxObject Нов(IntPtr ptr);
		public  проц   ЦветФона(Цвет значение);
		public  Цвет ЦветФона();
		public  Цвет ЦветПП();
		public  проц   ЦветПП(Цвет значение);
		public  проц шрифт(Шрифт значение);
		public  Шрифт шрифт();
		public  Размер ЛучшийРазмер();
		public  Размер РазмерКлиента();
		public  проц РазмерКлиента(Размер значение);
		public  бул Закрой();
		public  бул Закрой(бул сила);
		public  цел ИД() ;
		public  проц ИД(цел значение) ;
		public static цел УникИД();
		public  проц Раскладка();
		public  проц курсор(Курсор значение);
		public  проц УстРазм(цел x, цел y, цел ширь, цел высь);
		public  проц УстРазм(цел ширь, цел высь);
		public  проц УстРазм(Размер разм);
		public  проц УстРазм(Прямоугольник прям);
		public  проц УстСайзер(Сайзер сайзер, бул удалитьСтар=да);
		public  бул Покажи(бул покажи=да);
		public  цел  ФлагиСтиля();
		public  проц ФлагиСтиля(бцел значение) ;
		private проц ПоПередачеДанныхОтОкна(Объект отправитель, Событие e);
		private проц ПоПередачеДанныхОкну(Объект отправитель, Событие e);
		public  проц тулТип(ткст значение);
		public  проц Активен(бул значение);
		public  бул Активен();
		public  бул Разрушь();
		public  бул РазрушьОтпрыски();
		public  проц  Титул(ткст значение);
		public  ткст Титул();
		public  проц Имя(ткст значение);
		public  ткст Имя();
		public static цел НовИдУпрЭлта();
		public static цел СледщИдУпрЭлта(цел ид);
		public static цел ПредшИдУпрЭлта(цел ид);
		public  проц Сдвинь(цел x, цел y, цел флаги);
		public  проц Повысь();
		public  проц Понизь();
		public  Точка Позиция();
		public  проц  Позиция(Точка значение);
		public  Размер разм();
		public  проц разм(Размер значение);
		public  Прямоугольник Прям();
		public  Точка ИсходнаяЗоныКлиента();
		public  Прямоугольник ПрямКлиента();
		public  Размер НастроенныйЛучшийРазм();
		public  проц Центр();
		public  проц Центрируй();
		public  проц Центр(цел направление);
		public  проц Центрируй(цел направление);
		public  проц ЦентрНаЭкране();
		public  проц ЦентрируйНаЭкране();
		public  проц ЦентрНаЭкране(цел направление);
		public  проц ЦентрируйНаЭкране(цел направление);
		public  проц ЦентрНаРодителе();
		public  проц ЦентрируйНаРодителе();
		public  проц ЦентрНаРодителе(цел направление);
		public  проц ЦентрируйНаРодителе(цел направление);
		public  проц Встрой();
		public  проц ВстройВнутрь();
		public  проц УстРазмПодсказ(цел minW, цел minH);
		public  проц УстРазмПодсказ(цел minW, цел minH, цел maxW, цел maxH);
		public  проц УстРазмПодсказ(цел minW, цел minH, цел maxW, цел maxH, цел incW, цел incH);
		public  проц УстВиртуалРазмПодсказ(цел minW, цел minH, цел maxW, цел maxH);
		public  цел МинШирь();
		public  цел МинВысь();
		public  цел МаксШирь();
		public  цел МаксВысь();
		public  Размер МинРазм();
		public проц МинРазм(Размер разм);
		public  Размер МаксРазм();
		public проц МаксРазм(Размер разм);
		public  Размер ВиртуалРазм();
		public  проц  ВиртуалРазм(Размер значение);
		public  Размер ЛучшийВиртуалРазм();
		public  бул Спрячь();
		public  бул Отключи();
		public  бул Виден();
		public  цел СтильОкна();
		public  проц СтильОкна(бцел значение);
		public  бул ЕстьФлаг(цел флаг);
		public  бул IsRetained();
		public  цел ЭкстраСтиль();
		public  проц ЭкстраСтиль(бцел значение);
		public проц СделайМодал(бул значение);
		public бул ТемаАктивна();
		public проц ТемаАктивна(бул значение);
		public  проц УстФокус();
		public  проц УстФокусПоКлв();
		public static Окно НайдиФокус();
		public  бул ПринимаетФокус();
		public  бул ПринимаетФокусПоКлавиатуре();
		public  Окно Родитель();
		public  проц Родитель(Окно значение);
		public  Окно ПраРодитель();
		public  бул Reparent(Окно новРодитель);
		public  бул ВерхнеУровневое();
		public  проц ДобавьОтпрыск(Окно отпрыск);
		public  проц УдалиОтпрыск(Окно отпрыск);
		public  Окно НайдиОкно(цел ид);
		public  Окно НайдиОкно(цел ид, newfunc func);
		public  Окно НайдиОкно(ткст имя);
		public static Окно НайдиОкноПоИд(цел ид, Окно родитель);
		public static Окно НайдиОкноПоИмени(ткст имя, Окно родитель);
		public static Окно НайдиОкноПоЯрлыку(ткст ярлык, Окно родитель);
		public ОбработчикСоб ОбработчикСобытий();
		public проц ОбработчикСобытий(ОбработчикСоб значение);
		public проц СуньОбрСоб(ОбработчикСоб обработчик);
		public ОбработчикСоб ВыньОбрСоб(бул удалиОбраб);
		public бул УдалиОбрСоб(ОбработчикСоб обработчик);
		public  Оценщик оценщик();
		public  проц оценщик(Оценщик значение);
		public  бул Оцени();
		public  бул ПередайДанныеОкну();
		public  бул ПередайДанныеОтОкна();
		public  проц ИницДиалог();
		public  Точка ПреобразуйПикселиВДиалог(Точка тчк);
		public  Точка ПреобразуйДиалогВПиксели(Точка тчк);
		public  Размер ПреобразуйПикселиВДиалог(Размер рм);
		public  Размер ПреобразуйДиалогВПиксели(Размер рм);
		public  проц WarpPointer(цел x, цел y);
		public  проц ЗахватиМышь();
		public  проц ОтпустиМышь();
		public static Окно ПолучиЗахват();
		public  бул ЕстьЗахват();
		public  проц Освежи();
		public  проц Освежи(бул eraseBackground);
		public  проц Освежи(бул eraseBackground, Прямоугольник прям);
		public  проц ОсвежиПрямоугольник(Прямоугольник прям);
		public  проц Обнови();
		public  проц ОчистьФон();
		public  проц Заморозь();
		public  проц Оттай();
		public  проц ПодготовьКР(DC dc);
		public  бул  Выставлен(цел x, цел y, цел w, цел h);
		public  Каретка каретка();
		public  проц каретка(Каретка значение);
		public  цел ВысьСим();
		public  цел ШирьСим();
		public проц ДайПротяженностьТекста(ткст стр, out цел x, out цел y, out цел descent,
								  out цел внешнееВступление, Шрифт шрифт);
		public проц КлиентКЭкрану(inout цел x, inout цел y);
		public Точка КлиентКЭкрану(Точка точкаКлиента);
		public  проц ЭкранККлиенту(inout цел x, inout цел y);
		public Точка ЭкранККлиенту(Точка точкаЭкрана);
		public  проц ОбновиИПОкна();
		public  бул ВсплывающееМеню(Меню меню, Точка поз);
		public  бул ЕстьСкроллбар(цел ориент);
		public  проц УстСкроллбар(цел ориент, цел поз, цел размТумб, цел диапазон, бул освежи);
		public  проц УстПозПрокр(цел ориент, цел поз, бул освежи);
		public  цел ДайПозПрокр(цел ориент);
		public  цел ДайПрокрТумб(цел ориент);
		public  цел ДайПрокрДиапазон(цел ориент);
		public  проц ПрокрутиОкно(цел dx, цел dy, Прямоугольник прям);
		public  бул ПрокрутиСтроки(цел строки);
		public  бул ПрокрутиСтраницы(цел страницы);
		public  бул СтрокаВыше();
		public  бул СтрокаНиже();
		public  бул СтраницаВыше();
		public  бул СтраницаНиже();
		public  ткст ТекстСправки();
		public  проц ТекстСправки(ткст значение);
		public  проц УстТекстСправкиДляИд(ткст текст);
		//public  МишеньСброса мишеньСброса();
		public  проц мишеньСброса(МишеньСброса значение);
		public  бул АвтоРаскладка();
		public  проц АвтоРаскладка(бул значение);
		public  проц УстСайзерИВстрой(Сайзер сайзер, бул удалитьСтар);
		public  Сайзер сайзер();
		public  проц  сайзер(Сайзер значение);
		public  Сайзер ВключающийСайзер();
		public  проц  ВключающийСайзер(Сайзер значение);
		public  Палитра палитра();
		public  проц палитра(Палитра значение);
		public  бул ОсобаяПалитра();
		public  Регион ОбновиРегион();
		public  цел Верх() ;
		public  проц Верх(цел значение);
		public  цел Лево();
		public  проц Лево(цел значение);
		public  цел Право() ;
		public  проц Право( цел значение) ;
		public  цел Низ();
		public  проц Низ(цел значение) ;
		public  цел Ширь() ;
		public  проц Ширь(цел значение) ;
		public  цел Высь() ;
		public  проц Высь(цел значение) ;
		public ПВариантОкна вариантОкна() ;
		public бул Удаляется();
		public проц ЛучшийРазмКэша(Размер разм);
		public проц ИнвалидируйЛучшийРазм();
		public Размер ЛучшийРазмСовмещения();
		public проц ЛучшийРазмСовмещения(Размер значение);
		public Окно[] Отпрыски();
		public ТаблицаАкселераторов табАкселераторов() ;
		public  ВизАтрибуты ДефАтры();
		public static ВизАтрибуты ДефАтрыКласса();
		public static ВизАтрибуты ДефАтрыКласса(ПВариантОкна вариант);
		public  ПСтильФона стильФона();
		public  проц стильФона(ПСтильФона значение);
		public ПБордюр бордюр() ;
		public ПБордюр БордюрПоФлагам(бцел флаги);
		public Окно ПредокСОсобойПалитрой() ;
		public  проц НаследоватьАтры();
		public  бул НаследоватьЦвета();
		public проц LeftUp_Add(ДатчикСобытий значение) ;
		public проц LeftUp_Remove(ДатчикСобытий значение) ;
		public проц RightUp_Add(ДатчикСобытий значение);
		public проц RightUp_Remove(ДатчикСобытий значение) ;
		public проц MiddleUp_Add(ДатчикСобытий значение) ;
		public проц MiddleUp_Remove(ДатчикСобытий значение) ;
		public проц LeftDown_Add(ДатчикСобытий значение);
		public проц LeftDown_Remove(ДатчикСобытий значение) ;
		public проц MiddleDown_Add(ДатчикСобытий значение);
		public проц MiddleDown_Remove(ДатчикСобытий значение) ;
		public проц RightDown_Add(ДатчикСобытий значение);
		public проц RightDown_Remove(ДатчикСобытий значение) ;
		public проц LeftDoubleClick_Add(ДатчикСобытий значение) ;
		public проц LeftDoubleClick_Remove(ДатчикСобытий значение) ;
		public проц RightDoubleClick_Add(ДатчикСобытий значение);
		public проц RightDoubleClick_Remove(ДатчикСобытий значение) ;
		public проц MiddleDoubleClick_Add(ДатчикСобытий значение);
		public проц MiddleDoubleClick_Remove(ДатчикСобытий значение);
		public проц MouseMove_Add(ДатчикСобытий значение);
		public проц MouseMove_Remove(ДатчикСобытий значение) ;
		public проц MouseThumbTrack_Add(ДатчикСобытий значение) ;
		public проц MouseThumbTrack_Remove(ДатчикСобытий значение) ;
		public проц MouseEnter_Add(ДатчикСобытий значение);
		public проц MouseEnter_Remove(ДатчикСобытий значение) ;
		public проц MouseLeave_Add(ДатчикСобытий значение);
		public проц MouseLeave_Remove(ДатчикСобытий значение) ;
		public проц ScrollLineUp_Add(ДатчикСобытий значение) ;
		public проц ScrollLineUp_Remove(ДатчикСобытий значение) ;
		public проц ScrollLineDown_Add(ДатчикСобытий значение) ;
		public проц ScrollLineDown_Remove(ДатчикСобытий значение) ;
		public проц UpdateUI_Add(ДатчикСобытий значение) ;
		public проц UpdateUI_Remove(ДатчикСобытий значение) ;
		public проц KeyDown_Add(ДатчикСобытий значение);
		public проц KeyDown_Remove(ДатчикСобытий значение);
		public проц KeyUp_Add(ДатчикСобытий значение);
		public проц KeyUp_Remove(ДатчикСобытий значение) ;
		public проц Char_Add(ДатчикСобытий значение) ;
		public проц Char_Remove(ДатчикСобытий значение);
		public проц Closing_Add(ДатчикСобытий значение) ;
		public проц Closing_Remove(ДатчикСобытий значение);
		public проц Activated_Add(ДатчикСобытий значение) ;
		public проц Activated_Remove(ДатчикСобытий значение) ;
		public проц Moved_Add(ДатчикСобытий значение);
		public проц Moved_Remove(ДатчикСобытий значение) ;
		public проц Resized_Add(ДатчикСобытий значение) ;
		public проц Resized_Remove(ДатчикСобытий значение) ;
	}

