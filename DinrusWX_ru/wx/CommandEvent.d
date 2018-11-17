//-----------------------------------------------------------------------------
// wxD - СобытиеКоманда.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - СобытиеКоманда.cs
//
/// The wxCommandEvent wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: СобытиеКоманда.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.CommandEvent;
public import wx.common;
public import wx.Event;

public import wx.ClientData;

//! \cond EXTERN
static extern (C) ЦелУкз wxCommandEvent_ctor(цел тип,цел winid);
static extern (C) цел    wxCommandEvent_GetSelection(ЦелУкз сам);
static extern (C) ЦелУкз wxCommandEvent_GetString(ЦелУкз сам);
static extern (C) проц wxCommandEvent_SetString(ЦелУкз сам, ткст s);
static extern (C) бул   wxCommandEvent_IsChecked(ЦелУкз сам);
static extern (C) бул   wxCommandEvent_IsSelection(ЦелУкз сам);
static extern (C) цел    wxCommandEvent_GetInt(ЦелУкз сам);
static extern (C) проц wxCommandEvent_SetInt(ЦелУкз сам, цел i);

static extern (C) ЦелУкз wxCommandEvent_GetClientObject(ЦелУкз сам);
static extern (C) проц   wxCommandEvent_SetClientObject(ЦелУкз сам, ЦелУкз data);

static extern (C) проц wxCommandEvent_SetExtraLong(ЦелУкз сам, бцел extralong);
static extern (C) бцел wxCommandEvent_GetExtraLong(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias СобытиеКоманда wxCommandEvent;
public class СобытиеКоманда : Событие
{

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия типКоманды = wxEVT_NULL, цел winid = 0)
    {
        super(wxCommandEvent_ctor(cast(цел) типКоманды,winid));
    }

    //-----------------------------------------------------------------------------

    public цел Выбор()
    {
        return wxCommandEvent_GetSelection(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст Ткст()
    {
        return cast(ткст) new wxString(wxCommandEvent_GetString(wxobj), да);
    }
    public проц Ткст(ткст значение)
    {
        wxCommandEvent_SetString(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул Отмечен()
    {
        return wxCommandEvent_IsChecked(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Выборка()
    {
        return wxCommandEvent_IsSelection(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел Цел()
    {
        return wxCommandEvent_GetInt(wxobj);
    }
    public проц Цел(цел значение)
    {
        wxCommandEvent_SetInt(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ClientData ОбъектКлиент()
    {
        return cast(ClientData)НайдиОбъект(wxCommandEvent_GetClientObject(wxobj));
    }
    public проц ОбъектКлиент(ClientData значение)
    {
        wxCommandEvent_SetClientObject(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public цел ЭкстраДол()
    {
        return cast(цел)wxCommandEvent_GetExtraLong(wxobj);
    }
    public проц ЭкстраДол(цел значение)
    {
        wxCommandEvent_SetExtraLong(wxobj, cast(бцел)значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеКоманда(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_COMMAND_BUTTON_CLICKED,          &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_MENU_SELECTED,           &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_CHECKBOX_CLICKED,        &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_LISTBOX_SELECTED,        &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LISTBOX_DOUBLECLICKED,   &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_CHOICE_SELECTED,         &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_COMBOBOX_SELECTED,       &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_TEXT_UPDATED,            &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_TEXT_ENTER,              &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_RADIOBOX_SELECTED,       &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_RADIOBUTTON_SELECTED,    &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_SLIDER_UPDATED,          &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_SPINCTRL_UPDATED,        &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_TOGGLEBUTTON_CLICKED,    &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_CHECKLISTBOX_TOGGLED,    &СобытиеКоманда.Нов);
    }
}
