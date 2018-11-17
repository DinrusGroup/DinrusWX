//-----------------------------------------------------------------------------
// wxD/Samples - Edit.d
//
// A wxD version of the wxWidgets "contrib/stc/edit" sample.
//
// (C) 2003 Wyo
// (C) 2007
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Prefs.d,v 1.4 2008/09/26 11:37:06 afb Exp $
//-----------------------------------------------------------------------------

module Prefs;

import wx.wx;

import defsext;    // Additional definitions

//============================================================================
// declarations
//============================================================================

// general стиль types
const цел mySTC_TYPE_DEFAULT = 0;

const цел mySTC_TYPE_WORD1 = 1;
const цел mySTC_TYPE_WORD2 = 2;
const цел mySTC_TYPE_WORD3 = 3;
const цел mySTC_TYPE_WORD4 = 4;
const цел mySTC_TYPE_WORD5 = 5;
const цел mySTC_TYPE_WORD6 = 6;

const цел mySTC_TYPE_COMMENT = 7;
const цел mySTC_TYPE_COMMENT_DOC = 8;
const цел mySTC_TYPE_COMMENT_LINE = 9;
const цел mySTC_TYPE_COMMENT_SPECIAL = 10;

const цел mySTC_TYPE_CHARACTER = 11;
const цел mySTC_TYPE_CHARACTER_EOL = 12;
const цел mySTC_TYPE_STRING = 13;
const цел mySTC_TYPE_STRING_EOL = 14;

const цел mySTC_TYPE_DELIMITER = 15;

const цел mySTC_TYPE_PUNCTUATION = 16;

const цел mySTC_TYPE_OPERATOR = 17;

const цел mySTC_TYPE_BRACE = 18;

const цел mySTC_TYPE_COMMAND = 19;
const цел mySTC_TYPE_IDENTIFIER = 20;
const цел mySTC_TYPE_LABEL = 21;
const цел mySTC_TYPE_NUMBER = 22;
const цел mySTC_TYPE_PARAMETER = 23;
const цел mySTC_TYPE_REGEX = 24;
const цел mySTC_TYPE_UUID = 25;
const цел mySTC_TYPE_VALUE = 26;

const цел mySTC_TYPE_PREPROCESSOR = 27;
const цел mySTC_TYPE_SCRIPT = 28;

const цел mySTC_TYPE_ERROR = 29;

//----------------------------------------------------------------------------
// стиль bits types
const цел mySTC_STYLE_BOLD = 1;
const цел mySTC_STYLE_ITALIC = 2;
const цел mySTC_STYLE_UNDERL = 4;
const цел mySTC_STYLE_HIDDEN = 8;

//----------------------------------------------------------------------------
// general folding types
const цел mySTC_FOLD_COMMENT = 1;
const цел mySTC_FOLD_COMPACT = 2;
const цел mySTC_FOLD_PREPROC = 4;

const цел mySTC_FOLD_HTML = 16;
const цел mySTC_FOLD_HTMLPREP = 32;

const цел mySTC_FOLD_COMMENTPY = 64;
const цел mySTC_FOLD_QUOTESPY = 128;

//----------------------------------------------------------------------------
// флаги
const цел mySTC_FLAG_WRAPMODE = 16;

//----------------------------------------------------------------------------
// CommonInfo

struct CommonInfo {
    // editor functionality prefs
    бул syntaxEnable;
    бул foldEnable;
    бул indentEnable;
    // display defaults prefs
    бул readOnlyInitial;
    бул overTypeInitial;
    бул wrapModeInitial;
    бул displayEOLEnable;
    бул indentGuideEnable;
    бул lineNumberEnable;
    бул longLineOnEnable;
    бул whiteSpaceEnable;
}

//----------------------------------------------------------------------------
// LanguageInfo

struct LanguageInfo {
    ткст имя;
    ткст filepattern;
    цел lexer;
    struct стиль {
        цел тип;
        ткст words;
    }
    стиль[] styles;
    цел folds;
}

//----------------------------------------------------------------------------
// StyleInfo
struct StyleInfo {
    ткст имя;
    ткст foreground;
    ткст background;
    ткст fontname;
    цел fontsize;
    цел fontstyle;
    цел lettercase;
}

//============================================================================
// declarations
//============================================================================

//----------------------------------------------------------------------------
// language types
const CommonInfo g_CommonPrefs = {
    // editor functionality prefs
    да,  // syntaxEnable
    да,  // foldEnable
    да,  // indentEnable
    // display defaults prefs
    false, // overTypeInitial
    false, // readOnlyInitial
    false,  // wrapModeInitial
    false, // displayEOLEnable
    false, // IndentGuideEnable
    да,  // lineNumberEnable
    false, // longLineOnEnable
    false, // whiteSpaceEnable
};

//----------------------------------------------------------------------------
// keywordlists
// C++
const ткст CppWordlist1 =
    "asm auto бул break case catch char class const const_cast "
    "continue default delete do double dynamic_cast else enum explicit "
    "export extern false float for friend goto if inline цел long "
    "mutable namespace new operator private protected public register "
    "reinterpret_cast return short signed sizeof static static_cast "
    "struct switch template this throw да try typedef typeid "
    "typename union unsigned using virtual проц volatile wchar_t "
    "while";
