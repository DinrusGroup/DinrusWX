//-----------------------------------------------------------------------------
// wxD - ListBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ListBox.cs
//
/// The wxListBox wrapper class
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ListBox.d,v 1.12 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.ListBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;

//! \cond EXTERN
static extern (C) ЦелУкз wxListBox_ctor();
static extern (C) проц   wxListBox_dtor(ЦелУкз сам);
static extern (C) проц   wxListBox_Clear(ЦелУкз сам);
static extern (C) бул   wxListBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, цел n, ткст* choices, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) проц   wxListBox_InsertText(ЦелУкз сам, ткст элт, цел поз);
static extern (C) проц   wxListBox_InsertTextData(ЦелУкз сам, ткст элт, цел поз, ЦелУкз data);
static extern (C) проц   wxListBox_InsertTextClientData(ЦелУкз сам, ткст элт, цел поз, ЦелУкз clientData);
static extern (C) проц   wxListBox_InsertItems(ЦелУкз сам, цел nItems, ткст* элтs, цел поз);
static extern (C) проц   wxListBox_Set(ЦелУкз сам, цел n, ткст* элтs, ЦелУкз clientData);
static extern (C) проц   wxListBox_SetSelection(ЦелУкз сам, цел n, бул select);
static extern (C) проц   wxListBox_Select(ЦелУкз сам, цел n);
static extern (C) проц   wxListBox_Deselect(ЦелУкз сам, цел n);
static extern (C) проц   wxListBox_DeselectAll(ЦелУкз сам, цел элтToLeaveSelected);
static extern (C) бул   wxListBox_SetStringSelection(ЦелУкз сам, ткст s, бул select);
static extern (C) ЦелУкз wxListBox_GetSelections(ЦелУкз сам);
static extern (C) проц   wxListBox_SetFirstItem(ЦелУкз сам, цел n);
static extern (C) проц   wxListBox_SetFirstItemText(ЦелУкз сам, ткст s);
static extern (C) бул   wxListBox_HasMultipleSelection(ЦелУкз сам);
static extern (C) бул   wxListBox_IsSorted(ЦелУкз сам);
static extern (C) проц   wxListBox_Command(ЦелУкз сам, ЦелУкз evt);
static extern (C) бул   wxListBox_Selected(ЦелУкз сам, цел n);
static extern (C) цел    wxListBox_GetSelection(ЦелУкз сам);
static extern (C) ЦелУкз wxListBox_GetStringSelection(ЦелУкз сам);
static extern (C) проц   wxListBox_SetSingleString(ЦелУкз сам, цел n, ткст s);
static extern (C) ЦелУкз wxListBox_GetSingleString(ЦелУкз сам, цел n);
static extern (C) проц   wxListBox_Append(ЦелУкз сам, ткст элт);
static extern (C) проц   wxListBox_AppendClientData(ЦелУкз сам, ткст элт, ЦелУкз cliendData);
static extern (C) проц   wxListBox_Delete(ЦелУкз сам, цел n);
static extern (C) цел    wxListBox_GetCount(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias ListBox wxListBox;
public class ListBox : Control
{
    enum
    {
        wxLB_SORT             = 0x0010,
        wxLB_SINGLE           = 0x0020,
        wxLB_MULTIPLE         = 0x0040,
        wxLB_EXTENDED         = 0x0080,
        wxLB_OWNERDRAW        = 0x0100,
        wxLB_NEED_SB          = 0x0200,
        wxLB_ALWAYS_SB        = 0x0400,
        wxLB_HSCROLL          = wxHSCROLL,
        wxLB_INT_HEIGHT       = 0x0800,
    }

    public const ткст wxListBoxNameStr = "listBox";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxListBox_ctor());
    }

    public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм,
                ткст[] choices = null, цел стиль = 0, Оценщик оценщик =null, ткст имя = wxListBoxNameStr)
    {
        super(wxListBox_ctor());
        if(!wxListBox_Create(wxobj, wxObject.SafePtr(родитель), ид,
                             поз, Размер, choices.length, choices.ptr, cast(бцел)стиль,
                             wxObject.SafePtr(оценщик), имя))
        {
            throw new InvalidOperationException("Не удалось создать ListBox");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new ListBox(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм,
                ткст[] choices = null, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxListBoxNameStr)
    {
        this( родитель, Окно.УникИД, поз, Размер, choices, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел n,
                       ткст[] choices, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxListBox_Create(wxobj, wxObject.SafePtr(родитель), ид,
                                поз, Размер, n, choices.ptr, cast(бцел)стиль,
                                wxObject.SafePtr(оценщик), имя);
    }

    //---------------------------------------------------------------------

    public цел Selection()
    {
        return wxListBox_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxListBox_Select(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст StringSelection()
    {
        return cast(ткст) new wxString(wxListBox_GetStringSelection(wxobj), да);
    }
    public проц StringSelection(ткст значение)
    {
        wxListBox_SetStringSelection(wxobj, значение, да);
    }

    //---------------------------------------------------------------------

    public проц УстSelection(цел n, бул select)
    {
        wxListBox_SetSelection(wxobj, n, select);
    }

    public проц УстSelection(ткст элт, бул select)
    {
        wxListBox_SetStringSelection(wxobj, элт, select);
    }

    //---------------------------------------------------------------------

    public проц очисть()
    {
        wxListBox_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст GetString(цел n)
    {
        return cast(ткст) new wxString(wxListBox_GetSingleString(wxobj, n), да);
    }

    public проц УстString(цел n, ткст стр)
    {
        wxListBox_SetSingleString(wxobj, n, стр);
    }

    //---------------------------------------------------------------------

    public проц Append(ткст элт)
    {
        wxListBox_Append(wxobj, элт);
    }

    public проц Append(ткст элт, ClientData data)
    {
        wxListBox_AppendClientData(wxobj, элт, wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public проц Delete(цел n)
    {
        wxListBox_Delete(wxobj, n);
    }

    //---------------------------------------------------------------------

    public проц Insert(ткст элт, цел поз)
    {
        wxListBox_InsertText(wxobj, элт, поз);
    }

    public проц Insert(ткст элт, цел поз, ClientData data)
    {
        wxListBox_InsertTextData(wxobj, элт, поз, wxObject.SafePtr(data));
    }

    /*public проц Insert(ткст элт, цел поз, ClientData data)
    {
    wxListBox_InsertTextClientData(wxobj, элт, поз, wxObject.SafePtr(data));
    }*/

    //---------------------------------------------------------------------

    public проц InsertItems(ткст[] элтs, цел поз)
    {
        wxListBox_InsertItems(wxobj, элтs.length, элтs.ptr, поз);
    }

    //---------------------------------------------------------------------

    public проц Уст(ткст[] элтs, ClientData data)
    {
        wxListBox_Set(wxobj, элтs.length, элтs.ptr, wxObject.SafePtr(data));
    }

    public проц Уст(ткст[] элтs)
    {
        wxListBox_Set(wxobj, элтs.length, элтs.ptr, wxObject.SafePtr(null));
    }

    //---------------------------------------------------------------------

    public бул Selected(цел n)
    {
        return wxListBox_Selected(wxobj, n);
    }

    //---------------------------------------------------------------------

    public бул Sorted()
    {
        return wxListBox_IsSorted(wxobj);
    }

    //---------------------------------------------------------------------

    public бул HasMultipleSelection()
    {
        return wxListBox_HasMultipleSelection(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Deselect(цел n)
    {
        wxListBox_Deselect(wxobj, n);
    }

    public проц DeselectAll(цел элтToLeaveSelected)
    {
        wxListBox_DeselectAll(wxobj, элтToLeaveSelected);
    }

    //---------------------------------------------------------------------

    public цел[] Selections()
    {
        return (new ЦелМассив(wxListBox_GetSelections(wxobj),да)).вМассив();
    }

    //---------------------------------------------------------------------

    public проц УстFirstItem(цел n)
    {
        wxListBox_SetFirstItem(wxobj, n);
    }

    public проц УстFirstItem(ткст s)
    {
        wxListBox_SetFirstItemText(wxobj, s);
    }

    //---------------------------------------------------------------------

    public проц Команда(Событие evt)
    {
        wxListBox_Command(wxobj, wxObject.SafePtr(evt));
    }

    //---------------------------------------------------------------------

    public цел Счёт()
    {
        return wxListBox_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Select_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOX_SELECTED, ИД, значение, this);
    }
    public проц Select_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц DoubleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOX_DOUBLECLICKED, ИД, значение, this);
    }
    public проц DoubleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxCheckListBox_ctor1();
static extern (C) ЦелУкз wxCheckListBox_ctor2(ЦелУкз родитель,
        цел ид,
        inout Точка поз,
        inout Размер Размер,
        цел nStrings,
        ткст* choices,
        бцел стиль,
        ЦелУкз оценщик,
        ткст имя);
static extern (C) бул wxCheckListBox_IsChecked(ЦелУкз сам, цел index);
static extern (C) проц wxCheckListBox_Check(ЦелУкз сам, цел index, бул check);
static extern (C) цел wxCheckListBox_GetItemHeight(ЦелУкз сам);
//! \endcond

alias CheckListBox wxCheckListBox;
public class CheckListBox : ListBox
{
    const ткст wxListBoxNameStr = "listBox";

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxCheckListBox_ctor1());
    }

    public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxListBoxNameStr)
    {
        super(wxCheckListBox_ctor2(wxObject.SafePtr(родитель), ид, поз, Размер, choices.length, choices.ptr, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя));
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxListBoxNameStr)
    {
        this(родитель, Окно.УникИД, поз, Размер, choices, стиль, оценщик, имя);
    }

    //--------------------------------------------------------------------

    public бул IsChecked(цел index)
    {
        return wxCheckListBox_IsChecked(wxobj, index);
    }

    //---------------------------------------------------------------------

    public проц Check(цел index)
    {
        Check(index, да);
    }

    public проц Check(цел index, бул check)
    {
        wxCheckListBox_Check(wxobj, index, check);
    }

    //---------------------------------------------------------------------

    version(__WXMAC__) {} else
        public цел ItemHeight()
    {
        return wxCheckListBox_GetItemHeight(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Checked_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_CHECKLISTBOX_TOGGLED, ИД, значение, this);
    }
    public проц Checked_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}
