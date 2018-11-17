//-----------------------------------------------------------------------------
// wxD - КнопкаБитмап.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - BitMapButton.cs
//
/// The wxBitmapButton wrapper class.
//
// Written by Robert Roebling
// (C) 2003 Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: КнопкаБитмап.d,v 1.11 2007/03/13 17:02:40 afb Exp $
//-----------------------------------------------------------------------------

module wx.BitmapButton;
public import wx.common;
public import wx.Bitmap;
public import wx.Button;
public import wx.Control;

//! \cond EXTERN
extern (C)
{
    alias проц function(КнопкаБитмап объ) Virtual_OnSetBitmap;
}

static extern (C) ЦелУкз wxBitmapButton_ctor();
static extern (C) проц   wxBitmapButton_RegisterVirtual(ЦелУкз сам, КнопкаБитмап объ,Virtual_OnSetBitmap onУстBitmap);
//static extern (C) проц   wxBitmapButton_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) бул   wxBitmapButton_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) проц   wxBitmapButton_SetDefault(ЦелУкз сам);

static extern (C) проц wxBitmapButton_SetLabel(ЦелУкз сам, ткст ярлык);
static extern (C) ЦелУкз wxBitmapButton_GetLabel(ЦелУкз сам);

static extern (C) бул wxBitmapButton_Enable(ЦелУкз сам, бул вкл);

static extern (C) проц   wxBitmapButton_SetBitmapLabel(ЦелУкз сам, ЦелУкз битмап);
static extern (C) ЦелУкз wxBitmapButton_GetBitmapLabel(ЦелУкз сам);

static extern (C) проц wxBitmapButton_SetBitmapSelected(ЦелУкз сам, ЦелУкз битмап);
static extern (C) ЦелУкз wxBitmapButton_GetBitmapSelected(ЦелУкз сам);

static extern (C) проц wxBitmapButton_SetBitmapFocus(ЦелУкз сам, ЦелУкз битмап);
static extern (C) ЦелУкз wxBitmapButton_GetBitmapFocus(ЦелУкз сам);

static extern (C) проц wxBitmapButton_SetBitmapDisabled(ЦелУкз сам, ЦелУкз битмап);
static extern (C) ЦелУкз wxBitmapButton_GetBitmapDisabled(ЦелУкз сам);

static extern (C) проц wxBitmapButton_OnSetBitmap(ЦелУкз сам);

//static extern (C) проц wxBitmapButton_ApplyParentThemeBackground(ЦелУкз сам, ЦелУкз цвет);
//! \endcond

//---------------------------------------------------------------------

public const цел wxBU_AUTODRAW      =  0x0004;

//---------------------------------------------------------------------

