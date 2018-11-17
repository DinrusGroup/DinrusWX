//-----------------------------------------------------------------------------
// wxD - ComboBox.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ComboBox.cs
//
/// The wxComboBox wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ComboBox.d,v 1.12 2007/03/13 17:02:40 afb Exp $
//-----------------------------------------------------------------------------

module wx.ComboBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;


//! \cond EXTERN
static extern (C) ЦелУкз wxComboBox_ctor();
static extern (C) бул   wxComboBox_Create(ЦелУкз сам, ЦелУкз окно, цел ид, ткст значение, inout Точка поз, inout Размер Размер, цел n, ткст* choices, бцел стиль, ЦелУкз оценщик, ткст имя);

static extern (C) проц   wxComboBox_Append(ЦелУкз сам, ткст элт);
static extern (C) проц   wxComboBox_AppendData(ЦелУкз сам, ткст элт, ЦелУкз data);

static extern (C) проц   wxComboBox_Clear(ЦелУкз сам);
static extern (C) проц   wxComboBox_Delete(ЦелУкз сам, цел n);

static extern (C) цел    wxComboBox_FindString(ЦелУкз сам, ткст стр);

static extern (C) цел    wxComboBox_GetCount(ЦелУкз сам);
static extern (C) цел    wxComboBox_GetSelection(ЦелУкз сам);
static extern (C) ЦелУкз wxComboBox_GetString(ЦелУкз сам, цел n);
//static extern (C) проц   wxComboBox_SetString(ЦелУкз сам, цел n, ткст текст);

static extern (C) ЦелУкз wxComboBox_GetValue(ЦелУкз сам);
static extern (C) проц   wxComboBox_SetValue(ЦелУкз сам, ткст текст);

static extern (C) ЦелУкз wxComboBox_GetStringSelection(ЦелУкз сам);
static extern (C) проц   wxComboBox_SetStringSelection(ЦелУкз сам, ткст значение);

static extern (C) ЦелУкз wxComboBox_GetClientData(ЦелУкз сам, цел n);
static extern (C) проц   wxComboBox_SetClientData(ЦелУкз сам, цел n, ЦелУкз data);

static extern (C) проц   wxComboBox_Copy(ЦелУкз сам);
static extern (C) проц   wxComboBox_Cut(ЦелУкз сам);
static extern (C) проц   wxComboBox_Paste(ЦелУкз сам);

static extern (C) проц   wxComboBox_SetInsertionPoint(ЦелУкз сам, бцел поз);
static extern (C) бцел   wxComboBox_GetInsertionPoint(ЦелУкз сам);
static extern (C) проц   wxComboBox_SetInsertionPointEnd(ЦелУкз сам);
static extern (C) бцел   wxComboBox_GetLastPosition(ЦелУкз сам);

static extern (C) проц   wxComboBox_Replace(ЦелУкз сам, бцел from, бцел to, ткст значение);
static extern (C) проц   wxComboBox_SetSelectionSingle(ЦелУкз сам, цел n);
static extern (C) проц   wxComboBox_SetSelectionMult(ЦелУкз сам, бцел from, бцел to);
static extern (C) проц   wxComboBox_SetEditable(ЦелУкз сам, бул editable);
static extern (C) проц   wxComboBox_Remove(ЦелУкз сам, бцел from, бцел to);

static extern (C) проц wxComboBox_SetSelection(ЦелУкз сам, цел n);

static extern (C) проц wxComboBox_Select(ЦелУкз сам, цел n);
//! \endcond

//---------------------------------------------------------------------

alias ComboBox wxComboBox;
public class ComboBox : Control
{
    public const цел wxCB_SIMPLE           = 0x0004;
    public const цел wxCB_SORT             = 0x0008;
    public const цел wxCB_READONLY         = 0x0010;
    public const цел wxCB_DROPDOWN         = 0x0020;

