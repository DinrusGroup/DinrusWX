//-----------------------------------------------------------------------------
// wxD - СобытиеАктивации.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - СобытиеАктивации.cs
//
/// The wxСобытиеАктивации wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GdiCommon.d,v 1.11 2007/02/01 00:09:34 afb Exp $
//-----------------------------------------------------------------------------

module wx.GdiCommon;
public import wx.common;
public import wx.Bitmap;
public import wx.Cursor;
public import wx.Icon;
public import wx.Pen;
public import wx.Brush;
public import wx.Font;
public import wx.Colour;

//! \cond EXTERN
static extern (C) ЦелУкз wxSTANDARD_CURSOR_Get();
static extern (C) ЦелУкз wxHOURGLASS_CURSOR_Get();
static extern (C) ЦелУкз wxCROSS_CURSOR_Get();

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

static extern (C) ЦелУкз wxNullBitmap_Get();
static extern (C) ЦелУкз wxNullIcon_Get();
static extern (C) ЦелУкз wxNullCursor_Get();
static extern (C) ЦелУкз wxNullPen_Get();
static extern (C) ЦелУкз wxNullBrush_Get();
static extern (C) ЦелУкз wxNullPalette_Get();
static extern (C) ЦелУкз wxNullFont_Get();
static extern (C) ЦелУкз wxNullColour_Get();
//! \endcond


