//-----------------------------------------------------------------------------
// wxD - TextCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TextCtrl.cs
//
/// The wxTextCtrl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: TextCtrl.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

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
		static extern (C) ЦУк wxTextAttr_ctor(ЦУк colText, ЦУк colBack, ЦУк шрифт, цел alignment);
		static extern (C) ЦУк wxTextAttr_ctor2();
		static extern (C) проц   wxTextAttr_dtor(ЦУк сам);
		static extern (C) проц   wxTextAttr_Init(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetTextColour(ЦУк сам, ЦУк colText);
		static extern (C) ЦУк wxTextAttr_GetTextColour(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetBackgroundColour(ЦУк сам, ЦУк colBack);
		static extern (C) ЦУк wxTextAttr_GetBackgroundColour(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) ЦУк wxTextAttr_GetFont(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasTextColour(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasBackgroundColour(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasFont(ЦУк сам);
		static extern (C) бул   wxTextAttr_IsDefault(ЦУк сам);
		
		static extern (C) проц   wxTextAttr_SetAlignment(ЦУк сам, цел alignment);
		static extern (C) цел    wxTextAttr_GetAlignment(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetTabs(ЦУк сам, ЦУк tabs);
		static extern (C) ЦУк wxTextAttr_GetTabs(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetLeftIndent(ЦУк сам, цел indent, цел subIndent);
		static extern (C) цел    wxTextAttr_GetLeftIndent(ЦУк сам);
		static extern (C) цел    wxTextAttr_GetLeftSubIndent(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetRightIndent(ЦУк сам, цел indent);
		static extern (C) цел    wxTextAttr_GetRightIndent(ЦУк сам);
		static extern (C) проц   wxTextAttr_SetFlags(ЦУк сам, бцел флаги);
		static extern (C) бцел   wxTextAttr_GetFlags(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasAlignment(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasTabs(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasLeftIndent(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasRightIndent(ЦУк сам);
		static extern (C) бул   wxTextAttr_HasFlag(ЦУк сам, бцел flag);
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

	
		//---------------------------------------------------------------------
	
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

	        public this(Цвет colText, Цвет colBack=пусто, Шрифт шрифт=пусто, TextAttrAlignment alignment = TextAttrAlignment.wxTEXT_ALIGNMENT_DEFAULT)
        		{ this(wxTextAttr_ctor(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт), cast(цел)alignment), да); }
			
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxTextAttr_dtor(шхобъ); }
			    
		//---------------------------------------------------------------------
		
		public проц TextColour(Цвет значение) { wxTextAttr_SetTextColour(шхобъ, wxObject.SafePtr(значение)); }
		public Цвет TextColour() { return new Цвет(wxTextAttr_GetTextColour(шхобъ), да); }
		
		//---------------------------------------------------------------------
		
		public проц ЦветЗП(Цвет значение) { wxTextAttr_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
		public Цвет ЦветЗП() { return new Цвет(wxTextAttr_GetBackgroundColour(шхобъ), да); }
		
		//---------------------------------------------------------------------
		
		public проц шрифт(Шрифт значение) { wxTextAttr_SetFont(шхобъ, wxObject.SafePtr(значение)); }
		public Шрифт шрифт() { return new Шрифт(wxTextAttr_GetFont(шхобъ)); }
		
		//---------------------------------------------------------------------
		
		public проц Alignment(TextAttrAlignment значение) { wxTextAttr_SetAlignment(шхобъ, cast(цел)значение); }
		public TextAttrAlignment Alignment() { return cast(TextAttrAlignment)wxTextAttr_GetAlignment(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public проц Tabs(цел[] значение)
		{
			МассивЦел ai = new МассивЦел();
			
			for(цел i = 0; i < значение.length; ++i)
				ai.Добавь(значение[i]);
				
			wxTextAttr_SetTabs(шхобъ, МассивЦел.SafePtr(ai));
		}
		public цел[] Tabs()
		{
			return (new МассивЦел(wxTextAttr_GetTabs(шхобъ), да)).вМассив();
		}
		
		//---------------------------------------------------------------------
		
		public проц SetLeftIndent(цел indent)
		{
			SetLeftIndent(indent, 0);
		}
		
		public проц SetLeftIndent(цел indent, цел subIndent)
		{
			wxTextAttr_SetLeftIndent(шхобъ, indent, subIndent);
		}
		
		public цел LeftIndent() { return wxTextAttr_GetLeftIndent(шхобъ); }
		
		public цел LeftSubIndent() { return wxTextAttr_GetLeftSubIndent(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public проц RightIndent(цел значение) { wxTextAttr_SetRightIndent(шхобъ, значение); }
		public цел RightIndent() { return wxTextAttr_GetRightIndent(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public проц Флаги(цел значение) { wxTextAttr_SetFlags(шхобъ, cast(бцел)значение); }
		public цел Флаги() { return cast(цел)wxTextAttr_GetFlags(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasTextColour() { return wxTextAttr_HasTextColour(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasBackgroundColour() { return wxTextAttr_HasBackgroundColour(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasFont() { return wxTextAttr_HasFont(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasAlignment() { return wxTextAttr_HasAlignment(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasTabs() { return wxTextAttr_HasTabs(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasLeftIndent() { return wxTextAttr_HasLeftIndent(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasRightIndent() { return wxTextAttr_HasRightIndent(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasFlag(цел flag)
		{
			return wxTextAttr_HasFlag(шхобъ, cast(бцел)flag); 
		}
		
		//---------------------------------------------------------------------
		
		public бул IsDefault() { return wxTextAttr_IsDefault(шхобъ); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxTextCtrl_GetValue(ЦУк сам);
		static extern (C) проц   wxTextCtrl_SetValue(ЦУк сам, ткст значение);
		static extern (C) ЦУк wxTextCtrl_GetRange(ЦУк сам, бцел from, бцел to);
		static extern (C) цел    wxTextCtrl_GetLineLength(ЦУк сам, бцел lineNo);
		static extern (C) ЦУк wxTextCtrl_GetLineText(ЦУк сам, бцел lineNo);
		static extern (C) цел    wxTextCtrl_GetNumberOfLines(ЦУк сам);
		static extern (C) бул   wxTextCtrl_IsModified(ЦУк сам);
		static extern (C) бул   wxTextCtrl_IsEditable(ЦУк сам);
		static extern (C) бул   wxTextCtrl_IsSingleLine(ЦУк сам);
		static extern (C) бул   wxTextCtrl_IsMultiLine(ЦУк сам);
		static extern (C) проц   wxTextCtrl_GetSelection(ЦУк сам, out цел from, out цел to);
		static extern (C) ЦУк wxTextCtrl_GetStringSelection(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Clear(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Replace(ЦУк сам, бцел from, бцел to, ткст значение);
		static extern (C) проц   wxTextCtrl_Remove(ЦУк сам, бцел from, бцел to);
		static extern (C) бул   wxTextCtrl_LoadFile(ЦУк сам, ткст file);
		static extern (C) бул   wxTextCtrl_SaveFile(ЦУк сам, ткст file);
		static extern (C) проц   wxTextCtrl_MarkDirty(ЦУк сам);
		static extern (C) проц   wxTextCtrl_DiscardEdits(ЦУк сам);
		static extern (C) проц   wxTextCtrl_SetMaxLength(ЦУк сам, бцел len);
		static extern (C) проц   wxTextCtrl_WriteText(ЦУк сам, ткст текст);
		static extern (C) проц   wxTextCtrl_AppendText(ЦУк сам, ткст текст);
		static extern (C) бул   wxTextCtrl_EmulateKeyPress(ЦУк сам, ЦУк evt);
		static extern (C) бул   wxTextCtrl_SetStyle(ЦУк сам, бцел start, бцел end, ЦУк стиль);
		static extern (C) бул   wxTextCtrl_GetStyle(ЦУк сам, бцел position, inout ЦУк стиль);
		static extern (C) бул   wxTextCtrl_SetDefaultStyle(ЦУк сам, ЦУк стиль);
		static extern (C) ЦУк wxTextCtrl_GetDefaultStyle(ЦУк сам);
		static extern (C) бцел   wxTextCtrl_XYToPosition(ЦУк сам, бцел x, бцел y);
		static extern (C) бул   wxTextCtrl_PositionToXY(ЦУк сам, бцел поз, out цел x, out цел y);
		static extern (C) проц   wxTextCtrl_ShowPosition(ЦУк сам, бцел поз);
		static extern (C) цел    wxTextCtrl_HitTest(ЦУк сам, inout Точка pt, out цел поз);
		static extern (C) цел    wxTextCtrl_HitTest2(ЦУк сам, inout Точка pt, out цел col, out цел row);
		static extern (C) проц   wxTextCtrl_Copy(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Cut(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Paste(ЦУк сам);
		static extern (C) бул   wxTextCtrl_CanCopy(ЦУк сам);
		static extern (C) бул   wxTextCtrl_CanCut(ЦУк сам);
		static extern (C) бул   wxTextCtrl_CanPaste(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Undo(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Redo(ЦУк сам);
		static extern (C) бул   wxTextCtrl_CanUndo(ЦУк сам);
		static extern (C) бул   wxTextCtrl_CanRedo(ЦУк сам);
		static extern (C) проц   wxTextCtrl_SetInsertionPoint(ЦУк сам, бцел поз);
		static extern (C) проц   wxTextCtrl_SetInsertionPointEnd(ЦУк сам);
		static extern (C) бцел   wxTextCtrl_GetInsertionPoint(ЦУк сам);
		static extern (C) бцел   wxTextCtrl_GetLastPosition(ЦУк сам);
		static extern (C) проц   wxTextCtrl_SetSelection(ЦУк сам, бцел from, бцел to);
		static extern (C) проц   wxTextCtrl_SelectAll(ЦУк сам);
		static extern (C) проц   wxTextCtrl_SetEditable(ЦУк сам, бул editable);
		static extern (C)        ЦУк wxTextCtrl_ctor();
		static extern (C) бул   wxTextCtrl_Create(ЦУк сам, ЦУк родитель, цел ид, ткст значение, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) бул   wxTextCtrl_Enable(ЦУк сам, бул enable);
		static extern (C) проц   wxTextCtrl_OnDropFiles(ЦУк сам, ЦУк evt);
		static extern (C) бул   wxTextCtrl_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) бул   wxTextCtrl_SetForegroundColour(ЦУк сам, ЦУк colour);
		static extern (C) бул   wxTextCtrl_SetBackgroundColour(ЦУк сам, ЦУк colour);
		static extern (C) проц   wxTextCtrl_Freeze(ЦУк сам);
		static extern (C) проц   wxTextCtrl_Thaw(ЦУк сам);
		static extern (C) бул   wxTextCtrl_ScrollLines(ЦУк сам, цел lines);
		static extern (C) бул   wxTextCtrl_ScrollPages(ЦУк сам, цел pages);
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

		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this(Окно родитель, цел ид, ткст значение="", Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator validator = пусто, ткст имя = wxTextCtrlNameStr)
		{
			this(wxTextCtrl_ctor());
			if (!wxTextCtrl_Create(шхобъ, wxObject.SafePtr(родитель), ид, значение, поз, size, cast(бцел)стиль, wxObject.SafePtr(validator), имя))
			{
				throw new InvalidOperationException("Failed to create TextCtrl");
			}
		}

		public static wxObject Нов(ЦУк шхобъ)
		{
			return new TextCtrl(шхобъ);
		}
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст значение="", Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator validator = пусто, ткст имя = wxTextCtrlNameStr)
			{ this(родитель, Окно.UniqueID, значение, поз, size, 0, validator, имя);}
	
		//---------------------------------------------------------------------

		public проц Очисть()
		{
			wxTextCtrl_Clear(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public override проц ЦветЗП(Цвет значение)
		{
			wxTextCtrl_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение));
		}
	
		public override проц ЦветПП(Цвет значение)
		{
			wxTextCtrl_SetForegroundColour(шхобъ, wxObject.SafePtr(значение));
		}
	
		//---------------------------------------------------------------------
	
		public ткст Value() 
			{
				return cast(ткст) new wxString(wxTextCtrl_GetValue(шхобъ), да);
			}
		public проц Value(ткст значение) 
			{
				wxTextCtrl_SetValue(шхобъ, значение);
			}
	
		//---------------------------------------------------------------------
	
		public ткст GetRange(цел from, цел to)
		{
			return cast(ткст) new wxString(wxTextCtrl_GetRange(шхобъ, cast(бцел)from, cast(бцел)to), да);
		}
	
		//---------------------------------------------------------------------
	
		public цел LineLength(цел lineNo)
		{
			return wxTextCtrl_GetLineLength(шхобъ, cast(бцел)lineNo);
		}
	
		public ткст GetLineText(цел lineNo)
		{
			return cast(ткст) new wxString(wxTextCtrl_GetLineText(шхобъ, cast(бцел)lineNo), да);
		}
	
		public цел GetNumberOfLines()
		{
			return wxTextCtrl_GetNumberOfLines(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public бул IsModified() { return wxTextCtrl_IsModified(шхобъ); }
	
		public бул IsEditable() { return wxTextCtrl_IsEditable(шхобъ); }
	
		public бул IsSingleLine() { return wxTextCtrl_IsSingleLine(шхобъ); }
	
		public бул IsMultiLine() { return wxTextCtrl_IsMultiLine(шхобъ); }
	
		//---------------------------------------------------------------------
	
		public проц GetSelection(out цел from, out цел to)
		{
			wxTextCtrl_GetSelection(шхобъ, from, to);
		}
	
		//---------------------------------------------------------------------
	
		public проц Замени(цел from, цел to, ткст значение)
		{
			wxTextCtrl_Replace(шхобъ, cast(бцел)from, cast(бцел)to, значение);
		}
	
		public проц Remove(цел from, цел to)
		{
			wxTextCtrl_Remove(шхобъ, cast(бцел)from, cast(бцел)to);
		}
	
		//---------------------------------------------------------------------
	
		public бул ЗагрузиФайл(ткст file)
		{
			return wxTextCtrl_LoadFile(шхобъ, file);
		}
		
		// using wx.NET with wxGTK wxTextCtrl_LoadFile didn't work
		// LoadFileNET uses StreamReader
		// this should also handle encoding problems...
/+
		public бул LoadFileNET(ткст file)
		{
			try
			{
				System.IO.StreamReader sr = new System.IO.StreamReader(file);
				ткст s = sr.ReadToEnd();
				sr.Закрой();
				AppendText(s);
				
				return да;
				
			} catch ( Exception e )
			{
				return нет;
			}
		}
+/
	
		public бул СохраниФайл(ткст file)
		{
			return wxTextCtrl_SaveFile(шхобъ, file);
		}
		
		// counterpart of LoadFileNET
/+
		public бул SaveFileNET(ткст file)
		{
			try
			{
				System.IO.StreamWriter sw = new System.IO.StreamWriter(file);
				sw.Write(Value);
				sw.Закрой();
				
				return да;
			} catch ( Exception e )
			{
				return нет;
			}
		}
+/
	
		//---------------------------------------------------------------------
	
		public проц DiscardEdits()
		{
			wxTextCtrl_DiscardEdits(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public проц MarkDirty()
		{
			wxTextCtrl_MarkDirty(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public проц MaxLength(цел значение) { wxTextCtrl_SetMaxLength(шхобъ, cast(бцел)значение); }
	
		//---------------------------------------------------------------------
	
		public проц WriteText(ткст текст)
		{
			wxTextCtrl_WriteText(шхобъ, текст);
		}
		
		//---------------------------------------------------------------------
	
		public проц AppendText(ткст текст)
		{
			wxTextCtrl_AppendText(шхобъ, текст);
		}
		
		//---------------------------------------------------------------------
		
		public бул EmulateKeyPress(СобКлавиши evt)
		{
			return wxTextCtrl_EmulateKeyPress(шхобъ, wxObject.SafePtr(evt));
		}
	
		//---------------------------------------------------------------------
	
		public бул SetStyle(цел start, цел end, TextAttr стиль)
		{
			return wxTextCtrl_SetStyle(шхобъ, cast(бцел)start, cast(бцел)end, wxObject.SafePtr(стиль));
		}
		
		public бул GetStyle(цел position, inout TextAttr стиль)
		{
			ЦУк tmp = wxObject.SafePtr(стиль);
			бул retval = wxTextCtrl_GetStyle(шхобъ, cast(бцел)position, tmp);
			стиль.шхобъ = tmp;
			return retval;
		}
		
		//---------------------------------------------------------------------
	
		public бул SetDefaultStyle(TextAttr стиль)
		{
			return wxTextCtrl_SetDefaultStyle(шхобъ, wxObject.SafePtr(стиль));
		}
		
		public TextAttr GetDefaultStyle()
		{
			return cast(TextAttr)FindObject(wxTextCtrl_GetDefaultStyle(шхобъ));
		}
	
		//---------------------------------------------------------------------
	
		public цел XYToPosition(цел x, цел y)
		{
			return wxTextCtrl_XYToPosition(шхобъ, cast(бцел)x, cast(бцел)y);
		}
	
		public бул PositionToXY(цел поз, out цел x, out цел y)
		{
			return wxTextCtrl_PositionToXY(шхобъ, cast(бцел)поз, x, y);
		}
	
		public проц ShowPosition(цел поз)
		{
			wxTextCtrl_ShowPosition(шхобъ, cast(бцел)поз);
		}
	
		//---------------------------------------------------------------------
		
		public TextCtrlHitTestResult HitTest(Точка pt, out цел поз)
		{
			return cast(TextCtrlHitTestResult)wxTextCtrl_HitTest(шхобъ, pt, поз);
		}
		
		public TextCtrlHitTestResult HitTest(Точка pt, out цел col, out цел row)
		{
			return cast(TextCtrlHitTestResult)wxTextCtrl_HitTest2(шхобъ, pt, col, row);
		}
		
		//---------------------------------------------------------------------
	
		public проц Копируй()
		{
			wxTextCtrl_Copy(шхобъ);
		}
	
		public проц Cut()
		{
			wxTextCtrl_Cut(шхобъ);
		}
	
		public проц Вставь()
		{
			wxTextCtrl_Paste(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public бул CanCopy()
		{
			return wxTextCtrl_CanCopy(шхобъ);
		}
	
		public бул CanCut()
		{
			return wxTextCtrl_CanCut(шхобъ);
		}
	
		public бул CanPaste()
		{
			return wxTextCtrl_CanPaste(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public проц Undo()
		{
			wxTextCtrl_Undo(шхобъ);
		}
	
		public проц Redo()
		{
			wxTextCtrl_Redo(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public бул CanUndo()
		{
			return wxTextCtrl_CanUndo(шхобъ);
		}
	
		public бул CanRedo()
		{
			return wxTextCtrl_CanRedo(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public проц InsertionPoint(цел значение) 
			{
				wxTextCtrl_SetInsertionPoint(шхобъ, cast(бцел)значение);
			}
		public цел InsertionPoint() 
			{
				return wxTextCtrl_GetInsertionPoint(шхобъ);
			}
	
		public проц SetInsertionPointEnd()
		{
			wxTextCtrl_SetInsertionPointEnd(шхобъ);
		}
	
		public цел GetLastPosition()
		{
			return cast(цел)wxTextCtrl_GetLastPosition(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public проц SetSelection(цел from, цел to)
		{
			wxTextCtrl_SetSelection(шхобъ, cast(бцел)from, cast(бцел)to);
		}
	
		public проц SelectAll()
		{
			wxTextCtrl_SelectAll(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public проц SetEditable(бул editable)
		{
			wxTextCtrl_SetEditable(шхобъ, editable);
		}
	
		//---------------------------------------------------------------------
	
		public бул Enable(бул enable)
		{
			return wxTextCtrl_Enable(шхобъ, enable);
		}
	
		//---------------------------------------------------------------------
	
		public /+virtual+/ проц OnDropFiles(Событие evt)
		{
			wxTextCtrl_OnDropFiles(шхобъ, wxObject.SafePtr(evt));
		}
	
		//---------------------------------------------------------------------
	
		public override проц Freeze()
		{
			wxTextCtrl_Freeze(шхобъ);
		}
	
		public override проц Thaw()
		{
			wxTextCtrl_Thaw(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public override бул ScrollLines(цел lines)
		{
			return wxTextCtrl_ScrollLines(шхобъ, lines);
		}
	
		public override бул ScrollPages(цел pages)
		{
			return wxTextCtrl_ScrollPages(шхобъ, pages);
		}
	
		//---------------------------------------------------------------------
	
		public override проц UpdateUI_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TEXT_UPDATED, ИД, значение, this); }
		public override проц UpdateUI_Remove(EventListener значение)	{ RemoveHandler(значение, this); }

		public проц Enter_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TEXT_ENTER, ИД, значение, this); }
		public проц Enter_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxTextUrlEvent_ctor(цел ид, ЦУк evtMouse, бцел start, бцел end);
		static extern (C) бцел   wxTextUrlEvent_GetURLStart(ЦУк сам);
		static extern (C) бцел   wxTextUrlEvent_GetURLEnd(ЦУк сам);
		//! \endcond
	
	alias TextUrlEvent wxTextUrlEvent;
	public class TextUrlEvent : CommandEvent
    	{
		// TODO: Замени Событие with EventMouse
		public this(цел ид, Событие evtMouse, цел start, цел end)
		{ super(wxTextUrlEvent_ctor(ид, wxObject.SafePtr(evtMouse), cast(бцел)start, cast(бцел)end));}
	}
