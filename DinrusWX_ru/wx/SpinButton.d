//-----------------------------------------------------------------------------
// wxD - SpinButton.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SpinButton.cs
//
/// The wxSpinButton wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: SpinButton.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.SpinButton;
public import wx.common;
public import wx.CommandEvent;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxSpinEvent_ctor(цел типКоманды, цел ид);
static extern (C) цел wxSpinEvent_GetPosition(ЦелУкз сам);
static extern (C) проц wxSpinEvent_SetPosition(ЦелУкз сам, цел поз);
static extern (C) проц wxSpinEvent_Veto(ЦелУкз сам);
static extern (C) проц wxSpinEvent_Allow(ЦелУкз сам);
static extern (C) бул wxSpinEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias SpinEvent wxSpinEvent;
public class SpinEvent : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел типКоманды, цел ид)
    {
        super(wxSpinEvent_ctor(типКоманды, ид));
    }

    //-----------------------------------------------------------------------------

    public цел Позиция()
    {
        return wxSpinEvent_GetPosition(wxobj);
    }
    public проц Позиция(цел значение)
    {
        wxSpinEvent_SetPosition(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Veto()
    {
        wxSpinEvent_Veto(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Allow()
    {
        wxSpinEvent_Allow(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Allowed()
    {
        return wxSpinEvent_IsAllowed(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new SpinEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_SCROLL_THUMBTRACK,               &SpinEvent.Нов);
        ДобавьТипСоб(wxEVT_SCROLL_LINEUP,                   &SpinEvent.Нов);
        ДобавьТипСоб(wxEVT_SCROLL_LINEDOWN,                 &SpinEvent.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSpinButton_ctor();
static extern (C) бул   wxSpinButton_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) цел    wxSpinButton_GetValue(ЦелУкз сам);
static extern (C) цел    wxSpinButton_GetMin(ЦелУкз сам);
static extern (C) цел    wxSpinButton_GetMax(ЦелУкз сам);
static extern (C) проц   wxSpinButton_SetValue(ЦелУкз сам, цел val);
static extern (C) проц   wxSpinButton_SetRange(ЦелУкз сам, цел minVal, цел maxVal);
//! \endcond

//---------------------------------------------------------------------
alias SpinButton wxSpinButton;
public class SpinButton : Control
{
    // These are duplicated in SpinCtrl.cs (for easier access)
    enum
    {
        wxSP_HORIZONTAL       = Ориентация.wxHORIZONTAL,
        wxSP_VERTICAL         = Ориентация.wxVERTICAL,
        wxSP_ARROW_KEYS       = 0x1000,
        wxSP_WRAP             = 0x2000,
    }

    public const ткст wxSPIN_BUTTON_NAME = "SpinButton";
    //---------------------------------------------------------------------


    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxSpinButton_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSP_VERTICAL | wxSP_ARROW_KEYS, ткст имя = wxSPIN_BUTTON_NAME)
    {
        super(wxSpinButton_ctor());
        if(!создай(родитель, ид, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать SpinButton");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new SpinButton(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSP_VERTICAL | wxSP_ARROW_KEYS, ткст имя = wxSPIN_BUTTON_NAME)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер,  цел стиль, ткст имя)
    {
        return wxSpinButton_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                   поз, Размер, cast(бцел)стиль, имя);
    }

    //---------------------------------------------------------------------

    public цел Value()
    {
        return wxSpinButton_GetValue(wxobj);
    }
    public проц Value(цел значение)
    {
        wxSpinButton_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Max()
    {
        return wxSpinButton_GetMax(wxobj);
    }

    public цел Min()
    {
        return wxSpinButton_GetMin(wxobj);
    }

    public проц УстRange(цел min, цел max)
    {
        wxSpinButton_SetRange(wxobj, min, max);
    }
}
