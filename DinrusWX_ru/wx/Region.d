//-----------------------------------------------------------------------------
// wxD - Регион.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Регион.cs
//
/// The wxRegion wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: Регион.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.Region;
public import wx.common;
public import wx.GDIObject;
public import wx.Bitmap;
public import wx.Colour;

public enum RegionContain
{
    wxOutRegion = 0,
    wxPartRegion,
    wxInRegion
}

//! \cond EXTERN
static extern (C) ЦелУкз wxRegion_ctor();
static extern (C) ЦелУкз wxRegion_ctorByCoords(цел x, цел y, цел w, цел h);
static extern (C) ЦелУкз wxRegion_ctorByCorners(inout Точка topLeft, inout Точка bottomRight);
static extern (C) ЦелУкз wxRegion_ctorByRect(inout Прямоугольник прям);
static extern (C) ЦелУкз wxRegion_ctorByPoly(цел n, inout Точка[] points, цел fillStyle);
static extern (C) ЦелУкз wxRegion_ctorByBitmap(ЦелУкз bmp, ЦелУкз transColour, цел tolerance);
static extern (C) ЦелУкз wxRegion_ctorByRegion(ЦелУкз region);

static extern (C) проц   wxRegion_dtor(ЦелУкз сам);

static extern (C) проц   wxRegion_Clear(ЦелУкз сам);
static extern (C) бул   wxRegion_Offset(ЦелУкз сам, цел x, цел y);

static extern (C) бул   wxRegion_Union(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) бул   wxRegion_UnionRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) бул   wxRegion_UnionRegion(ЦелУкз сам, ЦелУкз region);
static extern (C) бул   wxRegion_UnionBitmap(ЦелУкз сам, ЦелУкз bmp, ЦелУкз transColour, цел tolerance);

static extern (C) бул   wxRegion_Intersect(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) бул   wxRegion_IntersectRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) бул   wxRegion_IntersectRegion(ЦелУкз сам, ЦелУкз region);

static extern (C) бул   wxRegion_Subtract(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) бул   wxRegion_SubtractRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) бул   wxRegion_SubtractRegion(ЦелУкз сам, ЦелУкз region);

static extern (C) бул   wxRegion_Xor(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) бул   wxRegion_XorRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) бул   wxRegion_XorRegion(ЦелУкз сам, ЦелУкз region);

static extern (C) RegionContain wxRegion_ContainsCoords(ЦелУкз сам, цел x, цел y);
static extern (C) RegionContain wxRegion_ContainsPoint(ЦелУкз сам, inout Точка тчк);
static extern (C) RegionContain wxRegion_ContainsRectCoords(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) RegionContain wxRegion_ContainsRect(ЦелУкз сам, inout Прямоугольник прям);

