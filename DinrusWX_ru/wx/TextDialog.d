//-----------------------------------------------------------------------------
// wxD - TextDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TextDialog.cs
//
/// The wxTextEntryDialog wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TextDialog.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.TextDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
static extern (C) ЦелУкз wxTextEntryDialog_ctor(ЦелУкз родитель, ткст message, ткст caption, ткст значение, бцел стиль, inout Точка поз);
static extern (C) проц wxTextEntryDialog_dtor(ЦелУкз сам);
static extern (C) проц wxTextEntryDialog_SetValue(ЦелУкз сам, ткст val);
static extern (C) ЦелУкз wxTextEntryDialog_GetValue(ЦелУкз сам);
static extern (C) цел wxTextEntryDialog_ShowModal(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias TextEntryDialog wxTextEntryDialog;
public class TextEntryDialog : Dialog
{
    enum
    {
        wxTextEntryDialogStyle = (wxOK | wxCANCEL | wxCENTRE),
    }
    public const ткст wxGetTextFromUserPromptStr = "Input Text";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this(Окно родитель, ткст message=wxGetTextFromUserPromptStr, ткст caption="", ткст значение="", цел стиль=wxTextEntryDialogStyle, Точка поз=вхДефПоз)
    {
        this(wxTextEntryDialog_ctor(wxObject.SafePtr(родитель), message, caption, значение, cast(бцел)стиль, поз));
    }

    //-----------------------------------------------------------------------------

    public ткст Value()
    {
        return cast(ткст) new wxString(wxTextEntryDialog_GetValue(wxobj), да);
    }
    public проц Value(ткст значение)
    {
        wxTextEntryDialog_SetValue(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public override цел ShowModal()
    {
        return wxTextEntryDialog_ShowModal(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxGetPasswordFromUser_func(ткст message, ткст caption, ткст defaultValue, ЦелУкз родитель);
static extern (C) ЦелУкз wxGetTextFromUser_func(ткст message, ткст caption, ткст defaultValue, ЦелУкз родитель, цел x, цел y, бул centre);
//! \endcond

//-----------------------------------------------------------------------------

public ткст GetPasswordFromUser(ткст message, ткст caption=TextEntryDialog.wxGetTextFromUserPromptStr, ткст defaultValue="", Окно родитель=null)
{
    return cast(ткст) new wxString(wxGetPasswordFromUser_func(message, caption, defaultValue, wxObject.SafePtr(родитель)), да);
}

//-----------------------------------------------------------------------------

public ткст GetTextFromUser(ткст message, ткст caption=TextEntryDialog.wxGetTextFromUserPromptStr, ткст defaultValue="", Окно родитель=null, цел x=-1, цел y=-1, бул centre=да)
{
    return cast(ткст) new wxString(wxGetTextFromUser_func(message, caption, defaultValue, wxObject.SafePtr(родитель), x, y, centre), да);
}
