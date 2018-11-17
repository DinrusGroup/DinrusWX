//-----------------------------------------------------------------------------
// wxD - ChoiceDialog.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ChoiceDialog.cs
//
/// The wxChoiceDialog wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ChoiceDialog.d,v 1.11 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.ChoiceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ClientData;
public import wx.ArrayInt;

//! \cond EXTERN
static extern (C) ЦелУкз wxSingleChoiceDialog_ctor(ЦелУкз родитель, ткст message, ткст caption, цел n, ткст* choices, ЦелУкз clientData, бцел стиль, inout Точка поз);
static extern (C) проц wxSingleChoiceDialog_SetSelection(ЦелУкз сам, цел sel);
static extern (C) цел wxSingleChoiceDialog_GetSelection(ЦелУкз сам);
static extern (C) ЦелУкз wxSingleChoiceDialog_GetStringSelection(ЦелУкз сам);
static extern (C) ЦелУкз wxSingleChoiceDialog_GetSelectionClientData(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias SingleChoiceDialog wxSingleChoiceDialog;
public class SingleChoiceDialog : Dialog
{
    enum
    {
        wxCHOICEDLG_STYLE	= (wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER | wxOK | wxCANCEL | wxCENTRE)
    }
    public const цел wxCHOICE_HEIGHT = 150;
    public const цел wxCHOICE_WIDTH  = 200;


    // TODO: ClientData... !?!

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this(Окно родитель, ткст message, ткст caption, ткст[] choices, ClientData clientData = null, цел стиль =  wxCHOICEDLG_STYLE, Точка поз = вхДефПоз)
    {
        super(wxSingleChoiceDialog_ctor(wxObject.SafePtr(родитель), message, caption, choices.length, choices.ptr, wxObject.SafePtr(clientData), стиль, поз));
    }

    //-----------------------------------------------------------------------------

    public проц Selection(цел sel)
    {
        wxSingleChoiceDialog_SetSelection(wxobj, sel);
    }

    //-----------------------------------------------------------------------------

    public цел Selection()
    {
        return wxSingleChoiceDialog_GetSelection(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст StringSelection()
    {
        return cast(ткст) new wxString(wxSingleChoiceDialog_GetStringSelection(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ClientData SelectionClientData()
    {
        return cast(ClientData)НайдиОбъект(wxSingleChoiceDialog_GetSelectionClientData(wxobj));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxMultiChoiceDialog_ctor(ЦелУкз родитель, ткст message, ткст caption, цел n, ткст* choices, бцел стиль, inout Точка поз);
static extern (C) проц wxMultiChoiceDialog_SetSelections(ЦелУкз сам, цел* sel, цел numsel);
static extern (C) ЦелУкз wxMultiChoiceDialog_GetSelections(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias MultiChoiceDialog wxMultiChoiceDialog;
public class MultiChoiceDialog : Dialog
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this(Окно родитель, ткст message, ткст caption, ткст[] choices, цел стиль = SingleChoiceDialog.wxCHOICEDLG_STYLE, Точка поз = вхДефПоз)
    {
        super(wxMultiChoiceDialog_ctor(wxObject.SafePtr(родитель), message, caption, choices.length, choices.ptr, стиль, поз));
    }

    //-----------------------------------------------------------------------------

    public проц УстSelections(цел[] sel)
    {
        wxMultiChoiceDialog_SetSelections(wxobj, sel.ptr, sel.length);
    }

    //-----------------------------------------------------------------------------

    public цел[] GetSelections()
    {
        return (new ЦелМассив(wxMultiChoiceDialog_GetSelections(wxobj), да)).вМассив();
    }

}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxGetSingleChoice_func(ткст message, ткст caption, цел n, ткст* choices, ЦелУкз родитель, цел x, цел y, бул centre, цел ширь, цел высь);
static extern (C) цел wxGetSingleChoiceIndex_func(ткст message, ткст caption, цел n, ткст* choices, ЦелУкз родитель, цел x, цел y, бул centre, цел ширь, цел высь);
static extern (C) проц* wxGetSingleChoiceData_func(ткст message, ткст caption, цел n, ткст* choices, проц **client_data, ЦелУкз родитель, цел x, цел y, бул centre, цел ширь, цел высь);
static extern (C) бцел wxGetMultipleChoices_func(ЦелУкз selections,ткст message, ткст caption, цел n, ткст* choices, ЦелУкз родитель, цел x, цел y, бул centre, цел ширь, цел высь);
//! \endcond

public ткст GetSingleChoice(ткст message, ткст caption, ткст[] choices, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT)
{
    return cast(ткст) new wxString(wxGetSingleChoice_func(message, caption, choices.length, choices.ptr, wxObject.SafePtr(родитель), x, y, centre, ширь, высь), да);
}

public цел GetSingleChoiceIndex(ткст message, ткст caption, ткст[] choices, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT)
{
    return wxGetSingleChoiceIndex_func(message, caption, choices.length, choices.ptr, wxObject.SafePtr(родитель), x, y, centre, ширь, высь);
}

public проц* GetSingleChoiceData(ткст message, ткст caption, ткст[] choices, проц **client_data, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT)
{
    return wxGetSingleChoiceData_func(message, caption, choices.length, choices.ptr, client_data, wxObject.SafePtr(родитель), x, y, centre, ширь, высь);
}

public цел[] GetMultipleChoices(ткст message, ткст caption, ткст[] choices, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT)
{
    ЦелМассив ari = new ЦелМассив();
    бцел рм = wxGetMultipleChoices_func(wxObject.SafePtr(ari), message, caption, choices.length, choices.ptr, wxObject.SafePtr(родитель), x, y, centre, ширь, высь);
    return ari.вМассив();
}
