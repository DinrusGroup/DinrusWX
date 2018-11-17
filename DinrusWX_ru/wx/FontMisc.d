//-----------------------------------------------------------------------------
// wxD - FontMisc.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FontMapper.cs
//
/// The wxFontMapper wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FontMisc.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.FontMisc;
public import wx.common;
public import wx.Font;
public import wx.Window;
public import wx.ArrayString;

//! \cond EXTERN
static extern (C) ЦелУкз wxFontMapper_ctor();
static extern (C) проц   wxFontMapper_dtor(ЦелУкз сам);

static extern (C) ЦелУкз wxFontMapper_Get();
static extern (C) ЦелУкз wxFontMapper_Set(ЦелУкз mapper);
static extern (C) цел    wxFontMapper_GetSupportedEncodingsCount();
static extern (C) цел    wxFontMapper_GetEncoding(цел n);
static extern (C) ЦелУкз wxFontMapper_GetEncodingName(цел кодировка);
static extern (C) ЦелУкз wxFontMapper_GetEncodingDescription(цел кодировка);
static extern (C) цел    wxFontMapper_GetEncodingFromName(ткст имя);

static extern (C) цел    wxFontMapper_CharsetToEncoding(ЦелУкз сам, ткст charset, бул interactive);
static extern (C) бул   wxFontMapper_IsEncodingAvailable(ЦелУкз сам, цел кодировка, ткст facename);
static extern (C) бул   wxFontMapper_GetAltForEncoding(ЦелУкз сам, цел кодировка, out цел alt_encoding, ткст facename, бул interactive);

static extern (C) проц   wxFontMapper_SetDialogParent(ЦелУкз сам, ЦелУкз родитель);
static extern (C) проц   wxFontMapper_SetDialogTitle(ЦелУкз сам, ткст титул);
//! \endcond

//---------------------------------------------------------------------

alias FontMapper wxFontMapper;
public class FontMapper : wxObject
{
    private static FontMapper staticFontMapper;

    static проц initialize()
    {
        if(!staticFontMapper)
            staticFontMapper = new FontMapper(wxFontMapper_Get());
    }

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

