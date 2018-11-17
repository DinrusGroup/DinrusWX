//-----------------------------------------------------------------------------
// wxD - Битмап.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Битмап.cs
//
/// The wxBitmap wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Битмап.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Bitmap;
public import wx.common;
public import wx.GDIObject;
public import wx.Colour;
public import wx.Palette;
public import wx.Image;
public import wx.Icon;

//! \cond EXTERN
static extern (C) ЦелУкз wxBitmap_ctor();
static extern (C) ЦелУкз wxBitmap_ctorByImage(ЦелУкз рисунок, цел глубь);
static extern (C) ЦелУкз wxBitmap_ctorByName(ткст имя, BitmapType тип);
static extern (C) ЦелУкз wxBitmap_ctorBySize(цел ширь, цел высь, цел глубь);
static extern (C) ЦелУкз wxBitmap_ctorByBitmap(ЦелУкз битмап);
//static extern (C) проц   wxBitmap_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);

static extern (C) ЦелУкз wxBitmap_ConvertToImage(ЦелУкз сам);
static extern (C) бул   wxBitmap_LoadFile(ЦелУкз сам, ткст имя, BitmapType тип);
static extern (C) бул   wxBitmap_SaveFile(ЦелУкз сам, ткст имя, BitmapType тип, ЦелУкз палитра);
static extern (C) бул   wxBitmap_Ok(ЦелУкз сам);

static extern (C) цел    wxBitmap_GetHeight(ЦелУкз сам);
static extern (C) проц   wxBitmap_SetHeight(ЦелУкз сам, цел высь);

static extern (C) цел    wxBitmap_GetWidth(ЦелУкз сам);
static extern (C) проц   wxBitmap_SetWidth(ЦелУкз сам, цел ширь);

static extern (C) цел    wxBitmap_GetDepth(ЦелУкз сам);
static extern (C) проц   wxBitmap_SetDepth(ЦелУкз сам, цел глубь);

static extern (C) ЦелУкз wxBitmap_GetSubBitmap(ЦелУкз сам, inout Прямоугольник прям);

static extern (C) ЦелУкз wxBitmap_GetMask(ЦелУкз сам);
static extern (C) ЦелУкз wxBitmap_SetMask(ЦелУкз сам, ЦелУкз маска);

static extern (C) ЦелУкз wxBitmap_GetPalette(ЦелУкз сам);
static extern (C) бул   wxBitmap_CopyFromIcon(ЦелУкз сам, ЦелУкз пиктограмма);

static extern (C) ЦелУкз wxBitmap_GetColourMap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Битмап wxBitmap;
public class Битмап : GDIObject
{
    public static Битмап wxNullBitmap;
    /*
    		static this()
    		{
    			Рисунок.InitAllHandlers();
    		}
    */
    public this()
    {
        this(wxBitmap_ctor());
    }

    public this(Рисунок рисунок)
    {
        this(рисунок, -1);
    }

    public this(Рисунок рисунок, цел глубь)
    {
        this(wxBitmap_ctorByImage(рисунок.wxobj, глубь));
    }

    public this(ткст имя)
    {
        this(wxBitmap_ctorByName(имя, BitmapType.wxBITMAP_TYPE_ANY));
    }

    public this(ткст имя, BitmapType тип)
    {
        this(wxBitmap_ctorByName(имя, тип));
    }

    public this(цел ширь, цел высь)
    {
        this(ширь, высь, -1);
    }

    public this(цел ширь, цел высь, цел глубь)
    {
        this(wxBitmap_ctorBySize(ширь, высь, глубь));
    }

