//-----------------------------------------------------------------------------
// wxD - MenuBar.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MenuBar.cs
//
/// The wxMenuBar wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MenuBar.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.MenuBar;
public import wx.common;
public import wx.EvtHandler;
public import wx.Menu;

//! \cond EXTERN
static extern (C) ЦелУкз wxMenuBar_ctor();
static extern (C) ЦелУкз wxMenuBar_ctor2(бцел стиль);
static extern (C) бул   wxMenuBar_Append(ЦелУкз сам, ЦелУкз меню, ткст титул);
static extern (C) проц   wxMenuBar_Check(ЦелУкз сам, цел ид, бул check);
static extern (C) бул   wxMenuBar_IsChecked(ЦелУкз сам, цел ид);
static extern (C) бул   wxMenuBar_Insert(ЦелУкз сам, цел поз, ЦелУкз меню, ткст титул);
static extern (C) ЦелУкз wxMenuBar_FindItem(ЦелУкз сам, цел ид, inout ЦелУкз меню);

static extern (C) цел    wxMenuBar_GetMenuCount(ЦелУкз сам);
static extern (C) ЦелУкз wxMenuBar_GetMenu(ЦелУкз сам, цел поз);

static extern (C) ЦелУкз wxMenuBar_Replace(ЦелУкз сам, цел поз, ЦелУкз меню, ткст титул);
static extern (C) ЦелУкз wxMenuBar_Remove(ЦелУкз сам, цел поз);

static extern (C) проц   wxMenuBar_EnableTop(ЦелУкз сам, цел поз, бул вкл);

static extern (C) проц   wxMenuBar_Enable(ЦелУкз сам, цел ид, бул вкл);

static extern (C) цел    wxMenuBar_FindMenu(ЦелУкз сам, ткст титул);
static extern (C) цел    wxMenuBar_FindЭлтМеню(ЦелУкз сам, ткст menustring, ткст элтString);

static extern (C) ЦелУкз wxMenuBar_GetHelpString(ЦелУкз сам, цел ид);
static extern (C) ЦелУкз wxMenuBar_GetLabel(ЦелУкз сам, цел ид);
static extern (C) ЦелУкз wxMenuBar_GetLabelTop(ЦелУкз сам, цел поз);

static extern (C) бул   wxMenuBar_IsEnabled(ЦелУкз сам, цел ид);

static extern (C) проц   wxMenuBar_Refresh(ЦелУкз сам);

static extern (C) проц   wxMenuBar_SetHelpString(ЦелУкз сам, цел ид, ткст helpstring);
static extern (C) проц   wxMenuBar_SetLabel(ЦелУкз сам, цел ид, ткст ярлык);
static extern (C) проц   wxMenuBar_SetLabelTop(ЦелУкз сам, цел поз, ткст ярлык);
//! \endcond

alias MenuBar wxMenuBar;
public class MenuBar : ОбработчикСоб
{
    //---------------------------------------------------------------------

    public this()
    {
        this(wxMenuBar_ctor());
    }

    public this(цел стиль)
    {
        this(wxMenuBar_ctor2(cast(бцел)стиль));
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new MenuBar(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Append(Меню меню, ткст титул)
    {
        return wxMenuBar_Append(wxobj, меню.wxobj, титул);
    }

    //---------------------------------------------------------------------

    public проц Check(цел ид, бул check)
    {
        wxMenuBar_Check(wxobj, ид, check);
    }

    //---------------------------------------------------------------------

    public бул IsChecked(цел ид)
    {
        return wxMenuBar_IsChecked(wxobj, ид);
    }

    public бул Insert(цел поз, Меню меню, ткст титул)
    {
        return wxMenuBar_Insert(wxobj, поз, wxObject.SafePtr(меню), титул);
    }

    //-----------------------------------------------------------------------------

    public ЭлтМеню FindItem(цел ид)
    {
        Меню меню = null;
        return FindItem(ид, меню);
    }

    public ЭлтМеню FindItem(цел ид, inout Меню меню)
    {
        ЦелУкз menuRef = ЦелУкз.init;
        if (меню)
        {
            menuRef = wxObject.SafePtr(меню);
        }

        return cast(ЭлтМеню)НайдиОбъект(wxMenuBar_FindItem(wxobj, ид, menuRef), &ЭлтМеню.New2);
    }

    //-----------------------------------------------------------------------------

    public цел MenuCount()
    {
        return wxMenuBar_GetMenuCount(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Меню GetMenu(цел поз)
    {
        return cast(Меню)НайдиОбъект(wxMenuBar_GetMenu(wxobj, поз), &Меню.Нов);
    }

    //-----------------------------------------------------------------------------

    public Меню Replace(цел поз, Меню меню, ткст титул)
    {
        return cast(Меню)НайдиОбъект(wxMenuBar_Replace(wxobj, поз, wxObject.SafePtr(меню), титул), &Меню.Нов);
    }

    //-----------------------------------------------------------------------------

    public Меню Удали(цел поз)
    {
        return cast(Меню)НайдиОбъект(wxMenuBar_Remove(wxobj, поз), &Меню.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц EnableTop(цел поз, бул вкл)
    {
        wxMenuBar_EnableTop(wxobj, поз, вкл);
    }

    //-----------------------------------------------------------------------------

    public проц Включи(цел ид, бул вкл)
    {
        wxMenuBar_Enable(wxobj, ид, вкл);
    }

    //-----------------------------------------------------------------------------

    public цел FindMenu(ткст титул)
    {
        return wxMenuBar_FindMenu(wxobj, титул);
    }

    //-----------------------------------------------------------------------------

    public цел FindЭлтМеню(ткст menustring, ткст элтString)
    {
        return wxMenuBar_FindЭлтМеню(wxobj, menustring, элтString);
    }

    //-----------------------------------------------------------------------------

    public ткст GetHelpString(цел ид)
    {
        return cast(ткст) new wxString(wxMenuBar_GetHelpString(wxobj, ид), да);
    }

    //-----------------------------------------------------------------------------

    public ткст ДайЯрлык(цел ид)
    {
        return cast(ткст) new wxString(wxMenuBar_GetLabel(wxobj, ид), да);
    }

    //-----------------------------------------------------------------------------

    public ткст GetLabelTop(цел поз)
    {
        return cast(ткст) new wxString(wxMenuBar_GetLabelTop(wxobj, поз), да);
    }

    //-----------------------------------------------------------------------------

    public бул IsEnabled(цел ид)
    {
        return wxMenuBar_IsEnabled(wxobj, ид);
    }

    //-----------------------------------------------------------------------------

    public проц Освежи()
    {
        wxMenuBar_Refresh(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц УстHelpString(цел ид, ткст helpstring)
    {
        wxMenuBar_SetHelpString(wxobj, ид, helpstring);
    }

    //-----------------------------------------------------------------------------

    public проц УстЯрлык(цел ид, ткст ярлык)
    {
        wxMenuBar_SetLabel(wxobj, ид, ярлык);
    }

    //-----------------------------------------------------------------------------

    public проц УстLabelTop(цел поз, ткст ярлык)
    {
        wxMenuBar_SetLabelTop(wxobj, поз, ярлык);
    }
}