alias КнопкаБитмап wxBitmapButton;
public class КнопкаБитмап : Control
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxBitmapButton_ctor());
        wxBitmapButton_RegisterVirtual(wxobj, this, &staticOnSetBitmap);
    }

    public this(Окно родитель, цел ид, Битмап ярлык)
    {
        this(родитель, ид, ярлык, вхДефПоз, вхДефРазм, 0, null, null);
    }

    public this(Окно родитель, цел ид, Битмап ярлык, Точка поз)
    {
        this(родитель, ид, ярлык, поз, вхДефРазм, 0, null, null);
    }

    public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер Размер)
    {
        this(родитель, ид, ярлык, поз, Размер, 0, null, null);
    }

    public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер Размер, цел стиль)
    {
        this(родитель, ид, ярлык, поз, Размер, стиль, null, null);
    }

    public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер Размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, ид, ярлык, поз, Размер, стиль, оценщик, null);
    }

    public this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер Размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        this();

        if (!создай(родитель, ид, ярлык, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать КнопкаБитмап");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new КнопкаБитмап(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Битмап ярлык)
    {
        this(родитель, Окно.УникИД, ярлык, вхДефПоз, вхДефРазм, 0, null, null);
    }

    public this(Окно родитель, Битмап ярлык, Точка поз)
    {
        this(родитель, Окно.УникИД, ярлык, поз, вхДефРазм, 0, null, null);
    }

    public this(Окно родитель, Битмап ярлык, Точка поз, Размер Размер)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, 0, null, null);
    }

    public this(Окно родитель, Битмап ярлык, Точка поз, Размер Размер, цел стиль)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, null, null);
    }

    public this(Окно родитель, Битмап ярлык, Точка поз, Размер Размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, оценщик, null);
    }

    public this(Окно родитель, Битмап ярлык, Точка поз, Размер Размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер Размер, бцел стиль, Оценщик оценщик, ткст имя)
    {
        return wxBitmapButton_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(ярлык), поз, Размер, стиль, wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    public проц УстДеф()
    {
        wxBitmapButton_SetDefault(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст ЯрлыкСтрока()
    {
        return cast(ткст) new wxString(wxBitmapButton_GetLabel(wxobj), да);
    }
    public проц ЯрлыкСтрока(ткст значение)
    {
        wxBitmapButton_SetLabel(wxobj, значение);
    }

    public проц УстЯрлык(ткст ярлык)
    {
        wxBitmapButton_SetLabel(wxobj, ярлык);
    }

    public ткст ДайЯрлык()
    {
        return cast(ткст) new wxString(wxBitmapButton_GetLabel(wxobj), да);
    }

    //---------------------------------------------------------------------

    public бул Включи()
    {
        return Включи(да);
    }

    public бул Включи(бул вкл)
    {
        return wxBitmapButton_Enable(wxobj, вкл);
    }

    //---------------------------------------------------------------------

    public Битмап ЯрлыкБитмапа()
    {
        return cast(Битмап)НайдиОбъект(wxBitmapButton_GetBitmapLabel(wxobj), &Битмап.Нов);
    }
    public проц ЯрлыкБитмапа(Битмап значение)
    {
        wxBitmapButton_SetBitmapLabel(wxobj, wxObject.SafePtr(значение));
    }
    /+
    public Битмап Ярлык()
    {
        return cast(Битмап)НайдиОбъект(wxBitmapButton_GetBitmapLabel(wxobj), &Битмап.Нов);
    }
    public проц Ярлык(Битмап значение)
    {
        wxBitmapButton_SetBitmapLabel(wxobj, wxObject.SafePtr(значение));
    }
    +/

    //---------------------------------------------------------------------

    public Битмап БитмапВыбран()
    {
        return cast(Битмап)НайдиОбъект(wxBitmapButton_GetBitmapSelected(wxobj), &Битмап.Нов);
    }
    public проц БитмапВыбран(Битмап значение)
    {
        wxBitmapButton_SetBitmapSelected(wxobj, wxObject.SafePtr(значение));
    }

    public Битмап БитмапФокус()
    {
        return cast(Битмап)НайдиОбъект(wxBitmapButton_GetBitmapFocus(wxobj), &Битмап.Нов);
    }
    public проц БитмапФокус(Битмап значение)
    {
        wxBitmapButton_SetBitmapFocus(wxobj, wxObject.SafePtr(значение));
    }

    public Битмап БитмапОтключен()
    {
        return cast(Битмап)НайдиОбъект(wxBitmapButton_GetBitmapDisabled(wxobj), &Битмап.Нов);
    }
    public проц БитмапОтключен(Битмап значение)
    {
        wxBitmapButton_SetBitmapDisabled(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------
    //! \cond EXTERN
    extern(C) private static проц staticOnSetBitmap(КнопкаБитмап объ)
    {
        return объ.ПоУстБитмапа();
    }
    //! \endcond
    protected  проц ПоУстБитмапа()
    {
        wxBitmapButton_OnSetBitmap(wxobj);
    }

    //---------------------------------------------------------------------

    /*public  проц ApplyParentThemeBackground(Цвет bg)
    {
    	wxBitmapButton_ApplyParentThemeBackground(wxobj, wxObject.SafePtr(bg));
    }*/
}
