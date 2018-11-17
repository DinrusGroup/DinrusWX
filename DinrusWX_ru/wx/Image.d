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
static extern (C) ЦелУкз wxImage_ctor();
static extern (C) ЦелУкз wxImage_ctorByName(ткст имя, BitmapType тип);
static extern (C) ЦелУкз wxImage_ctorintintbool(цел ширь, цел высь, бул clear);
static extern (C) ЦелУкз wxImage_ctorByData(цел ширь, цел высь, ubyte* data, бул static_data);
static extern (C) ЦелУкз wxImage_ctorByDataAlpha(цел ширь, цел высь, ubyte* data, ubyte* alpha, бул static_data);
static extern (C) ЦелУкз wxImage_ctorByImage(ЦелУкз рисунок);
static extern (C) ЦелУкз wxImage_ctorByByteArray(ЦелУкз data, цел length, BitmapType тип);
static extern (C) проц   wxImage_dtor(ЦелУкз сам);

static extern (C) проц   wxImage_Destroy(ЦелУкз сам);

static extern (C) цел    wxImage_GetHeight(ЦелУкз сам);
static extern (C) цел    wxImage_GetWidth(ЦелУкз сам);
static extern (C) проц   wxImage_InitAllHandlers();
static extern (C) проц   wxImage_Rescale(ЦелУкз сам, цел ширь, цел высь);
static extern (C) ЦелУкз wxImage_Scale(ЦелУкз сам, цел ширь, цел высь);

static extern (C) проц   wxImage_SetMask(ЦелУкз сам, бул маска);
static extern (C) бул   wxImage_HasMask(ЦелУкз сам);
static extern (C) проц   wxImage_SetMaskColour(ЦелУкз сам, ubyte r, ubyte g, ubyte b);

static extern (C) бул   wxImage_LoadFileByTypeId(ЦелУкз сам, ткст имя, BitmapType тип, цел index);
static extern (C) бул   wxImage_LoadFileByMimeTypeId(ЦелУкз сам, ткст имя, ткст mimetype, цел index);
static extern (C) бул   wxImage_SaveFileByType(ЦелУкз сам, ткст имя, BitmapType тип);
static extern (C) бул   wxImage_SaveFileByMimeType(ЦелУкз сам, ткст имя, ткст mimetype);

static extern (C) ЦелУкз wxImage_Copy(ЦелУкз сам);
static extern (C) ЦелУкз wxImage_GetSubImage(ЦелУкз сам, inout Прямоугольник прям);

static extern (C) проц   wxImage_Paste(ЦелУкз сам, ЦелУкз рисунок, цел x, цел y);

static extern (C) ЦелУкз wxImage_ShrinkBy(ЦелУкз сам, цел xFactor, цел yFactor);

static extern (C) ЦелУкз wxImage_Rotate(ЦелУкз сам, double angle, inout Точка centre_of_rotation, бул interpolating, inout Точка offset_after_rotation);
static extern (C) ЦелУкз wxImage_Rotate90(ЦелУкз сам, бул clockwise);
static extern (C) ЦелУкз wxImage_Mirror(ЦелУкз сам, бул horizontally);

static extern (C) проц   wxImage_Replace(ЦелУкз сам, ubyte r1, ubyte g1, ubyte b1, ubyte r2, ubyte g2, ubyte b2);

static extern (C) ЦелУкз wxImage_ConvertToMono(ЦелУкз сам, ubyte r, ubyte g, ubyte b);

static extern (C) проц   wxImage_SetRGB(ЦелУкз сам, цел x, цел y, ubyte r, ubyte g, ubyte b);

static extern (C) ubyte   wxImage_GetRed(ЦелУкз сам, цел x, цел y);
static extern (C) ubyte   wxImage_GetGreen(ЦелУкз сам, цел x, цел y);
static extern (C) ubyte   wxImage_GetBlue(ЦелУкз сам, цел x, цел y);

static extern (C) проц   wxImage_SetAlpha(ЦелУкз сам, цел x, цел y, ubyte alpha);
static extern (C) ubyte   wxImage_GetAlpha(ЦелУкз сам, цел x, цел y);

