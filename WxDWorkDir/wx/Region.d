//-----------------------------------------------------------------------------
// wxD - Region.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Region.cs
//
/// The wxRegion wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: Region.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.Region;
public import wx.common;
public import wx.GDIObject;
public import wx.Bitmap;
public import wx.Colour;

    public enum RegionContain {
        wxOutRegion = 0,
        wxPartRegion,
        wxInRegion
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxRegion_ctor();
        static extern (C) ЦУк wxRegion_ctorByCoords(цел x, цел y, цел w, цел h);
        static extern (C) ЦУк wxRegion_ctorByCorners(inout Точка topLeft, inout Точка bottomRight);
        static extern (C) ЦУк wxRegion_ctorByRect(inout Прямоугольник прям);
        static extern (C) ЦУк wxRegion_ctorByPoly(цел n, inout Точка[] points, цел fillStyle);
        static extern (C) ЦУк wxRegion_ctorByBitmap(ЦУк bmp, ЦУк transColour, цел tolerance);
        static extern (C) ЦУк wxRegion_ctorByRegion(ЦУк region);

        static extern (C) проц   wxRegion_dtor(ЦУк сам);

        static extern (C) проц   wxRegion_Clear(ЦУк сам);
        static extern (C) бул   wxRegion_Offset(ЦУк сам, цел x, цел y);

        static extern (C) бул   wxRegion_Union(ЦУк сам, цел x, цел y, цел ширина, цел высота);
        static extern (C) бул   wxRegion_UnionRect(ЦУк сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_UnionRegion(ЦУк сам, ЦУк region);
        static extern (C) бул   wxRegion_UnionBitmap(ЦУк сам, ЦУк bmp, ЦУк transColour, цел tolerance);

        static extern (C) бул   wxRegion_Intersect(ЦУк сам, цел x, цел y, цел ширина, цел высота);
        static extern (C) бул   wxRegion_IntersectRect(ЦУк сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_IntersectRegion(ЦУк сам, ЦУк region);

        static extern (C) бул   wxRegion_Subtract(ЦУк сам, цел x, цел y, цел ширина, цел высота);
        static extern (C) бул   wxRegion_SubtractRect(ЦУк сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_SubtractRegion(ЦУк сам, ЦУк region);

        static extern (C) бул   wxRegion_Xor(ЦУк сам, цел x, цел y, цел ширина, цел высота);
        static extern (C) бул   wxRegion_XorRect(ЦУк сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_XorRegion(ЦУк сам, ЦУк region);

        static extern (C) RegionContain wxRegion_ContainsCoords(ЦУк сам, цел x, цел y);
        static extern (C) RegionContain wxRegion_ContainsPoint(ЦУк сам, inout Точка pt);
        static extern (C) RegionContain wxRegion_ContainsRectCoords(ЦУк сам, цел x, цел y, цел ширина, цел высота);
        static extern (C) RegionContain wxRegion_ContainsRect(ЦУк сам, inout Прямоугольник прям);

        static extern (C) проц   wxRegion_GetBox(ЦУк сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_IsEmpty(ЦУк сам);
        static extern (C) ЦУк wxRegion_ConvertToBitmap(ЦУк сам);
		//! \endcond

        //---------------------------------------------------------------------

    alias Region wxRegion;
    public class Region : GDIObject
    {

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(wxRegion_ctor()); }

        public this(цел x, цел y, цел w, цел h)
            { this(wxRegion_ctorByCoords(x, y, w, h)); }

        public this(Точка topLeft, Точка bottomRight)
            { this(wxRegion_ctorByCorners(topLeft, bottomRight)); }

        public this(Прямоугольник прям)
            { this(wxRegion_ctorByRect(прям)); }

        version(__WXMAC__) {} else
        public this(Точка[] points, цел fillStyle)
            { this(wxRegion_ctorByPoly(points.length, points, fillStyle)); }

        public this(Битмап bmp, Цвет transColour, цел tolerance)
            { this(wxRegion_ctorByBitmap(wxObject.SafePtr(bmp), wxObject.SafePtr(transColour), tolerance)); }

        public this(Region reg)
            { this(wxRegion_ctorByRegion(wxObject.SafePtr(reg))); }

        //---------------------------------------------------------------------

        public проц Очисть()
        {
            wxRegion_Clear(шхобъ);
        }

        version(__WXMAC__) {} else
        public бул Offset(цел x, цел y)
        {
            return wxRegion_Offset(шхобъ, x, y);
        }

        //---------------------------------------------------------------------

        public бул Union(цел x, цел y, цел ширина, цел высота) 
        {
            return wxRegion_Union(шхобъ, x, y, ширина, высота);
        }

        public бул Union(Прямоугольник прям)
        {
            return wxRegion_UnionRect(шхобъ, прям);
        }

        public бул Union(Region reg)
        {
            return wxRegion_UnionRegion(шхобъ, wxObject.SafePtr(reg));
        }

        public бул Union(Битмап bmp, Цвет transColour, цел tolerance)
        {
            return wxRegion_UnionBitmap(шхобъ, wxObject.SafePtr(bmp), wxObject.SafePtr(transColour), tolerance);
        }

        //---------------------------------------------------------------------

        public бул Intersect(цел x, цел y, цел ширина, цел высота)
        {
            return wxRegion_Intersect(шхобъ, x, y, ширина, высота);
        }

        public бул Intersect(Прямоугольник прям)
        {
            return wxRegion_IntersectRect(шхобъ, прям);
        }

        public бул Intersect(Region region)
        {
            return wxRegion_IntersectRegion(шхобъ, wxObject.SafePtr(region));
        }

        //---------------------------------------------------------------------

        public бул Subtract(цел x, цел y, цел ширина, цел высота)
        {
            return wxRegion_Subtract(шхобъ, x, y, ширина, высота);
        }

        public бул Subtract(Прямоугольник прям)
        {
            return wxRegion_SubtractRect(шхобъ, прям);
        }

        public бул Subtract(Region region)
        {
            return wxRegion_SubtractRegion(шхобъ, wxObject.SafePtr(region));
        }

        //---------------------------------------------------------------------

        public бул Xor(цел x, цел y, цел ширина, цел высота)
        {
            return wxRegion_Xor(шхобъ, x, y, ширина, высота);
        }

        public бул Xor(Прямоугольник прям)
        {
            return wxRegion_XorRect(шхобъ, прям);
        }

        public бул Xor(Region region)
        {
            return wxRegion_XorRegion(шхобъ, wxObject.SafePtr(region));
        }

        //---------------------------------------------------------------------

        public RegionContain Contains(цел x, цел y)
        {
            return wxRegion_ContainsCoords(шхобъ, x, y);
        }

        public RegionContain Contains(Точка pt)
        {
            return wxRegion_ContainsPoint(шхобъ, pt);
        }

        public RegionContain Contains(цел x, цел y, цел ширина, цел высота)
        {
            return wxRegion_ContainsRectCoords(шхобъ, x, y, ширина, высота);
        }

        public RegionContain Contains(Прямоугольник прям)
        {
            return wxRegion_ContainsRect(шхобъ, прям);
        }

        //---------------------------------------------------------------------
        
        public Прямоугольник GetBox()
        {
            Прямоугольник прям;
            wxRegion_GetBox(шхобъ, прям);
            return прям;
        }

        public бул IsEmpty() { return wxRegion_IsEmpty(шхобъ); }

        public Битмап ConvertToBitmap()
        {
            return new Битмап(wxRegion_ConvertToBitmap(шхобъ));
        }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxRegionIterator_ctor();
        static extern (C) ЦУк wxRegionIterator_ctorByRegion(ЦУк region);

        static extern (C) проц   wxRegionIterator_Reset(ЦУк сам);
        static extern (C) проц   wxRegionIterator_ResetToRegion(ЦУк сам, ЦУк region);

        static extern (C) бул   wxRegionIterator_HaveRects(ЦУк сам);
        
        static extern (C) цел    wxRegionIterator_GetX(ЦУк сам);
        static extern (C) цел    wxRegionIterator_GetY(ЦУк сам);

        static extern (C) цел    wxRegionIterator_GetW(ЦУк сам);
        static extern (C) цел    wxRegionIterator_GetWidth(ЦУк сам);
        static extern (C) цел    wxRegionIterator_GetH(ЦУк сам);
        static extern (C) цел    wxRegionIterator_GetHeight(ЦУк сам);

        static extern (C) проц   wxRegionIterator_GetRect(ЦУк сам, inout Прямоугольник прям);
		//! \endcond

        //---------------------------------------------------------------------

    alias RegionIterator wxRegionIterator;
    public class RegionIterator : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(wxRegionIterator_ctor()); }

        public this(Region reg)
            { this(wxRegionIterator_ctorByRegion(wxObject.SafePtr(reg))); }

        //---------------------------------------------------------------------

        public проц Reset()
        {
            wxRegionIterator_Reset(шхобъ);
        }

        public проц ResetToRegion(Region region)
        {
            wxRegionIterator_ResetToRegion(шхобъ, wxObject.SafePtr(region));
        }

        //---------------------------------------------------------------------

        public бул HaveRects()
        {
            return wxRegionIterator_HaveRects(шхобъ);
        }

        //---------------------------------------------------------------------
        
        public цел X() { return wxRegionIterator_GetX(шхобъ); }

        public цел Y() { return wxRegionIterator_GetY(шхобъ); }

        //---------------------------------------------------------------------

        public цел Ширина() { return wxRegionIterator_GetWidth(шхобъ); }

        public цел Высота() { return wxRegionIterator_GetHeight(шхобъ); }

        //---------------------------------------------------------------------

        public Прямоугольник Rect() { 
                Прямоугольник прям;
                wxRegionIterator_GetRect(шхобъ, прям);
                return прям;
            }
    }
