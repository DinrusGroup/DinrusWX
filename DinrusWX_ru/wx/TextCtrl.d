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
static extern (C) ЦелУкз wxTextAttr_ctor(ЦелУкз colText, ЦелУкз colBack, ЦелУкз шрифт, цел alignment);
static extern (C) ЦелУкз wxTextAttr_ctor2();
static extern (C) проц   wxTextAttr_dtor(ЦелУкз сам);
static extern (C) проц   wxTextAttr_Init(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetTextColour(ЦелУкз сам, ЦелУкз colText);
static extern (C) ЦелУкз wxTextAttr_GetTextColour(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз colBack);
static extern (C) ЦелУкз wxTextAttr_GetBackgroundColour(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxTextAttr_GetFont(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasTextColour(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasBackgroundColour(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasFont(ЦелУкз сам);
static extern (C) бул   wxTextAttr_IsDefault(ЦелУкз сам);

static extern (C) проц   wxTextAttr_SetAlignment(ЦелУкз сам, цел alignment);
static extern (C) цел    wxTextAttr_GetAlignment(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetTabs(ЦелУкз сам, ЦелУкз tabs);
static extern (C) ЦелУкз wxTextAttr_GetTabs(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetLeftIndent(ЦелУкз сам, цел indent, цел subIndent);
static extern (C) цел    wxTextAttr_GetLeftIndent(ЦелУкз сам);
static extern (C) цел    wxTextAttr_GetLeftSubIndent(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetRightIndent(ЦелУкз сам, цел indent);
static extern (C) цел    wxTextAttr_GetRightIndent(ЦелУкз сам);
static extern (C) проц   wxTextAttr_SetФлаги(ЦелУкз сам, бцел флаги);
static extern (C) бцел   wxTextAttr_GetFlags(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasAlignment(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasTabs(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasLeftIndent(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasRightIndent(ЦелУкз сам);
static extern (C) бул   wxTextAttr_HasFlag(ЦелУкз сам, бцел flag);
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

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this(Цвет colText, Цвет colBack=null, Шрифт шрифт=null, TextAttrAlignment alignment = TextAttrAlignment.wxTEXT_ALIGNMENT_DEFAULT)
    {
        this(wxTextAttr_ctor(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт), cast(цел)alignment), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxTextAttr_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public проц цветТекста(Цвет значение)
    {
        wxTextAttr_SetTextColour(wxobj, wxObject.SafePtr(значение));
    }
    public Цвет цветТекста()
    {
        return new Цвет(wxTextAttr_GetTextColour(wxobj), да);
    }

    //---------------------------------------------------------------------

    public проц цветФона(Цвет значение)
    {
        wxTextAttr_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }
    public Цвет цветФона()
    {
        return new Цвет(wxTextAttr_GetBackgroundColour(wxobj), да);
    }

    //---------------------------------------------------------------------

    public проц шрифт(Шрифт значение)
    {
        wxTextAttr_SetFont(wxobj, wxObject.SafePtr(значение));
    }
    public Шрифт шрифт()
    {
        return new Шрифт(wxTextAttr_GetFont(wxobj));
    }

    //---------------------------------------------------------------------

    public проц Alignment(TextAttrAlignment значение)
    {
        wxTextAttr_SetAlignment(wxobj, cast(цел)значение);
    }
    public TextAttrAlignment Alignment()
    {
        return cast(TextAttrAlignment)wxTextAttr_GetAlignment(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Tabs(цел[] значение)
    {
        ЦелМассив ai = new ЦелМассив();

        for(цел i = 0; i < значение.length; ++i)
            ai.Добавь(значение[i]);

        wxTextAttr_SetTabs(wxobj, ЦелМассив.SafePtr(ai));
    }
    public цел[] Tabs()
    {
        return (new ЦелМассив(wxTextAttr_GetTabs(wxobj), да)).вМассив();
    }

    //---------------------------------------------------------------------

    public проц УстLeftIndent(цел indent)
    {
        УстLeftIndent(indent, 0);
    }

    public проц УстLeftIndent(цел indent, цел subIndent)
    {
        wxTextAttr_SetLeftIndent(wxobj, indent, subIndent);
    }

    public цел LeftIndent()
    {
        return wxTextAttr_GetLeftIndent(wxobj);
    }

    public цел LeftSubIndent()
    {
        return wxTextAttr_GetLeftSubIndent(wxobj);
    }

    //---------------------------------------------------------------------

    public проц RightIndent(цел значение)
    {
        wxTextAttr_SetRightIndent(wxobj, значение);
    }
    public цел RightIndent()
    {
        return wxTextAttr_GetRightIndent(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Флаги(цел значение)
    {
        wxTextAttr_SetФлаги(wxobj, cast(бцел)значение);
    }
    public цел Флаги()
    {
        return cast(цел)wxTextAttr_GetFlags(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьЦветТекста()
    {
        return wxTextAttr_HasTextColour(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьЦветФона()
    {
        return wxTextAttr_HasBackgroundColour(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьШрифт()
    {
        return wxTextAttr_HasFont(wxobj);
    }

    //---------------------------------------------------------------------

    public бул HasAlignment()
    {
        return wxTextAttr_HasAlignment(wxobj);
    }

    //---------------------------------------------------------------------

    public бул HasTabs()
    {
        return wxTextAttr_HasTabs(wxobj);
    }

    //---------------------------------------------------------------------

    public бул HasLeftIndent()
    {
        return wxTextAttr_HasLeftIndent(wxobj);
    }

    //---------------------------------------------------------------------

    public бул HasRightIndent()
    {
        return wxTextAttr_HasRightIndent(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ЕстьФлаг(цел flag)
    {
        return wxTextAttr_HasFlag(wxobj, cast(бцел)flag);
    }

    //---------------------------------------------------------------------

    public бул IsDefault()
    {
        return wxTextAttr_IsDefault(wxobj);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxTextCtrl_GetValue(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_SetValue(ЦелУкз сам, ткст значение);
static extern (C) ЦелУкз wxTextCtrl_GetRange(ЦелУкз сам, бцел from, бцел to);
static extern (C) цел    wxTextCtrl_GetLineLength(ЦелУкз сам, бцел lineNo);
static extern (C) ЦелУкз wxTextCtrl_GetLineText(ЦелУкз сам, бцел lineNo);
static extern (C) цел    wxTextCtrl_GetNumberOfLines(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_IsModified(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_IsEditable(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_IsSingleLine(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_IsMultiLine(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_GetSelection(ЦелУкз сам, out цел from, out цел to);
static extern (C) ЦелУкз wxTextCtrl_GetStringSelection(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Clear(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Replace(ЦелУкз сам, бцел from, бцел to, ткст значение);
static extern (C) проц   wxTextCtrl_Remove(ЦелУкз сам, бцел from, бцел to);
static extern (C) бул   wxTextCtrl_LoadFile(ЦелУкз сам, ткст file);
static extern (C) бул   wxTextCtrl_SaveFile(ЦелУкз сам, ткст file);
static extern (C) проц   wxTextCtrl_MarkDirty(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_DiscardEdits(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_SetMaxLength(ЦелУкз сам, бцел len);
static extern (C) проц   wxTextCtrl_WriteText(ЦелУкз сам, ткст текст);
static extern (C) проц   wxTextCtrl_AppendText(ЦелУкз сам, ткст текст);
static extern (C) бул   wxTextCtrl_EmulateKeyPress(ЦелУкз сам, ЦелУкз evt);
static extern (C) бул   wxTextCtrl_SetStyle(ЦелУкз сам, бцел start, бцел end, ЦелУкз стиль);
static extern (C) бул   wxTextCtrl_GetStyle(ЦелУкз сам, бцел position, inout ЦелУкз стиль);
static extern (C) бул   wxTextCtrl_SetDefaultStyle(ЦелУкз сам, ЦелУкз стиль);
static extern (C) ЦелУкз wxTextCtrl_GetDefaultStyle(ЦелУкз сам);
static extern (C) бцел   wxTextCtrl_XYToPosition(ЦелУкз сам, бцел x, бцел y);
static extern (C) бул   wxTextCtrl_PositionToXY(ЦелУкз сам, бцел поз, out цел x, out цел y);
static extern (C) проц   wxTextCtrl_ShowPosition(ЦелУкз сам, бцел поз);
static extern (C) цел    wxTextCtrl_HitTest(ЦелУкз сам, inout Точка тчк, out цел поз);
static extern (C) цел    wxTextCtrl_HitTest2(ЦелУкз сам, inout Точка тчк, out цел col, out цел row);
static extern (C) проц   wxTextCtrl_Copy(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Cut(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Paste(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_CanCopy(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_CanCut(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_CanPaste(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Undo(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Redo(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_CanUndo(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_CanRedo(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_SetInsertionPoint(ЦелУкз сам, бцел поз);
static extern (C) проц   wxTextCtrl_SetInsertionPointEnd(ЦелУкз сам);
static extern (C) бцел   wxTextCtrl_GetInsertionPoint(ЦелУкз сам);
static extern (C) бцел   wxTextCtrl_GetLastPosition(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_SetSelection(ЦелУкз сам, бцел from, бцел to);
static extern (C) проц   wxTextCtrl_SelectAll(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_SetEditable(ЦелУкз сам, бул editable);
static extern (C)        ЦелУкз wxTextCtrl_ctor();
static extern (C) бул   wxTextCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст значение, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) бул   wxTextCtrl_Enable(ЦелУкз сам, бул вкл);
static extern (C) проц   wxTextCtrl_OnDropFiles(ЦелУкз сам, ЦелУкз evt);
static extern (C) бул   wxTextCtrl_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) бул   wxTextCtrl_SetForegroundColour(ЦелУкз сам, ЦелУкз цвет);
static extern (C) бул   wxTextCtrl_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвет);
static extern (C) проц   wxTextCtrl_Freeze(ЦелУкз сам);
static extern (C) проц   wxTextCtrl_Thaw(ЦелУкз сам);
static extern (C) бул   wxTextCtrl_ScrollLines(ЦелУкз сам, цел строки);
static extern (C) бул   wxTextCtrl_ScrollPages(ЦелУкз сам, цел страницы);
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

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, цел ид, ткст значение="", Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxTextCtrlNameStr)
    {
        this(wxTextCtrl_ctor());
        if (!wxTextCtrl_Create(wxobj, wxObject.SafePtr(родитель), ид, значение, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя))
        {
            throw new InvalidOperationException("Не удалось создать TextCtrl");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new TextCtrl(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст значение="", Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxTextCtrlNameStr)
    {
        this(родитель, Окно.УникИД, значение, поз, Размер, 0, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public проц очисть()
    {
        wxTextCtrl_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public override проц цветФона(Цвет значение)
    {
        wxTextCtrl_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }

    public override проц ЦветПП(Цвет значение)
    {
        wxTextCtrl_SetForegroundColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public ткст Value()
    {
        return cast(ткст) new wxString(wxTextCtrl_GetValue(wxobj), да);
    }
    public проц Value(ткст значение)
    {
        wxTextCtrl_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст GetRange(цел from, цел to)
    {
        return cast(ткст) new wxString(wxTextCtrl_GetRange(wxobj, cast(бцел)from, cast(бцел)to), да);
    }

    //---------------------------------------------------------------------

    public цел LineLength(цел lineNo)
    {
        return wxTextCtrl_GetLineLength(wxobj, cast(бцел)lineNo);
    }

    public ткст GetLineText(цел lineNo)
    {
        return cast(ткст) new wxString(wxTextCtrl_GetLineText(wxobj, cast(бцел)lineNo), да);
    }

    public цел GetNumberOfLines()
    {
        return wxTextCtrl_GetNumberOfLines(wxobj);
    }

    //---------------------------------------------------------------------

    public бул IsModified()
    {
        return wxTextCtrl_IsModified(wxobj);
    }

    public бул IsEditable()
    {
        return wxTextCtrl_IsEditable(wxobj);
    }

    public бул IsSingleLine()
    {
        return wxTextCtrl_IsSingleLine(wxobj);
    }

    public бул IsMultiLine()
    {
        return wxTextCtrl_IsMultiLine(wxobj);
    }

    //---------------------------------------------------------------------

    public проц GetSelection(out цел from, out цел to)
    {
        wxTextCtrl_GetSelection(wxobj, from, to);
    }

    //---------------------------------------------------------------------

    public проц Replace(цел from, цел to, ткст значение)
    {
        wxTextCtrl_Replace(wxobj, cast(бцел)from, cast(бцел)to, значение);
    }

    public проц Удали(цел from, цел to)
    {
        wxTextCtrl_Remove(wxobj, cast(бцел)from, cast(бцел)to);
    }

    //---------------------------------------------------------------------

    public бул ЗагрузиФайл(ткст file)
    {
        return wxTextCtrl_LoadFile(wxobj, file);
    }

    // using wx.NET with wxGTK wxTextCtrl_LoadFile didn't work
    // LoadFileNET uses StreamReader
    // this should also handle кодировка problems...
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

        }
        catch ( Exception e )
        {
            return false;
        }
    }
    +/

    public бул СохраниФайл(ткст file)
    {
        return wxTextCtrl_SaveFile(wxobj, file);
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
        }
        catch ( Exception e )
        {
            return false;
        }
    }
    +/

    //---------------------------------------------------------------------

    public проц DiscardEdits()
    {
        wxTextCtrl_DiscardEdits(wxobj);
    }

    //---------------------------------------------------------------------

    public проц MarkDirty()
    {
        wxTextCtrl_MarkDirty(wxobj);
    }

    //---------------------------------------------------------------------

    public проц MaxLength(цел значение)
    {
        wxTextCtrl_SetMaxLength(wxobj, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    public проц WriteText(ткст текст)
    {
        wxTextCtrl_WriteText(wxobj, текст);
    }

    //---------------------------------------------------------------------

    public проц AppendText(ткст текст)
    {
        wxTextCtrl_AppendText(wxobj, текст);
    }

    //---------------------------------------------------------------------

    public бул EmulateKeyPress(KeyEvent evt)
    {
        return wxTextCtrl_EmulateKeyPress(wxobj, wxObject.SafePtr(evt));
    }

    //---------------------------------------------------------------------

    public бул УстStyle(цел start, цел end, TextAttr стиль)
    {
        return wxTextCtrl_SetStyle(wxobj, cast(бцел)start, cast(бцел)end, wxObject.SafePtr(стиль));
    }

    public бул GetStyle(цел position, inout TextAttr стиль)
    {
        ЦелУкз tmp = wxObject.SafePtr(стиль);
        бул retval = wxTextCtrl_GetStyle(wxobj, cast(бцел)position, tmp);
        стиль.wxobj = tmp;
        return retval;
    }

    //---------------------------------------------------------------------

    public бул УстDefaultStyle(TextAttr стиль)
    {
        return wxTextCtrl_SetDefaultStyle(wxobj, wxObject.SafePtr(стиль));
    }

    public TextAttr GetDefaultStyle()
    {
        return cast(TextAttr)НайдиОбъект(wxTextCtrl_GetDefaultStyle(wxobj));
    }

    //---------------------------------------------------------------------

    public цел XYToPosition(цел x, цел y)
    {
        return wxTextCtrl_XYToPosition(wxobj, cast(бцел)x, cast(бцел)y);
    }

    public бул PositionToXY(цел поз, out цел x, out цел y)
    {
        return wxTextCtrl_PositionToXY(wxobj, cast(бцел)поз, x, y);
    }

    public проц ShowPosition(цел поз)
    {
        wxTextCtrl_ShowPosition(wxobj, cast(бцел)поз);
    }

    //---------------------------------------------------------------------

    public TextCtrlHitTestResult ТестНажатия(Точка тчк, out цел поз)
    {
        return cast(TextCtrlHitTestResult)wxTextCtrl_HitTest(wxobj, тчк, поз);
    }

    public TextCtrlHitTestResult ТестНажатия(Точка тчк, out цел col, out цел row)
    {
        return cast(TextCtrlHitTestResult)wxTextCtrl_HitTest2(wxobj, тчк, col, row);
    }

    //---------------------------------------------------------------------

    public проц Copy()
    {
        wxTextCtrl_Copy(wxobj);
    }

    public проц Cut()
    {
        wxTextCtrl_Cut(wxobj);
    }

    public проц Paste()
    {
        wxTextCtrl_Paste(wxobj);
    }

    //---------------------------------------------------------------------

    public бул CanCopy()
    {
        return wxTextCtrl_CanCopy(wxobj);
    }

    public бул CanCut()
    {
        return wxTextCtrl_CanCut(wxobj);
    }

    public бул CanPaste()
    {
        return wxTextCtrl_CanPaste(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Undo()
    {
        wxTextCtrl_Undo(wxobj);
    }

    public проц Redo()
    {
        wxTextCtrl_Redo(wxobj);
    }

    //---------------------------------------------------------------------

    public бул CanUndo()
    {
        return wxTextCtrl_CanUndo(wxobj);
    }

    public бул CanRedo()
    {
        return wxTextCtrl_CanRedo(wxobj);
    }

    //---------------------------------------------------------------------

    public проц InsertionPoint(цел значение)
    {
        wxTextCtrl_SetInsertionPoint(wxobj, cast(бцел)значение);
    }
    public цел InsertionPoint()
    {
        return wxTextCtrl_GetInsertionPoint(wxobj);
    }

    public проц УстInsertionPointEnd()
    {
        wxTextCtrl_SetInsertionPointEnd(wxobj);
    }

    public цел GetLastPosition()
    {
        return cast(цел)wxTextCtrl_GetLastPosition(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстSelection(цел from, цел to)
    {
        wxTextCtrl_SetSelection(wxobj, cast(бцел)from, cast(бцел)to);
    }

    public проц SelectAll()
    {
        wxTextCtrl_SelectAll(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстEditable(бул editable)
    {
        wxTextCtrl_SetEditable(wxobj, editable);
    }

    //---------------------------------------------------------------------

    public бул Включи(бул вкл)
    {
        return wxTextCtrl_Enable(wxobj, вкл);
    }

    //---------------------------------------------------------------------

    public  проц OnDropFiles(Событие evt)
    {
        wxTextCtrl_OnDropFiles(wxobj, wxObject.SafePtr(evt));
    }

    //---------------------------------------------------------------------

    public override проц Заморозь()
    {
        wxTextCtrl_Freeze(wxobj);
    }

    public override проц Оттай()
    {
        wxTextCtrl_Thaw(wxobj);
    }

    //---------------------------------------------------------------------

    public override бул ПрокрутиСтроки(цел строки)
    {
        return wxTextCtrl_ScrollLines(wxobj, строки);
    }

    public override бул ПрокрутиСтраницы(цел страницы)
    {
        return wxTextCtrl_ScrollPages(wxobj, страницы);
    }

    //---------------------------------------------------------------------

    public override проц UpdateUI_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TEXT_UPDATED, ИД, значение, this);
    }
    public override проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц Enter_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TEXT_ENTER, ИД, значение, this);
    }
    public проц Enter_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxTextUrlEvent_ctor(цел ид, ЦелУкз evtMouse, бцел start, бцел end);
static extern (C) бцел   wxTextUrlEvent_GetURLStart(ЦелУкз сам);
static extern (C) бцел   wxTextUrlEvent_GetURLEnd(ЦелУкз сам);
//! \endcond

alias TextUrlEvent wxTextUrlEvent;
public class TextUrlEvent : СобытиеКоманда
{
    // TODO: Replace Событие with EventMouse
    public this(цел ид, Событие evtMouse, цел start, цел end)
    {
        super(wxTextUrlEvent_ctor(ид, wxObject.SafePtr(evtMouse), cast(бцел)start, cast(бцел)end));
    }
}
