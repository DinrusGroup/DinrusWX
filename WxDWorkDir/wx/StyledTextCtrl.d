//-----------------------------------------------------------------------------
// wxD - StyledTextCtrl.h
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StyledTextCtrl.h
//
/// The wxStyledTextCtrl wrapper class. (Optional, requires STC contrib)
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StyledTextCtrl.d,v 1.12 2007/08/20 09:06:44 afb Exp $
//-----------------------------------------------------------------------------

module wx.StyledTextCtrl;

//! \cond VERSION
version(WXD_STYLEDTEXTCTRL){
//! \endcond

public import wx.common;
public import wx.Control;
public import wx.CommandEvent;

		//! \cond EXTERN
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_CHANGE();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_STYLENEEDED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_CHARADDED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_SAVEPOINTREACHED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_SAVEPOINTLEFT();  
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_ROMODIFYATTEMPT();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_KEY();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DOUBLECLICK();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_UPDATEUI();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_MODIFIED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_MACRORECORD();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_MARGINCLICK();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_NEEDSHOWN();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_POSCHANGED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_PAINTED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_USERLISTSELECTION();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_URIDROPPED();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DWELLSTART();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DWELLEND();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_START_DRAG();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DRAG_OVER();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DO_DROP();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_ZOOM();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_HOTSPOT_CLICK();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_HOTSPOT_DCLICK();
        static extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_CALLTIP_CLICK();

        static extern (C) ЦУк wxStyledTextCtrl_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
        static extern (C) проц   wxStyledTextCtrl_AddText(ЦУк сам, ткст текст);
        //static extern (C) проц   wxStyledTextCtrl_AddStyledText(ЦУк сам, ЦУк данные);
        static extern (C) проц   wxStyledTextCtrl_InsertText(ЦУк сам, цел поз, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_ClearAll(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_ClearDocumentStyle(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetLength(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetCharAt(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetCurrentPos(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetAnchor(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetStyleAt(ЦУк сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_Redo(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetUndoCollection(ЦУк сам, бул collectUndo);
        static extern (C) проц   wxStyledTextCtrl_SelectAll(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetSavePoint(ЦУк сам);
        //static extern (C) ЦУк wxStyledTextCtrl_GetStyledText(ЦУк сам, цел startPos, цел endPos);
        static extern (C) бул   wxStyledTextCtrl_CanRedo(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_MarkerLineFromHandle(ЦУк сам, цел handle);
        static extern (C) проц   wxStyledTextCtrl_MarkerDeleteHandle(ЦУк сам, цел handle);
        static extern (C) бул   wxStyledTextCtrl_GetUndoCollection(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetViewWhiteSpace(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetViewWhiteSpace(ЦУк сам, цел viewWS);
        static extern (C) цел    wxStyledTextCtrl_PositionFromPoint(ЦУк сам, inout Точка pt);
        static extern (C) цел    wxStyledTextCtrl_PositionFromPointClose(ЦУк сам, цел x, цел y);
        static extern (C) проц   wxStyledTextCtrl_GotoLine(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_GotoPos(ЦУк сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_SetAnchor(ЦУк сам, цел posAnchor);
        static extern (C) ЦУк wxStyledTextCtrl_GetCurLine(ЦУк сам, inout цел linePos);
        static extern (C) цел    wxStyledTextCtrl_GetEndStyled(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_ConvertEOLs(ЦУк сам, цел eolMode);
        static extern (C) цел    wxStyledTextCtrl_GetEOLMode(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetEOLMode(ЦУк сам, цел eolMode);
        static extern (C) проц   wxStyledTextCtrl_StartStyling(ЦУк сам, цел поз, цел маска);
        static extern (C) проц   wxStyledTextCtrl_SetStyling(ЦУк сам, цел length, цел стиль);
        static extern (C) бул   wxStyledTextCtrl_GetBufferedDraw(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetBufferedDraw(ЦУк сам, бул buffered);
        static extern (C) проц   wxStyledTextCtrl_SetTabWidth(ЦУк сам, цел tabWidth);
        static extern (C) цел    wxStyledTextCtrl_GetTabWidth(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetCodePage(ЦУк сам, цел codePage);
        static extern (C) проц   wxStyledTextCtrl_MarkerDefine(ЦУк сам, цел markerNumber, цел markerSymbol, ЦУк foreground, ЦУк background);
        static extern (C) проц   wxStyledTextCtrl_MarkerSetForeground(ЦУк сам, цел markerNumber, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_MarkerSetBackground(ЦУк сам, цел markerNumber, ЦУк back);
        static extern (C) цел    wxStyledTextCtrl_MarkerAdd(ЦУк сам, цел line, цел markerNumber);
        static extern (C) проц   wxStyledTextCtrl_MarkerDelete(ЦУк сам, цел line, цел markerNumber);
        static extern (C) проц   wxStyledTextCtrl_MarkerDeleteAll(ЦУк сам, цел markerNumber);
        static extern (C) цел    wxStyledTextCtrl_MarkerGet(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_MarkerNext(ЦУк сам, цел lineStart, цел markerMask);
        static extern (C) цел    wxStyledTextCtrl_MarkerPrevious(ЦУк сам, цел lineStart, цел markerMask);
        static extern (C) проц   wxStyledTextCtrl_MarkerDefineBitmap(ЦУк сам, цел markerNumber, ЦУк bmp);
        static extern (C) проц   wxStyledTextCtrl_SetMarginType(ЦУк сам, цел margin, цел marginType);
        static extern (C) цел    wxStyledTextCtrl_GetMarginType(ЦУк сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_SetMarginWidth(ЦУк сам, цел margin, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetMarginWidth(ЦУк сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_SetMarginMask(ЦУк сам, цел margin, цел маска);
        static extern (C) цел    wxStyledTextCtrl_GetMarginMask(ЦУк сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_SetMarginSensitive(ЦУк сам, цел margin, бул sensitive);
        static extern (C) бул   wxStyledTextCtrl_GetMarginSensitive(ЦУк сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_StyleClearAll(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_StyleSetForeground(ЦУк сам, цел стиль, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_StyleSetBackground(ЦУк сам, цел стиль, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_StyleSetBold(ЦУк сам, цел стиль, бул bold);
        static extern (C) проц   wxStyledTextCtrl_StyleSetItalic(ЦУк сам, цел стиль, бул italic);
        static extern (C) проц   wxStyledTextCtrl_StyleSetSize(ЦУк сам, цел стиль, цел sizePoints);
        static extern (C) проц   wxStyledTextCtrl_StyleSetFaceName(ЦУк сам, цел стиль, ткст fontName);
        static extern (C) проц   wxStyledTextCtrl_StyleSetEOLFilled(ЦУк сам, цел стиль, бул filled);
        static extern (C) проц   wxStyledTextCtrl_StyleResetDefault(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_StyleSetUnderline(ЦУк сам, цел стиль, бул underline);
        static extern (C) проц   wxStyledTextCtrl_StyleSetCase(ЦУк сам, цел стиль, цел caseForce);
        static extern (C) проц   wxStyledTextCtrl_StyleSetCharacterSet(ЦУк сам, цел стиль, цел characterSet);
        static extern (C) проц   wxStyledTextCtrl_StyleSetHotSpot(ЦУк сам, цел стиль, бул hotspot);
        static extern (C) проц   wxStyledTextCtrl_SetSelForeground(ЦУк сам, бул useSetting, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_SetSelBackground(ЦУк сам, бул useSetting, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_SetCaretForeground(ЦУк сам, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyAssign(ЦУк сам, цел key, цел modifiers, цел команда);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyClear(ЦУк сам, цел key, цел modifiers);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyClearAll(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetStyleBytes(ЦУк сам, цел length, ббайт* styleBytes);
        static extern (C) проц   wxStyledTextCtrl_StyleSetVisible(ЦУк сам, цел стиль, бул visible);
        static extern (C) цел    wxStyledTextCtrl_GetCaretPeriod(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretPeriod(ЦУк сам, цел periodMilliseconds);
        static extern (C) проц   wxStyledTextCtrl_SetWordChars(ЦУк сам, ткст characters);
        static extern (C) проц   wxStyledTextCtrl_BeginUndoAction(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_EndUndoAction(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_IndicatorSetStyle(ЦУк сам, цел indic, цел стиль);
        static extern (C) цел    wxStyledTextCtrl_IndicatorGetStyle(ЦУк сам, цел indic);
        static extern (C) проц   wxStyledTextCtrl_IndicatorSetForeground(ЦУк сам, цел indic, ЦУк fore);
        static extern (C) ЦУк wxStyledTextCtrl_IndicatorGetForeground(ЦУк сам, цел indic);
        static extern (C) проц   wxStyledTextCtrl_SetWhitespaceForeground(ЦУк сам, бул useSetting, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_SetWhitespaceBackground(ЦУк сам, бул useSetting, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_SetStyleBits(ЦУк сам, цел bits);
        static extern (C) цел    wxStyledTextCtrl_GetStyleBits(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetLineState(ЦУк сам, цел line, цел state);
        static extern (C) цел    wxStyledTextCtrl_GetLineState(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetMaxLineState(ЦУк сам);
        static extern (C) бул   wxStyledTextCtrl_GetCaretLineVisible(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretLineVisible(ЦУк сам, бул show);
        static extern (C) ЦУк wxStyledTextCtrl_GetCaretLineBack(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretLineBack(ЦУк сам, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_StyleSetChangeable(ЦУк сам, цел стиль, бул changeable);
        static extern (C) проц   wxStyledTextCtrl_AutoCompShow(ЦУк сам, цел lenEntered, ткст itemList);
        static extern (C) проц   wxStyledTextCtrl_AutoCompCancel(ЦУк сам);
        static extern (C) бул   wxStyledTextCtrl_AutoCompActive(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_AutoCompPosStart(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompComplete(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompStops(ЦУк сам, ткст characterSet);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetSeparator(ЦУк сам, цел separatorCharacter);
        static extern (C) цел    wxStyledTextCtrl_AutoCompGetSeparator(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSelect(ЦУк сам, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetCancelAtStart(ЦУк сам, бул cancel);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetCancelAtStart(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetFillUps(ЦУк сам, ткст characterSet);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetChooseSingle(ЦУк сам, бул chooseSingle);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetChooseSingle(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetIgnoreCase(ЦУк сам, бул ignoreCase);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetIgnoreCase(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_UserListShow(ЦУк сам, цел listType, ткст itemList);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetAutoHide(ЦУк сам, бул autoHide);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetAutoHide(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetDropRestOfWord(ЦУк сам, бул dropRestOfWord);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetDropRestOfWord(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_RegisterImage(ЦУк сам, цел тип, ЦУк bmp);
        static extern (C) проц   wxStyledTextCtrl_ClearRegisteredImages(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_AutoCompGetTypeSeparator(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSetTypeSeparator(ЦУк сам, цел separatorCharacter);
        static extern (C) проц   wxStyledTextCtrl_SetIndent(ЦУк сам, цел indentSize);
        static extern (C) цел    wxStyledTextCtrl_GetIndent(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetUseTabs(ЦУк сам, бул useTabs);
        static extern (C) бул   wxStyledTextCtrl_GetUseTabs(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetLineIndentation(ЦУк сам, цел line, цел indentSize);
        static extern (C) цел    wxStyledTextCtrl_GetLineIndentation(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetLineIndentPosition(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetColumn(ЦУк сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_SetUseHorizontalScrollBar(ЦУк сам, бул show);
        static extern (C) бул   wxStyledTextCtrl_GetUseHorizontalScrollBar(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetIndentationGuides(ЦУк сам, бул show);
        static extern (C) бул   wxStyledTextCtrl_GetIndentationGuides(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetHighlightGuide(ЦУк сам, цел column);
        static extern (C) цел    wxStyledTextCtrl_GetHighlightGuide(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetLineEndPosition(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetCodePage(ЦУк сам);
        static extern (C) ЦУк wxStyledTextCtrl_GetCaretForeground(ЦУк сам);
        static extern (C) бул   wxStyledTextCtrl_GetReadOnly(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetCurrentPos(ЦУк сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_SetSelectionStart(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetSelectionStart(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetSelectionEnd(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetSelectionEnd(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetPrintMagnification(ЦУк сам, цел magnification);
        static extern (C) цел    wxStyledTextCtrl_GetPrintMagnification(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetPrintColourMode(ЦУк сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetPrintColourMode(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_FindText(ЦУк сам, цел minPos, цел maxPos, ткст текст, цел флаги);
        static extern (C) цел    wxStyledTextCtrl_FormatRange(ЦУк сам, бул doDraw, цел startPos, цел endPos, ЦУк draw, ЦУк target, inout Прямоугольник renderRect, inout Прямоугольник pageRect);
        static extern (C) цел    wxStyledTextCtrl_GetFirstVisibleLine(ЦУк сам);
        static extern (C) ЦУк wxStyledTextCtrl_GetLine(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetLineCount(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetMarginLeft(ЦУк сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetMarginLeft(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetMarginRight(ЦУк сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetMarginRight(ЦУк сам);
        static extern (C) бул   wxStyledTextCtrl_GetModify(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetSelection(ЦУк сам, цел start, цел end);
        static extern (C) ЦУк wxStyledTextCtrl_GetSelectedText(ЦУк сам);
        static extern (C) ЦУк wxStyledTextCtrl_GetTextRange(ЦУк сам, цел startPos, цел endPos);
        static extern (C) проц   wxStyledTextCtrl_HideSelection(ЦУк сам, бул normal);
        static extern (C) цел    wxStyledTextCtrl_LineFromPosition(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_PositionFromLine(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_LineScroll(ЦУк сам, цел columns, цел lines);
        static extern (C) проц   wxStyledTextCtrl_EnsureCaretVisible(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_ReplaceSelection(ЦУк сам, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_SetReadOnly(ЦУк сам, бул readOnly);
        static extern (C) бул   wxStyledTextCtrl_CanPaste(ЦУк сам);
        static extern (C) бул   wxStyledTextCtrl_CanUndo(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_EmptyUndoBuffer(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_Undo(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_Cut(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_Copy(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_Paste(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_Clear(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetText(ЦУк сам, ткст текст);
        static extern (C) ЦУк wxStyledTextCtrl_GetText(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_GetTextLength(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetOvertype(ЦУк сам, бул overtype);
        static extern (C) бул   wxStyledTextCtrl_GetOvertype(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretWidth(ЦУк сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetCaretWidth(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetTargetStart(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetTargetStart(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetTargetEnd(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetTargetEnd(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_ReplaceTarget(ЦУк сам, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_ReplaceTargetRE(ЦУк сам, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_SearchInTarget(ЦУк сам, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_SetSearchFlags(ЦУк сам, цел флаги);
        static extern (C) цел    wxStyledTextCtrl_GetSearchFlags(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_CallTipShow(ЦУк сам, цел поз, ткст definition);
        static extern (C) проц   wxStyledTextCtrl_CallTipCancel(ЦУк сам);
        static extern (C) бул   wxStyledTextCtrl_CallTipActive(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_CallTipPosAtStart(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_CallTipSetHighlight(ЦУк сам, цел start, цел end);
        static extern (C) проц   wxStyledTextCtrl_CallTipSetBackground(ЦУк сам, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_CallTipSetForeground(ЦУк сам, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_CallTipSetForegroundHighlight(ЦУк сам, ЦУк fore);
        static extern (C) цел    wxStyledTextCtrl_VisibleFromDocLine(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_DocLineFromVisible(ЦУк сам, цел lineDisplay);
        static extern (C) проц   wxStyledTextCtrl_SetFoldLevel(ЦУк сам, цел line, цел level);
        static extern (C) цел    wxStyledTextCtrl_GetFoldLevel(ЦУк сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetLastChild(ЦУк сам, цел line, цел level);
        static extern (C) цел    wxStyledTextCtrl_GetFoldParent(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_ShowLines(ЦУк сам, цел lineStart, цел lineEnd);
        static extern (C) проц   wxStyledTextCtrl_HideLines(ЦУк сам, цел lineStart, цел lineEnd);
        static extern (C) бул   wxStyledTextCtrl_GetLineVisible(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetFoldExpanded(ЦУк сам, цел line, бул expanded);
        static extern (C) бул   wxStyledTextCtrl_GetFoldExpanded(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_ToggleFold(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_EnsureVisible(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetFoldFlags(ЦУк сам, цел флаги);
        static extern (C) проц   wxStyledTextCtrl_EnsureVisibleEnforcePolicy(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetTabIndents(ЦУк сам, бул tabIndents);
        static extern (C) бул   wxStyledTextCtrl_GetTabIndents(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetBackSpaceUnIndents(ЦУк сам, бул bsUnIndents);
        static extern (C) бул   wxStyledTextCtrl_GetBackSpaceUnIndents(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetMouseDwellTime(ЦУк сам, цел periodMilliseconds);
        static extern (C) цел    wxStyledTextCtrl_GetMouseDwellTime(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_WordStartPosition(ЦУк сам, цел поз, бул onlyWordCharacters);
        static extern (C) цел    wxStyledTextCtrl_WordEndPosition(ЦУк сам, цел поз, бул onlyWordCharacters);
        static extern (C) проц   wxStyledTextCtrl_SetWrapMode(ЦУк сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetWrapMode(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetLayoutCache(ЦУк сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetLayoutCache(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetScrollWidth(ЦУк сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetScrollWidth(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_TextWidth(ЦУк сам, цел стиль, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_SetEndAtLastLine(ЦУк сам, бул endAtLastLine);
        static extern (C) бул   wxStyledTextCtrl_GetEndAtLastLine(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_TextHeight(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetUseVerticalScrollBar(ЦУк сам, бул show);
        static extern (C) бул   wxStyledTextCtrl_GetUseVerticalScrollBar(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AppendText(ЦУк сам, цел length, ткст текст);
        static extern (C) бул   wxStyledTextCtrl_GetTwoPhaseDraw(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetTwoPhaseDraw(ЦУк сам, бул twoPhase);
        static extern (C) проц   wxStyledTextCtrl_TargetFromSelection(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_LinesJoin(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_LinesSplit(ЦУк сам, цел pixelWidth);
        static extern (C) проц   wxStyledTextCtrl_SetFoldMarginColour(ЦУк сам, бул useSetting, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_SetFoldMarginHiColour(ЦУк сам, бул useSetting, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_LineDuplicate(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_HomeDisplay(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_HomeDisplayExtend(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_LineEndDisplay(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_LineEndDisplayExtend(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_MoveCaretInsideView(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_LineLength(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_BraceHighlight(ЦУк сам, цел pos1, цел pos2);
        static extern (C) проц   wxStyledTextCtrl_BraceBadLight(ЦУк сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_BraceMatch(ЦУк сам, цел поз);
        static extern (C) бул   wxStyledTextCtrl_GetViewEOL(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetViewEOL(ЦУк сам, бул visible);
        static extern (C) ЦУк wxStyledTextCtrl_GetDocPointer(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetDocPointer(ЦУк сам, ЦУк docPointer);
        static extern (C) проц   wxStyledTextCtrl_SetModEventMask(ЦУк сам, цел маска);
        static extern (C) цел    wxStyledTextCtrl_GetEdgeColumn(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetEdgeColumn(ЦУк сам, цел column);
        static extern (C) цел    wxStyledTextCtrl_GetEdgeMode(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetEdgeMode(ЦУк сам, цел mode);
        static extern (C) ЦУк wxStyledTextCtrl_GetEdgeColour(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetEdgeColour(ЦУк сам, ЦУк edgeColour);
        static extern (C) проц   wxStyledTextCtrl_SearchAnchor(ЦУк сам);
        static extern (C) цел    wxStyledTextCtrl_SearchNext(ЦУк сам, цел флаги, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_SearchPrev(ЦУк сам, цел флаги, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_LinesOnScreen(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_UsePopUp(ЦУк сам, бул allowPopUp);
        static extern (C) бул   wxStyledTextCtrl_SelectionIsRectangle(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetZoom(ЦУк сам, цел zoom);
        static extern (C) цел    wxStyledTextCtrl_GetZoom(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_CreateDocument(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_AddRefDocument(ЦУк сам, ЦУк docPointer);
        static extern (C) проц   wxStyledTextCtrl_ReleaseDocument(ЦУк сам, ЦУк docPointer);
        static extern (C) цел    wxStyledTextCtrl_GetModEventMask(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetSTCFocus(ЦУк сам, бул focus);
        static extern (C) бул   wxStyledTextCtrl_GetSTCFocus(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetStatus(ЦУк сам, цел statusCode);
        static extern (C) цел    wxStyledTextCtrl_GetStatus(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetMouseDownCaptures(ЦУк сам, бул captures);
        static extern (C) бул   wxStyledTextCtrl_GetMouseDownCaptures(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetSTCCursor(ЦУк сам, цел cursorType);
        static extern (C) цел    wxStyledTextCtrl_GetSTCCursor(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetControlCharSymbol(ЦУк сам, цел symbol);
        static extern (C) цел    wxStyledTextCtrl_GetControlCharSymbol(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartLeft(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartLeftExtend(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartRight(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartRightExtend(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetVisiblePolicy(ЦУк сам, цел visiblePolicy, цел visibleSlop);
        static extern (C) проц   wxStyledTextCtrl_DelLineLeft(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_DelLineRight(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetXOffset(ЦУк сам, цел newOffset);
        static extern (C) цел    wxStyledTextCtrl_GetXOffset(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_ChooseCaretX(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetXCaretPolicy(ЦУк сам, цел caretPolicy, цел caretSlop);
        static extern (C) проц   wxStyledTextCtrl_SetYCaretPolicy(ЦУк сам, цел caretPolicy, цел caretSlop);
        static extern (C) проц   wxStyledTextCtrl_SetPrintWrapMode(ЦУк сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetPrintWrapMode(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetHotspotActiveForeground(ЦУк сам, бул useSetting, ЦУк fore);
        static extern (C) проц   wxStyledTextCtrl_SetHotspotActiveBackground(ЦУк сам, бул useSetting, ЦУк back);
        static extern (C) проц   wxStyledTextCtrl_SetHotspotActiveUnderline(ЦУк сам, бул underline);
        static extern (C) проц   wxStyledTextCtrl_StartRecord(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_StopRecord(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetLexer(ЦУк сам, цел lexer);
        static extern (C) цел    wxStyledTextCtrl_GetLexer(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_Colourise(ЦУк сам, цел start, цел end);
        static extern (C) проц   wxStyledTextCtrl_SetProperty(ЦУк сам, ткст key, ткст значение);
        static extern (C) проц   wxStyledTextCtrl_SetKeyWords(ЦУк сам, цел keywordSet, ткст keyWords);
        static extern (C) проц   wxStyledTextCtrl_SetLexerLanguage(ЦУк сам, ткст language);
        static extern (C) цел    wxStyledTextCtrl_GetCurrentLine(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_StyleSetSpec(ЦУк сам, цел styleNum, ткст spec);
        static extern (C) проц   wxStyledTextCtrl_StyleSetFont(ЦУк сам, цел styleNum, ЦУк шрифт);
        static extern (C) проц   wxStyledTextCtrl_StyleSetFontAttr(ЦУк сам, цел styleNum, цел size, ткст faceName, бул bold, бул italic, бул underline);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyExecute(ЦУк сам, цел команда);
        static extern (C) проц   wxStyledTextCtrl_SetMargins(ЦУк сам, цел left, цел right);
        static extern (C) проц   wxStyledTextCtrl_GetSelection(ЦУк сам, inout цел startPos, inout цел endPos);
        static extern (C) проц   wxStyledTextCtrl_PointFromPosition(ЦУк сам, цел поз, inout Точка pt);
        static extern (C) проц   wxStyledTextCtrl_ScrollToLine(ЦУк сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_ScrollToColumn(ЦУк сам, цел column);
        static extern (C) цел    wxStyledTextCtrl_SendMsg(ЦУк сам, цел msg, цел wp, цел lp);
        //static extern (C) проц   wxStyledTextCtrl_SetVScrollBar(ЦУк сам, ЦУк bar);
        //static extern (C) проц   wxStyledTextCtrl_SetHScrollBar(ЦУк сам, ЦУк bar);
        static extern (C) бул   wxStyledTextCtrl_GetLastKeydownProcessed(ЦУк сам);
        static extern (C) проц   wxStyledTextCtrl_SetLastKeydownProcessed(ЦУк сам, бул val);
        static extern (C) бул   wxStyledTextCtrl_SaveFile(ЦУк сам, ткст фимя);
        static extern (C) бул   wxStyledTextCtrl_LoadFile(ЦУк сам, ткст фимя);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias StyledTextCtrl wxStyledTextCtrl;
    public class StyledTextCtrl : Control 
    {
        //-----------------------------------------------------------------------------

        // StyledTextCtrl Events
 
        public static /*readonly*/ ТипСобытия wxEVT_STC_CHANGE;
        public static /*readonly*/ ТипСобытия wxEVT_STC_STYLENEEDED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_CHARADDED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_SAVEPOINTREACHED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_SAVEPOINTLEFT;  
        public static /*readonly*/ ТипСобытия wxEVT_STC_ROMODIFYATTEMPT;
        public static /*readonly*/ ТипСобытия wxEVT_STC_KEY;
        public static /*readonly*/ ТипСобытия wxEVT_STC_DOUBLECLICK;
        public static /*readonly*/ ТипСобытия wxEVT_STC_UPDATEUI;
        public static /*readonly*/ ТипСобытия wxEVT_STC_MODIFIED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_MACRORECORD;
        public static /*readonly*/ ТипСобытия wxEVT_STC_MARGINCLICK;
        public static /*readonly*/ ТипСобытия wxEVT_STC_NEEDSHOWN;
        //public static /*readonly*/ ТипСобытия wxEVT_STC_POSCHANGED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_PAINTED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_USERLISTSELECTION;
        public static /*readonly*/ ТипСобытия wxEVT_STC_URIDROPPED;
        public static /*readonly*/ ТипСобытия wxEVT_STC_DWELLSTART;
        public static /*readonly*/ ТипСобытия wxEVT_STC_DWELLEND;
        public static /*readonly*/ ТипСобытия wxEVT_STC_START_DRAG;
        public static /*readonly*/ ТипСобытия wxEVT_STC_DRAG_OVER;
        public static /*readonly*/ ТипСобытия wxEVT_STC_DO_DROP;
        public static /*readonly*/ ТипСобытия wxEVT_STC_ZOOM;
        public static /*readonly*/ ТипСобытия wxEVT_STC_HOTSPOT_CLICK;
        public static /*readonly*/ ТипСобытия wxEVT_STC_HOTSPOT_DCLICK;
        public static /*readonly*/ ТипСобытия wxEVT_STC_CALLTIP_CLICK;

        //-----------------------------------------------------------------------------

        public const цел wxSTC_INVALID_POSITION = -1;

        // Define start of Scintilla messages to be greater than all edit (EM_*) messages
        // as many EM_ messages can be used although that use is deprecated.
        public const цел wxSTC_START = 2000;
        public const цел wxSTC_OPTIONAL_START = 3000;
        public const цел wxSTC_LEXER_START = 4000;
        public const цел wxSTC_WS_INVISIBLE = 0;
        public const цел wxSTC_WS_VISIBLEALWAYS = 1;
        public const цел wxSTC_WS_VISIBLEAFTERINDENT = 2;
        public const цел wxSTC_EOL_CRLF = 0;
        public const цел wxSTC_EOL_CR = 1;
        public const цел wxSTC_EOL_LF = 2;

        // The SC_CP_UTF8 значение can be used to enter Unicode mode.
        // This is the same значение as CP_UTF8 in Windows
        public const цел wxSTC_CP_UTF8 = 65001;

        // The SC_CP_DBCS значение can be used to indicate a DBCS mode for GTK+.
        public const цел wxSTC_CP_DBCS = 1;
        public const цел wxSTC_MARKER_MAX = 31;
        public const цел wxSTC_MARK_CIRCLE = 0;
        public const цел wxSTC_MARK_ROUNDRECT = 1;
        public const цел wxSTC_MARK_ARROW = 2;
        public const цел wxSTC_MARK_SMALLRECT = 3;
        public const цел wxSTC_MARK_SHORTARROW = 4;
        public const цел wxSTC_MARK_EMPTY = 5;
        public const цел wxSTC_MARK_ARROWDOWN = 6;
        public const цел wxSTC_MARK_MINUS = 7;
        public const цел wxSTC_MARK_PLUS = 8;

        // Shapes used for outlining column.
        public const цел wxSTC_MARK_VLINE = 9;
        public const цел wxSTC_MARK_LCORNER = 10;
        public const цел wxSTC_MARK_TCORNER = 11;
        public const цел wxSTC_MARK_BOXPLUS = 12;
        public const цел wxSTC_MARK_BOXPLUSCONNECTED = 13;
        public const цел wxSTC_MARK_BOXMINUS = 14;
        public const цел wxSTC_MARK_BOXMINUSCONNECTED = 15;
        public const цел wxSTC_MARK_LCORNERCURVE = 16;
        public const цел wxSTC_MARK_TCORNERCURVE = 17;
        public const цел wxSTC_MARK_CIRCLEPLUS = 18;
        public const цел wxSTC_MARK_CIRCLEPLUSCONNECTED = 19;
        public const цел wxSTC_MARK_CIRCLEMINUS = 20;
        public const цел wxSTC_MARK_CIRCLEMINUSCONNECTED = 21;

        // Invisible mark that only sets the line background color.
        public const цел wxSTC_MARK_BACKGROUND = 22;
        public const цел wxSTC_MARK_DOTDOTDOT = 23;
        public const цел wxSTC_MARK_ARROWS = 24;
        public const цел wxSTC_MARK_PIXMAP = 25;
        public const цел wxSTC_MARK_CHARACTER = 10000;

        // Markers used for outlining column.
        public const цел wxSTC_MARKNUM_FOLDEREND = 25;
        public const цел wxSTC_MARKNUM_FOLDEROPENMID = 26;
        public const цел wxSTC_MARKNUM_FOLDERMIDTAIL = 27;
        public const цел wxSTC_MARKNUM_FOLDERTAIL = 28;
        public const цел wxSTC_MARKNUM_FOLDERSUB = 29;
        public const цел wxSTC_MARKNUM_FOLDER = 30;
        public const цел wxSTC_MARKNUM_FOLDEROPEN = 31;
        public const цел wxSTC_MASK_FOLDERS = -1;
        public const цел wxSTC_MARGIN_SYMBOL = 0;
        public const цел wxSTC_MARGIN_NUMBER = 1;

        // Styles in range 32..37 are predefined for parts of the UI and are not used as normal styles.
        // Styles 38 and 39 are for future use.
        public const цел wxSTC_STYLE_DEFAULT = 32;
        public const цел wxSTC_STYLE_LINENUMBER = 33;
        public const цел wxSTC_STYLE_BRACELIGHT = 34;
        public const цел wxSTC_STYLE_BRACEBAD = 35;
        public const цел wxSTC_STYLE_CONTROLCHAR = 36;
        public const цел wxSTC_STYLE_INDENTGUIDE = 37;
        public const цел wxSTC_STYLE_LASTPREDEFINED = 39;
        public const цел wxSTC_STYLE_MAX = 127;

        // Character set identifiers are used in StyleSetCharacterSet.
        // The values are the same as the Windows *_CHARSET values.
        public const цел wxSTC_CHARSET_ANSI = 0;
        public const цел wxSTC_CHARSET_DEFAULT = 1;
        public const цел wxSTC_CHARSET_BALTIC = 186;
        public const цел wxSTC_CHARSET_CHINESEBIG5 = 136;
        public const цел wxSTC_CHARSET_EASTEUROPE = 238;
        public const цел wxSTC_CHARSET_GB2312 = 134;
        public const цел wxSTC_CHARSET_GREEK = 161;
        public const цел wxSTC_CHARSET_HANGUL = 129;
        public const цел wxSTC_CHARSET_MAC = 77;
        public const цел wxSTC_CHARSET_OEM = 255;
        public const цел wxSTC_CHARSET_RUSSIAN = 204;
        public const цел wxSTC_CHARSET_SHIFTJIS = 128;
        public const цел wxSTC_CHARSET_SYMBOL = 2;
        public const цел wxSTC_CHARSET_TURKISH = 162;
        public const цел wxSTC_CHARSET_JOHAB = 130;
        public const цел wxSTC_CHARSET_HEBREW = 177;
        public const цел wxSTC_CHARSET_ARABIC = 178;
        public const цел wxSTC_CHARSET_VIETNAMESE = 163;
        public const цел wxSTC_CHARSET_THAI = 222;
        public const цел wxSTC_CASE_MIXED = 0;
        public const цел wxSTC_CASE_UPPER = 1;
        public const цел wxSTC_CASE_LOWER = 2;
        public const цел wxSTC_INDIC_MAX = 7;
        public const цел wxSTC_INDIC_PLAIN = 0;
        public const цел wxSTC_INDIC_SQUIGGLE = 1;
        public const цел wxSTC_INDIC_TT = 2;
        public const цел wxSTC_INDIC_DIAGONAL = 3;
        public const цел wxSTC_INDIC_STRIKE = 4;
        public const цел wxSTC_INDIC0_MASK = 0x20;
        public const цел wxSTC_INDIC1_MASK = 0x40;
        public const цел wxSTC_INDIC2_MASK = 0x80;
        public const цел wxSTC_INDICS_MASK = 0xE0;

        // PrintColourMode - use same colours as screen.
        public const цел wxSTC_PRINT_NORMAL = 0;

        // PrintColourMode - invert the light значение of each стиль for printing.
        public const цел wxSTC_PRINT_INVERTLIGHT = 1;

        // PrintColourMode - force black текст on white background for printing.
        public const цел wxSTC_PRINT_BLACKONWHITE = 2;

        // PrintColourMode - текст stays coloured, but all background is forced to be white for printing.
        public const цел wxSTC_PRINT_COLOURONWHITE = 3;

        // PrintColourMode - only the default-background is forced to be white for printing.
        public const цел wxSTC_PRINT_COLOURONWHITEDEFAULTBG = 4;
        public const цел wxSTC_FIND_WHOLEWORD = 2;
        public const цел wxSTC_FIND_MATCHCASE = 4;
        public const цел wxSTC_FIND_WORDSTART = 0x00100000;
        public const цел wxSTC_FIND_REGEXP = 0x00200000;
        public const цел wxSTC_FIND_POSIX = 0x00400000;
        public const цел wxSTC_FOLDLEVELBASE = 0x400;
        public const цел wxSTC_FOLDLEVELWHITEFLAG = 0x1000;
        public const цел wxSTC_FOLDLEVELHEADERFLAG = 0x2000;
        public const цел wxSTC_FOLDLEVELBOXHEADERFLAG = 0x4000;
        public const цел wxSTC_FOLDLEVELBOXFOOTERFLAG = 0x8000;
        public const цел wxSTC_FOLDLEVELCONTRACTED = 0x10000;
        public const цел wxSTC_FOLDLEVELUNINDENT = 0x20000;
        public const цел wxSTC_FOLDLEVELNUMBERMASK = 0x0FFF;
        public const цел wxSTC_FOLDFLAG_LINEBEFORE_EXPANDED = 0x0002;
        public const цел wxSTC_FOLDFLAG_LINEBEFORE_CONTRACTED = 0x0004;
        public const цел wxSTC_FOLDFLAG_LINEAFTER_EXPANDED = 0x0008;
        public const цел wxSTC_FOLDFLAG_LINEAFTER_CONTRACTED = 0x0010;
        public const цел wxSTC_FOLDFLAG_LEVELNUMBERS = 0x0040;
        public const цел wxSTC_FOLDFLAG_BOX = 0x0001;
        public const цел wxSTC_TIME_FOREVER = 10000000;
        public const цел wxSTC_WRAP_NONE = 0;
        public const цел wxSTC_WRAP_WORD = 1;
        public const цел wxSTC_CACHE_NONE = 0;
        public const цел wxSTC_CACHE_CARET = 1;
        public const цел wxSTC_CACHE_PAGE = 2;
        public const цел wxSTC_CACHE_DOCUMENT = 3;
        public const цел wxSTC_EDGE_NONE = 0;
        public const цел wxSTC_EDGE_LINE = 1;
        public const цел wxSTC_EDGE_BACKGROUND = 2;
        public const цел wxSTC_CURSORNORMAL = -1;
        public const цел wxSTC_CURSORWAIT = 4;

        // Constants for use with SetVisiblePolicy, similar to SetCaretPolicy.
        public const цел wxSTC_VISIBLE_SLOP = 0x01;
        public const цел wxSTC_VISIBLE_STRICT = 0x04;

        // Caret policy, used by SetXCaretPolicy and SetYCaretPolicy.
        // If CARET_SLOP is set, we can define a slop значение: caretSlop.
        // This значение defines an unwanted zone (UZ) where the caret is... unwanted.
        // This zone is defined as a number of pixels near the vertical margins,
        // and as a number of lines near the horizontal margins.
        // By keeping the caret away from the edges, it is seen within its context,
        // so it is likely that the identifier that the caret is on can be completely seen,
        // and that the current line is seen with some of the lines following it which are
        // often dependent on that line.
        public const цел wxSTC_CARET_SLOP = 0x01;

        // If CARET_STRICT is set, the policy is enforced... strictly.
        // The caret is centred on the display if slop is not set,
        // and cannot go in the UZ if slop is set.
        public const цел wxSTC_CARET_STRICT = 0x04;

        // If CARET_JUMPS is set, the display is moved more energetically
        // so the caret can move in the same direction longer before the policy is applied again.
        public const цел wxSTC_CARET_JUMPS = 0x10;

        // If CARET_EVEN is not set, instead of having symmetrical UZs,
        // the left and bottom UZs are extended up to right and top UZs respectively.
        // This way, we favour the displaying of useful information: the begining of lines,
        // where most code reside, and the lines after the caret, eg. the body of a function.
        public const цел wxSTC_CARET_EVEN = 0x08;

        // Notifications
        // Тип of modification and the action which caused the modification.
        // These are defined as a bit маска to make it easy to specify which notifications are wanted.
        // One bit is set from each of SC_MOD_* and SC_PERFORMED_*.
        public const цел wxSTC_MOD_INSERTTEXT = 0x1;
        public const цел wxSTC_MOD_DELETETEXT = 0x2;
        public const цел wxSTC_MOD_CHANGESTYLE = 0x4;
        public const цел wxSTC_MOD_CHANGEFOLD = 0x8;
        public const цел wxSTC_PERFORMED_USER = 0x10;
        public const цел wxSTC_PERFORMED_UNDO = 0x20;
        public const цел wxSTC_PERFORMED_REDO = 0x40;
        public const цел wxSTC_LASTSTEPINUNDOREDO = 0x100;
        public const цел wxSTC_MOD_CHANGEMARKER = 0x200;
        public const цел wxSTC_MOD_BEFOREINSERT = 0x400;
        public const цел wxSTC_MOD_BEFOREDELETE = 0x800;
        public const цел wxSTC_MODEVENTMASKALL = 0xF77;

        // Symbolic key codes and modifier флаги.
        // ASCII and other printable characters below 256.
        // Extended keys above 300.
        public const цел wxSTC_KEY_DOWN = 300;
        public const цел wxSTC_KEY_UP = 301;
        public const цел wxSTC_KEY_LEFT = 302;
        public const цел wxSTC_KEY_RIGHT = 303;
        public const цел wxSTC_KEY_HOME = 304;
        public const цел wxSTC_KEY_END = 305;
        public const цел wxSTC_KEY_PRIOR = 306;
        public const цел wxSTC_KEY_NEXT = 307;
        public const цел wxSTC_KEY_DELETE = 308;
        public const цел wxSTC_KEY_INSERT = 309;
        public const цел wxSTC_KEY_ESCAPE = 7;
        public const цел wxSTC_KEY_BACK = 8;
        public const цел wxSTC_KEY_TAB = 9;
        public const цел wxSTC_KEY_RETURN = 13;
        public const цел wxSTC_KEY_ADD = 310;
        public const цел wxSTC_KEY_SUBTRACT = 311;
        public const цел wxSTC_KEY_DIVIDE = 312;
        public const цел wxSTC_SCMOD_SHIFT = 1;
        public const цел wxSTC_SCMOD_CTRL = 2;
        public const цел wxSTC_SCMOD_ALT = 4;

        // For SciLexer.h
        public const цел wxSTC_LEX_CONTAINER = 0;
        public const цел wxSTC_LEX_NULL = 1;
        public const цел wxSTC_LEX_PYTHON = 2;
        public const цел wxSTC_LEX_CPP = 3;
        public const цел wxSTC_LEX_HTML = 4;
        public const цел wxSTC_LEX_XML = 5;
        public const цел wxSTC_LEX_PERL = 6;
        public const цел wxSTC_LEX_SQL = 7;
        public const цел wxSTC_LEX_VB = 8;
        public const цел wxSTC_LEX_PROPERTIES = 9;
        public const цел wxSTC_LEX_ERRORLIST = 10;
        public const цел wxSTC_LEX_MAKEFILE = 11;
        public const цел wxSTC_LEX_BATCH = 12;
        public const цел wxSTC_LEX_XCODE = 13;
        public const цел wxSTC_LEX_LATEX = 14;
        public const цел wxSTC_LEX_LUA = 15;
        public const цел wxSTC_LEX_DIFF = 16;
        public const цел wxSTC_LEX_CONF = 17;
        public const цел wxSTC_LEX_PASCAL = 18;
        public const цел wxSTC_LEX_AVE = 19;
        public const цел wxSTC_LEX_ADA = 20;
        public const цел wxSTC_LEX_LISP = 21;
        public const цел wxSTC_LEX_RUBY = 22;
        public const цел wxSTC_LEX_EIFFEL = 23;
        public const цел wxSTC_LEX_EIFFELKW = 24;
        public const цел wxSTC_LEX_TCL = 25;
        public const цел wxSTC_LEX_NNCRONTAB = 26;
        public const цел wxSTC_LEX_BULLANT = 27;
        public const цел wxSTC_LEX_VBSCRIPT = 28;
        public const цел wxSTC_LEX_ASP = 29;
        public const цел wxSTC_LEX_PHP = 30;
        public const цел wxSTC_LEX_BAAN = 31;
        public const цел wxSTC_LEX_MATLAB = 32;
        public const цел wxSTC_LEX_SCRIPTOL = 33;
        public const цел wxSTC_LEX_ASM = 34;
        public const цел wxSTC_LEX_CPPNOCASE = 35;
        public const цел wxSTC_LEX_FORTRAN = 36;
        public const цел wxSTC_LEX_F77 = 37;
        public const цел wxSTC_LEX_CSS = 38;
        public const цел wxSTC_LEX_POV = 39;

        // When a lexer specifies its language as SCLEX_AUTOMATIC it receives a
        // значение assigned in sequence from SCLEX_AUTOMATIC+1.
        public const цел wxSTC_LEX_AUTOMATIC = 1000;

        // Lexical states for SCLEX_PYTHON
        public const цел wxSTC_P_DEFAULT = 0;
        public const цел wxSTC_P_COMMENTLINE = 1;
        public const цел wxSTC_P_NUMBER = 2;
        public const цел wxSTC_P_STRING = 3;
        public const цел wxSTC_P_CHARACTER = 4;
        public const цел wxSTC_P_WORD = 5;
        public const цел wxSTC_P_TRIPLE = 6;
        public const цел wxSTC_P_TRIPLEDOUBLE = 7;
        public const цел wxSTC_P_CLASSNAME = 8;
        public const цел wxSTC_P_DEFNAME = 9;
        public const цел wxSTC_P_OPERATOR = 10;
        public const цел wxSTC_P_IDENTIFIER = 11;
        public const цел wxSTC_P_COMMENTBLOCK = 12;
        public const цел wxSTC_P_STRINGEOL = 13;

        // Lexical states for SCLEX_CPP
        public const цел wxSTC_C_DEFAULT = 0;
        public const цел wxSTC_C_COMMENT = 1;
        public const цел wxSTC_C_COMMENTLINE = 2;
        public const цел wxSTC_C_COMMENTDOC = 3;
        public const цел wxSTC_C_NUMBER = 4;
        public const цел wxSTC_C_WORD = 5;
        public const цел wxSTC_C_STRING = 6;
        public const цел wxSTC_C_CHARACTER = 7;
        public const цел wxSTC_C_UUID = 8;
        public const цел wxSTC_C_PREPROCESSOR = 9;
        public const цел wxSTC_C_OPERATOR = 10;
        public const цел wxSTC_C_IDENTIFIER = 11;
        public const цел wxSTC_C_STRINGEOL = 12;
        public const цел wxSTC_C_VERBATIM = 13;
        public const цел wxSTC_C_REGEX = 14;
        public const цел wxSTC_C_COMMENTLINEDOC = 15;
        public const цел wxSTC_C_WORD2 = 16;
        public const цел wxSTC_C_COMMENTDOCKEYWORD = 17;
        public const цел wxSTC_C_COMMENTDOCKEYWORDERROR = 18;

        // Lexical states for SCLEX_HTML, SCLEX_XML
        public const цел wxSTC_H_DEFAULT = 0;
        public const цел wxSTC_H_TAG = 1;
        public const цел wxSTC_H_TAGUNKNOWN = 2;
        public const цел wxSTC_H_ATTRIBUTE = 3;
        public const цел wxSTC_H_ATTRIBUTEUNKNOWN = 4;
        public const цел wxSTC_H_NUMBER = 5;
        public const цел wxSTC_H_DOUBLESTRING = 6;
        public const цел wxSTC_H_SINGLESTRING = 7;
        public const цел wxSTC_H_OTHER = 8;
        public const цел wxSTC_H_COMMENT = 9;
        public const цел wxSTC_H_ENTITY = 10;

        // XML and ASP
        public const цел wxSTC_H_TAGEND = 11;
        public const цел wxSTC_H_XMLSTART = 12;
        public const цел wxSTC_H_XMLEND = 13;
        public const цел wxSTC_H_SCRIPT = 14;
        public const цел wxSTC_H_ASP = 15;
        public const цел wxSTC_H_ASPAT = 16;
        public const цел wxSTC_H_CDATA = 17;
        public const цел wxSTC_H_QUESTION = 18;

        // More HTML
        public const цел wxSTC_H_VALUE = 19;

        // X-Code
        public const цел wxSTC_H_XCCOMMENT = 20;

        // SGML
        public const цел wxSTC_H_SGML_DEFAULT = 21;
        public const цел wxSTC_H_SGML_COMMAND = 22;
        public const цел wxSTC_H_SGML_1ST_PARAM = 23;
        public const цел wxSTC_H_SGML_DOUBLESTRING = 24;
        public const цел wxSTC_H_SGML_SIMPLESTRING = 25;
        public const цел wxSTC_H_SGML_ERROR = 26;
        public const цел wxSTC_H_SGML_SPECIAL = 27;
        public const цел wxSTC_H_SGML_ENTITY = 28;
        public const цел wxSTC_H_SGML_COMMENT = 29;
        public const цел wxSTC_H_SGML_1ST_PARAM_COMMENT = 30;
        public const цел wxSTC_H_SGML_BLOCK_DEFAULT = 31;

        // Embedded Javascript
        public const цел wxSTC_HJ_START = 40;
        public const цел wxSTC_HJ_DEFAULT = 41;
        public const цел wxSTC_HJ_COMMENT = 42;
        public const цел wxSTC_HJ_COMMENTLINE = 43;
        public const цел wxSTC_HJ_COMMENTDOC = 44;
        public const цел wxSTC_HJ_NUMBER = 45;
        public const цел wxSTC_HJ_WORD = 46;
        public const цел wxSTC_HJ_KEYWORD = 47;
        public const цел wxSTC_HJ_DOUBLESTRING = 48;
        public const цел wxSTC_HJ_SINGLESTRING = 49;
        public const цел wxSTC_HJ_SYMBOLS = 50;
        public const цел wxSTC_HJ_STRINGEOL = 51;
        public const цел wxSTC_HJ_REGEX = 52;

        // ASP Javascript
        public const цел wxSTC_HJA_START = 55;
        public const цел wxSTC_HJA_DEFAULT = 56;
        public const цел wxSTC_HJA_COMMENT = 57;
        public const цел wxSTC_HJA_COMMENTLINE = 58;
        public const цел wxSTC_HJA_COMMENTDOC = 59;
        public const цел wxSTC_HJA_NUMBER = 60;
        public const цел wxSTC_HJA_WORD = 61;
        public const цел wxSTC_HJA_KEYWORD = 62;
        public const цел wxSTC_HJA_DOUBLESTRING = 63;
        public const цел wxSTC_HJA_SINGLESTRING = 64;
        public const цел wxSTC_HJA_SYMBOLS = 65;
        public const цел wxSTC_HJA_STRINGEOL = 66;
        public const цел wxSTC_HJA_REGEX = 67;

        // Embedded VBScript
        public const цел wxSTC_HB_START = 70;
        public const цел wxSTC_HB_DEFAULT = 71;
        public const цел wxSTC_HB_COMMENTLINE = 72;
        public const цел wxSTC_HB_NUMBER = 73;
        public const цел wxSTC_HB_WORD = 74;
        public const цел wxSTC_HB_STRING = 75;
        public const цел wxSTC_HB_IDENTIFIER = 76;
        public const цел wxSTC_HB_STRINGEOL = 77;

        // ASP VBScript
        public const цел wxSTC_HBA_START = 80;
        public const цел wxSTC_HBA_DEFAULT = 81;
        public const цел wxSTC_HBA_COMMENTLINE = 82;
        public const цел wxSTC_HBA_NUMBER = 83;
        public const цел wxSTC_HBA_WORD = 84;
        public const цел wxSTC_HBA_STRING = 85;
        public const цел wxSTC_HBA_IDENTIFIER = 86;
        public const цел wxSTC_HBA_STRINGEOL = 87;

        // Embedded Python
        public const цел wxSTC_HP_START = 90;
        public const цел wxSTC_HP_DEFAULT = 91;
        public const цел wxSTC_HP_COMMENTLINE = 92;
        public const цел wxSTC_HP_NUMBER = 93;
        public const цел wxSTC_HP_STRING = 94;
        public const цел wxSTC_HP_CHARACTER = 95;
        public const цел wxSTC_HP_WORD = 96;
        public const цел wxSTC_HP_TRIPLE = 97;
        public const цел wxSTC_HP_TRIPLEDOUBLE = 98;
        public const цел wxSTC_HP_CLASSNAME = 99;
        public const цел wxSTC_HP_DEFNAME = 100;
        public const цел wxSTC_HP_OPERATOR = 101;
        public const цел wxSTC_HP_IDENTIFIER = 102;

        // ASP Python
        public const цел wxSTC_HPA_START = 105;
        public const цел wxSTC_HPA_DEFAULT = 106;
        public const цел wxSTC_HPA_COMMENTLINE = 107;
        public const цел wxSTC_HPA_NUMBER = 108;
        public const цел wxSTC_HPA_STRING = 109;
        public const цел wxSTC_HPA_CHARACTER = 110;
        public const цел wxSTC_HPA_WORD = 111;
        public const цел wxSTC_HPA_TRIPLE = 112;
        public const цел wxSTC_HPA_TRIPLEDOUBLE = 113;
        public const цел wxSTC_HPA_CLASSNAME = 114;
        public const цел wxSTC_HPA_DEFNAME = 115;
        public const цел wxSTC_HPA_OPERATOR = 116;
        public const цел wxSTC_HPA_IDENTIFIER = 117;

        // PHP
        public const цел wxSTC_HPHP_DEFAULT = 118;
        public const цел wxSTC_HPHP_HSTRING = 119;
        public const цел wxSTC_HPHP_SIMPLESTRING = 120;
        public const цел wxSTC_HPHP_WORD = 121;
        public const цел wxSTC_HPHP_NUMBER = 122;
        public const цел wxSTC_HPHP_VARIABLE = 123;
        public const цел wxSTC_HPHP_COMMENT = 124;
        public const цел wxSTC_HPHP_COMMENTLINE = 125;
        public const цел wxSTC_HPHP_HSTRING_VARIABLE = 126;
        public const цел wxSTC_HPHP_OPERATOR = 127;

        // Lexical states for SCLEX_PERL
        public const цел wxSTC_PL_DEFAULT = 0;
        public const цел wxSTC_PL_ERROR = 1;
        public const цел wxSTC_PL_COMMENTLINE = 2;
        public const цел wxSTC_PL_POD = 3;
        public const цел wxSTC_PL_NUMBER = 4;
        public const цел wxSTC_PL_WORD = 5;
        public const цел wxSTC_PL_STRING = 6;
        public const цел wxSTC_PL_CHARACTER = 7;
        public const цел wxSTC_PL_PUNCTUATION = 8;
        public const цел wxSTC_PL_PREPROCESSOR = 9;
        public const цел wxSTC_PL_OPERATOR = 10;
        public const цел wxSTC_PL_IDENTIFIER = 11;
        public const цел wxSTC_PL_SCALAR = 12;
        public const цел wxSTC_PL_ARRAY = 13;
        public const цел wxSTC_PL_HASH = 14;
        public const цел wxSTC_PL_SYMBOLTABLE = 15;
        public const цел wxSTC_PL_REGEX = 17;
        public const цел wxSTC_PL_REGSUBST = 18;
        public const цел wxSTC_PL_LONGQUOTE = 19;
        public const цел wxSTC_PL_BACKTICKS = 20;
        public const цел wxSTC_PL_DATASECTION = 21;
        public const цел wxSTC_PL_HERE_DELIM = 22;
        public const цел wxSTC_PL_HERE_Q = 23;
        public const цел wxSTC_PL_HERE_QQ = 24;
        public const цел wxSTC_PL_HERE_QX = 25;
        public const цел wxSTC_PL_STRING_Q = 26;
        public const цел wxSTC_PL_STRING_QQ = 27;
        public const цел wxSTC_PL_STRING_QX = 28;
        public const цел wxSTC_PL_STRING_QR = 29;
        public const цел wxSTC_PL_STRING_QW = 30;

        // Lexical states for SCLEX_VB, SCLEX_VBSCRIPT
        public const цел wxSTC_B_DEFAULT = 0;
        public const цел wxSTC_B_COMMENT = 1;
        public const цел wxSTC_B_NUMBER = 2;
        public const цел wxSTC_B_KEYWORD = 3;
        public const цел wxSTC_B_STRING = 4;
        public const цел wxSTC_B_PREPROCESSOR = 5;
        public const цел wxSTC_B_OPERATOR = 6;
        public const цел wxSTC_B_IDENTIFIER = 7;
        public const цел wxSTC_B_DATE = 8;

        // Lexical states for SCLEX_PROPERTIES
        public const цел wxSTC_PROPS_DEFAULT = 0;
        public const цел wxSTC_PROPS_COMMENT = 1;
        public const цел wxSTC_PROPS_SECTION = 2;
        public const цел wxSTC_PROPS_ASSIGNMENT = 3;
        public const цел wxSTC_PROPS_DEFVAL = 4;

        // Lexical states for SCLEX_LATEX
        public const цел wxSTC_L_DEFAULT = 0;
        public const цел wxSTC_L_COMMAND = 1;
        public const цел wxSTC_L_TAG = 2;
        public const цел wxSTC_L_MATH = 3;
        public const цел wxSTC_L_COMMENT = 4;

        // Lexical states for SCLEX_LUA
        public const цел wxSTC_LUA_DEFAULT = 0;
        public const цел wxSTC_LUA_COMMENT = 1;
        public const цел wxSTC_LUA_COMMENTLINE = 2;
        public const цел wxSTC_LUA_COMMENTDOC = 3;
        public const цел wxSTC_LUA_NUMBER = 4;
        public const цел wxSTC_LUA_WORD = 5;
        public const цел wxSTC_LUA_STRING = 6;
        public const цел wxSTC_LUA_CHARACTER = 7;
        public const цел wxSTC_LUA_LITERALSTRING = 8;
        public const цел wxSTC_LUA_PREPROCESSOR = 9;
        public const цел wxSTC_LUA_OPERATOR = 10;
        public const цел wxSTC_LUA_IDENTIFIER = 11;
        public const цел wxSTC_LUA_STRINGEOL = 12;
        public const цел wxSTC_LUA_WORD2 = 13;
        public const цел wxSTC_LUA_WORD3 = 14;
        public const цел wxSTC_LUA_WORD4 = 15;
        public const цел wxSTC_LUA_WORD5 = 16;
        public const цел wxSTC_LUA_WORD6 = 17;

        // Lexical states for SCLEX_ERRORLIST
        public const цел wxSTC_ERR_DEFAULT = 0;
        public const цел wxSTC_ERR_PYTHON = 1;
        public const цел wxSTC_ERR_GCC = 2;
        public const цел wxSTC_ERR_MS = 3;
        public const цел wxSTC_ERR_CMD = 4;
        public const цел wxSTC_ERR_BORLAND = 5;
        public const цел wxSTC_ERR_PERL = 6;
        public const цел wxSTC_ERR_NET = 7;
        public const цел wxSTC_ERR_LUA = 8;
        public const цел wxSTC_ERR_CTAG = 9;
        public const цел wxSTC_ERR_DIFF_CHANGED = 10;
        public const цел wxSTC_ERR_DIFF_ADDITION = 11;
        public const цел wxSTC_ERR_DIFF_DELETION = 12;
        public const цел wxSTC_ERR_DIFF_MESSAGE = 13;
        public const цел wxSTC_ERR_PHP = 14;
        public const цел wxSTC_ERR_ELF = 15;
        public const цел wxSTC_ERR_IFC = 16;

        // Lexical states for SCLEX_BATCH
        public const цел wxSTC_BAT_DEFAULT = 0;
        public const цел wxSTC_BAT_COMMENT = 1;
        public const цел wxSTC_BAT_WORD = 2;
        public const цел wxSTC_BAT_LABEL = 3;
        public const цел wxSTC_BAT_HIDE = 4;
        public const цел wxSTC_BAT_COMMAND = 5;
        public const цел wxSTC_BAT_IDENTIFIER = 6;
        public const цел wxSTC_BAT_OPERATOR = 7;

        // Lexical states for SCLEX_MAKEFILE
        public const цел wxSTC_MAKE_DEFAULT = 0;
        public const цел wxSTC_MAKE_COMMENT = 1;
        public const цел wxSTC_MAKE_PREPROCESSOR = 2;
        public const цел wxSTC_MAKE_IDENTIFIER = 3;
        public const цел wxSTC_MAKE_OPERATOR = 4;
        public const цел wxSTC_MAKE_TARGET = 5;
        public const цел wxSTC_MAKE_IDEOL = 9;

        // Lexical states for SCLEX_DIFF
        public const цел wxSTC_DIFF_DEFAULT = 0;
        public const цел wxSTC_DIFF_COMMENT = 1;
        public const цел wxSTC_DIFF_COMMAND = 2;
        public const цел wxSTC_DIFF_HEADER = 3;
        public const цел wxSTC_DIFF_POSITION = 4;
        public const цел wxSTC_DIFF_DELETED = 5;
        public const цел wxSTC_DIFF_ADDED = 6;

        // Lexical states for SCLEX_CONF (Apache Configuration Files Lexer)
        public const цел wxSTC_CONF_DEFAULT = 0;
        public const цел wxSTC_CONF_COMMENT = 1;
        public const цел wxSTC_CONF_NUMBER = 2;
        public const цел wxSTC_CONF_IDENTIFIER = 3;
        public const цел wxSTC_CONF_EXTENSION = 4;
        public const цел wxSTC_CONF_PARAMETER = 5;
        public const цел wxSTC_CONF_STRING = 6;
        public const цел wxSTC_CONF_OPERATOR = 7;
        public const цел wxSTC_CONF_IP = 8;
        public const цел wxSTC_CONF_DIRECTIVE = 9;

        // Lexical states for SCLEX_AVE, Avenue
        public const цел wxSTC_AVE_DEFAULT = 0;
        public const цел wxSTC_AVE_COMMENT = 1;
        public const цел wxSTC_AVE_NUMBER = 2;
        public const цел wxSTC_AVE_WORD = 3;
        public const цел wxSTC_AVE_STRING = 6;
        public const цел wxSTC_AVE_ENUM = 7;
        public const цел wxSTC_AVE_STRINGEOL = 8;
        public const цел wxSTC_AVE_IDENTIFIER = 9;
        public const цел wxSTC_AVE_OPERATOR = 10;
        public const цел wxSTC_AVE_WORD1 = 11;
        public const цел wxSTC_AVE_WORD2 = 12;
        public const цел wxSTC_AVE_WORD3 = 13;
        public const цел wxSTC_AVE_WORD4 = 14;
        public const цел wxSTC_AVE_WORD5 = 15;
        public const цел wxSTC_AVE_WORD6 = 16;

        // Lexical states for SCLEX_ADA
        public const цел wxSTC_ADA_DEFAULT = 0;
        public const цел wxSTC_ADA_WORD = 1;
        public const цел wxSTC_ADA_IDENTIFIER = 2;
        public const цел wxSTC_ADA_NUMBER = 3;
        public const цел wxSTC_ADA_DELIMITER = 4;
        public const цел wxSTC_ADA_CHARACTER = 5;
        public const цел wxSTC_ADA_CHARACTEREOL = 6;
        public const цел wxSTC_ADA_STRING = 7;
        public const цел wxSTC_ADA_STRINGEOL = 8;
        public const цел wxSTC_ADA_LABEL = 9;
        public const цел wxSTC_ADA_COMMENTLINE = 10;
        public const цел wxSTC_ADA_ILLEGAL = 11;

        // Lexical states for SCLEX_BAAN
        public const цел wxSTC_BAAN_DEFAULT = 0;
        public const цел wxSTC_BAAN_COMMENT = 1;
        public const цел wxSTC_BAAN_COMMENTDOC = 2;
        public const цел wxSTC_BAAN_NUMBER = 3;
        public const цел wxSTC_BAAN_WORD = 4;
        public const цел wxSTC_BAAN_STRING = 5;
        public const цел wxSTC_BAAN_PREPROCESSOR = 6;
        public const цел wxSTC_BAAN_OPERATOR = 7;
        public const цел wxSTC_BAAN_IDENTIFIER = 8;
        public const цел wxSTC_BAAN_STRINGEOL = 9;
        public const цел wxSTC_BAAN_WORD2 = 10;

        // Lexical states for SCLEX_LISP
        public const цел wxSTC_LISP_DEFAULT = 0;
        public const цел wxSTC_LISP_COMMENT = 1;
        public const цел wxSTC_LISP_NUMBER = 2;
        public const цел wxSTC_LISP_KEYWORD = 3;
        public const цел wxSTC_LISP_STRING = 6;
        public const цел wxSTC_LISP_STRINGEOL = 8;
        public const цел wxSTC_LISP_IDENTIFIER = 9;
        public const цел wxSTC_LISP_OPERATOR = 10;

        // Lexical states for SCLEX_EIFFEL and SCLEX_EIFFELKW
        public const цел wxSTC_EIFFEL_DEFAULT = 0;
        public const цел wxSTC_EIFFEL_COMMENTLINE = 1;
        public const цел wxSTC_EIFFEL_NUMBER = 2;
        public const цел wxSTC_EIFFEL_WORD = 3;
        public const цел wxSTC_EIFFEL_STRING = 4;
        public const цел wxSTC_EIFFEL_CHARACTER = 5;
        public const цел wxSTC_EIFFEL_OPERATOR = 6;
        public const цел wxSTC_EIFFEL_IDENTIFIER = 7;
        public const цел wxSTC_EIFFEL_STRINGEOL = 8;

        // Lexical states for SCLEX_NNCRONTAB (nnCron crontab Lexer)
        public const цел wxSTC_NNCRONTAB_DEFAULT = 0;
        public const цел wxSTC_NNCRONTAB_COMMENT = 1;
        public const цел wxSTC_NNCRONTAB_TASK = 2;
        public const цел wxSTC_NNCRONTAB_SECTION = 3;
        public const цел wxSTC_NNCRONTAB_KEYWORD = 4;
        public const цел wxSTC_NNCRONTAB_MODIFIER = 5;
        public const цел wxSTC_NNCRONTAB_ASTERISK = 6;
        public const цел wxSTC_NNCRONTAB_NUMBER = 7;
        public const цел wxSTC_NNCRONTAB_STRING = 8;
        public const цел wxSTC_NNCRONTAB_ENVIRONMENT = 9;
        public const цел wxSTC_NNCRONTAB_IDENTIFIER = 10;

        // Lexical states for SCLEX_MATLAB
        public const цел wxSTC_MATLAB_DEFAULT = 0;
        public const цел wxSTC_MATLAB_COMMENT = 1;
        public const цел wxSTC_MATLAB_COMMAND = 2;
        public const цел wxSTC_MATLAB_NUMBER = 3;
        public const цел wxSTC_MATLAB_KEYWORD = 4;
        public const цел wxSTC_MATLAB_STRING = 5;
        public const цел wxSTC_MATLAB_OPERATOR = 6;
        public const цел wxSTC_MATLAB_IDENTIFIER = 7;

        // Lexical states for SCLEX_SCRIPTOL
        public const цел wxSTC_SCRIPTOL_DEFAULT = 0;
        public const цел wxSTC_SCRIPTOL_COMMENT = 1;
        public const цел wxSTC_SCRIPTOL_COMMENTLINE = 2;
        public const цел wxSTC_SCRIPTOL_COMMENTDOC = 3;
        public const цел wxSTC_SCRIPTOL_NUMBER = 4;
        public const цел wxSTC_SCRIPTOL_WORD = 5;
        public const цел wxSTC_SCRIPTOL_STRING = 6;
        public const цел wxSTC_SCRIPTOL_CHARACTER = 7;
        public const цел wxSTC_SCRIPTOL_UUID = 8;
        public const цел wxSTC_SCRIPTOL_PREPROCESSOR = 9;
        public const цел wxSTC_SCRIPTOL_OPERATOR = 10;
        public const цел wxSTC_SCRIPTOL_IDENTIFIER = 11;
        public const цел wxSTC_SCRIPTOL_STRINGEOL = 12;
        public const цел wxSTC_SCRIPTOL_VERBATIM = 13;
        public const цел wxSTC_SCRIPTOL_REGEX = 14;
        public const цел wxSTC_SCRIPTOL_COMMENTLINEDOC = 15;
        public const цел wxSTC_SCRIPTOL_WORD2 = 16;
        public const цел wxSTC_SCRIPTOL_COMMENTDOCKEYWORD = 17;
        public const цел wxSTC_SCRIPTOL_COMMENTDOCKEYWORDERROR = 18;
        public const цел wxSTC_SCRIPTOL_COMMENTBASIC = 19;

        // Lexical states for SCLEX_ASM
        public const цел wxSTC_ASM_DEFAULT = 0;
        public const цел wxSTC_ASM_COMMENT = 1;
        public const цел wxSTC_ASM_NUMBER = 2;
        public const цел wxSTC_ASM_STRING = 3;
        public const цел wxSTC_ASM_OPERATOR = 4;
        public const цел wxSTC_ASM_IDENTIFIER = 5;
        public const цел wxSTC_ASM_CPUINSTRUCTION = 6;
        public const цел wxSTC_ASM_MATHINSTRUCTION = 7;
        public const цел wxSTC_ASM_REGISTER = 8;
        public const цел wxSTC_ASM_DIRECTIVE = 9;
        public const цел wxSTC_ASM_DIRECTIVEOPERAND = 10;

        // Lexical states for SCLEX_FORTRAN
        public const цел wxSTC_F_DEFAULT = 0;
        public const цел wxSTC_F_COMMENT = 1;
        public const цел wxSTC_F_NUMBER = 2;
        public const цел wxSTC_F_STRING1 = 3;
        public const цел wxSTC_F_STRING2 = 4;
        public const цел wxSTC_F_STRINGEOL = 5;
        public const цел wxSTC_F_OPERATOR = 6;
        public const цел wxSTC_F_IDENTIFIER = 7;
        public const цел wxSTC_F_WORD = 8;
        public const цел wxSTC_F_WORD2 = 9;
        public const цел wxSTC_F_WORD3 = 10;
        public const цел wxSTC_F_PREPROCESSOR = 11;
        public const цел wxSTC_F_OPERATOR2 = 12;
        public const цел wxSTC_F_LABEL = 13;
        public const цел wxSTC_F_CONTINUATION = 14;

        // Lexical states for SCLEX_CSS
        public const цел wxSTC_CSS_DEFAULT = 0;
        public const цел wxSTC_CSS_TAG = 1;
        public const цел wxSTC_CSS_CLASS = 2;
        public const цел wxSTC_CSS_PSEUDOCLASS = 3;
        public const цел wxSTC_CSS_UNKNOWN_PSEUDOCLASS = 4;
        public const цел wxSTC_CSS_OPERATOR = 5;
        public const цел wxSTC_CSS_IDENTIFIER = 6;
        public const цел wxSTC_CSS_UNKNOWN_IDENTIFIER = 7;
        public const цел wxSTC_CSS_VALUE = 8;
        public const цел wxSTC_CSS_COMMENT = 9;
        public const цел wxSTC_CSS_ID = 10;
        public const цел wxSTC_CSS_IMPORTANT = 11;
        public const цел wxSTC_CSS_DIRECTIVE = 12;
        public const цел wxSTC_CSS_DOUBLESTRING = 13;
        public const цел wxSTC_CSS_SINGLESTRING = 14;

        // Lexical states for SCLEX_POV
        public const цел wxSTC_POV_DEFAULT = 0;
        public const цел wxSTC_POV_COMMENT = 1;
        public const цел wxSTC_POV_COMMENTLINE = 2;
        public const цел wxSTC_POV_COMMENTDOC = 3;
        public const цел wxSTC_POV_NUMBER = 4;
        public const цел wxSTC_POV_WORD = 5;
        public const цел wxSTC_POV_STRING = 6;
        public const цел wxSTC_POV_OPERATOR = 7;
        public const цел wxSTC_POV_IDENTIFIER = 8;
        public const цел wxSTC_POV_BRACE = 9;
        public const цел wxSTC_POV_WORD2 = 10;


        //-----------------------------------------
        // Commands that can be bound to keystrokes

        // Redoes the next action on the undo history.
        public const цел wxSTC_CMD_REDO = 2011;

        // Select all the текст in the document.
        public const цел wxSTC_CMD_SELECTALL = 2013;

        // Undo one action in the undo history.
        public const цел wxSTC_CMD_UNDO = 2176;

        // Cut the selection to the clipboard.
        public const цел wxSTC_CMD_CUT = 2177;

        // Копируй the selection to the clipboard.
        public const цел wxSTC_CMD_COPY = 2178;

        // Вставь the contents of the clipboard into the document replacing the selection.
        public const цел wxSTC_CMD_PASTE = 2179;

        // Очисть the selection.
        public const цел wxSTC_CMD_CLEAR = 2180;

        // Move caret down one line.
        public const цел wxSTC_CMD_LINEDOWN = 2300;

        // Move caret down one line extending selection to new caret position.
        public const цел wxSTC_CMD_LINEDOWNEXTEND = 2301;

        // Move caret up one line.
        public const цел wxSTC_CMD_LINEUP = 2302;

        // Move caret up one line extending selection to new caret position.
        public const цел wxSTC_CMD_LINEUPEXTEND = 2303;

        // Move caret left one character.
        public const цел wxSTC_CMD_CHARLEFT = 2304;

        // Move caret left one character extending selection to new caret position.
        public const цел wxSTC_CMD_CHARLEFTEXTEND = 2305;

        // Move caret right one character.
        public const цел wxSTC_CMD_CHARRIGHT = 2306;

        // Move caret right one character extending selection to new caret position.
        public const цел wxSTC_CMD_CHARRIGHTEXTEND = 2307;

        // Move caret left one word.
        public const цел wxSTC_CMD_WORDLEFT = 2308;

        // Move caret left one word extending selection to new caret position.
        public const цел wxSTC_CMD_WORDLEFTEXTEND = 2309;

        // Move caret right one word.
        public const цел wxSTC_CMD_WORDRIGHT = 2310;

        // Move caret right one word extending selection to new caret position.
        public const цел wxSTC_CMD_WORDRIGHTEXTEND = 2311;

        // Move caret to first position on line.
        public const цел wxSTC_CMD_HOME = 2312;

        // Move caret to first position on line extending selection to new caret position.
        public const цел wxSTC_CMD_HOMEEXTEND = 2313;

        // Move caret to last position on line.
        public const цел wxSTC_CMD_LINEEND = 2314;

        // Move caret to last position on line extending selection to new caret position.
        public const цел wxSTC_CMD_LINEENDEXTEND = 2315;

        // Move caret to first position in document.
        public const цел wxSTC_CMD_DOCUMENTSTART = 2316;

        // Move caret to first position in document extending selection to new caret position.
        public const цел wxSTC_CMD_DOCUMENTSTARTEXTEND = 2317;

        // Move caret to last position in document.
        public const цел wxSTC_CMD_DOCUMENTEND = 2318;

        // Move caret to last position in document extending selection to new caret position.
        public const цел wxSTC_CMD_DOCUMENTENDEXTEND = 2319;

        // Move caret one page up.
        public const цел wxSTC_CMD_PAGEUP = 2320;

        // Move caret one page up extending selection to new caret position.
        public const цел wxSTC_CMD_PAGEUPEXTEND = 2321;

        // Move caret one page down.
        public const цел wxSTC_CMD_PAGEDOWN = 2322;

        // Move caret one page down extending selection to new caret position.
        public const цел wxSTC_CMD_PAGEDOWNEXTEND = 2323;

        // Switch from insert to overtype mode or the reverse.
        public const цел wxSTC_CMD_EDITTOGGLEOVERTYPE = 2324;

        // Cancel any modes such as call tip or auto-completion list display.
        public const цел wxSTC_CMD_CANCEL = 2325;

        // Delete the selection or if no selection, the character before the caret.
        public const цел wxSTC_CMD_DELETEBACK = 2326;

        // If selection is empty or all on one line replace the selection with a tab character.
        // If more than one line selected, indent the lines.
        public const цел wxSTC_CMD_TAB = 2327;

        // Dedent the selected lines.
        public const цел wxSTC_CMD_BACKTAB = 2328;

        // Insert a new line, may use a CRLF, CR or LF depending on EOL mode.
        public const цел wxSTC_CMD_NEWLINE = 2329;

        // Insert a Form Feed character.
        public const цел wxSTC_CMD_FORMFEED = 2330;

        // Move caret to before first visible character on line.
        // If already there move to first character on line.
        public const цел wxSTC_CMD_VCHOME = 2331;

        // Like VCHome but extending selection to new caret position.
        public const цел wxSTC_CMD_VCHOMEEXTEND = 2332;

        // Magnify the displayed текст by increasing the sizes by 1 point.
        public const цел wxSTC_CMD_ZOOMIN = 2333;

        // Make the displayed текст smaller by decreasing the sizes by 1 point.
        public const цел wxSTC_CMD_ZOOMOUT = 2334;

        // Delete the word to the left of the caret.
        public const цел wxSTC_CMD_DELWORDLEFT = 2335;

        // Delete the word to the right of the caret.
        public const цел wxSTC_CMD_DELWORDRIGHT = 2336;

        // Cut the line containing the caret.
        public const цел wxSTC_CMD_LINECUT = 2337;

        // Delete the line containing the caret.
        public const цел wxSTC_CMD_LINEDELETE = 2338;

        // Switch the current line with the previous.
        public const цел wxSTC_CMD_LINETRANSPOSE = 2339;

        // Duplicate the current line.
        public const цел wxSTC_CMD_LINEDUPLICATE = 2404;

        // Transform the selection to lower case.
        public const цел wxSTC_CMD_LOWERCASE = 2340;

        // Transform the selection to upper case.
        public const цел wxSTC_CMD_UPPERCASE = 2341;

        // Scroll the document down, keeping the caret visible.
        public const цел wxSTC_CMD_LINESCROLLDOWN = 2342;

        // Scroll the document up, keeping the caret visible.
        public const цел wxSTC_CMD_LINESCROLLUP = 2343;

        // Delete the selection or if no selection, the character before the caret.
        // Will not delete the character before at the start of a line.
        public const цел wxSTC_CMD_DELETEBACKNOTLINE = 2344;

        // Move caret to first position on display line.
        public const цел wxSTC_CMD_HOMEDISPLAY = 2345;

        // Move caret to first position on display line extending selection to
        // new caret position.
        public const цел wxSTC_CMD_HOMEDISPLAYEXTEND = 2346;

        // Move caret to last position on display line.
        public const цел wxSTC_CMD_LINEENDDISPLAY = 2347;

        // Move caret to last position on display line extending selection to new
        // caret position.
        public const цел wxSTC_CMD_LINEENDDISPLAYEXTEND = 2348;

        // These are like their namesakes Home(Extend)?, LineEnd(Extend)?, VCHome(Extend)?
        // except they behave differently when word-wrap is enabled:
        // They go first to the start / end of the display line, like (Home|LineEnd)Display
        // The difference is that, the cursor is already at the point, it goes on to the start
        // or end of the document line, as appropriate for (Home|LineEnd|VCHome)Extend.
        public const цел wxSTC_CMD_HOMEWRAP = 2349;
        public const цел wxSTC_CMD_HOMEWRAPEXTEND = 2450;
        public const цел wxSTC_CMD_LINEENDWRAP = 2451;
        public const цел wxSTC_CMD_LINEENDWRAPEXTEND = 2452;
        public const цел wxSTC_CMD_VCHOMEWRAP = 2453;
        public const цел wxSTC_CMD_VCHOMEWRAPEXTEND = 2454;

        // Move to the previous change in capitalisation.
        public const цел wxSTC_CMD_WORDPARTLEFT = 2390;

        // Move to the previous change in capitalisation extending selection
        // to new caret position.
        public const цел wxSTC_CMD_WORDPARTLEFTEXTEND = 2391;

        // Move to the change next in capitalisation.
        public const цел wxSTC_CMD_WORDPARTRIGHT = 2392;

        // Move to the next change in capitalisation extending selection
        // to new caret position.
        public const цел wxSTC_CMD_WORDPARTRIGHTEXTEND = 2393;

        // Delete back from the current position to the start of the line.
        public const цел wxSTC_CMD_DELLINELEFT = 2395;

        // Delete forwards from the current position to the end of the line.
        public const цел wxSTC_CMD_DELLINERIGHT = 2396;

        // Move caret between paragraphs (delimited by empty lines)
        public const цел wxSTC_CMD_PARADOWN = 2413;
        public const цел wxSTC_CMD_PARADOWNEXTEND = 2414;
        public const цел wxSTC_CMD_PARAUP = 2415;
        public const цел wxSTC_CMD_PARAUPEXTEND = 2416;

        //-----------------------------------------------------------------------------

        static this()
        {
        	 wxEVT_STC_CHANGE = wxStyledTextCtrl_EVT_STC_CHANGE();
        	 wxEVT_STC_STYLENEEDED = wxStyledTextCtrl_EVT_STC_STYLENEEDED();
        	 wxEVT_STC_CHARADDED = wxStyledTextCtrl_EVT_STC_CHARADDED();
        	 wxEVT_STC_SAVEPOINTREACHED = wxStyledTextCtrl_EVT_STC_SAVEPOINTREACHED();
        	 wxEVT_STC_SAVEPOINTLEFT = wxStyledTextCtrl_EVT_STC_SAVEPOINTLEFT();  
        	 wxEVT_STC_ROMODIFYATTEMPT = wxStyledTextCtrl_EVT_STC_ROMODIFYATTEMPT();
        	 wxEVT_STC_KEY = wxStyledTextCtrl_EVT_STC_KEY();
        	 wxEVT_STC_DOUBLECLICK = wxStyledTextCtrl_EVT_STC_DOUBLECLICK();
        	 wxEVT_STC_UPDATEUI = wxStyledTextCtrl_EVT_STC_UPDATEUI();
        	 wxEVT_STC_MODIFIED = wxStyledTextCtrl_EVT_STC_MODIFIED();
        	 wxEVT_STC_MACRORECORD = wxStyledTextCtrl_EVT_STC_MACRORECORD();
        	 wxEVT_STC_MARGINCLICK = wxStyledTextCtrl_EVT_STC_MARGINCLICK();
        	 wxEVT_STC_NEEDSHOWN = wxStyledTextCtrl_EVT_STC_NEEDSHOWN();
        //	 wxEVT_STC_POSCHANGED = wxStyledTextCtrl_EVT_STC_POSCHANGED();
        	 wxEVT_STC_PAINTED = wxStyledTextCtrl_EVT_STC_PAINTED();
        	 wxEVT_STC_USERLISTSELECTION = wxStyledTextCtrl_EVT_STC_USERLISTSELECTION();
        	 wxEVT_STC_URIDROPPED = wxStyledTextCtrl_EVT_STC_URIDROPPED();
        	 wxEVT_STC_DWELLSTART = wxStyledTextCtrl_EVT_STC_DWELLSTART();
        	 wxEVT_STC_DWELLEND = wxStyledTextCtrl_EVT_STC_DWELLEND();
        	 wxEVT_STC_START_DRAG = wxStyledTextCtrl_EVT_STC_START_DRAG();
        	 wxEVT_STC_DRAG_OVER = wxStyledTextCtrl_EVT_STC_DRAG_OVER();
        	 wxEVT_STC_DO_DROP = wxStyledTextCtrl_EVT_STC_DO_DROP();
        	 wxEVT_STC_ZOOM = wxStyledTextCtrl_EVT_STC_ZOOM();
        	 wxEVT_STC_HOTSPOT_CLICK = wxStyledTextCtrl_EVT_STC_HOTSPOT_CLICK();
        	 wxEVT_STC_HOTSPOT_DCLICK = wxStyledTextCtrl_EVT_STC_HOTSPOT_DCLICK();
        	 wxEVT_STC_CALLTIP_CLICK = wxStyledTextCtrl_EVT_STC_CALLTIP_CLICK();

            Событие.ДобавьТипСоб(wxEVT_STC_CHANGE,               &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_STYLENEEDED,          &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_CHARADDED,            &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_SAVEPOINTREACHED,     &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_SAVEPOINTLEFT,        &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_ROMODIFYATTEMPT,      &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_KEY,                  &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_DOUBLECLICK,          &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_UPDATEUI,             &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_MODIFIED,             &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_MACRORECORD,          &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_MARGINCLICK,          &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_NEEDSHOWN,            &StyledTextEvent.Нов);
            //Событие.ДобавьТипСоб(wxEVT_STC_POSCHANGED,           &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_PAINTED,              &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_USERLISTSELECTION,    &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_URIDROPPED,           &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_DWELLSTART,           &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_DWELLEND,             &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_START_DRAG,           &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_DRAG_OVER,            &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_DO_DROP,              &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_ZOOM,                 &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_HOTSPOT_CLICK,        &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_HOTSPOT_DCLICK,       &StyledTextEvent.Нов);
            Событие.ДобавьТипСоб(wxEVT_STC_CALLTIP_CLICK,        &StyledTextEvent.Нов);
        }

        //-----------------------------------------------------------------------------
	public const ткст wxSTCNameStr = "stcwindow";

        public this(ЦУк шхобъ) 
            { super (шхобъ); }

        public  this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль =0, ткст имя = wxSTCNameStr)
            { this(wxStyledTextCtrl_ctor(wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя)); }
	    
		public static wxObject Нов(ЦУк шхобъ) { return new StyledTextCtrl(шхобъ); }
	
	//---------------------------------------------------------------------
	// ctors with сам created ид
	    
        public  this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль =0, ткст имя = wxSTCNameStr)
	    { this(родитель, Окно.UniqueID, поз, size, стиль, имя);}

        //-----------------------------------------------------------------------------

        public проц AddText(ткст текст)
        {
            wxStyledTextCtrl_AddText(шхобъ, текст);
        }

        /*public проц AddStyledText(MemoryBuffer данные)
        {
            wxStyledTextCtrl_AddStyledText(шхобъ, wxObject.SafePtr(данные));
        }*/

        public проц InsertText(цел поз, ткст текст)
        {
            wxStyledTextCtrl_InsertText(шхобъ, поз, текст);
        }

        //-----------------------------------------------------------------------------

        public проц ClearAll()
        {
            wxStyledTextCtrl_ClearAll(шхобъ);
        }

        public проц ClearDocumentStyle()
        {
            wxStyledTextCtrl_ClearDocumentStyle(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public цел Length() { return wxStyledTextCtrl_GetLength(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел GetCharAt(цел поз)
        {
            return wxStyledTextCtrl_GetCharAt(шхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        public цел CurrentPos() { return wxStyledTextCtrl_GetCurrentPos(шхобъ); }
        public проц CurrentPos(цел значение) { wxStyledTextCtrl_SetCurrentPos(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Anchor() { return wxStyledTextCtrl_GetAnchor(шхобъ); }
        public проц Anchor(цел значение) { wxStyledTextCtrl_SetAnchor(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел GetStyleAt(цел поз)
        {
            return wxStyledTextCtrl_GetStyleAt(шхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        public проц Redo()
        {
            wxStyledTextCtrl_Redo(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public бул UndoCollection() { return wxStyledTextCtrl_GetUndoCollection(шхобъ); }
        public проц UndoCollection(бул значение) { wxStyledTextCtrl_SetUndoCollection(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц SelectAll()
        {
            wxStyledTextCtrl_SelectAll(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц SetSavePoint()
        {
            wxStyledTextCtrl_SetSavePoint(шхобъ);
        }

        //-----------------------------------------------------------------------------

        /*public MemoryBuffer GetStyledText(цел startPos, цел endPos)
        {
            return wxStyledTextCtrl_GetStyledText(шхобъ, startPos, endPos);
        }*/

        //-----------------------------------------------------------------------------

        public бул CanRedo() { return wxStyledTextCtrl_CanRedo(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел MarkerLineFromHandle(цел handle)
        {
            return wxStyledTextCtrl_MarkerLineFromHandle(шхобъ, handle);
        }

        public проц MarkerDeleteHandle(цел handle)
        {
            wxStyledTextCtrl_MarkerDeleteHandle(шхобъ, handle);
        }

        //-----------------------------------------------------------------------------

        public цел ViewWhiteSpace() { return wxStyledTextCtrl_GetViewWhiteSpace(шхобъ); }
        public проц ViewWhiteSpace(цел значение) { wxStyledTextCtrl_SetViewWhiteSpace(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел PositionFromPoint(Точка pt)
        {
            return wxStyledTextCtrl_PositionFromPoint(шхобъ, pt);
        }

        public цел PositionFromPointClose(цел x, цел y)
        {
            return wxStyledTextCtrl_PositionFromPointClose(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц GotoLine(цел line)
        {
            wxStyledTextCtrl_GotoLine(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц GotoPos(цел поз)
        {
            wxStyledTextCtrl_GotoPos(шхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        public ткст CurLine() {
                цел i;
                return GetCurLine(i);
            }

        public ткст GetCurLine(out цел linePos)
        {
            return cast(ткст) new wxString(wxStyledTextCtrl_GetCurLine(шхобъ, linePos), да);
        }

        //-----------------------------------------------------------------------------

        public цел EndStyled() { return wxStyledTextCtrl_GetEndStyled(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц ConvertEOLs(цел eolMode)
        {
            wxStyledTextCtrl_ConvertEOLs(шхобъ, eolMode);
        }

        //-----------------------------------------------------------------------------

        public цел EOLMode() { return wxStyledTextCtrl_GetEOLMode(шхобъ); }
        public проц EOLMode(цел значение) { wxStyledTextCtrl_SetEOLMode(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц StartStyling(цел поз, цел маска)
        {
            wxStyledTextCtrl_StartStyling(шхобъ, поз, маска);
        }

        //-----------------------------------------------------------------------------

        public проц SetStyling(цел length, цел стиль)
        {
            wxStyledTextCtrl_SetStyling(шхобъ, length, стиль);
        }

        //-----------------------------------------------------------------------------

        public бул BufferedDraw() { return wxStyledTextCtrl_GetBufferedDraw(шхобъ); }
        public проц BufferedDraw(бул значение) { wxStyledTextCtrl_SetBufferedDraw(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел TabWidth() { return wxStyledTextCtrl_GetTabWidth(шхобъ); }
        public проц TabWidth(цел значение) { wxStyledTextCtrl_SetTabWidth(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел CodePage() { return wxStyledTextCtrl_GetCodePage(шхобъ); } 
        public проц CodePage(цел значение) { wxStyledTextCtrl_SetCodePage(шхобъ, значение); } 

        //-----------------------------------------------------------------------------

        public проц MarkerDefine(цел markerNumber, цел markerSymbol, Цвет foreground, Цвет background)
        {
            wxStyledTextCtrl_MarkerDefine(шхобъ, markerNumber, markerSymbol, wxObject.SafePtr(foreground), wxObject.SafePtr(background));
        }

        public проц MarkerSetForeground(цел markerNumber, Цвет fore)
        {
            wxStyledTextCtrl_MarkerSetForeground(шхобъ, markerNumber, wxObject.SafePtr(fore));
        }

        public проц MarkerSetBackground(цел markerNumber, Цвет back)
        {
            wxStyledTextCtrl_MarkerSetBackground(шхобъ, markerNumber, wxObject.SafePtr(back));
        }

        public цел MarkerAdd(цел line, цел markerNumber)
        {
            return wxStyledTextCtrl_MarkerAdd(шхобъ, line, markerNumber);
        }

        public проц MarkerDelete(цел line, цел markerNumber)
        {
            wxStyledTextCtrl_MarkerDelete(шхобъ, line, markerNumber);
        }

        public проц MarkerDeleteAll(цел markerNumber)
        {
            wxStyledTextCtrl_MarkerDeleteAll(шхобъ, markerNumber);
        }

        public цел MarkerGet(цел line)
        {
            return wxStyledTextCtrl_MarkerGet(шхобъ, line);
        }

        public цел MarkerNext(цел lineStart, цел markerMask)
        {
            return wxStyledTextCtrl_MarkerNext(шхобъ, lineStart, markerMask);
        }

        public цел MarkerPrevious(цел lineStart, цел markerMask)
        {
            return wxStyledTextCtrl_MarkerPrevious(шхобъ, lineStart, markerMask);
        }

        public проц MarkerDefineBitmap(цел markerNumber, Битмап bmp)
        {
            wxStyledTextCtrl_MarkerDefineBitmap(шхобъ, markerNumber, wxObject.SafePtr(bmp));
        }

        //-----------------------------------------------------------------------------

        public проц SetMarginType(цел margin, цел marginType)
        {
            wxStyledTextCtrl_SetMarginType(шхобъ, margin, marginType);
        }

        public цел GetMarginType(цел margin)
        {
            return wxStyledTextCtrl_GetMarginType(шхобъ, margin);
        }

        //-----------------------------------------------------------------------------

        public проц SetMarginWidth(цел margin, цел pixelWidth)
        {
            wxStyledTextCtrl_SetMarginWidth(шхобъ, margin, pixelWidth);
        }

        public цел GetMarginWidth(цел margin)
        {
            return wxStyledTextCtrl_GetMarginWidth(шхобъ, margin);
        }

        //-----------------------------------------------------------------------------

        public проц SetMarginMask(цел margin, цел маска)
        {
            wxStyledTextCtrl_SetMarginMask(шхобъ, margin, маска);
        }

        public цел GetMarginMask(цел margin)
        {
            return wxStyledTextCtrl_GetMarginMask(шхобъ, margin);
        }

        //-----------------------------------------------------------------------------

        public проц SetMarginSensitive(цел margin, бул sensitive)
        {
            wxStyledTextCtrl_SetMarginSensitive(шхобъ, margin, sensitive);
        }

        public бул GetMarginSensitive(цел margin)
        {
            return wxStyledTextCtrl_GetMarginSensitive(шхобъ, margin);
        }

        //-----------------------------------------------------------------------------

        public проц StyleClearAll()
        {
            wxStyledTextCtrl_StyleClearAll(шхобъ);
        }

        public проц StyleSetForeground(цел стиль, Цвет fore)
        {
            wxStyledTextCtrl_StyleSetForeground(шхобъ, стиль, wxObject.SafePtr(fore));
        }

        public проц StyleSetBackground(цел стиль, Цвет back)
        {
            wxStyledTextCtrl_StyleSetBackground(шхобъ, стиль, wxObject.SafePtr(back));
        }

        public проц StyleSetBold(цел стиль, бул bold)
        {
            wxStyledTextCtrl_StyleSetBold(шхобъ, стиль, bold);
        }

        public проц StyleSetItalic(цел стиль, бул italic)
        {
            wxStyledTextCtrl_StyleSetItalic(шхобъ, стиль, italic);
        }

        public проц StyleSetSize(цел стиль, цел sizePoints)
        {
            wxStyledTextCtrl_StyleSetSize(шхобъ, стиль, sizePoints);
        }

        public проц StyleSetFaceName(цел стиль, ткст fontName)
        {
            wxStyledTextCtrl_StyleSetFaceName(шхобъ, стиль, fontName);
        }

        public проц StyleSetEOLFilled(цел стиль, бул filled)
        {
            wxStyledTextCtrl_StyleSetEOLFilled(шхобъ, стиль, filled);
        }

        public проц StyleResetDefault()
        {
            wxStyledTextCtrl_StyleResetDefault(шхобъ);
        }

        public проц StyleSetUnderline(цел стиль, бул underline)
        {
            wxStyledTextCtrl_StyleSetUnderline(шхобъ, стиль, underline);
        }

        public проц StyleSetCase(цел стиль, цел caseForce)
        {
            wxStyledTextCtrl_StyleSetCase(шхобъ, стиль, caseForce);
        }

        public проц StyleSetCharacterSet(цел стиль, цел characterSet)
        {
            wxStyledTextCtrl_StyleSetCharacterSet(шхобъ, стиль, characterSet);
        }

        public проц StyleSetHotSpot(цел стиль, бул hotspot)
        {
            wxStyledTextCtrl_StyleSetHotSpot(шхобъ, стиль, hotspot);
        }

        public проц StyleSetVisible(цел стиль, бул visible)
        {
            wxStyledTextCtrl_StyleSetVisible(шхобъ, стиль, visible);
        }

        public проц StyleSetChangeable(цел стиль, бул changeable)
        {
            wxStyledTextCtrl_StyleSetChangeable(шхобъ, стиль, changeable);
        }

        //-----------------------------------------------------------------------------

        public проц SetSelForeground(бул useSetting, Цвет fore)
        {
            wxStyledTextCtrl_SetSelForeground(шхобъ, useSetting, wxObject.SafePtr(fore));
        }

        public проц SetSelBackground(бул useSetting, Цвет back)
        {
            wxStyledTextCtrl_SetSelBackground(шхобъ, useSetting, wxObject.SafePtr(back));
        }

        //-----------------------------------------------------------------------------

        public Цвет CaretForeground() { return new Цвет(wxStyledTextCtrl_GetCaretForeground(шхобъ), да); }
        public проц CaretForeground(Цвет значение) { wxStyledTextCtrl_SetCaretForeground(шхобъ, wxObject.SafePtr(значение)); } 

        //-----------------------------------------------------------------------------

        public проц CmdKeyAssign(цел key, цел modifiers, цел команда)
        {
            wxStyledTextCtrl_CmdKeyAssign(шхобъ, key, modifiers, команда);
        }

        public проц CmdKeyClear(цел key, цел modifiers)
        {
            wxStyledTextCtrl_CmdKeyClear(шхобъ, key, modifiers);
        }

        public проц CmdKeyClearAll()
        {
            wxStyledTextCtrl_CmdKeyClearAll(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц SetStyleBytes(ббайт[] styleBytes)
        {
            wxStyledTextCtrl_SetStyleBytes(шхобъ, styleBytes.length, styleBytes.ptr);
        }

        //-----------------------------------------------------------------------------

        public цел CaretPeriod() { return wxStyledTextCtrl_GetCaretPeriod(шхобъ); }
        public проц CaretPeriod(цел значение) { wxStyledTextCtrl_SetCaretPeriod(шхобъ, значение); } 

        //-----------------------------------------------------------------------------

        public проц SetWordChars(ткст characters)
        {
            wxStyledTextCtrl_SetWordChars(шхобъ, characters);
        }

        //-----------------------------------------------------------------------------

        public проц BeginUndoAction()
        {
            wxStyledTextCtrl_BeginUndoAction(шхобъ);
        }

        public проц EndUndoAction()
        {
            wxStyledTextCtrl_EndUndoAction(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц IndicatorSetStyle(цел indic, цел стиль)
        {
            wxStyledTextCtrl_IndicatorSetStyle(шхобъ, indic, стиль);
        }

        public цел IndicatorGetStyle(цел indic)
        {
            return wxStyledTextCtrl_IndicatorGetStyle(шхобъ, indic);
        }

        public проц IndicatorSetForeground(цел indic, Цвет fore)
        {
            wxStyledTextCtrl_IndicatorSetForeground(шхобъ, indic, wxObject.SafePtr(fore));
        }

        public Цвет IndicatorGetForeground(цел indic)
        {
            return new Цвет(wxStyledTextCtrl_IndicatorGetForeground(шхобъ, indic), да);
        }

        //-----------------------------------------------------------------------------

        public проц SetWhitespaceForeground(бул useSetting, Цвет fore)
        {
            wxStyledTextCtrl_SetWhitespaceForeground(шхобъ, useSetting, wxObject.SafePtr(fore));
        }

        public проц SetWhitespaceBackground(бул useSetting, Цвет back)
        {
            wxStyledTextCtrl_SetWhitespaceBackground(шхобъ, useSetting, wxObject.SafePtr(back));
        }

        //-----------------------------------------------------------------------------

        public цел StyleBits() { return wxStyledTextCtrl_GetStyleBits(шхобъ); }
        public проц StyleBits(цел значение) { wxStyledTextCtrl_SetStyleBits(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц SetLineState(цел line, цел state)
        {
            wxStyledTextCtrl_SetLineState(шхобъ, line, state);
        }

        public цел GetLineState(цел line)
        {
            return wxStyledTextCtrl_GetLineState(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public цел MaxLineState() { return wxStyledTextCtrl_GetMaxLineState(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул CaretLineVisible() { return wxStyledTextCtrl_GetCaretLineVisible(шхобъ); }
        public проц CaretLineVisible(бул значение) { wxStyledTextCtrl_SetCaretLineVisible(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public Цвет CaretLineBack() { return new Цвет(wxStyledTextCtrl_GetCaretLineBack(шхобъ), да); } 
        public проц CaretLineBack(Цвет значение) { wxStyledTextCtrl_SetCaretLineBack(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц AutoCompShow(цел lenEntered, ткст itemList)
        {
            wxStyledTextCtrl_AutoCompShow(шхобъ, lenEntered, itemList);
        }

        public проц AutoCompCancel()
        {
            wxStyledTextCtrl_AutoCompCancel(шхобъ);
        }

        public бул AutoCompActive() { return wxStyledTextCtrl_AutoCompActive(шхобъ); }

        public цел AutoCompPosStart() { return wxStyledTextCtrl_AutoCompPosStart(шхобъ); } 

        public проц AutoCompComplete()
        {
            wxStyledTextCtrl_AutoCompComplete(шхобъ);
        }

        public проц AutoCompStops(ткст значение) { wxStyledTextCtrl_AutoCompStops(шхобъ, значение); }

        public сим AutoCompSeparator() { return cast(сим)wxStyledTextCtrl_AutoCompGetSeparator(шхобъ); }
        public проц AutoCompSeparator(сим значение) { wxStyledTextCtrl_AutoCompSetSeparator(шхобъ, cast(цел)значение); } 

        public проц AutoCompSelect(ткст текст)
        {
            wxStyledTextCtrl_AutoCompSelect(шхобъ, текст);
        }

        public бул AutoCompCancelAtStart() { return wxStyledTextCtrl_AutoCompGetCancelAtStart(шхобъ); }
        public проц AutoCompCancelAtStart(бул значение) { wxStyledTextCtrl_AutoCompSetCancelAtStart(шхобъ, значение); } 

        public проц AutoCompFillUps(ткст значение) { wxStyledTextCtrl_AutoCompSetFillUps(шхобъ, значение); }

        public бул AutoCompChooseSingle() { return wxStyledTextCtrl_AutoCompGetChooseSingle(шхобъ); }
        public проц AutoCompChooseSingle(бул значение) { wxStyledTextCtrl_AutoCompSetChooseSingle(шхобъ, значение); }

        public бул AutoCompIgnoreCase() { return wxStyledTextCtrl_AutoCompGetIgnoreCase(шхобъ); }
        public проц AutoCompIgnoreCase(бул значение) { wxStyledTextCtrl_AutoCompSetIgnoreCase(шхобъ, значение); } 

        public проц AutoCompAutoHide(бул значение) { wxStyledTextCtrl_AutoCompSetAutoHide(шхобъ, значение); }
        public бул AutoCompAutoHide() { return wxStyledTextCtrl_AutoCompGetAutoHide(шхобъ); }

        public проц AutoCompDropRestOfWord(бул значение) { wxStyledTextCtrl_AutoCompSetDropRestOfWord(шхобъ, значение); }
        public бул AutoCompDropRestOfWord() { return wxStyledTextCtrl_AutoCompGetDropRestOfWord(шхобъ); } 

        public цел AutoCompTypeSeparator() { return wxStyledTextCtrl_AutoCompGetTypeSeparator(шхобъ); }
        public проц AutoCompTypeSeparator(цел значение) { wxStyledTextCtrl_AutoCompSetTypeSeparator(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц UserListShow(цел listType, ткст itemList)
        {
            wxStyledTextCtrl_UserListShow(шхобъ, listType, itemList);
        }

        //-----------------------------------------------------------------------------

        public проц RegisterImage(цел тип, Битмап bmp)
        {
            wxStyledTextCtrl_RegisterImage(шхобъ, тип, wxObject.SafePtr(bmp));
        }

        public проц ClearRegisteredImages()
        {
            wxStyledTextCtrl_ClearRegisteredImages(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public цел Indent() { return wxStyledTextCtrl_GetIndent(шхобъ); }
        public проц Indent(цел значение) { wxStyledTextCtrl_SetIndent(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул UseTabs() { return wxStyledTextCtrl_GetUseTabs(шхобъ); }
        public проц UseTabs(бул значение) { wxStyledTextCtrl_SetUseTabs(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц SetLineIndentation(цел line, цел indentSize)
        {
            wxStyledTextCtrl_SetLineIndentation(шхобъ, line, indentSize);
        }

        public цел GetLineIndentation(цел line)
        {
            return wxStyledTextCtrl_GetLineIndentation(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public цел GetLineIndentPosition(цел line)
        {
            return wxStyledTextCtrl_GetLineIndentPosition(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public цел GetColumn(цел поз)
        {
            return wxStyledTextCtrl_GetColumn(шхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        public проц UseHorizontalScrollBar(бул значение) { wxStyledTextCtrl_SetUseHorizontalScrollBar(шхобъ, значение); }
        public бул UseHorizontalScrollBar() { return wxStyledTextCtrl_GetUseHorizontalScrollBar(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц IndentationGuides(бул значение) { wxStyledTextCtrl_SetIndentationGuides(шхобъ, значение); }
        public бул IndentationGuides() { return wxStyledTextCtrl_GetIndentationGuides(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел HighlightGuide() { return wxStyledTextCtrl_GetHighlightGuide(шхобъ); }
        public проц HighlightGuide(цел значение) { wxStyledTextCtrl_SetHighlightGuide(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел GetLineEndPosition(цел line)
        {
            return wxStyledTextCtrl_GetLineEndPosition(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public бул ReadOnly() { return wxStyledTextCtrl_GetReadOnly(шхобъ); }
        public проц ReadOnly(бул значение) { wxStyledTextCtrl_SetReadOnly(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел SelectionStart() { return wxStyledTextCtrl_GetSelectionStart(шхобъ); } 
        public проц SelectionStart(цел значение) { wxStyledTextCtrl_SetSelectionStart(шхобъ, значение); }

        public цел SelectionEnd() { return wxStyledTextCtrl_GetSelectionEnd(шхобъ); }
        public проц SelectionEnd(цел значение) { wxStyledTextCtrl_SetSelectionEnd(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел PrintMagnification() { return wxStyledTextCtrl_GetPrintMagnification(шхобъ); }
        public проц PrintMagnification(цел значение) { wxStyledTextCtrl_SetPrintMagnification(шхобъ, значение); }

        public цел PrintColourMode() { return wxStyledTextCtrl_GetPrintColourMode(шхобъ); }
        public проц PrintColourMode(цел значение) { wxStyledTextCtrl_SetPrintColourMode(шхобъ, значение); } 

        //-----------------------------------------------------------------------------

        public цел FindText(цел minPos, цел maxPos, ткст текст, цел флаги)
        {
            return wxStyledTextCtrl_FindText(шхобъ, minPos, maxPos, текст, флаги);
        }

        //-----------------------------------------------------------------------------

        public цел FormatRange(бул doDraw, цел startPos, цел endPos, DC draw, DC target, Прямоугольник renderRect, Прямоугольник pageRect)
        {
            return wxStyledTextCtrl_FormatRange(шхобъ, doDraw, startPos, endPos, wxObject.SafePtr(draw), wxObject.SafePtr(target), renderRect, pageRect);
        }

        //-----------------------------------------------------------------------------

        public цел FirstVisibleLine() { return wxStyledTextCtrl_GetFirstVisibleLine(шхобъ); }

        //-----------------------------------------------------------------------------

        public ткст GetLine(цел line)
        {
            return cast(ткст) new wxString(wxStyledTextCtrl_GetLine(шхобъ, line), да);
        }

        //-----------------------------------------------------------------------------

        public цел LineCount() { return wxStyledTextCtrl_GetLineCount(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел MarginLeft() { return wxStyledTextCtrl_GetMarginLeft(шхобъ); }
        public проц MarginLeft(цел значение) { wxStyledTextCtrl_SetMarginLeft(шхобъ, значение); }

        public цел MarginRight() { return wxStyledTextCtrl_GetMarginRight(шхобъ); }
        public проц MarginRight(цел значение) { wxStyledTextCtrl_SetMarginRight(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Modify() { return wxStyledTextCtrl_GetModify(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц SetSelection(цел start, цел end)
        {
            wxStyledTextCtrl_SetSelection(шхобъ, start, end);
        }

        public ткст SelectedText() { return cast(ткст) new wxString(wxStyledTextCtrl_GetSelectedText(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public ткст GetTextRange(цел startPos, цел endPos)
        {
            return cast(ткст) new wxString(wxStyledTextCtrl_GetTextRange(шхобъ, startPos, endPos), да);
        }

        //-----------------------------------------------------------------------------

        public проц HideSelection(бул значение) { wxStyledTextCtrl_HideSelection(шхобъ, значение); } 

        //-----------------------------------------------------------------------------

        public цел LineFromPosition(цел поз)
        {
            return wxStyledTextCtrl_LineFromPosition(шхобъ, поз);
        }

        public цел PositionFromLine(цел line)
        {
            return wxStyledTextCtrl_PositionFromLine(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц LineScroll(цел columns, цел lines)
        {
            wxStyledTextCtrl_LineScroll(шхобъ, columns, lines);
        }

        //-----------------------------------------------------------------------------

        public проц EnsureCaretVisible()
        {
            wxStyledTextCtrl_EnsureCaretVisible(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц ReplaceSelection(ткст текст)
        {
            wxStyledTextCtrl_ReplaceSelection(шхобъ, текст);
        }

        //-----------------------------------------------------------------------------

        public бул CanPaste() { return wxStyledTextCtrl_CanPaste(шхобъ); } 

        public бул CanUndo() { return wxStyledTextCtrl_CanUndo(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц EmptyUndoBuffer()
        {
            wxStyledTextCtrl_EmptyUndoBuffer(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц Undo()
        {
            wxStyledTextCtrl_Undo(шхобъ);
        }

        public проц Cut()
        {
            wxStyledTextCtrl_Cut(шхобъ);
        }

        public проц Копируй()
        {
            wxStyledTextCtrl_Copy(шхобъ);
        }

        public проц Вставь()
        {
            wxStyledTextCtrl_Paste(шхобъ);
        }

        public проц Очисть()
        {
            wxStyledTextCtrl_Clear(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц Текст(ткст значение) { wxStyledTextCtrl_SetText(шхобъ, значение); } 
        public ткст Текст() { return cast(ткст) new wxString(wxStyledTextCtrl_GetText(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public цел ДлинаТекста() { return wxStyledTextCtrl_GetTextLength(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул Overtype() { return wxStyledTextCtrl_GetOvertype(шхобъ); }
        public проц Overtype(бул значение) { wxStyledTextCtrl_SetOvertype(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел CaretWidth() { return wxStyledTextCtrl_GetCaretWidth(шхобъ); } 
        public проц CaretWidth(цел значение) { wxStyledTextCtrl_SetCaretWidth(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел TargetStart() { return wxStyledTextCtrl_GetTargetStart(шхобъ); }
        public проц TargetStart(цел значение) { wxStyledTextCtrl_SetTargetStart(шхобъ, значение); }

        public цел TargetEnd() { return wxStyledTextCtrl_GetTargetEnd(шхобъ); }
        public проц TargetEnd(цел значение) { wxStyledTextCtrl_SetTargetEnd(шхобъ, значение); } 

        public цел ReplaceTarget(ткст текст)
        {
            return wxStyledTextCtrl_ReplaceTarget(шхобъ, текст);
        }

        public цел ReplaceTargetRE(ткст текст)
        {
            return wxStyledTextCtrl_ReplaceTargetRE(шхобъ, текст);
        }

        public цел SearchInTarget(ткст текст)
        {
            return wxStyledTextCtrl_SearchInTarget(шхобъ, текст);
        }

        //-----------------------------------------------------------------------------

        public цел SetSearchFlags() { return wxStyledTextCtrl_GetSearchFlags(шхобъ); }
        public проц SetSearchFlags(цел значение) { wxStyledTextCtrl_SetSearchFlags(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц CallTipShow(цел поз, ткст definition)
        {
            wxStyledTextCtrl_CallTipShow(шхобъ, поз, definition);
        }

        public проц CallTipCancel()
        {
            wxStyledTextCtrl_CallTipCancel(шхобъ);
        }

        public бул CallTipActive() { return wxStyledTextCtrl_CallTipActive(шхобъ); }

        public цел CallTipPosAtStart() { return wxStyledTextCtrl_CallTipPosAtStart(шхобъ); }

        public проц CallTipSetHighlight(цел start, цел end)
        {
            wxStyledTextCtrl_CallTipSetHighlight(шхобъ, start, end);
        }

        public проц CallTipBackground(Цвет значение) { wxStyledTextCtrl_CallTipSetBackground(шхобъ, wxObject.SafePtr(значение)); }

        public проц CallTipForeground(Цвет значение) { wxStyledTextCtrl_CallTipSetForeground(шхобъ, wxObject.SafePtr(значение)); } 

        public проц CallTipForegroundHighlight(Цвет значение) { wxStyledTextCtrl_CallTipSetForegroundHighlight(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public цел VisibleFromDocLine(цел line)
        {
            return wxStyledTextCtrl_VisibleFromDocLine(шхобъ, line);
        }

        public цел DocLineFromVisible(цел lineDisplay)
        {
            return wxStyledTextCtrl_DocLineFromVisible(шхобъ, lineDisplay);
        }

        //-----------------------------------------------------------------------------

        public проц SetFoldLevel(цел line, цел level)
        {
            wxStyledTextCtrl_SetFoldLevel(шхобъ, line, level);
        }

        public цел GetFoldLevel(цел line)
        {
            return wxStyledTextCtrl_GetFoldLevel(шхобъ, line);
        }

        public цел GetLastChild(цел line, цел level)
        {
            return wxStyledTextCtrl_GetLastChild(шхобъ, line, level);
        }

        public цел GetFoldParent(цел line)
        {
            return wxStyledTextCtrl_GetFoldParent(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц ShowLines(цел lineStart, цел lineEnd)
        {
            wxStyledTextCtrl_ShowLines(шхобъ, lineStart, lineEnd);
        }

        public проц HideLines(цел lineStart, цел lineEnd)
        {
            wxStyledTextCtrl_HideLines(шхобъ, lineStart, lineEnd);
        }

        public бул GetLineVisible(цел line)
        {
            return wxStyledTextCtrl_GetLineVisible(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц SetFoldExpanded(цел line, бул expanded)
        {
            wxStyledTextCtrl_SetFoldExpanded(шхобъ, line, expanded);
        }

        public бул GetFoldExpanded(цел line)
        {
            return wxStyledTextCtrl_GetFoldExpanded(шхобъ, line);
        }

        public проц ToggleFold(цел line)
        {
            wxStyledTextCtrl_ToggleFold(шхобъ, line);
        }

        public проц EnsureVisible(цел line)
        {
            wxStyledTextCtrl_EnsureVisible(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц FoldFlags(цел значение) { wxStyledTextCtrl_SetFoldFlags(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц EnsureVisibleEnforcePolicy(цел line)
        {
            wxStyledTextCtrl_EnsureVisibleEnforcePolicy(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public бул TabIndents() { return wxStyledTextCtrl_GetTabIndents(шхобъ); }
        public проц TabIndents(бул значение) { wxStyledTextCtrl_SetTabIndents(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул BackSpaceUnIndents() { return wxStyledTextCtrl_GetBackSpaceUnIndents(шхобъ); }
        public проц BackSpaceUnIndents(бул значение) { wxStyledTextCtrl_SetBackSpaceUnIndents(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц MouseDwellTime(цел значение) { wxStyledTextCtrl_SetMouseDwellTime(шхобъ, значение); }
        public цел MouseDwellTime() { return wxStyledTextCtrl_GetMouseDwellTime(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел WordStartPosition(цел поз, бул onlyWordCharacters)
        {
            return wxStyledTextCtrl_WordStartPosition(шхобъ, поз, onlyWordCharacters);
        }

        public цел WordEndPosition(цел поз, бул onlyWordCharacters)
        {
            return wxStyledTextCtrl_WordEndPosition(шхобъ, поз, onlyWordCharacters);
        }

        //-----------------------------------------------------------------------------

        public цел WrapMode() { return wxStyledTextCtrl_GetWrapMode(шхобъ); }
        public проц WrapMode(цел значение) { wxStyledTextCtrl_SetWrapMode(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц LayoutCache(цел значение) { wxStyledTextCtrl_SetLayoutCache(шхобъ, значение); }
        public цел LayoutCache() { return wxStyledTextCtrl_GetLayoutCache(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел ScrollWidth() { return wxStyledTextCtrl_GetScrollWidth(шхобъ); }
        public проц ScrollWidth(цел значение) { wxStyledTextCtrl_SetScrollWidth(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел TextWidth(цел стиль, ткст текст)
        {
            return wxStyledTextCtrl_TextWidth(шхобъ, стиль, текст);
        }

        //-----------------------------------------------------------------------------

        public бул EndAtLastLine() { return cast(бул)wxStyledTextCtrl_GetEndAtLastLine(шхобъ); }
        public проц EndAtLastLine(бул значение) { wxStyledTextCtrl_SetEndAtLastLine(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел TextHeight(цел line)
        {
            return wxStyledTextCtrl_TextHeight(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public бул UseVerticalScrollBar() { return wxStyledTextCtrl_GetUseVerticalScrollBar(шхобъ); }
        public проц UseVerticalScrollBar(бул значение) { wxStyledTextCtrl_SetUseVerticalScrollBar(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц AppendText(цел length, ткст текст)
        {
            wxStyledTextCtrl_AppendText(шхобъ, length, текст);
        }

        //-----------------------------------------------------------------------------

        public бул TwoPhaseDraw() { return wxStyledTextCtrl_GetTwoPhaseDraw(шхобъ); } 
        public проц TwoPhaseDraw(бул значение) { wxStyledTextCtrl_SetTwoPhaseDraw(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц TargetFromSelection()
        {
            wxStyledTextCtrl_TargetFromSelection(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц LinesJoin()
        {
            wxStyledTextCtrl_LinesJoin(шхобъ);
        }

        public проц LinesSplit(цел pixelWidth)
        {
            wxStyledTextCtrl_LinesSplit(шхобъ, pixelWidth);
        }

        //-----------------------------------------------------------------------------

        public проц SetFoldMarginColour(бул useSetting, Цвет back)
        {
            wxStyledTextCtrl_SetFoldMarginColour(шхобъ, useSetting, wxObject.SafePtr(back));
        }

        public проц SetFoldMarginHiColour(бул useSetting, Цвет fore)
        {
            wxStyledTextCtrl_SetFoldMarginHiColour(шхобъ, useSetting, wxObject.SafePtr(fore));
        }

        //-----------------------------------------------------------------------------

        public проц LineDuplicate()
        {
            wxStyledTextCtrl_LineDuplicate(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц HomeDisplay()
        {
            wxStyledTextCtrl_HomeDisplay(шхобъ);
        }

        public проц HomeDisplayExtend()
        {
            wxStyledTextCtrl_HomeDisplayExtend(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц LineEndDisplay()
        {
            wxStyledTextCtrl_LineEndDisplay(шхобъ);
        }

        public проц LineEndDisplayExtend()
        {
            wxStyledTextCtrl_LineEndDisplayExtend(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц MoveCaretInsideView()
        {
            wxStyledTextCtrl_MoveCaretInsideView(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public цел LineLength(цел line)
        {
            return wxStyledTextCtrl_LineLength(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц BraceHighlight(цел pos1, цел pos2)
        {
            wxStyledTextCtrl_BraceHighlight(шхобъ, pos1, pos2);
        }

        public проц BraceBadLight(цел поз)
        {
            wxStyledTextCtrl_BraceBadLight(шхобъ, поз);
        }

        public цел BraceMatch(цел поз)
        {
            return wxStyledTextCtrl_BraceMatch(шхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        public бул ViewEOL() { return wxStyledTextCtrl_GetViewEOL(шхобъ); }
        public проц ViewEOL(бул значение) { wxStyledTextCtrl_SetViewEOL(шхобъ, значение); } 

        //-----------------------------------------------------------------------------

        // Not really usable yet, unless sharing documents between styled
        // текст controls (?)

        public wxObject DocPointer() { return FindObject(wxStyledTextCtrl_GetDocPointer(шхобъ)); }
        public проц DocPointer(wxObject значение) { wxStyledTextCtrl_SetDocPointer(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public цел ModEventMask() { return wxStyledTextCtrl_GetModEventMask(шхобъ); } 
        public проц ModEventMask(цел значение) { wxStyledTextCtrl_SetModEventMask(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел EdgeColumn() { return wxStyledTextCtrl_GetEdgeColumn(шхобъ); }
        public проц EdgeColumn(цел значение) { wxStyledTextCtrl_SetEdgeColumn(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел EdgeMode() { return wxStyledTextCtrl_GetEdgeMode(шхобъ); } 
        public проц EdgeMode(цел значение) { wxStyledTextCtrl_SetEdgeMode(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public Цвет EdgeColour() { return new Цвет(wxStyledTextCtrl_GetEdgeColour(шхобъ), да); } 
        public проц EdgeColour(Цвет значение) { wxStyledTextCtrl_SetEdgeColour(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц SearchAnchor()
        {
            wxStyledTextCtrl_SearchAnchor(шхобъ);
        }

        public цел SearchNext(цел флаги, ткст текст)
        {
            return wxStyledTextCtrl_SearchNext(шхобъ, флаги, текст);
        }

        public цел SearchPrev(цел флаги, ткст текст)
        {
            return wxStyledTextCtrl_SearchPrev(шхобъ, флаги, текст);
        }

        //-----------------------------------------------------------------------------

        public цел LinesOnScreen() { return wxStyledTextCtrl_LinesOnScreen(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц UsePopUp(бул значение) { wxStyledTextCtrl_UsePopUp(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул SelectionIsRectangle() { return wxStyledTextCtrl_SelectionIsRectangle(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел Zoom() { return wxStyledTextCtrl_GetZoom(шхобъ); }
        public проц Zoom(цел значение) { wxStyledTextCtrl_SetZoom(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц CreateDocument()
        {
            wxStyledTextCtrl_CreateDocument(шхобъ);
        }

        public проц AddRefDocument(wxObject docPointer)
        {
            wxStyledTextCtrl_AddRefDocument(шхобъ, wxObject.SafePtr(docPointer));
        }

        public проц ReleaseDocument(wxObject docPointer)
        {
            wxStyledTextCtrl_ReleaseDocument(шхобъ, wxObject.SafePtr(docPointer));
        }

        //-----------------------------------------------------------------------------

        public бул STCFocus() { return wxStyledTextCtrl_GetSTCFocus(шхобъ); } 
        public проц STCFocus(бул значение) { wxStyledTextCtrl_SetSTCFocus(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Status() { return wxStyledTextCtrl_GetStatus(шхобъ); }
        public проц Status(цел значение) { wxStyledTextCtrl_SetStatus(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул MouseDownCaptures() { return wxStyledTextCtrl_GetMouseDownCaptures(шхобъ); }
        public проц MouseDownCaptures(бул значение) { wxStyledTextCtrl_SetMouseDownCaptures(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц STCCursor(цел значение) { wxStyledTextCtrl_SetSTCCursor(шхобъ, значение); }
        public цел STCCursor() { return wxStyledTextCtrl_GetSTCCursor(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц ControlCharSymbol(цел значение) { wxStyledTextCtrl_SetControlCharSymbol(шхобъ, значение); }
        public цел ControlCharSymbol() { return wxStyledTextCtrl_GetControlCharSymbol(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц WordPartLeft()
        {
            wxStyledTextCtrl_WordPartLeft(шхобъ);
        }

        public проц WordPartLeftExtend()
        {
            wxStyledTextCtrl_WordPartLeftExtend(шхобъ);
        }

        public проц WordPartRight()
        {
            wxStyledTextCtrl_WordPartRight(шхобъ);
        }

        public проц WordPartRightExtend()
        {
            wxStyledTextCtrl_WordPartRightExtend(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц SetVisiblePolicy(цел visiblePolicy, цел visibleSlop)
        {
            wxStyledTextCtrl_SetVisiblePolicy(шхобъ, visiblePolicy, visibleSlop);
        }

        //-----------------------------------------------------------------------------

        public проц DelLineLeft()
        {
            wxStyledTextCtrl_DelLineLeft(шхобъ);
        }

        public проц DelLineRight()
        {
            wxStyledTextCtrl_DelLineRight(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц XOffset(цел значение) { wxStyledTextCtrl_SetXOffset(шхобъ, значение); }
        public цел XOffset() { return wxStyledTextCtrl_GetXOffset(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц ChooseCaretX()
        {
            wxStyledTextCtrl_ChooseCaretX(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц SetXCaretPolicy(цел caretPolicy, цел caretSlop)
        {
            wxStyledTextCtrl_SetXCaretPolicy(шхобъ, caretPolicy, caretSlop);
        }

        public проц SetYCaretPolicy(цел caretPolicy, цел caretSlop)
        {
            wxStyledTextCtrl_SetYCaretPolicy(шхобъ, caretPolicy, caretSlop);
        }

        //-----------------------------------------------------------------------------

        public проц PrintWrapMode(цел значение) { wxStyledTextCtrl_SetPrintWrapMode(шхобъ, значение); }
        public цел PrintWrapMode() { return wxStyledTextCtrl_GetPrintWrapMode(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц SetHotspotActiveForeground(бул useSetting, Цвет fore)
        {
            wxStyledTextCtrl_SetHotspotActiveForeground(шхобъ, useSetting, wxObject.SafePtr(fore));
        }

        public проц SetHotspotActiveBackground(бул useSetting, Цвет back)
        {
            wxStyledTextCtrl_SetHotspotActiveBackground(шхобъ, useSetting, wxObject.SafePtr(back));
        }

        public проц SetHotspotActiveUnderline(бул underline)
        {
            wxStyledTextCtrl_SetHotspotActiveUnderline(шхобъ, underline);
        }

        //-----------------------------------------------------------------------------

        public проц StartRecord()
        {
            wxStyledTextCtrl_StartRecord(шхобъ);
        }

        public проц StopRecord()
        {
            wxStyledTextCtrl_StopRecord(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц Lexer(цел значение) { wxStyledTextCtrl_SetLexer(шхобъ, значение); }
        public цел Lexer() { return wxStyledTextCtrl_GetLexer(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Colourise(цел start, цел end)
        {
            wxStyledTextCtrl_Colourise(шхобъ, start, end);
        }

        //-----------------------------------------------------------------------------

        public проц SetProperty(ткст key, ткст значение)
        {
            wxStyledTextCtrl_SetProperty(шхобъ, key, значение);
        }

        //-----------------------------------------------------------------------------

        public проц SetKeyWords(цел keywordSet, ткст keyWords)
        {
            wxStyledTextCtrl_SetKeyWords(шхобъ, keywordSet, keyWords);
        }

        //-----------------------------------------------------------------------------

        public проц LexerLanguage(ткст значение) { wxStyledTextCtrl_SetLexerLanguage(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел CurrentLine() { return wxStyledTextCtrl_GetCurrentLine(шхобъ); } 

        //-----------------------------------------------------------------------------

        public проц StyleSetSpec(цел styleNum, ткст spec)
        {
            wxStyledTextCtrl_StyleSetSpec(шхобъ, styleNum, spec);
        }

        public проц StyleSetFont(цел styleNum, Шрифт шрифт)
        {
            wxStyledTextCtrl_StyleSetFont(шхобъ, styleNum, wxObject.SafePtr(шрифт));
        }

        public проц StyleSetFontAttr(цел styleNum, цел size, ткст faceName, бул bold, бул italic, бул underline)
        {
            wxStyledTextCtrl_StyleSetFontAttr(шхобъ, styleNum, size, faceName, bold, italic, underline);
        }

        //-----------------------------------------------------------------------------

        public проц CmdKeyExecute(цел команда)
        {
            wxStyledTextCtrl_CmdKeyExecute(шхобъ, команда);
        }

        //-----------------------------------------------------------------------------

        public проц SetMargins(цел left, цел right)
        {
            wxStyledTextCtrl_SetMargins(шхобъ, left, right);
        }

        //-----------------------------------------------------------------------------

        public проц GetSelection(out цел startPos, out цел endPos)
        {
            wxStyledTextCtrl_GetSelection(шхобъ, startPos, endPos);
        }

        //-----------------------------------------------------------------------------

        public Точка PointFromPosition(цел поз)
        {
            Точка pt;
            wxStyledTextCtrl_PointFromPosition(шхобъ, поз, pt);
            return pt;
        }

        //-----------------------------------------------------------------------------

        public проц ScrollToLine(цел line)
        {
            wxStyledTextCtrl_ScrollToLine(шхобъ, line);
        }

        //-----------------------------------------------------------------------------

        public проц ScrollToColumn(цел column)
        {
            wxStyledTextCtrl_ScrollToColumn(шхобъ, column);
        }

        //-----------------------------------------------------------------------------

        /*public цел SendMsg(цел msg, цел wp, цел lp)
        {
            return wxStyledTextCtrl_SendMsg(шхобъ, msg, wp, lp);
        }*/

        //-----------------------------------------------------------------------------

        /*public ScrollBar VScrollBar
        {
            set { wxStyledTextCtrl_SetVScrollBar(шхобъ, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        /*public ScrollBar SetHScrollBar
        {
            set { wxStyledTextCtrl_SetHScrollBar(шхобъ, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        public бул LastKeydownProcessed() { return wxStyledTextCtrl_GetLastKeydownProcessed(шхобъ); }
        public проц LastKeydownProcessed(бул значение) { wxStyledTextCtrl_SetLastKeydownProcessed(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул СохраниФайл(ткст фимя)
        {
            return wxStyledTextCtrl_SaveFile(шхобъ, фимя);
        }

        public бул ЗагрузиФайл(ткст фимя)
        {
            return wxStyledTextCtrl_LoadFile(шхобъ, фимя);
        }

        //-----------------------------------------------------------------------------

		public проц Change_Add(EventListener значение) { AddCommandListener(wxEVT_STC_CHANGE, ИД, значение, this); }
		public проц Change_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц StyleNeeded_Add(EventListener значение) { AddCommandListener(wxEVT_STC_STYLENEEDED, ИД, значение, this); }
		public проц StyleNeeded_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц CharAdded_Add(EventListener значение) { AddCommandListener(wxEVT_STC_CHARADDED, ИД, значение, this); }
		public проц CharAdded_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SavePointReached_Add(EventListener значение) { AddCommandListener(wxEVT_STC_SAVEPOINTREACHED, ИД, значение, this); }
		public проц SavePointReached_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SavePointLeft_Add(EventListener значение) { AddCommandListener(wxEVT_STC_SAVEPOINTLEFT, ИД, значение, this); }
		public проц SavePointLeft_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц ROModifyAttempt_Add(EventListener значение) { AddCommandListener(wxEVT_STC_ROMODIFYATTEMPT, ИД, значение, this); }
		public проц ROModifyAttempt_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Key_Add(EventListener значение) { AddCommandListener(wxEVT_STC_KEY, ИД, значение, this); }
		public проц Key_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DoubleClick_Add(EventListener значение) { AddCommandListener(wxEVT_STC_DOUBLECLICK, ИД, значение, this); }
		public проц DoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц UpdateUI_Add(EventListener значение) { AddCommandListener(wxEVT_STC_UPDATEUI, ИД, значение, this); }
		public проц UpdateUI_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Modified_Add(EventListener значение) { AddCommandListener(wxEVT_STC_MODIFIED, ИД, значение, this); }
		public проц Modified_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MacroRecord_Add(EventListener значение) { AddCommandListener(wxEVT_STC_MACRORECORD, ИД, значение, this); }
		public проц MacroRecord_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MarginClick_Add(EventListener значение) { AddCommandListener(wxEVT_STC_MARGINCLICK, ИД, значение, this); }
		public проц MarginClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц NeedShown_Add(EventListener значение) { AddCommandListener(wxEVT_STC_NEEDSHOWN, ИД, значение, this); }
		public проц NeedShown_Remove(EventListener значение) { RemoveHandler(значение, this); }

		/*public event EventListener PositionChanged
		{
			add { AddCommandListener(wxEVT_STC_POSCHANGED, ИД, значение, this); }
			remove { RemoveHandler(значение, this); }
		}*/

		public проц Paint_Add(EventListener значение) { AddCommandListener(wxEVT_STC_PAINTED, ИД, значение, this); }
		public проц Paint_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц UserListSelection_Add(EventListener значение) { AddCommandListener(wxEVT_STC_USERLISTSELECTION, ИД, значение, this); }
		public проц UserListSelection_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц URIDropped_Add(EventListener значение) { AddCommandListener(wxEVT_STC_URIDROPPED, ИД, значение, this); }
		public проц URIDropped_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DwellStart_Add(EventListener значение) { AddCommandListener(wxEVT_STC_DWELLSTART, ИД, значение, this); }
		public проц DwellStart_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DwellEnd_Add(EventListener значение) { AddCommandListener(wxEVT_STC_DWELLEND, ИД, значение, this); }
		public проц DwellEnd_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц StartDrag_Add(EventListener значение) { AddCommandListener(wxEVT_STC_START_DRAG, ИД, значение, this); }
		public проц StartDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DragOver_Add(EventListener значение) { AddCommandListener(wxEVT_STC_DRAG_OVER, ИД, значение, this); }
		public проц DragOver_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DoDrop_Add(EventListener значение) { AddCommandListener(wxEVT_STC_DO_DROP, ИД, значение, this); }
		public проц DoDrop_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц Zoomed_Add(EventListener значение) { AddCommandListener(wxEVT_STC_ZOOM, ИД, значение, this); }
		public проц Zoomed_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц HotspotClick_Add(EventListener значение) { AddCommandListener(wxEVT_STC_HOTSPOT_CLICK, ИД, значение, this); }
		public проц HotspotClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц HotspotDoubleClick_Add(EventListener значение) { AddCommandListener(wxEVT_STC_HOTSPOT_DCLICK, ИД, значение, this); }
		public проц HotspotDoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц CalltipClick_Add(EventListener значение) { AddCommandListener(wxEVT_STC_CALLTIP_CLICK, ИД, значение, this); }
		public проц CalltipClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
    }

        //! \cond EXTERN
        static extern (C) ЦУк wxStyledTextEvent_ctor(цел commandType, цел ид);
        static extern (C) проц   wxStyledTextEvent_SetPosition(ЦУк сам, цел поз);
        static extern (C) проц   wxStyledTextEvent_SetKey(ЦУк сам, цел k);
        static extern (C) проц   wxStyledTextEvent_SetModifiers(ЦУк сам, цел m);
        static extern (C) проц   wxStyledTextEvent_SetModificationType(ЦУк сам, цел t);
        static extern (C) проц   wxStyledTextEvent_SetText(ЦУк сам, ткст t);
        static extern (C) проц   wxStyledTextEvent_SetLength(ЦУк сам, цел len);
        static extern (C) проц   wxStyledTextEvent_SetLinesAdded(ЦУк сам, цел num);
        static extern (C) проц   wxStyledTextEvent_SetLine(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetFoldLevelNow(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetFoldLevelPrev(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetMargin(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetMessage(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetWParam(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetLParam(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetListType(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetX(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetY(ЦУк сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetDragText(ЦУк сам, ткст val);
        static extern (C) проц   wxStyledTextEvent_SetDragAllowMove(ЦУк сам, бул val);
        //static extern (C) проц   wxStyledTextEvent_SetDragResult(ЦУк сам, wxDragResult val);
        static extern (C) цел    wxStyledTextEvent_GetPosition(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetKey(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetModifiers(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetModificationType(ЦУк сам);
        static extern (C) ЦУк wxStyledTextEvent_GetText(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetLength(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetLinesAdded(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetLine(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetFoldLevelNow(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetFoldLevelPrev(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetMargin(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetMessage(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetWParam(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetLParam(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetListType(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetX(ЦУк сам);
        static extern (C) цел    wxStyledTextEvent_GetY(ЦУк сам);
        static extern (C) ЦУк wxStyledTextEvent_GetDragText(ЦУк сам);
        static extern (C) бул   wxStyledTextEvent_GetDragAllowMove(ЦУк сам);
        //static extern (C) ЦУк wxStyledTextEvent_GetDragResult(ЦУк сам);
        static extern (C) бул   wxStyledTextEvent_GetShift(ЦУк сам);
        static extern (C) бул   wxStyledTextEvent_GetControl(ЦУк сам);
        static extern (C) бул   wxStyledTextEvent_GetAlt(ЦУк сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias StyledTextEvent wxStyledTextEvent;
    public class StyledTextEvent : CommandEvent 
    {
		public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public  this(цел commandType, цел ид)
            { super(wxStyledTextEvent_ctor(commandType, ид)); }

        //-----------------------------------------------------------------------------

        public цел Положение() { return wxStyledTextEvent_GetPosition(шхобъ); }
        public проц Положение(цел значение) { wxStyledTextEvent_SetPosition(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Key() { return wxStyledTextEvent_GetKey(шхобъ); }
        public проц Key(цел значение) { wxStyledTextEvent_SetKey(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц Modifiers(цел значение) { wxStyledTextEvent_SetModifiers(шхобъ, значение); }
        public цел Modifiers() { return wxStyledTextEvent_GetModifiers(шхобъ); } 

        //-----------------------------------------------------------------------------

        public проц ModificationType(цел значение) { wxStyledTextEvent_SetModificationType(шхобъ, значение); }
        public цел ModificationType() { return wxStyledTextEvent_GetModificationType(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Текст(ткст значение) { wxStyledTextEvent_SetText(шхобъ, значение); } 
        public ткст Текст() { return cast(ткст) new wxString(wxStyledTextEvent_GetText(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц Length(цел значение) { wxStyledTextEvent_SetLength(шхобъ, значение); }
        public цел Length() { return wxStyledTextEvent_GetLength(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц LinesAdded(цел значение) { wxStyledTextEvent_SetLinesAdded(шхобъ, значение); } 
        public цел LinesAdded() { return wxStyledTextEvent_GetLinesAdded(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Line(цел значение) { wxStyledTextEvent_SetLine(шхобъ, значение); } 
        public цел Line() { return wxStyledTextEvent_GetLine(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц FoldLevelNow(цел значение) { wxStyledTextEvent_SetFoldLevelNow(шхобъ, значение); }
        public цел FoldLevelNow() { return wxStyledTextEvent_GetFoldLevelNow(шхобъ); }

        public проц FoldLevelPrev(цел значение) { wxStyledTextEvent_SetFoldLevelPrev(шхобъ, значение); }
        public цел FoldLevelPrev() { return wxStyledTextEvent_GetFoldLevelPrev(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Margin(цел значение) { wxStyledTextEvent_SetMargin(шхобъ, значение); }
        public цел Margin() { return wxStyledTextEvent_GetMargin(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Message(цел значение) { wxStyledTextEvent_SetMessage(шхобъ, значение); } 
        public цел Message() { return wxStyledTextEvent_GetMessage(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц WParam(цел значение) { wxStyledTextEvent_SetWParam(шхобъ, значение); }
        public цел WParam() { return wxStyledTextEvent_GetWParam(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц LParam(цел значение) { wxStyledTextEvent_SetLParam(шхобъ, значение); }
        public цел LParam() { return wxStyledTextEvent_GetLParam(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц ListType(цел значение) { wxStyledTextEvent_SetListType(шхобъ, значение); }
        public цел ListType() { return wxStyledTextEvent_GetListType(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц X(цел значение) { wxStyledTextEvent_SetX(шхобъ, значение); }
        public цел X() { return wxStyledTextEvent_GetX(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Y(цел значение) { wxStyledTextEvent_SetY(шхобъ, значение); }
        public цел Y() { return wxStyledTextEvent_GetY(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц DragText(ткст значение) { wxStyledTextEvent_SetDragText(шхобъ, значение); }
        public ткст DragText() { return cast(ткст) new wxString(wxStyledTextEvent_GetDragText(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц DragAllowMove(бул значение) { wxStyledTextEvent_SetDragAllowMove(шхобъ, значение); } 
        public бул DragAllowMove() { return wxStyledTextEvent_GetDragAllowMove(шхобъ); }

        //-----------------------------------------------------------------------------

        /*public DragResult DragResult
        {
            set { wxStyledTextEvent_SetDragResult(шхобъ, wxObject.SafePtr(значение)); }
            get { return wxStyledTextEvent_GetDragResult(шхобъ); }
        }*/

        //-----------------------------------------------------------------------------

        public бул Shift() { return wxStyledTextEvent_GetShift(шхобъ); }

        public бул Control() { return wxStyledTextEvent_GetControl(шхобъ); }

        public бул Alt() { return wxStyledTextEvent_GetAlt(шхобъ); }

        private static Событие Нов(ЦУк объ) { return new StyledTextEvent(объ); }
    }

//! \cond VERSION
} // version(WXD_STYLEDTEXTCTRL)
//! \endcond
