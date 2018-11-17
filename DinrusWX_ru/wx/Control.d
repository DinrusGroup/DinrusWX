//-----------------------------------------------------------------------------
// wxD - Control.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Control.cs
//
/// The wxControl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Control.d,v 1.12 2007/04/19 19:45:26 afb Exp $
//-----------------------------------------------------------------------------

module wx.Control;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
static extern (C) проц   wxControl_Command(ЦелУкз сам, ЦелУкз evt);
static extern (C) ЦелУкз wxControl_GetLabel(ЦелУкз сам);
static extern (C) проц   wxControl_SetLabel(ЦелУкз сам, ткст ярлык);

static extern (C) цел wxControl_GetAlignment(ЦелУкз сам);
static extern (C) бул wxControl_SetFont(ЦелУкз сам, ЦелУкз шрифт);
//! \endcond

//---------------------------------------------------------------------

alias Control wxControl;
/// This is the base class for a control or "widget".
/// A control is generally a small окно which processes user input
/// and/or displays one or more элт of data.
public class Control : Окно
{
    const ткст wxControlNameStr = "control";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя=wxControlNameStr)
    {
        super(родитель, ид, поз, Размер, стиль, имя);
    }

    public this(Окно родитель, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя=wxControlNameStr)
    {
        super(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Control(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Команда() {}

    //---------------------------------------------------------------------

    public ткст Ярлык()
    {
        return cast(ткст) new wxString(wxControl_GetLabel(wxobj), да);
    }
    public проц Ярлык(ткст значение)
    {
        wxControl_SetLabel(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public цел GetAlignment()
    {
        return wxControl_GetAlignment(wxobj);
    }

    //---------------------------------------------------------------------

    public бул УстFont(Шрифт шрифт)
    {
        return wxControl_SetFont(wxobj, wxObject.SafePtr(шрифт));
    }
}

