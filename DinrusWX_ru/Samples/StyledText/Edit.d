//-----------------------------------------------------------------------------
// wxD/Samples - Edit.d
//
// A wxD version of the wxWidgets "contrib/stc/edit" sample.
//
// (C) 2003 Wyo
// (C) 2007
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Edit.d,v 1.5 2008/09/26 11:37:06 afb Exp $
//-----------------------------------------------------------------------------

import std.ткст : find, rfind, format, tolower;
import std.path : getBaseName;

import wx.wx;

import Prefs;
import defsext;	 // additional definitions
import StyledText;
version = WXD_STYLEDTEXTCTRL;
//----------------------------------------------------------------------------
// Edit
//----------------------------------------------------------------------------

public class Edit : StyledTextCtrl {

	// file
	private ткст m_filename;

	// lanugage properties
	private Prefs.LanguageInfo m_language;

	// margin variables
	private цел m_LineNrID;
	private цел m_LineNrMargin;
	private цел m_FoldingID;
	private цел m_FoldingMargin;
	private цел m_DividerID;

	public this (Окно родитель, цел ид = wxID_ANY,
				Точка поз = вхДефПоз,
				Размер Размер= вхДефРазм,
				long стиль = wxSUNKEN_BORDER|wxVSCROLL)
	{
		super(родитель, ид, поз, Размер, стиль);

		m_filename = "";

		m_LineNrID = 0;
		m_DividerID = 1;
		m_FoldingID = 2;

		// default шрифт for all styles
		ViewEOL = g_CommonPrefs.displayEOLEnable;
		IndentationGuides = g_CommonPrefs.indentGuideEnable;
		EdgeMode = (g_CommonPrefs.longLineOnEnable ? wxSTC_EDGE_LINE: wxSTC_EDGE_NONE);
		ViewWhiteSpace = (g_CommonPrefs.whiteSpaceEnable ? wxSTC_WS_VISIBLEALWAYS: wxSTC_WS_INVISIBLE);
		Overtype = g_CommonPrefs.overTypeInitial;
		ReadOnly = g_CommonPrefs.readOnlyInitial;
		WrapMode = (g_CommonPrefs.wrapModeInitial ? wxSTC_WRAP_WORD: wxSTC_WRAP_NONE);
		Шрифт шрифт = new Шрифт(10, СемействоШрифтов.wxMODERN, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL);
		StyleУстFont (wxSTC_STYLE_DEFAULT, шрифт);
		StyleУстForeground (wxSTC_STYLE_DEFAULT, Цвет.wxBLACK);
		StyleУстBackground (wxSTC_STYLE_DEFAULT, Цвет.wxWHITE);
		StyleУстForeground (wxSTC_STYLE_LINENUMBER, new Цвет ("DARK GREY"));
		StyleУстBackground (wxSTC_STYLE_LINENUMBER, Цвет.wxWHITE);
		StyleУстForeground(wxSTC_STYLE_INDENTGUIDE, new Цвет ("DARK GREY"));
		InitializePrefs (DEFAULT_LANGUAGE);

		// set visibility
		УстVisiblePolicy (wxSTC_VISIBLE_STRICT|wxSTC_VISIBLE_SLOP, 1);
		УстXCaretPolicy (wxSTC_CARET_EVEN|wxSTC_VISIBLE_STRICT|wxSTC_CARET_SLOP, 1);
		УстYCaretPolicy (wxSTC_CARET_EVEN|wxSTC_VISIBLE_STRICT|wxSTC_CARET_SLOP, 1);

		// markers
		MarkerDefine (wxSTC_MARKNUM_FOLDER,		wxSTC_MARK_DOTDOTDOT, Цвет.wxBLACK, Цвет.wxBLACK);
		MarkerDefine (wxSTC_MARKNUM_FOLDEROPEN,	wxSTC_MARK_ARROWDOWN, Цвет.wxBLACK, Цвет.wxBLACK);
		MarkerDefine (wxSTC_MARKNUM_FOLDERSUB,	 wxSTC_MARK_EMPTY,	 Цвет.wxBLACK, Цвет.wxBLACK);
		MarkerDefine (wxSTC_MARKNUM_FOLDEREND,	 wxSTC_MARK_DOTDOTDOT, Цвет.wxBLACK, Цвет.wxWHITE);
		MarkerDefine (wxSTC_MARKNUM_FOLDEROPENMID, wxSTC_MARK_ARROWDOWN, Цвет.wxBLACK, Цвет.wxWHITE);
		MarkerDefine (wxSTC_MARKNUM_FOLDERMIDTAIL, wxSTC_MARK_EMPTY,	 Цвет.wxBLACK, Цвет.wxBLACK);
		MarkerDefine (wxSTC_MARKNUM_FOLDERTAIL,	wxSTC_MARK_EMPTY,	 Цвет.wxBLACK, Цвет.wxBLACK);

		// miscelaneous
		m_LineNrMargin = TextWidth (wxSTC_STYLE_LINENUMBER, "_999999");
		m_FoldingMargin = 16;
		CmdKeyClear (wxSTC_KEY_TAB, 0); // this is done by the меню accelerator key
		LayoutCache (wxSTC_CACHE_PAGE);

		// common
		EVT_SIZE (                        &OnSize);
		// edit
		EVT_MENU (MenuIDs.wxID_CLEAR,     &OnEditClear);
		EVT_MENU (MenuIDs.wxID_CUT,       &OnEditCut);
		EVT_MENU (MenuIDs.wxID_COPY,      &OnEditCopy);
		EVT_MENU (MenuIDs.wxID_PASTE,     &OnEditPaste);
		EVT_MENU (myID_INDENTINC,         &OnEditIndentInc);
		EVT_MENU (myID_INDENTRED,         &OnEditIndentRed);
		EVT_MENU (MenuIDs.wxID_SELECTALL, &OnEditSelectAll);
		EVT_MENU (myID_SELECTLINE,        &OnEditSelectLine);
		EVT_MENU (MenuIDs.wxID_REDO,      &OnEditRedo);
		EVT_MENU (MenuIDs.wxID_UNDO,      &OnEditUndo);
		// find
		EVT_MENU (MenuIDs.wxID_FIND,      &OnFind);
		EVT_MENU (myID_FINDNEXT,          &OnFindNext);
		EVT_MENU (myID_REPLACE,           &OnReplace);
		EVT_MENU (myID_REPLACENEXT,       &OnReplaceNext);
		EVT_MENU (myID_BRACEMATCH,        &OnBraceMatch);
		EVT_MENU (myID_GOTO,              &OnGoto);
		// view
		EVT_MENU_RANGE (myID_HILIGHTFIRST, myID_HILIGHTLAST,
		                                  &OnHilightLang);
		EVT_MENU (myID_DISPLAYEOL,        &OnDisplayEOL);
		EVT_MENU (myID_INDENTGUIDE,       &OnIndentGuide);
		EVT_MENU (myID_LINENUMBER,        &OnLineNumber);
		EVT_MENU (myID_LONGLINEON,        &OnLongLineOn);
		EVT_MENU (myID_WHITESPACE,        &OnWhiteSpace);
		EVT_MENU (myID_FOLDTOGGLE,        &OnFoldToggle);
		EVT_MENU (myID_OVERTYPE,          &OnУстOverType);
		EVT_MENU (myID_READONLY,          &OnУстReadOnly);
		EVT_MENU (myID_WRAPMODEON,        &OnWrapmodeOn);
		EVT_MENU (myID_CHARSETANSI,       &OnUseCharset);
		EVT_MENU (myID_CHARSETMAC,        &OnUseCharset);
		// extra
		EVT_MENU (myID_CHANGELOWER,       &OnChangeCase);
		EVT_MENU (myID_CHANGEUPPER,       &OnChangeCase);
		EVT_MENU (myID_CONVERTCR,         &OnConvertEOL);
		EVT_MENU (myID_CONVERTCRLF,       &OnConvertEOL);
		EVT_MENU (myID_CONVERTLF,         &OnConvertEOL);
		// stc
		EVT_STC_MARGINCLICK (wxID_ANY,    cast(ДатчикСобытий)&OnMarginClick);
		EVT_STC_CHARADDED (wxID_ANY,      cast(ДатчикСобытий)&OnCharAdded);
	}

