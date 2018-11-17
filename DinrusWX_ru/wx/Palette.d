//-----------------------------------------------------------------------------
// wxD - Палитра.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Палитра.cs
//
/// The wxPalette wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//-----------------------------------------------------------------------------


module wx.Palette;
public import wx.common;
public import wx.GDIObject;

//! \cond EXTERN
static extern (C) ЦелУкз wxPalette_ctor();
static extern (C) проц wxPalette_dtor(ЦелУкз сам);
static extern (C) бул wxPalette_Ok(ЦелУкз сам);
static extern (C) бул wxPalette_Create(ЦелУкз сам, цел n, inout ubyte red, inout ubyte green, inout ubyte blue);
static extern (C) цел wxPalette_GetPixel(ЦелУкз сам, ubyte red, ubyte green, ubyte blue);
static extern (C) бул wxPalette_GetRGB(ЦелУкз сам, цел pixel, out ubyte red, out ubyte green, out ubyte blue);
//! \endcond

alias Палитра wxPalette;
public class Палитра : GDIObject
{
    public static Палитра wxNullPalette;
    //---------------------------------------------------------------------

    public this()
    {
        this(wxPalette_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел n, inout ubyte r, inout ubyte g, inout ubyte b)
    {
        this(wxPalette_ctor());
        if (!wxPalette_Create(wxobj, n, r, g, b))
        {
            throw new InvalidOperationException("Не удалось создать Палитра");
        }
    }

    public бул создай(цел n, inout ubyte r, inout ubyte g, inout ubyte b)
    {
        return wxPalette_Create(wxobj, n, r, g, b);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new Палитра(ptr);
    }
    //---------------------------------------------------------------------

    public бул Ок()
    {
        return wxPalette_Ok(wxobj);
    }

    //---------------------------------------------------------------------

    public цел GetPixel(ubyte red, ubyte green, ubyte blue)
    {
        return wxPalette_GetPixel(wxobj, red, green, blue);
    }

    public бул GetRGB(цел pixel, out ubyte red, out ubyte green, out ubyte blue)
    {
        return wxPalette_GetRGB(wxobj, pixel, red, green, blue);
    }

    //---------------------------------------------------------------------
}

