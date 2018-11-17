//-----------------------------------------------------------------------------
// wxD - Кнопка.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Кнопка.cs
//
/// The wxButton wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Кнопка.d,v 1.12 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.Button;
public import wx.common;
public import wx.Control;
public import wx.Bitmap;

//! \cond EXTERN
static extern (C) ЦелУкз wxButton_ctor();
static extern (C) бул   wxButton_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) проц   wxButton_SetDefault(ЦелУкз сам);
static extern (C) проц   wxButton_GetDefaultSize(out Размер Размер);

static extern (C) проц wxButton_SetImageMargins(ЦелУкз сам, цел x, цел y);
static extern (C) проц wxButton_SetImageLabel(ЦелУкз сам, ЦелУкз битмап);

static extern (C) проц wxButton_SetLabel(ЦелУкз сам, ткст ярлык);
//! \endcond

//---------------------------------------------------------------------

alias Кнопка wxButton;
public class Кнопка : Control
{
    public const цел wxBU_LEFT          =  0x0040;
    public const цел wxBU_TOP           =  0x0080;
    public const цел wxBU_RIGHT         =  0x0100;
    public const цел wxBU_BOTTOM        =  0x0200;
    public const цел wxBU_EXACTFIT      =  0x0001;

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxButton_ctor());
    }

    public this(Окно родитель, цел ид, ткст ярлык = "", Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = null)
    {
        this(wxButton_ctor());
        if (!создай(родитель, ид, ярлык, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать Кнопка");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Кнопка(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = null)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст ярлык, Точка поз, Размер Размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxButton_Create(wxobj, wxObject.SafePtr(родитель), ид, ярлык, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    public проц УстДеф()
    {
        wxButton_SetDefault(wxobj);
    }

    //---------------------------------------------------------------------

    public static Размер ДайДефРазм()
    {
        Размер Размер;
        wxButton_GetDefaultSize(Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public  проц ЯрлыкСРисунком(Битмап значение)
    {
        wxButton_SetImageLabel(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public  проц УстКраяРисунка(цел x, цел y)
    {
        wxButton_SetImageMargins(wxobj, x, y);
    }

    //---------------------------------------------------------------------
    // Do we need get also ?

    public override проц Ярлык(ткст значение)
    {
        wxButton_SetLabel(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Click_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_BUTTON_CLICKED, ИД, значение, this);
    }
    public проц Click_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

