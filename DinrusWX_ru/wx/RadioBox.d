//-----------------------------------------------------------------------------
// wxD - RadioBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - RadioBox.cs
//
/// The wxRadioBox wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: RadioBox.d,v 1.13 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.RadioBox;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxRadioBox_ctor();
static extern (C) бул   wxRadioBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид,
        ткст ярлык, inout Точка поз, inout Размер Размер,
        цел n, ткст* choices, цел majorDimension,
        бцел стиль, ЦелУкз val, ткст имя);

static extern (C) проц   wxRadioBox_SetSelection(ЦелУкз сам, цел n);
static extern (C) цел    wxRadioBox_GetSelection(ЦелУкз сам);

static extern (C) ЦелУкз wxRadioBox_GetStringSelection(ЦелУкз сам);
static extern (C) бул   wxRadioBox_SetStringSelection(ЦелУкз сам, ткст s);

static extern (C) цел    wxRadioBox_GetCount(ЦелУкз сам);
static extern (C) цел    wxRadioBox_FindString(ЦелУкз сам, ткст s);

static extern (C) ЦелУкз wxRadioBox_GetString(ЦелУкз сам, цел n);
static extern (C) проц   wxRadioBox_SetString(ЦелУкз сам, цел n, ткст ярлык);

static extern (C) проц   wxRadioBox_Enable(ЦелУкз сам, цел n, бул вкл);
static extern (C) проц   wxRadioBox_Show(ЦелУкз сам, цел n, бул покажи);

static extern (C) ЦелУкз wxRadioBox_GetLabel(ЦелУкз сам);
static extern (C) проц   wxRadioBox_SetLabel(ЦелУкз сам, ткст ярлык);
//! \endcond

//---------------------------------------------------------------------

alias RadioBox wxRadioBox;
public class RadioBox : Control
{
    enum
    {
        wxRA_LEFTTORIGHT    = 0x0001,
        wxRA_TOPTOBOTTOM    = 0x0002,
        wxRA_SPECIFY_COLS   = Ориентация.wxHORIZONTAL,
        wxRA_SPECIFY_ROWS   = Ориентация.wxVERTICAL,
        wxRA_HORIZONTAL     = Ориентация.wxHORIZONTAL,
        wxRA_VERTICAL       = Ориентация.wxVERTICAL,
    }

    public const ткст wxRadioBoxNameStr = "radioBox";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст[] choices = null, цел majorDimension = 0, цел стиль = wxRA_HORIZONTAL, Оценщик val = null, ткст имя = wxRadioBoxNameStr)
    {
        super(wxRadioBox_ctor());
        if (!wxRadioBox_Create(wxobj, wxObject.SafePtr(родитель), ид, ярлык, поз, Размер,
                               choices.length, choices.ptr, majorDimension, cast(бцел)стиль, wxObject.SafePtr(val), имя))
        {
            throw new InvalidOperationException("Не удалось создать checkbox");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new RadioBox(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст[] choices = null, цел majorDimension = 0, цел стиль = wxRA_HORIZONTAL, Оценщик val = null, ткст имя = wxRadioBoxNameStr)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, choices, majorDimension, стиль, val, имя);
    }

    //---------------------------------------------------------------------

    public проц Selection(цел значение)
    {
        wxRadioBox_SetSelection(wxobj, значение);
    }
    public цел Selection()
    {
        return wxRadioBox_GetSelection(wxobj);
    }

    public проц StringSelection(ткст значение)
    {
        wxRadioBox_SetStringSelection(wxobj, значение);
    }
    public ткст StringSelection()
    {
        return cast(ткст) new wxString(wxRadioBox_GetStringSelection(wxobj), да);
    }

    //---------------------------------------------------------------------

    public цел Счёт()
    {
        return wxRadioBox_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    public цел FindString(ткст s)
    {
        return wxRadioBox_FindString(wxobj, s);
    }

    //---------------------------------------------------------------------

    public ткст GetString(цел n)
    {
        return cast(ткст) new wxString(wxRadioBox_GetString(wxobj, n), да);
    }

    public проц УстString(цел n, ткст ярлык)
    {
        wxRadioBox_SetString(wxobj, n, ярлык);
    }

    //---------------------------------------------------------------------

    public проц Включи(цел n, бул вкл)
    {
        wxRadioBox_Enable(wxobj, n, вкл);
    }

    public проц Покажи(цел n, бул покажи)
    {
        wxRadioBox_Show(wxobj, n, покажи);
    }

    //---------------------------------------------------------------------

    public override ткст Ярлык()
    {
        return cast(ткст) new wxString(wxRadioBox_GetLabel(wxobj), да);
    }
    public override проц Ярлык(ткст значение)
    {
        wxRadioBox_SetLabel(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Select_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_RADIOBOX_SELECTED, ИД, значение, this);
    }
    public проц Select_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}