static extern (C) бул   wxImage_FindFirstUnusedColour(ЦелУкз сам, inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB);
static extern (C) бул   wxImage_SetMaskFromImage(ЦелУкз сам, ЦелУкз маска, ubyte mr, ubyte mg, ubyte mb);

static extern (C) бул   wxImage_ConvertAlphaToMask(ЦелУкз сам, ubyte threshold);

static extern (C) бул   wxImage_CanRead(ткст имя);
static extern (C) цел    wxImage_GetImageCount(ткст имя, цел тип);

static extern (C) бул   wxImage_Ok(ЦелУкз сам);
//--Alex
static extern (C) ubyte   wxImage_GetMaskRed(ЦелУкз сам);
static extern (C) ubyte   wxImage_GetMaskGreen(ЦелУкз сам);
static extern (C) ubyte   wxImage_GetMaskBlue(ЦелУкз сам);

static extern (C) бул   wxImage_HasPalette(ЦелУкз сам);
static extern (C) ЦелУкз wxImage_GetPalette(ЦелУкз сам);
static extern (C) проц   wxImage_SetPalette(ЦелУкз сам, ЦелУкз палитра);

static extern (C) проц   wxImage_SetOption(ЦелУкз сам, ткст имя, ткст значение);
static extern (C) проц   wxImage_SetOption2(ЦелУкз сам, ткст имя, цел значение);
static extern (C) ЦелУкз wxImage_GetOption(ЦелУкз сам, ткст имя);
static extern (C) цел    wxImage_GetOptionInt(ЦелУкз сам, ткст имя);
static extern (C) бул   wxImage_HasOption(ЦелУкз сам, ткст имя);

static extern (C) бцел  wxImage_CountColours(ЦелУкз сам, бцел stopafter);

static extern (C) бцел  wxImage_ComputeHistogram(ЦелУкз сам, ЦелУкз h);

static extern (C) ЦелУкз wxImage_GetHandlers();
static extern (C) проц   wxImage_AddHandler(ЦелУкз обработчик);
static extern (C) проц   wxImage_InsertHandler(ЦелУкз обработчик);
static extern (C) бул   wxImage_RemoveHandler(ткст имя);
static extern (C) ЦелУкз wxImage_FindHandler(ткст имя);
static extern (C) ЦелУкз wxImage_FindHandler2(ткст имя, бцел imageType);
static extern (C) ЦелУкз wxImage_FindHandler3(бцел imageType);
static extern (C) ЦелУкз wxImage_FindHandlerMime(ткст mimetype);

static extern (C) ЦелУкз wxImage_GetImageExtWildcard();

static extern (C) проц   wxImage_CleanUpHandlers();

static extern (C) проц   wxImage_InitStandardHandlers();
//! \endcond

//---------------------------------------------------------------------

alias Рисунок wxImage;
public class Рисунок : wxObject
{
    private static бул handlersLoaded = false;

    public static проц InitAllHandlers()
    {
        // We only want to load the рисунок handlers once.
        if (!handlersLoaded)
        {
            wxImage_InitAllHandlers();
            handlersLoaded = да;
        }
    }

