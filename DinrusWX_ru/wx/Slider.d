//-----------------------------------------------------------------------------
// wxD - Slider.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Slider.cs
//
/// The wxSlider wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: Slider.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.Slider;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxSlider_ctor();
static extern (C) бул   wxSlider_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, цел значение, цел minValue, цел maxValue, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) цел    wxSlider_GetValue(ЦелУкз сам);
static extern (C) проц   wxSlider_SetValue(ЦелУкз сам, цел значение);
static extern (C) проц   wxSlider_SetRange(ЦелУкз сам, цел minValue, цел maxValue);
static extern (C) цел    wxSlider_GetMin(ЦелУкз сам);
static extern (C) цел    wxSlider_GetMax(ЦелУкз сам);
static extern (C) проц   wxSlider_SetLineSize(ЦелУкз сам, цел lineSize);
static extern (C) проц   wxSlider_SetPageSize(ЦелУкз сам, цел pageSize);
static extern (C) цел    wxSlider_GetLineSize(ЦелУкз сам);
static extern (C) цел    wxSlider_GetPageSize(ЦелУкз сам);
static extern (C) проц   wxSlider_SetThumbLength(ЦелУкз сам, цел lenPixels);
static extern (C) цел    wxSlider_GetThumbLength(ЦелУкз сам);
static extern (C) проц   wxSlider_SetTickFreq(ЦелУкз сам, цел n, цел поз);
static extern (C) цел    wxSlider_GetTickFreq(ЦелУкз сам);
static extern (C) проц   wxSlider_ClearTicks(ЦелУкз сам);
static extern (C) проц   wxSlider_SetTick(ЦелУкз сам, цел tickPos);
static extern (C) проц   wxSlider_ClearSel(ЦелУкз сам);
static extern (C) цел    wxSlider_GetSelEnd(ЦелУкз сам);
static extern (C) цел    wxSlider_GetSelStart(ЦелУкз сам);
static extern (C) проц   wxSlider_SetSelection(ЦелУкз сам, цел min, цел max);
//! \endcond

//---------------------------------------------------------------------

alias Slider wxSlider;
public class Slider : Control
{
    enum
    {
        wxSL_HORIZONTAL      = Ориентация.wxHORIZONTAL,
        wxSL_VERTICAL        = Ориентация.wxVERTICAL,

        wxSL_NOTIFY_DRAG     = 0x0000,
        wxSL_TICKS           = 0x0010,
        wxSL_AUTOTICKS       = wxSL_TICKS,
        wxSL_LABELS          = 0x0020,
        wxSL_LEFT            = 0x0040,
        wxSL_TOP             = 0x0080,
        wxSL_RIGHT           = 0x0100,
        wxSL_BOTTOM          = 0x0200,
        wxSL_BOTH            = 0x0400,
        wxSL_SELRANGE        = 0x0800,
    }

    public const ткст wxSliderNameStr = "slider";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxSlider_ctor());
    }

    public this(Окно родитель, цел ид, цел значение, цел minValue, цел maxValue, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSL_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxSliderNameStr)
    {
        super(wxSlider_ctor());
        if(!создай(родитель, ид, значение, minValue, maxValue, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать Slider");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Slider(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, цел значение, цел minValue, цел maxValue, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSL_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxSliderNameStr)
    {
        this(родитель, Окно.УникИД, значение, minValue, maxValue, поз, Размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, цел значение, цел minValue, цел maxValue, inout Точка поз, inout Размер Размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxSlider_Create(wxobj, wxObject.SafePtr(родитель), ид, значение, minValue, maxValue, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }


    //---------------------------------------------------------------------

    public цел Value()
    {
        return wxSlider_GetValue(wxobj);
    }
    public проц Value(цел значение)
    {
        wxSlider_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц УстRange(цел minValue, цел maxValue)
    {
        wxSlider_SetRange(wxobj, minValue, maxValue);
    }

    public цел Max()
    {
        return wxSlider_GetMax(wxobj);
    }

    public цел Min()
    {
        return wxSlider_GetMin(wxobj);
    }

    //---------------------------------------------------------------------

    public цел LineSize()
    {
        return wxSlider_GetLineSize(wxobj);
    }
    public проц LineSize(цел значение)
    {
        wxSlider_SetLineSize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел PageSize()
    {
        return wxSlider_GetPageSize(wxobj);
    }
    public проц PageSize(цел значение)
    {
        wxSlider_SetPageSize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел ThumbLength()
    {
        return wxSlider_GetThumbLength(wxobj);
    }
    public проц ThumbLength(цел значение)
    {
        wxSlider_SetThumbLength(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел TickFreq()
    {
        return wxSlider_GetTickFreq(wxobj);
    }

    public проц УстTickFreq(цел n, цел поз)
    {
        wxSlider_SetTickFreq(wxobj, n, поз);
    }

    //---------------------------------------------------------------------

    public проц УстTick(цел tickPos)
    {
        wxSlider_SetTick(wxobj, tickPos);
    }

    public проц ClearTicks()
    {
        wxSlider_ClearTicks(wxobj);
    }

    public проц ClearSel()
    {
        wxSlider_ClearSel(wxobj);
    }

    //---------------------------------------------------------------------

    public цел SelEnd()
    {
        return wxSlider_GetSelEnd(wxobj);
    }

    public цел SelStart()
    {
        return wxSlider_GetSelStart(wxobj);
    }

    public проц УстSelection(цел min, цел max)
    {
        wxSlider_SetSelection(wxobj, min, max);
    }

    //---------------------------------------------------------------------

    public override проц UpdateUI_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_SLIDER_UPDATED, ИД, значение, this);
    }
    public override проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}
