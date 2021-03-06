//-----------------------------------------------------------------------------
// wxD - Locale.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Locale.cs
//
/// The wxLocale wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Locale.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.Locale;
public import wx.common;
public import wx.Font;

public enum Language
{
    wxLANGUAGE_DEFAULT,
    wxLANGUAGE_UNKNOWN,

    wxLANGUAGE_ABKHAZIAN,
    wxLANGUAGE_AFAR,
    wxLANGUAGE_AFRIKAANS,
    wxLANGUAGE_ALBANIAN,
    wxLANGUAGE_AMHARIC,
    wxLANGUAGE_ARABIC,
    wxLANGUAGE_ARABIC_ALGERIA,
    wxLANGUAGE_ARABIC_BAHRAIN,
    wxLANGUAGE_ARABIC_EGYPT,
    wxLANGUAGE_ARABIC_IRAQ,
    wxLANGUAGE_ARABIC_JORDAN,
    wxLANGUAGE_ARABIC_KUWAIT,
    wxLANGUAGE_ARABIC_LEBANON,
    wxLANGUAGE_ARABIC_LIBYA,
    wxLANGUAGE_ARABIC_MOROCCO,
    wxLANGUAGE_ARABIC_OMAN,
    wxLANGUAGE_ARABIC_QATAR,
    wxLANGUAGE_ARABIC_SAUDI_ARABIA,
    wxLANGUAGE_ARABIC_SUDAN,
    wxLANGUAGE_ARABIC_SYRIA,
    wxLANGUAGE_ARABIC_TUNISIA,
    wxLANGUAGE_ARABIC_UAE,
    wxLANGUAGE_ARABIC_YEMEN,
    wxLANGUAGE_ARMENIAN,
    wxLANGUAGE_ASSAMESE,
    wxLANGUAGE_AYMARA,
    wxLANGUAGE_AZERI,
    wxLANGUAGE_AZERI_CYRILLIC,
    wxLANGUAGE_AZERI_LATIN,
    wxLANGUAGE_BASHKIR,
    wxLANGUAGE_BASQUE,
    wxLANGUAGE_BELARUSIAN,
    wxLANGUAGE_BENGALI,
    wxLANGUAGE_BHUTANI,
    wxLANGUAGE_BIHARI,
    wxLANGUAGE_BISLAMA,
    wxLANGUAGE_BRETON,
    wxLANGUAGE_BULGARIAN,
    wxLANGUAGE_BURMESE,
    wxLANGUAGE_CAMBODIAN,
    wxLANGUAGE_CATALAN,
    wxLANGUAGE_CHINESE,
    wxLANGUAGE_CHINESE_SIMPLIFIED,
    wxLANGUAGE_CHINESE_TRADITIONAL,
    wxLANGUAGE_CHINESE_HONGKONG,
    wxLANGUAGE_CHINESE_MACAU,
    wxLANGUAGE_CHINESE_SINGAPORE,
    wxLANGUAGE_CHINESE_TAIWAN,
    wxLANGUAGE_CORSICAN,
    wxLANGUAGE_CROATIAN,
    wxLANGUAGE_CZECH,
    wxLANGUAGE_DANISH,
    wxLANGUAGE_DUTCH,
    wxLANGUAGE_DUTCH_BELGIAN,
    wxLANGUAGE_ENGLISH,
    wxLANGUAGE_ENGLISH_UK,
    wxLANGUAGE_ENGLISH_US,
    wxLANGUAGE_ENGLISH_AUSTRALIA,
    wxLANGUAGE_ENGLISH_BELIZE,
    wxLANGUAGE_ENGLISH_BOTSWANA,
    wxLANGUAGE_ENGLISH_CANADA,
    wxLANGUAGE_ENGLISH_CARIBBEAN,
    wxLANGUAGE_ENGLISH_DENMARK,
    wxLANGUAGE_ENGLISH_EIRE,
    wxLANGUAGE_ENGLISH_JAMAICA,
    wxLANGUAGE_ENGLISH_NEW_ZEALAND,
    wxLANGUAGE_ENGLISH_PHILIPPINES,
    wxLANGUAGE_ENGLISH_SOUTH_AFRICA,
    wxLANGUAGE_ENGLISH_TRINIDAD,
    wxLANGUAGE_ENGLISH_ZIMBABWE,
    wxLANGUAGE_ESPERANTO,
    wxLANGUAGE_ESTONIAN,
    wxLANGUAGE_FAEROESE,
    wxLANGUAGE_FARSI,
    wxLANGUAGE_FIJI,
    wxLANGUAGE_FINNISH,
    wxLANGUAGE_FRENCH,
    wxLANGUAGE_FRENCH_BELGIAN,
    wxLANGUAGE_FRENCH_CANADIAN,
    wxLANGUAGE_FRENCH_LUXEMBOURG,
    wxLANGUAGE_FRENCH_MONACO,
    wxLANGUAGE_FRENCH_SWISS,
    wxLANGUAGE_FRISIAN,
    wxLANGUAGE_GALICIAN,
    wxLANGUAGE_GEORGIAN,
    wxLANGUAGE_GERMAN,
    wxLANGUAGE_GERMAN_AUSTRIAN,
    wxLANGUAGE_GERMAN_BELGIUM,
    wxLANGUAGE_GERMAN_LIECHTENSTEIN,
    wxLANGUAGE_GERMAN_LUXEMBOURG,
    wxLANGUAGE_GERMAN_SWISS,
    wxLANGUAGE_GREEK,
    wxLANGUAGE_GREENLANDIC,
    wxLANGUAGE_GUARANI,
    wxLANGUAGE_GUJARATI,
    wxLANGUAGE_HAUSA,
    wxLANGUAGE_HEBREW,
    wxLANGUAGE_HINDI,
    wxLANGUAGE_HUNGARIAN,
    wxLANGUAGE_ICELANDIC,
    wxLANGUAGE_INDONESIAN,
    wxLANGUAGE_INTERLINGUA,
    wxLANGUAGE_INTERLINGUE,
    wxLANGUAGE_INUKTITUT,
    wxLANGUAGE_INUPIAK,
    wxLANGUAGE_IRISH,
    wxLANGUAGE_ITALIAN,
    wxLANGUAGE_ITALIAN_SWISS,
    wxLANGUAGE_JAPANESE,
    wxLANGUAGE_JAVANESE,
    wxLANGUAGE_KANNADA,
    wxLANGUAGE_KASHMIRI,
    wxLANGUAGE_KASHMIRI_INDIA,
    wxLANGUAGE_KAZAKH,
    wxLANGUAGE_KERNEWEK,
    wxLANGUAGE_KINYARWANDA,
    wxLANGUAGE_KIRGHIZ,
    wxLANGUAGE_KIRUNDI,
    wxLANGUAGE_KONKANI,
    wxLANGUAGE_KOREAN,
    wxLANGUAGE_KURDISH,
    wxLANGUAGE_LAOTHIAN,
    wxLANGUAGE_LATIN,
    wxLANGUAGE_LATVIAN,
    wxLANGUAGE_LINGALA,
    wxLANGUAGE_LITHUANIAN,
    wxLANGUAGE_MACEDONIAN,
    wxLANGUAGE_MALAGASY,
    wxLANGUAGE_MALAY,
    wxLANGUAGE_MALAYALAM,
    wxLANGUAGE_MALAY_BRUNEI_DARUSSALAM,
    wxLANGUAGE_MALAY_MALAYSIA,
    wxLANGUAGE_MALTESE,
    wxLANGUAGE_MANIPURI,
    wxLANGUAGE_MAORI,
    wxLANGUAGE_MARATHI,
    wxLANGUAGE_MOLDAVIAN,
    wxLANGUAGE_MONGOLIAN,
    wxLANGUAGE_NAURU,
    wxLANGUAGE_NEPALI,
    wxLANGUAGE_NEPALI_INDIA,
    wxLANGUAGE_NORWEGIAN_BOKMAL,
    wxLANGUAGE_NORWEGIAN_NYNORSK,
    wxLANGUAGE_OCCITAN,
    wxLANGUAGE_ORIYA,
    wxLANGUAGE_OROMO,
    wxLANGUAGE_PASHTO,
    wxLANGUAGE_POLISH,
    wxLANGUAGE_PORTUGUESE,
    wxLANGUAGE_PORTUGUESE_BRAZILIAN,
    wxLANGUAGE_PUNJABI,
    wxLANGUAGE_QUECHUA,
    wxLANGUAGE_RHAETO_ROMANCE,
    wxLANGUAGE_ROMANIAN,
    wxLANGUAGE_RUSSIAN,
    wxLANGUAGE_RUSSIAN_UKRAINE,
    wxLANGUAGE_SAMOAN,
    wxLANGUAGE_SANGHO,
    wxLANGUAGE_SANSKRIT,
    wxLANGUAGE_SCOTS_GAELIC,
    wxLANGUAGE_SERBIAN,
    wxLANGUAGE_SERBIAN_CYRILLIC,
    wxLANGUAGE_SERBIAN_LATIN,
    wxLANGUAGE_SERBO_CROATIAN,
    wxLANGUAGE_SESOTHO,
    wxLANGUAGE_SETSWANA,
    wxLANGUAGE_SHONA,
    wxLANGUAGE_SINDHI,
    wxLANGUAGE_SINHALESE,
    wxLANGUAGE_SISWATI,
    wxLANGUAGE_SLOVAK,
    wxLANGUAGE_SLOVENIAN,
    wxLANGUAGE_SOMALI,
    wxLANGUAGE_SPANISH,
    wxLANGUAGE_SPANISH_ARGENTINA,
    wxLANGUAGE_SPANISH_BOLIVIA,
    wxLANGUAGE_SPANISH_CHILE,
    wxLANGUAGE_SPANISH_COLOMBIA,
    wxLANGUAGE_SPANISH_COSTA_RICA,
    wxLANGUAGE_SPANISH_DOMINICAN_REPUBLIC,
    wxLANGUAGE_SPANISH_ECUADOR,
    wxLANGUAGE_SPANISH_EL_SALVADOR,
    wxLANGUAGE_SPANISH_GUATEMALA,
    wxLANGUAGE_SPANISH_HONDURAS,
    wxLANGUAGE_SPANISH_MEXICAN,
    wxLANGUAGE_SPANISH_MODERN,
    wxLANGUAGE_SPANISH_NICARAGUA,
    wxLANGUAGE_SPANISH_PANAMA,
    wxLANGUAGE_SPANISH_PARAGUAY,
    wxLANGUAGE_SPANISH_PERU,
    wxLANGUAGE_SPANISH_PUERTO_RICO,
    wxLANGUAGE_SPANISH_URUGUAY,
    wxLANGUAGE_SPANISH_US,
    wxLANGUAGE_SPANISH_VENEZUELA,
    wxLANGUAGE_SUNDANESE,
    wxLANGUAGE_SWAHILI,
    wxLANGUAGE_SWEDISH,
    wxLANGUAGE_SWEDISH_FINLAND,
    wxLANGUAGE_TAGALOG,
    wxLANGUAGE_TAJIK,
    wxLANGUAGE_TAMIL,
    wxLANGUAGE_TATAR,
    wxLANGUAGE_TELUGU,
    wxLANGUAGE_THAI,
    wxLANGUAGE_TIBETAN,
    wxLANGUAGE_TIGRINYA,
    wxLANGUAGE_TONGA,
    wxLANGUAGE_TSONGA,
    wxLANGUAGE_TURKISH,
    wxLANGUAGE_TURKMEN,
    wxLANGUAGE_TWI,
    wxLANGUAGE_UIGHUR,
    wxLANGUAGE_UKRAINIAN,
    wxLANGUAGE_URDU,
    wxLANGUAGE_URDU_INDIA,
    wxLANGUAGE_URDU_PAKISTAN,
    wxLANGUAGE_UZBEK,
    wxLANGUAGE_UZBEK_CYRILLIC,
    wxLANGUAGE_UZBEK_LATIN,
    wxLANGUAGE_VIETNAMESE,
    wxLANGUAGE_VOLAPUK,
    wxLANGUAGE_WELSH,
    wxLANGUAGE_WOLOF,
    wxLANGUAGE_XHOSA,
    wxLANGUAGE_YIDDISH,
    wxLANGUAGE_YORUBA,
    wxLANGUAGE_ZHUANG,
    wxLANGUAGE_ZULU,