	//----------------------------------------------------------------------------
	// common event handlers
	public проц OnSize(Объект отправитель, Событие event )
	{
		цел x = РазмерКлиента.Ширь +
				(g_CommonPrefs.lineNumberEnable? m_LineNrMargin: 0) +
				(g_CommonPrefs.foldEnable? m_FoldingMargin: 0);
		if (x > 0) ScrollWidth = x;
		
		event.Skip();
	}

	// edit event handlers
	public проц OnEditRedo (Объект отправитель, Событие event)
	{
		if (!CanRedo()) return;

		Redo ();
	}

	public проц OnEditUndo (Объект отправитель, Событие event)
	{
		if (!CanUndo()) return;

		Undo ();
	}

	public проц OnEditClear (Объект отправитель, Событие event)
	{
		if (ReadOnly) return;

		Clear ();
	}

	public проц OnEditCut (Объект отправитель, Событие event)
	{
		if (ReadOnly || (SelectionEnd-SelectionStart <= 0)) return;

		Cut ();
	}

	public проц OnEditCopy (Объект отправитель, Событие event)
	{
		if (SelectionEnd-SelectionStart <= 0) return;

		Copy ();
	}

	public проц OnEditPaste (Объект отправитель, Событие event)
	{
		if (!CanPaste()) return;

		Paste ();
	}