проц InitializeStockObjects()
{
    Курсор.wxSTANDARD_CURSOR = new Курсор(wxSTANDARD_CURSOR_Get());
    Курсор.wxHOURGLASS_CURSOR = new Курсор(wxHOURGLASS_CURSOR_Get());
    Курсор.wxCROSS_CURSOR = new Курсор(wxCROSS_CURSOR_Get());

    Pen.wxRED_PEN = new Pen(wxGDIObj_GetRedPen());
    Pen.wxCYAN_PEN = new Pen(wxGDIObj_GetCyanPen());
    Pen.wxGREEN_PEN = new Pen(wxGDIObj_GetGreenPen());
    Pen.wxBLACK_PEN = new Pen(wxGDIObj_GetBlackPen());
    Pen.wxWHITE_PEN = new Pen(wxGDIObj_GetWhitePen());
    Pen.wxTRANSPARENT_PEN = new Pen(wxGDIObj_GetTransparentPen());
    Pen.wxBLACK_DASHED_PEN = new Pen(wxGDIObj_GetBlackDashedPen());
    Pen.wxGREY_PEN = new Pen(wxGDIObj_GetGreyPen());
    Pen.wxMEDIUM_GREY_PEN = new Pen(wxGDIObj_GetMediumGreyPen());
    Pen.wxLIGHT_GREY_PEN = new Pen(wxGDIObj_GetLightGreyPen());

    Кисть.wxBLUE_BRUSH = new Кисть(wxBLUE_BRUSH_Get());
    Кисть.wxGREEN_BRUSH = new Кисть(wxGREEN_BRUSH_Get());
    Кисть.wxWHITE_BRUSH = new Кисть(wxWHITE_BRUSH_Get());
    Кисть.wxBLACK_BRUSH = new Кисть(wxBLACK_BRUSH_Get());
    Кисть.wxGREY_BRUSH = new Кисть(wxGREY_BRUSH_Get());
    Кисть.wxMEDIUM_GREY_BRUSH = new Кисть(wxMEDIUM_GREY_BRUSH_Get());
    Кисть.wxLIGHT_GREY_BRUSH = new Кисть(wxLIGHT_GREY_BRUSH_Get());
    Кисть.wxTRANSPARENT_BRUSH = new Кисть(wxTRANSPARENT_BRUSH_Get());
    Кисть.wxCYAN_BRUSH = new Кисть(wxCYAN_BRUSH_Get());
    Кисть.wxRED_BRUSH = new Кисть(wxRED_BRUSH_Get());

    Цвет.wxBLACK       = new Цвет("Black");
    Цвет.wxWHITE       = new Цвет("White");
    Цвет.wxRED         = new Цвет("Red");
    Цвет.wxBLUE        = new Цвет("Blue");
    Цвет.wxGREEN       = new Цвет("Green");
    Цвет.wxCYAN        = new Цвет("Cyan");
    Цвет.wxLIGHT_GREY  = new Цвет("Light Gray");

    Битмап.wxNullBitmap = new Битмап(wxNullBitmap_Get());
    Пиктограмма.wxNullIcon = new Пиктограмма(wxNullIcon_Get());
    Курсор.wxNullCursor = new Курсор(wxNullCursor_Get());
    Pen.wxNullPen = new Pen(wxNullPen_Get());
    Кисть.wxNullBrush = new Кисть(wxNullBrush_Get());
    Палитра.wxNullPalette = new Палитра(wxNullPalette_Get());
    Шрифт.wxNullFont = new Шрифт(wxNullFont_Get());
    Цвет.wxNullColour = new Цвет(wxNullColour_Get());
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxColourDatabase_ctor();
static extern (C) проц wxColourDataBase_dtor(ЦелУкз сам);
static extern (C) ЦелУкз wxColourDatabase_Find(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxColourDatabase_FindName(ЦелУкз сам, ЦелУкз цвет);
static extern (C) проц wxColourDatabase_AddColour(ЦелУкз сам, ткст имя, ЦелУкз цвет);
//! \endcond

//-----------------------------------------------------------------------------

alias ColourDatabase wxColourDatabase;
public class ColourDatabase : wxObject
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
        this(wxColourDatabase_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxColourDataBase_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Цвет Find(ткст имя)
    {
        return new Цвет(wxColourDatabase_Find(wxobj, имя), да);
    }

    //-----------------------------------------------------------------------------

    public ткст FindName(Цвет цвет)
    {
        return cast(ткст) new wxString(wxColourDatabase_FindName(wxobj, wxObject.SafePtr(цвет)), да);
    }

    //-----------------------------------------------------------------------------

    public проц AddColour(ткст имя, Цвет цвет)
    {
        wxColourDatabase_AddColour(wxobj, имя, wxObject.SafePtr(цвет));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxPenList_ctor();
//static extern (C) проц wxPenList_AddPen(ЦелУкз сам, ЦелУкз pen);
//static extern (C) проц wxPenList_RemovePen(ЦелУкз сам, ЦелУкз pen);
static extern (C) ЦелУкз wxPenList_FindOrCreatePen(ЦелУкз сам, ЦелУкз цвет, цел ширь, цел стиль);
//! \endcond

//-----------------------------------------------------------------------------

alias PenList wxPenList;
public class PenList : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxPenList_ctor());
    }

    //-----------------------------------------------------------------------------
    /+
    public проц AddPen(Pen pen)
    {
        wxPenList_AddPen(wxobj, wxObject.SafePtr(pen));
    }
    +/
    //-----------------------------------------------------------------------------
    /+
    public проц RemovePen(Pen pen)
    {
        wxPenList_RemovePen(wxobj, wxObject.SafePtr(pen));
    }
    +/
    //-----------------------------------------------------------------------------

    public Pen FindOrCreatePen(Цвет цвет, цел ширь, цел стиль)
    {
        return new Pen(wxPenList_FindOrCreatePen(wxobj, wxObject.SafePtr(цвет), ширь, стиль));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxBrushList_ctor();
//static extern (C) проц wxBrushList_AddBrush(ЦелУкз сам, ЦелУкз brush);
//static extern (C) проц wxBrushList_RemoveBrush(ЦелУкз сам, ЦелУкз brush);
static extern (C) ЦелУкз wxBrushList_FindOrCreateBrush(ЦелУкз сам, ЦелУкз цвет, цел стиль);
//! \endcond

//-----------------------------------------------------------------------------

alias BrushList wxBrushList;
public class BrushList : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxBrushList_ctor());
    }

    //-----------------------------------------------------------------------------
    /+
    public проц AddBrush(Кисть brush)
    {
        wxBrushList_AddBrush(wxobj, wxObject.SafePtr(brush));
    }

    //-----------------------------------------------------------------------------

    public проц RemoveBrush(Кисть brush)
    {
        wxBrushList_RemoveBrush(wxobj, wxObject.SafePtr(brush));
    }
    +/
    //-----------------------------------------------------------------------------

    public Кисть FindOrCreateBrush(Цвет цвет, цел стиль)
    {
        return new Кисть(wxBrushList_FindOrCreateBrush(wxobj, wxObject.SafePtr(цвет), стиль));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxFontList_ctor();
//static extern (C) проц wxFontList_AddFont(ЦелУкз сам, ЦелУкз шрифт);
//static extern (C) проц wxFontList_RemoveFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxFontList_FindOrCreateFont(ЦелУкз сам,
        цел pointSize,
        цел семейство,
        цел стиль,
        цел weight,
        бул underline,
        ткст face,
        FontEncoding кодировка);
//! \endcond

//-----------------------------------------------------------------------------

alias FontList wxFontList;
public class FontList : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxFontList_ctor());
    }

    //-----------------------------------------------------------------------------
    /+
    public проц AddFont(Шрифт шрифт)
    {
        wxFontList_AddFont(wxobj, wxObject.SafePtr(шрифт));
    }

    //-----------------------------------------------------------------------------

    public проц RemoveFont(Шрифт шрифт)
    {
        wxFontList_RemoveFont(wxobj, wxObject.SafePtr(шрифт));
    }
    +/
    //-----------------------------------------------------------------------------

    public Шрифт FindOrCreateFont(цел pointSize, цел семейство, цел стиль, цел weight)
    {
        return FindOrCreateFont(pointSize, семейство, стиль, weight, false, "", FontEncoding.wxFONTENCODING_DEFAULT);
    }

    public Шрифт FindOrCreateFont(цел pointSize, цел семейство, цел стиль, цел weight, бул underline)
    {
        return FindOrCreateFont(pointSize, семейство, стиль, weight, underline, "", FontEncoding.wxFONTENCODING_DEFAULT);
    }

    public Шрифт FindOrCreateFont(цел pointSize, цел семейство, цел стиль, цел weight, бул underline, ткст face)
    {
        return FindOrCreateFont(pointSize, семейство, стиль, weight, underline, face, FontEncoding.wxFONTENCODING_DEFAULT);
    }


    public Шрифт FindOrCreateFont(цел pointSize, цел семейство, цел стиль, цел weight, бул underline, ткст face, FontEncoding кодировка)
    {
        return new Шрифт(wxFontList_FindOrCreateFont(wxobj, pointSize, семейство, стиль, weight, underline, face, кодировка));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxBitmapList_ctor();
static extern (C) проц   wxBitmapList_AddBitmap(ЦелУкз сам, ЦелУкз битмап);
static extern (C) проц   wxBitmapList_RemoveBitmap(ЦелУкз сам, ЦелУкз битмап);
//! \endcond

//-----------------------------------------------------------------------------

alias BitmapList wxBitmapList;
public class BitmapList : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxBitmapList_ctor());
    }

    //-----------------------------------------------------------------------------

    public проц AddBitmap(Битмап битмап)
    {
        wxBitmapList_AddBitmap(wxobj, wxObject.SafePtr(битмап));
    }

    //-----------------------------------------------------------------------------

    public проц RemoveBitmap(Битмап битмап)
    {
        wxBitmapList_RemoveBitmap(wxobj, wxObject.SafePtr(битмап));
    }
}

//-----------------------------------------------------------------------------
