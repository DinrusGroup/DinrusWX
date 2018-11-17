module wx.FontMisc;
public import wx.common;
public import wx.Font;
public import wx.Window;
public import wx.ArrayString;

		//! \cond EXTERN
		static extern (C) IntPtr wxFontMapper_ctor();
		static extern (C) проц   wxFontMapper_dtor(IntPtr сам);
		
		static extern (C) IntPtr wxFontMapper_Get();
		static extern (C) IntPtr wxFontMapper_Set(IntPtr mapper);
		static extern (C) цел    wxFontMapper_GetSupportedEncodingsCount();
		static extern (C) цел    wxFontMapper_GetEncoding(цел n);
		static extern (C) IntPtr wxFontMapper_GetEncodingName(цел кодировка);
		static extern (C) IntPtr wxFontMapper_GetEncodingDescription(цел кодировка);
		static extern (C) цел    wxFontMapper_GetEncodingFromName(ткст имя);
		
		static extern (C) цел    wxFontMapper_CharsetToEncoding(IntPtr сам, ткст charset, бул interactive);
		static extern (C) бул   wxFontMapper_IsEncodingAvailable(IntPtr сам, цел кодировка, ткст facename);
		static extern (C) бул   wxFontMapper_GetAltForEncoding(IntPtr сам, цел кодировка, out цел alt_encoding, ткст facename, бул interactive);
		
		static extern (C) проц   wxFontMapper_SetDialogParent(IntPtr сам, IntPtr родитель);
		static extern (C) проц   wxFontMapper_SetDialogTitle(IntPtr сам, ткст title);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias FontMapper wxFontMapper;
	public class FontMapper : wxObject
	{
		private static FontMapper staticFontMapper;
		
		static проц initialize();
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor();
		static FontMapper Get();
		public static FontMapper Уст(FontMapper mapper);
		static цел SupportedEncodingsCount() ;
		public static FontEncoding GetEncoding(цел n);
		public static ткст GetEncodingName(FontEncoding кодировка);
		public static FontEncoding GetEncodingFromName(ткст имя);
		public FontEncoding CharsetToEncoding(ткст charset);
		public FontEncoding CharsetToEncoding(ткст charset, бул interactive);
		public бул IsEncodingAvailable(FontEncoding кодировка);
		public бул IsEncodingAvailable(FontEncoding кодировка, ткст facename);
		public бул GetAltForEncoding(FontEncoding кодировка, out FontEncoding alt_encoding);
		public бул GetAltForEncoding(FontEncoding кодировка, out FontEncoding alt_encoding, ткст facename);
		public бул GetAltForEncoding(FontEncoding кодировка, out FontEncoding alt_encoding, ткст facename, бул interactive);
		public static ткст GetEncodingDescription(FontEncoding кодировка);
		public проц УстDialogParent(Окно родитель);
		public проц УстDialogTitle(ткст title);
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxEncodingConverter_ctor();
		static extern (C) бул wxEncodingConverter_Init(IntPtr сам, цел input_enc, цел output_enc, цел method);
		static extern (C) IntPtr wxEncodingConverter_Convert(IntPtr сам, ткст input);
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
		
		public this(IntPtr wxobj);
		public this();
		public бул Init(FontEncoding input_enc, FontEncoding output_enc);
		public бул Init(FontEncoding input_enc, FontEncoding output_enc, цел method);
		public ткст Convert(ткст input);
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		extern (C) {
		alias бул function(FontEnumerator объ, цел кодировка, бул fixedWidthOnly) Virtual_EnumerateFacenames;
		alias бул function(FontEnumerator объ, IntPtr facename) Virtual_EnumerateEncodings;
		alias бул function(FontEnumerator объ, IntPtr facename) Virtual_OnFacename;
		alias бул function(FontEnumerator объ, IntPtr facename, IntPtr кодировка) Virtual_OnFontEncoding;
		}

		static extern (C) IntPtr wxFontEnumerator_ctor();
		static extern (C) проц wxFontEnumerator_dtor(IntPtr сам);
		static extern (C) проц wxFontEnumerator_RegisterVirtual(IntPtr сам, FontEnumerator объ,Virtual_EnumerateFacenames enumerateFacenames, Virtual_EnumerateEncodings enumerateEncodings, Virtual_OnFacename onFacename, Virtual_OnFontEncoding onFontEncoding);
		static extern (C) IntPtr wxFontEnumerator_GetFacenames(IntPtr сам);
		static extern (C) IntPtr wxFontEnumerator_GetEncodings(IntPtr сам);
		static extern (C) бул wxFontEnumerator_OnFacename(IntPtr сам, ткст facename);
		static extern (C) бул wxFontEnumerator_OnFontEncoding(IntPtr сам, ткст facename, ткст кодировка);
		static extern (C) бул wxFontEnumerator_EnumerateFacenames(IntPtr сам, цел кодировка, бул fixedWidthOnly);
		static extern (C) бул wxFontEnumerator_EnumerateEncodings(IntPtr сам, ткст facename);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias FontEnumerator wxFontEnumerator;
	public class FontEnumerator : wxObject
	{
		public this();
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
		public ткст[] Facenames();
		public ткст[] Encodings();
		public  бул OnFacename(ткст facename);
		extern(C) private static бул staticDoOnFacename(FontEnumerator объ, IntPtr facename);
		public  бул OnFontEncoding(ткст facename, ткст кодировка);
		extern(C) private static бул staticDoOnFontEncoding(FontEnumerator объ, IntPtr facename, IntPtr кодировка);
		//---------------------------------------------------------------------
		
		/*public  бул EnumerateFacenames()
		{
			return EnumerateFacenames(cast(цел)FontEncoding.wxFONTENCODING_SYSTEM, false);
		}
		
		public  бул EnumerateFacenames(FontEncoding кодировка)
		{
			return EnumerateFacenames(cast(цел)кодировка, false);
		}*/
		
		public  бул EnumerateFacenames(FontEncoding кодировка, бул fixedWidthOnly);
		extern(C) private static бул staticDoEnumerateFacenames(FontEnumerator объ, цел кодировка, бул fixedWidthOnly);
		//---------------------------------------------------------------------
		
		/*public  бул EnumerateEncodings()
		{
			return EnumerateEncodings(IntPtr.init);
		}*/
		
		public  бул EnumerateEncodings(ткст facename);
		extern(C) private static бул staticDoEnumerateEncodings(FontEnumerator объ, IntPtr facename);
	}