const ткст CppWordlist2 =
    "file";
const ткст CppWordlist3 =
    "a addindex addtogroup anchor arg attention author b brief bug c "
    "class code дата def defgroup deprecated dontinclude e em endcode "
    "endhtmlonly endif endlatexonly endlink endverbatim enum example "
    "exception f$ f[ f] file fn hideinitializer htmlinclude "
    "htmlonly if рисунок include ingroup internal invariant interface "
    "latexonly li line link mainpage имя namespace nosubgrouping note "
    "overload p page par param post pre ref relates remarks return "
    "retval sa section see showinitializer since skip skipline struct "
    "subsection test throw todo typedef union until var verbatim "
    "verbinclude version warning weakgroup $ @ \"\" & < > # { }";

//D
const ткст DWordlist1 =
	"abstract alias align asm assert auto body бул	break byte case "
	"cast catch cdouble cent cfloat char class const continue creal "
	"dchar debug default delegate delete deprecated do double else "
	"enum export extern false final finally float for foreach "
	"foreach_reverse function goto idouble if ifloat import in "
	"inout цел interface invariant ireal is lazy long macro mixin "
	"module new null out override package pragma private protected "
	"public real ref return scope short static struct super switch "
	"synchronized template this throw да try typedef typeid typeof "
	"ubyte ucent бцел ulong union unittest ushort version проц "
	"volatile wchar while with";

// Python
const ткст PythonWordlist1 =
    "and assert break class continue def del elif else except exec "
    "finally for from global if import in is lambda None not or pass "
    "print raise return try while yield";
const ткст PythonWordlist2 =
    "ACCELERATORS ALT AUTO3STATE AUTOCHECKBOX AUTORADIOBUTTON BEGIN "
    "BITMAP BLOCK BUTTON CAPTION CHARACTERISTICS CHECKBOX CLASS "
    "COMBOBOX CONTROL CTEXT CURSOR DEFPUSHBUTTON DIALOG DIALOGEX "
    "DISCARDABLE EDITTEXT END EXSTYLE FONT GROUPBOX ICON LANGUAGE "
    "LISTBOX LTEXT MENU MENUEX MENUITEM MESSAGETABLE POPUP PUSHBUTTON "
    "RADIOBUTTON RCDATA RTEXT SCROLLBAR SEPARATOR SHIFT STATE3 "
    "STRINGTABLE STYLE TEXTINCLUDE VALUE VERSION VERSIONINFO VIRTKEY";

//----------------------------------------------------------------------------
// languages
const LanguageInfo g_LanguagePrefs [] = [
    // C++
    {"C++",
     "*.c;*.cc;*.cpp;*.cxx;*.cs;*.h;*.hh;*.hpp;*.hxx;*.sma",
     wxStyledTextCtrl.wxSTC_LEX_CPP,
     [{mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_COMMENT, null},
      {mySTC_TYPE_COMMENT_LINE, null},
      {mySTC_TYPE_COMMENT_DOC, null},
      {mySTC_TYPE_NUMBER, null},
      {mySTC_TYPE_WORD1, CppWordlist1}, // KEYWORDS
      {mySTC_TYPE_STRING, null},
      {mySTC_TYPE_CHARACTER, null},
      {mySTC_TYPE_UUID, null},
      {mySTC_TYPE_PREPROCESSOR, null},
      {mySTC_TYPE_OPERATOR, null},
      {mySTC_TYPE_IDENTIFIER, null},
      {mySTC_TYPE_STRING_EOL, null},
      {mySTC_TYPE_DEFAULT, null}, // VERBATIM
      {mySTC_TYPE_REGEX, null},
      {mySTC_TYPE_COMMENT_SPECIAL, null}, // DOXY
      {mySTC_TYPE_WORD2, CppWordlist2}, // EXTRA WORDS
      {mySTC_TYPE_WORD3, CppWordlist3}, // DOXY KEYWORDS
      {mySTC_TYPE_ERROR, null}, // KEYWORDS ERROR
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null}],
     mySTC_FOLD_COMMENT | mySTC_FOLD_COMPACT | mySTC_FOLD_PREPROC},
    // D
    {"D",
     "*.d;*.di",
     wxStyledTextCtrl.wxSTC_LEX_CPP,
     [{mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_COMMENT, null},
      {mySTC_TYPE_COMMENT_LINE, null},
      {mySTC_TYPE_COMMENT_DOC, null},
      {mySTC_TYPE_NUMBER, null},
      {mySTC_TYPE_WORD1, DWordlist1}, // KEYWORDS
      {mySTC_TYPE_STRING, null},
      {mySTC_TYPE_CHARACTER, null},
      {mySTC_TYPE_UUID, null},
      {mySTC_TYPE_PREPROCESSOR, null},
      {mySTC_TYPE_OPERATOR, null},
      {mySTC_TYPE_IDENTIFIER, null},
      {mySTC_TYPE_STRING_EOL, null},
      {mySTC_TYPE_DEFAULT, null}, // VERBATIM
      {mySTC_TYPE_REGEX, null},
      {mySTC_TYPE_COMMENT_SPECIAL, null}, // DOXY
      {mySTC_TYPE_WORD2, null}, // EXTRA WORDS
      {mySTC_TYPE_WORD3, null}, // DOXY KEYWORDS
      {mySTC_TYPE_ERROR, null}, // KEYWORDS ERROR
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null}],
     mySTC_FOLD_COMMENT | mySTC_FOLD_COMPACT | mySTC_FOLD_PREPROC},
    // Python
    {"Python",
     "*.py;*.pyw",
     wxStyledTextCtrl.wxSTC_LEX_PYTHON,
     [{mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_COMMENT_LINE, null},
      {mySTC_TYPE_NUMBER, null},
      {mySTC_TYPE_STRING, null},
      {mySTC_TYPE_CHARACTER, null},
      {mySTC_TYPE_WORD1, PythonWordlist1}, // KEYWORDS
      {mySTC_TYPE_DEFAULT, null}, // TRIPLE
      {mySTC_TYPE_DEFAULT, null}, // TRIPLEDOUBLE
      {mySTC_TYPE_DEFAULT, null}, // CLASSNAME
      {mySTC_TYPE_DEFAULT, PythonWordlist2}, // DEFNAME
      {mySTC_TYPE_OPERATOR, null},
      {mySTC_TYPE_IDENTIFIER, null},
      {mySTC_TYPE_DEFAULT, null}, // COMMENT_BLOCK
      {mySTC_TYPE_STRING_EOL, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null}],
     mySTC_FOLD_COMMENTPY | mySTC_FOLD_QUOTESPY},
    // * (any)
    {"<default>", //DEFAULT_LANGUAGE,
     "*.*",
     wxStyledTextCtrl.wxSTC_LEX_PROPERTIES,
     [{mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_DEFAULT, null},
      {mySTC_TYPE_DEFAULT, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null},
      {-1, null}],
     0},
    ];

