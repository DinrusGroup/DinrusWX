//-----------------------------------------------------------------------------
// wxD - Шрифт.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Шрифт.cs
//
/// The wxFont wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Шрифт.d,v 1.12 2009/01/13 22:18:51 afb Exp $
//-----------------------------------------------------------------------------

module wx.Шрифт;
public import wx.common;
public import wx.GDIObject;

	// Шрифт encodings - taken from wx/fontenc.h
	// Author: Vadim Zeitlin, (C) Vadim Zeitlin
	public enum FontEncoding
	{
		wxFONTENCODING_SYSTEM = -1,     // system default
		wxFONTENCODING_DEFAULT,         // current default encoding

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
		wxFONTENCODING_CP855,               // another cyrillic encoding
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

		wxFONTENCODING_UTF7,                // UTF-7 Unicode encoding
		wxFONTENCODING_UTF8,                // UTF-8 Unicode encoding

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

	public enum FontFamily
	{
		// Текст шрифт families
		wxDEFAULT    = 70,
		wxDECORATIVE,
		wxROMAN,
		wxSCRIPT,
		wxSWISS,
		wxMODERN,
		wxTELETYPE,  
		wxMAX,
        
		// Proportional or Fixed ширина fonts (not yet used)
		wxVARIABLE   = 80,
		wxFIXED,
        
		wxNORMAL     = 90,
		wxLIGHT,
		wxBOLD,
		// Also wxNORMAL for normal (non-italic текст)
		wxITALIC,
		wxSLANT
	}

	public enum FontWeight
	{
		wxNORMAL = 90,
		wxLIGHT,
		wxBOLD,
		wxMAX
	}

	public enum FontStyle
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
		static extern (C)        ЦУк wxFont_NORMAL_FONT();
		static extern (C)        ЦУк wxFont_SMALL_FONT();
		static extern (C)        ЦУк wxFont_ITALIC_FONT();
		static extern (C)        ЦУк wxFont_SWISS_FONT();
		static extern (C) ЦУк wxNullFont_Get();

		static extern (C)        ЦУк wxFont_ctorDef();
		static extern (C)        ЦУк wxFont_ctor(цел pointSize, цел family, цел стиль, цел weight, бул underline, ткст faceName, FontEncoding encoding);
		static extern (C) проц   wxFont_dtor(ЦУк сам);
		static extern (C) бул   wxFont_Ok(ЦУк сам);
		static extern (C) цел    wxFont_GetPointSize(ЦУк сам);
		static extern (C) цел    wxFont_GetFamily(ЦУк сам);
		static extern (C) цел    wxFont_GetStyle(ЦУк сам);
		static extern (C) цел    wxFont_GetWeight(ЦУк сам);
		static extern (C) бул   wxFont_GetUnderlined(ЦУк сам);
		static extern (C) ЦУк wxFont_GetFaceName(ЦУк сам);
		static extern (C) цел    wxFont_GetEncoding(ЦУк сам);
		static extern (C)        ЦУк wxFont_GetNativeFontInfo(ЦУк сам);
		static extern (C) бул   wxFont_IsFixedWidth(ЦУк сам);
		static extern (C) ЦУк wxFont_GetNativeFontInfoDesc(ЦУк сам);
		static extern (C) ЦУк wxFont_GetNativeFontInfoUserDesc(ЦУк сам);
		static extern (C) проц   wxFont_SetPointSize(ЦУк сам, цел pointSize);
		static extern (C) проц   wxFont_SetFamily(ЦУк сам, цел family);
		static extern (C) проц   wxFont_SetStyle(ЦУк сам, цел стиль);
		static extern (C) проц   wxFont_SetWeight(ЦУк сам, цел weight);
		static extern (C) проц   wxFont_SetFaceName(ЦУк сам, ткст faceName);
		static extern (C) проц   wxFont_SetUnderlined(ЦУк сам, бул underlined);
		static extern (C) проц   wxFont_SetEncoding(ЦУк сам, цел encoding);
		static extern (C) проц   wxFont_SetNativeFontInfoUserDesc(ЦУк сам, ЦУк info);
		static extern (C) ЦУк wxFont_GetFamilyString(ЦУк сам);
		static extern (C) ЦУк wxFont_GetStyleString(ЦУк сам);
		static extern (C) ЦУк wxFont_GetWeightString(ЦУк сам);
		static extern (C) проц   wxFont_SetNoAntiAliasing(ЦУк сам, бул no);
		static extern (C) бул   wxFont_GetNoAntiAliasing(ЦУк сам);
		static extern (C) цел    wxFont_GetDefaultEncoding();
		static extern (C) проц   wxFont_SetDefaultEncoding(цел encoding);
	
		static extern (C) ЦУк wxFont_New(ткст strNativeFontDesc);
		//! \endcond

		//---------------------------------------------------------------------

	alias Шрифт wxFont;
	public class Шрифт : GDIObject, ICloneable
	{
		// in wxWidgets 2.8 fonts are dynamic, and crash if accessed too early
		public static Шрифт wxNORMAL_FONT() { return new Шрифт(wxFont_NORMAL_FONT()); }
		public static Шрифт wxSMALL_FONT()  { return new Шрифт(wxFont_SMALL_FONT()); }
		public static Шрифт wxITALIC_FONT() { return new Шрифт(wxFont_ITALIC_FONT()); }
		public static Шрифт wxSWISS_FONT()  { return new Шрифт(wxFont_SWISS_FONT()); }
		public static Шрифт wxNullFont;

/+
		override public проц Dispose()
		{
			if (this !== wxNORMAL_FONT
			&&  this !== wxSMALL_FONT
			&&  this !== wxITALIC_FONT
			&&  this !== wxSWISS_FONT) {
				super.Dispose();
			}
		}
+/
		//---------------------------------------------------------------------

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		public this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
			{ this(wxFont_ctorDef(), да); }

		public this(цел pointSize, FontFamily family, FontStyle стиль, FontWeight weight, бул underline = нет, ткст face = "", FontEncoding encoding = FontEncoding.wxFONTENCODING_DEFAULT)
			{ this(wxFont_ctor(pointSize, cast(цел)family, cast(цел)стиль, cast(цел)weight, underline, face, encoding), да); }
			
		~this()
		{
			Dispose();
		}

		//---------------------------------------------------------------------

		public цел PointSize() { return wxFont_GetPointSize(шхобъ); }
		public проц PointSize(цел значение) { wxFont_SetPointSize(шхобъ, значение); }

		public FontFamily Family() { return cast(FontFamily)wxFont_GetFamily(шхобъ); }
		public проц Family(FontFamily значение) { wxFont_SetFamily(шхобъ, cast(цел)значение); }

		public FontStyle Style() { return cast(FontStyle)wxFont_GetStyle(шхобъ); }
		public проц Style(FontStyle значение) { wxFont_SetStyle(шхобъ, cast(цел)значение); }

		public FontEncoding Encoding() { return cast(FontEncoding)wxFont_GetEncoding(шхобъ); }
		public проц Encoding(FontEncoding значение) { wxFont_SetEncoding(шхобъ, cast(цел)значение); }

		public FontWeight Weight() { return cast(FontWeight)wxFont_GetWeight(шхобъ); }
		public проц Weight(FontWeight значение) { wxFont_SetWeight(шхобъ, cast(цел)значение); }

		public бул Underlined() { return wxFont_GetUnderlined(шхобъ); }
		public проц Underlined(бул значение) { wxFont_SetUnderlined(шхобъ, значение); }

		public ткст FaceName() { return cast(ткст) new wxString(wxFont_GetFaceName(шхобъ), да); }
		public проц FaceName(ткст значение) { wxFont_SetFaceName(шхобъ, значение); }
	
		public ткст FamilyString() { return cast(ткст) new wxString(wxFont_GetFamilyString(шхобъ), да); }
	
		public ткст StyleString() { return cast(ткст) new wxString(wxFont_GetStyleString(шхобъ), да); }
	
		public ткст WeightString() { return cast(ткст) new wxString(wxFont_GetStyleString(шхобъ), да); }
	
		public бул IsFixedWidth() { return wxFont_IsFixedWidth(шхобъ); }
	
		public бул Ок() { return wxFont_Ok(шхобъ); }
	
		public ЦУк NativeFontInfo() { return wxFont_GetNativeFontInfo(шхобъ); }
	
		public ткст NativeFontInfoUserDesc() { return cast(ткст) new wxString(wxFont_GetNativeFontInfoUserDesc(шхобъ), да); }
	
		public ткст NativeFontInfoDesc() { return cast(ткст) new wxString(wxFont_GetNativeFontInfoDesc(шхобъ), да); }
	
		public static Шрифт Нов(ткст strNativeFontDesc)
		{
			return new Шрифт(wxFont_New(strNativeFontDesc));
		}

		//---------------------------------------------------------------------

		// Implement ICloneable to provide instance copy
		public Объект Clone()
		{
			return new Шрифт(this);
		}

		// Constructor that copies шрифт passed in
		public this(Шрифт other) 
		{
			this(other.PointSize,other.Family,other.Style,other.Weight,other.Underlined,other.FaceName,other.Encoding);
		}

		public static wxObject Нов(ЦУк ptr) { return new Шрифт(ptr); }
	}
