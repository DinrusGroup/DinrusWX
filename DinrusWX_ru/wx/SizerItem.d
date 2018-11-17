//-----------------------------------------------------------------------------
// wxD - SizerItem.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SizerItem.cs
//
/// The wxSizerItem wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SizerItem.d,v 1.8 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SizerItem;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxSizerItem_ctorSpace(цел ширь, цел высь, цел proportion, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) ЦелУкз wxSizerItem_ctorWindow(ЦелУкз окно, цел proportion, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) ЦелУкз wxSizerItem_ctorSizer(ЦелУкз сайзер, цел proportion, цел flag, цел бордюр, ЦелУкз userData);
static extern (C) ЦелУкз wxSizerItem_ctor();
static extern (C) проц   wxSizerItem_DeleteWindows(ЦелУкз сам);
static extern (C) проц   wxSizerItem_DetachSizer(ЦелУкз сам);
static extern (C) проц   wxSizerItem_GetSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxSizerItem_CalcMin(ЦелУкз сам, inout Размер min);
static extern (C) проц   wxSizerItem_SetDimension(ЦелУкз сам, inout Точка поз, inout Размер Размер);
static extern (C) проц   wxSizerItem_GetMinSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxSizerItem_SetInitSize(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxSizerItem_SetRatio(ЦелУкз сам, цел ширь, цел высь);
static extern (C) проц   wxSizerItem_SetRatioFloat(ЦелУкз сам, float ratio);
static extern (C) float  wxSizerItem_GetRatioFloat(ЦелУкз сам);
static extern (C) бул   wxSizerItem_IsWindow(ЦелУкз сам);
static extern (C) бул   wxSizerItem_IsSizer(ЦелУкз сам);
static extern (C) бул   wxSizerItem_IsSpacer(ЦелУкз сам);
static extern (C) проц   wxSizerItem_SetProportion(ЦелУкз сам, цел proportion);
static extern (C) цел    wxSizerItem_GetProportion(ЦелУкз сам);
static extern (C) проц   wxSizerItem_SetFlag(ЦелУкз сам, цел flag);
static extern (C) цел    wxSizerItem_GetFlag(ЦелУкз сам);
static extern (C) проц   wxSizerItem_SetBorder(ЦелУкз сам, цел бордюр);
static extern (C) цел    wxSizerItem_GetBorder(ЦелУкз сам);
static extern (C) ЦелУкз wxSizerItem_GetWindow(ЦелУкз сам);
static extern (C) проц   wxSizerItem_SetWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) ЦелУкз wxSizerItem_GetSizer(ЦелУкз сам);
static extern (C) проц   wxSizerItem_SetSizer(ЦелУкз сам, ЦелУкз сайзер);
static extern (C) проц   wxSizerItem_GetSpacer(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxSizerItem_SetSpacer(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxSizerItem_Show(ЦелУкз сам, бул покажи);
static extern (C) бул   wxSizerItem_IsShown(ЦелУкз сам);
static extern (C) ЦелУкз wxSizerItem_GetUserData(ЦелУкз сам);
static extern (C) проц   wxSizerItem_GetPosition(ЦелУкз сам, inout Точка поз);
//! \endcond

//-----------------------------------------------------------------------------

alias SizerItem wxSizerItem;
public class SizerItem : wxObject
{
    public this(цел ширь, цел высь, цел proportion, цел flag, цел бордюр, wxObject userData)
    {
        this(wxSizerItem_ctorSpace(ширь, высь, proportion, flag, бордюр, wxObject.SafePtr(userData)));
    }

    public this(Окно окно, цел proportion, цел flag, цел бордюр, wxObject userData)
    {
        this(wxSizerItem_ctorWindow(wxObject.SafePtr(окно), proportion, flag, бордюр, wxObject.SafePtr(userData)));
    }

    public this(Сайзер сайзер, цел proportion, цел flag, цел бордюр, wxObject userData)
    {
        this(wxSizerItem_ctorSizer(wxObject.SafePtr(сайзер), proportion, flag, бордюр, wxObject.SafePtr(userData)));
    }

    public this()
    {
        this(wxSizerItem_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц DeleteWindows()
    {
        wxSizerItem_DeleteWindows(wxobj);
    }

    public проц DetachSizer()
    {
        wxSizerItem_DetachSizer(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Размер размер()
    {
        Размер размер;
        wxSizerItem_GetSize(wxobj, размер);
        return размер;
    }

    //-----------------------------------------------------------------------------

    public Размер вычислиМин()
    {
        Размер min;
        wxSizerItem_CalcMin(wxobj, min);
        return min;
    }

    //-----------------------------------------------------------------------------

    public проц УстDimension(Точка поз, Размер размер)
    {
        wxSizerItem_SetDimension(wxobj, поз, размер);
    }

    //-----------------------------------------------------------------------------

    public Размер МинРазм()
    {
        Размер размер;
        wxSizerItem_GetMinSize(wxobj, размер);
        return размер;
    }

    //-----------------------------------------------------------------------------

    public проц УстInitSize(цел x, цел y)
    {
        wxSizerItem_SetInitSize(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public проц УстRatio(Размер размер)
    {
        УстRatio(размер.Ширь, размер.Высь);
    }

    public проц УстRatio(цел ширь, цел высь)
    {
        wxSizerItem_SetRatio(wxobj, ширь, высь);
    }

    public проц Ratio(float значение)
    {
        wxSizerItem_SetRatioFloat(wxobj, значение);
    }
    public float Ratio()
    {
        return wxSizerItem_GetRatioFloat(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул IsWindow()
    {
        return wxSizerItem_IsWindow(wxobj);
    }

    public бул IsSizer()
    {
        return wxSizerItem_IsSizer(wxobj);
    }

    public бул IsSpacer()
    {
        return wxSizerItem_IsSpacer(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Proportion(цел значение)
    {
        wxSizerItem_SetProportion(wxobj, значение);
    }
    public цел Proportion()
    {
        return wxSizerItem_GetProportion(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Flag(цел значение)
    {
        wxSizerItem_SetFlag(wxobj, значение);
    }
    public цел Flag()
    {
        return wxSizerItem_GetFlag(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц ПБордюр(цел значение)
    {
        wxSizerItem_SetBorder(wxobj, значение);
    }
    public цел ПБордюр()
    {
        return wxSizerItem_GetBorder(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Окно окно()
    {
        return cast(Окно)НайдиОбъект(wxSizerItem_GetWindow(wxobj));
    }
    public проц окно(Окно значение)
    {
        wxSizerItem_SetWindow(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public Сайзер сайзер()
    {
        return cast(Сайзер)НайдиОбъект(wxSizerItem_GetSizer(wxobj));
    }
    public проц сайзер(Сайзер значение)
    {
        wxSizerItem_SetSizer(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public Размер Spacer()
    {
        Размер spacer;
        wxSizerItem_GetSpacer(wxobj, spacer);
        return spacer;
    }
    public проц Spacer(Размер значение)
    {
        wxSizerItem_SetSpacer(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Покажи(бул покажи)
    {
        wxSizerItem_Show(wxobj, покажи);
    }

    public бул Виден()
    {
        return wxSizerItem_IsShown(wxobj);
    }

    //-----------------------------------------------------------------------------

    public wxObject UserData()
    {
        return НайдиОбъект(wxSizerItem_GetUserData(wxobj));
    }

    //-----------------------------------------------------------------------------

    public Точка Позиция()
    {
        Точка поз;
        wxSizerItem_GetPosition(wxobj, поз);
        return поз;
    }
}