    static this()
    {
        InitAllHandlers();
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxImage_ctor());
    }

    public this(ткст имя)
    {
        this(wxImage_ctorByName(имя, BitmapType.wxBITMAP_TYPE_ANY));
    }

    public this(цел ширь, цел высь)
    {
        this(ширь, высь, да);
    }

    public this(byte[] data, BitmapType тип)
    {
        this(wxImage_ctorByByteArray(cast(ЦелУкз)data.ptr, data.length, тип));
    }

    public this(цел ширь, цел высь, бул clear)
    {
        this(wxImage_ctorintintbool(ширь, высь, clear));
    }

    public this(цел ширь, цел высь, ubyte *data, бул static_data)
    {
        this(wxImage_ctorByData(ширь, высь, data, static_data));
    }

    public this(цел ширь, цел высь, ubyte *data, ubyte *alpha, бул static_data)
    {
        this(wxImage_ctorByDataAlpha(ширь, высь, data, alpha, static_data));
    }

    public this(Рисунок рисунок)
    {
        this(wxImage_ctorByImage(wxObject.SafePtr(рисунок)));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new Рисунок(ptr);
    }

    //---------------------------------------------------------------------

    public проц Разрушь()
    {
        wxImage_Destroy(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Ширь()
    {
        return wxImage_GetWidth(wxobj);
    }
    public цел Высь()
    {
        return wxImage_GetHeight(wxobj);
    }
    public Размер размер()
    {
        return Размер(Ширь,Высь);
    }

    //---------------------------------------------------------------------

    public бул ЗагрузиФайл(ткст path)
    {
        return ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_ANY, -1);
    }

    public бул ЗагрузиФайл(ткст path, BitmapType тип)
    {
        return ЗагрузиФайл(path, тип, -1);
    }

    public бул ЗагрузиФайл(ткст path, BitmapType тип, цел index)
    {
        return wxImage_LoadFileByTypeId(wxobj, path, тип, -1);
    }

    //---------------------------------------------------------------------

    public бул ЗагрузиФайл(ткст имя, ткст mimetype)
    {
        return ЗагрузиФайл(имя, mimetype, -1);
    }

    public бул ЗагрузиФайл(ткст имя, ткст mimetype, цел index)
    {
        return wxImage_LoadFileByMimeTypeId(wxobj, имя, mimetype, index);
    }

    //---------------------------------------------------------------------

    public бул СохраниФайл(ткст path)
    {
        return СохраниФайл(path, BitmapType.wxBITMAP_TYPE_ANY);
    }

    public бул СохраниФайл(ткст path, BitmapType тип)
    {
        return wxImage_SaveFileByType(wxobj, path, тип);
    }

    //---------------------------------------------------------------------

    public бул СохраниФайл(ткст имя, ткст mimetype)
    {
        return wxImage_SaveFileByMimeType(wxobj, имя, mimetype);
    }

    //---------------------------------------------------------------------

    public Рисунок Rescale(цел ширь, цел высь)
    {
        wxImage_Rescale(wxobj, ширь, высь);
        return this;
    }

    //---------------------------------------------------------------------

    public Рисунок Scale(цел ширь, цел высь)
    {
        return new Рисунок(wxImage_Scale(wxobj, ширь, высь));
    }

    //---------------------------------------------------------------------

    public проц УстMaskColour(ubyte r, ubyte g, ubyte b)
    {
        wxImage_SetMaskColour(wxobj, r, g, b);
    }

    //---------------------------------------------------------------------

    public проц MaskColour(Цвет значение)
    {
        УстMaskColour(значение.Red, значение.Green, значение.Blue);
    }

    //---------------------------------------------------------------------

    public проц Маска(бул значение)
    {
        wxImage_SetMask(wxobj, значение);
    }
    public бул Маска()
    {
        return wxImage_HasMask(wxobj);
    }

    //---------------------------------------------------------------------

    public Рисунок Copy()
    {
        return new Рисунок(wxImage_Copy(wxobj));
    }

    //---------------------------------------------------------------------

    public Рисунок SubImage(Прямоугольник прям)
    {
        return cast(Рисунок)НайдиОбъект(wxImage_GetSubImage(wxobj, прям), &Рисунок.Нов);
    }

    //---------------------------------------------------------------------

    public проц Paste(Рисунок рисунок, цел x, цел y)
    {
        wxImage_Paste(wxobj, wxObject.SafePtr(рисунок), x, y);
    }

    //---------------------------------------------------------------------

    public Рисунок ShrinkBy(цел xFactor, цел yFactor)
    {
        return new Рисунок(wxImage_ShrinkBy(wxobj, xFactor, yFactor));
    }

    //---------------------------------------------------------------------

    public Рисунок Rotate(double angle, Точка centre_of_rotation)
    {
        Точка dummy;
        return Rotate(angle, centre_of_rotation, да, dummy);
    }

    public Рисунок Rotate(double angle, Точка centre_of_rotation, бул interpolating)
    {
        Точка dummy;
        return Rotate(angle, centre_of_rotation, interpolating, dummy);
    }

    public Рисунок Rotate(double angle, Точка centre_of_rotation, бул interpolating, Точка offset_after_rotation)
    {
        return new Рисунок(wxImage_Rotate(wxobj, angle, centre_of_rotation, interpolating, offset_after_rotation));
    }

    //---------------------------------------------------------------------

    public Рисунок Rotate90()
    {
        return Rotate90(да);
    }

    public Рисунок Rotate90(бул clockwise)
    {
        return new Рисунок(wxImage_Rotate90(wxobj, clockwise));
    }

    //---------------------------------------------------------------------

    public Рисунок Mirror()
    {
        return Mirror(да);
    }

    public Рисунок Mirror(бул horizontally)
    {
        return new Рисунок(wxImage_Mirror(wxobj, horizontally));
    }

    //---------------------------------------------------------------------

    public проц Replace(ubyte r1, ubyte g1, ubyte b1, ubyte r2, ubyte g2, ubyte b2)
    {
        wxImage_Replace(wxobj, r1, g1, b1, r2, g2, b2);
    }

    //---------------------------------------------------------------------

    public проц ConvertToMono(ubyte r, ubyte g, ubyte b)
    {
        wxImage_ConvertToMono(wxobj, r, g, b);
    }

    //---------------------------------------------------------------------

    public проц УстRGB(цел x, цел y, ubyte r, ubyte g, ubyte b)
    {
        wxImage_SetRGB(wxobj, x, y, r, g, b);
    }

    //---------------------------------------------------------------------

    public ubyte GetRed(цел x, цел y)
    {
        return wxImage_GetRed(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public ubyte GetGreen(цел x, цел y)
    {
        return wxImage_GetGreen(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public ubyte GetBlue(цел x, цел y)
    {
        return wxImage_GetBlue(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц УстAlpha(цел x, цел y, ubyte alpha)
    {
        wxImage_SetAlpha(wxobj, x, y, alpha);
    }

    //---------------------------------------------------------------------

    public ubyte GetAlpha(цел x, цел y)
    {
        return wxImage_GetAlpha(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b)
    {
        return FindFirstUnusedColour(r, g, b, 1, 0, 0);
    }

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR)
    {
        return FindFirstUnusedColour(r, g, b, startR, 0, 0);
    }

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG)
    {
        return FindFirstUnusedColour(r, g, b, startR, startG, 0);
    }

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB)
    {
        return wxImage_FindFirstUnusedColour(wxobj, r, g, b, startR, startG, startB);
    }

    //---------------------------------------------------------------------

    public бул УстMaskFromImage(Рисунок маска, ubyte mr, ubyte mg, ubyte mb)
    {
        return wxImage_SetMaskFromImage(wxobj, wxObject.SafePtr(маска), mr, mg, mb);
    }

    //---------------------------------------------------------------------

    public бул ConvertAlphaToMask()
    {
        return ConvertAlphaToMask(128);
    }

    public бул ConvertAlphaToMask(ubyte threshold)
    {
        return wxImage_ConvertAlphaToMask(wxobj, threshold);
    }

    //---------------------------------------------------------------------

    public static бул CanRead(ткст имя)
    {
        return wxImage_CanRead(имя);
    }

    //---------------------------------------------------------------------

    public static цел GetImageCount(ткст имя)
    {
        return GetImageCount(имя, BitmapType.wxBITMAP_TYPE_ANY);
    }

    public static цел GetImageCount(ткст имя, BitmapType тип)
    {
        return wxImage_GetImageCount(имя, cast(цел)тип);
    }

    //---------------------------------------------------------------------

    public бул Ок()
    {
        return wxImage_Ok(wxobj);
    }

    //---------------------------------------------------------------------

    public ubyte MaskRed()
    {
        return wxImage_GetMaskRed(wxobj);
    }

    //---------------------------------------------------------------------

    public ubyte MaskGreen()
    {
        return wxImage_GetMaskGreen(wxobj);
    }

    //---------------------------------------------------------------------

    public ubyte MaskBlue()
    {
        return wxImage_GetMaskBlue(wxobj);
    }

    //---------------------------------------------------------------------

    public бул HasPalette()
    {
        return wxImage_HasPalette(wxobj);
    }

    //---------------------------------------------------------------------

    public Палитра палитра()
    {
        return cast(Палитра)НайдиОбъект(wxImage_GetPalette(wxobj), &Палитра.Нов);
    }
    public проц палитра(Палитра значение)
    {
        wxImage_SetPalette(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public проц УстOption(ткст имя, ткст значение)
    {
        wxImage_SetOption(wxobj, имя, значение);
    }

    //---------------------------------------------------------------------

    public проц УстOption(ткст имя, цел значение)
    {
        wxImage_SetOption2(wxobj, имя, значение);
    }

    //---------------------------------------------------------------------

    public ткст GetOption(ткст имя)
    {
        return cast(ткст) new wxString(wxImage_GetOption(wxobj, имя), да);
    }

    //---------------------------------------------------------------------

    public цел GetOptionInt(ткст имя)
    {
        return wxImage_GetOptionInt(wxobj, имя);
    }

    //---------------------------------------------------------------------

    public бул HasOption(ткст имя)
    {
        return wxImage_HasOption(wxobj, имя);
    }

    //---------------------------------------------------------------------

    public бцел CountColours()
    {
        return CountColours(бцел.max-1);
    }

    //---------------------------------------------------------------------

    public бцел CountColours(бцел stopafter)
    {
        return wxImage_CountColours(wxobj, stopafter);
    }

    //---------------------------------------------------------------------

    public бцел ComputeHistogram(ImageHistogram h)
    {
        return wxImage_ComputeHistogram(wxobj, wxObject.SafePtr(h));
    }

    //---------------------------------------------------------------------

    /*
    // doesn't work. wxImageHandler is an abstract class...
    static СписокМассивов Handlers() {
    		wxList wl = new wxList(wxImage_GetHandlers());
    		СписокМассивов al = new СписокМассивов();

    		for (цел i = 0; i < wl.Счёт; i++)
            	al.Добавь(new ImageHandler(wl.Элемент(i)));

    		return wl;
    	}
    */

    //---------------------------------------------------------------------

    public static проц AddHandler(ImageHandler обработчик)
    {
        wxImage_AddHandler(wxObject.SafePtr(обработчик));
    }

    //---------------------------------------------------------------------

    public static проц InsertHandler(ImageHandler обработчик)
    {
        wxImage_InsertHandler(wxObject.SafePtr(обработчик));
    }

    //---------------------------------------------------------------------

    public static бул RemoveHandler(ткст имя)
    {
        return wxImage_RemoveHandler(имя);
    }

    //---------------------------------------------------------------------

    public static ImageHandler FindHandler(ткст имя)
    {
        return cast(ImageHandler)НайдиОбъект(wxImage_FindHandler(имя));
    }

    //---------------------------------------------------------------------

    public static ImageHandler FindHandler(ткст extension, цел imageType)
    {
        return cast(ImageHandler)НайдиОбъект(wxImage_FindHandler2(extension, cast(бцел)imageType));
    }

    //---------------------------------------------------------------------

    public static ImageHandler FindHandler(цел imageType)
    {
        return cast(ImageHandler)НайдиОбъект(wxImage_FindHandler3(cast(бцел)imageType));
    }

    //---------------------------------------------------------------------

    public static ImageHandler FindHandlerMime(ткст mimetype)
    {
        return cast(ImageHandler)НайдиОбъект(wxImage_FindHandlerMime(mimetype));
    }

    //---------------------------------------------------------------------

    static ткст ImageExtWildcard()
    {
        return cast(ткст) new wxString(wxImage_GetImageExtWildcard(), да);
    }

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
static extern (C) проц   wxImageHandler_SetName(ЦелУкз сам, ткст имя);
static extern (C) проц   wxImageHandler_SetExtension(ЦелУкз сам, ткст ext);
static extern (C) проц   wxImageHandler_SetType(ЦелУкз сам, бцел тип);
static extern (C) проц   wxImageHandler_SetMimeType(ЦелУкз сам, ткст тип);
static extern (C) ЦелУкз wxImageHandler_GetName(ЦелУкз сам);
static extern (C) ЦелУкз wxImageHandler_GetExtension(ЦелУкз сам);
static extern (C) бцел   wxImageHandler_GetType(ЦелУкз сам);
static extern (C) ЦелУкз wxImageHandler_GetMimeType(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias ImageHandler wxImageHandler;
public class ImageHandler : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст Имя()
    {
        return cast(ткст) new wxString(wxImageHandler_GetName(wxobj), да);
    }
    public проц Имя(ткст значение)
    {
        wxImageHandler_SetName(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст Extension()
    {
        return cast(ткст) new wxString(wxImageHandler_GetExtension(wxobj), да);
    }
    public проц Extension(ткст значение)
    {
        wxImageHandler_SetExtension(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Тип()
    {
        return cast(цел)wxImageHandler_GetType(wxobj);
    }
    public проц Тип(цел значение)
    {
        wxImageHandler_SetType(wxobj, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    public ткст MimeType()
    {
        return cast(ткст) new wxString(wxImageHandler_GetMimeType(wxobj), да);
    }
    public проц MimeType(ткст значение)
    {
        wxImageHandler_SetMimeType(wxobj, значение);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxImageHistogramEntry_ctor();
static extern (C) проц   wxImageHistogramEntry_dtor(ЦелУкз сам);
static extern (C) бцел  wxImageHistogramEntry_index(ЦелУкз сам);
static extern (C) проц   wxImageHistogramEntry_Setindex(ЦелУкз сам, бцел v);
static extern (C) бцел  wxImageHistogramEntry_value(ЦелУкз сам);
static extern (C) проц   wxImageHistogramEntry_Setvalue(ЦелУкз сам, бцел v);
//! \endcond

//---------------------------------------------------------------------

alias ImageHistogramEntry wxImageHistogramEntry;
public class ImageHistogramEntry : wxObject
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
        this(wxImageHistogramEntry_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxImageHistogramEntry_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public бцел index()
    {
        return wxImageHistogramEntry_index(wxobj);
    }
    public проц index(бцел значение)
    {
        wxImageHistogramEntry_Setindex(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бцел значение()
    {
        return wxImageHistogramEntry_value(wxobj);
    }
    public проц значение(бцел значение)
    {
        wxImageHistogramEntry_Setvalue(wxobj, значение);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxImageHistogram_ctor();
static extern (C) проц   wxImageHistogram_dtor(ЦелУкз сам);
static extern (C) бцел  wxImageHistogram_MakeKey(ubyte r, ubyte g, ubyte b);
static extern (C) бул   wxImageHistogram_FindFirstUnusedColour(ЦелУкз сам, inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB);
//! \endcond

//---------------------------------------------------------------------

alias ImageHistogram wxImageHistogram;
public class ImageHistogram : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxImageHistogram_ctor());
    }

    //---------------------------------------------------------------------

    public static бцел MakeKey(ubyte r, ubyte g, ubyte b)
    {
        return wxImageHistogram_MakeKey(r, g, b);
    }

    //---------------------------------------------------------------------

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b)
    {
        return FindFirstUnusedColour(r, g, b, 1, 0, 0);
    }

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR)
    {
        return FindFirstUnusedColour(r, g, b, startR, 0, 0);
    }

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG)
    {
        return FindFirstUnusedColour(r, g, b, startR, startG, 0);
    }

    public бул FindFirstUnusedColour(inout ubyte r, inout ubyte g, inout ubyte b, ubyte startR, ubyte startG, ubyte startB)
    {
        return wxImageHistogram_FindFirstUnusedColour(wxobj, r, g, b, startR, startG, startB);
    }
}
