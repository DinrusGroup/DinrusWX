//-----------------------------------------------------------------------------
// wxD - DirDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DirDialog.cs
//
/// The wxDirDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DirDialog.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.DirDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
static extern (C) ЦелУкз wxDirDialog_ctor(ЦелУкз родитель, ткст message, ткст defaultPath, бцел стиль, inout Точка поз, inout Размер Размер, ткст имя);

static extern (C) проц   wxDirDialog_SetPath(ЦелУкз сам, ткст path);
static extern (C) ЦелУкз wxDirDialog_GetPath(ЦелУкз сам);

static extern (C) цел    wxDirDialog_GetStyle(ЦелУкз сам);
static extern (C) проц   wxDirDialog_SetStyle(ЦелУкз сам, цел стиль);

static extern (C) проц   wxDirDialog_SetMessage(ЦелУкз сам, ткст message);
static extern (C) ЦелУкз wxDirDialog_GetMessage(ЦелУкз сам);

static extern (C) цел    wxDirDialog_ShowModal(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias DirDialog wxDirDialog;
public class DirDialog : Dialog
{
    enum {  wxDD_NEW_DIR_BUTTON  = 0x0080 }
    enum {  wxDD_DEFAULT_STYLE = (wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER | wxDD_NEW_DIR_BUTTON) }

    public const ткст wxDirSelectorPromptStr = "Выберите папку";
    public const ткст wxDirDialogNameStr = "DirDialog";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, ткст титул = wxDirSelectorPromptStr, ткст defaultPath = "", цел стиль = wxDD_DEFAULT_STYLE, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, ткст имя = wxDirDialogNameStr)
    {
        this(wxDirDialog_ctor(wxObject.SafePtr(родитель), титул, defaultPath, стиль, поз, Размер, имя));
    }

    //-----------------------------------------------------------------------------

    public проц Path(ткст значение)
    {
        wxDirDialog_SetPath(wxobj, значение);
    }
    public ткст Path()
    {
        return cast(ткст) new wxString(wxDirDialog_GetPath(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public проц Message(ткст значение)
    {
        wxDirDialog_SetMessage(wxobj, значение);
    }
    public ткст Message()
    {
        return cast(ткст) new wxString(wxDirDialog_GetMessage(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public override цел ShowModal()
    {
        return wxDirDialog_ShowModal(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Стиль(цел значение)
    {
        wxDirDialog_SetStyle(wxobj, значение);
    }
    public цел Стиль()
    {
        return wxDirDialog_GetStyle(wxobj);
    }

    //-----------------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ткст wxDirSelector_func(ткст message,
                                     ткст defaultPath,
                                     цел стиль,
                                     inout Точка поз,
                                     ЦелУкз родитель);
//! \endcond

ткст DirSelector(ткст message = null,
                   ткст defaultPath = null,
                   цел стиль = DirDialog.wxDD_DEFAULT_STYLE,
                   Точка поз = Dialog.вхДефПоз,
                   Окно родитель = null)
{
    return wxDirSelector_func(message,defaultPath,стиль,поз,wxObject.SafePtr(родитель));
}
