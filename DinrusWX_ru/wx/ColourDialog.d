//-----------------------------------------------------------------------------
// wxD - ColourDialog.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ColourDialog.cs
//
/// The wxColourDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ColourDialog.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ColourDialog;
public import wx.common;
public import wx.Colour;
public import wx.Dialog;

//! \cond EXTERN
static extern (C) ЦелУкз wxColourData_ctor();

static extern (C) проц   wxColourData_SetChooseFull(ЦелУкз сам, бул flag);
static extern (C) бул   wxColourData_GetChooseFull(ЦелУкз сам);

static extern (C) проц   wxColourData_SetColour(ЦелУкз сам, ЦелУкз цвет);
static extern (C) ЦелУкз wxColourData_GetColour(ЦелУкз сам);

static extern (C) проц   wxColourData_SetCustomColour(ЦелУкз сам, цел i, ЦелУкз цвет);
static extern (C) ЦелУкз wxColourData_GetCustomColour(ЦелУкз сам, цел i);
//! \endcond

//---------------------------------------------------------------------

alias ColourData wxColourData;
public class ColourData : wxObject
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxColourData_ctor());
    }

    //---------------------------------------------------------------------

    public бул ChooseFull()
    {
        return wxColourData_GetChooseFull(wxobj);
    }
    public проц ChooseFull(бул значение)
    {
        wxColourData_SetChooseFull(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Цвет цвет()
    {
        return cast(Цвет)НайдиОбъект(wxColourData_GetColour(wxobj), &Цвет.Нов);
    }
    public проц цвет(Цвет значение)
    {
        wxColourData_SetColour(wxobj, wxObject.SafePtr(значение));
    }

    //---------------------------------------------------------------------

    public Цвет GetCustomColour(цел i)
    {
        return new Цвет(wxColourData_GetCustomColour(wxobj, i), да);
    }

    public проц УстCustomColour(цел i, Цвет цвет)
    {
        wxColourData_SetCustomColour(wxobj, i, wxObject.SafePtr(цвет));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ColourData(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxColourDialog_ctor();
static extern (C) бул   wxColourDialog_Create(ЦелУкз сам, ЦелУкз родитель, ЦелУкз data);
static extern (C) ЦелУкз wxColourDialog_GetColourData(ЦелУкз сам);
static extern (C) цел    wxColourDialog_ShowModal(ЦелУкз сам);

static extern (C) ЦелУкз wxColourDialog_GetColourFromUser(ЦелУкз родитель, ЦелУкз colInit);
//! \endcond

//---------------------------------------------------------------------

alias ColourDialog wxColourDialog;
public class ColourDialog : Dialog
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxColourDialog_ctor());
    }

    public this(Окно родитель, ColourData data = null)
    {
        super(wxColourDialog_ctor());
        if (!создай(родитель, data))
        {
            throw new InvalidOperationException("Не удалось создать ColourDialog");
        }
    }

    public бул создай(Окно родитель, ColourData data = null)
    {
        return wxColourDialog_Create(wxobj, wxObject.SafePtr(родитель),
                                     wxObject.SafePtr(data));
    }

    //---------------------------------------------------------------------

    public ColourData colourData()
    {
        return cast(ColourData)НайдиОбъект(wxColourDialog_GetColourData(wxobj), &ColourData.Нов);
    }

    //---------------------------------------------------------------------

    public override цел ShowModal()
    {
        return wxColourDialog_ShowModal(wxobj);
    }

    //---------------------------------------------------------------------

}

public static Цвет GetColourFromUser(Окно родитель=null, Цвет colInit=null)
{
    return new Цвет(wxColourDialog_GetColourFromUser(wxObject.SafePtr(родитель), wxObject.SafePtr(colInit)));
}
