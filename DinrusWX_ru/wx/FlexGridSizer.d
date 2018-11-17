//-----------------------------------------------------------------------------
// wxD - FlexGridSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FlexGridSizer.cs
//
/// The wxFlexGridSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FlexGridSizer.d,v 1.10 2007/10/24 07:53:34 afb Exp $
//-----------------------------------------------------------------------------

module wx.FlexGridSizer;
public import wx.common;
public import wx.GridSizer;

public enum FlexSizerGrowMode
{
    NONE = 0,
    SPECIFIED,
    ALL
}

//! \cond EXTERN
static extern (C) ЦелУкз wxFlexGridSizer_ctor(цел rows, цел cols, цел vgap, цел hgap);
static extern (C) проц wxFlexGridSizer_dtor(ЦелУкз сам);
static extern (C) проц wxFlexGridSizer_RecalcSizes(ЦелУкз сам);
static extern (C) проц wxFlexGridSizer_CalcMin(ЦелУкз сам, inout Размер Размер);
static extern (C) проц wxFlexGridSizer_AddGrowableRow(ЦелУкз сам, бцел idx);
static extern (C) проц wxFlexGridSizer_RemoveGrowableRow(ЦелУкз сам, бцел idx);
static extern (C) проц wxFlexGridSizer_AddGrowableCol(ЦелУкз сам, бцел idx);
static extern (C) проц wxFlexGridSizer_RemoveGrowableCol(ЦелУкз сам, бцел idx);
static extern (C) цел wxFlexGridSizer_GetFlexibleDirection(ЦелУкз сам);
static extern (C) проц wxFlexGridSizer_SetFlexibleDirection(ЦелУкз сам, цел направление);
static extern (C) FlexSizerGrowMode wxFlexGridSizer_GetNonFlexibleGrowMode(ЦелУкз сам);
static extern (C) проц wxFlexGridSizer_SetNonFlexibleGrowMode(ЦелУкз сам,FlexSizerGrowMode mode);
//! \endcond

//---------------------------------------------------------------------

alias FlexGridSizer wxFlexGridSizer;
public class FlexGridSizer : GridSizer
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел cols, цел vgap, цел hgap)
    {
        this(0, cols, vgap, hgap);
    }

    public this(цел rows, цел cols, цел vgap, цел hgap)
    {
        super(wxFlexGridSizer_ctor(rows, cols, vgap, hgap));
    }

    //---------------------------------------------------------------------

    public override проц пересчётРазмеров()
    {
        wxFlexGridSizer_RecalcSizes(wxobj);
    }

    //---------------------------------------------------------------------

    public override Размер вычислиМин()
    {
        Размер Размер;
        wxFlexGridSizer_CalcMin(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public проц AddGrowableRow(цел idx)
    {
        wxFlexGridSizer_AddGrowableRow(wxobj, cast(бцел)idx);
    }

    public проц RemoveGrowableRow(цел idx)
    {
        wxFlexGridSizer_RemoveGrowableRow(wxobj, cast(бцел)idx);
    }

    //---------------------------------------------------------------------

    public проц AddGrowableCol(цел idx)
    {
        wxFlexGridSizer_AddGrowableCol(wxobj, cast(бцел)idx);
    }

    public проц RemoveGrowableCol(цел idx)
    {
        wxFlexGridSizer_RemoveGrowableCol(wxobj, cast(бцел)idx);
    }

    //---------------------------------------------------------------------

    public проц УстFlexibleDirection(цел направление)
    {
        wxFlexGridSizer_SetFlexibleDirection(wxobj, направление);
    }

    public цел GetFlexibleDirection()
    {
        return wxFlexGridSizer_GetFlexibleDirection(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстNonFlexibleGrowMode(FlexSizerGrowMode mode)
    {
        wxFlexGridSizer_SetNonFlexibleGrowMode(wxobj, mode);
    }

    public FlexSizerGrowMode  GetNonFlexibleGrowMode()
    {
        return wxFlexGridSizer_GetNonFlexibleGrowMode(wxobj);
    }
}