	public проц OnFind (Объект отправитель, Событие event) {}

	public проц OnFindNext (Объект отправитель, Событие event) {}

	public проц OnReplace (Объект отправитель, Событие event) {}

	public проц OnReplaceNext (Объект отправитель, Событие event) {}

	public проц OnBraceMatch (Объект отправитель, Событие event)
	{
		цел min = CurrentPos;
		цел max = BraceMatch (min);
		if (max > (min+1))
		{
			BraceHighlight (min+1, max);
			УстSelection (min+1, max);
		}
		else
		{
			BraceBadLight (min);
		}
	}

	public проц OnGoto (Объект отправитель, Событие event) {}

	public проц OnEditIndentInc (Объект отправитель, Событие event)
	{
		CmdKeyExecute (wxSTC_CMD_TAB);
	}

	public проц OnEditIndentRed (Объект отправитель, Событие event)
	{
		CmdKeyExecute (wxSTC_CMD_DELETEBACK);
	}

	public проц OnEditSelectAll (Объект отправитель, Событие event)
	{
		УстSelection (0, TextLength);
	}

	public проц OnEditSelectLine (Объект отправитель, Событие event)
	{
		цел lineStart = PositionFromLine (CurrentLine);
		цел lineEnd = PositionFromLine (CurrentLine + 1);
		УстSelection (lineStart, lineEnd);
	}

	public проц OnHilightLang (Объект отправитель, Событие event)
	{
		InitializePrefs (g_LanguagePrefs [event.ИД - myID_HILIGHTFIRST].имя);
	}

	public проц OnDisplayEOL (Объект отправитель, Событие event)
	{
		ViewEOL = !ViewEOL;
	}

	public проц OnIndentGuide (Объект отправитель, Событие event)
	{
		IndentationGuides = !IndentationGuides;
	}

	public проц OnLineNumber (Объект отправитель, Событие event)
	{
		УстMarginWidth (m_LineNrID,	GetMarginWidth (m_LineNrID) == 0 ? m_LineNrMargin: 0);
	}

	public проц OnLongLineOn (Объект отправитель, Событие event)
	{
		EdgeMode = (EdgeMode == 0 ? wxSTC_EDGE_LINE: wxSTC_EDGE_NONE);
	}

	public проц OnWhiteSpace (Объект отправитель, Событие event)
	{
		ViewWhiteSpace = (ViewWhiteSpace == 0 ? wxSTC_WS_VISIBLEALWAYS: wxSTC_WS_INVISIBLE);
	}

	public проц OnFoldToggle (Объект отправитель, Событие event)
	{
		ToggleFold (GetFoldParent(CurrentLine));
	}

	public проц OnУстOverType (Объект отправитель, Событие event)
	{
		Overtype = !Overtype;
	}

	public проц OnУстReadOnly (Объект отправитель, Событие event)
	{
		ReadOnly = !ReadOnly;
	}

	public проц OnWrapmodeOn (Объект отправитель, Событие event)
	{
		WrapMode = (WrapMode == 0? wxSTC_WRAP_WORD: wxSTC_WRAP_NONE);
	}

