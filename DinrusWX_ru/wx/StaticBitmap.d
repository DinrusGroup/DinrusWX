//-----------------------------------------------------------------------------
// wxD - StaticBitmap.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticBitmap.cs
//
/// The wxStaticBitmap wrapper class.
//
// Written by Robert Roebling
// (C) 2003 Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StaticBitmap.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticBitmap;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxStaticBitmap_ctor();
static extern (C) бул wxStaticBitmap_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц wxStaticBitmap_SetBitmap(ЦелУкз сам, ЦелУкз битмап);
static extern (C) ЦелУкз wxStaticBitmap_GetBitmap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias СтатическийБитмап wxStaticBitmap;
public class СтатическийБитмап : Control
{
    public const ткст wxStaticBitmapNameStr = "message";

    public this()
    {
        super(wxStaticBitmap_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, цел ид, Битмап ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBitmapNameStr)
    {
        super(wxStaticBitmap_ctor());
        if (!создай(родитель, ид, ярлык, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать СтатическийБитмап");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new СтатическийБитмап(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Битмап ярлык, Точка поз = вхДефПоз, Размер размер = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBitmapNameStr)
    {
        this(родитель, Окно.УникИД, ярлык, поз, размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, Битмап ярлык, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxStaticBitmap_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(ярлык), поз, размер, cast(бцел)стиль, имя);
    }

    //---------------------------------------------------------------------

    public проц битмап(Битмап значение)
    {
        wxStaticBitmap_SetBitmap(wxobj, wxObject.SafePtr(значение));
    }
    public Битмап битмап()
    {
        return cast(Битмап)НайдиОбъект(wxStaticBitmap_GetBitmap(wxobj), &Битмап.Нов);
    }
}
