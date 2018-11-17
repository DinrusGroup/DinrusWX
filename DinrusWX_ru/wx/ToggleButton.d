//-----------------------------------------------------------------------------
// wxD - ToggleButton.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ToggleButton.cs
//
/// The wxToggleToggleButton wrapper class.
//
// Written by Florian Fankhauser (f.fankhauser@gmx.at)
// (C) 2003 Florian Fankhauser
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ToggleButton.d,v 1.10 2007/03/13 17:02:42 afb Exp $
//-----------------------------------------------------------------------------

module wx.ToggleButton;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxToggleButton_ctor();
static extern (C) бул   wxToggleButton_Create(ЦелУкз сам, ЦелУкз родитель,
        цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, бцел стиль,
        ЦелУкз оценщик, ткст имя);
static extern (C) бул wxToggleButton_GetValue(ЦелУкз сам);
static extern (C) бул wxToggleButton_SetValue(ЦелУкз сам, бул state);
//! \endcond

//---------------------------------------------------------------------

alias ToggleButton wxToggleButton;
public class ToggleButton : Control
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxToggleButton_ctor());
    }

    public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = "checkbox")
    {
        super(wxToggleButton_ctor());
        if (!создай(родитель, ид, ярлык, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать ToggleButton");
        }
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ToggleButton(ptr);
    }

    //---------------------------------------------------------------------

    public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, Оценщик оценщик = null, ткст имя = "checkbox")
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер,
                       цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxToggleButton_Create(wxobj, wxObject.SafePtr(родитель), ид, ярлык, поз, Размер,
                                     cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    public бул State()
    {
        return wxToggleButton_GetValue(wxobj);
    }
    public проц State(бул значение)
    {
        wxToggleButton_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Click_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_TOGGLEBUTTON_CLICKED, ИД, значение, this);
    }
    public проц Click_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

