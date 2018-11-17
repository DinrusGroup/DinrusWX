//-----------------------------------------------------------------------------
// wxD - Choice.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Choice.cs
//
/// The wxChoice wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Choice.d,v 1.12 2007/02/10 10:48:18 afb Exp $
//-----------------------------------------------------------------------------

module wx.Choice;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.IControlWithItems;
public import wx.ArrayString;

//! \cond EXTERN
static extern (C) ЦелУкз wxChoice_ctor();
static extern (C) бул   wxChoice_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, цел n, ткст* choices, цел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) проц   wxChoice_dtor(ЦелУкз сам);

static extern (C) проц   wxChoice_SetSelection(ЦелУкз сам, цел n);
static extern (C) бул   wxChoice_SetStringSelection(ЦелУкз сам, ткст s);
static extern (C) ЦелУкз wxChoice_GetStringSelection(ЦелУкз сам);

static extern (C) проц   wxChoice_SetColumns(ЦелУкз сам, цел n);
static extern (C) цел    wxChoice_GetColumns(ЦелУкз сам);

static extern (C) проц   wxChoice_Command(ЦелУкз сам, ЦелУкз evt);
static extern (C) цел    wxChoice_GetCount(ЦелУкз сам);
static extern (C) ЦелУкз wxChoice_GetString(ЦелУкз сам, цел n);
static extern (C) цел    wxChoice_GetSelection(ЦелУкз сам);

static extern (C) ЦелУкз wxChoice_GetClientData(ЦелУкз сам, цел n);
static extern (C) проц   wxChoice_SetClientData(ЦелУкз сам, цел n, ЦелУкз data);

static extern (C) цел    wxChoice_FindString(ЦелУкз сам, ткст стр);

static extern (C) проц   wxChoice_Delete(ЦелУкз сам, цел n);
static extern (C) проц   wxChoice_Clear(ЦелУкз сам);

static extern (C) цел   wxChoice_Append(ЦелУкз сам, ткст элт);
static extern (C) цел   wxChoice_AppendData(ЦелУкз сам, ткст элт, ЦелУкз data);

static extern (C)	проц wxChoice_AppendString(ЦелУкз сам, ткст элт);

static extern (C)	проц wxChoice_AppendArrayString(ЦелУкз сам, цел n, ткст* strings);

static extern (C)	цел wxChoice_Insert(ЦелУкз сам, ткст элт, цел поз);
static extern (C)	цел wxChoice_InsertClientData(ЦелУкз сам, ткст элт, цел поз, ЦелУкз clientData);

static extern (C)	ЦелУкз wxChoice_GetStrings(ЦелУкз сам);

static extern (C)	проц wxChoice_SetClientObject(ЦелУкз сам, цел n, ЦелУкз clientData);
static extern (C)	ЦелУкз wxChoice_GetClientObject(ЦелУкз сам, цел n);
static extern (C)	бул wxChoice_HasClientObjectData(ЦелУкз сам);
static extern (C)	бул wxChoice_HasClientUntypedData(ЦелУкз сам);

static extern (C) проц wxChoice_SetString(ЦелУкз сам, цел n, ткст текст);

static extern (C) проц wxChoice_Select(ЦелУкз сам, цел n);

static extern (C)	бул wxChoice_ShouldInheritColours(ЦелУкз сам);