	public проц OnUseCharset (Объект отправитель, Событие event)
	{
		цел Nr;
		цел charset = CodePage;
		switch (event.ИД)
		{
			case myID_CHARSETANSI: {charset = wxSTC_CHARSET_ANSI; break;}
			case myID_CHARSETMAC: {charset = wxSTC_CHARSET_ANSI; break;}
		}
		for (Nr = 0; Nr < wxSTC_STYLE_LASTPREDEFINED; Nr++)
		{
			StyleУстCharacterУст (Nr, charset);
		}
		CodePage = charset;
	}

	public проц OnChangeCase (Объект отправитель, Событие event)
	{
		switch (event.ИД)
		{
			case myID_CHANGELOWER:
				CmdKeyExecute (wxSTC_CMD_LOWERCASE);
				break;
			case myID_CHANGEUPPER:
				CmdKeyExecute (wxSTC_CMD_UPPERCASE);
				break;
		}
	}

	public проц OnConvertEOL (Объект отправитель, Событие event)
	{
		цел eolMode = EOLMode;
		switch (event.ИД)
		{
			case myID_CONVERTCR: { eolMode = wxSTC_EOL_CR; break;}
			case myID_CONVERTCRLF: { eolMode = wxSTC_EOL_CRLF; break;}
			case myID_CONVERTLF: { eolMode = wxSTC_EOL_LF; break;}
		}
		ConvertEOLs (eolMode);
		EOLMode (eolMode);
	}

	// misc
	public проц OnMarginClick (Объект отправитель, StyledTextEvent event)
	{
		if (event.Margin == 2)
		{
			цел lineClick = LineFromPosition (event.Позиция);
			цел levelClick = GetFoldLevel (lineClick);
			if ((levelClick & wxSTC_FOLDLEVELHEADERFLAG) > 0)
			{
				ToggleFold (lineClick);
			}
		}
	}

	public проц OnCharAdded (Объект отправитель, StyledTextEvent event)
	{
		char chr = cast(char)event.Key;
		цел currentLine = CurrentLine;
		// Change this if support for mac files with \r is needed
		if (chr == '\n')
		{
			цел lineInd = 0;
			if (currentLine > 0)
			{
				lineInd = GetLineIndentation(currentLine - 1);
			}
			if (lineInd == 0) return;
			
			УстLineIndentation (currentLine, lineInd);
			GotoPos(PositionFromLine (currentLine) + lineInd);
		}
	}

	public ткст DeterminePrefs (ткст filename)
	{
		//nested functions used to replace some wxSring functions.
		char[] AfterFirst(char[] стр, char ch)
		{
			цел idx = rfind(стр, ch);
	
			if(idx == -1) return "";
			else return стр[idx+1..$].dup;
		}

		char[] AfterLast(char[] стр, char ch)
		{
			цел idx = rfind(стр, ch);

			if(idx == -1) return стр.dup;
			else return стр[idx+1..$].dup;
		}

		char[] BeforeFirst(char[] стр, char ch)
		{
			цел idx = find(стр, ch);

			if(idx == -1) return стр.dup;
			else return стр[0..idx];
		}

		char[] BeforeLast(char[]стр, char ch)
		{
			цел idx = rfind(стр, ch);

			if(idx == -1) return "";
			else return стр[0..idx].dup;
		}
		//end nwsted functions

		Prefs.LanguageInfo curInfo;

		// determine language from filepatterns
		цел languageNr;
		for (languageNr = 0; languageNr < g_LanguagePrefs.length; languageNr++)
		{
			curInfo = g_LanguagePrefs [languageNr];
			char[] filepattern = curInfo.filepattern;
			filepattern = tolower(filepattern);
			while (!filepattern.length == 0)
			{
				char[] cur = BeforeFirst(filepattern, ';');
				if ((cur == filename) ||
					(cur == (BeforeLast(filename, '.') ~ ".*")) ||
					(cur == ("*." ~ AfterLast(filename, '.')))) {
					return curInfo.имя;
				}
				filepattern = AfterFirst(filepattern, ';');
			}
		}

		return "";
	}