    public const ткст wxComboBoxNameStr = "comboBox";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxComboBox_ctor());
    }

    public this(Окно родитель, цел ид, ткст значение="", Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик val = null, ткст имя = wxComboBoxNameStr)
    {
        super(wxComboBox_ctor());
        if(!wxComboBox_Create(wxobj, wxObject.SafePtr(родитель), ид,
                              значение, поз, Размер,
                              choices.length, choices.ptr, cast(бцел)стиль,
                              wxObject.SafePtr(оценщик), имя))
        {
            throw new InvalidOperationException("Не удалось создать ListBox");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new ComboBox(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель)
    {
        this(родитель, Окно.УникИД, "", вхДефПоз, вхДефРазм, cast(ткст[])null, 0, null, null);
    }

    public this(Окно родитель, ткст значение="", Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик val = null, ткст имя = wxComboBoxNameStr)
    {
        this(родитель, Окно.УникИД, значение, поз, Размер, choices, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст значение,
                       Точка поз, Размер Размер,
                       ткст[] choices, цел стиль, Оценщик оценщик,
                       ткст имя)
    {
        return wxComboBox_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                 значение, поз, Размер,
                                 choices.length, choices.ptr,
                                 cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    public цел Selection()
    {
        return wxComboBox_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxComboBox_SetSelectionSingle(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст StringSelection()
    {
        return cast(ткст) new wxString(wxComboBox_GetStringSelection(wxobj), да);
    }
    public проц StringSelection(ткст значение)
    {
        wxComboBox_SetStringSelection(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Счёт()
    {
        return wxComboBox_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст GetString(цел n)
    {
        return cast(ткст) new wxString(wxComboBox_GetString(wxobj, n), да);
    }

    //---------------------------------------------------------------------

    public ClientData GetClientData(цел n)
    {
        return cast(ClientData)НайдиОбъект(wxComboBox_GetClientData(wxobj, n));
    }

    public проц УстClientData(цел n, ClientData data)
    {
        wxComboBox_SetClientData(wxobj, n, wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public цел FindString(ткст стр)
    {
        return wxComboBox_FindString(wxobj, стр);
    }

    //---------------------------------------------------------------------

    public проц Delete(цел n)
    {
        wxComboBox_Delete(wxobj, n);
    }

    public проц очисть()
    {
        wxComboBox_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Append(ткст элт)
    {
        wxComboBox_Append(wxobj, элт);
    }

    public проц Append(ткст элт, ClientData data)
    {
        wxComboBox_AppendData(wxobj, элт, wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public проц Copy()
    {
        wxComboBox_Copy(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Cut()
    {
        wxComboBox_Cut(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Paste()
    {
        wxComboBox_Paste(wxobj);
    }

    //---------------------------------------------------------------------

    public цел InsertionPoint()
    {
        return wxComboBox_GetInsertionPoint(wxobj);
    }
    public проц InsertionPoint(цел значение)
    {
        wxComboBox_SetInsertionPoint(wxobj, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    public проц УстInsertionPointEnd()
    {
        wxComboBox_SetInsertionPointEnd(wxobj);
    }

    //---------------------------------------------------------------------

    public цел GetLastPosition()
    {
        return wxComboBox_GetLastPosition(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Replace(цел from, цел to, ткст значение)
    {
        wxComboBox_Replace(wxobj, cast(бцел)from, cast(бцел)to, значение);
    }

    //---------------------------------------------------------------------

    public проц УстSelection(цел from, цел to)
    {
        wxComboBox_SetSelectionMult(wxobj, cast(бцел)from, cast(бцел)to);
    }

    public проц УстSelection(цел n)
    {
        wxComboBox_SetSelection(wxobj, n);
    }

    //---------------------------------------------------------------------

    public проц Editable(бул значение)
    {
        wxComboBox_SetEditable(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Удали(цел from, цел to)
    {
        wxComboBox_Remove(wxobj, cast(бцел)from, cast(бцел)to);
    }

    //---------------------------------------------------------------------

    public ткст Value()
    {
        return cast(ткст) new wxString(wxComboBox_GetValue(wxobj), да);
    }
    public проц Value(ткст значение)
    {
        wxComboBox_SetValue(wxobj, значение);
    }

    public проц Select(цел n)
    {
        wxComboBox_Select(wxobj, n);
    }

    //---------------------------------------------------------------------

    public проц Selected_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_COMBOBOX_SELECTED, ИД, значение, this);
    }
    public проц Selected_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