static extern (C)	бул wxChoice_IsEmpty(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Choice wxChoice;
public class Choice : Control, IControlWithItems
{
    public const ткст wxChoiceNameStr = "choice";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxChoice_ctor());
    }

    public this(Окно родитель, цел ид, Точка поз, Размер Размер, ткст[] choices = null, цел стиль = 0, Оценщик val = null,ткст имя = wxChoiceNameStr)
    {
        super(wxChoice_ctor());
        if(!wxChoice_Create(wxobj, wxObject.SafePtr(родитель), ид, поз,
                            Размер, choices.length, choices.ptr, стиль,
                            wxObject.SafePtr(оценщик), имя))
        {
            throw new InvalidOperationException("Не удалось создать ListBox");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Choice(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз, Размер Размер, ткст[] choices = null, цел стиль = 0, Оценщик val = null,ткст имя = wxChoiceNameStr)
    {
        this(родитель, Окно.УникИД, поз, Размер, choices, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер,
                       ткст[] choices, цел стиль, Оценщик оценщик,
                       ткст имя)
    {
        return wxChoice_Create(wxobj, wxObject.SafePtr(родитель), ид,
                               поз, Размер, choices.length, choices.ptr,
                               cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //-----------------------------------------------------------------------------

    public цел Append(ткст элт)
    {
        return wxChoice_Append(wxobj, элт);
    }

    public цел Append(ткст элт, ClientData clientData)
    {
        return wxChoice_AppendData(wxobj, элт, wxObject.SafePtr(clientData));
    }

    //-----------------------------------------------------------------------------

    public проц AppendString(ткст элт)
    {
        wxChoice_AppendString(wxobj, элт);
    }

    //-----------------------------------------------------------------------------

    public проц Append(ткст[] strings)
    {
        wxChoice_AppendArrayString(wxobj, strings.length, strings.ptr);
    }

    //-----------------------------------------------------------------------------

    public цел Insert(ткст элт, цел поз)
    {
        return wxChoice_Insert(wxobj, элт, поз);
    }

    public цел Insert(ткст элт, цел поз, ClientData clientData)
    {
        return wxChoice_InsertClientData(wxobj, элт, поз, wxObject.SafePtr(clientData));
    }

    //-----------------------------------------------------------------------------

    public ткст[] GetStrings()
    {
        return (new ТкстМассив(wxChoice_GetStrings(wxobj), да)).вМассив();
    }

    //-----------------------------------------------------------------------------

    public проц УстClientObject(цел n, ClientData clientData)
    {
        wxChoice_SetClientObject(wxobj, n, wxObject.SafePtr(clientData));
    }

    public ClientData GetClientObject(цел n)
    {
        return cast(ClientData)НайдиОбъект(wxChoice_GetClientObject(wxobj, n), &ClientData.Нов);
    }

    //-----------------------------------------------------------------------------

    public бул HasClientObjectData()
    {
        return wxChoice_HasClientObjectData(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул HasClientUntypedData()
    {
        return wxChoice_HasClientUntypedData(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Selection()
    {
        return wxChoice_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxChoice_SetSelection(wxobj, значение);
    }

    public цел GetSelection()
    {
        return wxChoice_GetSelection(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст StringSelection()
    {
        return cast(ткст) new wxString(wxChoice_GetStringSelection(wxobj), да);
    }
    public проц StringSelection(ткст значение)
    {
        wxChoice_SetStringSelection(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел Columns()
    {
        return wxChoice_GetColumns(wxobj);
    }
    public проц Columns(цел значение)
    {
        wxChoice_SetColumns(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Команда(Событие evt)
    {
        wxChoice_Command(wxobj, wxObject.SafePtr(evt));
    }

    //---------------------------------------------------------------------

    public цел Счёт()
    {
        return wxChoice_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст GetString(цел n)
    {
        return cast(ткст) new wxString(wxChoice_GetString(wxobj, n), да);
    }

    //---------------------------------------------------------------------

    // TODO: Find way to pass data through C# object

    public ClientData GetClientData(цел n)
    {
        return cast(ClientData)НайдиОбъект(wxChoice_GetClientData(wxobj, n));
    }

    public проц УстClientData(цел n, ClientData data)
    {
        wxChoice_SetClientData(wxobj, n, wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public цел FindString(ткст стр)
    {
        return wxChoice_FindString(wxobj, стр);
    }

    //---------------------------------------------------------------------

    public проц Delete(цел n)
    {
        wxChoice_Delete(wxobj, n);
    }

    //---------------------------------------------------------------------

    public проц очисть()
    {
        wxChoice_Clear(wxobj);
    }

    //---------------------------------------------------------------------

    public проц УстString(цел n, ткст стр)
    {
        wxChoice_SetString(wxobj, n, стр);
    }

    //---------------------------------------------------------------------

    public проц Select(цел n)
    {
        wxChoice_Select(wxobj, n);
    }

    //-----------------------------------------------------------------------------

    public override бул НаследоватьЦвета()
    {
        return wxChoice_ShouldInheritColours(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Empty()
    {
        return wxChoice_IsEmpty(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Selected_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_CHOICE_SELECTED, ИД, значение, this);
    }
    public проц Selected_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

}