	public бул InitializePrefs (ткст имя)
	{
		// initialize styles
		StyleClearAll();
		Prefs.LanguageInfo curInfo;

		// determine language
		бул found = false;
		цел languageNr;
		for (languageNr = 0; languageNr < g_LanguagePrefs.length; languageNr++)
		{
			curInfo = g_LanguagePrefs [languageNr];
			if (curInfo.имя == имя)
			{
				found = да;
				break;
			}
		}
		if (!found) return false;

		// set lexer and language
		Lexer (curInfo.lexer);
		m_language = curInfo;

		// set margin for line numbers
		УстMarginType (m_LineNrID, wxSTC_MARGIN_NUMBER);
		StyleУстForeground (wxSTC_STYLE_LINENUMBER, new Цвет ("DARK GREY"));
		StyleУстBackground (wxSTC_STYLE_LINENUMBER, Цвет.wxWHITE);
		УстMarginWidth (m_LineNrID, 0); // start out not visible

		// default fonts for all styles!
		цел Nr;
		for (Nr = 0; Nr < wxSTC_STYLE_LASTPREDEFINED; Nr++)
		{
			Шрифт шрифт = new Шрифт(10, СемействоШрифтов.wxMODERN, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL);
			StyleУстFont (Nr, шрифт);
		}

		// set common styles
		StyleУстForeground (wxSTC_STYLE_DEFAULT, new Цвет ("DARK GREY"));
		StyleУстForeground (wxSTC_STYLE_INDENTGUIDE, new Цвет ("DARK GREY"));

		
		// initialize settings
		if (g_CommonPrefs.syntaxEnable)
		{
			цел keywordnr = 0;
			for (Nr = 0; Nr < STYLE_TYPES_COUNT; Nr++)
			{
				if (curInfo.styles[Nr].тип == -1) continue;

				/+const+/ StyleInfo curType = g_StylePrefs [curInfo.styles[Nr].тип];
				Шрифт шрифт = new Шрифт(curType.fontsize, СемействоШрифтов.wxMODERN, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL,
							false, curType.fontname);
				StyleУстFont (Nr, шрифт);
				if (curType.foreground)
				{
					StyleУстForeground (Nr, new Цвет (curType.foreground));
				}
				if (curType.background)
				{
					StyleУстBackground (Nr, new Цвет (curType.background));
				}
				StyleУстBold (Nr, (curType.fontstyle & mySTC_STYLE_BOLD) > 0);
				StyleУстItalic (Nr, (curType.fontstyle & mySTC_STYLE_ITALIC) > 0);
				StyleУстUnderline (Nr, (curType.fontstyle & mySTC_STYLE_UNDERL) > 0);
				StyleУстVisible (Nr, (curType.fontstyle & mySTC_STYLE_HIDDEN) == 0);
				StyleУстCase (Nr, curType.lettercase);
				char[] pwords = curInfo.styles[Nr].words;
				if (pwords)
				{
					УстKeyWords (keywordnr, pwords);
					keywordnr += 1;
				}
			}
		}

		// set margin as unused
		УстMarginType (m_DividerID, wxSTC_MARGIN_SYMBOL);
		УстMarginWidth (m_DividerID, 0);
		УстMarginSensitive (m_DividerID, false);

		// folding
		УстMarginType (m_FoldingID, wxSTC_MARGIN_SYMBOL);
		УстMarginMask (m_FoldingID, wxSTC_MASK_FOLDERS);
		StyleУстBackground (m_FoldingID, Цвет.wxWHITE);
		УстMarginWidth (m_FoldingID, 0);
		УстMarginSensitive (m_FoldingID, false);
		if (g_CommonPrefs.foldEnable)
		{
			УстMarginWidth (m_FoldingID, curInfo.folds != 0? m_FoldingMargin: 0);
			УстMarginSensitive (m_FoldingID, curInfo.folds != 0);
			УстProperty ("fold", curInfo.folds != 0? "1": "0");
			УстProperty ("fold.comment", (curInfo.folds & mySTC_FOLD_COMMENT) > 0? "1": "0");
			УстProperty ("fold.compact", (curInfo.folds & mySTC_FOLD_COMPACT) > 0? "1": "0");
			УстProperty ("fold.preprocessor", (curInfo.folds & mySTC_FOLD_PREPROC) > 0? "1": "0");
			УстProperty ("fold.html", (curInfo.folds & mySTC_FOLD_HTML) > 0? "1": "0");
			УстProperty ("fold.html.preprocessor", (curInfo.folds & mySTC_FOLD_HTMLPREP) > 0? "1": "0");
			УстProperty ("fold.comment.python", (curInfo.folds & mySTC_FOLD_COMMENTPY) > 0? "1": "0");
			УстProperty ("fold.quotes.python", (curInfo.folds & mySTC_FOLD_QUOTESPY) > 0? "1": "0");
		}

		FoldФлаги = wxSTC_FOLDFLAG_LINEBEFORE_CONTRACTED | wxSTC_FOLDFLAG_LINEAFTER_CONTRACTED;

		// set spaces and indention
		TabWidth = 4;
		UseTabs = false;
		TabIndents = да;
		BackSpaceUnIndents = да;
		Indent = (g_CommonPrefs.indentEnable? 4: 0);

		// others
		ViewEOL = g_CommonPrefs.displayEOLEnable;
		IndentationGuides = g_CommonPrefs.indentGuideEnable;
		EdgeColumn = 80;
		EdgeMode = (g_CommonPrefs.longLineOnEnable? wxSTC_EDGE_LINE: wxSTC_EDGE_NONE);
		ViewWhiteSpace = (g_CommonPrefs.whiteSpaceEnable ? wxSTC_WS_VISIBLEALWAYS: wxSTC_WS_INVISIBLE);
		Overtype = g_CommonPrefs.overTypeInitial;
		ReadOnly = g_CommonPrefs.readOnlyInitial;
		WrapMode = (g_CommonPrefs.wrapModeInitial ? wxSTC_WRAP_WORD: wxSTC_WRAP_NONE);

		return да;
	}

