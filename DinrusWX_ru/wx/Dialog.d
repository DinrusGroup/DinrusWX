//-----------------------------------------------------------------------------
// wxD - Dialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Dialog.cs
//
/// The wxDialog wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Dialog.d,v 1.11 2007/04/19 19:45:26 afb Exp $
//-----------------------------------------------------------------------------

module wx.Dialog;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxDialog_ctor();
static extern (C) проц   wxDialog_dtor(ЦелУкз сам);

static extern (C) проц   wxDialog_SetReturnCode(ЦелУкз сам, цел returnCode);
static extern (C) цел    wxDialog_GetReturnCode(ЦелУкз сам);

static extern (C) ЦелУкз wxDialog_GetTitle(ЦелУкз сам);
static extern (C) проц   wxDialog_SetTitle(ЦелУкз сам, ткст титул);

static extern (C) бул   wxDialog_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);

static extern (C) проц   wxDialog_EndModal(ЦелУкз сам, цел retCode);

static extern (C) бул   wxDialog_IsModal(ЦелУкз сам);
//static extern (C) проц   wxDialog_SetModal(ЦелУкз сам, бул modal);

static extern (C) проц   wxDialog_SetIcon(ЦелУкз сам, ЦелУкз пиктограмма);
static extern (C) проц   wxDialog_SetIcons(ЦелУкз сам, ЦелУкз icons);

static extern (C) цел    wxDialog_ShowModal(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Dialog wxDialog;
/// A dialog box is a окно with a титул bar and sometimes a
/// system меню, which can be moved around the screen. It can contain
/// controls and other windows and is usually used to allow the user
/// to make some choice or to answer a question.
public class Dialog : Окно
{
    enum
    {
        wxCENTER		= 0x00000001,
        wxCENTRE		= 0x00000001,
        wxYES			= 0x00000002,
        wxOK			= 0x00000004,
        wxNO			= 0x00000008,
        wxCANCEL		= 0x00000010,
        wxYES_NO		= (wxYES | wxNO),

        wxYES_DEFAULT		= 0x00000000,
        wxNO_DEFAULT		= 0x00000080,

        wxICON_EXCLAMATION 	= 0x00000100,
        wxICON_HAND		= 0x00000200,
        wxICON_WARNING	= wxICON_EXCLAMATION,
        wxICON_ERROR		= wxICON_HAND,
        wxICON_QUESTION	= 0x00000400,
        wxICON_INFORMATION	= 0x00000800,
        wxICON_STOP		= wxICON_HAND,
        wxICON_ASTERISK	= wxICON_INFORMATION,
        wxICON_MASK		= (0x00000100|0x00000200|0x00000400|0x00000800),

        wxFORWARD		= 0x00001000,
        wxBACKWARD		= 0x00002000,
        wxRESET		= 0x00004000,
        wxHELP		= 0x00008000,
        wxMORE 		= 0x00010000,
        wxSETUP		= 0x00020000,
    }

    //---------------------------------------------------------------------
    const ткст wxDialogNameStr="dialog";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxDialog_ctor());
    }

    public this(Окно родитель, цел ид, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_DIALOG_STYLE, ткст имя=wxDialogNameStr)
    {
        super(wxDialog_ctor());
        if (!создай(родитель, ид, титул, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать Dialog");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_DIALOG_STYLE, ткст имя=wxDialogNameStr)
    {
        this(родитель, Окно.УникИД, титул, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно окно, цел ид, ткст титул, inout Точка поз,
                       inout Размер Размер, цел стиль, ткст имя)
    {
        return wxDialog_Create(wxobj, wxObject.SafePtr(окно), ид, титул,
                               поз, Размер, cast(бцел)стиль, имя);
    }

    //---------------------------------------------------------------------

    public цел ReturnCode()
    {
        return wxDialog_GetReturnCode(wxobj);
    }
    public проц ReturnCode(цел значение)
    {
        wxDialog_SetReturnCode(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public override ткст Титул()
    {
        return cast(ткст) new wxString(wxDialog_GetTitle(wxobj), да);
    }
    public override проц Титул(ткст значение)
    {
        wxDialog_SetTitle(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц EndModal(цел retCode)
    {
        wxDialog_EndModal(wxobj, cast(цел)retCode);
    }

    //---------------------------------------------------------------------

    public проц УстIcon(Пиктограмма пиктограмма)
    {
        wxDialog_SetIcon(wxobj, wxObject.SafePtr(пиктограмма));
    }

    /*public проц УстIcons(IconBundle icons)
    {
    	wxDialog_SetIcons(wxobj, wxObject.SafePtr(icons);
    }*/

    //---------------------------------------------------------------------

    public  цел ShowModal()
    {
        return wxDialog_ShowModal(wxobj);
    }

    //---------------------------------------------------------------------

    //deprecated public проц Modal(бул значение) { wxDialog_SetModal(wxobj, значение); }
    public бул Modal()
    {
        return wxDialog_IsModal(wxobj);
    }
}
