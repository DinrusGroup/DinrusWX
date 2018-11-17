module wx.TextCtrl;
public import wx.common;
public import wx.Control;
public import wx.CommandEvent;
public import wx.KeyEvent;

	public enum TextAttrAlignment
	{
		wxTEXT_ALIGNMENT_DEFAULT,
		wxTEXT_ALIGNMENT_LEFT,
		wxTEXT_ALIGNMENT_CENTRE,
		wxTEXT_ALIGNMENT_CENTER = wxTEXT_ALIGNMENT_CENTRE,
		wxTEXT_ALIGNMENT_RIGHT,
		wxTEXT_ALIGNMENT_JUSTIFIED
	}
	
	//---------------------------------------------------------------------
	
	public enum TextCtrlHitTestResult
	{
		wxTE_HT_UNKNOWN = -2,
		wxTE_HT_BEFORE,      
		wxTE_HT_ON_TEXT,     
		wxTE_HT_BELOW,       
		wxTE_HT_BEYOND       
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTextAttr_ctor(IntPtr colText, IntPtr colBack, IntPtr шрифт, цел alignment);
		static extern (C) IntPtr wxTextAttr_ctor2();
		static extern (C) проц   wxTextAttr_dtor(IntPtr сам);
		static extern (C) проц   wxTextAttr_Init(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetTextColour(IntPtr сам, IntPtr colText);
		static extern (C) IntPtr wxTextAttr_GetTextColour(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetBackgroundColour(IntPtr сам, IntPtr colBack);
		static extern (C) IntPtr wxTextAttr_GetBackgroundColour(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxTextAttr_GetFont(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasTextColour(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasBackgroundColour(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasFont(IntPtr сам);
		static extern (C) бул   wxTextAttr_IsDefault(IntPtr сам);
		
		static extern (C) проц   wxTextAttr_SetAlignment(IntPtr сам, цел alignment);
		static extern (C) цел    wxTextAttr_GetAlignment(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetTabs(IntPtr сам, IntPtr tabs);
		static extern (C) IntPtr wxTextAttr_GetTabs(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetLeftIndent(IntPtr сам, цел indent, цел subIndent);
		static extern (C) цел    wxTextAttr_GetLeftIndent(IntPtr сам);
		static extern (C) цел    wxTextAttr_GetLeftSubIndent(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetRightIndent(IntPtr сам, цел indent);
		static extern (C) цел    wxTextAttr_GetRightIndent(IntPtr сам);
		static extern (C) проц   wxTextAttr_SetФлаги(IntPtr сам, бцел флаги);
		static extern (C) бцел   wxTextAttr_GetFlags(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasAlignment(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasTabs(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasLeftIndent(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasRightIndent(IntPtr сам);
		static extern (C) бул   wxTextAttr_HasFlag(IntPtr сам, бцел флаг);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias TextAttr wxTextAttr;
	public class TextAttr : wxObject
	{
		public const цел wxTEXT_ATTR_TEXT_COLOUR =		0x0001;
		public const цел wxTEXT_ATTR_BACKGROUND_COLOUR =	0x0002;
		public const цел wxTEXT_ATTR_FONT_FACE =		0x0004;
		public const цел wxTEXT_ATTR_FONT_SIZE = 		0x0008;
		public const цел wxTEXT_ATTR_FONT_WEIGHT =		0x0010;
		public const цел wxTEXT_ATTR_FONT_ITALIC =		0x0020;
		public const цел wxTEXT_ATTR_FONT_UNDERLINE =		0x0040;
		public const цел wxTEXT_ATTR_FONT = wxTEXT_ATTR_FONT_FACE | wxTEXT_ATTR_FONT_SIZE | 
							wxTEXT_ATTR_FONT_WEIGHT | wxTEXT_ATTR_FONT_ITALIC | 
							wxTEXT_ATTR_FONT_UNDERLINE;
		public const цел wxTEXT_ATTR_ALIGNMENT =		0x0080;
		public const цел wxTEXT_ATTR_LEFT_INDENT =		0x0100;
		public const цел wxTEXT_ATTR_RIGHT_INDENT =		0x0200;
		public const цел wxTEXT_ATTR_TABS =			0x0400;

		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
	        public this(Цвет colText, Цвет colBack=null, Шрифт шрифт=null, TextAttrAlignment alignment = TextAttrAlignment.wxTEXT_ALIGNMENT_DEFAULT);
		override protected проц dtor();
		public проц ЦветТекста(Цвет значение) ;
		public Цвет ЦветТекста() ;
		public проц ЦветФона(Цвет значение) ;
		public Цвет ЦветФона() ;
		public проц шрифт(Шрифт значение);
		public Шрифт шрифт();
		public проц Alignment(TextAttrAlignment значение);
		public TextAttrAlignment Alignment();
		public проц Tabs(цел[] значение);
		public цел[] Tabs();
		public проц УстLeftIndent(цел indent);
		public проц УстLeftIndent(цел indent, цел subIndent);
		public цел LeftIndent();
		public цел LeftSubIndent() ;
		public проц RightIndent(цел значение);
		public цел RightIndent() ;
		public проц Флаги(цел значение);
		public цел Флаги();
		public бул ЕстьЦветТекста() ;
		public бул ЕстьЦветФона() ;
		public бул ЕстьШрифт() ;
		public бул HasAlignment() ;
		public бул HasTabs();
		public бул HasLeftIndent();
		public бул HasRightIndent() ;
		public бул ЕстьФлаг(цел флаг);
		public бул IsDefault();
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTextCtrl_GetValue(IntPtr сам);
		static extern (C) проц   wxTextCtrl_SetValue(IntPtr сам, ткст значение);
		static extern (C) IntPtr wxTextCtrl_GetRange(IntPtr сам, бцел from, бцел to);
		static extern (C) цел    wxTextCtrl_GetLineLength(IntPtr сам, бцел lineNo);
		static extern (C) IntPtr wxTextCtrl_GetLineText(IntPtr сам, бцел lineNo);
		static extern (C) цел    wxTextCtrl_GetNumberOfLines(IntPtr сам);
		static extern (C) бул   wxTextCtrl_IsModified(IntPtr сам);
		static extern (C) бул   wxTextCtrl_IsEditable(IntPtr сам);
		static extern (C) бул   wxTextCtrl_IsSingleLine(IntPtr сам);
		static extern (C) бул   wxTextCtrl_IsMultiLine(IntPtr сам);
		static extern (C) проц   wxTextCtrl_GetSelection(IntPtr сам, out цел from, out цел to);
		static extern (C) IntPtr wxTextCtrl_GetStringSelection(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Clear(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Replace(IntPtr сам, бцел from, бцел to, ткст значение);
		static extern (C) проц   wxTextCtrl_Remove(IntPtr сам, бцел from, бцел to);
		static extern (C) бул   wxTextCtrl_LoadFile(IntPtr сам, ткст file);
		static extern (C) бул   wxTextCtrl_SaveFile(IntPtr сам, ткст file);
		static extern (C) проц   wxTextCtrl_MarkDirty(IntPtr сам);
		static extern (C) проц   wxTextCtrl_DiscardEdits(IntPtr сам);
		static extern (C) проц   wxTextCtrl_SetMaxLength(IntPtr сам, бцел len);
		static extern (C) проц   wxTextCtrl_WriteText(IntPtr сам, ткст текст);
		static extern (C) проц   wxTextCtrl_AppendText(IntPtr сам, ткст текст);
		static extern (C) бул   wxTextCtrl_EmulateKeyPress(IntPtr сам, IntPtr evt);
		static extern (C) бул   wxTextCtrl_SetStyle(IntPtr сам, бцел start, бцел end, IntPtr стиль);
		static extern (C) бул   wxTextCtrl_GetStyle(IntPtr сам, бцел position, inout IntPtr стиль);
		static extern (C) бул   wxTextCtrl_SetDefaultStyle(IntPtr сам, IntPtr стиль);
		static extern (C) IntPtr wxTextCtrl_GetDefaultStyle(IntPtr сам);
		static extern (C) бцел   wxTextCtrl_XYToPosition(IntPtr сам, бцел x, бцел y);
		static extern (C) бул   wxTextCtrl_PositionToXY(IntPtr сам, бцел поз, out цел x, out цел y);
		static extern (C) проц   wxTextCtrl_ShowPosition(IntPtr сам, бцел поз);
		static extern (C) цел    wxTextCtrl_HitTest(IntPtr сам, inout Точка тчк, out цел поз);
		static extern (C) цел    wxTextCtrl_HitTest2(IntPtr сам, inout Точка тчк, out цел col, out цел row);
		static extern (C) проц   wxTextCtrl_Copy(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Cut(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Paste(IntPtr сам);
		static extern (C) бул   wxTextCtrl_CanCopy(IntPtr сам);
		static extern (C) бул   wxTextCtrl_CanCut(IntPtr сам);
		static extern (C) бул   wxTextCtrl_CanPaste(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Undo(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Redo(IntPtr сам);
		static extern (C) бул   wxTextCtrl_CanUndo(IntPtr сам);
		static extern (C) бул   wxTextCtrl_CanRedo(IntPtr сам);
		static extern (C) проц   wxTextCtrl_SetInsertionPoint(IntPtr сам, бцел поз);
		static extern (C) проц   wxTextCtrl_SetInsertionPointEnd(IntPtr сам);
		static extern (C) бцел   wxTextCtrl_GetInsertionPoint(IntPtr сам);
		static extern (C) бцел   wxTextCtrl_GetLastPosition(IntPtr сам);
		static extern (C) проц   wxTextCtrl_SetSelection(IntPtr сам, бцел from, бцел to);
		static extern (C) проц   wxTextCtrl_SelectAll(IntPtr сам);
		static extern (C) проц   wxTextCtrl_SetEditable(IntPtr сам, бул editable);
		static extern (C)        IntPtr wxTextCtrl_ctor();
		static extern (C) бул   wxTextCtrl_Create(IntPtr сам, IntPtr родитель, цел ид, ткст значение, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) бул   wxTextCtrl_Enable(IntPtr сам, бул вкл);
		static extern (C) проц   wxTextCtrl_OnDropFiles(IntPtr сам, IntPtr evt);
		static extern (C) бул   wxTextCtrl_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) бул   wxTextCtrl_SetForegroundColour(IntPtr сам, IntPtr цвет);
		static extern (C) бул   wxTextCtrl_SetBackgroundColour(IntPtr сам, IntPtr цвет);
		static extern (C) проц   wxTextCtrl_Freeze(IntPtr сам);
		static extern (C) проц   wxTextCtrl_Thaw(IntPtr сам);
		static extern (C) бул   wxTextCtrl_ScrollLines(IntPtr сам, цел строки);
		static extern (C) бул   wxTextCtrl_ScrollPages(IntPtr сам, цел страницы);
		//! \endcond

		//---------------------------------------------------------------------
        
	alias TextCtrl wxTextCtrl;
	public class TextCtrl : Control
	{
		public const цел wxTE_NO_VSCROLL       = 0x0002;
		public const цел wxTE_AUTO_SCROLL      = 0x0008;
	
		public const цел wxTE_READONLY         = 0x0010;
		public const цел wxTE_MULTILINE        = 0x0020;
		public const цел wxTE_PROCESS_TAB      = 0x0040;
	
		public const цел wxTE_LEFT             = 0x0000;
		public const цел wxTE_CENTER           = Alignment.wxALIGN_CENTER;
		public const цел wxTE_RIGHT            = Alignment.wxALIGN_RIGHT;
	
		public const цел wxTE_RICH             = 0x0080;
		public const цел wxTE_PROCESS_ENTER    = 0x0400;
		public const цел wxTE_PASSWORD         = 0x0800;
	
		public const цел wxTE_AUTO_URL         = 0x1000;
		public const цел wxTE_NOHIDESEL        = 0x2000;
		public const цел wxTE_DONTWRAP         = Окно.wxHSCROLL;
		public const цел wxTE_LINEWRAP         = 0x4000;
		public const цел wxTE_WORDWRAP         = 0x0000;
		public const цел wxTE_RICH2            = 0x8000;


		public const ткст wxTextCtrlNameStr = "текст";
		//---------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this(Окно родитель, цел ид, ткст значение="", Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxTextCtrlNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, ткст значение="", Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxTextCtrlNameStr);
		public проц Clear();
		public override проц ЦветФона(Цвет значение);
		public override проц ЦветПП(Цвет значение);
		public ткст Value() ;
		public проц Value(ткст значение) ;
		public ткст GetRange(цел from, цел to);
		public цел LineLength(цел lineNo);
		public ткст GetLineText(цел lineNo);
		public цел GetNumberOfLines();
		public бул IsModified() ;
		public бул IsEditable();
		public бул IsSingleLine() ;
		public бул IsMultiLine() ;
		public проц GetSelection(out цел from, out цел to);
		public проц Replace(цел from, цел to, ткст значение);
		public проц Remove(цел from, цел to);
		public бул ЗагрузиФайл(ткст file);
		public бул СохраниФайл(ткст file);
		public проц DiscardEdits();
		public проц MarkDirty();
		public проц MaxLength(цел значение) ;
		public проц WriteText(ткст текст);
		public проц AppendText(ткст текст);
		public бул EmulateKeyPress(KeyEvent evt);
		public бул УстStyle(цел start, цел end, TextAttr стиль);
		public бул GetStyle(цел position, inout TextAttr стиль);
		public бул УстDefaultStyle(TextAttr стиль);
		public TextAttr GetDefaultStyle();
		public цел XYToPosition(цел x, цел y);
		public бул PositionToXY(цел поз, out цел x, out цел y);
		public проц ShowPosition(цел поз);
		public TextCtrlHitTestResult ТестНажатия(Точка тчк, out цел поз);
		public TextCtrlHitTestResult ТестНажатия(Точка тчк, out цел col, out цел row);
		public проц Copy();
		public проц Cut();
		public проц Paste();
		public бул CanCopy();
		public бул CanCut();
		public бул CanPaste();
		public проц Undo();
		public проц Redo();
		public бул CanUndo();
		public бул CanRedo();
		public проц InsertionPoint(цел значение) ;
		public цел InsertionPoint() ;
		public проц УстInsertionPointEnd();
		public цел GetLastPosition();
		public проц УстSelection(цел from, цел to);
		public проц SelectAll();
		public проц УстEditable(бул editable);
		public бул Включи(бул вкл);
		public  проц OnDropFiles(Событие evt);
		public override проц Заморозь();
		public override проц Оттай();
		public override бул ПрокрутиСтроки(цел строки);
		public override бул ПрокрутиСтраницы(цел страницы);
		public override проц UpdateUI_Add(ДатчикСобытий значение);
		public override проц UpdateUI_Remove(ДатчикСобытий значение)	;
		public проц Enter_Add(ДатчикСобытий значение) ;
		public проц Enter_Remove(ДатчикСобытий значение) ;
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTextUrlEvent_ctor(цел ид, IntPtr evtMouse, бцел start, бцел end);
		static extern (C) бцел   wxTextUrlEvent_GetURLStart(IntPtr сам);
		static extern (C) бцел   wxTextUrlEvent_GetURLEnd(IntPtr сам);
		//! \endcond
	
	alias TextUrlEvent wxTextUrlEvent;
	public class TextUrlEvent : СобытиеКоманда
    	{
		// TODO: Replace Событие with EventMouse
		public this(цел ид, Событие evtMouse, цел start, цел end);
	}
