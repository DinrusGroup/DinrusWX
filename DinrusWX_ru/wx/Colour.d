//-----------------------------------------------------------------------------
// wxD - Цвет.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Цвет.cs
//
/// The wxColour wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Цвет.d,v 1.10 2007/04/17 15:24:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.Colour;
public import wx.common;
private import stdrus;


//! \cond EXTERN
static extern (C) ЦелУкз wxColour_ctor();
static extern (C) ЦелУкз wxColour_ctorByName(ткст имя);
static extern (C) ЦелУкз wxColour_ctorByParts(ubyte red, ubyte green, ubyte blue);
static extern (C) проц   wxColour_dtor(ЦелУкз сам);
//static extern (C) проц   wxColour_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);

static extern (C) ubyte   wxColour_Red(ЦелУкз сам);
static extern (C) ubyte   wxColour_Blue(ЦелУкз сам);
static extern (C) ubyte   wxColour_Green(ЦелУкз сам);

static extern (C) бул   wxColour_Ok(ЦелУкз сам);
static extern (C) проц   wxColour_Set(ЦелУкз сам, ubyte red, ubyte green, ubyte blue);

static extern (C) ЦелУкз wxColour_CreateByName(ткст имя);
//! \endcond

//---------------------------------------------------------------------

alias Цвет wxColour;
public class Цвет : wxObject
{
    public static Цвет wxBLACK;
    public static Цвет wxWHITE;
    public static Цвет wxRED;
    public static Цвет wxBLUE;
    public static Цвет wxGREEN;
    public static Цвет wxCYAN;
    public static Цвет wxLIGHT_GREY;
    public static Цвет wxNullColour;

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxColour_ctor(), да);
        //wxColour_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public this(ткст имя)
    {
        this(wxColour_ctorByName(имя), да); // toupper
        //wxColour_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public this(ubyte red, ubyte green, ubyte blue)
    {
        this(wxColour_ctorByParts(red, green, blue), да);
        //wxColour_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    public override проц Dispose()
    {
        if ((this != Цвет.wxBLACK) && (this != Цвет.wxWHITE) &&
                (this != Цвет.wxRED) && (this != Цвет.wxBLUE) &&
                (this != Цвет.wxGREEN) && (this != Цвет.wxCYAN) &&
                (this != Цвет.wxLIGHT_GREY))
        {
            super.Dispose(/*да*/);
        }
    }

    //---------------------------------------------------------------------

    public ubyte Red()
    {
        return wxColour_Red(wxobj);
    }

    public ubyte Green()
    {
        return wxColour_Green(wxobj);
    }

    public ubyte Blue()
    {
        return wxColour_Blue(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Ок()
    {
        return wxColour_Ok(wxobj);
    }

    public проц Уст(ubyte red, ubyte green, ubyte blue)
    {
        wxColour_Set(wxobj, red, green, blue);
    }

    //---------------------------------------------------------------------

    version(__WXGTK__)
    {
        public static Цвет CreateByName(ткст имя)
        {
            return new Цвет(wxColour_CreateByName(имя), да);
        }
    } // version(__WXGTK__)

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new Цвет(ptr);
    }
}
