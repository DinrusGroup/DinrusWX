//-----------------------------------------------------------------------------
// wxD - FontDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Fontdlg.cs
//
/// The wxFontDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FontDialog.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.FontDialog;
public import wx.common;
public import wx.Dialog;
public import wx.Font;
public import wx.GdiCommon; //for nullobject

//! \cond EXTERN
static extern (C) ЦелУкз wxFontData_ctor();
static extern (C) проц   wxFontData_dtor(ЦелУкз сам);

static extern (C) проц   wxFontData_SetAllowSymbols(ЦелУкз сам, бул flag);
static extern (C) бул   wxFontData_GetAllowSymbols(ЦелУкз сам);

static extern (C) проц   wxFontData_SetColour(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxFontData_GetColour(ЦелУкз сам);

static extern (C) проц   wxFontData_SetShowHelp(ЦелУкз сам, бул flag);
static extern (C) бул   wxFontData_GetShowHelp(ЦелУкз сам);

static extern (C) проц   wxFontData_EnableEffects(ЦелУкз сам, бул flag);
static extern (C) бул   wxFontData_GetEnableEffects(ЦелУкз сам);

static extern (C) проц   wxFontData_SetInitialFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxFontData_GetInitialFont(ЦелУкз сам);

static extern (C) проц   wxFontData_SetChosenFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) ЦелУкз wxFontData_GetChosenFont(ЦелУкз сам);

static extern (C) проц   wxFontData_SetRange(ЦелУкз сам, цел minRange, цел maxRange);
//! \endcond

//---------------------------------------------------------------------

alias FontData wxFontData;
public class FontData : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxFontData_ctor());
    }

    //---------------------------------------------------------------------

    public бул AllowSymbols()
    {
        return wxFontData_GetAllowSymbols(wxobj);
    }
    public проц AllowSymbols(бул значение)
    {
        wxFontData_SetAllowSymbols(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул EffectsEnabled()
    {
        return wxFontData_GetEnableEffects(wxobj);
    }
    public проц EffectsEnabled(бул значение)
    {
        wxFontData_EnableEffects(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул ShowHelp()
    {
        return wxFontData_GetShowHelp(wxobj);
    }
    public проц ShowHelp(бул значение)
    {
        wxFontData_SetShowHelp(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Цвет цвет()
    {
        return new Цвет(wxFontData_GetColour(wxobj), да);
    }
    public проц цвет(Цвет значение)
    {
        wxFontData_SetColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Шрифт InitialFont()
    {
        return new Шрифт(wxFontData_GetInitialFont(wxobj));
    }
    public проц InitialFont(Шрифт значение)
    {
        wxFontData_SetInitialFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Шрифт ChosenFont()
    {
        return new Шрифт(wxFontData_GetChosenFont(wxobj));
    }
    public проц ChosenFont(Шрифт значение)
    {
        wxFontData_SetChosenFont(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public проц УстRange(цел min, цел max)
    {
        wxFontData_SetRange(wxobj, min, max);
    }

    //---------------------------------------------------------------------
    public static wxObject Нов(ЦелУкз ptr)
    {
        return new FontData(ptr);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxFontDialog_ctor();
static extern (C) бул   wxFontDialog_Create(ЦелУкз сам, ЦелУкз родитель, ЦелУкз data);
static extern (C) проц   wxFontDialog_dtor(ЦелУкз сам);

static extern (C) цел    wxFontDialog_ShowModal(ЦелУкз сам);
static extern (C) ЦелУкз wxFontDialog_GetFontData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias FontDialog wxFontDialog;
public class FontDialog : Dialog
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxFontDialog_ctor());
    }

    public this(Окно родитель)
    {
        this(родитель, null);
    }

    public this(Окно родитель, FontData data)
    {
        this();
        if (!создай(родитель, data))
        {
            throw new InvalidOperationException("Не удалось создать FontDialog");
        }
    }

    public бул создай(Окно родитель, FontData data)
    {
        return wxFontDialog_Create(wxobj, wxObject.SafePtr(родитель), wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public FontData fontData()
    {
        return cast(FontData)НайдиОбъект(wxFontDialog_GetFontData(wxobj), &FontData.Нов);
    }

    //---------------------------------------------------------------------

    public override цел ShowModal()
    {
        return wxFontDialog_ShowModal(wxobj);
    }

    //---------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ЦелУкз wxGetFontFromUser_func(ЦелУкз родитель, ЦелУкз fontInit);
//! \endcond

Шрифт GetFontFromUser(Окно родитель,Шрифт fontInit=null)
{
    return new Шрифт(wxGetFontFromUser_func(wxObject.SafePtr(родитель),wxObject.SafePtr(fontInit)));
}