	public бул ЗагрузиФайл ()
	{
		// get filname
		if (!m_filename)
		{
			FileDialog dlg = new FileDialog(this, "Open file", "", "",
					"Any file (*)|*", FileDialog.wxOPEN | FileDialog.wxFILE_MUST_EXIST | FileDialog.wxCHANGE_DIR);
			if (dlg.ShowModal() != wxID_OK) return false;
			
			m_filename = dlg.Path;
		}

		// load file
		return ЗагрузиФайл (m_filename);
	}

	public бул ЗагрузиФайл (ткст filename)
	{
		// load file in edit and clear undo
		if (!filename.length < 1) m_filename = filename;

		ClearAll ();
		StyledTextCtrl.ЗагрузиФайл(m_filename);
		EmptyUndoBuffer();

		// determine lexer language
		InitializePrefs (DeterminePrefs(getBaseName(m_filename)));

		return да;
	}

	public бул СохраниФайл ()
	{
		// return if no change
		if (!Modified()) return да;

		// get filname
		if (!m_filename)
		{
			FileDialog dlg = new FileDialog(this, "Save file", "", "", "Any file (*)|*",
					FileDialog.wxSAVE | FileDialog.wxOVERWRITE_PROMPT);
			if (dlg.ShowModal() != wxID_OK) return false;
			
			m_filename = dlg.Path;
		}

		// save file
		return СохраниФайл (m_filename);
	}

	public бул СохраниФайл (ткст filename)
	{
		// return if no change
		if (!Modified()) return да;

		return StyledTextCtrl.СохраниФайл(filename);
	}

	public бул Modified ()
	{
		// return modified state
		return (Modify && !ReadOnly);
	}

	//Properties
	public Prefs.LanguageInfo GetLanguageInfo () {return m_language;}
	public ткст GetFilename () {return m_filename;}
	public проц УстFilename (ткст filename) {m_filename = filename;}
}

//----------------------------------------------------------------------------
// EditProperties
//----------------------------------------------------------------------------

public class EditProperties : Dialog {

