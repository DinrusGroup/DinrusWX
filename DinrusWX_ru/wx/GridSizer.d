//-----------------------------------------------------------------------------
// wxD - GridSizer.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - GridSizer.cs
//
/// The wxGridSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GridSizer.d,v 1.10 2007/08/20 08:39:16 afb Exp $
//-----------------------------------------------------------------------------

module wx.GridSizer;
public import wx.common;
public import wx.Sizer;

//! \cond EXTERN
static extern (C) ЦелУкз wxGridSizer_ctor(цел rows, цел cols, цел vgap, цел hgap);
static extern (C) проц wxGridSizer_RecalcSizes(ЦелУкз сам);
static extern (C) проц wxGridSizer_CalcMin(ЦелУкз сам, inout Размер Размер);
static extern (C) проц wxGridSizer_SetCols(ЦелУкз сам, цел cols);
static extern (C) проц wxGridSizer_SetRows(ЦелУкз сам, цел rows);
static extern (C) проц wxGridSizer_SetVGap(ЦелУкз сам, цел gap);
static extern (C) проц wxGridSizer_SetHGap(ЦелУкз сам, цел gap);
static extern (C) цел wxGridSizer_GetCols(ЦелУкз сам);
static extern (C) цел wxGridSizer_GetRows(ЦелУкз сам);
static extern (C) цел wxGridSizer_GetVGap(ЦелУкз сам);
static extern (C) цел wxGridSizer_GetHGap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias GridSizer wxGridSizer;
public class GridSizer : Сайзер
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел rows, цел cols, цел vgap, цел hgap)
    {
        super(wxGridSizer_ctor(rows, cols, vgap, hgap));
    }

    public this(цел cols, цел vgap = 0, цел hgap = 0)
    {
        this(cols == 0 ? 1 : 0, cols, vgap, hgap);
    }

    //---------------------------------------------------------------------

    public override проц пересчётРазмеров()
    {
        wxGridSizer_RecalcSizes(wxobj);
    }

    //---------------------------------------------------------------------

    public override Размер вычислиМин()
    {
        Размер Размер;
        wxGridSizer_CalcMin(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public проц Колонки(цел значение)
    {
        wxGridSizer_SetCols(wxobj, значение);
    }
    public цел Колонки()
    {
        return wxGridSizer_GetCols(wxobj);
    }

    public проц Ряды(цел значение)
    {
        wxGridSizer_SetRows(wxobj, значение);
    }
    public цел Ряды()
    {
        return wxGridSizer_GetRows(wxobj);
    }

    //---------------------------------------------------------------------

    public проц VGap(цел значение)
    {
        wxGridSizer_SetVGap(wxobj, значение);
    }
    public цел VGap()
    {
        return wxGridSizer_GetVGap(wxobj);
    }

    public проц HGap(цел значение)
    {
        wxGridSizer_SetHGap(wxobj, значение);
    }
    public цел HGap()
    {
        return wxGridSizer_GetHGap(wxobj);
    }

    //---------------------------------------------------------------------
}
