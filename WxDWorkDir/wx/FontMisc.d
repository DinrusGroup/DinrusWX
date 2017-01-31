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
		static extern (C) ЦУк wxFontMapper_ctor();
		static extern (C) проц   wxFontMapper_dtor(ЦУк сам);
		
		static extern (C) ЦУк wxFontMapper_Get();
		static extern (C) ЦУк wxFontMapper_Set(ЦУк mapper);
		static extern (C) цел    wxFontMapper_GetSupportedEncodingsCount();
		static extern (C) цел    wxFontMapper_GetEncoding(цел n);
		static extern (C) ЦУк wxFontMapper_GetEncodingName(цел encoding);
		static extern (C) ЦУк wxFontMapper_GetEncodingDescription(цел encoding);
		static extern (C) цел    wxFontMapper_GetEncodingFromName(ткст имя);
		
		static extern (C) цел    wxFontMapper_CharsetToEncoding(ЦУк сам, ткст charset, бул interactive);
		static extern (C) бул   wxFontMapper_IsEncodingAvailable(ЦУк сам, цел encoding, ткст facename);
		static extern (C) бул   wxFontMapper_GetAltForEncoding(ЦУк сам, цел encoding, out цел alt_encoding, ткст facename, бул interactive);
		
		static extern (C) проц   wxFontMapper_SetДиалогParent(ЦУк сам, ЦУк родитель);
		static extern (C) проц   wxFontMapper_SetДиалогTitle(ЦУк сам, ткст title);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias FontMapper wxFontMapper;
	public class FontMapper : wxObject
	{
		private static FontMapper staticFontMapper;
		
		static проц инициализуй()
		{
			if(!staticFontMapper)
				staticFontMapper = new FontMapper(wxFontMapper_Get());
		}
		
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
			
		public this()
			{ this(wxFontMapper_ctor(), да);}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxFontMapper_dtor(шхобъ); }
			
		//---------------------------------------------------------------------
		
		static FontMapper Get() { return staticFontMapper; }
		
		//---------------------------------------------------------------------
		
		public static FontMapper Установи(FontMapper mapper)
		{
			return new FontMapper(wxFontMapper_Set(wxObject.SafePtr(mapper)));
		}
		
		//---------------------------------------------------------------------
		
		static цел SupportedEncodingsCount() { return wxFontMapper_GetSupportedEncodingsCount(); }
		
		//---------------------------------------------------------------------
		
		public static FontEncoding GetEncoding(цел n)
		{
			return cast(FontEncoding)wxFontMapper_GetEncoding(n);
		}
		
		//---------------------------------------------------------------------
		
		public static ткст GetEncodingName(FontEncoding encoding)
		{
			return cast(ткст) new wxString(wxFontMapper_GetEncodingName(cast(цел)encoding), да);
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
			return cast(FontEncoding)wxFontMapper_CharsetToEncoding(шхобъ, charset, interactive);
		}
		
		//---------------------------------------------------------------------
		
		public бул IsEncodingAvailable(FontEncoding encoding)
		{
			return IsEncodingAvailable(encoding, "");
		}
		
		public бул IsEncodingAvailable(FontEncoding encoding, ткст facename)
		{
			return wxFontMapper_IsEncodingAvailable(шхобъ, cast(цел)encoding, facename);
		}
		
		//---------------------------------------------------------------------
		
		public бул GetAltForEncoding(FontEncoding encoding, out FontEncoding alt_encoding)
		{
			return GetAltForEncoding(encoding, alt_encoding, "", да);
		}
		
		public бул GetAltForEncoding(FontEncoding encoding, out FontEncoding alt_encoding, ткст facename)
		{
			return GetAltForEncoding(encoding, alt_encoding, facename, да);
		}
		
		public бул GetAltForEncoding(FontEncoding encoding, out FontEncoding alt_encoding, ткст facename, бул interactive)
		{
			return wxFontMapper_GetAltForEncoding(шхобъ, cast(цел)encoding, alt_encoding, facename, interactive);
		}
		
		//---------------------------------------------------------------------
		
		public static ткст GetEncodingDescription(FontEncoding encoding)
		{
			return cast(ткст) new wxString(wxFontMapper_GetEncodingDescription(cast(цел)encoding), да);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetДиалогParent(Окно родитель)
		{
			wxFontMapper_SetДиалогParent(шхобъ, wxObject.SafePtr(родитель));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetДиалогTitle(ткст title)
		{
			wxFontMapper_SetДиалогTitle(шхобъ, title);
		}
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxEncodingConverter_ctor();
		static extern (C) бул wxEncodingConverter_Init(ЦУк сам, цел input_enc, цел output_enc, цел method);
		static extern (C) ЦУк wxEncodingConverter_Convert(ЦУк сам, ткст input);
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
		
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxEncodingConverter_ctor());}
			
		//---------------------------------------------------------------------
		
		public бул Init(FontEncoding input_enc, FontEncoding output_enc)
		{
			return Init(input_enc, output_enc, cast(цел)CONVERT.wxCONVERT_STRICT);
		}
		
		public бул Init(FontEncoding input_enc, FontEncoding output_enc, цел method)
		{
			return wxEncodingConverter_Init(шхобъ, cast(цел)input_enc, cast(цел)output_enc, method);
		}
		
		//---------------------------------------------------------------------
		
		public ткст Convert(ткст input)
		{
			return cast(ткст) new wxString(wxEncodingConverter_Convert(шхобъ, input), да);
		}
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		extern (C) {
		alias бул function(FontEnumerator объ, цел encoding, бул fixedWidthOnly) Virtual_EnumerateFacenames;
		alias бул function(FontEnumerator объ, ЦУк facename) Virtual_EnumerateEncodings;
		alias бул function(FontEnumerator объ, ЦУк facename) Virtual_OnFacename;
		alias бул function(FontEnumerator объ, ЦУк facename, ЦУк encoding) Virtual_OnFontEncoding;
		}

		static extern (C) ЦУк wxFontEnumerator_ctor();
		static extern (C) проц wxFontEnumerator_dtor(ЦУк сам);
		static extern (C) проц wxFontEnumerator_RegisterVirtual(ЦУк сам, FontEnumerator объ,Virtual_EnumerateFacenames enumerateFacenames, Virtual_EnumerateEncodings enumerateEncodings, Virtual_OnFacename onFacename, Virtual_OnFontEncoding onFontEncoding);
		static extern (C) ЦУк wxFontEnumerator_GetFacenames(ЦУк сам);
		static extern (C) ЦУк wxFontEnumerator_GetEncodings(ЦУк сам);
		static extern (C) бул wxFontEnumerator_OnFacename(ЦУк сам, ткст facename);
		static extern (C) бул wxFontEnumerator_OnFontEncoding(ЦУк сам, ткст facename, ткст encoding);
		static extern (C) бул wxFontEnumerator_EnumerateFacenames(ЦУк сам, цел encoding, бул fixedWidthOnly);
		static extern (C) бул wxFontEnumerator_EnumerateEncodings(ЦУк сам, ткст facename);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias FontEnumerator wxFontEnumerator;
	public class FontEnumerator : wxObject
	{
		public this()
		{
			this(wxFontEnumerator_ctor(), да);

			wxFontEnumerator_RegisterVirtual(шхобъ,this,
				&staticDoEnumerateFacenames,
				&staticDoEnumerateEncodings,
				&staticDoOnFacename,
				&staticDoOnFontEncoding);			
		}
		
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxFontEnumerator_dtor(шхобъ); }
			
		//---------------------------------------------------------------------
		
		public ткст[] Facenames()
		{
			return (new МасТкст(wxFontEnumerator_GetFacenames(шхобъ), да)).вМассив();
		}
		
		//---------------------------------------------------------------------
		
		public ткст[] Encodings()
		{
			return (new МасТкст(wxFontEnumerator_GetEncodings(шхобъ), да)).вМассив();
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ бул OnFacename(ткст facename)
		{
			return wxFontEnumerator_OnFacename(шхобъ, facename);
		}
		
		extern(C) private static бул staticDoOnFacename(FontEnumerator объ, ЦУк facename)
		{
			return объ.OnFacename(cast(ткст) new wxString(facename));
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ бул OnFontEncoding(ткст facename, ткст encoding)
		{
			return wxFontEnumerator_OnFontEncoding(шхобъ, facename, encoding);
		}
		
		extern(C) private static бул staticDoOnFontEncoding(FontEnumerator объ, ЦУк facename, ЦУк encoding)
		{
			return объ.OnFontEncoding(cast(ткст) new wxString(facename), cast(ткст) new wxString(encoding));
		}
		
		//---------------------------------------------------------------------
		
		/*public /+virtual+/ бул EnumerateFacenames()
		{
			return EnumerateFacenames(cast(цел)FontEncoding.wxFONTENCODING_SYSTEM, нет);
		}
		
		public /+virtual+/ бул EnumerateFacenames(FontEncoding encoding)
		{
			return EnumerateFacenames(cast(цел)encoding, нет);
		}*/
		
		public /+virtual+/ бул EnumerateFacenames(FontEncoding encoding, бул fixedWidthOnly)
		{
			return wxFontEnumerator_EnumerateFacenames(шхобъ, cast(цел)encoding, fixedWidthOnly);
		}
		
		extern(C) private static бул staticDoEnumerateFacenames(FontEnumerator объ, цел encoding, бул fixedWidthOnly)
		{
			return объ.EnumerateFacenames(cast(FontEncoding)encoding, fixedWidthOnly);
		}
		
		//---------------------------------------------------------------------
		
		/*public /+virtual+/ бул EnumerateEncodings()
		{
			return EnumerateEncodings(ЦУк.init);
		}*/
		
		public /+virtual+/ бул EnumerateEncodings(ткст facename)
		{
			return wxFontEnumerator_EnumerateEncodings(шхобъ, facename);
		}
		
		extern(C) private static бул staticDoEnumerateEncodings(FontEnumerator объ, ЦУк facename)
		{
			return объ.EnumerateEncodings(cast(ткст) new wxString(facename));
		}
	}