    public this()
    {
        this(wxFontMapper_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxFontMapper_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    static FontMapper Get()
    {
        return staticFontMapper;
    }

    //---------------------------------------------------------------------

    public static FontMapper Уст(FontMapper mapper)
    {
        return new FontMapper(wxFontMapper_Set(wxObject.SafePtr(mapper)));
    }

    //---------------------------------------------------------------------

    static цел SupportedEncodingsCount()
    {
        return wxFontMapper_GetSupportedEncodingsCount();
    }

    //---------------------------------------------------------------------

    public static FontEncoding GetEncoding(цел n)
    {
        return cast(FontEncoding)wxFontMapper_GetEncoding(n);
    }

    //---------------------------------------------------------------------

    public static ткст GetEncodingName(FontEncoding кодировка)
    {
        return cast(ткст) new wxString(wxFontMapper_GetEncodingName(cast(цел)кодировка), да);
    }

    //---------------------------------------------------------------------

    public static FontEncoding GetEncodingFromName(ткст имя)
    {
        return cast(FontEncoding)wxFontMapper_GetEncodingFromName(имя);
    }

    //---------------------------------------------------------------------

    public FontEncoding CharsetToEncoding(ткст charset)
    {
        return cast(FontEncoding)CharsetToEncoding(charset, да);
    }

    public FontEncoding CharsetToEncoding(ткст charset, бул interactive)
    {
        return cast(FontEncoding)wxFontMapper_CharsetToEncoding(wxobj, charset, interactive);
    }

    //---------------------------------------------------------------------

    public бул IsEncodingAvailable(FontEncoding кодировка)
    {
        return IsEncodingAvailable(кодировка, "");
    }

    public бул IsEncodingAvailable(FontEncoding кодировка, ткст facename)
    {
        return wxFontMapper_IsEncodingAvailable(wxobj, cast(цел)кодировка, facename);
    }

    //---------------------------------------------------------------------

    public бул GetAltForEncoding(FontEncoding кодировка, out FontEncoding alt_encoding)
    {
        return GetAltForEncoding(кодировка, alt_encoding, "", да);
    }

    public бул GetAltForEncoding(FontEncoding кодировка, out FontEncoding alt_encoding, ткст facename)
    {
        return GetAltForEncoding(кодировка, alt_encoding, facename, да);
    }

    public бул GetAltForEncoding(FontEncoding кодировка, out FontEncoding alt_encoding, ткст facename, бул interactive)
    {
        return wxFontMapper_GetAltForEncoding(wxobj, cast(цел)кодировка, alt_encoding, facename, interactive);
    }

    //---------------------------------------------------------------------

    public static ткст GetEncodingDescription(FontEncoding кодировка)
    {
        return cast(ткст) new wxString(wxFontMapper_GetEncodingDescription(cast(цел)кодировка), да);
    }

    //---------------------------------------------------------------------

    public проц УстDialogParent(Окно родитель)
    {
        wxFontMapper_SetDialogParent(wxobj, wxObject.SafePtr(родитель));
    }

    //---------------------------------------------------------------------

    public проц УстDialogTitle(ткст титул)
    {
        wxFontMapper_SetDialogTitle(wxobj, титул);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxEncodingConverter_ctor();
static extern (C) бул wxEncodingConverter_Init(ЦелУкз сам, цел input_enc, цел output_enc, цел method);
static extern (C) ЦелУкз wxEncodingConverter_Convert(ЦелУкз сам, ткст input);
//! \endcond

//---------------------------------------------------------------------

alias EncodingConverter wxEncodingConverter;
public class EncodingConverter : wxObject
{
    enum CONVERT
    {
        wxCONVERT_STRICT,
        wxCONVERT_SUBSTITUTE
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxEncodingConverter_ctor());
    }

    //---------------------------------------------------------------------

    public бул Init(FontEncoding input_enc, FontEncoding output_enc)
    {
        return Init(input_enc, output_enc, cast(цел)CONVERT.wxCONVERT_STRICT);
    }

    public бул Init(FontEncoding input_enc, FontEncoding output_enc, цел method)
    {
        return wxEncodingConverter_Init(wxobj, cast(цел)input_enc, cast(цел)output_enc, method);
    }

    //---------------------------------------------------------------------

    public ткст Convert(ткст input)
    {
        return cast(ткст) new wxString(wxEncodingConverter_Convert(wxobj, input), да);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias бул function(FontEnumerator объ, цел кодировка, бул fixedWidthOnly) Virtual_EnumerateFacenames;
    alias бул function(FontEnumerator объ, ЦелУкз facename) Virtual_EnumerateEncodings;
    alias бул function(FontEnumerator объ, ЦелУкз facename) Virtual_OnFacename;
    alias бул function(FontEnumerator объ, ЦелУкз facename, ЦелУкз кодировка) Virtual_OnFontEncoding;
}

static extern (C) ЦелУкз wxFontEnumerator_ctor();
static extern (C) проц wxFontEnumerator_dtor(ЦелУкз сам);
static extern (C) проц wxFontEnumerator_RegisterVirtual(ЦелУкз сам, FontEnumerator объ,Virtual_EnumerateFacenames enumerateFacenames, Virtual_EnumerateEncodings enumerateEncodings, Virtual_OnFacename onFacename, Virtual_OnFontEncoding onFontEncoding);
static extern (C) ЦелУкз wxFontEnumerator_GetFacenames(ЦелУкз сам);
static extern (C) ЦелУкз wxFontEnumerator_GetEncodings(ЦелУкз сам);
static extern (C) бул wxFontEnumerator_OnFacename(ЦелУкз сам, ткст facename);
static extern (C) бул wxFontEnumerator_OnFontEncoding(ЦелУкз сам, ткст facename, ткст кодировка);
static extern (C) бул wxFontEnumerator_EnumerateFacenames(ЦелУкз сам, цел кодировка, бул fixedWidthOnly);
static extern (C) бул wxFontEnumerator_EnumerateEncodings(ЦелУкз сам, ткст facename);
//! \endcond

//---------------------------------------------------------------------

alias FontEnumerator wxFontEnumerator;
public class FontEnumerator : wxObject
{
    public this()
    {
        this(wxFontEnumerator_ctor(), да);

        wxFontEnumerator_RegisterVirtual(wxobj,this,
                                         &staticDoEnumerateFacenames,
                                         &staticDoEnumerateEncodings,
                                         &staticDoOnFacename,
                                         &staticDoOnFontEncoding);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxFontEnumerator_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст[] Facenames()
    {
        return (new ТкстМассив(wxFontEnumerator_GetFacenames(wxobj), да)).вМассив();
    }

    //---------------------------------------------------------------------

    public ткст[] Encodings()
    {
        return (new ТкстМассив(wxFontEnumerator_GetEncodings(wxobj), да)).вМассив();
    }

    //---------------------------------------------------------------------

    public  бул OnFacename(ткст facename)
    {
        return wxFontEnumerator_OnFacename(wxobj, facename);
    }

    extern(C) private static бул staticDoOnFacename(FontEnumerator объ, ЦелУкз facename)
    {
        return объ.OnFacename(cast(ткст) new wxString(facename));
    }

    //---------------------------------------------------------------------

    public  бул OnFontEncoding(ткст facename, ткст кодировка)
    {
        return wxFontEnumerator_OnFontEncoding(wxobj, facename, кодировка);
    }

    extern(C) private static бул staticDoOnFontEncoding(FontEnumerator объ, ЦелУкз facename, ЦелУкз кодировка)
    {
        return объ.OnFontEncoding(cast(ткст) new wxString(facename), cast(ткст) new wxString(кодировка));
    }

    //---------------------------------------------------------------------

    /*public  бул EnumerateFacenames()
    {
    	return EnumerateFacenames(cast(цел)FontEncoding.wxFONTENCODING_SYSTEM, false);
    }

    public  бул EnumerateFacenames(FontEncoding кодировка)
    {
    	return EnumerateFacenames(cast(цел)кодировка, false);
    }*/

    public  бул EnumerateFacenames(FontEncoding кодировка, бул fixedWidthOnly)
    {
        return wxFontEnumerator_EnumerateFacenames(wxobj, cast(цел)кодировка, fixedWidthOnly);
    }

    extern(C) private static бул staticDoEnumerateFacenames(FontEnumerator объ, цел кодировка, бул fixedWidthOnly)
    {
        return объ.EnumerateFacenames(cast(FontEncoding)кодировка, fixedWidthOnly);
    }

    //---------------------------------------------------------------------

    /*public  бул EnumerateEncodings()
    {
    	return EnumerateEncodings(ЦелУкз.init);
    }*/

    public  бул EnumerateEncodings(ткст facename)
    {
        return wxFontEnumerator_EnumerateEncodings(wxobj, facename);
    }

    extern(C) private static бул staticDoEnumerateEncodings(FontEnumerator объ, ЦелУкз facename)
    {
        return объ.EnumerateEncodings(cast(ткст) new wxString(facename));
    }
}
