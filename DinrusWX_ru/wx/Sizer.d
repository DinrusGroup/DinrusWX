//-----------------------------------------------------------------------------
// wxD - Сайзер.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Сайзер.cs
//
/// The wxSizer wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Сайзер.d,v 1.10 2007/08/20 08:38:46 afb Exp $
//-----------------------------------------------------------------------------

module wx.Sizer;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
static extern (C) проц wxSizer_AddWindow(ЦелУкз сам, ЦелУкз окно, цел proportion, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) проц wxSizer_AddSizer(ЦелУкз сам, ЦелУкз сайзер, цел proportion, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) проц wxSizer_Add(ЦелУкз сам, цел ширь, цел высь, цел proportion, цел flag, цел бордюр, ЦелУкз userData);

static extern (C) проц wxSizer_Fit(ЦелУкз сам, ЦелУкз окно, inout Размер Размер);
static extern (C) проц wxSizer_FitInside(ЦелУкз сам, ЦелУкз окно);
static extern (C) проц wxSizer_Layout(ЦелУкз сам);

static extern (C) проц wxSizer_InsertWindow(ЦелУкз сам, цел before, ЦелУкз окно, цел option, бцел flag, цел бордюр, ЦелУкз userData);
static extern (C) проц wxSizer_InsertSizer(ЦелУкз сам, цел before, ЦелУкз сайзер, цел option, бцел flag, цел бордюр, ЦелУкз userData);
static extern (C) проц wxSizer_Insert(ЦелУкз сам, цел before, цел ширь, цел высь, цел option, бцел flag, цел бордюр, ЦелУкз userData);

static extern (C) проц wxSizer_PrependWindow(ЦелУкз сам, ЦелУкз окно, цел option, бцел flag, цел бордюр, ЦелУкз userData);
static extern (C) проц wxSizer_PrependSizer(ЦелУкз сам, ЦелУкз сайзер, цел option, бцел flag, цел бордюр, ЦелУкз userData);
static extern (C) проц wxSizer_Prepend(ЦелУкз сам, цел ширь, цел высь, цел option, бцел flag, цел бордюр, ЦелУкз userData);

//static extern (C) бул wxSizer_RemoveWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) бул wxSizer_RemoveSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) бул wxSizer_Remove(ЦелУкз сам, цел поз);

static extern (C) проц wxSizer_Clear(ЦелУкз сам, бул delete_windows);
static extern (C) проц wxSizer_DeleteWindows(ЦелУкз сам);

static extern (C) проц wxSizer_SetMinSize(ЦелУкз сам, inout Размер Размер);

static extern (C) бул wxSizer_SetItemMinSizeWindow(ЦелУкз сам, ЦелУкз окно, inout Размер Размер);
static extern (C) бул wxSizer_SetItemMinSizeSizer(ЦелУкз сам, ЦелУкз сайзер, inout Размер Размер);
static extern (C) бул wxSizer_SetItemMinSize(ЦелУкз сам, цел поз, inout Размер Размер);

static extern (C) проц wxSizer_GetSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц wxSizer_GetPosition(ЦелУкз сам, out Точка тчк);
static extern (C) проц wxSizer_GetMinSize(ЦелУкз сам, out Размер Размер);

static extern (C) проц wxSizer_RecalcSizes(ЦелУкз сам);
static extern (C) проц wxSizer_CalcMin(ЦелУкз сам, out Размер Размер);

static extern (C) проц wxSizer_SetSizeHints(ЦелУкз сам, ЦелУкз окно);
static extern (C) проц wxSizer_SetVirtualSizeHints(ЦелУкз сам, ЦелУкз окно);
static extern (C) проц wxSizer_SetDimension(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);

static extern (C) проц wxSizer_ShowWindow(ЦелУкз сам, ЦелУкз окно, бул покажи);
static extern (C) проц wxSizer_HideWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) проц wxSizer_ShowSizer(ЦелУкз сам, ЦелУкз сайзер, бул покажи);
static extern (C) проц wxSizer_HideSizer(ЦелУкз сам, ЦелУкз сайзер);

static extern (C) бул wxSizer_IsShownWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) бул wxSizer_IsShownSizer(ЦелУкз сам, ЦелУкз сайзер);

