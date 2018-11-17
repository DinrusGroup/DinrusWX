
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
        static extern (C) IntPtr wxRegion_ctor();
        static extern (C) IntPtr wxRegion_ctorByCoords(цел x, цел y, цел w, цел h);
        static extern (C) IntPtr wxRegion_ctorByCorners(inout Точка topLeft, inout Точка bottomRight);
        static extern (C) IntPtr wxRegion_ctorByRect(inout Прямоугольник прям);
        static extern (C) IntPtr wxRegion_ctorByPoly(цел n, inout Точка[] points, цел fillStyle);
        static extern (C) IntPtr wxRegion_ctorByBitmap(IntPtr bmp, IntPtr transColour, цел tolerance);
        static extern (C) IntPtr wxRegion_ctorByRegion(IntPtr region);

        static extern (C) проц   wxRegion_dtor(IntPtr сам);

        static extern (C) проц   wxRegion_Clear(IntPtr сам);
        static extern (C) бул   wxRegion_Offset(IntPtr сам, цел x, цел y);

        static extern (C) бул   wxRegion_Union(IntPtr сам, цел x, цел y, цел ширь, цел высь);
        static extern (C) бул   wxRegion_UnionRect(IntPtr сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_UnionRegion(IntPtr сам, IntPtr region);
        static extern (C) бул   wxRegion_UnionBitmap(IntPtr сам, IntPtr bmp, IntPtr transColour, цел tolerance);

        static extern (C) бул   wxRegion_Intersect(IntPtr сам, цел x, цел y, цел ширь, цел высь);
        static extern (C) бул   wxRegion_IntersectRect(IntPtr сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_IntersectRegion(IntPtr сам, IntPtr region);

        static extern (C) бул   wxRegion_Subtract(IntPtr сам, цел x, цел y, цел ширь, цел высь);
        static extern (C) бул   wxRegion_SubtractRect(IntPtr сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_SubtractRegion(IntPtr сам, IntPtr region);

        static extern (C) бул   wxRegion_Xor(IntPtr сам, цел x, цел y, цел ширь, цел высь);
        static extern (C) бул   wxRegion_XorRect(IntPtr сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_XorRegion(IntPtr сам, IntPtr region);

        static extern (C) RegionContain wxRegion_ContainsCoords(IntPtr сам, цел x, цел y);
        static extern (C) RegionContain wxRegion_ContainsPoint(IntPtr сам, inout Точка тчк);
        static extern (C) RegionContain wxRegion_ContainsRectCoords(IntPtr сам, цел x, цел y, цел ширь, цел высь);
        static extern (C) RegionContain wxRegion_ContainsRect(IntPtr сам, inout Прямоугольник прям);

        static extern (C) проц   wxRegion_GetBox(IntPtr сам, inout Прямоугольник прям);
        static extern (C) бул   wxRegion_IsEmpty(IntPtr сам);
        static extern (C) IntPtr wxRegion_ConvertToBitmap(IntPtr сам);
		//! \endcond

        //---------------------------------------------------------------------

    alias Регион wxRegion;
    public class Регион : GDIObject
    {

        public this(IntPtr wxobj);
        public this();
        public this(цел x, цел y, цел w, цел h);
        public this(Точка topLeft, Точка bottomRight);
        public this(Прямоугольник прям);
        version(__WXMAC__) {} else
        public this(Точка[] points, цел fillStyle);
        public this(Битмап bmp, Цвет transColour, цел tolerance);
        public this(Регион reg);
        public проц Clear();
        version(__WXMAC__) {} else
        public бул Offset(цел x, цел y);
        public бул Union(цел x, цел y, цел ширь, цел высь) ;
        public бул Union(Прямоугольник прям);
        public бул Union(Регион reg);
        public бул Union(Битмап bmp, Цвет transColour, цел tolerance);
        public бул Intersect(цел x, цел y, цел ширь, цел высь);
        public бул Intersect(Прямоугольник прям);
        public бул Intersect(Регион region);
        public бул Subtract(цел x, цел y, цел ширь, цел высь);
        public бул Subtract(Прямоугольник прям);
        public бул Subtract(Регион region);
        public бул Xor(цел x, цел y, цел ширь, цел высь);
        public бул Xor(Прямоугольник прям);
        public бул Xor(Регион region);
        public RegionContain Contains(цел x, цел y);
        public RegionContain Contains(Точка тчк);
        public RegionContain Contains(цел x, цел y, цел ширь, цел высь);
        public RegionContain Contains(Прямоугольник прям);
        public Прямоугольник GetBox();
        public бул IsEmpty() ;
        public Битмап ConvertToBitmap();
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxRegionIterator_ctor();
        static extern (C) IntPtr wxRegionIterator_ctorByRegion(IntPtr region);

        static extern (C) проц   wxRegionIterator_Reset(IntPtr сам);
        static extern (C) проц   wxRegionIterator_ResetToRegion(IntPtr сам, IntPtr region);

        static extern (C) бул   wxRegionIterator_HaveRects(IntPtr сам);
        
        static extern (C) цел    wxRegionIterator_GetX(IntPtr сам);
        static extern (C) цел    wxRegionIterator_GetY(IntPtr сам);

        static extern (C) цел    wxRegionIterator_GetW(IntPtr сам);
        static extern (C) цел    wxRegionIterator_GetWidth(IntPtr сам);
        static extern (C) цел    wxRegionIterator_GetH(IntPtr сам);
        static extern (C) цел    wxRegionIterator_GetHeight(IntPtr сам);

        static extern (C) проц   wxRegionIterator_GetRect(IntPtr сам, inout Прямоугольник прям);
		//! \endcond

        //---------------------------------------------------------------------

    alias RegionIterator wxRegionIterator;
    public class RegionIterator : wxObject
    {
        public this(IntPtr wxobj) ;
        public this();
        public this(Регион reg);
        public проц Reset();
        public проц ResetToRegion(Регион region);
        public бул HaveRects();
        public цел X() ;
        public цел Y() ;
        public цел Ширь();
        public цел Высь() ;
        public Прямоугольник Прям() ;
    }
