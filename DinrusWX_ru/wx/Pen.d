//-----------------------------------------------------------------------------
// wxD - Pen.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Pen.cs
//
/// The wxPen wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Pen.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.Pen;
public import wx.common;
public import wx.Defs;
public import wx.GDIObject;
public import wx.Colour;

//! \cond EXTERN
static extern (C) ЦелУкз wxGDIObj_GetRedPen();
static extern (C) ЦелУкз wxGDIObj_GetCyanPen();
static extern (C) ЦелУкз wxGDIObj_GetGreenPen();
static extern (C) ЦелУкз wxGDIObj_GetBlackPen();
static extern (C) ЦелУкз wxGDIObj_GetWhitePen();
static extern (C) ЦелУкз wxGDIObj_GetTransparentPen();
static extern (C) ЦелУкз wxGDIObj_GetBlackDashedPen();
static extern (C) ЦелУкз wxGDIObj_GetGreyPen();
static extern (C) ЦелУкз wxGDIObj_GetMediumGreyPen();
static extern (C) ЦелУкз wxGDIObj_GetLightGreyPen();

static extern (C) ЦелУкз wxPen_ctor(ЦелУкз col, цел ширь, СтильЗаливки стиль);
static extern (C) ЦелУкз wxPen_ctorByName(ткст имя, цел ширь, СтильЗаливки стиль);

static extern (C) ЦелУкз wxPen_GetColour(ЦелУкз сам);
static extern (C) проц   wxPen_SetColour(ЦелУкз сам, ЦелУкз col);

static extern (C) проц   wxPen_SetWidth(ЦелУкз сам, цел ширь);
static extern (C) цел    wxPen_GetWidth(ЦелУкз сам);

static extern (C) цел    wxPen_GetCap(ЦелУкз сам);
static extern (C) цел    wxPen_GetJoin(ЦелУкз сам);
static extern (C) цел    wxPen_GetStyle(ЦелУкз сам);
static extern (C) бул   wxPen_Ok(ЦелУкз сам);
static extern (C) проц   wxPen_SetCap(ЦелУкз сам, цел capStyle);
static extern (C) проц   wxPen_SetJoin(ЦелУкз сам, цел join_style);
static extern (C) проц   wxPen_SetStyle(ЦелУкз сам, цел стиль);

//---------------------------------------------------------------------
static extern (C) ЦелУкз wxNullPen_Get();
//! \endcond

alias Pen wxPen;
public class Pen : GDIObject
{
    public static Pen wxRED_PEN;
    public static Pen wxCYAN_PEN;
    public static Pen wxGREEN_PEN;
    public static Pen wxBLACK_PEN;
    public static Pen wxWHITE_PEN;
    public static Pen wxTRANSPARENT_PEN;
    public static Pen wxBLACK_DASHED_PEN;
    public static Pen wxGREY_PEN;
    public static Pen wxMEDIUM_GREY_PEN;
    public static Pen wxLIGHT_GREY_PEN;
    public static Pen wxNullPen;

    /+
    override public проц Dispose()
    {
        if (this !== wxRED_PEN
                     &&  this !== wxCYAN_PEN
                                  &&  this !== wxGREEN_PEN
                                               &&  this !== wxBLACK_PEN
                                                       &&  this !== wxWHITE_PEN
                                                               &&  this !== wxTRANSPARENT_PEN
                                                                       &&  this !== wxBLACK_DASHED_PEN
                                                                               &&  this !== wxGREY_PEN
                                                                                       &&  this !== wxMEDIUM_GREY_PEN
                                                                                               &&  this !== wxLIGHT_GREY_PEN)
        {
            super.Dispose();
        }
    }
    +/
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ткст имя)
    {
        this(имя, 1, СтильЗаливки.wxSOLID);
    }

    public this(ткст имя, цел ширь)
    {
        this(имя, ширь, СтильЗаливки.wxSOLID);
    }

    public this(ткст имя, цел ширь, СтильЗаливки стиль)
    {
        super(wxPen_ctorByName(имя, ширь, стиль));
    }

    public this(Цвет цвет)
    {
        this(цвет, 1, СтильЗаливки.wxSOLID);
    }

    public this(Цвет цвет, цел ширь)
    {
        this(цвет, ширь, СтильЗаливки.wxSOLID);
    }

    public this(Цвет col, цел ширь, СтильЗаливки стиль)
    {
        super(wxPen_ctor(wxObject.SafePtr(col), ширь, стиль));
    }


    //---------------------------------------------------------------------

    public Цвет цвет()
    {
        return cast(Цвет)НайдиОбъект(wxPen_GetColour(wxobj), &Цвет.Нов);
    }
    public проц цвет(Цвет значение)
    {
        wxPen_SetColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public цел Ширь()
    {
        return wxPen_GetWidth(wxobj);
    }
    public проц Ширь(цел значение)
    {
        wxPen_SetWidth(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Cap()
    {
        return wxPen_GetCap(wxobj);
    }
    public проц Cap(цел значение)
    {
        wxPen_SetCap(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Join()
    {
        return wxPen_GetJoin(wxobj);
    }
    public проц Join(цел значение)
    {
        wxPen_SetJoin(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Стиль()
    {
        return wxPen_GetStyle(wxobj);
    }
    public проц Стиль(цел значение)
    {
        wxPen_SetStyle(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул Ок()
    {
        return wxPen_Ok(wxobj);
    }

    static wxObject Нов(ЦелУкз ptr)
    {
        return new Pen(ptr);
    }
}