    public this(Битмап битмап)
    {
        this(wxBitmap_ctorByBitmap(wxObject.SafePtr(битмап)));
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public Рисунок ПреобразуйВРисунок()
    {
        return new Рисунок(wxBitmap_ConvertToImage(wxobj));
    }

    //---------------------------------------------------------------------

    public цел Высь()
    {
        return wxBitmap_GetHeight(wxobj);
    }
    public проц Высь(цел значение)
    {
        wxBitmap_SetHeight(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул ЗагрузиФайл(ткст имя, BitmapType тип)
    {
        return wxBitmap_LoadFile(wxobj, имя, тип);
    }

    //---------------------------------------------------------------------

    public бул СохраниФайл(ткст имя, BitmapType тип)
    {
        return СохраниФайл(имя, тип, null);
    }

    public бул СохраниФайл(ткст имя, BitmapType тип, Палитра палитра)
    {
        return wxBitmap_SaveFile(wxobj, имя, тип, wxObject.SafePtr(палитра));
    }

    //---------------------------------------------------------------------

    public цел Ширь()
    {
        return wxBitmap_GetWidth(wxobj);
    }
    public проц Ширь(цел значение)
    {
        wxBitmap_SetWidth(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public  бул Ок()
    {
        return wxBitmap_Ok(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Глубь()
    {
        return wxBitmap_GetDepth(wxobj);
    }
    public проц Глубь(цел значение)
    {
        wxBitmap_SetDepth(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Битмап ДайПодБитмап(Прямоугольник прям)
    {
        return new Битмап(wxBitmap_GetSubBitmap(wxobj, прям));
    }

    //---------------------------------------------------------------------

    public Маска маска()
    {
        return new Маска(wxBitmap_GetMask(wxobj));
    }
    public проц маска(Маска значение)
    {
        wxBitmap_SetMask(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Палитра палитра()
    {
        return new Палитра(wxBitmap_GetPalette(wxobj));
    }

    //---------------------------------------------------------------------

    public Палитра ЦветоКарта()
    {
        return new Палитра(wxBitmap_GetColourMap(wxobj));
    }

    //---------------------------------------------------------------------

    public бул КопируйИзПиктограммы(Пиктограмма пиктограмма)
    {
        return wxBitmap_CopyFromIcon(wxobj, wxObject.SafePtr(пиктограмма));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new Битмап(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxMask_ctor();
static extern (C) ЦелУкз wxMask_ctorByBitmpaColour(ЦелУкз битмап, ЦелУкз цвет);
static extern (C) ЦелУкз wxMask_ctorByBitmapIndex(ЦелУкз битмап, цел индексПалитры);
static extern (C) ЦелУкз wxMask_ctorByBitmap(ЦелУкз битмап);

static extern (C) бул wxMask_CreateByBitmapColour(ЦелУкз сам, ЦелУкз битмап, ЦелУкз цвет);
static extern (C) бул wxMask_CreateByBitmapIndex(ЦелУкз сам, ЦелУкз битмап, цел индексПалитры);
static extern (C) бул wxMask_CreateByBitmap(ЦелУкз сам, ЦелУкз битмап);
//! \endcond

//---------------------------------------------------------------------
alias Маска wxMask;
public class Маска : wxObject
{

    public this()
    {
        this(wxMask_ctor());
    }

    public this(Битмап битмап, Цвет цвет)
    {
        this(wxMask_ctorByBitmpaColour(wxObject.SafePtr(битмап), wxObject.SafePtr(цвет)));
    }

    public this(Битмап битмап, цел индексПалитры)
    {
        this(wxMask_ctorByBitmapIndex(wxObject.SafePtr(битмап), индексПалитры));
    }

    public this(Битмап битмап)
    {
        this(wxMask_ctorByBitmap(wxObject.SafePtr(битмап)));
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public бул создай(Битмап битмап, Цвет цвет)
    {
        return wxMask_CreateByBitmapColour(wxobj, wxObject.SafePtr(битмап), wxObject.SafePtr(цвет));
    }

    public бул создай(Битмап битмап, цел индексПалитры)
    {
        return wxMask_CreateByBitmapIndex(wxobj, wxObject.SafePtr(битмап), индексПалитры);
    }

    public бул создай(Битмап битмап)
    {
        return wxMask_CreateByBitmap(wxobj, wxObject.SafePtr(битмап));
    }
}