//----------------------------------------------------------------------------
// стиль types
/+const+/ StyleInfo g_StylePrefs [] = [
    // mySTC_TYPE_DEFAULT
    {"Default",
     "BLACK", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_WORD1
    {"Keyword1",
     "BLUE", "WHITE",
     "", 10, mySTC_STYLE_BOLD, 0},

    // mySTC_TYPE_WORD2
    {"Keyword2",
     "DARK BLUE", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_WORD3
    {"Keyword3",
     "CORNFLOWER BLUE", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_WORD4
    {"Keyword4",
     "CYAN", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_WORD5
    {"Keyword5",
     "DARK GREY", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_WORD6
    {"Keyword6",
     "GREY", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_COMMENT
    {"Comment",
     "FOREST GREEN", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_COMMENT_DOC
    {"Comment (Doc)",
     "FOREST GREEN", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_COMMENT_LINE
    {"Comment line",
     "FOREST GREEN", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_COMMENT_SPECIAL
    {"Special comment",
     "FOREST GREEN", "WHITE",
     "", 10, mySTC_STYLE_ITALIC, 0},

    // mySTC_TYPE_CHARACTER
    {"Character",
     "KHAKI", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_CHARACTER_EOL
    {"Character (EOL)",
     "KHAKI", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_STRING
    {"String",
     "BROWN", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_STRING_EOL
    {"String (EOL)",
     "BROWN", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_DELIMITER
    {"Delimiter",
     "ORANGE", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_PUNCTUATION
    {"Punctuation",
     "ORANGE", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_OPERATOR
    {"Operator",
     "BLACK", "WHITE",
     "", 10, mySTC_STYLE_BOLD, 0},

    // mySTC_TYPE_BRACE
    {"Ярлык",
     "VIOLET", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_COMMAND
    {"Команда",
     "BLUE", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_IDENTIFIER
    {"Identifier",
     "BLACK", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_LABEL
    {"Ярлык",
     "VIOLET", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_NUMBER
    {"Number",
     "SIENNA", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_PARAMETER
    {"Parameter",
     "VIOLET", "WHITE",
     "", 10, mySTC_STYLE_ITALIC, 0},

    // mySTC_TYPE_REGEX
    {"Regular expression",
     "ORCHID", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_UUID
    {"UUID",
     "ORCHID", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_VALUE
    {"Value",
     "ORCHID", "WHITE",
     "", 10, mySTC_STYLE_ITALIC, 0},

    // mySTC_TYPE_PREPROCESSOR
    {"Preprocessor",
     "GREY", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_SCRIPT
    {"Script",
     "DARK GREY", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_ERROR
    {"Error",
     "RED", "WHITE",
     "", 10, 0, 0},

    // mySTC_TYPE_UNDEFINED
    {"Undefined",
     "ORANGE", "WHITE",
     "", 10, 0, 0}

    ];