static extern (C) проц   wxRegion_GetBox(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) бул   wxRegion_IsEmpty(ЦелУкз сам);
static extern (C) ЦелУкз wxRegion_ConvertToBitmap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Регион wxRegion;
public class Регион : GDIObject
{

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxRegion_ctor());
    }

    public this(цел x, цел y, цел w, цел h)
    {
        this(wxRegion_ctorByCoords(x, y, w, h));
    }

    public this(Точка topLeft, Точка bottomRight)
    {
        this(wxRegion_ctorByCorners(topLeft, bottomRight));
    }

    public this(Прямоугольник прям)
    {
        this(wxRegion_ctorByRect(прям));
    }

    version(__WXMAC__) {} else
        public this(Точка[] points, цел fillStyle)
    {
        this(wxRegion_ctorByPoly(points.length, points, fillStyle));
    }

    public this(Битмап bmp, Цвет transColour, цел tolerance)
    {
        this(wxRegion_ctorByBitmap(wxObject.SafePtr(bmp), wxObject.SafePtr(transColour), tolerance));
    }

    public this(Регион reg)
    {
        this(wxRegion_ctorByRegion(wxObject.SafePtr(reg)));
    }

    //---------------------------------------------------------------------

    public проц очисть()
    {
        wxRegion_Clear(wxobj);
    }

    version(__WXMAC__) {} else
        public бул Offset(цел x, цел y)
    {
        return wxRegion_Offset(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public бул Union(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Union(wxobj, x, y, ширь, высь);
    }

    public бул Union(Прямоугольник прям)
    {
        return wxRegion_UnionRect(wxobj, прям);
    }

    public бул Union(Регион reg)
    {
        return wxRegion_UnionRegion(wxobj, wxObject.SafePtr(reg));
    }

    public бул Union(Битмап bmp, Цвет transColour, цел tolerance)
    {
        return wxRegion_UnionBitmap(wxobj, wxObject.SafePtr(bmp), wxObject.SafePtr(transColour), tolerance);
    }

    //---------------------------------------------------------------------

    public бул Intersect(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Intersect(wxobj, x, y, ширь, высь);
    }

    public бул Intersect(Прямоугольник прям)
    {
        return wxRegion_IntersectRect(wxobj, прям);
    }

    public бул Intersect(Регион region)
    {
        return wxRegion_IntersectRegion(wxobj, wxObject.SafePtr(region));
    }

    //---------------------------------------------------------------------

    public бул Subtract(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Subtract(wxobj, x, y, ширь, высь);
    }

    public бул Subtract(Прямоугольник прям)
    {
        return wxRegion_SubtractRect(wxobj, прям);
    }

    public бул Subtract(Регион region)
    {
        return wxRegion_SubtractRegion(wxobj, wxObject.SafePtr(region));
    }

    //---------------------------------------------------------------------

    public бул Xor(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Xor(wxobj, x, y, ширь, высь);
    }

    public бул Xor(Прямоугольник прям)
    {
        return wxRegion_XorRect(wxobj, прям);
    }

    public бул Xor(Регион region)
    {
        return wxRegion_XorRegion(wxobj, wxObject.SafePtr(region));
    }

    //---------------------------------------------------------------------

    public RegionContain Contains(цел x, цел y)
    {
        return wxRegion_ContainsCoords(wxobj, x, y);
    }

    public RegionContain Contains(Точка тчк)
    {
        return wxRegion_ContainsPoint(wxobj, тчк);
    }

    public RegionContain Contains(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_ContainsRectCoords(wxobj, x, y, ширь, высь);
    }

    public RegionContain Contains(Прямоугольник прям)
    {
        return wxRegion_ContainsRect(wxobj, прям);
    }

    //---------------------------------------------------------------------

    public Прямоугольник GetBox()
    {
        Прямоугольник прям;
        wxRegion_GetBox(wxobj, прям);
        return прям;
    }

    public бул IsEmpty()
    {
        return wxRegion_IsEmpty(wxobj);
    }

    public Битмап ConvertToBitmap()
    {
        return new Битмап(wxRegion_ConvertToBitmap(wxobj));
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxRegionIterator_ctor();
static extern (C) ЦелУкз wxRegionIterator_ctorByRegion(ЦелУкз region);

static extern (C) проц   wxRegionIterator_Reset(ЦелУкз сам);
static extern (C) проц   wxRegionIterator_ResetToRegion(ЦелУкз сам, ЦелУкз region);

static extern (C) бул   wxRegionIterator_HaveRects(ЦелУкз сам);

static extern (C) цел    wxRegionIterator_GetX(ЦелУкз сам);
static extern (C) цел    wxRegionIterator_GetY(ЦелУкз сам);

static extern (C) цел    wxRegionIterator_GetW(ЦелУкз сам);
static extern (C) цел    wxRegionIterator_GetWidth(ЦелУкз сам);
static extern (C) цел    wxRegionIterator_GetH(ЦелУкз сам);
static extern (C) цел    wxRegionIterator_GetHeight(ЦелУкз сам);

static extern (C) проц   wxRegionIterator_GetRect(ЦелУкз сам, inout Прямоугольник прям);
//! \endcond

//---------------------------------------------------------------------

alias RegionIterator wxRegionIterator;
public class RegionIterator : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxRegionIterator_ctor());
    }

    public this(Регион reg)
    {
        this(wxRegionIterator_ctorByRegion(wxObject.SafePtr(reg)));
    }

    //---------------------------------------------------------------------

    public проц Reset()
    {
        wxRegionIterator_Reset(wxobj);
    }

    public проц ResetToRegion(Регион region)
    {
        wxRegionIterator_ResetToRegion(wxobj, wxObject.SafePtr(region));
    }

    //---------------------------------------------------------------------

    public бул HaveRects()
    {
        return wxRegionIterator_HaveRects(wxobj);
    }

    //---------------------------------------------------------------------

    public цел X()
    {
        return wxRegionIterator_GetX(wxobj);
    }

    public цел Y()
    {
        return wxRegionIterator_GetY(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Ширь()
    {
        return wxRegionIterator_GetWidth(wxobj);
    }

    public цел Высь()
    {
        return wxRegionIterator_GetHeight(wxobj);
    }

    //---------------------------------------------------------------------

    public Прямоугольник Прям()
    {
        Прямоугольник прям;
        wxRegionIterator_GetRect(wxobj, прям);
        return прям;
    }
}
