//-----------------------------------------------------------------------------
// wxD - CheckBox.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - CheckBox.cs
//
/// The wxCheckBox wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: CheckBox.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.CheckBox;
public import wx.common;
public import wx.Control;

public enum CheckBoxState
{
    wxCHK_UNCHECKED,
    wxCHK_CHECKED,
    wxCHK_UNDETERMINED
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxCheckBox_ctor();
static extern (C) бул   wxCheckBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз val, ткст имя);
static extern (C) бул   wxCheckBox_GetValue(ЦелУкз сам);
static extern (C) проц   wxCheckBox_SetValue(ЦелУкз сам, бул state);
static extern (C) бул   wxCheckBox_IsChecked(ЦелУкз сам);

static extern (C) CheckBoxState wxCheckBox_Get3StateValue(ЦелУкз сам);
static extern (C) проц wxCheckBox_Set3StateValue(ЦелУкз сам, CheckBoxState state);
static extern (C) бул wxCheckBox_Is3State(ЦелУкз сам);
static extern (C) бул wxCheckBox_Is3rdStateAllowedForUser(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias CheckBox wxCheckBox;
public class CheckBox : Control
{
    public const цел wxCHK_2STATE           = 0x0000;
    public const цел wxCHK_3STATE           = 0x1000;
    public const цел wxCHK_ALLOW_3RD_STATE_FOR_USER           = 0x2000;
    public const ткст wxCheckBoxNameStr = "checkbox";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxCheckBox_ctor());
    }

    public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль =0, Оценщик val=null, ткст имя = wxCheckBoxNameStr)
    {
        this(wxCheckBox_ctor());
        if (!wxCheckBox_Create(wxobj, wxObject.SafePtr(родитель), ид,
                               ярлык, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(val), имя))
        {
            throw new InvalidOperationException("Не удалось создать checkbox");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new CheckBox(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль =0, Оценщик val=null, ткст имя = wxCheckBoxNameStr)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, val, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер,
                       цел стиль, Оценщик val, ткст имя)
    {
        return wxCheckBox_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                 ярлык, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(val), имя);
    }

    //---------------------------------------------------------------------

    public бул Value()
    {
        return wxCheckBox_GetValue(wxobj);
    }
    public проц Value(бул значение)
    {
        wxCheckBox_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул IsChecked()
    {
        return wxCheckBox_IsChecked(wxobj);
    }

    //---------------------------------------------------------------------

    public CheckBoxState ThreeStateValue()
    {
        return wxCheckBox_Get3StateValue(wxobj);
    }
    public проц ThreeStateValue(CheckBoxState значение)
    {
        wxCheckBox_Set3StateValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул Is3State()
    {
        return wxCheckBox_Is3State(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Is3rdStateAllowedForUser()
    {
        return wxCheckBox_Is3rdStateAllowedForUser(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Clicked_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_CHECKBOX_CLICKED, ИД, значение, this);
    }
    public проц Clicked_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}
