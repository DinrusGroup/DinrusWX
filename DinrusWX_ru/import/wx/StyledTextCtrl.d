module wx.StyledTextCtrl;
//version = WXD_STYLEDTEXTCTRL;


//! \cond VERSION
version(WXD_STYLEDTEXTCTRL){
//! \endcond

public import wx.common;
public import wx.Control;
public import wx.CommandEvent;

		//! \cond EXTERN
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_CHANGE();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_STYLENEEDED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_CHARADDED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_SAVEPOINTREACHED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_SAVEPOINTLEFT();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_ROMODIFYATTEMPT();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_KEY();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_DOUBLECLICK();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_UPDATEUI();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_MODIFIED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_MACRORECORD();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_MARGINCLICK();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_NEEDSHOWN();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_POSCHANGED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_PAINTED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_USERLISTSELECTION();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_URIDROPPED();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_DWELLSTART();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_DWELLEND();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_START_DRAG();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_DRAG_OVER();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_DO_DROP();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_ZOOM();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_HOTSPOT_CLICK();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_HOTSPOT_DCLICK();
        static extern (C) EventType wxStyledTextCtrl_EVT_STC_CALLTIP_CLICK();

        static extern (C) IntPtr wxStyledTextCtrl_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
        static extern (C) проц   wxStyledTextCtrl_AddText(IntPtr сам, ткст текст);
        //static extern (C) проц   wxStyledTextCtrl_AddStyledText(IntPtr сам, IntPtr data);
        static extern (C) проц   wxStyledTextCtrl_InsertText(IntPtr сам, цел поз, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_ClearAll(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_ClearDocumentStyle(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetLength(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetCharAt(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetCurrentPos(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetAnchor(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetStyleAt(IntPtr сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_Redo(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetUndoCollection(IntPtr сам, бул collectUndo);
        static extern (C) проц   wxStyledTextCtrl_SelectAll(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetSavePoint(IntPtr сам);
        //static extern (C) IntPtr wxStyledTextCtrl_GetStyledText(IntPtr сам, цел startPos, цел endPos);
        static extern (C) бул   wxStyledTextCtrl_CanRedo(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_MarkerLineFromHandle(IntPtr сам, цел handle);
        static extern (C) проц   wxStyledTextCtrl_MarkerDeleteHandle(IntPtr сам, цел handle);
        static extern (C) бул   wxStyledTextCtrl_GetUndoCollection(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetViewWhiteSpace(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetViewWhiteSpace(IntPtr сам, цел viewWS);
        static extern (C) цел    wxStyledTextCtrl_PositionFromPoint(IntPtr сам, inout Точка тчк);
        static extern (C) цел    wxStyledTextCtrl_PositionFromPointClose(IntPtr сам, цел x, цел y);
        static extern (C) проц   wxStyledTextCtrl_GotoLine(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_GotoPos(IntPtr сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_SetAnchor(IntPtr сам, цел posAnchor);
        static extern (C) IntPtr wxStyledTextCtrl_GetCurLine(IntPtr сам, inout цел linePos);
        static extern (C) цел    wxStyledTextCtrl_GetEndStyled(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_ConvertEOLs(IntPtr сам, цел eolMode);
        static extern (C) цел    wxStyledTextCtrl_GetEOLMode(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetEOLMode(IntPtr сам, цел eolMode);
        static extern (C) проц   wxStyledTextCtrl_StartStyling(IntPtr сам, цел поз, цел маска);
        static extern (C) проц   wxStyledTextCtrl_SetStyling(IntPtr сам, цел length, цел стиль);
        static extern (C) бул   wxStyledTextCtrl_GetBufferedDraw(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetBufferedDraw(IntPtr сам, бул buffered);
        static extern (C) проц   wxStyledTextCtrl_SetTabWidth(IntPtr сам, цел tabWidth);
        static extern (C) цел    wxStyledTextCtrl_GetTabWidth(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetCodePage(IntPtr сам, цел codePage);
        static extern (C) проц   wxStyledTextCtrl_MarkerDefine(IntPtr сам, цел markerNumber, цел markerSymbol, IntPtr foreground, IntPtr background);
        static extern (C) проц   wxStyledTextCtrl_MarkerУстForeground(IntPtr сам, цел markerNumber, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_MarkerУстBackground(IntPtr сам, цел markerNumber, IntPtr back);
        static extern (C) цел    wxStyledTextCtrl_MarkerAdd(IntPtr сам, цел line, цел markerNumber);
        static extern (C) проц   wxStyledTextCtrl_MarkerDelete(IntPtr сам, цел line, цел markerNumber);
        static extern (C) проц   wxStyledTextCtrl_MarkerDeleteAll(IntPtr сам, цел markerNumber);
        static extern (C) цел    wxStyledTextCtrl_MarkerGet(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_MarkerNext(IntPtr сам, цел lineStart, цел markerMask);
        static extern (C) цел    wxStyledTextCtrl_MarkerPrevious(IntPtr сам, цел lineStart, цел markerMask);
        static extern (C) проц   wxStyledTextCtrl_MarkerDefineBitmap(IntPtr сам, цел markerNumber, IntPtr bmp);
        static extern (C) проц   wxStyledTextCtrl_SetMarginType(IntPtr сам, цел margin, цел marginType);
        static extern (C) цел    wxStyledTextCtrl_GetMarginType(IntPtr сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_SetMarginWidth(IntPtr сам, цел margin, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetMarginWidth(IntPtr сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_SetMarginMask(IntPtr сам, цел margin, цел маска);
        static extern (C) цел    wxStyledTextCtrl_GetMarginMask(IntPtr сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_SetMarginSensitive(IntPtr сам, цел margin, бул sensitive);
        static extern (C) бул   wxStyledTextCtrl_GetMarginSensitive(IntPtr сам, цел margin);
        static extern (C) проц   wxStyledTextCtrl_StyleClearAll(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_StyleУстForeground(IntPtr сам, цел стиль, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_StyleУстBackground(IntPtr сам, цел стиль, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_StyleУстBold(IntPtr сам, цел стиль, бул bold);
        static extern (C) проц   wxStyledTextCtrl_StyleУстItalic(IntPtr сам, цел стиль, бул italic);
        static extern (C) проц   wxStyledTextCtrl_StyleУстSize(IntPtr сам, цел стиль, цел sizePoints);
        static extern (C) проц   wxStyledTextCtrl_StyleУстFaceName(IntPtr сам, цел стиль, ткст fontName);
        static extern (C) проц   wxStyledTextCtrl_StyleУстEOLFilled(IntPtr сам, цел стиль, бул filled);
        static extern (C) проц   wxStyledTextCtrl_StyleResetDefault(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_StyleУстUnderline(IntPtr сам, цел стиль, бул underline);
        static extern (C) проц   wxStyledTextCtrl_StyleУстCase(IntPtr сам, цел стиль, цел caseForce);
        static extern (C) проц   wxStyledTextCtrl_StyleУстCharacterУст(IntPtr сам, цел стиль, цел characterУст);
        static extern (C) проц   wxStyledTextCtrl_StyleУстHotSpot(IntPtr сам, цел стиль, бул hotspot);
        static extern (C) проц   wxStyledTextCtrl_SetSelForeground(IntPtr сам, бул useУстting, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_SetSelBackground(IntPtr сам, бул useУстting, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_SetCaretForeground(IntPtr сам, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyAssign(IntPtr сам, цел key, цел modifiers, цел кмд);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyClear(IntPtr сам, цел key, цел modifiers);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyClearAll(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetStyleBytes(IntPtr сам, цел length, ubyte* styleBytes);
        static extern (C) проц   wxStyledTextCtrl_StyleУстVisible(IntPtr сам, цел стиль, бул visible);
        static extern (C) цел    wxStyledTextCtrl_GetCaretPeriod(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretPeriod(IntPtr сам, цел periodMilliseconds);
        static extern (C) проц   wxStyledTextCtrl_SetWordChars(IntPtr сам, ткст characters);
        static extern (C) проц   wxStyledTextCtrl_BeginUndoAction(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_EndUndoAction(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_IndicatorУстStyle(IntPtr сам, цел indic, цел стиль);
        static extern (C) цел    wxStyledTextCtrl_IndicatorGetStyle(IntPtr сам, цел indic);
        static extern (C) проц   wxStyledTextCtrl_IndicatorУстForeground(IntPtr сам, цел indic, IntPtr fore);
        static extern (C) IntPtr wxStyledTextCtrl_IndicatorGetForeground(IntPtr сам, цел indic);
        static extern (C) проц   wxStyledTextCtrl_SetWhitespaceForeground(IntPtr сам, бул useУстting, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_SetWhitespaceBackground(IntPtr сам, бул useУстting, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_SetStyleBits(IntPtr сам, цел bits);
        static extern (C) цел    wxStyledTextCtrl_GetStyleBits(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetLineState(IntPtr сам, цел line, цел state);
        static extern (C) цел    wxStyledTextCtrl_GetLineState(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetMaxLineState(IntPtr сам);
        static extern (C) бул   wxStyledTextCtrl_GetCaretLineVisible(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretLineVisible(IntPtr сам, бул покажи);
        static extern (C) IntPtr wxStyledTextCtrl_GetCaretLineBack(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretLineBack(IntPtr сам, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_StyleУстChangeable(IntPtr сам, цел стиль, бул changeable);
        static extern (C) проц   wxStyledTextCtrl_AutoCompShow(IntPtr сам, цел lenEntered, ткст элтList);
        static extern (C) проц   wxStyledTextCtrl_AutoCompCancel(IntPtr сам);
        static extern (C) бул   wxStyledTextCtrl_AutoCompActive(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_AutoCompPosStart(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompComplete(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompStops(IntPtr сам, ткст characterУст);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстSeparator(IntPtr сам, цел separatorCharacter);
        static extern (C) цел    wxStyledTextCtrl_AutoCompGetSeparator(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompSelect(IntPtr сам, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстCancelAtStart(IntPtr сам, бул cancel);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetCancelAtStart(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстFillUps(IntPtr сам, ткст characterУст);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстChooseSingle(IntPtr сам, бул chooseSingle);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetChooseSingle(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстIgnoreCase(IntPtr сам, бул ignoreCase);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetIgnoreCase(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_UserListShow(IntPtr сам, цел listType, ткст элтList);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстAutoHide(IntPtr сам, бул autoHide);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetAutoHide(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстDropRestOfWord(IntPtr сам, бул dropRestOfWord);
        static extern (C) бул   wxStyledTextCtrl_AutoCompGetDropRestOfWord(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_RegisterImage(IntPtr сам, цел тип, IntPtr bmp);
        static extern (C) проц   wxStyledTextCtrl_ClearRegisteredImages(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_AutoCompGetTypeSeparator(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AutoCompУстTypeSeparator(IntPtr сам, цел separatorCharacter);
        static extern (C) проц   wxStyledTextCtrl_SetIndent(IntPtr сам, цел indentSize);
        static extern (C) цел    wxStyledTextCtrl_GetIndent(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetUseTabs(IntPtr сам, бул useTabs);
        static extern (C) бул   wxStyledTextCtrl_GetUseTabs(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetLineIndentation(IntPtr сам, цел line, цел indentSize);
        static extern (C) цел    wxStyledTextCtrl_GetLineIndentation(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetLineIndentPosition(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetColumn(IntPtr сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_SetUseHorizontalScrollBar(IntPtr сам, бул покажи);
        static extern (C) бул   wxStyledTextCtrl_GetUseHorizontalScrollBar(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetIndentationGuides(IntPtr сам, бул покажи);
        static extern (C) бул   wxStyledTextCtrl_GetIndentationGuides(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetHighlightGuide(IntPtr сам, цел column);
        static extern (C) цел    wxStyledTextCtrl_GetHighlightGuide(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetLineEndPosition(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetCodePage(IntPtr сам);
        static extern (C) IntPtr wxStyledTextCtrl_GetCaretForeground(IntPtr сам);
        static extern (C) бул   wxStyledTextCtrl_GetReadOnly(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetCurrentPos(IntPtr сам, цел поз);
        static extern (C) проц   wxStyledTextCtrl_SetSelectionStart(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetSelectionStart(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetSelectionEnd(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetSelectionEnd(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetPrintMagnification(IntPtr сам, цел magnification);
        static extern (C) цел    wxStyledTextCtrl_GetPrintMagnification(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetPrintColourMode(IntPtr сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetPrintColourMode(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_FindText(IntPtr сам, цел minPos, цел maxPos, ткст текст, цел флаги);
        static extern (C) цел    wxStyledTextCtrl_FormatRange(IntPtr сам, бул doDraw, цел startPos, цел endPos, IntPtr draw, IntPtr target, inout Прямоугольник renderRect, inout Прямоугольник pageRect);
        static extern (C) цел    wxStyledTextCtrl_GetFirstVisibleLine(IntPtr сам);
        static extern (C) IntPtr wxStyledTextCtrl_GetLine(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetLineCount(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetMarginLeft(IntPtr сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetMarginLeft(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetMarginRight(IntPtr сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetMarginRight(IntPtr сам);
        static extern (C) бул   wxStyledTextCtrl_GetModify(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetSelection(IntPtr сам, цел start, цел end);
        static extern (C) IntPtr wxStyledTextCtrl_GetSelectedText(IntPtr сам);
        static extern (C) IntPtr wxStyledTextCtrl_GetTextRange(IntPtr сам, цел startPos, цел endPos);
        static extern (C) проц   wxStyledTextCtrl_HideSelection(IntPtr сам, бул normal);
        static extern (C) цел    wxStyledTextCtrl_LineFromPosition(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_PositionFromLine(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_LineScroll(IntPtr сам, цел columns, цел строки);
        static extern (C) проц   wxStyledTextCtrl_EnsureCaretVisible(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_ReplaceSelection(IntPtr сам, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_SetReadOnly(IntPtr сам, бул readOnly);
        static extern (C) бул   wxStyledTextCtrl_CanPaste(IntPtr сам);
        static extern (C) бул   wxStyledTextCtrl_CanUndo(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_EmptyUndoBuffer(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_Undo(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_Cut(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_Copy(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_Paste(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_Clear(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetText(IntPtr сам, ткст текст);
        static extern (C) IntPtr wxStyledTextCtrl_GetText(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_GetTextLength(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetOvertype(IntPtr сам, бул overtype);
        static extern (C) бул   wxStyledTextCtrl_GetOvertype(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetCaretWidth(IntPtr сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetCaretWidth(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetTargetStart(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetTargetStart(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetTargetEnd(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_GetTargetEnd(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_ReplaceTarget(IntPtr сам, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_ReplaceTargetRE(IntPtr сам, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_SearchInTarget(IntPtr сам, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_SetSearchФлаги(IntPtr сам, цел флаги);
        static extern (C) цел    wxStyledTextCtrl_GetSearchФлаги(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_CallTipShow(IntPtr сам, цел поз, ткст definition);
        static extern (C) проц   wxStyledTextCtrl_CallTipCancel(IntPtr сам);
        static extern (C) бул   wxStyledTextCtrl_CallTipActive(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_CallTipPosAtStart(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_CallTipУстHighlight(IntPtr сам, цел start, цел end);
        static extern (C) проц   wxStyledTextCtrl_CallTipУстBackground(IntPtr сам, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_CallTipУстForeground(IntPtr сам, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_CallTipУстForegroundHighlight(IntPtr сам, IntPtr fore);
        static extern (C) цел    wxStyledTextCtrl_VisibleFromDocLine(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_DocLineFromVisible(IntPtr сам, цел lineDisplay);
        static extern (C) проц   wxStyledTextCtrl_SetFoldLevel(IntPtr сам, цел line, цел level);
        static extern (C) цел    wxStyledTextCtrl_GetFoldLevel(IntPtr сам, цел line);
        static extern (C) цел    wxStyledTextCtrl_GetLastChild(IntPtr сам, цел line, цел level);
        static extern (C) цел    wxStyledTextCtrl_GetFoldParent(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_ShowLines(IntPtr сам, цел lineStart, цел lineEnd);
        static extern (C) проц   wxStyledTextCtrl_HideLines(IntPtr сам, цел lineStart, цел lineEnd);
        static extern (C) бул   wxStyledTextCtrl_GetLineVisible(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetFoldExpanded(IntPtr сам, цел line, бул expanded);
        static extern (C) бул   wxStyledTextCtrl_GetFoldExpanded(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_ToggleFold(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_EnsureVisible(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetFoldФлаги(IntPtr сам, цел флаги);
        static extern (C) проц   wxStyledTextCtrl_EnsureVisibleEnforcePolicy(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetTabIndents(IntPtr сам, бул tabIndents);
        static extern (C) бул   wxStyledTextCtrl_GetTabIndents(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetBackSpaceUnIndents(IntPtr сам, бул bsUnIndents);
        static extern (C) бул   wxStyledTextCtrl_GetBackSpaceUnIndents(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetMouseDwellTime(IntPtr сам, цел periodMilliseconds);
        static extern (C) цел    wxStyledTextCtrl_GetMouseDwellTime(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_WordStartPosition(IntPtr сам, цел поз, бул onlyWordCharacters);
        static extern (C) цел    wxStyledTextCtrl_WordEndPosition(IntPtr сам, цел поз, бул onlyWordCharacters);
        static extern (C) проц   wxStyledTextCtrl_SetWrapMode(IntPtr сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetWrapMode(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetLayoutCache(IntPtr сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetLayoutCache(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetScrollWidth(IntPtr сам, цел pixelWidth);
        static extern (C) цел    wxStyledTextCtrl_GetScrollWidth(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_TextWidth(IntPtr сам, цел стиль, ткст текст);
        static extern (C) проц   wxStyledTextCtrl_SetEndAtLastLine(IntPtr сам, бул endAtLastLine);
        static extern (C) бул   wxStyledTextCtrl_GetEndAtLastLine(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_TextHeight(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_SetUseVerticalScrollBar(IntPtr сам, бул покажи);
        static extern (C) бул   wxStyledTextCtrl_GetUseVerticalScrollBar(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AppendText(IntPtr сам, цел length, ткст текст);
        static extern (C) бул   wxStyledTextCtrl_GetTwoPhaseDraw(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetTwoPhaseDraw(IntPtr сам, бул twoPhase);
        static extern (C) проц   wxStyledTextCtrl_TargetFromSelection(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_LinesJoin(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_LinesSplit(IntPtr сам, цел pixelWidth);
        static extern (C) проц   wxStyledTextCtrl_SetFoldMarginColour(IntPtr сам, бул useУстting, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_SetFoldMarginHiColour(IntPtr сам, бул useУстting, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_LineDuplicate(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_HomeDisplay(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_HomeDisplayExtend(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_LineEndDisplay(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_LineEndDisplayExtend(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_MoveCaretInsideView(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_LineLength(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_BraceHighlight(IntPtr сам, цел pos1, цел pos2);
        static extern (C) проц   wxStyledTextCtrl_BraceBadLight(IntPtr сам, цел поз);
        static extern (C) цел    wxStyledTextCtrl_BraceMatch(IntPtr сам, цел поз);
        static extern (C) бул   wxStyledTextCtrl_GetViewEOL(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetViewEOL(IntPtr сам, бул visible);
        static extern (C) IntPtr wxStyledTextCtrl_GetDocPointer(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetDocPointer(IntPtr сам, IntPtr docPointer);
        static extern (C) проц   wxStyledTextCtrl_SetModEventMask(IntPtr сам, цел маска);
        static extern (C) цел    wxStyledTextCtrl_GetEdgeColumn(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetEdgeColumn(IntPtr сам, цел column);
        static extern (C) цел    wxStyledTextCtrl_GetEdgeMode(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetEdgeMode(IntPtr сам, цел mode);
        static extern (C) IntPtr wxStyledTextCtrl_GetEdgeColour(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetEdgeColour(IntPtr сам, IntPtr edgeColour);
        static extern (C) проц   wxStyledTextCtrl_SearchAnchor(IntPtr сам);
        static extern (C) цел    wxStyledTextCtrl_SearchNext(IntPtr сам, цел флаги, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_SearchPrev(IntPtr сам, цел флаги, ткст текст);
        static extern (C) цел    wxStyledTextCtrl_LinesOnScreen(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_UsePopUp(IntPtr сам, бул allowPopUp);
        static extern (C) бул   wxStyledTextCtrl_SelectionIsRectangle(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetZoom(IntPtr сам, цел zoom);
        static extern (C) цел    wxStyledTextCtrl_GetZoom(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_CreateDocument(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_AddRefDocument(IntPtr сам, IntPtr docPointer);
        static extern (C) проц   wxStyledTextCtrl_ReleaseDocument(IntPtr сам, IntPtr docPointer);
        static extern (C) цел    wxStyledTextCtrl_GetModEventMask(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetSTCFocus(IntPtr сам, бул focus);
        static extern (C) бул   wxStyledTextCtrl_GetSTCFocus(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetStatus(IntPtr сам, цел statusCode);
        static extern (C) цел    wxStyledTextCtrl_GetStatus(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetMouseDownCaptures(IntPtr сам, бул captures);
        static extern (C) бул   wxStyledTextCtrl_GetMouseDownCaptures(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetSTCCursor(IntPtr сам, цел cursorType);
        static extern (C) цел    wxStyledTextCtrl_GetSTCCursor(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetControlCharSymbol(IntPtr сам, цел symbol);
        static extern (C) цел    wxStyledTextCtrl_GetControlCharSymbol(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartLeft(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartLeftExtend(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartRight(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_WordPartRightExtend(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetVisiblePolicy(IntPtr сам, цел visiblePolicy, цел visibleSlop);
        static extern (C) проц   wxStyledTextCtrl_DelLineLeft(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_DelLineRight(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetXOffset(IntPtr сам, цел newOffset);
        static extern (C) цел    wxStyledTextCtrl_GetXOffset(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_ChooseCaretX(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetXCaretPolicy(IntPtr сам, цел caretPolicy, цел caretSlop);
        static extern (C) проц   wxStyledTextCtrl_SetYCaretPolicy(IntPtr сам, цел caretPolicy, цел caretSlop);
        static extern (C) проц   wxStyledTextCtrl_SetPrintWrapMode(IntPtr сам, цел mode);
        static extern (C) цел    wxStyledTextCtrl_GetPrintWrapMode(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetHotspotActiveForeground(IntPtr сам, бул useУстting, IntPtr fore);
        static extern (C) проц   wxStyledTextCtrl_SetHotspotActiveBackground(IntPtr сам, бул useУстting, IntPtr back);
        static extern (C) проц   wxStyledTextCtrl_SetHotspotActiveUnderline(IntPtr сам, бул underline);
        static extern (C) проц   wxStyledTextCtrl_StartRecord(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_StopRecord(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetLexer(IntPtr сам, цел lexer);
        static extern (C) цел    wxStyledTextCtrl_GetLexer(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_Colourise(IntPtr сам, цел start, цел end);
        static extern (C) проц   wxStyledTextCtrl_SetProperty(IntPtr сам, ткст key, ткст значение);
        static extern (C) проц   wxStyledTextCtrl_SetKeyWords(IntPtr сам, цел keywordУст, ткст keyWords);
        static extern (C) проц   wxStyledTextCtrl_SetLexerLanguage(IntPtr сам, ткст language);
        static extern (C) цел    wxStyledTextCtrl_GetCurrentLine(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_StyleУстSpec(IntPtr сам, цел styleNum, ткст spec);
        static extern (C) проц   wxStyledTextCtrl_StyleУстFont(IntPtr сам, цел styleNum, IntPtr шрифт);
        static extern (C) проц   wxStyledTextCtrl_StyleУстFontAttr(IntPtr сам, цел styleNum, цел разм, ткст faceName, бул bold, бул italic, бул underline);
        static extern (C) проц   wxStyledTextCtrl_CmdKeyExecute(IntPtr сам, цел кмд);
        static extern (C) проц   wxStyledTextCtrl_SetMargins(IntPtr сам, цел left, цел right);
        static extern (C) проц   wxStyledTextCtrl_GetSelection(IntPtr сам, inout цел startPos, inout цел endPos);
        static extern (C) проц   wxStyledTextCtrl_PointFromPosition(IntPtr сам, цел поз, inout Точка тчк);
        static extern (C) проц   wxStyledTextCtrl_ScrollToLine(IntPtr сам, цел line);
        static extern (C) проц   wxStyledTextCtrl_ScrollToColumn(IntPtr сам, цел column);
        static extern (C) цел    wxStyledTextCtrl_SendMsg(IntPtr сам, цел msg, цел wp, цел lp);
        //static extern (C) проц   wxStyledTextCtrl_SetVScrollBar(IntPtr сам, IntPtr bar);
        //static extern (C) проц   wxStyledTextCtrl_SetHScrollBar(IntPtr сам, IntPtr bar);
        static extern (C) бул   wxStyledTextCtrl_GetLastKeydownProcessed(IntPtr сам);
        static extern (C) проц   wxStyledTextCtrl_SetLastKeydownProcessed(IntPtr сам, бул val);
        static extern (C) бул   wxStyledTextCtrl_SaveFile(IntPtr сам, ткст filename);
        static extern (C) бул   wxStyledTextCtrl_LoadFile(IntPtr сам, ткст filename);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias StyledTextCtrl wxStyledTextCtrl;
    public class StyledTextCtrl : Control
    {
        //-----------------------------------------------------------------------------

        // StyledTextCtrl Events

        public static /*readonly*/ EventType wxEVT_STC_CHANGE;
        public static /*readonly*/ EventType wxEVT_STC_STYLENEEDED;
        public static /*readonly*/ EventType wxEVT_STC_CHARADDED;
        public static /*readonly*/ EventType wxEVT_STC_SAVEPOINTREACHED;
        public static /*readonly*/ EventType wxEVT_STC_SAVEPOINTLEFT;
        public static /*readonly*/ EventType wxEVT_STC_ROMODIFYATTEMPT;
        public static /*readonly*/ EventType wxEVT_STC_KEY;
        public static /*readonly*/ EventType wxEVT_STC_DOUBLECLICK;
        public static /*readonly*/ EventType wxEVT_STC_UPDATEUI;
        public static /*readonly*/ EventType wxEVT_STC_MODIFIED;
        public static /*readonly*/ EventType wxEVT_STC_MACRORECORD;
        public static /*readonly*/ EventType wxEVT_STC_MARGINCLICK;
        public static /*readonly*/ EventType wxEVT_STC_NEEDSHOWN;
        //public static /*readonly*/ EventType wxEVT_STC_POSCHANGED;
        public static /*readonly*/ EventType wxEVT_STC_PAINTED;
        public static /*readonly*/ EventType wxEVT_STC_USERLISTSELECTION;
        public static /*readonly*/ EventType wxEVT_STC_URIDROPPED;
        public static /*readonly*/ EventType wxEVT_STC_DWELLSTART;
        public static /*readonly*/ EventType wxEVT_STC_DWELLEND;
        public static /*readonly*/ EventType wxEVT_STC_START_DRAG;
        public static /*readonly*/ EventType wxEVT_STC_DRAG_OVER;
        public static /*readonly*/ EventType wxEVT_STC_DO_DROP;
        public static /*readonly*/ EventType wxEVT_STC_ZOOM;
        public static /*readonly*/ EventType wxEVT_STC_HOTSPOT_CLICK;
        public static /*readonly*/ EventType wxEVT_STC_HOTSPOT_DCLICK;
        public static /*readonly*/ EventType wxEVT_STC_CALLTIP_CLICK;

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

        // Styles in диапазон 32..37 are predefined for parts of the UI and are not used as normal styles.
        // Styles 38 and 39 are for future use.
        public const цел wxSTC_STYLE_DEFAULT = 32;
        public const цел wxSTC_STYLE_LINENUMBER = 33;
        public const цел wxSTC_STYLE_BRACELIGHT = 34;
        public const цел wxSTC_STYLE_BRACEBAD = 35;
        public const цел wxSTC_STYLE_CONTROLCHAR = 36;
        public const цел wxSTC_STYLE_INDENTGUIDE = 37;
        public const цел wxSTC_STYLE_LASTPREDEFINED = 39;
        public const цел wxSTC_STYLE_MAX = 127;

        // Character set identifiers are used in StyleУстCharacterУст.
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

        // PrintColourMode - сила black текст on white background for printing.
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

        // Constants for use with УстVisiblePolicy, similar to УстCaretPolicy.
        public const цел wxSTC_VISIBLE_SLOP = 0x01;
        public const цел wxSTC_VISIBLE_STRICT = 0x04;

        // Каретка policy, used by УстXCaretPolicy and УстYCaretPolicy.
        // If CARET_SLOP is set, we can define a slop значение: caretSlop.
        // This значение defines an unwanted zone (UZ) where the каретка is... unwanted.
        // This zone is defined as a number of pixels near the vertical margins,
        // and as a number of строки near the horizontal margins.
        // By keeping the каретка away from the edges, it is seen within its context,
        // so it is likely that the identifier that the каретка is on can be completely seen,
        // and that the current line is seen with some of the строки following it which are
        // often dependent on that line.
        public const цел wxSTC_CARET_SLOP = 0x01;

        // If CARET_STRICT is set, the policy is enforced... strictly.
        // The каретка is centred on the display if slop is not set,
        // and cannot go in the UZ if slop is set.
        public const цел wxSTC_CARET_STRICT = 0x04;

        // If CARET_JUMPS is set, the display is moved more energetically
        // so the каретка can move in the same направление longer before the policy is applied again.
        public const цел wxSTC_CARET_JUMPS = 0x10;

        // If CARET_EVEN is not set, instead of having symmetrical UZs,
        // the left and bottom UZs are extended up to right and top UZs respectively.
        // This way, we favour the displaying of useful information: the begining of строки,
        // where most code reside, and the строки after the каретка, eg. the body of a function.
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
        // Командаs that can be bound to keystrokes

        // Redoes the next action on the undo history.
        public const цел wxSTC_CMD_REDO = 2011;

        // Select all the текст in the document.
        public const цел wxSTC_CMD_SELECTALL = 2013;

        // Undo one action in the undo history.
        public const цел wxSTC_CMD_UNDO = 2176;

        // Cut the selection to the clipboard.
        public const цел wxSTC_CMD_CUT = 2177;

        // Copy the selection to the clipboard.
        public const цел wxSTC_CMD_COPY = 2178;

        // Paste the contents of the clipboard into the document replacing the selection.
        public const цел wxSTC_CMD_PASTE = 2179;

        // Clear the selection.
        public const цел wxSTC_CMD_CLEAR = 2180;

        // Сдвинь каретка down one line.
        public const цел wxSTC_CMD_LINEDOWN = 2300;

        // Сдвинь каретка down one line extending selection to new каретка position.
        public const цел wxSTC_CMD_LINEDOWNEXTEND = 2301;

        // Сдвинь каретка up one line.
        public const цел wxSTC_CMD_LINEUP = 2302;

        // Сдвинь каретка up one line extending selection to new каретка position.
        public const цел wxSTC_CMD_LINEUPEXTEND = 2303;

        // Сдвинь каретка left one character.
        public const цел wxSTC_CMD_CHARLEFT = 2304;

        // Сдвинь каретка left one character extending selection to new каретка position.
        public const цел wxSTC_CMD_CHARLEFTEXTEND = 2305;

        // Сдвинь каретка right one character.
        public const цел wxSTC_CMD_CHARRIGHT = 2306;

        // Сдвинь каретка right one character extending selection to new каретка position.
        public const цел wxSTC_CMD_CHARRIGHTEXTEND = 2307;

        // Сдвинь каретка left one word.
        public const цел wxSTC_CMD_WORDLEFT = 2308;

        // Сдвинь каретка left one word extending selection to new каретка position.
        public const цел wxSTC_CMD_WORDLEFTEXTEND = 2309;

        // Сдвинь каретка right one word.
        public const цел wxSTC_CMD_WORDRIGHT = 2310;

        // Сдвинь каретка right one word extending selection to new каретка position.
        public const цел wxSTC_CMD_WORDRIGHTEXTEND = 2311;

        // Сдвинь каретка to first position on line.
        public const цел wxSTC_CMD_HOME = 2312;

        // Сдвинь каретка to first position on line extending selection to new каретка position.
        public const цел wxSTC_CMD_HOMEEXTEND = 2313;

        // Сдвинь каретка to last position on line.
        public const цел wxSTC_CMD_LINEEND = 2314;

        // Сдвинь каретка to last position on line extending selection to new каретка position.
        public const цел wxSTC_CMD_LINEENDEXTEND = 2315;

        // Сдвинь каретка to first position in document.
        public const цел wxSTC_CMD_DOCUMENTSTART = 2316;

        // Сдвинь каретка to first position in document extending selection to new каретка position.
        public const цел wxSTC_CMD_DOCUMENTSTARTEXTEND = 2317;

        // Сдвинь каретка to last position in document.
        public const цел wxSTC_CMD_DOCUMENTEND = 2318;

        // Сдвинь каретка to last position in document extending selection to new каретка position.
        public const цел wxSTC_CMD_DOCUMENTENDEXTEND = 2319;

        // Сдвинь каретка one page up.
        public const цел wxSTC_CMD_PAGEUP = 2320;

        // Сдвинь каретка one page up extending selection to new каретка position.
        public const цел wxSTC_CMD_PAGEUPEXTEND = 2321;

        // Сдвинь каретка one page down.
        public const цел wxSTC_CMD_PAGEDOWN = 2322;

        // Сдвинь каретка one page down extending selection to new каретка position.
        public const цел wxSTC_CMD_PAGEDOWNEXTEND = 2323;

        // Switch from insert to overtype mode or the reverse.
        public const цел wxSTC_CMD_EDITTOGGLEOVERTYPE = 2324;

        // Cancel any modes such as call tip or auto-completion list display.
        public const цел wxSTC_CMD_CANCEL = 2325;

        // Delete the selection or if no selection, the character before the каретка.
        public const цел wxSTC_CMD_DELETEBACK = 2326;

        // If selection is empty or all on one line replace the selection with a tab character.
        // If more than one line selected, indent the строки.
        public const цел wxSTC_CMD_TAB = 2327;

        // Dedent the selected строки.
        public const цел wxSTC_CMD_BACKTAB = 2328;

        // Insert a new line, may use a CRLF, CR or LF depending on EOL mode.
        public const цел wxSTC_CMD_NEWLINE = 2329;

        // Insert a Form Feed character.
        public const цел wxSTC_CMD_FORMFEED = 2330;

        // Сдвинь каретка to before first visible character on line.
        // If already there move to first character on line.
        public const цел wxSTC_CMD_VCHOME = 2331;

        // Like VCHome but extending selection to new каретка position.
        public const цел wxSTC_CMD_VCHOMEEXTEND = 2332;

        // Magnify the displayed текст by increasing the sizes by 1 Точка.
        public const цел wxSTC_CMD_ZOOMIN = 2333;

        // Make the displayed текст smaller by decreasing the sizes by 1 Точка.
        public const цел wxSTC_CMD_ZOOMOUT = 2334;

        // Delete the word to the left of the каретка.
        public const цел wxSTC_CMD_DELWORDLEFT = 2335;

        // Delete the word to the right of the каретка.
        public const цел wxSTC_CMD_DELWORDRIGHT = 2336;

        // Cut the line containing the каретка.
        public const цел wxSTC_CMD_LINECUT = 2337;

        // Delete the line containing the каретка.
        public const цел wxSTC_CMD_LINEDELETE = 2338;

        // Switch the current line with the previous.
        public const цел wxSTC_CMD_LINETRANSPOSE = 2339;

        // Duplicate the current line.
        public const цел wxSTC_CMD_LINEDUPLICATE = 2404;

        // Transform the selection to lower case.
        public const цел wxSTC_CMD_LOWERCASE = 2340;

        // Transform the selection to upper case.
        public const цел wxSTC_CMD_UPPERCASE = 2341;

        // Scroll the document down, keeping the каретка visible.
        public const цел wxSTC_CMD_LINESCROLLDOWN = 2342;

        // Scroll the document up, keeping the каретка visible.
        public const цел wxSTC_CMD_LINESCROLLUP = 2343;

        // Delete the selection or if no selection, the character before the каретка.
        // Will not delete the character before at the start of a line.
        public const цел wxSTC_CMD_DELETEBACKNOTLINE = 2344;

        // Сдвинь каретка to first position on display line.
        public const цел wxSTC_CMD_HOMEDISPLAY = 2345;

        // Сдвинь каретка to first position on display line extending selection to
        // new каретка position.
        public const цел wxSTC_CMD_HOMEDISPLAYEXTEND = 2346;

        // Сдвинь каретка to last position on display line.
        public const цел wxSTC_CMD_LINEENDDISPLAY = 2347;

        // Сдвинь каретка to last position on display line extending selection to new
        // каретка position.
        public const цел wxSTC_CMD_LINEENDDISPLAYEXTEND = 2348;

        // These are like their namesakes Home(Extend)?, LineEnd(Extend)?, VCHome(Extend)?
        // except they behave differently when word-wrap is enabled:
        // They go first to the start / end of the display line, like (Home|LineEnd)Display
        // The difference is that, the курсор is already at the Точка, it goes on to the start
        // or end of the document line, as appropriate for (Home|LineEnd|VCHome)Extend.
        public const цел wxSTC_CMD_HOMEWRAP = 2349;
        public const цел wxSTC_CMD_HOMEWRAPEXTEND = 2450;
        public const цел wxSTC_CMD_LINEENDWRAP = 2451;
        public const цел wxSTC_CMD_LINEENDWRAPEXTEND = 2452;
        public const цел wxSTC_CMD_VCHOMEWRAP = 2453;
        public const цел wxSTC_CMD_VCHOMEWRAPEXTEND = 2454;

        // Сдвинь to the previous change in capitalisation.
        public const цел wxSTC_CMD_WORDPARTLEFT = 2390;

        // Сдвинь to the previous change in capitalisation extending selection
        // to new каретка position.
        public const цел wxSTC_CMD_WORDPARTLEFTEXTEND = 2391;

        // Сдвинь to the change next in capitalisation.
        public const цел wxSTC_CMD_WORDPARTRIGHT = 2392;

        // Сдвинь to the next change in capitalisation extending selection
        // to new каретка position.
        public const цел wxSTC_CMD_WORDPARTRIGHTEXTEND = 2393;

        // Delete back from the current position to the start of the line.
        public const цел wxSTC_CMD_DELLINELEFT = 2395;

        // Delete forwards from the current position to the end of the line.
        public const цел wxSTC_CMD_DELLINERIGHT = 2396;

        // Сдвинь каретка between paragraphs (delimited by empty строки)
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

        public this(IntPtr wxobj)
            { super (wxobj); }

        public  this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль =0, ткст имя = wxSTCNameStr)
            { this(wxStyledTextCtrl_ctor(wxObject.SafePtr(родитель), ид, поз, разм, cast(бцел)стиль, имя)); }

		public static wxObject Нов(IntPtr wxobj) { return new StyledTextCtrl(wxobj); }

	//---------------------------------------------------------------------
	// ctors with сам created ид

        public  this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль =0, ткст имя = wxSTCNameStr)
	    { this(родитель, Окно.УникИД, поз, разм, стиль, имя);}

        //-----------------------------------------------------------------------------

        public проц AddText(ткст текст)
        {
            wxStyledTextCtrl_AddText(wxobj, текст);
        }

        /*public проц AddStyledText(MemoryBuffer data)
        {
            wxStyledTextCtrl_AddStyledText(wxobj, wxObject.SafePtr(data));
        }*/

        public проц InsertText(цел поз, ткст текст)
        {
            wxStyledTextCtrl_InsertText(wxobj, поз, текст);
        }

        //-----------------------------------------------------------------------------

        public проц ClearAll()
        {
            wxStyledTextCtrl_ClearAll(wxobj);
        }

        public проц ClearDocumentStyle()
        {
            wxStyledTextCtrl_ClearDocumentStyle(wxobj);
        }

        //-----------------------------------------------------------------------------

        public цел Length() { return wxStyledTextCtrl_GetLength(wxobj); }

        //-----------------------------------------------------------------------------

        public цел GetCharAt(цел поз)
        {
            return wxStyledTextCtrl_GetCharAt(wxobj, поз);
        }

        //-----------------------------------------------------------------------------

        public цел CurrentPos() { return wxStyledTextCtrl_GetCurrentPos(wxobj); }
        public проц CurrentPos(цел значение) { wxStyledTextCtrl_SetCurrentPos(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел Anchor() { return wxStyledTextCtrl_GetAnchor(wxobj); }
        public проц Anchor(цел значение) { wxStyledTextCtrl_SetAnchor(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел GetStyleAt(цел поз)
        {
            return wxStyledTextCtrl_GetStyleAt(wxobj, поз);
        }

        //-----------------------------------------------------------------------------

        public проц Redo()
        {
            wxStyledTextCtrl_Redo(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул UndoCollection() { return wxStyledTextCtrl_GetUndoCollection(wxobj); }
        public проц UndoCollection(бул значение) { wxStyledTextCtrl_SetUndoCollection(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц SelectAll()
        {
            wxStyledTextCtrl_SelectAll(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц УстSavePoint()
        {
            wxStyledTextCtrl_SetSavePoint(wxobj);
        }

        //-----------------------------------------------------------------------------

        /*public MemoryBuffer GetStyledText(цел startPos, цел endPos)
        {
            return wxStyledTextCtrl_GetStyledText(wxobj, startPos, endPos);
        }*/

        //-----------------------------------------------------------------------------

        public бул CanRedo() { return wxStyledTextCtrl_CanRedo(wxobj); }

        //-----------------------------------------------------------------------------

        public цел MarkerLineFromHandle(цел handle)
        {
            return wxStyledTextCtrl_MarkerLineFromHandle(wxobj, handle);
        }

        public проц MarkerDeleteHandle(цел handle)
        {
            wxStyledTextCtrl_MarkerDeleteHandle(wxobj, handle);
        }

        //-----------------------------------------------------------------------------

        public цел ViewWhiteSpace() { return wxStyledTextCtrl_GetViewWhiteSpace(wxobj); }
        public проц ViewWhiteSpace(цел значение) { wxStyledTextCtrl_SetViewWhiteSpace(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел PositionFromPoint(Точка тчк)
        {
            return wxStyledTextCtrl_PositionFromPoint(wxobj, тчк);
        }

        public цел PositionFromPointClose(цел x, цел y)
        {
            return wxStyledTextCtrl_PositionFromPointClose(wxobj, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц GotoLine(цел line)
        {
            wxStyledTextCtrl_GotoLine(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц GotoPos(цел поз)
        {
            wxStyledTextCtrl_GotoPos(wxobj, поз);
        }

        //-----------------------------------------------------------------------------

        public ткст CurLine() {
                цел i;
                return GetCurLine(i);
            }

        public ткст GetCurLine(out цел linePos)
        {
            return cast(ткст) new wxString(wxStyledTextCtrl_GetCurLine(wxobj, linePos), да);
        }

        //-----------------------------------------------------------------------------

        public цел EndStyled() { return wxStyledTextCtrl_GetEndStyled(wxobj); }

        //-----------------------------------------------------------------------------

        public проц ConvertEOLs(цел eolMode)
        {
            wxStyledTextCtrl_ConvertEOLs(wxobj, eolMode);
        }

        //-----------------------------------------------------------------------------

        public цел EOLMode() { return wxStyledTextCtrl_GetEOLMode(wxobj); }
        public проц EOLMode(цел значение) { wxStyledTextCtrl_SetEOLMode(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц StartStyling(цел поз, цел маска)
        {
            wxStyledTextCtrl_StartStyling(wxobj, поз, маска);
        }

        //-----------------------------------------------------------------------------

        public проц УстStyling(цел length, цел стиль)
        {
            wxStyledTextCtrl_SetStyling(wxobj, length, стиль);
        }

        //-----------------------------------------------------------------------------

        public бул BufferedDraw() { return wxStyledTextCtrl_GetBufferedDraw(wxobj); }
        public проц BufferedDraw(бул значение) { wxStyledTextCtrl_SetBufferedDraw(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел TabWidth() { return wxStyledTextCtrl_GetTabWidth(wxobj); }
        public проц TabWidth(цел значение) { wxStyledTextCtrl_SetTabWidth(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел CodePage() { return wxStyledTextCtrl_GetCodePage(wxobj); }
        public проц CodePage(цел значение) { wxStyledTextCtrl_SetCodePage(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц MarkerDefine(цел markerNumber, цел markerSymbol, Цвет foreground, Цвет background)
        {
            wxStyledTextCtrl_MarkerDefine(wxobj, markerNumber, markerSymbol, wxObject.SafePtr(foreground), wxObject.SafePtr(background));
        }

        public проц MarkerУстForeground(цел markerNumber, Цвет fore)
        {
            wxStyledTextCtrl_MarkerУстForeground(wxobj, markerNumber, wxObject.SafePtr(fore));
        }

        public проц MarkerУстBackground(цел markerNumber, Цвет back)
        {
            wxStyledTextCtrl_MarkerУстBackground(wxobj, markerNumber, wxObject.SafePtr(back));
        }

        public цел MarkerAdd(цел line, цел markerNumber)
        {
            return wxStyledTextCtrl_MarkerAdd(wxobj, line, markerNumber);
        }

        public проц MarkerDelete(цел line, цел markerNumber)
        {
            wxStyledTextCtrl_MarkerDelete(wxobj, line, markerNumber);
        }

        public проц MarkerDeleteAll(цел markerNumber)
        {
            wxStyledTextCtrl_MarkerDeleteAll(wxobj, markerNumber);
        }

        public цел MarkerGet(цел line)
        {
            return wxStyledTextCtrl_MarkerGet(wxobj, line);
        }

        public цел MarkerNext(цел lineStart, цел markerMask)
        {
            return wxStyledTextCtrl_MarkerNext(wxobj, lineStart, markerMask);
        }

        public цел MarkerPrevious(цел lineStart, цел markerMask)
        {
            return wxStyledTextCtrl_MarkerPrevious(wxobj, lineStart, markerMask);
        }

        public проц MarkerDefineBitmap(цел markerNumber, Битмап bmp)
        {
            wxStyledTextCtrl_MarkerDefineBitmap(wxobj, markerNumber, wxObject.SafePtr(bmp));
        }

        //-----------------------------------------------------------------------------

        public проц УстMarginType(цел margin, цел marginType)
        {
            wxStyledTextCtrl_SetMarginType(wxobj, margin, marginType);
        }

        public цел GetMarginType(цел margin)
        {
            return wxStyledTextCtrl_GetMarginType(wxobj, margin);
        }

        //-----------------------------------------------------------------------------

        public проц УстMarginWidth(цел margin, цел pixelWidth)
        {
            wxStyledTextCtrl_SetMarginWidth(wxobj, margin, pixelWidth);
        }

        public цел GetMarginWidth(цел margin)
        {
            return wxStyledTextCtrl_GetMarginWidth(wxobj, margin);
        }

        //-----------------------------------------------------------------------------

        public проц УстMarginMask(цел margin, цел маска)
        {
            wxStyledTextCtrl_SetMarginMask(wxobj, margin, маска);
        }

        public цел GetMarginMask(цел margin)
        {
            return wxStyledTextCtrl_GetMarginMask(wxobj, margin);
        }

        //-----------------------------------------------------------------------------

        public проц УстMarginSensitive(цел margin, бул sensitive)
        {
            wxStyledTextCtrl_SetMarginSensitive(wxobj, margin, sensitive);
        }

        public бул GetMarginSensitive(цел margin)
        {
            return wxStyledTextCtrl_GetMarginSensitive(wxobj, margin);
        }

        //-----------------------------------------------------------------------------

        public проц StyleClearAll()
        {
            wxStyledTextCtrl_StyleClearAll(wxobj);
        }

        public проц StyleУстForeground(цел стиль, Цвет fore)
        {
            wxStyledTextCtrl_StyleУстForeground(wxobj, стиль, wxObject.SafePtr(fore));
        }

        public проц StyleУстBackground(цел стиль, Цвет back)
        {
            wxStyledTextCtrl_StyleУстBackground(wxobj, стиль, wxObject.SafePtr(back));
        }

        public проц StyleУстBold(цел стиль, бул bold)
        {
            wxStyledTextCtrl_StyleУстBold(wxobj, стиль, bold);
        }

        public проц StyleУстItalic(цел стиль, бул italic)
        {
            wxStyledTextCtrl_StyleУстItalic(wxobj, стиль, italic);
        }

        public проц StyleУстSize(цел стиль, цел sizePoints)
        {
            wxStyledTextCtrl_StyleУстSize(wxobj, стиль, sizePoints);
        }

        public проц StyleУстFaceName(цел стиль, ткст fontName)
        {
            wxStyledTextCtrl_StyleУстFaceName(wxobj, стиль, fontName);
        }

        public проц StyleУстEOLFilled(цел стиль, бул filled)
        {
            wxStyledTextCtrl_StyleУстEOLFilled(wxobj, стиль, filled);
        }

        public проц StyleResetDefault()
        {
            wxStyledTextCtrl_StyleResetDefault(wxobj);
        }

        public проц StyleУстUnderline(цел стиль, бул underline)
        {
            wxStyledTextCtrl_StyleУстUnderline(wxobj, стиль, underline);
        }

        public проц StyleУстCase(цел стиль, цел caseForce)
        {
            wxStyledTextCtrl_StyleУстCase(wxobj, стиль, caseForce);
        }

        public проц StyleУстCharacterУст(цел стиль, цел characterУст)
        {
            wxStyledTextCtrl_StyleУстCharacterУст(wxobj, стиль, characterУст);
        }

        public проц StyleУстHotSpot(цел стиль, бул hotspot)
        {
            wxStyledTextCtrl_StyleУстHotSpot(wxobj, стиль, hotspot);
        }

        public проц StyleУстVisible(цел стиль, бул visible)
        {
            wxStyledTextCtrl_StyleУстVisible(wxobj, стиль, visible);
        }

        public проц StyleУстChangeable(цел стиль, бул changeable)
        {
            wxStyledTextCtrl_StyleУстChangeable(wxobj, стиль, changeable);
        }

        //-----------------------------------------------------------------------------

        public проц УстSelForeground(бул useУстting, Цвет fore)
        {
            wxStyledTextCtrl_SetSelForeground(wxobj, useУстting, wxObject.SafePtr(fore));
        }

        public проц УстSelBackground(бул useУстting, Цвет back)
        {
            wxStyledTextCtrl_SetSelBackground(wxobj, useУстting, wxObject.SafePtr(back));
        }

        //-----------------------------------------------------------------------------

        public Цвет CaretForeground() { return new Цвет(wxStyledTextCtrl_GetCaretForeground(wxobj), да); }
        public проц CaretForeground(Цвет значение) { wxStyledTextCtrl_SetCaretForeground(wxobj, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц CmdKeyAssign(цел key, цел modifiers, цел кмд)
        {
            wxStyledTextCtrl_CmdKeyAssign(wxobj, key, modifiers, кмд);
        }

        public проц CmdKeyClear(цел key, цел modifiers)
        {
            wxStyledTextCtrl_CmdKeyClear(wxobj, key, modifiers);
        }

        public проц CmdKeyClearAll()
        {
            wxStyledTextCtrl_CmdKeyClearAll(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц УстStyleBytes(ubyte[] styleBytes)
        {
            wxStyledTextCtrl_SetStyleBytes(wxobj, styleBytes.length, styleBytes.ptr);
        }

        //-----------------------------------------------------------------------------

        public цел CaretPeriod() { return wxStyledTextCtrl_GetCaretPeriod(wxobj); }
        public проц CaretPeriod(цел значение) { wxStyledTextCtrl_SetCaretPeriod(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц УстWordChars(ткст characters)
        {
            wxStyledTextCtrl_SetWordChars(wxobj, characters);
        }

        //-----------------------------------------------------------------------------

        public проц BeginUndoAction()
        {
            wxStyledTextCtrl_BeginUndoAction(wxobj);
        }

        public проц EndUndoAction()
        {
            wxStyledTextCtrl_EndUndoAction(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц IndicatorУстStyle(цел indic, цел стиль)
        {
            wxStyledTextCtrl_IndicatorУстStyle(wxobj, indic, стиль);
        }

        public цел IndicatorGetStyle(цел indic)
        {
            return wxStyledTextCtrl_IndicatorGetStyle(wxobj, indic);
        }

        public проц IndicatorУстForeground(цел indic, Цвет fore)
        {
            wxStyledTextCtrl_IndicatorУстForeground(wxobj, indic, wxObject.SafePtr(fore));
        }

        public Цвет IndicatorGetForeground(цел indic)
        {
            return new Цвет(wxStyledTextCtrl_IndicatorGetForeground(wxobj, indic), да);
        }

        //-----------------------------------------------------------------------------

        public проц УстWhitespaceForeground(бул useУстting, Цвет fore)
        {
            wxStyledTextCtrl_SetWhitespaceForeground(wxobj, useУстting, wxObject.SafePtr(fore));
        }

        public проц УстWhitespaceBackground(бул useУстting, Цвет back)
        {
            wxStyledTextCtrl_SetWhitespaceBackground(wxobj, useУстting, wxObject.SafePtr(back));
        }

        //-----------------------------------------------------------------------------

        public цел StyleBits() { return wxStyledTextCtrl_GetStyleBits(wxobj); }
        public проц StyleBits(цел значение) { wxStyledTextCtrl_SetStyleBits(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц УстLineState(цел line, цел state)
        {
            wxStyledTextCtrl_SetLineState(wxobj, line, state);
        }

        public цел GetLineState(цел line)
        {
            return wxStyledTextCtrl_GetLineState(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public цел MaxLineState() { return wxStyledTextCtrl_GetMaxLineState(wxobj); }

        //-----------------------------------------------------------------------------

        public бул CaretLineVisible() { return wxStyledTextCtrl_GetCaretLineVisible(wxobj); }
        public проц CaretLineVisible(бул значение) { wxStyledTextCtrl_SetCaretLineVisible(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public Цвет CaretLineBack() { return new Цвет(wxStyledTextCtrl_GetCaretLineBack(wxobj), да); }
        public проц CaretLineBack(Цвет значение) { wxStyledTextCtrl_SetCaretLineBack(wxobj, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц AutoCompShow(цел lenEntered, ткст элтList)
        {
            wxStyledTextCtrl_AutoCompShow(wxobj, lenEntered, элтList);
        }

        public проц AutoCompCancel()
        {
            wxStyledTextCtrl_AutoCompCancel(wxobj);
        }

        public бул AutoCompActive() { return wxStyledTextCtrl_AutoCompActive(wxobj); }

        public цел AutoCompPosStart() { return wxStyledTextCtrl_AutoCompPosStart(wxobj); }

        public проц AutoCompComplete()
        {
            wxStyledTextCtrl_AutoCompComplete(wxobj);
        }

        public проц AutoCompStops(ткст значение) { wxStyledTextCtrl_AutoCompStops(wxobj, значение); }

        public char AutoCompSeparator() { return cast(char)wxStyledTextCtrl_AutoCompGetSeparator(wxobj); }
        public проц AutoCompSeparator(char значение) { wxStyledTextCtrl_AutoCompУстSeparator(wxobj, cast(цел)значение); }

        public проц AutoCompSelect(ткст текст)
        {
            wxStyledTextCtrl_AutoCompSelect(wxobj, текст);
        }

        public бул AutoCompCancelAtStart() { return wxStyledTextCtrl_AutoCompGetCancelAtStart(wxobj); }
        public проц AutoCompCancelAtStart(бул значение) { wxStyledTextCtrl_AutoCompУстCancelAtStart(wxobj, значение); }

        public проц AutoCompFillUps(ткст значение) { wxStyledTextCtrl_AutoCompУстFillUps(wxobj, значение); }

        public бул AutoCompChooseSingle() { return wxStyledTextCtrl_AutoCompGetChooseSingle(wxobj); }
        public проц AutoCompChooseSingle(бул значение) { wxStyledTextCtrl_AutoCompУстChooseSingle(wxobj, значение); }

        public бул AutoCompIgnoreCase() { return wxStyledTextCtrl_AutoCompGetIgnoreCase(wxobj); }
        public проц AutoCompIgnoreCase(бул значение) { wxStyledTextCtrl_AutoCompУстIgnoreCase(wxobj, значение); }

        public проц AutoCompAutoHide(бул значение) { wxStyledTextCtrl_AutoCompУстAutoHide(wxobj, значение); }
        public бул AutoCompAutoHide() { return wxStyledTextCtrl_AutoCompGetAutoHide(wxobj); }

        public проц AutoCompDropRestOfWord(бул значение) { wxStyledTextCtrl_AutoCompУстDropRestOfWord(wxobj, значение); }
        public бул AutoCompDropRestOfWord() { return wxStyledTextCtrl_AutoCompGetDropRestOfWord(wxobj); }

        public цел AutoCompTypeSeparator() { return wxStyledTextCtrl_AutoCompGetTypeSeparator(wxobj); }
        public проц AutoCompTypeSeparator(цел значение) { wxStyledTextCtrl_AutoCompУстTypeSeparator(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц UserListShow(цел listType, ткст элтList)
        {
            wxStyledTextCtrl_UserListShow(wxobj, listType, элтList);
        }

        //-----------------------------------------------------------------------------

        public проц RegisterImage(цел тип, Битмап bmp)
        {
            wxStyledTextCtrl_RegisterImage(wxobj, тип, wxObject.SafePtr(bmp));
        }

        public проц ClearRegisteredImages()
        {
            wxStyledTextCtrl_ClearRegisteredImages(wxobj);
        }

        //-----------------------------------------------------------------------------

        public цел Indent() { return wxStyledTextCtrl_GetIndent(wxobj); }
        public проц Indent(цел значение) { wxStyledTextCtrl_SetIndent(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public бул UseTabs() { return wxStyledTextCtrl_GetUseTabs(wxobj); }
        public проц UseTabs(бул значение) { wxStyledTextCtrl_SetUseTabs(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц УстLineIndentation(цел line, цел indentSize)
        {
            wxStyledTextCtrl_SetLineIndentation(wxobj, line, indentSize);
        }

        public цел GetLineIndentation(цел line)
        {
            return wxStyledTextCtrl_GetLineIndentation(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public цел GetLineIndentPosition(цел line)
        {
            return wxStyledTextCtrl_GetLineIndentPosition(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public цел GetColumn(цел поз)
        {
            return wxStyledTextCtrl_GetColumn(wxobj, поз);
        }

        //-----------------------------------------------------------------------------

        public проц UseHorizontalScrollBar(бул значение) { wxStyledTextCtrl_SetUseHorizontalScrollBar(wxobj, значение); }
        public бул UseHorizontalScrollBar() { return wxStyledTextCtrl_GetUseHorizontalScrollBar(wxobj); }

        //-----------------------------------------------------------------------------

        public проц IndentationGuides(бул значение) { wxStyledTextCtrl_SetIndentationGuides(wxobj, значение); }
        public бул IndentationGuides() { return wxStyledTextCtrl_GetIndentationGuides(wxobj); }

        //-----------------------------------------------------------------------------

        public цел HighlightGuide() { return wxStyledTextCtrl_GetHighlightGuide(wxobj); }
        public проц HighlightGuide(цел значение) { wxStyledTextCtrl_SetHighlightGuide(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел GetLineEndPosition(цел line)
        {
            return wxStyledTextCtrl_GetLineEndPosition(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public бул ReadOnly() { return wxStyledTextCtrl_GetReadOnly(wxobj); }
        public проц ReadOnly(бул значение) { wxStyledTextCtrl_SetReadOnly(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел SelectionStart() { return wxStyledTextCtrl_GetSelectionStart(wxobj); }
        public проц SelectionStart(цел значение) { wxStyledTextCtrl_SetSelectionStart(wxobj, значение); }

        public цел SelectionEnd() { return wxStyledTextCtrl_GetSelectionEnd(wxobj); }
        public проц SelectionEnd(цел значение) { wxStyledTextCtrl_SetSelectionEnd(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел PrintMagnification() { return wxStyledTextCtrl_GetPrintMagnification(wxobj); }
        public проц PrintMagnification(цел значение) { wxStyledTextCtrl_SetPrintMagnification(wxobj, значение); }

        public цел PrintColourMode() { return wxStyledTextCtrl_GetPrintColourMode(wxobj); }
        public проц PrintColourMode(цел значение) { wxStyledTextCtrl_SetPrintColourMode(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел FindText(цел minPos, цел maxPos, ткст текст, цел флаги)
        {
            return wxStyledTextCtrl_FindText(wxobj, minPos, maxPos, текст, флаги);
        }

        //-----------------------------------------------------------------------------

        public цел FormatRange(бул doDraw, цел startPos, цел endPos, DC draw, DC target, Прямоугольник renderRect, Прямоугольник pageRect)
        {
            return wxStyledTextCtrl_FormatRange(wxobj, doDraw, startPos, endPos, wxObject.SafePtr(draw), wxObject.SafePtr(target), renderRect, pageRect);
        }

        //-----------------------------------------------------------------------------

        public цел FirstVisibleLine() { return wxStyledTextCtrl_GetFirstVisibleLine(wxobj); }

        //-----------------------------------------------------------------------------

        public ткст GetLine(цел line)
        {
            return cast(ткст) new wxString(wxStyledTextCtrl_GetLine(wxobj, line), да);
        }

        //-----------------------------------------------------------------------------

        public цел LineCount() { return wxStyledTextCtrl_GetLineCount(wxobj); }

        //-----------------------------------------------------------------------------

        public цел MarginLeft() { return wxStyledTextCtrl_GetMarginLeft(wxobj); }
        public проц MarginLeft(цел значение) { wxStyledTextCtrl_SetMarginLeft(wxobj, значение); }

        public цел MarginRight() { return wxStyledTextCtrl_GetMarginRight(wxobj); }
        public проц MarginRight(цел значение) { wxStyledTextCtrl_SetMarginRight(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public бул Modify() { return wxStyledTextCtrl_GetModify(wxobj); }

        //-----------------------------------------------------------------------------

        public проц УстSelection(цел start, цел end)
        {
            wxStyledTextCtrl_SetSelection(wxobj, start, end);
        }

        public ткст SelectedText() { return cast(ткст) new wxString(wxStyledTextCtrl_GetSelectedText(wxobj), да); }

        //-----------------------------------------------------------------------------

        public ткст GetTextRange(цел startPos, цел endPos)
        {
            return cast(ткст) new wxString(wxStyledTextCtrl_GetTextRange(wxobj, startPos, endPos), да);
        }

        //-----------------------------------------------------------------------------

        public проц HideSelection(бул значение) { wxStyledTextCtrl_HideSelection(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел LineFromPosition(цел поз)
        {
            return wxStyledTextCtrl_LineFromPosition(wxobj, поз);
        }

        public цел PositionFromLine(цел line)
        {
            return wxStyledTextCtrl_PositionFromLine(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц LineScroll(цел columns, цел строки)
        {
            wxStyledTextCtrl_LineScroll(wxobj, columns, строки);
        }

        //-----------------------------------------------------------------------------

        public проц EnsureCaretVisible()
        {
            wxStyledTextCtrl_EnsureCaretVisible(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц ReplaceSelection(ткст текст)
        {
            wxStyledTextCtrl_ReplaceSelection(wxobj, текст);
        }

        //-----------------------------------------------------------------------------

        public бул CanPaste() { return wxStyledTextCtrl_CanPaste(wxobj); }

        public бул CanUndo() { return wxStyledTextCtrl_CanUndo(wxobj); }

        //-----------------------------------------------------------------------------

        public проц EmptyUndoBuffer()
        {
            wxStyledTextCtrl_EmptyUndoBuffer(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Undo()
        {
            wxStyledTextCtrl_Undo(wxobj);
        }

        public проц Cut()
        {
            wxStyledTextCtrl_Cut(wxobj);
        }

        public проц Copy()
        {
            wxStyledTextCtrl_Copy(wxobj);
        }

        public проц Paste()
        {
            wxStyledTextCtrl_Paste(wxobj);
        }

        public проц Clear()
        {
            wxStyledTextCtrl_Clear(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Text(ткст значение) { wxStyledTextCtrl_SetText(wxobj, значение); }
        public ткст Text() { return cast(ткст) new wxString(wxStyledTextCtrl_GetText(wxobj), да); }

        //-----------------------------------------------------------------------------

        public цел TextLength() { return wxStyledTextCtrl_GetTextLength(wxobj); }

        //-----------------------------------------------------------------------------

        public бул Overtype() { return wxStyledTextCtrl_GetOvertype(wxobj); }
        public проц Overtype(бул значение) { wxStyledTextCtrl_SetOvertype(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел CaretWidth() { return wxStyledTextCtrl_GetCaretWidth(wxobj); }
        public проц CaretWidth(цел значение) { wxStyledTextCtrl_SetCaretWidth(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел TargetStart() { return wxStyledTextCtrl_GetTargetStart(wxobj); }
        public проц TargetStart(цел значение) { wxStyledTextCtrl_SetTargetStart(wxobj, значение); }

        public цел TargetEnd() { return wxStyledTextCtrl_GetTargetEnd(wxobj); }
        public проц TargetEnd(цел значение) { wxStyledTextCtrl_SetTargetEnd(wxobj, значение); }

        public цел ReplaceTarget(ткст текст)
        {
            return wxStyledTextCtrl_ReplaceTarget(wxobj, текст);
        }

        public цел ReplaceTargetRE(ткст текст)
        {
            return wxStyledTextCtrl_ReplaceTargetRE(wxobj, текст);
        }

        public цел SearchInTarget(ткст текст)
        {
            return wxStyledTextCtrl_SearchInTarget(wxobj, текст);
        }

        //-----------------------------------------------------------------------------

        public цел УстSearchФлаги() { return wxStyledTextCtrl_GetSearchФлаги(wxobj); }
        public проц УстSearchФлаги(цел значение) { wxStyledTextCtrl_SetSearchФлаги(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц CallTipShow(цел поз, ткст definition)
        {
            wxStyledTextCtrl_CallTipShow(wxobj, поз, definition);
        }

        public проц CallTipCancel()
        {
            wxStyledTextCtrl_CallTipCancel(wxobj);
        }

        public бул CallTipActive() { return wxStyledTextCtrl_CallTipActive(wxobj); }

        public цел CallTipPosAtStart() { return wxStyledTextCtrl_CallTipPosAtStart(wxobj); }

        public проц CallTipУстHighlight(цел start, цел end)
        {
            wxStyledTextCtrl_CallTipУстHighlight(wxobj, start, end);
        }

        public проц CallTipBackground(Цвет значение) { wxStyledTextCtrl_CallTipУстBackground(wxobj, wxObject.SafePtr(значение)); }

        public проц CallTipForeground(Цвет значение) { wxStyledTextCtrl_CallTipУстForeground(wxobj, wxObject.SafePtr(значение)); }

        public проц CallTipForegroundHighlight(Цвет значение) { wxStyledTextCtrl_CallTipУстForegroundHighlight(wxobj, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public цел VisibleFromDocLine(цел line)
        {
            return wxStyledTextCtrl_VisibleFromDocLine(wxobj, line);
        }

        public цел DocLineFromVisible(цел lineDisplay)
        {
            return wxStyledTextCtrl_DocLineFromVisible(wxobj, lineDisplay);
        }

        //-----------------------------------------------------------------------------

        public проц УстFoldLevel(цел line, цел level)
        {
            wxStyledTextCtrl_SetFoldLevel(wxobj, line, level);
        }

        public цел GetFoldLevel(цел line)
        {
            return wxStyledTextCtrl_GetFoldLevel(wxobj, line);
        }

        public цел GetLastChild(цел line, цел level)
        {
            return wxStyledTextCtrl_GetLastChild(wxobj, line, level);
        }

        public цел GetFoldParent(цел line)
        {
            return wxStyledTextCtrl_GetFoldParent(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц ShowLines(цел lineStart, цел lineEnd)
        {
            wxStyledTextCtrl_ShowLines(wxobj, lineStart, lineEnd);
        }

        public проц HideLines(цел lineStart, цел lineEnd)
        {
            wxStyledTextCtrl_HideLines(wxobj, lineStart, lineEnd);
        }

        public бул GetLineVisible(цел line)
        {
            return wxStyledTextCtrl_GetLineVisible(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц УстFoldExpanded(цел line, бул expanded)
        {
            wxStyledTextCtrl_SetFoldExpanded(wxobj, line, expanded);
        }

        public бул GetFoldExpanded(цел line)
        {
            return wxStyledTextCtrl_GetFoldExpanded(wxobj, line);
        }

        public проц ToggleFold(цел line)
        {
            wxStyledTextCtrl_ToggleFold(wxobj, line);
        }

        public проц EnsureVisible(цел line)
        {
            wxStyledTextCtrl_EnsureVisible(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц FoldФлаги(цел значение) { wxStyledTextCtrl_SetFoldФлаги(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц EnsureVisibleEnforcePolicy(цел line)
        {
            wxStyledTextCtrl_EnsureVisibleEnforcePolicy(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public бул TabIndents() { return wxStyledTextCtrl_GetTabIndents(wxobj); }
        public проц TabIndents(бул значение) { wxStyledTextCtrl_SetTabIndents(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public бул BackSpaceUnIndents() { return wxStyledTextCtrl_GetBackSpaceUnIndents(wxobj); }
        public проц BackSpaceUnIndents(бул значение) { wxStyledTextCtrl_SetBackSpaceUnIndents(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц MouseDwellTime(цел значение) { wxStyledTextCtrl_SetMouseDwellTime(wxobj, значение); }
        public цел MouseDwellTime() { return wxStyledTextCtrl_GetMouseDwellTime(wxobj); }

        //-----------------------------------------------------------------------------

        public цел WordStartPosition(цел поз, бул onlyWordCharacters)
        {
            return wxStyledTextCtrl_WordStartPosition(wxobj, поз, onlyWordCharacters);
        }

        public цел WordEndPosition(цел поз, бул onlyWordCharacters)
        {
            return wxStyledTextCtrl_WordEndPosition(wxobj, поз, onlyWordCharacters);
        }

        //-----------------------------------------------------------------------------

        public цел WrapMode() { return wxStyledTextCtrl_GetWrapMode(wxobj); }
        public проц WrapMode(цел значение) { wxStyledTextCtrl_SetWrapMode(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц LayoutCache(цел значение) { wxStyledTextCtrl_SetLayoutCache(wxobj, значение); }
        public цел LayoutCache() { return wxStyledTextCtrl_GetLayoutCache(wxobj); }

        //-----------------------------------------------------------------------------

        public цел ScrollWidth() { return wxStyledTextCtrl_GetScrollWidth(wxobj); }
        public проц ScrollWidth(цел значение) { wxStyledTextCtrl_SetScrollWidth(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел TextWidth(цел стиль, ткст текст)
        {
            return wxStyledTextCtrl_TextWidth(wxobj, стиль, текст);
        }

        //-----------------------------------------------------------------------------

        public бул EndAtLastLine() { return cast(бул)wxStyledTextCtrl_GetEndAtLastLine(wxobj); }
        public проц EndAtLastLine(бул значение) { wxStyledTextCtrl_SetEndAtLastLine(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел TextHeight(цел line)
        {
            return wxStyledTextCtrl_TextHeight(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public бул UseVerticalScrollBar() { return wxStyledTextCtrl_GetUseVerticalScrollBar(wxobj); }
        public проц UseVerticalScrollBar(бул значение) { wxStyledTextCtrl_SetUseVerticalScrollBar(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц AppendText(цел length, ткст текст)
        {
            wxStyledTextCtrl_AppendText(wxobj, length, текст);
        }

        //-----------------------------------------------------------------------------

        public бул TwoPhaseDraw() { return wxStyledTextCtrl_GetTwoPhaseDraw(wxobj); }
        public проц TwoPhaseDraw(бул значение) { wxStyledTextCtrl_SetTwoPhaseDraw(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц TargetFromSelection()
        {
            wxStyledTextCtrl_TargetFromSelection(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц LinesJoin()
        {
            wxStyledTextCtrl_LinesJoin(wxobj);
        }

        public проц LinesSplit(цел pixelWidth)
        {
            wxStyledTextCtrl_LinesSplit(wxobj, pixelWidth);
        }

        //-----------------------------------------------------------------------------

        public проц УстFoldMarginColour(бул useУстting, Цвет back)
        {
            wxStyledTextCtrl_SetFoldMarginColour(wxobj, useУстting, wxObject.SafePtr(back));
        }

        public проц УстFoldMarginHiColour(бул useУстting, Цвет fore)
        {
            wxStyledTextCtrl_SetFoldMarginHiColour(wxobj, useУстting, wxObject.SafePtr(fore));
        }

        //-----------------------------------------------------------------------------

        public проц LineDuplicate()
        {
            wxStyledTextCtrl_LineDuplicate(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц HomeDisplay()
        {
            wxStyledTextCtrl_HomeDisplay(wxobj);
        }

        public проц HomeDisplayExtend()
        {
            wxStyledTextCtrl_HomeDisplayExtend(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц LineEndDisplay()
        {
            wxStyledTextCtrl_LineEndDisplay(wxobj);
        }

        public проц LineEndDisplayExtend()
        {
            wxStyledTextCtrl_LineEndDisplayExtend(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц MoveCaretInsideView()
        {
            wxStyledTextCtrl_MoveCaretInsideView(wxobj);
        }

        //-----------------------------------------------------------------------------

        public цел LineLength(цел line)
        {
            return wxStyledTextCtrl_LineLength(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц BraceHighlight(цел pos1, цел pos2)
        {
            wxStyledTextCtrl_BraceHighlight(wxobj, pos1, pos2);
        }

        public проц BraceBadLight(цел поз)
        {
            wxStyledTextCtrl_BraceBadLight(wxobj, поз);
        }

        public цел BraceMatch(цел поз)
        {
            return wxStyledTextCtrl_BraceMatch(wxobj, поз);
        }

        //-----------------------------------------------------------------------------

        public бул ViewEOL() { return wxStyledTextCtrl_GetViewEOL(wxobj); }
        public проц ViewEOL(бул значение) { wxStyledTextCtrl_SetViewEOL(wxobj, значение); }

        //-----------------------------------------------------------------------------

        // Not really usable yet, unless sharing documents between styled
        // текст controls (?)

        public wxObject DocPointer() { return НайдиОбъект(wxStyledTextCtrl_GetDocPointer(wxobj)); }
        public проц DocPointer(wxObject значение) { wxStyledTextCtrl_SetDocPointer(wxobj, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public цел ModEventMask() { return wxStyledTextCtrl_GetModEventMask(wxobj); }
        public проц ModEventMask(цел значение) { wxStyledTextCtrl_SetModEventMask(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел EdgeColumn() { return wxStyledTextCtrl_GetEdgeColumn(wxobj); }
        public проц EdgeColumn(цел значение) { wxStyledTextCtrl_SetEdgeColumn(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел EdgeMode() { return wxStyledTextCtrl_GetEdgeMode(wxobj); }
        public проц EdgeMode(цел значение) { wxStyledTextCtrl_SetEdgeMode(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public Цвет EdgeColour() { return new Цвет(wxStyledTextCtrl_GetEdgeColour(wxobj), да); }
        public проц EdgeColour(Цвет значение) { wxStyledTextCtrl_SetEdgeColour(wxobj, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц SearchAnchor()
        {
            wxStyledTextCtrl_SearchAnchor(wxobj);
        }

        public цел SearchNext(цел флаги, ткст текст)
        {
            return wxStyledTextCtrl_SearchNext(wxobj, флаги, текст);
        }

        public цел SearchPrev(цел флаги, ткст текст)
        {
            return wxStyledTextCtrl_SearchPrev(wxobj, флаги, текст);
        }

        //-----------------------------------------------------------------------------

        public цел LinesOnScreen() { return wxStyledTextCtrl_LinesOnScreen(wxobj); }

        //-----------------------------------------------------------------------------

        public проц UsePopUp(бул значение) { wxStyledTextCtrl_UsePopUp(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public бул SelectionIsRectangle() { return wxStyledTextCtrl_SelectionIsRectangle(wxobj); }

        //-----------------------------------------------------------------------------

        public цел Zoom() { return wxStyledTextCtrl_GetZoom(wxobj); }
        public проц Zoom(цел значение) { wxStyledTextCtrl_SetZoom(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц CreateDocument()
        {
            wxStyledTextCtrl_CreateDocument(wxobj);
        }

        public проц AddRefDocument(wxObject docPointer)
        {
            wxStyledTextCtrl_AddRefDocument(wxobj, wxObject.SafePtr(docPointer));
        }

        public проц ReleaseDocument(wxObject docPointer)
        {
            wxStyledTextCtrl_ReleaseDocument(wxobj, wxObject.SafePtr(docPointer));
        }

        //-----------------------------------------------------------------------------

        public бул STCFocus() { return wxStyledTextCtrl_GetSTCFocus(wxobj); }
        public проц STCFocus(бул значение) { wxStyledTextCtrl_SetSTCFocus(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел Status() { return wxStyledTextCtrl_GetStatus(wxobj); }
        public проц Status(цел значение) { wxStyledTextCtrl_SetStatus(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public бул MouseDownCaptures() { return wxStyledTextCtrl_GetMouseDownCaptures(wxobj); }
        public проц MouseDownCaptures(бул значение) { wxStyledTextCtrl_SetMouseDownCaptures(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц STCCursor(цел значение) { wxStyledTextCtrl_SetSTCCursor(wxobj, значение); }
        public цел STCCursor() { return wxStyledTextCtrl_GetSTCCursor(wxobj); }

        //-----------------------------------------------------------------------------

        public проц ControlCharSymbol(цел значение) { wxStyledTextCtrl_SetControlCharSymbol(wxobj, значение); }
        public цел ControlCharSymbol() { return wxStyledTextCtrl_GetControlCharSymbol(wxobj); }

        //-----------------------------------------------------------------------------

        public проц WordPartLeft()
        {
            wxStyledTextCtrl_WordPartLeft(wxobj);
        }

        public проц WordPartLeftExtend()
        {
            wxStyledTextCtrl_WordPartLeftExtend(wxobj);
        }

        public проц WordPartRight()
        {
            wxStyledTextCtrl_WordPartRight(wxobj);
        }

        public проц WordPartRightExtend()
        {
            wxStyledTextCtrl_WordPartRightExtend(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц УстVisiblePolicy(цел visiblePolicy, цел visibleSlop)
        {
            wxStyledTextCtrl_SetVisiblePolicy(wxobj, visiblePolicy, visibleSlop);
        }

        //-----------------------------------------------------------------------------

        public проц DelLineLeft()
        {
            wxStyledTextCtrl_DelLineLeft(wxobj);
        }

        public проц DelLineRight()
        {
            wxStyledTextCtrl_DelLineRight(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц XOffset(цел значение) { wxStyledTextCtrl_SetXOffset(wxobj, значение); }
        public цел XOffset() { return wxStyledTextCtrl_GetXOffset(wxobj); }

        //-----------------------------------------------------------------------------

        public проц ChooseCaretX()
        {
            wxStyledTextCtrl_ChooseCaretX(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц УстXCaretPolicy(цел caretPolicy, цел caretSlop)
        {
            wxStyledTextCtrl_SetXCaretPolicy(wxobj, caretPolicy, caretSlop);
        }

        public проц УстYCaretPolicy(цел caretPolicy, цел caretSlop)
        {
            wxStyledTextCtrl_SetYCaretPolicy(wxobj, caretPolicy, caretSlop);
        }

        //-----------------------------------------------------------------------------

        public проц PrintWrapMode(цел значение) { wxStyledTextCtrl_SetPrintWrapMode(wxobj, значение); }
        public цел PrintWrapMode() { return wxStyledTextCtrl_GetPrintWrapMode(wxobj); }

        //-----------------------------------------------------------------------------

        public проц УстHotspotActiveForeground(бул useУстting, Цвет fore)
        {
            wxStyledTextCtrl_SetHotspotActiveForeground(wxobj, useУстting, wxObject.SafePtr(fore));
        }

        public проц УстHotspotActiveBackground(бул useУстting, Цвет back)
        {
            wxStyledTextCtrl_SetHotspotActiveBackground(wxobj, useУстting, wxObject.SafePtr(back));
        }

        public проц УстHotspotActiveUnderline(бул underline)
        {
            wxStyledTextCtrl_SetHotspotActiveUnderline(wxobj, underline);
        }

        //-----------------------------------------------------------------------------

        public проц StartRecord()
        {
            wxStyledTextCtrl_StartRecord(wxobj);
        }

        public проц StopRecord()
        {
            wxStyledTextCtrl_StopRecord(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Lexer(цел значение) { wxStyledTextCtrl_SetLexer(wxobj, значение); }
        public цел Lexer() { return wxStyledTextCtrl_GetLexer(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Colourise(цел start, цел end)
        {
            wxStyledTextCtrl_Colourise(wxobj, start, end);
        }

        //-----------------------------------------------------------------------------

        public проц УстProperty(ткст key, ткст значение)
        {
            wxStyledTextCtrl_SetProperty(wxobj, key, значение);
        }

        //-----------------------------------------------------------------------------

        public проц УстKeyWords(цел keywordУст, ткст keyWords)
        {
            wxStyledTextCtrl_SetKeyWords(wxobj, keywordУст, keyWords);
        }

        //-----------------------------------------------------------------------------

        public проц LexerLanguage(ткст значение) { wxStyledTextCtrl_SetLexerLanguage(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел CurrentLine() { return wxStyledTextCtrl_GetCurrentLine(wxobj); }

        //-----------------------------------------------------------------------------

        public проц StyleУстSpec(цел styleNum, ткст spec)
        {
            wxStyledTextCtrl_StyleУстSpec(wxobj, styleNum, spec);
        }

        public проц StyleУстFont(цел styleNum, Шрифт шрифт)
        {
            wxStyledTextCtrl_StyleУстFont(wxobj, styleNum, wxObject.SafePtr(шрифт));
        }

        public проц StyleУстFontAttr(цел styleNum, цел разм, ткст faceName, бул bold, бул italic, бул underline)
        {
            wxStyledTextCtrl_StyleУстFontAttr(wxobj, styleNum, разм, faceName, bold, italic, underline);
        }

        //-----------------------------------------------------------------------------

        public проц CmdKeyExecute(цел кмд)
        {
            wxStyledTextCtrl_CmdKeyExecute(wxobj, кмд);
        }

        //-----------------------------------------------------------------------------

        public проц УстMargins(цел left, цел right)
        {
            wxStyledTextCtrl_SetMargins(wxobj, left, right);
        }

        //-----------------------------------------------------------------------------

        public проц GetSelection(out цел startPos, out цел endPos)
        {
            wxStyledTextCtrl_GetSelection(wxobj, startPos, endPos);
        }

        //-----------------------------------------------------------------------------

        public Точка PointFromPosition(цел поз)
        {
            Точка тчк;
            wxStyledTextCtrl_PointFromPosition(wxobj, поз, тчк);
            return тчк;
        }

        //-----------------------------------------------------------------------------

        public проц ScrollToLine(цел line)
        {
            wxStyledTextCtrl_ScrollToLine(wxobj, line);
        }

        //-----------------------------------------------------------------------------

        public проц ScrollToColumn(цел column)
        {
            wxStyledTextCtrl_ScrollToColumn(wxobj, column);
        }

        //-----------------------------------------------------------------------------

        /*public цел SendMsg(цел msg, цел wp, цел lp)
        {
            return wxStyledTextCtrl_SendMsg(wxobj, msg, wp, lp);
        }*/

        //-----------------------------------------------------------------------------

        /*public ScrollBar VScrollBar
        {
            set { wxStyledTextCtrl_SetVScrollBar(wxobj, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        /*public ScrollBar УстHScrollBar
        {
            set { wxStyledTextCtrl_SetHScrollBar(wxobj, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        public бул LastKeydownProcessed() { return wxStyledTextCtrl_GetLastKeydownProcessed(wxobj); }
        public проц LastKeydownProcessed(бул значение) { wxStyledTextCtrl_SetLastKeydownProcessed(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public бул СохраниФайл(ткст filename)
        {
            return wxStyledTextCtrl_SaveFile(wxobj, filename);
        }

        public бул ЗагрузиФайл(ткст filename)
        {
            return wxStyledTextCtrl_LoadFile(wxobj, filename);
        }

        //-----------------------------------------------------------------------------

		public проц Change_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_CHANGE, ИД, значение, this); }
		public проц Change_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц StyleNeeded_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_STYLENEEDED, ИД, значение, this); }
		public проц StyleNeeded_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц CharAdded_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_CHARADDED, ИД, значение, this); }
		public проц CharAdded_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц SavePointReached_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_SAVEPOINTREACHED, ИД, значение, this); }
		public проц SavePointReached_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц SavePointLeft_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_SAVEPOINTLEFT, ИД, значение, this); }
		public проц SavePointLeft_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц ROModifyAttempt_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_ROMODIFYATTEMPT, ИД, значение, this); }
		public проц ROModifyAttempt_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц Key_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_KEY, ИД, значение, this); }
		public проц Key_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц DoubleClick_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_DOUBLECLICK, ИД, значение, this); }
		public проц DoubleClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц UpdateUI_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_UPDATEUI, ИД, значение, this); }
		public проц UpdateUI_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц Modified_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_MODIFIED, ИД, значение, this); }
		public проц Modified_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц MacroRecord_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_MACRORECORD, ИД, значение, this); }
		public проц MacroRecord_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц MarginClick_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_MARGINCLICK, ИД, значение, this); }
		public проц MarginClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц NeedShown_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_NEEDSHOWN, ИД, значение, this); }
		public проц NeedShown_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		/*public event ДатчикСобытий PositionChanged
		{
			add { AddКомандаListener(wxEVT_STC_POSCHANGED, ИД, значение, this); }
			remove { RemoveHandler(значение, this); }
		}*/

		public проц Paint_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_PAINTED, ИД, значение, this); }
		public проц Paint_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц UserListSelection_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_USERLISTSELECTION, ИД, значение, this); }
		public проц UserListSelection_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц URIDropped_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_URIDROPPED, ИД, значение, this); }
		public проц URIDropped_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц DwellStart_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_DWELLSTART, ИД, значение, this); }
		public проц DwellStart_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц DwellEnd_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_DWELLEND, ИД, значение, this); }
		public проц DwellEnd_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц StartDrag_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_START_DRAG, ИД, значение, this); }
		public проц StartDrag_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц DragOver_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_DRAG_OVER, ИД, значение, this); }
		public проц DragOver_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц DoDrop_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_DO_DROP, ИД, значение, this); }
		public проц DoDrop_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц Zoomed_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_ZOOM, ИД, значение, this); }
		public проц Zoomed_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц HotspotClick_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_HOTSPOT_CLICK, ИД, значение, this); }
		public проц HotspotClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц HotspotDoubleClick_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_HOTSPOT_DCLICK, ИД, значение, this); }
		public проц HotspotDoubleClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }

		public проц CalltipClick_Add(ДатчикСобытий значение) { AddКомандаListener(wxEVT_STC_CALLTIP_CLICK, ИД, значение, this); }
		public проц CalltipClick_Remove(ДатчикСобытий значение) { RemoveHandler(значение, this); }
    }

        //! \cond EXTERN
        static extern (C) IntPtr wxStyledTextEvent_ctor(цел типКоманды, цел ид);
        static extern (C) проц   wxStyledTextEvent_SetPosition(IntPtr сам, цел поз);
        static extern (C) проц   wxStyledTextEvent_SetKey(IntPtr сам, цел k);
        static extern (C) проц   wxStyledTextEvent_SetModifiers(IntPtr сам, цел m);
        static extern (C) проц   wxStyledTextEvent_SetModificationType(IntPtr сам, цел t);
        static extern (C) проц   wxStyledTextEvent_SetText(IntPtr сам, ткст t);
        static extern (C) проц   wxStyledTextEvent_SetLength(IntPtr сам, цел len);
        static extern (C) проц   wxStyledTextEvent_SetLinesAdded(IntPtr сам, цел чис);
        static extern (C) проц   wxStyledTextEvent_SetLine(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetFoldLevelNow(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetFoldLevelPrev(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetMargin(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetMessage(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetWParam(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetLParam(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetListType(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetX(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetY(IntPtr сам, цел val);
        static extern (C) проц   wxStyledTextEvent_SetDragText(IntPtr сам, ткст val);
        static extern (C) проц   wxStyledTextEvent_SetDragAllowMove(IntPtr сам, бул val);
        //static extern (C) проц   wxStyledTextEvent_SetDragResult(IntPtr сам, wxDragResult val);
        static extern (C) цел    wxStyledTextEvent_GetPosition(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetKey(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetModifiers(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetModificationType(IntPtr сам);
        static extern (C) IntPtr wxStyledTextEvent_GetText(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetLength(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetLinesAdded(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetLine(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetFoldLevelNow(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetFoldLevelPrev(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetMargin(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetMessage(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetWParam(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetLParam(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetListType(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetX(IntPtr сам);
        static extern (C) цел    wxStyledTextEvent_GetY(IntPtr сам);
        static extern (C) IntPtr wxStyledTextEvent_GetDragText(IntPtr сам);
        static extern (C) бул   wxStyledTextEvent_GetDragAllowMove(IntPtr сам);
        //static extern (C) IntPtr wxStyledTextEvent_GetDragResult(IntPtr сам);
        static extern (C) бул   wxStyledTextEvent_GetShift(IntPtr сам);
        static extern (C) бул   wxStyledTextEvent_GetControl(IntPtr сам);
        static extern (C) бул   wxStyledTextEvent_GetAlt(IntPtr сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias StyledTextEvent wxStyledTextEvent;
    public class StyledTextEvent : СобытиеКоманда
    {
		public this(IntPtr wxobj)
            { super(wxobj); }

        public  this(цел типКоманды, цел ид)
            { super(wxStyledTextEvent_ctor(типКоманды, ид)); }

        //-----------------------------------------------------------------------------

        public цел Позиция() { return wxStyledTextEvent_GetPosition(wxobj); }
        public проц Позиция(цел значение) { wxStyledTextEvent_SetPosition(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public цел Key() { return wxStyledTextEvent_GetKey(wxobj); }
        public проц Key(цел значение) { wxStyledTextEvent_SetKey(wxobj, значение); }

        //-----------------------------------------------------------------------------

        public проц Modifiers(цел значение) { wxStyledTextEvent_SetModifiers(wxobj, значение); }
        public цел Modifiers() { return wxStyledTextEvent_GetModifiers(wxobj); }

        //-----------------------------------------------------------------------------

        public проц ModificationType(цел значение) { wxStyledTextEvent_SetModificationType(wxobj, значение); }
        public цел ModificationType() { return wxStyledTextEvent_GetModificationType(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Text(ткст значение) { wxStyledTextEvent_SetText(wxobj, значение); }
        public ткст Text() { return cast(ткст) new wxString(wxStyledTextEvent_GetText(wxobj), да); }

        //-----------------------------------------------------------------------------

        public проц Length(цел значение) { wxStyledTextEvent_SetLength(wxobj, значение); }
        public цел Length() { return wxStyledTextEvent_GetLength(wxobj); }

        //-----------------------------------------------------------------------------

        public проц LinesAdded(цел значение) { wxStyledTextEvent_SetLinesAdded(wxobj, значение); }
        public цел LinesAdded() { return wxStyledTextEvent_GetLinesAdded(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Line(цел значение) { wxStyledTextEvent_SetLine(wxobj, значение); }
        public цел Line() { return wxStyledTextEvent_GetLine(wxobj); }

        //-----------------------------------------------------------------------------

        public проц FoldLevelNow(цел значение) { wxStyledTextEvent_SetFoldLevelNow(wxobj, значение); }
        public цел FoldLevelNow() { return wxStyledTextEvent_GetFoldLevelNow(wxobj); }

        public проц FoldLevelPrev(цел значение) { wxStyledTextEvent_SetFoldLevelPrev(wxobj, значение); }
        public цел FoldLevelPrev() { return wxStyledTextEvent_GetFoldLevelPrev(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Margin(цел значение) { wxStyledTextEvent_SetMargin(wxobj, значение); }
        public цел Margin() { return wxStyledTextEvent_GetMargin(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Message(цел значение) { wxStyledTextEvent_SetMessage(wxobj, значение); }
        public цел Message() { return wxStyledTextEvent_GetMessage(wxobj); }

        //-----------------------------------------------------------------------------

        public проц WParam(цел значение) { wxStyledTextEvent_SetWParam(wxobj, значение); }
        public цел WParam() { return wxStyledTextEvent_GetWParam(wxobj); }

        //-----------------------------------------------------------------------------

        public проц LParam(цел значение) { wxStyledTextEvent_SetLParam(wxobj, значение); }
        public цел LParam() { return wxStyledTextEvent_GetLParam(wxobj); }

        //-----------------------------------------------------------------------------

        public проц ListType(цел значение) { wxStyledTextEvent_SetListType(wxobj, значение); }
        public цел ListType() { return wxStyledTextEvent_GetListType(wxobj); }

        //-----------------------------------------------------------------------------

        public проц X(цел значение) { wxStyledTextEvent_SetX(wxobj, значение); }
        public цел X() { return wxStyledTextEvent_GetX(wxobj); }

        //-----------------------------------------------------------------------------

        public проц Y(цел значение) { wxStyledTextEvent_SetY(wxobj, значение); }
        public цел Y() { return wxStyledTextEvent_GetY(wxobj); }

        //-----------------------------------------------------------------------------

        public проц DragText(ткст значение) { wxStyledTextEvent_SetDragText(wxobj, значение); }
        public ткст DragText() { return cast(ткст) new wxString(wxStyledTextEvent_GetDragText(wxobj), да); }

        //-----------------------------------------------------------------------------

        public проц DragAllowMove(бул значение) { wxStyledTextEvent_SetDragAllowMove(wxobj, значение); }
        public бул DragAllowMove() { return wxStyledTextEvent_GetDragAllowMove(wxobj); }

        //-----------------------------------------------------------------------------

        /*public DragResult DragResult
        {
            set { wxStyledTextEvent_SetDragResult(wxobj, wxObject.SafePtr(значение)); }
            get { return wxStyledTextEvent_GetDragResult(wxobj); }
        }*/

        //-----------------------------------------------------------------------------

        public бул Shift() { return wxStyledTextEvent_GetShift(wxobj); }

        public бул Control() { return wxStyledTextEvent_GetControl(wxobj); }

        public бул Alt() { return wxStyledTextEvent_GetAlt(wxobj); }

        private static Событие Нов(IntPtr объ) { return new StyledTextEvent(объ); }
    }

//! \cond VERSION
} // version(WXD_STYLEDTEXTCTRL)
//! \endcond
