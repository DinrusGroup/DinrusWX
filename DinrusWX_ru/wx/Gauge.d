//-----------------------------------------------------------------------------
// wxD - Gauge.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Gauge.cs
//
/// The wxGauge wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Gauge.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.Gauge;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxGauge_ctor();
static extern (C) проц   wxGauge_dtor(ЦелУкз сам);
static extern (C) бул   wxGauge_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, цел диапазон, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) проц   wxGauge_SetRange(ЦелУкз сам, цел диапазон);
static extern (C) цел    wxGauge_GetRange(ЦелУкз сам);
static extern (C) проц   wxGauge_SetValue(ЦелУкз сам, цел поз);
static extern (C) цел    wxGauge_GetValue(ЦелУкз сам);
static extern (C) проц   wxGauge_SetShadowWidth(ЦелУкз сам, цел w);
static extern (C) цел    wxGauge_GetShadowWidth(ЦелУкз сам);
static extern (C) проц   wxGauge_SetBezelFace(ЦелУкз сам, цел w);
static extern (C) цел    wxGauge_GetBezelFace(ЦелУкз сам);
static extern (C) бул   wxGauge_AcceptsFocus(ЦелУкз сам);
static extern (C) бул   wxGauge_IsVertical(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Gauge wxGauge;
public class Gauge :  Control
{
    enum
    {
        wxGA_HORIZONTAL       = Ориентация.wxHORIZONTAL,
        wxGA_VERTICAL         = Ориентация.wxVERTICAL,
        wxGA_PROGRESSBAR      = 0x0010,
    }

    // Windows only
    public const цел wxGA_SMOOTH           = 0x0020;

    public const ткст wxGaugeNameStr = "gauge";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxGauge_ctor());
    }

    public this(Окно родитель, цел ид, цел диапазон, Точка поз = вхДефПоз, Размер Размер = вхДефРазм,
                цел стиль = wxGA_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxGaugeNameStr)
    {
        super(wxGauge_ctor());
        if (!создай(родитель, ид, диапазон, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать Gauge");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Gauge(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, цел диапазон, Точка поз = вхДефПоз, Размер Размер = вхДефРазм,
                цел стиль = wxGA_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxGaugeNameStr)
    {
        this(родитель, Окно.УникИД, диапазон, поз, Размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, цел диапазон, inout Точка поз,
                       inout Размер Размер, цел стиль, Оценщик оценщик,
                       ткст имя)
    {
        return wxGauge_Create(wxobj, wxObject.SafePtr(родитель), ид, диапазон,
                              поз, Размер, cast(бцел)стиль,
                              wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    public цел Range()
    {
        return wxGauge_GetRange(wxobj);
    }
    public проц Range(цел значение)
    {
        wxGauge_SetRange(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Value()
    {
        return wxGauge_GetValue(wxobj);
    }
    public проц Value(цел значение)
    {
        wxGauge_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел ShadowWidth()
    {
        return wxGauge_GetShadowWidth(wxobj);
    }
    public проц ShadowWidth(цел значение)
    {
        wxGauge_SetShadowWidth(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел BezelFace()
    {
        return wxGauge_GetBezelFace(wxobj);
    }
    public проц BezelFace(цел значение)
    {
        wxGauge_SetBezelFace(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public override бул фокусируем()
    {
        return wxGauge_AcceptsFocus(wxobj);
    }

    //---------------------------------------------------------------------

    public бул вертикален()
    {
        return wxGauge_IsVertical(wxobj);
    }
}
