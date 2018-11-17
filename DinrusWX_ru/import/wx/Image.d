
module wx.Image;
public import wx.common;
public import wx.Defs;
//public import wx.Bitmap;
public import wx.Palette;
public import wx.Colour;

		//! \cond EXTERN
		static extern (C) IntPtr wxImage_ctor();
		static extern (C) IntPtr wxImage_ctorByName(ткст имя, BitmapType тип);
		static extern (C) IntPtr wxImage_ctorintintbool(цел ширь, цел высь, бул clear);
		static extern (C) IntPtr wxImage_ctorByData(цел ширь, цел высь, ubyte* data, бул static_data);
		static extern (C) IntPtr wxImage_ctorByDataAlpha(цел ширь, цел высь, ubyte* data, ubyte* alpha, бул static_data);
		static extern (C) IntPtr wxImage_ctorByImage(IntPtr рисунок);
		static extern (C) IntPtr wxImage_ctorByByteArray(IntPtr data, цел length, BitmapType тип);
		static extern (C) проц   wxImage_dtor(IntPtr сам);
		
		static extern (C) проц   wxImage_Destroy(IntPtr сам);
		
		static extern (C) цел    wxImage_GetHeight(IntPtr сам);
		static extern (C) цел    wxImage_GetWidth(IntPtr сам);
		static extern (C) проц   wxImage_InitAllHandlers();
		static extern (C) проц   wxImage_Rescale(IntPtr сам, цел ширь, цел высь);
		static extern (C) IntPtr wxImage_Scale(IntPtr сам, цел ширь, цел высь);

		static extern (C) проц   wxImage_SetMask(IntPtr сам, бул маска);
		static extern (C) бул   wxImage_HasMask(IntPtr сам);
		static extern (C) проц   wxImage_SetMaskColour(IntPtr сам, ubyte r, ubyte g, ubyte b);

		static extern (C) бул   wxImage_LoadFileByTypeId(IntPtr сам, ткст имя, BitmapType тип, цел index);
		static extern (C) бул   wxImage_LoadFileByMimeTypeId(IntPtr сам, ткст имя, ткст mimetype, цел index);
		static extern (C) бул   wxImage_SaveFileByType(IntPtr сам, ткст имя, BitmapType тип);
		static extern (C) бул   wxImage_SaveFileByMimeType(IntPtr сам, ткст имя, ткст mimetype);
		
		static extern (C) IntPtr wxImage_Copy(IntPtr сам);
		static extern (C) IntPtr wxImage_GetSubImage(IntPtr сам, inout Прямоугольник прям);
		
		static extern (C) проц   wxImage_Paste(IntPtr сам, IntPtr рисунок, цел x, цел y);
		
		static extern (C) IntPtr wxImage_ShrinkBy(IntPtr сам, цел xFactor, цел yFactor);
		
		static extern (C) IntPtr wxImage_Rotate(IntPtr сам, double angle, inout Точка centre_of_rotation, бул interpolating, inout Точка offset_after_rotation);
		static extern (C) IntPtr wxImage_Rotate90(IntPtr сам, бул clockwise);
		static extern (C) IntPtr wxImage_Mirror(IntPtr сам, бул horizontally);
		
		static extern (C) проц   wxImage_Replace(IntPtr сам, ubyte r1, ubyte g1, ubyte b1, ubyte r2, ubyte g2, ubyte b2);
		
		static extern (C) IntPtr wxImage_ConvertToMono(IntPtr сам, ubyte r, ubyte g, ubyte b);
		
		static extern (C) проц   wxImage_SetRGB(IntPtr сам, цел x, цел y, ubyte r, ubyte g, ubyte b);
		
		static extern (C) ubyte   wxImage_GetRed(IntPtr сам, цел x, цел y);
		static extern (C) ubyte   wxImage_GetGreen(IntPtr сам, цел x, цел y);
		static extern (C) ubyte   wxImage_GetBlue(IntPtr сам, цел x, цел y);
		
		static extern (C) проц   wxImage_SetAlpha(IntPtr сам, цел x, цел y, ubyte alpha);
		static extern (C) ubyte   wxImage_GetAlpha(IntPtr сам, цел x, цел y);
		
		static extern (C) бул   wxImage_FindFirstUnusedColour(IntPtr сам, inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB);
		static extern (C) бул   wxImage_SetMaskFromImage(IntPtr сам, IntPtr маска, ubyte mr, ubyte mg, ubyte mb);
		
		static extern (C) бул   wxImage_ConvertAlphaToMask(IntPtr сам, ubyte threshold);
		
		static extern (C) бул   wxImage_CanRead(ткст имя);
		static extern (C) цел    wxImage_GetImageCount(ткст имя, цел тип);
		
		static extern (C) бул   wxImage_Ok(IntPtr сам);
		//--Alex
		static extern (C) ubyte   wxImage_GetMaskRed(IntPtr сам);
		static extern (C) ubyte   wxImage_GetMaskGreen(IntPtr сам);
		static extern (C) ubyte   wxImage_GetMaskBlue(IntPtr сам);
		
		static extern (C) бул   wxImage_HasPalette(IntPtr сам);
		static extern (C) IntPtr wxImage_GetPalette(IntPtr сам);
		static extern (C) проц   wxImage_SetPalette(IntPtr сам, IntPtr палитра);
		
		static extern (C) проц   wxImage_SetOption(IntPtr сам, ткст имя, ткст значение);
		static extern (C) проц   wxImage_SetOption2(IntPtr сам, ткст имя, цел значение);
		static extern (C) IntPtr wxImage_GetOption(IntPtr сам, ткст имя);
		static extern (C) цел    wxImage_GetOptionInt(IntPtr сам, ткст имя);
		static extern (C) бул   wxImage_HasOption(IntPtr сам, ткст имя);
		
		static extern (C) бцел  wxImage_CountColours(IntPtr сам, бцел stopafter);
		
		static extern (C) бцел  wxImage_ComputeHistogram(IntPtr сам, IntPtr h);
		
		static extern (C) IntPtr wxImage_GetHandlers();
		static extern (C) проц   wxImage_AddHandler(IntPtr обработчик);
		static extern (C) проц   wxImage_InsertHandler(IntPtr обработчик);
		static extern (C) бул   wxImage_RemoveHandler(ткст имя);
		static extern (C) IntPtr wxImage_FindHandler(ткст имя);
		static extern (C) IntPtr wxImage_FindHandler2(ткст имя, бцел imageType);
		static extern (C) IntPtr wxImage_FindHandler3(бцел imageType);
		static extern (C) IntPtr wxImage_FindHandlerMime(ткст mimetype);
		
		static extern (C) IntPtr wxImage_GetImageExtWildcard();
		
		static extern (C) проц   wxImage_CleanUpHandlers();
		
		static extern (C) проц   wxImage_InitStandardHandlers();
		//! \endcond

		//---------------------------------------------------------------------

	alias Рисунок wxImage;
	public class Рисунок : wxObject
	{
		private static бул handlersLoaded = false;
		
		public static проц InitAllHandlers();
		static this();		
		public this(IntPtr wxobj);
		public this();
		public this(ткст имя);
		public this(цел ширь, цел высь);
		public this(byte[] data, BitmapType тип);
		public this(цел ширь, цел высь, бул clear);
		public this(цел ширь, цел высь, ubyte *data, бул static_data);
		public this(цел ширь, цел высь, ubyte *data, ubyte *alpha, бул static_data);
		public this(Рисунок рисунок);
		public static wxObject Нов(IntPtr ptr);
		public проц Разрушь();
		public цел Ширь() ;
		public цел Высь() ;
		public Размер разм();
		public бул ЗагрузиФайл(ткст path);
		public бул ЗагрузиФайл(ткст path, BitmapType тип);
		public бул ЗагрузиФайл(ткст path, BitmapType тип, цел index);
		public бул ЗагрузиФайл(ткст имя, ткст mimetype);
		public бул ЗагрузиФайл(ткст имя, ткст mimetype, цел index);
        	public бул СохраниФайл(ткст path);
		public бул СохраниФайл(ткст path, BitmapType тип);
		public бул СохраниФайл(ткст имя, ткст mimetype);
		public Рисунок Rescale(цел ширь, цел высь);
		public Рисунок Scale(цел ширь, цел высь);
		public проц УстMaskColour(ubyte r, ubyte g, ubyte b);
		public проц MaskColour(Цвет значение);
		public проц Маска(бул значение);
		public бул Маска() ;
		public Рисунок Copy();
		public Рисунок SubImage(Прямоугольник прям);
		public проц Paste(Рисунок рисунок, цел x, цел y);
		public Рисунок ShrinkBy(цел xFactor, цел yFactor);
		public Рисунок Rotate(double angle, Точка centre_of_rotation);
		public Рисунок Rotate(double angle, Точка centre_of_rotation, бул interpolating);
		public Рисунок Rotate(double angle, Точка centre_of_rotation, бул interpolating, Точка offset_after_rotation);
		public Рисунок Rotate90();
		public Рисунок Rotate90(бул clockwise);
		public Рисунок Mirror();
		public Рисунок Mirror(бул horizontally);
		public проц Replace(ubyte r1, ubyte g1, ubyte b1, ubyte r2, ubyte g2, ubyte b2);
		public проц ConvertToMono(ubyte r, ubyte g, ubyte b);
		public проц УстRGB(цел x, цел y, ubyte r, ubyte g, ubyte b);
		public ubyte GetRed(цел x, цел y);
		public ubyte GetGreen(цел x, цел y);
		public ubyte GetBlue(цел x, цел y);
		public проц УстAlpha(цел x, цел y, ubyte alpha);
		public ubyte GetAlpha(цел x, цел y);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB);
		public бул УстMaskFromImage(Рисунок маска, ubyte mr, ubyte mg, ubyte mb);
		public бул ConvertAlphaToMask();
		public бул ConvertAlphaToMask(ubyte threshold);
		public static бул CanRead(ткст имя);
		public static цел GetImageCount(ткст имя);
		public static цел GetImageCount(ткст имя, BitmapType тип);
		public бул Ок() ;
		public ubyte MaskRed() ;
		public ubyte MaskGreen();
		public ubyte MaskBlue() ;
		public бул HasPalette();
		public Палитра палитра() ;
		public проц палитра(Палитра значение) ;
		public проц УстOption(ткст имя, ткст значение);
		public проц УстOption(ткст имя, цел значение);
		public ткст GetOption(ткст имя);
		public цел GetOptionInt(ткст имя);
		public бул HasOption(ткст имя);
		public бцел CountColours();
		public бцел CountColours(бцел stopafter);
		public бцел ComputeHistogram(ImageHistogram h);
		public static проц AddHandler(ImageHandler обработчик);
		public static проц InsertHandler(ImageHandler обработчик);
		public static бул RemoveHandler(ткст имя);
		public static ImageHandler FindHandler(ткст имя);
		public static ImageHandler FindHandler(ткст extension, цел imageType);
		public static ImageHandler FindHandler(цел imageType);
		public static ImageHandler FindHandlerMime(ткст mimetype);
		static ткст ImageExtWildcard();
		public static проц CleanUpHandlers();
		public static проц InitStandardHandlers();
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) проц   wxImageHandler_SetName(IntPtr сам, ткст имя);
		static extern (C) проц   wxImageHandler_SetExtension(IntPtr сам, ткст ext);
		static extern (C) проц   wxImageHandler_SetType(IntPtr сам, бцел тип);
		static extern (C) проц   wxImageHandler_SetMimeType(IntPtr сам, ткст тип);
		static extern (C) IntPtr wxImageHandler_GetName(IntPtr сам);
		static extern (C) IntPtr wxImageHandler_GetExtension(IntPtr сам);
		static extern (C) бцел   wxImageHandler_GetType(IntPtr сам);
		static extern (C) IntPtr wxImageHandler_GetMimeType(IntPtr сам);
		//! \endcond
		
		//---------------------------------------------------------------------
	
	alias ImageHandler wxImageHandler;
	public class ImageHandler : wxObject
	{
		public this(IntPtr wxobj);
		public ткст Имя();
		public проц Имя(ткст значение);
		public ткст Extension() ;
		public проц Extension(ткст значение) ;
		public цел Тип() ;
		public проц Тип(цел значение);
		public ткст MimeType();
		public проц MimeType(ткст значение) ;
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxImageHistogramEntry_ctor();
		static extern (C) проц   wxImageHistogramEntry_dtor(IntPtr сам);
		static extern (C) бцел  wxImageHistogramEntry_index(IntPtr сам);
		static extern (C) проц   wxImageHistogramEntry_Setindex(IntPtr сам, бцел v);
		static extern (C) бцел  wxImageHistogramEntry_value(IntPtr сам);
		static extern (C) проц   wxImageHistogramEntry_Setvalue(IntPtr сам, бцел v);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias ImageHistogramEntry wxImageHistogramEntry;
	public class ImageHistogramEntry : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor();
		public бцел index();
		public проц index(бцел значение);
		public бцел значение() ;
		public проц значение(бцел значение);
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxImageHistogram_ctor();	
		static extern (C) проц   wxImageHistogram_dtor(IntPtr сам);
		static extern (C) бцел  wxImageHistogram_MakeKey(ubyte r, ubyte g, ubyte b);
		static extern (C) бул   wxImageHistogram_FindFirstUnusedColour(IntPtr сам, inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB);
		//! \endcond
				
		//---------------------------------------------------------------------
		
	alias ImageHistogram wxImageHistogram;
	public class ImageHistogram : wxObject
	{
		public this(IntPtr wxobj);
		public this();
		public static бцел MakeKey(ubyte r, ubyte g, ubyte b);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG);
		public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB);
	}
