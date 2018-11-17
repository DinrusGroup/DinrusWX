//-----------------------------------------------------------------------------
// wxD - Panel.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Panel.cs
//
/// The wxPanel wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Panel.d,v 1.10 2007/04/19 19:45:25 afb Exp $
//-----------------------------------------------------------------------------

module wx.Panel;
public import wx.common;
public import wx.Window;
public import wx.Button;

//! \cond EXTERN
static extern (C) ЦелУкз wxPanel_ctor();
static extern (C) ЦелУкз wxPanel_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) бул wxPanel_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц wxPanel_InitDialog(ЦелУкз сам);
static extern (C) ЦелУкз wxPanel_GetDefaultItem(ЦелУкз сам);
static extern (C) проц wxPanel_SetDefaultItem(ЦелУкз сам, ЦелУкз btn);
//! \endcond

alias Panel wxPanel;
/// A panel is a окно on which controls are placed. It is usually
/// placed within a frame. It contains minimal extra functionality over and
/// above its родитель class wxWindow; its main purpose is to be similar in
/// appearance and functionality to a dialog, but with the flexibility of
/// having any окно as a родитель.
public class Panel : Окно
{
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxPanel_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxTAB_TRAVERSAL|wxNO_BORDER, ткст имя = вхСтрИмяПанели)
    {
        super(wxPanel_ctor2(wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя));
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxTAB_TRAVERSAL|wxNO_BORDER, ткст имя=вхСтрИмяПанели)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxPanel_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public Кнопка DefaultItem()
    {
        ЦелУкз btn = wxPanel_GetDefaultItem(wxobj);
        return (btn != ЦелУкз.init) ? new Кнопка(btn) : null;
    }
    public проц DefaultItem(Кнопка значение)
    {
        wxPanel_SetDefaultItem(wxobj, значение.wxobj);
    }

    //---------------------------------------------------------------------

    public override проц ИницДиалог()
    {
        wxPanel_InitDialog(wxobj);
    }

    //---------------------------------------------------------------------
}