    wxLANGUAGE_USER_DEFINED
}

//-----------------------------------------------------------------------------

public enum LocaleCategory
{
    wxLOCALE_CAT_NUMBER,
    wxLOCALE_CAT_DATE,
    wxLOCALE_CAT_MONEY,
    wxLOCALE_CAT_MAX
}

//-----------------------------------------------------------------------------

public enum LocaleInfo
{
    wxLOCALE_THOUSANDS_SEP,
    wxLOCALE_DECIMAL_POINT
}

//-----------------------------------------------------------------------------

public enum LocaleInitФлаги
{
    wxLOCALE_LOAD_DEFAULT  = 0x0001,
    wxLOCALE_CONV_ENCODING = 0x0002
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxLanguageInfo_ctor();
static extern (C) проц   wxLanguageInfo_dtor(ЦелУкз сам);
static extern (C) проц   wxLanguageInfo_SetLanguage(ЦелУкз сам, цел значение);
static extern (C) цел    wxLanguageInfo_GetLanguage(ЦелУкз сам);
static extern (C) проц   wxLanguageInfo_SetCanonicalName(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxLanguageInfo_GetCanonicalName(ЦелУкз сам);
static extern (C) проц   wxLanguageInfo_SetDescription(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxLanguageInfo_GetDescription(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias LanguageInfo wxLanguageInfo;
public class LanguageInfo : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxLanguageInfo_ctor(), да);
    }


    public static wxObject Нов(ЦелУкз ptr)
    {
        return new LanguageInfo(ptr);
    }
    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxLanguageInfo_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public цел language()
    {
        return wxLanguageInfo_GetLanguage(wxobj);
    }
    public проц language(цел значение)
    {
        wxLanguageInfo_SetLanguage(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст CanonicalName()
    {
        return cast(ткст) new wxString(wxLanguageInfo_GetCanonicalName(wxobj), да);
    }
    public проц CanonicalName(ткст значение)
    {
        wxLanguageInfo_SetCanonicalName(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст Description()
    {
        return cast(ткст) new wxString(wxLanguageInfo_GetDescription(wxobj), да);
    }
    public проц Description(ткст значение)
    {
        wxLanguageInfo_SetDescription(wxobj, значение);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxLocale_ctor();
static extern (C) ЦелУкз wxLocale_ctor2(цел language, цел флаги);
static extern (C) проц   wxLocale_dtor(ЦелУкз сам);
static extern (C) бул   wxLocale_Init(ЦелУкз сам, цел language, цел флаги);
static extern (C) бул   wxLocale_AddCatalog(ЦелУкз сам, ткст szDomain);
static extern (C) бул   wxLocale_AddCatalog2(ЦелУкз сам, ткст szDomain, цел msgIdLanguage, ткст msgIdCharset);
static extern (C) проц   wxLocale_AddCatalogLookupPathPrefix(ЦелУкз сам, ткст prefix);
static extern (C) проц   wxLocale_AddLanguage(ЦелУкз info);
static extern (C) ЦелУкз wxLocale_FindLanguageInfo(ткст locale);
static extern (C) ЦелУкз wxLocale_GetCanonicalName(ЦелУкз сам);
static extern (C) цел    wxLocale_GetLanguage(ЦелУкз сам);
static extern (C) ЦелУкз wxLocale_GetLanguageInfo(цел lang);
static extern (C) ЦелУкз wxLocale_GetLanguageName(цел lang);
static extern (C) ЦелУкз wxLocale_GetLocale(ЦелУкз сам);
static extern (C) ЦелУкз wxLocale_GetName(ЦелУкз сам);
static extern (C) ЦелУкз wxLocale_GetString(ЦелУкз сам, ткст szOrigString, ткст szDomain);
static extern (C) ЦелУкз wxLocale_GetHeaderValue(ЦелУкз сам, ткст szHeader, ткст szDomain);
static extern (C) ЦелУкз wxLocale_GetSysName(ЦелУкз сам);
static extern (C) цел    wxLocale_GetSystemEncoding();
static extern (C) ЦелУкз wxLocale_GetSystemEncodingName();
static extern (C) цел    wxLocale_GetSystemLanguage();
static extern (C) бул   wxLocale_IsLoaded(ЦелУкз сам, ткст domain);
static extern (C) бул   wxLocale_IsOk(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias Locale wxLocale;
public class Locale : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxLocale_ctor(), да);
    }

    public this(цел language)
    {
        this(language, LocaleInitФлаги.wxLOCALE_LOAD_DEFAULT | LocaleInitФлаги.wxLOCALE_CONV_ENCODING);
    }

    public this(цел language, LocaleInitФлаги флаги)
    {
        this(wxLocale_ctor2(language, cast(цел)флаги), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxLocale_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Init()
    {
        return Init(Language.wxLANGUAGE_DEFAULT, LocaleInitФлаги.wxLOCALE_LOAD_DEFAULT | LocaleInitФлаги.wxLOCALE_CONV_ENCODING);
    }

    public бул Init(Language language)
    {
        return Init(language,  LocaleInitФлаги.wxLOCALE_LOAD_DEFAULT | LocaleInitФлаги.wxLOCALE_CONV_ENCODING);
    }

    public бул Init(Language language, LocaleInitФлаги флаги)
    {
        return wxLocale_Init(wxobj, cast(цел)language, cast(цел)флаги);
    }

    //-----------------------------------------------------------------------------

    public бул AddCatalog(ткст szDomain)
    {
        return wxLocale_AddCatalog(wxobj, szDomain);
    }

    public бул AddCatalog(ткст szDomain, Language msgIdLanguage, ткст msgIdCharset)
    {
        return wxLocale_AddCatalog2(wxobj, szDomain, cast(цел)msgIdLanguage, msgIdCharset);
    }

    //-----------------------------------------------------------------------------

    public проц AddCatalogLookupPathPrefix(ткст prefix)
    {
        wxLocale_AddCatalogLookupPathPrefix(wxobj, prefix);
    }

    //-----------------------------------------------------------------------------

    public static проц AddLanguage(LanguageInfo info)
    {
        wxLocale_AddLanguage(wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public static LanguageInfo FindLanguageInfo(ткст locale)
    {
        return cast(LanguageInfo)НайдиОбъект(wxLocale_FindLanguageInfo(locale), &LanguageInfo.Нов);
    }

    //-----------------------------------------------------------------------------

    public ткст CanonicalName()
    {
        return cast(ткст) new wxString(wxLocale_GetCanonicalName(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public Language language()
    {
        return cast(Language)wxLocale_GetLanguage(wxobj);
    }

    //-----------------------------------------------------------------------------

    public static LanguageInfo GetLanguageInfo(Language lang)
    {
        return cast(LanguageInfo)НайдиОбъект(wxLocale_GetLanguageInfo(cast(цел)lang), &LanguageInfo.Нов);
    }

    //-----------------------------------------------------------------------------

    public static ткст GetLanguageName(Language lang)
    {
        return cast(ткст) new wxString(wxLocale_GetLanguageName(cast(цел)lang), да);
    }

    //-----------------------------------------------------------------------------

    public ткст GetLocale()
    {
        return cast(ткст) new wxString(wxLocale_GetLocale(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ткст Имя()
    {
        return cast(ткст) new wxString(wxLocale_GetName(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ткст GetString(ткст szOrigString)
    {
        return GetString(szOrigString, null);
    }

    public ткст GetString(ткст szOrigString, ткст szDomain)
    {
        return cast(ткст) new wxString(wxLocale_GetString(wxobj, szOrigString, szDomain), да);
    }

    //-----------------------------------------------------------------------------

    public ткст GetHeaderValue(ткст szHeader)
    {
        return GetHeaderValue(szHeader, null);
    }

    public ткст GetHeaderValue(ткст szHeader, ткст szDomain)
    {
        return cast(ткст) new wxString(wxLocale_GetHeaderValue(wxobj, szHeader, szDomain), да);
    }

    //-----------------------------------------------------------------------------

    public ткст SysName()
    {
        return cast(ткст) new wxString(wxLocale_GetSysName(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    static FontEncoding SystemEncoding()
    {
        return cast(FontEncoding)wxLocale_GetSystemEncoding();
    }

    //-----------------------------------------------------------------------------

    static ткст SystemEncodingName()
    {
        return cast(ткст) new wxString(wxLocale_GetSystemEncodingName(), да);
    }

    //-----------------------------------------------------------------------------

    static Language SystemLanguage()
    {
        return cast(Language)wxLocale_GetSystemLanguage();
    }

    //-----------------------------------------------------------------------------

    public бул IsLoaded(ткст domain)
    {
        return wxLocale_IsLoaded(wxobj, domain);
    }

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxLocale_IsOk(wxobj);
    }
}
