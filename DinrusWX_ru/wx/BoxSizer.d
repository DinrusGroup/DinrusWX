//-----------------------------------------------------------------------------
// wxD - БоксСайзер.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - БоксСайзер.cs
//
/// The wxBoxSizer wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: БоксСайзер.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.BoxSizer;
public import wx.common;
public import wx.Sizer;

//! \cond EXTERN
extern(C)
{
    alias проц function(БоксСайзер объ) Virtual_voidvoid;
    alias проц function(БоксСайзер объ,out Размер Размер) Virtual_wxSizevoid;
}

static extern (C) проц wxBoxSizer_RegisterVirtual(ЦелУкз сам, БоксСайзер объ, Virtual_voidvoid recalcSizes, Virtual_wxSizevoid calcMin);
static extern (C) проц wxBoxSizer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);

static extern (C) ЦелУкз wxBoxSizer_ctor(цел ориент);
static extern (C) проц wxBoxSizer_RecalcSizes(ЦелУкз сам);
static extern (C) проц wxBoxSizer_CalcMin(ЦелУкз сам,out Размер Размер);
static extern (C) цел wxBoxSizer_GetOrientation(ЦелУкз сам);
static extern (C) проц wxBoxSizer_SetOrientation(ЦелУкз сам, цел ориент);
//! \endcond

//---------------------------------------------------------------------

alias БоксСайзер wxBoxSizer;
public class БоксСайзер : Сайзер
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел ориент)
    {
        this(wxBoxSizer_ctor(cast(цел)ориент));
        wxBoxSizer_RegisterVirtual(wxobj, this, &staticRecalcSizes, &staticCalcMin);
        wxBoxSizer_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------
    extern(C) private static проц staticRecalcSizes(БоксСайзер объ)
    {
        return объ.пересчётРазмеров();
    }
    extern(C) private static проц staticCalcMin(БоксСайзер объ,out Размер размер)
    {
        размер = объ.вычислиМин();
    }

    public override проц пересчётРазмеров()
    {
        wxBoxSizer_RecalcSizes(wxobj);
    }

    //---------------------------------------------------------------------
    public override Размер вычислиМин()
    {
        Размер размер;
        wxBoxSizer_CalcMin(wxobj,размер);
        return размер;
    }

    //---------------------------------------------------------------------

    public цел Ориентация()
    {
        return wxBoxSizer_GetOrientation(wxobj);
    }
    public проц Ориентация(цел значение)
    {
        wxBoxSizer_SetOrientation(wxobj, значение);
    }
}
