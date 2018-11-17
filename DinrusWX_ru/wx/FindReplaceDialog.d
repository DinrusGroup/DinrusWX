//-----------------------------------------------------------------------------
// wxD - FindReplaceDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FindReplaceDialog.cs
//
/// The wxFindReplaceDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FindReplaceDialog.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.FindReplaceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.CommandEvent;

//! \cond EXTERN
static extern (C) ЦелУкз wxFindReplaceDialog_ctor();
static extern (C) бул   wxFindReplaceDialog_Create(ЦелУкз сам, ЦелУкз родитель, ЦелУкз data, ткст титул, бцел стиль);

static extern (C) ЦелУкз wxFindReplaceDialog_GetData(ЦелУкз сам);
static extern (C) проц   wxFindReplaceDialog_SetData(ЦелУкз сам, ЦелУкз data);
//! \endcond

//-----------------------------------------------------------------------------

alias FindReplaceDialog wxFindReplaceDialog;
public class FindReplaceDialog : Dialog
{
    public const цел wxFR_DOWN       = 1;
    public const цел wxFR_WHOLEWORD  = 2;
    public const цел wxFR_MATCHCASE  = 4;

    public const цел wxFR_REPLACEDIALOG = 1;
    public const цел wxFR_NOUPDOWN      = 2;
    public const цел wxFR_NOMATCHCASE   = 4;
    public const цел wxFR_NOWHOLEWORD   = 8;

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxFindReplaceDialog_ctor());
    }

    public this(Окно родитель, FindReplaceData data, ткст титул, цел стиль = 0)
    {
        super(wxFindReplaceDialog_ctor());
        if (!создай(родитель, data, титул, стиль))
        {
            throw new InvalidOperationException("Не удалось создать FindReplaceDialog");
        }
    }

    public бул создай(Окно родитель, FindReplaceData data, ткст титул, цел стиль = 0)
    {
        return wxFindReplaceDialog_Create(wxobj, wxObject.SafePtr(родитель), wxObject.SafePtr(data), титул, cast(бцел)стиль);
    }

    //-----------------------------------------------------------------------------

    public FindReplaceData Data()
    {
        return cast(FindReplaceData)НайдиОбъект(wxFindReplaceDialog_GetData(wxobj), &FindReplaceData.Нов);
    }
    public проц Data(FindReplaceData значение)
    {
        wxFindReplaceDialog_SetData(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public проц Find_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND, ИД, значение, this);
    }
    public проц Find_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц FindNext_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_NEXT, ИД, значение, this);
    }
    public проц FindNext_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц FindReplace_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_REPLACE, ИД, значение, this);
    }
    public проц FindReplace_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц FindReplaceAll_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_REPLACE_ALL, ИД, значение, this);
    }
    public проц FindReplaceAll_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц FindClose_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_FIND_CLOSE, ИД, значение, this);
    }
    public проц FindClose_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxFindDialogEvent_ctor(цел типКоманды, цел ид);

static extern (C) цел    wxFindDialogEvent_GetFlags(ЦелУкз сам);
static extern (C) проц   wxFindDialogEvent_SetФлаги(ЦелУкз сам, цел флаги);

static extern (C) ЦелУкз wxFindDialogEvent_GetFindString(ЦелУкз сам);
static extern (C) проц   wxFindDialogEvent_SetFindString(ЦелУкз сам, ткст стр);

static extern (C) ЦелУкз wxFindDialogEvent_GetReplaceString(ЦелУкз сам);
static extern (C) проц   wxFindDialogEvent_SetReplaceString(ЦелУкз сам, ткст стр);

static extern (C) ЦелУкз wxFindDialogEvent_GetDialog(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias FindDialogEvent wxFindDialogEvent;
public class FindDialogEvent : СобытиеКоманда
{
    static this()
    {
        wxEVT_COMMAND_FIND = wxEvent_EVT_COMMAND_FIND();
        wxEVT_COMMAND_FIND_NEXT = wxEvent_EVT_COMMAND_FIND_NEXT();
        wxEVT_COMMAND_FIND_REPLACE = wxEvent_EVT_COMMAND_FIND_REPLACE();
        wxEVT_COMMAND_FIND_REPLACE_ALL = wxEvent_EVT_COMMAND_FIND_REPLACE_ALL();
        wxEVT_COMMAND_FIND_CLOSE = wxEvent_EVT_COMMAND_FIND_CLOSE();

        ДобавьТипСоб(wxEVT_COMMAND_FIND,	&FindDialogEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_FIND_NEXT,	&FindDialogEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_FIND_REPLACE,	&FindDialogEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_FIND_REPLACE_ALL,	&FindDialogEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_FIND_CLOSE,	&FindDialogEvent.Нов);

    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел типКоманды, цел ид)
    {
        super(wxFindDialogEvent_ctor(типКоманды, ид));
    }

    public static Событие Нов(ЦелУкз ptr)
    {
        return new FindDialogEvent(ptr);
    }

    //-----------------------------------------------------------------------------

    public цел Флаги()
    {
        return wxFindDialogEvent_GetFlags(wxobj);
    }
    public проц Флаги(цел значение)
    {
        wxFindDialogEvent_SetФлаги(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст FindString()
    {
        return cast(ткст) new wxString(wxFindDialogEvent_GetFindString(wxobj), да);
    }
    public проц FindString(ткст значение)
    {
        wxFindDialogEvent_SetFindString(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст ReplaceString()
    {
        return cast(ткст) new wxString(wxFindDialogEvent_GetReplaceString(wxobj), да);
    }
    public проц ReplaceString(ткст значение)
    {
        wxFindDialogEvent_SetReplaceString(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public FindReplaceDialog Dialog()
    {
        return cast(FindReplaceDialog)НайдиОбъект(wxFindDialogEvent_GetDialog(wxobj));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxFindReplaceData_ctor(бцел флаги);

static extern (C) ЦелУкз wxFindReplaceData_GetFindString(ЦелУкз сам);
static extern (C) проц   wxFindReplaceData_SetFindString(ЦелУкз сам, ткст стр);

static extern (C) цел    wxFindReplaceData_GetFlags(ЦелУкз сам);
static extern (C) проц   wxFindReplaceData_SetФлаги(ЦелУкз сам, цел флаги);

static extern (C) проц   wxFindReplaceData_SetReplaceString(ЦелУкз сам, ткст стр);
static extern (C) ЦелУкз wxFindReplaceData_GetReplaceString(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias FindReplaceData wxFindReplaceData;
public class FindReplaceData : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(0);
    }

    public this(цел флаги)
    {
        super(wxFindReplaceData_ctor(cast(бцел)флаги));
    }

    //-----------------------------------------------------------------------------

    public ткст FindString()
    {
        return cast(ткст) new wxString(wxFindReplaceData_GetFindString(wxobj), да);
    }
    public проц FindString(ткст значение)
    {
        wxFindReplaceData_SetFindString(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст ReplaceString()
    {
        return cast(ткст) new wxString(wxFindReplaceData_GetReplaceString(wxobj), да);
    }
    public проц ReplaceString(ткст значение)
    {
        wxFindReplaceData_SetReplaceString(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел Флаги()
    {
        return wxFindReplaceData_GetFlags(wxobj);
    }
    public проц Флаги(цел значение)
    {
        wxFindReplaceData_SetФлаги(wxobj, значение);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new FindReplaceData(ptr);
    }
}

