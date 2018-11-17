
module wx.Font;
public import wx.common;
public import wx.GDIObject;

	// Шрифт encodings - taken from wx/fontenc.h
	// Author: Vadim Zeitlin, (C) Vadim Zeitlin
	public enum FontEncoding
	{
		wxFONTENCODING_SYSTEM = -1,     // system default
		wxFONTENCODING_DEFAULT,         // current default кодировка

		// ISO8859 standard defines a number of single-byte charsets
		wxFONTENCODING_ISO8859_1,           // West European (Latin1)
		wxFONTENCODING_ISO8859_2,           // Central and East European (Latin2)
		wxFONTENCODING_ISO8859_3,           // Esperanto (Latin3)
		wxFONTENCODING_ISO8859_4,           // Baltic (old) (Latin4)
		wxFONTENCODING_ISO8859_5,           // Cyrillic
		wxFONTENCODING_ISO8859_6,           // Arabic
		wxFONTENCODING_ISO8859_7,           // Greek
		wxFONTENCODING_ISO8859_8,           // Hebrew
		wxFONTENCODING_ISO8859_9,           // Turkish (Latin5)
		wxFONTENCODING_ISO8859_10,          // Variation of Latin4 (Latin6)
		wxFONTENCODING_ISO8859_11,          // Thai
		wxFONTENCODING_ISO8859_12,          // doesn't exist currently, but put it
		// here anyhow to make all ISO8859
		// consecutive numbers
		wxFONTENCODING_ISO8859_13,          // Baltic (Latin7)
		wxFONTENCODING_ISO8859_14,          // Latin8
		wxFONTENCODING_ISO8859_15,          // Latin9 (a.k.a. Latin0, includes euro)
		wxFONTENCODING_ISO8859_MAX,

		// Cyrillic charset soup (see http://czyborra.com/charsets/cyrillic.html)
		wxFONTENCODING_KOI8,                // we don't support any of KOI8 variants
		wxFONTENCODING_ALTERNATIVE,         // same as MS-DOS CP866
		wxFONTENCODING_BULGARIAN,           // used under Linux in Bulgaria
		// what would we do without Microsoft? They have their own encodings
		// for DOS
		wxFONTENCODING_CP437,               // original MS-DOS codepage
		wxFONTENCODING_CP850,               // CP437 merged with Latin1
		wxFONTENCODING_CP852,               // CP437 merged with Latin2
		wxFONTENCODING_CP855,               // another cyrillic кодировка
		wxFONTENCODING_CP866,               // and another one
		// and for Windows
		wxFONTENCODING_CP874,               // WinThai
		wxFONTENCODING_CP932,               // Japanese (shift-JIS)
		wxFONTENCODING_CP936,               // Chinese simplified (GB)
		wxFONTENCODING_CP949,               // Korean (Hangul charset)
		wxFONTENCODING_CP950,               // Chinese (traditional - Big5)
		wxFONTENCODING_CP1250,              // WinLatin2
		wxFONTENCODING_CP1251,              // WinCyrillic
		wxFONTENCODING_CP1252,              // WinLatin1
		wxFONTENCODING_CP1253,              // WinGreek (8859-7)
		wxFONTENCODING_CP1254,              // WinTurkish
		wxFONTENCODING_CP1255,              // WinHebrew
		wxFONTENCODING_CP1256,              // WinArabic
		wxFONTENCODING_CP1257,              // WinBaltic (same as Latin 7)
		wxFONTENCODING_CP12_MAX,

		wxFONTENCODING_UTF7,                // UTF-7 Unicode кодировка
		wxFONTENCODING_UTF8,                // UTF-8 Unicode кодировка

		// Far Eastern encodings
		// Chinese
		wxFONTENCODING_GB2312 = wxFONTENCODING_CP936,       // Simplified Chinese
		wxFONTENCODING_BIG5 = wxFONTENCODING_CP950,         // Traditional Chinese

		// Japanese (see http://zsigri.tripod.com/fontboard/cjk/jis.html)
		wxFONTENCODING_Shift_JIS = wxFONTENCODING_CP932,    // Shift JIS
		wxFONTENCODING_EUC_JP,                              // Extended Unix Codepage for Japanese

		wxFONTENCODING_UNICODE,         // Unicode - currently used only by
		// wxEncodingConverter class

		wxFONTENCODING_MAX
	}

	public enum СемействоШрифтов
	{
		// Text шрифт families
		wxDEFAULT    = 70,
		wxDECORATIVE,
		wxROMAN,
		wxSCRIPT,
		wxSWISS,
		wxMODERN,
		wxTELETYPE,  
		wxMAX,
        
		// Proportional or Fixed ширь fonts (not yet used)
		wxVARIABLE   = 80,
		wxFIXED,
        
		wxNORMAL     = 90,
		wxLIGHT,
		wxBOLD,
		// Also wxNORMAL for normal (non-italic текст)
		wxITALIC,
		wxSLANT
	}

	public enum ВесШрифта
	{
		wxNORMAL = 90,
		wxLIGHT,
		wxBOLD,
		wxMAX
	}

	public enum СтильШрифта
	{
		wxNORMAL = 90,
		wxITALIC = 93,
		wxSLANT  = 94,
		wxMAX
	}
	
	public enum FontFlag
	{
		wxFONTFLAG_DEFAULT          = 0,

		wxFONTFLAG_ITALIC           = 1 << 0,
		wxFONTFLAG_SLANT            = 1 << 1,

		wxFONTFLAG_LIGHT            = 1 << 2,
		wxFONTFLAG_BOLD             = 1 << 3,

		wxFONTFLAG_ANTIALIASED      = 1 << 4,
		wxFONTFLAG_NOT_ANTIALIASED  = 1 << 5,

		wxFONTFLAG_UNDERLINED       = 1 << 6,
		wxFONTFLAG_STRIKETHROUGH    = 1 << 7,

		wxFONTFLAG_MASK = wxFONTFLAG_ITALIC             |
			wxFONTFLAG_SLANT              |
			wxFONTFLAG_LIGHT              |
			wxFONTFLAG_BOLD               |
			wxFONTFLAG_ANTIALIASED        |
			wxFONTFLAG_NOT_ANTIALIASED    |
			wxFONTFLAG_UNDERLINED         |
			wxFONTFLAG_STRIKETHROUGH
	}

		//! \cond EXTERN
		static extern (C)        IntPtr wxFont_NORMAL_FONT();
		static extern (C)        IntPtr wxFont_SMALL_FONT();
		static extern (C)        IntPtr wxFont_ITALIC_FONT();
		static extern (C)        IntPtr wxFont_SWISS_FONT();
		static extern (C) IntPtr wxNullFont_Get();

		static extern (C)        IntPtr wxFont_ctorDef();
		static extern (C)        IntPtr wxFont_ctor(цел размТочки, цел семейство, цел стиль, цел weight, бул underline, ткст faceName, FontEncoding кодировка);
		static extern (C) проц   wxFont_dtor(IntPtr сам);
		static extern (C) бул   wxFont_Ok(IntPtr сам);
		static extern (C) цел    wxFont_GetPointSize(IntPtr сам);
		static extern (C) цел    wxFont_GetFamily(IntPtr сам);
		static extern (C) цел    wxFont_GetStyle(IntPtr сам);
		static extern (C) цел    wxFont_GetWeight(IntPtr сам);
		static extern (C) бул   wxFont_GetUnderlined(IntPtr сам);
		static extern (C) IntPtr wxFont_GetFaceName(IntPtr сам);
		static extern (C) цел    wxFont_GetEncoding(IntPtr сам);
		static extern (C)        IntPtr wxFont_GetNativeFontInfo(IntPtr сам);
		static extern (C) бул   wxFont_IsFixedWidth(IntPtr сам);
		static extern (C) IntPtr wxFont_GetNativeFontInfoDesc(IntPtr сам);
		static extern (C) IntPtr wxFont_GetNativeFontInfoUserDesc(IntPtr сам);
		static extern (C) проц   wxFont_SetPointSize(IntPtr сам, цел размТочки);
		static extern (C) проц   wxFont_SetFamily(IntPtr сам, цел семейство);
		static extern (C) проц   wxFont_SetStyle(IntPtr сам, цел стиль);
		static extern (C) проц   wxFont_SetWeight(IntPtr сам, цел weight);
		static extern (C) проц   wxFont_SetFaceName(IntPtr сам, ткст faceName);
		static extern (C) проц   wxFont_SetUnderlined(IntPtr сам, бул underlined);
		static extern (C) проц   wxFont_SetEncoding(IntPtr сам, цел кодировка);
		static extern (C) проц   wxFont_SetNativeFontInfoUserDesc(IntPtr сам, IntPtr info);
		static extern (C) IntPtr wxFont_GetFamilyString(IntPtr сам);
		static extern (C) IntPtr wxFont_GetStyleString(IntPtr сам);
		static extern (C) IntPtr wxFont_GetWeightString(IntPtr сам);
		static extern (C) проц   wxFont_SetNoAntiAliasing(IntPtr сам, бул no);
		static extern (C) бул   wxFont_GetNoAntiAliasing(IntPtr сам);
		static extern (C) цел    wxFont_GetDefaultEncoding();
		static extern (C) проц   wxFont_SetDefaultEncoding(цел кодировка);
	
		static extern (C) IntPtr wxFont_New(ткст strNativeFontDesc);
		//! \endcond

		//---------------------------------------------------------------------

	alias Шрифт wxFont;
	public class Шрифт : GDIObject, ICloneable
	{
		// in wxWidgets 2.8 fonts are dynamic, and crash if accessed too early
		public static Шрифт wxNORMAL_FONT();
		public static Шрифт wxSMALL_FONT()  ;
		public static Шрифт wxITALIC_FONT() ;
		public static Шрифт wxSWISS_FONT() ;
		public static Шрифт wxNullFont;

		//override public проц Dispose();
		public this(IntPtr wxobj);
		public this(IntPtr wxobj, бул memOwn);
		public this();
		public this(цел размТочки, СемействоШрифтов семейство, СтильШрифта стиль, ВесШрифта weight, бул underline = false, ткст face = "", FontEncoding кодировка = FontEncoding.wxFONTENCODING_DEFAULT);
		~this();
		public цел РазмТочки() ;
		public проц РазмТочки(цел значение) ;
		public СемействоШрифтов Семейство() ;
		public проц Семейство(СемействоШрифтов значение) ;
		public СтильШрифта Стиль() ;
		public проц Стиль(СтильШрифта значение) ;
		public FontEncoding Кодировка() ;
		public проц Кодировка(FontEncoding значение) ;
		public ВесШрифта Вес() ;
		public проц Вес(ВесШрифта значение) ;
		public бул Underlined() ;
		public проц Underlined(бул значение) ;
		public ткст FaceName() ;
		public проц FaceName(ткст значение) ;
		public ткст FamilyString() ;
		public ткст StyleString() ;
		public ткст WeightString() ;
		public бул IsFixedWidth() ;
		public бул Ок();
		public IntPtr NativeFontInfo();
		public ткст NativeFontInfoUserDesc() ;
		public ткст NativeFontInfoDesc();
		public static Шрифт Нов(ткст strNativeFontDesc);
		public Объект Clone();
		public this(Шрифт other) ;
		public static wxObject Нов(IntPtr ptr) ;
	}