static extern (C) бул wxSizer_DetachWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) бул wxSizer_DetachSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) бул wxSizer_Detach(ЦелУкз сам, цел index);
//! \endcond

//---------------------------------------------------------------------

public abstract class Сайзер : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Добавь(Окно окно, цел proportion=0, цел flag=0, цел бордюр=0, wxObject userData=null)
    {
        wxSizer_AddWindow(wxobj, wxObject.SafePtr(окно), proportion, flag,
                          бордюр, wxObject.SafePtr(userData));
    }

    public проц Добавь(Сайзер сайзер, цел proportion=0, цел flag=0, цел бордюр=0, wxObject userData=null)
    {
        wxSizer_AddSizer(wxobj, wxObject.SafePtr(сайзер), proportion, cast(цел)flag,
                         бордюр, wxObject.SafePtr(userData));
    }

    public проц Добавь(цел ширь, цел высь, цел proportion=0, цел flag=0, цел бордюр=0, wxObject userData=null)
    {
        wxSizer_Add(wxobj, ширь, высь, proportion, cast(цел)flag, бордюр,
                    wxObject.SafePtr(userData));
    }

    //---------------------------------------------------------------------

    public проц AddSpacer(цел размер)
    {
        Добавь(размер, размер, 0);
    }

    public проц AddStretchSpacer(цел proportion = 1)
    {
        Добавь(0, 0, proportion);
    }

    //---------------------------------------------------------------------

    public wx.common.Размер Встрой(Окно окно)
    {
        Размер размер;
        wxSizer_Fit(wxobj, wxObject.SafePtr(окно), размер);
        return размер;
    }

    public проц ВстройВнутрь(Окно окно)
    {
        wxSizer_FitInside(wxobj, wxObject.SafePtr(окно));
    }

    public проц Раскладка()
    {
        wxSizer_Layout(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Insert(бцел index, Окно окно, цел proportion=0, цел flag=0,
                       цел бордюр=0, wxObject userData=null)
    {
        wxSizer_InsertWindow(wxobj, index, wxObject.SafePtr(окно),
                             proportion, flag, бордюр,
                             wxObject.SafePtr(userData));
    }

    public проц Insert(бцел index, Сайзер сайзер, цел proportion=0, цел flag=0,
                       цел бордюр=0, wxObject userData=null)
    {
        wxSizer_InsertSizer(wxobj, index, wxObject.SafePtr(сайзер),
                            proportion, flag, бордюр,
                            wxObject.SafePtr(userData));
    }

    public проц Insert(бцел index, цел ширь, цел высь, цел proportion=0,
                       цел flag=0, цел бордюр=0, wxObject userData=null)
    {
        wxSizer_Insert(wxobj, index, ширь, высь, proportion, flag,
                       бордюр, wxObject.SafePtr(userData));
    }

    //---------------------------------------------------------------------

    public проц Prepend(Окно окно, цел proportion=0, цел flag=0, цел бордюр=0,
                        wxObject userData=null)
    {
        wxSizer_PrependWindow(wxobj, wxObject.SafePtr(окно), proportion,
                              flag, бордюр, wxObject.SafePtr(userData));
    }

    public проц Prepend(Сайзер сайзер, цел proportion=0, цел flag=0, цел бордюр=0,
                        wxObject userData=null)
    {
        wxSizer_PrependSizer(wxobj, wxObject.SafePtr(сайзер), proportion,
                             flag, бордюр, wxObject.SafePtr(userData));
    }

    public проц Prepend(цел ширь, цел высь, цел proportion=0, цел flag=0,
                        цел бордюр=0, wxObject userData=null)
    {
        wxSizer_Prepend(wxobj, ширь, высь, proportion,
                        flag, бордюр, wxObject.SafePtr(userData));
    }

    //---------------------------------------------------------------------

    public проц PrependSpacer(цел Размер)
    {
        Prepend(Размер, Размер, 0);
    }

    public проц PrependStretchSpacer(цел proportion = 1)
    {
        Prepend(0, 0, proportion);
    }

    //---------------------------------------------------------------------
    /+
    public бул Удали(Окно окно)
    {
        return wxSizer_RemoveWindow(wxobj, wxObject.SafePtr(окно));
    }
    +/
    public бул Удали(Сайзер сайзер)
    {
        return wxSizer_RemoveSizer(wxobj, wxObject.SafePtr(сайзер));
    }

    public бул Удали(цел поз)
    {
        return wxSizer_Remove(wxobj, поз);
    }

    //---------------------------------------------------------------------

    public проц УстМинРазм(Размер размер)
    {
        wxSizer_SetMinSize(wxobj, размер);
    }

    //---------------------------------------------------------------------

    public бул УстItemMinSize(Окно окно, Размер размер)
    {
        return wxSizer_SetItemMinSizeWindow(wxobj, wxObject.SafePtr(окно),размер);
    }

    public бул УстItemMinSize(Сайзер сайзер, Размер размер)
    {
        return wxSizer_SetItemMinSizeSizer(wxobj, wxObject.SafePtr(сайзер),размер);
    }

    public бул УстItemMinSize(цел поз, Размер размер)
    {
        return wxSizer_SetItemMinSize(wxobj, поз, размер);
    }

    //---------------------------------------------------------------------

    public Размер размер()
    {
        Размер размер;
        wxSizer_GetSize(wxobj, размер);
        return размер;
    }

    public Точка Позиция()
    {
        Точка тчк;
        wxSizer_GetPosition(wxobj, тчк);
        return тчк;
    }

    public Размер МинРазм()
    {
        Размер размер;
        wxSizer_GetMinSize(wxobj, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    public  проц пересчётРазмеров()
    {
        wxSizer_RecalcSizes(wxobj);
    }

    //---------------------------------------------------------------------

    public  Размер вычислиМин()
    {
        Размер Размер;
        wxSizer_CalcMin(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public проц УстРазмПодсказ(Окно окно)
    {
        wxSizer_SetSizeHints(wxobj, wxObject.SafePtr(окно));
    }

    public проц УстВиртуалРазмПодсказ(Окно окно)
    {
        wxSizer_SetVirtualSizeHints(wxobj, wxObject.SafePtr(окно));
    }

    public проц УстDimension(цел x, цел y, цел ширь, цел высь)
    {
        wxSizer_SetDimension(wxobj, x, y, ширь, высь);
    }

    //---------------------------------------------------------------------

    public проц Покажи(Окно окно, бул покажи)
    {
        wxSizer_ShowWindow(wxobj, wxObject.SafePtr(окно), покажи);
    }

    public проц Покажи(Сайзер сайзер, бул покажи)
    {
        wxSizer_ShowSizer(wxobj, wxObject.SafePtr(сайзер), покажи);
    }

    // Нов to wx.NET
    public проц Покажи(бул покажи)
    {
        Покажи(this, покажи);
    }


    //---------------------------------------------------------------------

    public проц очисть(бул delete_windows)
    {
        wxSizer_Clear(wxobj, delete_windows);
    }

    public проц DeleteWindows()
    {
        wxSizer_DeleteWindows(wxobj);
    }

    //---------------------------------------------------------------------

    public проц Спрячь(Окно окно)
    {
        wxSizer_HideWindow(wxobj, wxObject.SafePtr(окно));
    }

    public проц Спрячь(Сайзер сайзер)
    {
        wxSizer_HideSizer(wxobj, wxObject.SafePtr(сайзер));
    }

    //---------------------------------------------------------------------

    public бул Виден(Окно окно)
    {
        return wxSizer_IsShownWindow(wxobj, wxObject.SafePtr(окно));
    }

    public бул Виден(Сайзер сайзер)
    {
        return wxSizer_IsShownSizer(wxobj, wxObject.SafePtr(сайзер));
    }

    //---------------------------------------------------------------------

    public бул Detach(Окно окно)
    {
        return wxSizer_DetachWindow(wxobj, wxObject.SafePtr(окно));
    }

    public бул Detach(Сайзер сайзер)
    {
        return wxSizer_DetachSizer(wxobj, wxObject.SafePtr(сайзер));
    }

    public бул Detach(цел index)
    {
        return wxSizer_Detach(wxobj, index);
    }

    //---------------------------------------------------------------------
}
