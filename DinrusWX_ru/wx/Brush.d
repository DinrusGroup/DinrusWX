//-----------------------------------------------------------------------------
// wxD - Кисть.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Кисть.cs
//
/// The wxBrush wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Кисть.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Brush;
public import wx.common;
public import wx.Bitmap;

//! \cond EXTERN
static extern (C) ЦелУкз wxBLUE_BRUSH_Get();
static extern (C) ЦелУкз wxGREEN_BRUSH_Get();
static extern (C) ЦелУкз wxWHITE_BRUSH_Get();
static extern (C) ЦелУкз wxBLACK_BRUSH_Get();
static extern (C) ЦелУкз wxGREY_BRUSH_Get();
static extern (C) ЦелУкз wxMEDIUM_GREY_BRUSH_Get();
static extern (C) ЦелУкз wxLIGHT_GREY_BRUSH_Get();
static extern (C) ЦелУкз wxTRANSPARENT_BRUSH_Get();
static extern (C) ЦелУкз wxCYAN_BRUSH_Get();
static extern (C) ЦелУкз wxRED_BRUSH_Get();

static extern (C) ЦелУкз wxBrush_ctor();
static extern (C) бул   wxBrush_Ok(ЦелУкз сам);
static extern (C) СтильЗаливки wxBrush_GetStyle(ЦелУкз сам);
static extern (C) проц   wxBrush_SetStyle(ЦелУкз сам, СтильЗаливки стиль);
static extern (C) ЦелУкз wxBrush_GetStipple(ЦелУкз сам);
static extern (C) проц   wxBrush_SetStipple(ЦелУкз сам, ЦелУкз stipple);
static extern (C) ЦелУкз wxBrush_GetColour(ЦелУкз сам);
static extern (C) проц   wxBrush_SetColour(ЦелУкз сам, ЦелУкз col);
//! \endcond

//---------------------------------------------------------------------

alias Кисть wxBrush;
public class Кисть : GDIObject
{
    public static Кисть wxBLUE_BRUSH;
    public static Кисть wxGREEN_BRUSH;
    public static Кисть wxWHITE_BRUSH;
    public static Кисть wxBLACK_BRUSH;
    public static Кисть wxGREY_BRUSH;
    public static Кисть wxMEDIUM_GREY_BRUSH;
    public static Кисть wxLIGHT_GREY_BRUSH;
    public static Кисть wxTRANSPARENT_BRUSH;
    public static Кисть wxCYAN_BRUSH;
    public static Кисть wxRED_BRUSH;
    public static Кисть wxNullBrush;

    /+
    override public проц Dispose()
    {
        if (this !== wxBLUE_BRUSH
                     &&  this !== wxGREEN_BRUSH
                                  &&  this !== wxWHITE_BRUSH
                                               &&  this !== wxBLACK_BRUSH
                                                       &&  this !== wxGREY_BRUSH
                                                               &&  this !== wxMEDIUM_GREY_BRUSH
                                                                       &&  this !== wxLIGHT_GREY_BRUSH
                                                                               &&  this !== wxTRANSPARENT_BRUSH
                                                                                       &&  this !== wxCYAN_BRUSH
                                                                                               &&  this !== wxRED_BRUSH)
        {
            super.Dispose();
        }
    }
    +/
    //---------------------------------------------------------------------

    public this()
    {
        this(wxBrush_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Цвет цвет)
    {
        this(цвет, СтильЗаливки.wxSOLID);
    }

    public this(Цвет цвет, СтильЗаливки стиль)
    {
        this();
        this.цвет = цвет;
        Стиль = стиль;
    }

    public this(Битмап stippleBitmap)
    {
        this();
        пунктир = stippleBitmap;
    }

    public this(ткст имя)
    {
        this(имя, СтильЗаливки.wxSOLID);
    }

    public this(ткст имя, СтильЗаливки стиль)
    {
        this();
        this.цвет = new Цвет(имя);
        Стиль = стиль;
    }

    //---------------------------------------------------------------------

    public бул Ок()
    {
        return wxBrush_Ok(wxobj);
    }

    //---------------------------------------------------------------------

    public СтильЗаливки Стиль()
    {
        return wxBrush_GetStyle(wxobj);
    }
    public проц Стиль(СтильЗаливки значение)
    {
        wxBrush_SetStyle(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Битмап пунктир()
    {
        return cast(Битмап)НайдиОбъект(wxBrush_GetStipple(wxobj), &Битмап.Нов);
    }
    public проц пунктир(Битмап значение)
    {
        wxBrush_SetStipple(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Цвет цвет()
    {
        return new Цвет(wxBrush_GetColour(wxobj), да);
    }
    public проц цвет(Цвет значение)
    {
        wxBrush_SetColour(wxobj, wxObject.SafePtr(значение));
    }
}
