//-----------------------------------------------------------------------------
// wxD - ScrolledWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ScrolledWindow.cs
//
/// The wxScrolledWindow wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ScrolledWindow.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ScrolledWindow;
public import wx.common;
public import wx.Panel;

//! \cond EXTERN
static extern (C) ЦелУкз wxScrollWnd_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц   wxScrollWnd_PrepareDC(ЦелУкз сам, ЦелУкз dc);
static extern (C) проц   wxScrollWnd_SetScrollbars(ЦелУкз сам, цел pixX, цел pixY, цел numX, цел numY, цел x, цел y, бул noRefresh);
static extern (C) проц   wxScrollWnd_GetViewStart(ЦелУкз сам, inout цел x, inout цел y);
static extern (C) проц   wxScrollWnd_GetScrollPixelsPerUnit(ЦелУкз сам, inout цел xUnit, inout цел yUnit);

static extern (C) проц   wxScrollWnd_CalcScrolledPosition(ЦелУкз сам, цел x, цел y, inout цел xx, inout цел yy);
static extern (C) проц   wxScrollWnd_CalcUnscrolledPosition(ЦелУкз сам, цел x, цел y, inout цел xx, inout цел yy);
static extern (C) проц   wxScrollWnd_GetVirtualSize(ЦелУкз сам, inout цел x, inout цел y);
static extern (C) проц   wxScrollWnd_Scroll(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxScrollWnd_SetScrollRate(ЦелУкз сам, цел xstep, цел ystep);
static extern (C) проц   wxScrollWnd_SetTargetWindow(ЦелУкз сам, ЦелУкз окно);
//! \endcond

//---------------------------------------------------------------------

alias ScrolledWindow wxScrolledWindow;
public class ScrolledWindow : Panel
{
    enum
    {
        wxScrolledWindowStyle = (wxHSCROLL | wxVSCROLL),
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxScrolledWindowStyle, ткст имя = вхСтрИмяПанели)
    {
        super(wxScrollWnd_ctor(wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя));
        EVT_PAINT(&OnPaint);
    }

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxScrolledWindowStyle, ткст имя = вхСтрИмяПанели)
    {
        this(родитель,Окно.УникИД,поз,Размер,стиль,имя);
    }

    //---------------------------------------------------------------------

    public  проц OnDraw(DC dc)
    {
    }

    //---------------------------------------------------------------------

    public override проц ПодготовьКР(DC dc)
    {
        wxScrollWnd_PrepareDC(wxobj, dc.wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY)
    {
        УстScrollbars(pixelsPerUnitY, pixelsPerUnitY, noUnitsY, noUnitsY, 0, 0, false);
    }

    public проц УстScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY, цел x, цел y)
    {
        УстScrollbars(pixelsPerUnitY, pixelsPerUnitY, noUnitsY, noUnitsY, x, y, false);
    }

    public проц УстScrollbars(цел pixelsPerUnitX, цел pixelsPerUnitY, цел noUnitsX, цел noUnitsY, цел x, цел y, бул noRefresh)
    {
        wxScrollWnd_SetScrollbars(wxobj, pixelsPerUnitX, pixelsPerUnitY, noUnitsX, noUnitsY, x, y, noRefresh);
    }

    //---------------------------------------------------------------------

    private проц OnPaint(Объект отправитель, Событие e)
    {
        PaintDC dc = new PaintDC(this);
        ПодготовьКР(dc);
        OnDraw(dc);
        dc.Dispose();
    }

    //---------------------------------------------------------------------

    public Точка ViewStart()
    {
        Точка тчк;
        GetViewStart(тчк.X, тчк.Y);
        return тчк;
    }

    public проц GetViewStart(inout цел x, inout цел y)
    {
        wxScrollWnd_GetViewStart(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц GetScrollPixelsPerUnit(inout цел xUnit, inout цел yUnit)
    {
        wxScrollWnd_GetScrollPixelsPerUnit(wxobj, xUnit, yUnit);
    }

    //---------------------------------------------------------------------

    public проц CalcScrolledPosition(цел x, цел y, inout цел xx, inout цел yy)
    {
        wxScrollWnd_CalcScrolledPosition(wxobj, x, y, xx, yy);
    }

    //---------------------------------------------------------------------

    public проц CalcUnscrolledPosition(цел x, цел y, inout цел xx, inout цел yy)
    {
        wxScrollWnd_CalcUnscrolledPosition(wxobj, x, y, xx, yy);
    }

    //---------------------------------------------------------------------

    public проц GetVirtualSize(inout цел x, inout цел y)
    {
        wxScrollWnd_GetVirtualSize(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц Scroll(цел x, цел y)
    {
        wxScrollWnd_Scroll(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public проц УстScrollRate(цел xstep, цел ystep)
    {
        wxScrollWnd_SetScrollRate(wxobj, xstep, ystep);
    }

    //---------------------------------------------------------------------

    public проц TargetWindow(Окно значение)
    {
        wxScrollWnd_SetTargetWindow(wxobj, wxObject.SafePtr(значение));
    }
}
