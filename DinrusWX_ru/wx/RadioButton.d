//-----------------------------------------------------------------------------
// wxD - RadioButton.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - RadioButton.cs
//
/// The wxRadioButton wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//-----------------------------------------------------------------------------

module wx.RadioButton;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxRadioButton_ctor();
static extern (C) бул   wxRadioButton_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз val, ткст имя);
static extern (C) бул   wxRadioButton_GetValue(ЦелУкз сам);
static extern (C) проц   wxRadioButton_SetValue(ЦелУкз сам, бул state);
//! \endcond

//---------------------------------------------------------------------

alias RadioButton wxRadioButton;
public class RadioButton : Control
{
    public const цел wxRB_GROUP     = 0x0004;
    public const цел wxRB_SINGLE    = 0x0008;

    public const ткст wxRadioButtonNameStr = "radioButton";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super (wxRadioButton_ctor());
    }

    public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик val = null, ткст имя = wxRadioButtonNameStr)
    {
        super(wxRadioButton_ctor());
        if (!wxRadioButton_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                  ярлык, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(val), имя))
        {
            throw new InvalidOperationException("Не удалось создать RadioButton");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new RadioButton(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик val = null, ткст имя = wxRadioButtonNameStr)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, val, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, цел стиль, Оценщик val, ткст имя)
    {
        return wxRadioButton_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                    ярлык, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(val), имя);
    }

    //---------------------------------------------------------------------

    public бул Value()
    {
        return wxRadioButton_GetValue(wxobj);
    }
    public проц Value(бул значение)
    {
        wxRadioButton_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Select_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_RADIOBUTTON_SELECTED, ИД, значение, this);
    }
    public проц Select_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}
