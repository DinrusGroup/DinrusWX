//-----------------------------------------------------------------------------
// wxD - Рисунок.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Рисунок.cs
//
/// The wxImage wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Рисунок.d,v 1.11 2008/09/04 11:05:46 afb Exp $
//-----------------------------------------------------------------------------

module wx.Image;
public import wx.common;
public import wx.Defs;
//public import wx.Bitmap;
public import wx.Palette;
public import wx.Colour;

		//! \cond EXTERN
		static extern (C) ЦУк wxImage_ctor();
		static extern (C) ЦУк wxImage_ctorByName(ткст имя, ТипБитмапа тип);
		static extern (C) ЦУк wxImage_ctorintintbool(цел ширина, цел высота, бул clear);
		static extern (C) ЦУк wxImage_ctorByData(цел ширина, цел высота, ббайт* данные, бул статич_данные);
		static extern (C) ЦУк wxImage_ctorByDataAlpha(цел ширина, цел высота, ббайт* данные, ббайт* альфа, бул статич_данные);
		static extern (C) ЦУк wxImage_ctorByImage(ЦУк рисунок);
		static extern (C) ЦУк wxImage_ctorByByteArray(ЦУк данные, цел length, ТипБитмапа тип);
		static extern (C) проц   wxImage_dtor(ЦУк сам);
		
		static extern (C) проц   wxImage_Destroy(ЦУк сам);
		
		static extern (C) цел    wxImage_GetHeight(ЦУк сам);
		static extern (C) цел    wxImage_GetWidth(ЦУк сам);
		static extern (C) проц   wxImage_InitAllHandlers();
		static extern (C) проц   wxImage_Rescale(ЦУк сам, цел ширина, цел высота);
		static extern (C) ЦУк wxImage_Scale(ЦУк сам, цел ширина, цел высота);

		static extern (C) проц   wxImage_SetMask(ЦУк сам, бул маска);
		static extern (C) бул   wxImage_HasMask(ЦУк сам);
		static extern (C) проц   wxImage_SetMaskColour(ЦУк сам, ббайт к, ббайт з, ббайт с);

		static extern (C) бул   wxImage_LoadFileByTypeId(ЦУк сам, ткст имя, ТипБитмапа тип, цел индекс);
		static extern (C) бул   wxImage_LoadFileByMimeTypeId(ЦУк сам, ткст имя, ткст mimetype, цел индекс);
		static extern (C) бул   wxImage_SaveFileByType(ЦУк сам, ткст имя, ТипБитмапа тип);
		static extern (C) бул   wxImage_SaveFileByMimeType(ЦУк сам, ткст имя, ткст mimetype);
		
		static extern (C) ЦУк wxImage_Copy(ЦУк сам);
		static extern (C) ЦУк wxImage_GetSubImage(ЦУк сам, inout Прямоугольник прям);
		
		static extern (C) проц   wxImage_Paste(ЦУк сам, ЦУк рисунок, цел x, цел y);
		
		static extern (C) ЦУк wxImage_ShrinkBy(ЦУк сам, цел xFactor, цел yFactor);
		
		static extern (C) ЦУк wxImage_Rotate(ЦУк сам, дво угол, inout Точка центр_вращения, бул с_интерполяцией, inout Точка смещ_после_вращения);
		static extern (C) ЦУк wxImage_Rotate90(ЦУк сам, бул по_часовой);
		static extern (C) ЦУк wxImage_Mirror(ЦУк сам, бул горизонтально);
		
		static extern (C) проц   wxImage_Replace(ЦУк сам, ббайт r1, ббайт g1, ббайт b1, ббайт r2, ббайт g2, ббайт b2);
		
		static extern (C) ЦУк wxImage_ConvertToMono(ЦУк сам, ббайт к, ббайт з, ббайт с);
		
		static extern (C) проц   wxImage_SetRGB(ЦУк сам, цел x, цел y, ббайт к, ббайт з, ббайт с);
		
		static extern (C) ббайт   wxImage_GetRed(ЦУк сам, цел x, цел y);
		static extern (C) ббайт   wxImage_GetGreen(ЦУк сам, цел x, цел y);
		static extern (C) ббайт   wxImage_GetBlue(ЦУк сам, цел x, цел y);
		
		static extern (C) проц   wxImage_SetAlpha(ЦУк сам, цел x, цел y, ббайт альфа);
		static extern (C) ббайт   wxImage_GetAlpha(ЦУк сам, цел x, цел y);
		
		static extern (C) бул   wxImage_FindFirstUnusedColour(ЦУк сам, inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR, ббайт startG, ббайт startB);
		static extern (C) бул   wxImage_SetMaskFromImage(ЦУк сам, ЦУк маска, ббайт mr, ббайт mg, ббайт mb);
		
		static extern (C) бул   wxImage_ConvertAlphaToMask(ЦУк сам, ббайт порог);
		
		static extern (C) бул   wxImage_CanRead(ткст имя);
		static extern (C) цел    wxImage_GetImageCount(ткст имя, цел тип);
		
		static extern (C) бул   wxImage_Ok(ЦУк сам);
		//--Alex
		static extern (C) ббайт   wxImage_GetMaskRed(ЦУк сам);
		static extern (C) ббайт   wxImage_GetMaskGreen(ЦУк сам);
		static extern (C) ббайт   wxImage_GetMaskBlue(ЦУк сам);
		
		static extern (C) бул   wxImage_HasPalette(ЦУк сам);
		static extern (C) ЦУк wxImage_GetPalette(ЦУк сам);
		static extern (C) проц   wxImage_SetPalette(ЦУк сам, ЦУк палитра);
		
		static extern (C) проц   wxImage_SetOption(ЦУк сам, ткст имя, ткст значение);
		static extern (C) проц   wxImage_SetOption2(ЦУк сам, ткст имя, цел значение);
		static extern (C) ЦУк wxImage_GetOption(ЦУк сам, ткст имя);
		static extern (C) цел    wxImage_GetOptionInt(ЦУк сам, ткст имя);
		static extern (C) бул   wxImage_HasOption(ЦУк сам, ткст имя);
		
		static extern (C) бцел  wxImage_CountColours(ЦУк сам, бцел стоп_после);
		
		static extern (C) бцел  wxImage_ComputeHistogram(ЦУк сам, ЦУк h);
		
		static extern (C) ЦУк wxImage_GetHandlers();
		static extern (C) проц   wxImage_AddHandler(ЦУк handler);
		static extern (C) проц   wxImage_InsertHandler(ЦУк handler);
		static extern (C) бул   wxImage_RemoveHandler(ткст имя);
		static extern (C) ЦУк wxImage_FindHandler(ткст имя);
		static extern (C) ЦУк wxImage_FindHandler2(ткст имя, бцел imageType);
		static extern (C) ЦУк wxImage_FindHandler3(бцел imageType);
		static extern (C) ЦУк wxImage_FindHandlerMime(ткст mimetype);
		
		static extern (C) ЦУк wxImage_GetImageExtWildcard();
		
		static extern (C) проц   wxImage_CleanUpHandlers();
		
		static extern (C) проц   wxImage_InitStandardHandlers();
		//! \endcond

		//---------------------------------------------------------------------

	alias Рисунок wxImage;
	public class Рисунок : wxObject
	{
		private static бул обработчикиЗагружены = нет;
		
		public static проц ИницВсеОбработчики()
		{
			// We only want to load the рисунок handlers once.
			if (!обработчикиЗагружены) 
			{
				wxImage_InitAllHandlers();
				обработчикиЗагружены = да;
			}
		}

		static this()
		{
			ИницВсеОбработчики();
		}
		
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public this()
			{ this(wxImage_ctor());}

		public this(ткст имя)
			{ this(wxImage_ctorByName(имя, ТипБитмапа.wxBITMAP_TYPE_ANY));}
			
		public this(цел ширина, цел высота)
			{ this(ширина, высота, да);}
		
		public this(byte[] данные, ТипБитмапа тип)
			{ this(wxImage_ctorByByteArray(cast(ЦУк)данные.ptr, данные.length, тип));}
			
		public this(цел ширина, цел высота, бул clear)
			{ this(wxImage_ctorintintbool(ширина, высота, clear));}

		public this(цел ширина, цел высота, ббайт *данные, бул статич_данные)
			{ this(wxImage_ctorByData(ширина, высота, данные, статич_данные));}

		public this(цел ширина, цел высота, ббайт *данные, ббайт *альфа, бул статич_данные)
			{ this(wxImage_ctorByDataAlpha(ширина, высота, данные, альфа, статич_данные));}

		public this(Рисунок рисунок)
			{ this(wxImage_ctorByImage(wxObject.SafePtr(рисунок)));}
		
		public static wxObject Нов(ЦУк ptr) { return new Рисунок(ptr); }
		
		//---------------------------------------------------------------------
		
		public проц Разрушь()
		{
			wxImage_Destroy(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public цел Ширина() { return wxImage_GetWidth(шхобъ); }
		public цел Высота() { return wxImage_GetHeight(шхобъ); }
		public Размер size() { return Размер(Ширина,Высота); }

		//---------------------------------------------------------------------
		
		public бул ЗагрузиФайл(ткст путь)
		{
			return ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_ANY, -1);
		}
		
		public бул ЗагрузиФайл(ткст путь, ТипБитмапа тип)
		{
			return ЗагрузиФайл(путь, тип, -1);
		}
		
		public бул ЗагрузиФайл(ткст путь, ТипБитмапа тип, цел индекс)
		{
			return wxImage_LoadFileByTypeId(шхобъ, путь, тип, -1);
		}
		
		//---------------------------------------------------------------------
		
		public бул ЗагрузиФайл(ткст имя, ткст mimetype)
		{
			return ЗагрузиФайл(имя, mimetype, -1);
		}
		
		public бул ЗагрузиФайл(ткст имя, ткст mimetype, цел индекс)
		{
			return wxImage_LoadFileByMimeTypeId(шхобъ, имя, mimetype, индекс);
		}
		
		//---------------------------------------------------------------------

        	public бул СохраниФайл(ткст путь)
		{ 
			return СохраниФайл(путь, ТипБитмапа.wxBITMAP_TYPE_ANY); 
		}
		
		public бул СохраниФайл(ткст путь, ТипБитмапа тип)
		{
			return wxImage_SaveFileByType(шхобъ, путь, тип);
		}
		
		//---------------------------------------------------------------------
		
		public бул СохраниФайл(ткст имя, ткст mimetype)
		{
			return wxImage_SaveFileByMimeType(шхобъ, имя, mimetype);
		}

		//---------------------------------------------------------------------

		public Рисунок Ремасштабируй(цел ширина, цел высота)
		{
			wxImage_Rescale(шхобъ, ширина, высота);
			return this;
		}

		//---------------------------------------------------------------------

		public Рисунок Масштабируй(цел ширина, цел высота)
		{
			return new Рисунок(wxImage_Scale(шхобъ, ширина, высота));
		}

		//---------------------------------------------------------------------

		public проц УстЦветомаску(ббайт к, ббайт з, ббайт с)
		{
			wxImage_SetMaskColour(шхобъ, к, з, с);
		}
		
		//---------------------------------------------------------------------

		public проц Цветомаска(Цвет значение) { УстЦветомаску(значение.Красный, значение.Зелёный, значение.Синий); }
		
		//---------------------------------------------------------------------

		public проц Маска(бул значение) { wxImage_SetMask(шхобъ, значение); }
		public бул Маска() { return wxImage_HasMask(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public Рисунок Копируй()
		{
			return new Рисунок(wxImage_Copy(шхобъ));
		}
		
		//---------------------------------------------------------------------
		
		public Рисунок Подложка(Прямоугольник прям)
		{
			return cast(Рисунок)FindObject(wxImage_GetSubImage(шхобъ, прям), &Рисунок.Нов);
		}
		
		//---------------------------------------------------------------------
		
		public проц Вставь(Рисунок рисунок, цел x, цел y)
		{
			wxImage_Paste(шхобъ, wxObject.SafePtr(рисунок), x, y);
		}
		
		//---------------------------------------------------------------------
		
		public Рисунок СжатьПо(цел xFactor, цел yFactor)
		{
			return new Рисунок(wxImage_ShrinkBy(шхобъ, xFactor, yFactor));
		}
		
		//---------------------------------------------------------------------
		
		public Рисунок Вращай(дво угол, Точка центр_вращения)
		{
			Точка dummy;
			return Вращай(угол, центр_вращения, да, dummy);
		}
		
		public Рисунок Вращай(дво угол, Точка центр_вращения, бул с_интерполяцией)
		{
			Точка dummy;
			return Вращай(угол, центр_вращения, с_интерполяцией, dummy);
		}
		
		public Рисунок Вращай(дво угол, Точка центр_вращения, бул с_интерполяцией, Точка смещ_после_вращения)
		{
			return new Рисунок(wxImage_Rotate(шхобъ, угол, центр_вращения, с_интерполяцией, смещ_после_вращения));
		}
		
		//---------------------------------------------------------------------
		
		public Рисунок Вращай90()
		{
			return Вращай90(да);
		}
		
		public Рисунок Вращай90(бул по_часовой)
		{
			return new Рисунок(wxImage_Rotate90(шхобъ, по_часовой));
		}
		
		//---------------------------------------------------------------------
		
		public Рисунок Зеркало()
		{
			return Зеркало(да);
		}
		
		public Рисунок Зеркало(бул горизонтально)
		{
			return new Рисунок(wxImage_Mirror(шхобъ, горизонтально));
		}
		
		//---------------------------------------------------------------------
		
		public проц Замени(ббайт r1, ббайт g1, ббайт b1, ббайт r2, ббайт g2, ббайт b2)
		{
			wxImage_Replace(шхобъ, r1, g1, b1, r2, g2, b2);
		}
		
		//---------------------------------------------------------------------
		
		public проц ПреобразуйВМоно(ббайт к, ббайт з, ббайт с)
		{
			wxImage_ConvertToMono(шхобъ, к, з, с);
		}
		
		//---------------------------------------------------------------------
		
		public проц УстКЗС(цел x, цел y, ббайт к, ббайт з, ббайт с)
		{
			wxImage_SetRGB(шхобъ, x, y, к, з, с);
		}
		
		//---------------------------------------------------------------------
		
		public ббайт ДайКрасный(цел x, цел y)
		{
			return wxImage_GetRed(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public ббайт ДайЗелёный(цел x, цел y)
		{
			return wxImage_GetGreen(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public ббайт ДайСиний(цел x, цел y)
		{
			return wxImage_GetBlue(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц УстАльфу(цел x, цел y, ббайт альфа)
		{
			wxImage_SetAlpha(шхобъ, x, y, альфа);
		}
		
		//---------------------------------------------------------------------
		
		public ббайт ДайАльфу(цел x, цел y)
		{
			return wxImage_GetAlpha(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с)
		{
			return НайдиПервНеиспЦвет(к, з, с, 1, 0, 0);
		}
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR)
		{
			return НайдиПервНеиспЦвет(к, з, с, startR, 0, 0);
		}
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR, ббайт startG)
		{
			return НайдиПервНеиспЦвет(к, з, с, startR, startG, 0);
		}
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR, ббайт startG, ббайт startB)
		{
			return wxImage_FindFirstUnusedColour(шхобъ, к, з, с, startR, startG, startB);
		}
		
		//---------------------------------------------------------------------
		
		public бул УстМаскуИзРис(Рисунок маска, ббайт mr, ббайт mg, ббайт mb)
		{
			return wxImage_SetMaskFromImage(шхобъ, wxObject.SafePtr(маска), mr, mg, mb);
		}
		
		//---------------------------------------------------------------------
		
		public бул ПреобразуйАльфуВМаску()
		{
			return ПреобразуйАльфуВМаску(128);
		}
		
		public бул ПреобразуйАльфуВМаску(ббайт порог)
		{
			return wxImage_ConvertAlphaToMask(шхобъ, порог);
		}
		
		//---------------------------------------------------------------------
		
		public static бул Читается(ткст имя)
		{
			return wxImage_CanRead(имя);
		}
		
		//---------------------------------------------------------------------
		
		public static цел ДайЧлоРисунков(ткст имя)
		{
			return ДайЧлоРисунков(имя, ТипБитмапа.wxBITMAP_TYPE_ANY);
		}
		
		public static цел ДайЧлоРисунков(ткст имя, ТипБитмапа тип)
		{
			return wxImage_GetImageCount(имя, cast(цел)тип);
		}
		
		//---------------------------------------------------------------------
		
		public бул Ок() { return wxImage_Ok(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public ббайт КМаска() { return wxImage_GetMaskRed(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public ббайт ЗМаска() { return wxImage_GetMaskGreen(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public ббайт СМаска() { return wxImage_GetMaskBlue(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул ЕстьПалитра()
		{
			return wxImage_HasPalette(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public Палитра палитра() { return cast(Палитра)FindObject(wxImage_GetPalette(шхобъ), &Палитра.Нов); }
		public проц палитра(Палитра значение) { wxImage_SetPalette(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public проц УстОпц(ткст имя, ткст значение)
		{
			wxImage_SetOption(шхобъ, имя, значение);
		}
		
		//---------------------------------------------------------------------
		
		public проц УстОпц(ткст имя, цел значение)
		{
			wxImage_SetOption2(шхобъ, имя, значение);
		}
		
		//---------------------------------------------------------------------
		
		public ткст ДайОпц(ткст имя)
		{
			return cast(ткст) new wxString(wxImage_GetOption(шхобъ, имя), да);
		}
		
		//---------------------------------------------------------------------
		
		public цел ДайОпцЦел(ткст имя)
		{
			return wxImage_GetOptionInt(шхобъ, имя);
		}
		
		//---------------------------------------------------------------------
		
		public бул ЕстьОпц(ткст имя)
		{
			return wxImage_HasOption(шхобъ, имя);
		}
		
		//---------------------------------------------------------------------
		
		public бцел ЧлоЦветов()
		{
			return ЧлоЦветов(бцел.max-1);
		}
		
		//---------------------------------------------------------------------
		
		public бцел ЧлоЦветов(бцел стоп_после)
		{
			return wxImage_CountColours(шхобъ, стоп_после);
		}
		
		//---------------------------------------------------------------------
		
		public бцел ВычислиГистограмму(ГистограммаРисунка h)
		{
			return wxImage_ComputeHistogram(шхобъ, wxObject.SafePtr(h));
		}
		
		//---------------------------------------------------------------------
		
		/*
		// doesn't work. wxImageHandler is an abstract class...
		static ArrayList Handlers() { 
				wxList wl = new wxList(wxImage_GetHandlers());
				ArrayList al = new ArrayList();
				
				for (цел i = 0; i < wl.Счёт; i++)
                	al.Добавь(new ImageHandler(wl.Элемент(i)));
					
				return wl;
			}
		*/
		
		//---------------------------------------------------------------------
		
		public static проц AddHandler(ImageHandler handler)
		{
			wxImage_AddHandler(wxObject.SafePtr(handler));
		}
		
		//---------------------------------------------------------------------
		
		public static проц InsertHandler(ImageHandler handler)
		{
			wxImage_InsertHandler(wxObject.SafePtr(handler));
		}
		
		//---------------------------------------------------------------------
		
		public static бул RemoveHandler(ткст имя)
		{
			return wxImage_RemoveHandler(имя);
		}
		
		//---------------------------------------------------------------------
		
		public static ImageHandler FindHandler(ткст имя)
		{
			return cast(ImageHandler)FindObject(wxImage_FindHandler(имя));
		}
		
		//---------------------------------------------------------------------
		
		public static ImageHandler FindHandler(ткст extension, цел imageType)
		{
			return cast(ImageHandler)FindObject(wxImage_FindHandler2(extension, cast(бцел)imageType));
		}
		
		//---------------------------------------------------------------------
		
		public static ImageHandler FindHandler(цел imageType)
		{
			return cast(ImageHandler)FindObject(wxImage_FindHandler3(cast(бцел)imageType));
		}
		
		//---------------------------------------------------------------------
		
		public static ImageHandler FindHandlerMime(ткст mimetype)
		{
			return cast(ImageHandler)FindObject(wxImage_FindHandlerMime(mimetype));
		}
		
		//---------------------------------------------------------------------
		
		static ткст ImageExtWildcard() { return cast(ткст) new wxString(wxImage_GetImageExtWildcard(), да); }
		
		//---------------------------------------------------------------------
		
		public static проц CleanUpHandlers()
		{
			wxImage_CleanUpHandlers();
		}
		
		//---------------------------------------------------------------------
		
		public static проц InitStandardHandlers()
		{
			wxImage_InitStandardHandlers();
		}
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) проц   wxImageHandler_SetName(ЦУк сам, ткст имя);
		static extern (C) проц   wxImageHandler_SetExtension(ЦУк сам, ткст ext);
		static extern (C) проц   wxImageHandler_SetType(ЦУк сам, бцел тип);
		static extern (C) проц   wxImageHandler_SetMimeType(ЦУк сам, ткст тип);
		static extern (C) ЦУк wxImageHandler_GetName(ЦУк сам);
		static extern (C) ЦУк wxImageHandler_GetExtension(ЦУк сам);
		static extern (C) бцел   wxImageHandler_GetType(ЦУк сам);
		static extern (C) ЦУк wxImageHandler_GetMimeType(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------
	
	alias ImageHandler wxImageHandler;
	public class ImageHandler : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
		
		//---------------------------------------------------------------------
		
		public ткст Имя() { return cast(ткст) new wxString(wxImageHandler_GetName(шхобъ), да); }
		public проц Имя(ткст значение) { wxImageHandler_SetName(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public ткст Extension() { return cast(ткст) new wxString(wxImageHandler_GetExtension(шхобъ), да); }
		public проц Extension(ткст значение) { wxImageHandler_SetExtension(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public цел Тип() { return cast(цел)wxImageHandler_GetType(шхобъ); }
		public проц Тип(цел значение) { wxImageHandler_SetType(шхобъ, cast(бцел)значение); }
		
		//---------------------------------------------------------------------
		
		public ткст MimeType() { return cast(ткст) new wxString(wxImageHandler_GetMimeType(шхобъ), да); }
		public проц MimeType(ткст значение) { wxImageHandler_SetMimeType(шхобъ, значение); }
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxImageHistogramEntry_ctor();
		static extern (C) проц   wxImageHistogramEntry_dtor(ЦУк сам);
		static extern (C) бцел  wxImageHistogramEntry_index(ЦУк сам);
		static extern (C) проц   wxImageHistogramEntry_Setindex(ЦУк сам, бцел v);
		static extern (C) бцел  wxImageHistogramEntry_value(ЦУк сам);
		static extern (C) проц   wxImageHistogramEntry_Setvalue(ЦУк сам, бцел v);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias ImageHistogramEntry wxImageHistogramEntry;
	public class ImageHistogramEntry : wxObject
	{
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
			{ this(wxImageHistogramEntry_ctor(), да);}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxImageHistogramEntry_dtor(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бцел индекс() { return wxImageHistogramEntry_index(шхобъ); }
		public проц индекс(бцел значение) { wxImageHistogramEntry_Setindex(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public бцел значение() { return wxImageHistogramEntry_value(шхобъ); }
		public проц значение(бцел значение) { wxImageHistogramEntry_Setvalue(шхобъ, значение); }
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxImageHistogram_ctor();	
		static extern (C) проц   wxImageHistogram_dtor(ЦУк сам);
		static extern (C) бцел  wxImageHistogram_MakeKey(ббайт к, ббайт з, ббайт с);
		static extern (C) бул   wxImageHistogram_FindFirstUnusedColour(ЦУк сам, inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR, ббайт startG, ббайт startB);
		//! \endcond
				
		//---------------------------------------------------------------------
		
	alias ГистограммаРисунка wxImageHistogram;
	public class ГистограммаРисунка : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this(wxImageHistogram_ctor());}
		
		//---------------------------------------------------------------------
		
		public static бцел MakeKey(ббайт к, ббайт з, ббайт с)
		{
			return wxImageHistogram_MakeKey(к, з, с);
		}
		
		//---------------------------------------------------------------------
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с)
		{
			return НайдиПервНеиспЦвет(к, з, с, 1, 0, 0);
		}
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR)
		{
			return НайдиПервНеиспЦвет(к, з, с, startR, 0, 0);
		}
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR, ббайт startG)
		{
			return НайдиПервНеиспЦвет(к, з, с, startR, startG, 0);
		}
		
		public бул НайдиПервНеиспЦвет(inout ббайт к, inout ббайт з, inout ббайт с, ббайт startR, ббайт startG, ббайт startB)
		{
			return wxImageHistogram_FindFirstUnusedColour(шхобъ, к, з, с, startR, startG, startB);
		}
	}