	public this (Edit edit, long стиль)
	{
		super(edit, wxID_ANY, "", вхДефПоз, вхДефРазм,
				стиль | Dialog.wxDEFAULT_DIALOG_STYLE | Dialog.wxRESIZE_BORDER);

		// sets the application title
		Титул ("Properties");
		ткст текст;

		// fullname
		БоксСайзер fullname = new БоксСайзер (Ориентация.wxHORIZONTAL);
		fullname.Добавь (10, 0);
		fullname.Добавь (new StaticText (this, wxID_ANY, "Full filename", вхДефПоз, Размер(80, -1)),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL);
		fullname.Добавь (new StaticText (this, wxID_ANY, edit.GetFilename()),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL);

		// текст info
		GridSizer textinfo = new GridSizer (4, 0, 2);
		textinfo.Добавь (new StaticText (this, wxID_ANY, "Language", вхДефПоз, Размер(80, -1)),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		textinfo.Добавь (new StaticText (this, wxID_ANY, edit.m_language.имя),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);
		textinfo.Добавь (new StaticText (this, wxID_ANY, "Lexer-ИД: ", вхДефПоз, Размер(80, -1)),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		текст = format("%d", edit.Lexer());
		textinfo.Добавь (new StaticText (this, wxID_ANY, текст),
					   0, Alignment.wxALIGN_RIGHT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);
		ткст EOLtype = "";
		switch (edit.EOLMode) {
			case StyledTextCtrl.wxSTC_EOL_CR: {EOLtype = "CR (Unix)"; break; }
			case StyledTextCtrl.wxSTC_EOL_CRLF: {EOLtype = "CRLF (Windows)"; break; }
			case StyledTextCtrl.wxSTC_EOL_LF: {EOLtype = "CR (Macintosh)"; break; }
		}
		textinfo.Добавь (new StaticText (this, wxID_ANY, "Line endings", вхДефПоз, Размер(80, -1)),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		textinfo.Добавь (new StaticText (this, wxID_ANY, EOLtype),
					   0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);

		// текст info box
		StaticBoxSizer textinfos = new StaticBoxSizer (
						 new StaticBox (this, wxID_ANY, "Informations"),
						 Ориентация.wxVERTICAL);
		textinfos.Добавь (textinfo, 0, Stretch.wxEXPAND);
		textinfos.Добавь (0, 6);

		// statistic
		GridSizer statistic = new GridSizer (4, 0, 2);
		statistic.Добавь (new StaticText (this, wxID_ANY, "Total строки", вхДефПоз, Размер(80, -1)),
						0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		текст = format("%d", edit.LineCount);
		statistic.Добавь (new StaticText (this, wxID_ANY, текст),
						0, Alignment.wxALIGN_RIGHT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);
		statistic.Добавь (new StaticText (this, wxID_ANY, "Total chars", вхДефПоз, Размер(80, -1)),
						0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		текст = format("%d", edit.TextLength);
		statistic.Добавь (new StaticText (this, wxID_ANY, текст),
						0, Alignment.wxALIGN_RIGHT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);
		statistic.Добавь (new StaticText (this, wxID_ANY, "Current line", вхДефПоз, Размер(80, -1)),
						0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		текст = format("%d", edit.CurrentLine);
		statistic.Добавь (new StaticText (this, wxID_ANY, текст),
						0, Alignment.wxALIGN_RIGHT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);
		statistic.Добавь (new StaticText (this, wxID_ANY, "Current поз", вхДефПоз, Размер(80, -1)),
						0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT, 4);
		текст = format("%d", edit.CurrentPos);
		statistic.Добавь (new StaticText (this, wxID_ANY, текст),
						0, Alignment.wxALIGN_RIGHT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxRIGHT, 4);

		// char/line statistics
		StaticBoxSizer statistics = new StaticBoxSizer (
						 new StaticBox (this, wxID_ANY, "Statistics"),
						 Ориентация.wxVERTICAL);
		statistics.Добавь (statistic, 0, Stretch.wxEXPAND);
		statistics.Добавь (0, 6);

		// total pane
		БоксСайзер totalpane = new БоксСайзер (Ориентация.wxVERTICAL);
		totalpane.Добавь (fullname, 0, Stretch.wxEXPAND | Direction.wxLEFT | Direction.wxRIGHT | Direction.wxTOP, 10);
		totalpane.Добавь (0, 6);
		totalpane.Добавь (textinfos, 0, Stretch.wxEXPAND | Direction.wxLEFT | Direction.wxRIGHT, 10);
		totalpane.Добавь (0, 10);
		totalpane.Добавь (statistics, 0, Stretch.wxEXPAND | Direction.wxLEFT | Direction.wxRIGHT, 10);
		totalpane.Добавь (0, 6);
		Кнопка okButton = new Кнопка (this, wxID_OK, "OK");
		okButton.УстДеф();
		totalpane.Добавь (okButton, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 10);

		УстСайзерИВстрой (totalpane, да);

		ShowModal();
	}

}

//----------------------------------------------------------------------------
// EditPrint
//----------------------------------------------------------------------------

public class EditPrint : Printout {

	private Edit edit;
	private цел printed;
	private Прямоугольник pageRect;
	private Прямоугольник printRect;

	public this (Edit edit, ткст title = "")
	{
		super(title);

		this.edit = edit;
	}

	// event handlers
	public бул OnPrintPage (цел page)
	{
		DC dc = Dc;
		if (!dc) return false;

		// scale DC
		PrintScaling (dc);

		// print page
		if (page == 1) printed = 0;
		printed = edit.FormatRange (1, printed, edit.Length,
				dc, dc, printRect, pageRect);

		return да;
	}

	public бул OnBeginDocument (цел startPage, цел endPage)
	{
		if (!Printout.OnBeginDocument (startPage, endPage))
		{
			return false;
		}
		return да;
	}

	public проц GetPageInfo (ref цел minPage, ref цел maxPage, ref цел selPageFrom, ref цел selPageTo)
	{
		// initialize values
		minPage = 0;
		maxPage = 0;
		selPageFrom = 0;
		selPageTo = 0;

		// scale DC if possible
		DC dc = Dc;
		if (!dc) return;
		PrintScaling (dc);

		// get print page informations and convert to printer pixels
		Размер ppiScr;
		GetPPIScreen (ppiScr.Ширь, ppiScr.Высь);
		Размер page = g_pageУстupData.paperSize;
		page.Ширь = cast(цел) (page.Ширь * ppiScr.Ширь / 25.4);
		page.Высь = cast(цел) (page.Высь * ppiScr.Высь / 25.4);
		pageRect = Прямоугольник (0,
		                      0,
		                      page.Ширь,
		                      page.Высь);

		// get margins informations and convert to printer pixels
		Точка тчк = g_pageУстupData.MarginTopLeft;
		цел left = тчк.X;
		цел top = тчк.Y;
		тчк = g_pageУстupData.MarginBottomRight;
		цел right = тчк.X;
		цел bottom = тчк.Y;

		top = cast(цел) (top * ppiScr.Высь / 25.4);
		bottom = cast(цел) (bottom * ppiScr.Высь / 25.4);
		left = cast(цел) (left * ppiScr.Ширь / 25.4);
		right = cast(цел) (right * ppiScr.Ширь / 25.4);

		printRect = Прямоугольник (left,
		                       top,
		                       page.Ширь - (left + right),
		                       page.Высь - (top + bottom));

		// count страницы
		while (HasPage (maxPage))
		{
			printed = edit.FormatRange (0, printed, edit.Length,
					dc, dc, printRect, pageRect);
			maxPage += 1;
		}
		if (maxPage > 0) minPage = 1;
		selPageFrom = minPage;
		selPageTo = maxPage;
	}

	// print functions
	public бул HasPage (цел page)
	{
		return (printed < edit.Length);
	}

	public бул PrintScaling (DC dc)
	{
		// check for dc, return if none
		if (!dc) return false;

		// get printer and screen sizing values
		Размер ppiScr;
		GetPPIScreen (ppiScr.Ширь, ppiScr.Высь);
		if (ppiScr.Ширь == 0) 
		{ 
			// most possible guess 96 dpi
			ppiScr.Ширь = 96;
			ppiScr.Высь = 96;
		}
		Размер ppiPrt;
		GetPPIPrinter (ppiPrt.Ширь, ppiPrt.Высь);
		if (ppiPrt.Ширь == 0)
		{
			// scaling factor to 1
			ppiPrt.Ширь = ppiScr.Ширь;
			ppiPrt.Высь = ppiScr.Высь;
		}
		Размер dcSize = dc.Размер;
		Размер pageSize;
		GetPageSizePixels (pageSize.Ширь, pageSize.Высь);

		// set user scale
		float scale_x = cast(float)(ppiPrt.Ширь * dcSize.Ширь) /
						cast(float)(ppiScr.Ширь * pageSize.Ширь);
		float scale_y = cast(float)(ppiPrt.Высь * dcSize.Высь) /
						cast(float)(ppiScr.Высь * pageSize.Высь);
		dc.УстUserScale (scale_x, scale_y);

		return да;
	}
}
