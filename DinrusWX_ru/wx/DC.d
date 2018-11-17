//-----------------------------------------------------------------------------
// wxD - DC.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DC.cs
//
/// The wxDC wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DC.d,v 1.10 2007/01/08 23:19:13 afb Exp $
//-----------------------------------------------------------------------------


module wx.DC;
public import wx.common;
public import wx.Window;
public import wx.Pen;
public import wx.Brush;
public import wx.ArrayInt;

//! \cond EXTERN
static extern (C) проц   wxDC_dtor(ЦелУкз сам);
static extern (C) проц   wxDC_DrawBitmap(ЦелУкз сам, ЦелУкз bmp, цел x, цел y, бул transparent);
static extern (C) проц   wxDC_DrawPolygon(ЦелУкз сам, цел n, Точка* points, цел xoffset, цел yoffset, цел fill_style);
static extern (C) проц   wxDC_DrawLine(ЦелУкз сам, цел x1, цел y1, цел x2, цел y2);
static extern (C) проц   wxDC_DrawRectangle(ЦелУкз сам, цел x1, цел y1, цел x2, цел y2);
static extern (C) проц   wxDC_DrawText(ЦелУкз сам, ткст текст, цел x, цел y);
static extern (C) проц   wxDC_DrawEllipse(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) проц   wxDC_DrawPoint(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxDC_DrawRoundedRectangle(ЦелУкз сам, цел x, цел y, цел ширь, цел высь, double radius);

static extern (C) проц   wxDC_SetBackgroundMode(ЦелУкз сам, СтильЗаливки mode);

static extern (C) проц   wxDC_SetTextBackground(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxDC_GetTextBackground(ЦелУкз сам);

static extern (C) проц   wxDC_SetBrush(ЦелУкз сам, ЦелУкз brush);
static extern (C) ЦелУкз wxDC_GetBrush(ЦелУкз сам);

static extern (C) проц   wxDC_SetBackground(ЦелУкз сам, ЦелУкз brush);
static extern (C) ЦелУкз wxDC_GetBackground(ЦелУкз сам);

static extern (C) проц   wxDC_SetPen(ЦелУкз сам, ЦелУкз pen);
static extern (C) ЦелУкз wxDC_GetPen(ЦелУкз сам);

static extern (C) проц   wxDC_SetTextForeground(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxDC_GetTextForeground(ЦелУкз сам);

static extern (C) проц   wxDC_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxDC_GetFont(ЦелУкз сам);

static extern (C) проц   wxDC_GetTextExtent(ЦелУкз сам, ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, ЦелУкз theFont);
static extern (C) проц   wxDC_Clear(ЦелУкз сам);

static extern (C) проц   wxDC_DestroyClippingRegion(ЦелУкз сам);
static extern (C) проц   wxDC_SetClippingRegion(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
static extern (C) проц   wxDC_SetClippingRegionPos(ЦелУкз сам, inout Точка поз, inout Размер Размер);
static extern (C) проц   wxDC_SetClippingRegionRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) проц   wxDC_SetClippingRegionReg(ЦелУкз сам, ЦелУкз reg);

static extern (C) цел    wxDC_GetLogicalFunction(ЦелУкз сам);
static extern (C) проц   wxDC_SetLogicalFunction(ЦелУкз сам, цел func);

static extern (C) бул   wxDC_BeginDrawing(ЦелУкз сам);
static extern (C) бул   wxDC_Blit(ЦелУкз сам, цел xdest, цел ydest, цел ширь, цел высь, ЦелУкз source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask, цел ysrcMask);
static extern (C) проц   wxDC_EndDrawing(ЦелУкз сам);

static extern (C) бул   wxDC_FloodFill(ЦелУкз сам, цел x, цел y, ЦелУкз col, цел стиль);

static extern (C) бул   wxDC_GetPixel(ЦелУкз сам, цел x, цел y, ЦелУкз col);

static extern (C) проц   wxDC_CrossHair(ЦелУкз сам, цел x, цел y);

static extern (C) проц   wxDC_DrawArc(ЦелУкз сам, цел x1, цел y1, цел x2, цел y2, цел xc, цел yc);

static extern (C) проц   wxDC_DrawCheckMark(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);

static extern (C) проц   wxDC_DrawEllipticArc(ЦелУкз сам, цел x, цел y, цел w, цел h, double sa, double ea);

static extern (C) проц   wxDC_DrawLines(ЦелУкз сам, цел n, Точка* points, цел xoffset, цел yoffset);

static extern (C) проц   wxDC_DrawCircle(ЦелУкз сам, цел x, цел y, цел radius);

static extern (C) проц   wxDC_DrawIcon(ЦелУкз сам, ЦелУкз пиктограмма, цел x, цел y);

static extern (C) проц   wxDC_DrawRotatedText(ЦелУкз сам, ткст текст, цел x, цел y, double angle);

static extern (C) проц   wxDC_DrawLabel(ЦелУкз сам, ткст текст, ЦелУкз рисунок, inout Прямоугольник прям, цел alignment, цел indexAccel, inout Прямоугольник rectBounding);
static extern (C) проц   wxDC_DrawLabel2(ЦелУкз сам, ткст текст, inout Прямоугольник прям, цел alignment, цел indexAccel);

static extern (C) проц   wxDC_DrawSpline(ЦелУкз сам, цел x1, цел y1, цел x2, цел y2, цел x3, цел y3);
static extern (C) проц   wxDC_DrawSpline2(ЦелУкз сам, цел n, Точка* points);

static extern (C) бул   wxDC_StartDoc(ЦелУкз сам, ткст message);
static extern (C) проц   wxDC_EndDoc(ЦелУкз сам);
static extern (C) проц   wxDC_StartPage(ЦелУкз сам);
static extern (C) проц   wxDC_EndPage(ЦелУкз сам);

static extern (C) проц   wxDC_GetClippingBox(ЦелУкз сам, out цел x, out цел y, out цел w, out цел h);
static extern (C) проц   wxDC_GetClippingBox2(ЦелУкз сам, out Прямоугольник прям);

static extern (C) проц   wxDC_GetMultiLineTextExtent(ЦелУкз сам, ткст текст, out цел ширь, out цел высь, out цел heightline, ЦелУкз шрифт);

static extern (C) бул   wxDC_GetPartialTextExtents(ЦелУкз сам, ткст текст, ЦелУкз widths);

static extern (C) проц   wxDC_GetSize(ЦелУкз сам, out цел ширь, out цел высь);
static extern (C) проц   wxDC_GetSize2(ЦелУкз сам, inout Размер размер);
static extern (C) проц   wxDC_GetSizeMM(ЦелУкз сам, out цел ширь, out цел высь);
static extern (C) проц   wxDC_GetSizeMM2(ЦелУкз сам, inout Размер размер);

static extern (C) цел    wxDC_DeviceToLogicalX(ЦелУкз сам, цел x);
static extern (C) цел    wxDC_DeviceToLogicalY(ЦелУкз сам, цел y);
static extern (C) цел    wxDC_DeviceToLogicalXRel(ЦелУкз сам, цел x);
static extern (C) цел    wxDC_DeviceToLogicalYRel(ЦелУкз сам, цел y);
static extern (C) цел    wxDC_LogicalToDeviceX(ЦелУкз сам, цел x);
static extern (C) цел    wxDC_LogicalToDeviceY(ЦелУкз сам, цел y);
static extern (C) цел    wxDC_LogicalToDeviceXRel(ЦелУкз сам, цел x);
static extern (C) цел    wxDC_LogicalToDeviceYRel(ЦелУкз сам, цел y);

static extern (C) бул   wxDC_Ok(ЦелУкз сам);

static extern (C) цел    wxDC_GetBackgroundMode(ЦелУкз сам);

static extern (C) цел    wxDC_GetMapMode(ЦелУкз сам);
static extern (C) проц   wxDC_SetMapMode(ЦелУкз сам, цел mode);

static extern (C) проц   wxDC_GetUserScale(ЦелУкз сам, out double x, out double y);
static extern (C) проц   wxDC_SetUserScale(ЦелУкз сам, double x, double y);

static extern (C) проц   wxDC_GetLogicalScale(ЦелУкз сам, out double x, out double y);
static extern (C) проц   wxDC_SetLogicalScale(ЦелУкз сам, double x, double y);

static extern (C) проц   wxDC_GetLogicalOrigin(ЦелУкз сам, out цел x, out цел y);
static extern (C) проц   wxDC_GetLogicalOrigin2(ЦелУкз сам, inout Точка тчк);
static extern (C) проц   wxDC_SetLogicalOrigin(ЦелУкз сам, цел x, цел y);

static extern (C) проц   wxDC_GetDeviceOrigin(ЦелУкз сам, out цел x, out цел y);
static extern (C) проц   wxDC_GetDeviceOrigin2(ЦелУкз сам, inout Точка тчк);
static extern (C) проц   wxDC_SetDeviceOrigin(ЦелУкз сам, цел x, цел y);

static extern (C) проц   wxDC_SetAxisOrientation(ЦелУкз сам, бул xLeftRight, бул yBottomUp);

static extern (C) проц   wxDC_CalcBoundingBox(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxDC_ResetBoundingBox(ЦелУкз сам);

static extern (C) цел    wxDC_MinX(ЦелУкз сам);
static extern (C) цел    wxDC_MaxX(ЦелУкз сам);
static extern (C) цел    wxDC_MinY(ЦелУкз сам);
static extern (C) цел    wxDC_MaxY(ЦелУкз сам);
//! \endcond

alias DC wxDC;
public class DC : wxObject
{
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    override protected проц dtor()
    {
        wxDC_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public проц РежимФона(СтильЗаливки значение)
    {
        wxDC_SetBackgroundMode(wxobj, значение);
    }
    public СтильЗаливки РежимФона()
    {
        return cast(СтильЗаливки)wxDC_GetBackgroundMode(wxobj);
    }

    //---------------------------------------------------------------------

    public проц brush(Кисть значение)
    {
        wxDC_SetBrush(wxobj, wxObject.SafePtr(значение));
    }
    public Кисть brush()
    {
        return new Кисть(wxDC_GetBrush(wxobj));
    }

    public проц Background(Кисть значение)
    {
        wxDC_SetBackground(wxobj, wxObject.SafePtr(значение));
    }
    public Кисть Background()
    {
        return new Кисть(wxDC_GetBackground(wxobj));
    }

    //---------------------------------------------------------------------

    public проц DrawBitmap(Битмап bmp, цел x, цел y, бул useMask)
    {
        wxDC_DrawBitmap(wxobj, wxObject.SafePtr(bmp), x, y, useMask);
    }

    public проц DrawBitmap(Битмап bmp, цел x, цел y)
    {
        DrawBitmap(bmp, x, y, false);
    }

    public проц DrawBitmap(Битмап bmp, Точка тчк, бул useMask)
    {
        DrawBitmap(bmp, тчк.X, тчк.Y, useMask);
    }

    public проц DrawBitmap(Битмап bmp, Точка тчк)
    {
        DrawBitmap(bmp, тчк.X, тчк.Y, false);
    }

    //---------------------------------------------------------------------

    public проц НарисуйЭлипс(цел x, цел y, цел ширь, цел высь)
    {
        wxDC_DrawEllipse(wxobj, x, y, ширь, высь);
    }

    public проц НарисуйЭлипс(Точка тчк, wx.common.Размер рм)
    {
        НарисуйЭлипс(тчк.X, тчк.Y, рм.Ширь, рм.Высь);
    }

    public проц НарисуйЭлипс(Прямоугольник прям)
    {
        НарисуйЭлипс(прям.X, прям.Y, прям.Ширь, прям.Высь);
    }

    //---------------------------------------------------------------------

    public проц DrawPoint(цел x, цел y)
    {
        wxDC_DrawPoint(wxobj, x, y);
    }

    public проц DrawPoint(Точка тчк)
    {
        DrawPoint(тчк.X, тчк.Y);
    }

    //---------------------------------------------------------------------

    public проц DrawLine(Точка p1, Точка p2)
    {
        DrawLine(p1.X, p1.Y, p2.X, p2.Y);
    }

    public проц DrawLine(цел x1, цел y1, цел x2, цел y2)
    {
        wxDC_DrawLine(wxobj, x1, y1, x2, y2);
    }

    //---------------------------------------------------------------------

    public проц DrawPolygon(Точка[] points)
    {
        DrawPolygon(points.length, points, 0, 0, СтильЗаливки.wxODDEVEN_RULE);
    }

    public проц DrawPolygon(Точка[] points, цел xoffset, цел yoffset)
    {
        DrawPolygon(points.length, points, xoffset, yoffset, СтильЗаливки.wxODDEVEN_RULE);
    }

    public проц DrawPolygon(Точка[] points, цел xoffset, цел yoffset, СтильЗаливки fill_style)
    {
        DrawPolygon(points.length, points, xoffset, yoffset, fill_style);
    }

    public проц DrawPolygon(цел n, Точка[] points)
    {
        DrawPolygon(n, points, 0, 0, СтильЗаливки.wxODDEVEN_RULE);
    }

    public проц DrawPolygon(цел n, Точка[] points, цел xoffset, цел yoffset)
    {
        DrawPolygon(n, points, xoffset, yoffset, СтильЗаливки.wxODDEVEN_RULE);
    }

    public проц DrawPolygon(цел n, Точка[] points, цел xoffset, цел yoffset, СтильЗаливки fill_style)
    {
        wxDC_DrawPolygon(wxobj, n, points.ptr, xoffset, yoffset, cast(цел)fill_style);
    }

    //---------------------------------------------------------------------

    public проц DrawRectangle(цел x1, цел y1, цел x2, цел y2)
    {
        wxDC_DrawRectangle(wxobj, x1, y1, x2, y2);
    }

    public проц DrawRectangle(Точка тчк, wx.common.Размер рм)
    {
        DrawRectangle(тчк.X, тчк.Y, рм.Ширь, рм.Высь);
    }

    public проц DrawRectangle(Прямоугольник прям)
    {
        wxDC_DrawRectangle(wxobj, прям.X, прям.Y, прям.Ширь, прям.Высь);
    }

    //---------------------------------------------------------------------

    public проц DrawText(ткст текст, цел x, цел y)
    {
        wxDC_DrawText(wxobj, текст, x, y);
    }

    public проц DrawText(ткст текст, Точка поз)
    {
        wxDC_DrawText(wxobj, текст, поз.X, поз.Y);
    }

    //---------------------------------------------------------------------

    public проц DrawRoundedRectangle(цел x, цел y, цел ширь, цел высь, double radius)
    {
        wxDC_DrawRoundedRectangle(wxobj, x, y, ширь, высь, radius);
    }

    public проц DrawRoundedRectangle(Точка тчк, wx.common.Размер рм, double radius)
    {
        DrawRoundedRectangle(тчк.X, тчк.Y, рм.Ширь, рм.Высь, radius);
    }

    public проц DrawRoundedRectangle(Прямоугольник r, double radius)
    {
        DrawRoundedRectangle(r.X, r.Y, r.Ширь, r.Высь, radius);
    }

    //---------------------------------------------------------------------

    public проц pen(Pen значение)
    {
        wxDC_SetPen(wxobj, значение.wxobj);
    }
    public Pen pen()
    {
        return cast(Pen)НайдиОбъект(wxDC_GetPen(wxobj), &Pen.Нов);
    }

    //---------------------------------------------------------------------

    public Цвет TextForeground()
    {
        return cast(Цвет)НайдиОбъект(wxDC_GetTextForeground(wxobj), &Цвет.Нов);
    }
    public проц TextForeground(Цвет значение)
    {
        wxDC_SetTextForeground(wxobj, wxObject.SafePtr(значение));
    }

    public Цвет TextBackground()
    {
        return cast(Цвет)НайдиОбъект(wxDC_GetTextBackground(wxobj), &Цвет.Нов);
    }
    public проц TextBackground(Цвет значение)
    {
        wxDC_SetTextBackground(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Шрифт шрифт()
    {
        return cast(Шрифт)НайдиОбъект(wxDC_GetFont(wxobj), &Шрифт.Нов);
    }
    public проц шрифт(Шрифт значение)
    {
        wxDC_SetFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public  проц очисть()
    {
        wxDC_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public проц ДайПротяженностьТекста(ткст стр, out цел x, out цел y)
    {
        // Ignoring these parameters
        цел descent;
        цел внешнееВступление;

        ДайПротяженностьТекста(стр, x, y, descent, внешнееВступление, null);
    }

    public проц ДайПротяженностьТекста(ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, Шрифт theFont)
    {
        wxDC_GetTextExtent(wxobj, стр, x, y, descent, внешнееВступление, wxObject.SafePtr(theFont));
    }

    //---------------------------------------------------------------------

    public проц DestroyClippingRegion()
    {
        wxDC_DestroyClippingRegion(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстClippingRegion(цел x, цел y, цел ширь, цел высь)
    {
        wxDC_SetClippingRegion(wxobj, x, y, ширь, высь);
    }

    public проц УстClippingRegion(Точка поз, wx.common.Размер размер)
    {
        wxDC_SetClippingRegionPos(wxobj, поз, размер);
    }

    public проц УстClippingRegion(Прямоугольник прям)
    {
        wxDC_SetClippingRegionRect(wxobj, прям);
    }

    public проц УстClippingRegion(Регион reg)
    {
        wxDC_SetClippingRegionReg(wxobj, wxObject.SafePtr(reg));
    }

    //---------------------------------------------------------------------

    public Logic LogicalFunction()
    {
        return cast(Logic)wxDC_GetLogicalFunction(wxobj);
    }
    public проц LogicalFunction(Logic значение)
    {
        wxDC_SetLogicalFunction(wxobj, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    public проц BeginDrawing()
    {
        wxDC_BeginDrawing(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask, цел ysrcMask)
    {
        return wxDC_Blit(wxobj, xdest, ydest, ширь, высь, wxObject.SafePtr(source), xsrc, ysrc, rop, useMask, xsrcMask, ysrcMask);
    }

    public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source)
    {
        return Blit(xdest, ydest, ширь, высь, source, 0, 0, cast(цел) Logic.wxCOPY, false, -1, -1);
    }

    public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc)
    {
        return Blit(xdest, ydest, ширь, высь, source, xsrc, ysrc, cast(цел)Logic.wxCOPY, false, -1, -1);
    }

    public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop)
    {
        return Blit(xdest, ydest, ширь, высь, source, xsrc, ysrc, rop, false, -1, -1);
    }

    public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop, бул useMask)
    {
        return Blit(xdest, ydest, ширь, высь, source, xsrc, ysrc, rop, useMask, -1, -1);
    }

    public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask)
    {
        return Blit(xdest, ydest, ширь, высь, source, xsrc, ysrc, rop, useMask, xsrcMask, -1);
    }

    public бул Blit(Точка destPt, wx.common.Размер рм, DC source, Точка srcPt, цел rop, бул useMask, Точка srcPtMask)
    {
        return Blit(destPt.X, destPt.Y, рм.Ширь, рм.Высь, source, srcPt.X, srcPt.Y, rop, useMask, srcPtMask.X, srcPtMask.Y);
    }

    public бул Blit(Точка destPt, wx.common.Размер рм, DC source, Точка srcPt)
    {
        return Blit(destPt.X, destPt.Y, рм.Ширь, рм.Высь, source, srcPt.X, srcPt.Y, cast(цел)Logic.wxCOPY, false, -1, -1);
    }

    public бул Blit(Точка destPt, wx.common.Размер рм, DC source, Точка srcPt, цел rop)
    {
        return Blit(destPt.X, destPt.Y, рм.Ширь, рм.Высь, source, srcPt.X, srcPt.Y, rop, false, -1, -1);
    }

    public бул Blit(Точка destPt, wx.common.Размер рм, DC source, Точка srcPt, цел rop, бул useMask)
    {
        return Blit(destPt.X, destPt.Y, рм.Ширь, рм.Высь, source, srcPt.X, srcPt.Y, rop, useMask, -1, -1);
    }

    //---------------------------------------------------------------------

    public проц EndDrawing()
    {
        wxDC_EndDrawing(wxobj);
    }

    //---------------------------------------------------------------------

    public бул FloodFill(цел x, цел y, Цвет col)
    {
        return FloodFill(x, y, col, FloodStyle.wxFLOOD_SURFACE);
    }

    public бул FloodFill(цел x, цел y, Цвет col, цел стиль)
    {
        return wxDC_FloodFill(wxobj, x, y, wxObject.SafePtr(col), стиль);
    }

    public бул FloodFill(Точка тчк, Цвет col)
    {
        return FloodFill(тчк, col, FloodStyle.wxFLOOD_SURFACE);
    }

    public бул FloodFill(Точка тчк, Цвет col, цел стиль)
    {
        return FloodFill(тчк.X, тчк.Y, col, стиль);
    }

    //---------------------------------------------------------------------

    public бул GetPixel(цел x, цел y, Цвет col)
    {
        return wxDC_GetPixel(wxobj, x, y, wxObject.SafePtr(col));
    }

    public бул GetPixel(Точка тчк, Цвет col)
    {
        return GetPixel(тчк.X, тчк.Y, col);
    }

    //---------------------------------------------------------------------

    public проц CrossHair(цел x, цел y)
    {
        wxDC_CrossHair(wxobj, x, y);
    }

    public проц CrossHair(Точка тчк)
    {
        CrossHair(тчк.X, тчк.Y);
    }

    //---------------------------------------------------------------------

    public проц DrawArc(цел x1, цел y1, цел x2, цел y2, цел xc, цел yc)
    {
        wxDC_DrawArc(wxobj, x1, y1, x2, y2, xc, yc);
    }

    public проц DrawArc(Точка pt1, Точка pt2, Точка centre)
    {
        DrawArc(pt1.X, pt1.Y, pt2.X, pt2.Y, centre.X, centre.Y);
    }

    //---------------------------------------------------------------------

    public проц DrawCheckMark(цел x, цел y, цел ширь, цел высь)
    {
        wxDC_DrawCheckMark(wxobj, x, y, ширь, высь);
    }

    public проц DrawCheckMark(Прямоугольник прям)
    {
        DrawCheckMark(прям.X, прям.Y, прям.Ширь, прям.Высь);
    }

    //---------------------------------------------------------------------

    public проц DrawEllipticArc(цел x, цел y, цел w, цел h, double sa, double ea)
    {
        wxDC_DrawEllipticArc(wxobj, x, y, w, h, sa, ea);
    }

    public проц DrawEllipticArc(Точка тчк, wx.common.Размер рм, double sa, double ea)
    {
        DrawEllipticArc(тчк.X, тчк.Y, рм.Ширь, рм.Высь, sa, ea);
    }

    //---------------------------------------------------------------------

    public проц DrawLines(Точка[] points, цел xoffset, цел yoffset)
    {
        wxDC_DrawLines(wxobj, points.length, points.ptr, xoffset, yoffset);
    }

    public проц DrawLines(Точка[] points)
    {
        DrawLines(points, 0, 0);
    }

    public проц DrawLines(Точка[] points, цел xoffset)
    {
        DrawLines(points, xoffset, 0);
    }

    //---------------------------------------------------------------------

    public проц DrawCircle(цел x, цел y, цел radius)
    {
        wxDC_DrawCircle(wxobj, x, y, radius);
    }

    public проц DrawCircle(Точка тчк, цел radius)
    {
        DrawCircle(тчк.X, тчк.Y, radius);
    }

    //---------------------------------------------------------------------

    public проц DrawIcon(Пиктограмма пиктограмма, цел x, цел y)
    {
        wxDC_DrawIcon(wxobj, wxObject.SafePtr(пиктограмма), x, y);
    }

    public проц DrawIcon(Пиктограмма пиктограмма, Точка тчк)
    {
        DrawIcon(пиктограмма, тчк.X, тчк.Y);
    }

    //---------------------------------------------------------------------

    public проц DrawRotatedText(ткст текст, цел x, цел y, double angle)
    {
        wxDC_DrawRotatedText(wxobj, текст, x, y, angle);
    }

    public проц DrawRotatedText(ткст текст, Точка тчк, double angle)
    {
        DrawRotatedText(текст, тчк.X, тчк.Y, angle);
    }

    //---------------------------------------------------------------------

    public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment, цел indexAccel, inout Прямоугольник rectBounding)
    {
        wxDC_DrawLabel(wxobj, текст, wxObject.SafePtr(рисунок), прям, alignment, indexAccel, rectBounding);
    }

    public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям)
    {
        Прямоугольник dummy;
        DrawLabel(текст, рисунок, прям, cast(цел)(Alignment.wxALIGN_LEFT | Alignment.wxALIGN_TOP), -1, dummy);
    }

    public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment)
    {
        Прямоугольник dummy;
        DrawLabel(текст, рисунок, прям, alignment, -1, dummy);
    }

    public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment, цел indexAccel)
    {
        Прямоугольник dummy;
        DrawLabel(текст, рисунок, прям, alignment, indexAccel, dummy);
    }

    //---------------------------------------------------------------------

    public проц DrawLabel(ткст текст, Прямоугольник прям, цел alignment, цел indexAccel)
    {
        wxDC_DrawLabel2(wxobj, текст, прям, alignment, indexAccel);
    }

    public проц DrawLabel(ткст текст, Прямоугольник прям)
    {
        DrawLabel(текст, прям, cast(цел)(Alignment.wxALIGN_LEFT | Alignment.wxALIGN_TOP), -1);
    }

    public проц DrawLabel(ткст текст, Прямоугольник прям, цел alignment)
    {
        DrawLabel(текст, прям, alignment, -1);
    }

    //---------------------------------------------------------------------

    public проц DrawSpline(цел x1, цел y1, цел x2, цел y2, цел x3, цел y3)
    {
        wxDC_DrawSpline(wxobj, x1, y1, x2, y2, x3, y3);
    }

    public проц DrawSpline(Точка[] points)
    {
        wxDC_DrawSpline2(wxobj, points.length, points.ptr);
    }

    //---------------------------------------------------------------------

    public  бул StartDoc(ткст message)
    {
        return wxDC_StartDoc(wxobj, message);
    }

    //---------------------------------------------------------------------

    public  проц EndDoc()
    {
        wxDC_EndDoc(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц StartPage()
    {
        wxDC_StartPage(wxobj);
    }

    //---------------------------------------------------------------------

    public  проц EndPage()
    {
        wxDC_EndPage(wxobj);
    }

    //---------------------------------------------------------------------

    public проц GetClippingBox(out цел x, out цел y, out цел w, out цел h)
    {
        wxDC_GetClippingBox(wxobj, x, y, w, h);
    }

    public проц GetClippingBox(out Прямоугольник прям)
    {
        wxDC_GetClippingBox2(wxobj, прям);
    }

    //---------------------------------------------------------------------

    public  проц GetMultiLineTextExtent(ткст текст, out цел ширь, out цел высь, out цел heightline, Шрифт шрифт)
    {
        wxDC_GetMultiLineTextExtent(wxobj, текст, ширь, высь, heightline, wxObject.SafePtr(шрифт));
    }

    public  проц GetMultiLineTextExtent(ткст текст, out цел ширь, out цел высь)
    {
        цел heightline;

        GetMultiLineTextExtent(текст, ширь, высь, heightline, null);
    }

    public  проц GetMultiLineTextExtent(ткст текст, out цел ширь, out цел высь, out цел heightline)
    {
        GetMultiLineTextExtent(текст, ширь, высь, heightline, null);
    }

    //---------------------------------------------------------------------

    public бул GetPartialTextExtents(ткст текст, цел[] widths)
    {
        ЦелМассив ai = new ЦелМассив();

        for(цел i = 0; i < widths.length; ++i)
            ai.Добавь(widths[i]);

        return wxDC_GetPartialTextExtents(wxobj, текст, ЦелМассив.SafePtr(ai));
    }

    //---------------------------------------------------------------------

    public проц GetSize(out цел ширь, out цел высь)
    {
        wxDC_GetSize(wxobj, ширь, высь);
    }

    public Размер размер()
    {
        Размер размер;
        wxDC_GetSize2(wxobj, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    public проц GetSizeMM(out цел ширь, out цел высь)
    {
        wxDC_GetSizeMM(wxobj, ширь, высь);
    }

    public Размер SizeMM()
    {
        Размер Размер;
        wxDC_GetSizeMM2(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public цел DeviceToLogicalX(цел x)
    {
        return wxDC_DeviceToLogicalX(wxobj, x);
    }

    //---------------------------------------------------------------------

    public цел DeviceToLogicalY(цел y)
    {
        return wxDC_DeviceToLogicalY(wxobj, y);
    }

    //---------------------------------------------------------------------

    public цел DeviceToLogicalXRel(цел x)
    {
        return wxDC_DeviceToLogicalXRel(wxobj, x);
    }

    //---------------------------------------------------------------------

    public цел DeviceToLogicalYRel(цел y)
    {
        return wxDC_DeviceToLogicalYRel(wxobj, y);
    }

    //---------------------------------------------------------------------

    public цел LogicalToDeviceX(цел x)
    {
        return wxDC_LogicalToDeviceX(wxobj, x);
    }

    //---------------------------------------------------------------------

    public цел LogicalToDeviceY(цел y)
    {
        return wxDC_LogicalToDeviceY(wxobj, y);
    }

    //---------------------------------------------------------------------

    public цел LogicalToDeviceXRel(цел x)
    {
        return wxDC_LogicalToDeviceXRel(wxobj, x);
    }

    //---------------------------------------------------------------------

    public цел LogicalToDeviceYRel(цел y)
    {
        return wxDC_LogicalToDeviceYRel(wxobj, y);
    }

    //---------------------------------------------------------------------

    public  бул Ок()
    {
        return wxDC_Ok(wxobj);
    }

    //---------------------------------------------------------------------

    public цел MapMode()
    {
        return wxDC_GetMapMode(wxobj);
    }
    public проц MapMode(цел значение)
    {
        wxDC_SetMapMode(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public  проц GetUserScale(out double x, out double y)
    {
        wxDC_GetUserScale(wxobj, x, y);
    }

    public  проц УстUserScale(double x, double y)
    {
        wxDC_SetUserScale(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public  проц GetLogicalScale(out double x, out double y)
    {
        wxDC_GetLogicalScale(wxobj, x, y);
    }

    public  проц УстLogicalScale(double x, double y)
    {
        wxDC_SetLogicalScale(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц GetLogicalOrigin(out цел x, out цел y)
    {
        wxDC_GetLogicalOrigin(wxobj, x, y);
    }

    public Точка LogicalOrigin()
    {
        Точка тчк;
        wxDC_GetLogicalOrigin2(wxobj, тчк);
        return тчк;
    }

    public проц УстLogicalOrigin(цел x, цел y)
    {
        wxDC_SetLogicalOrigin(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц GetDeviceOrigin(out цел x, out цел y)
    {
        wxDC_GetDeviceOrigin(wxobj, x, y);
    }

    public Точка DeviceOrigin()
    {
        Точка тчк;
        wxDC_GetDeviceOrigin2(wxobj, тчк);
        return тчк;
    }

    public проц УстDeviceOrigin(цел x, цел y)
    {
        wxDC_SetDeviceOrigin(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц УстAxisOrientation(бул xLeftRight, бул yBottomUp)
    {
        wxDC_SetAxisOrientation(wxobj, xLeftRight, yBottomUp);
    }

    //---------------------------------------------------------------------

    public  проц CalcBoundingBox(цел x, цел y)
    {
        wxDC_CalcBoundingBox(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц ResetBoundingBox()
    {
        wxDC_ResetBoundingBox(wxobj);
    }

    //---------------------------------------------------------------------

    public цел MinX()
    {
        return wxDC_MinX(wxobj);
    }

    //---------------------------------------------------------------------

    public цел MaxX()
    {
        return wxDC_MaxX(wxobj);
    }

    //---------------------------------------------------------------------

    public цел MinY()
    {
        return wxDC_MinY(wxobj);
    }

    //---------------------------------------------------------------------

    public цел MaxY()
    {
        return wxDC_MaxY(wxobj);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new DC(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxWindowDC_ctor();
static extern (C) ЦелУкз wxWindowDC_ctor2(ЦелУкз win);
static extern (C) бул wxWindowDC_CanDrawBitmap(ЦелУкз сам);
static extern (C) бул wxWindowDC_CanGetTextExtent(ЦелУкз сам);
static extern (C) цел wxWindowDC_GetCharWidth(ЦелУкз сам);
static extern (C) цел wxWindowDC_GetCharHeight(ЦелУкз сам);
static extern (C) проц wxWindowDC_Clear(ЦелУкз сам);
static extern (C) проц wxWindowDC_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) проц wxWindowDC_SetPen(ЦелУкз сам, ЦелУкз pen);
static extern (C) проц wxWindowDC_SetBrush(ЦелУкз сам, ЦелУкз brush);
static extern (C) проц wxWindowDC_SetBackground(ЦелУкз сам, ЦелУкз brush);
static extern (C) проц wxWindowDC_SetLogicalFunction(ЦелУкз сам, цел func);
static extern (C) проц wxWindowDC_SetTextForeground(ЦелУкз сам, ЦелУкз цвет);
static extern (C) проц wxWindowDC_SetTextBackground(ЦелУкз сам, ЦелУкз цвет);
static extern (C) проц wxWindowDC_SetBackgroundMode(ЦелУкз сам, цел mode);
static extern (C) проц wxWindowDC_SetPalette(ЦелУкз сам, ЦелУкз палитра);
static extern (C) проц wxWindowDC_GetPPI(ЦелУкз сам, inout Размер Размер);
static extern (C) цел wxWindowDC_GetDepth(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias WindowDC wxWindowDC;
public class WindowDC : DC
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
        this(wxWindowDC_ctor(), да);
    }

    public this(Окно win)
    {
        this(wxWindowDC_ctor2(wxObject.SafePtr(win)), да);
    }

    //---------------------------------------------------------------------

    public бул CanDrawBitmap()
    {
        return wxWindowDC_CanDrawBitmap(wxobj);
    }

    //---------------------------------------------------------------------

    public бул CanGetTextExtent()
    {
        return wxWindowDC_CanGetTextExtent(wxobj);
    }

    //---------------------------------------------------------------------

    public цел GetCharWidth()
    {
        return wxWindowDC_GetCharWidth(wxobj);
    }

    //---------------------------------------------------------------------

    public цел GetCharHeight()
    {
        return wxWindowDC_GetCharHeight(wxobj);
    }

    //---------------------------------------------------------------------

    public цел ВысьСим()
    {
        return wxWindowDC_GetCharHeight(wxobj);
    }

    //---------------------------------------------------------------------

    public цел ШирьСим()
    {
        return wxWindowDC_GetCharWidth(wxobj);
    }

    //---------------------------------------------------------------------

    public override проц очисть()
    {
        wxWindowDC_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстFont(Шрифт шрифт)
    {
        wxWindowDC_SetFont(wxobj, wxObject.SafePtr(шрифт));
    }

    //---------------------------------------------------------------------

    public проц УстPen(Pen pen)
    {
        wxWindowDC_SetPen(wxobj, wxObject.SafePtr(pen));
    }

    //---------------------------------------------------------------------

    public проц УстBrush(Кисть brush)
    {
        wxWindowDC_SetBrush(wxobj, wxObject.SafePtr(brush));
    }

    //---------------------------------------------------------------------

    public проц УстBackground(Кисть brush)
    {
        wxWindowDC_SetBackground(wxobj, wxObject.SafePtr(brush));
    }

    //---------------------------------------------------------------------

    public проц УстLogicalFunction(цел func)
    {
        wxWindowDC_SetLogicalFunction(wxobj, func);
    }

    //---------------------------------------------------------------------

    public проц УстTextForeground(Цвет цвет)
    {
        wxWindowDC_SetTextForeground(wxobj, wxObject.SafePtr(цвет));
    }

    //---------------------------------------------------------------------

    public проц УстTextBackground(Цвет цвет)
    {
        wxWindowDC_SetTextBackground(wxobj, wxObject.SafePtr(цвет));
    }

    //---------------------------------------------------------------------

    public проц УстBackgroundMode(цел mode)
    {
        wxWindowDC_SetBackgroundMode(wxobj, mode);
    }

    //---------------------------------------------------------------------

    public проц УстPalette(Палитра палитра)
    {
        wxWindowDC_SetPalette(wxobj, wxObject.SafePtr(палитра));
    }

    //---------------------------------------------------------------------

    public Размер GetPPI()
    {
        Размер рм;
        wxWindowDC_GetPPI(wxobj, рм);
        return рм;
    }

    //---------------------------------------------------------------------

    public цел GetDepth()
    {
        return wxWindowDC_GetDepth(wxobj);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxClientDC_ctor();
static extern (C) ЦелУкз wxClientDC_ctor2(ЦелУкз окно);
//! \endcond

//---------------------------------------------------------------------

alias ClientDC wxClientDC;
public class ClientDC : WindowDC
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
        this(wxClientDC_ctor(), да);
    }

    public this(Окно окно)
    {
        this(wxClientDC_ctor2(wxObject.SafePtr(окно)), да);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxPaintDC_ctor();
static extern (C) ЦелУкз wxPaintDC_ctor2(ЦелУкз окно);
//! \endcond

//---------------------------------------------------------------------

alias PaintDC wxPaintDC;
public class PaintDC : WindowDC
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
        this(wxPaintDC_ctor(), да);
    }

    public this(Окно окно)
    {
        this(wxPaintDC_ctor2(wxObject.SafePtr(окно)), да);
    }
}
