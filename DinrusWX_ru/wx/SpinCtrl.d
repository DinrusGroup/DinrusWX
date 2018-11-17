//-----------------------------------------------------------------------------
// wxD - SpinCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SpinCtrl.cs
//
/// The wxSpinCtrl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SpinCtrl.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.SpinCtrl;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxSpinCtrl_ctor();
static extern (C) бул   wxSpinCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст значение, inout Точка поз, inout Размер Размер, бцел стиль, цел min, цел max, цел initial, ткст имя);
static extern (C) цел    wxSpinCtrl_GetValue(ЦелУкз сам);
static extern (C) цел    wxSpinCtrl_GetMin(ЦелУкз сам);
static extern (C) цел    wxSpinCtrl_GetMax(ЦелУкз сам);
static extern (C) проц   wxSpinCtrl_SetValueStr(ЦелУкз сам, ткст значение);
static extern (C) проц   wxSpinCtrl_SetValue(ЦелУкз сам, цел val);
static extern (C) проц   wxSpinCtrl_SetRange(ЦелУкз сам, цел min, цел max);
//! \endcond

//---------------------------------------------------------------------

alias SpinCtrl wxSpinCtrl;
public class SpinCtrl : Control
{
    // These are duplicated in SpinButton.cs (for easier access)
    public const цел wxSP_HORIZONTAL       = Ориентация.wxHORIZONTAL;
    public const цел wxSP_VERTICAL         = Ориентация.wxVERTICAL;
    public const цел wxSP_ARROW_KEYS       = 0x1000;
    public const цел wxSP_WRAP             = 0x2000;

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxSpinCtrl_ctor());
    }

    public this(Окно родитель,
                цел ид /*= wxID_ANY*/,
                ткст значение = "",
                Точка поз = вхДефПоз,
                Размер Размер = вхДефРазм,
                цел стиль = wxSP_ARROW_KEYS,
                цел min = 0, цел max = 100, цел initial = 0,
                ткст имя = "SpinCtrl")
    {
        super(wxSpinCtrl_ctor());
        if(!создай(родитель, ид, значение, поз, Размер, стиль, min, max, initial, имя))
        {
            throw new InvalidOperationException("Не удалось создать SpinCtrl");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new SpinCtrl(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель,
                ткст значение = "",
                Точка поз = вхДефПоз,
                Размер Размер = вхДефРазм,
                цел стиль = wxSP_ARROW_KEYS,
                цел min = 0, цел max = 100, цел initial = 0,
                ткст имя = "SpinCtrl")
    {
        this(родитель, Окно.УникИД, значение, поз, Размер, стиль, min, max, initial, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст значение, Точка поз, Размер Размер, цел стиль, цел min, цел max, цел initial, ткст имя)
    {
        return wxSpinCtrl_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                 значение, поз, Размер, cast(бцел)стиль, min,
                                 max, initial, имя);
    }

    //---------------------------------------------------------------------

    public цел Value()
    {
        return wxSpinCtrl_GetValue(wxobj);
    }
    public проц Value(цел значение)
    {
        wxSpinCtrl_SetValue(wxobj, значение);
    }

    public проц УстValue(ткст val)
    {
        wxSpinCtrl_SetValueStr(wxobj, val);
    }

    //---------------------------------------------------------------------

    public цел Max()
    {
        return wxSpinCtrl_GetMax(wxobj);
    }

    public цел Min()
    {
        return wxSpinCtrl_GetMin(wxobj);
    }

    public проц УстRange(цел min, цел max)
    {
        wxSpinCtrl_SetRange(wxobj, min, max);
    }

    //---------------------------------------------------------------------

    public override проц UpdateUI_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_SPINCTRL_UPDATED, ИД, значение, this);
    }
    public override проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

