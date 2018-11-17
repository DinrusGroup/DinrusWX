//-----------------------------------------------------------------------------
// wxD - ЭлтМеню.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ЭлтМеню.cs
//
/// The wxЭлтМеню wrapper class.
//
// Written by Achim Breunig(achim.breunig@web.de)
// (C) 2003
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ЭлтМеню.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.MenuItem;
public import wx.common;
public import wx.Accelerator;
public import wx.Menu;
public import wx.Bitmap;
public import wx.EvtHandler;

//! \cond EXTERN
static extern (C) ЦелУкз wxЭлтМеню_GetMenu(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_SetMenu(ЦелУкз сам, ЦелУкз меню);
static extern (C) проц   wxЭлтМеню_SetId(ЦелУкз сам, цел ид);
static extern (C) цел    wxЭлтМеню_GetId(ЦелУкз сам);
static extern (C) бул   wxЭлтМеню_IsSeparator(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_SetText(ЦелУкз сам, ткст стр);
static extern (C) ЦелУкз wxЭлтМеню_GetLabel(ЦелУкз сам);
static extern (C) ЦелУкз wxЭлтМеню_GetText(ЦелУкз сам);
static extern (C) ЦелУкз wxЭлтМеню_GetLabelFromText(ЦелУкз сам, ткст текст);
static extern (C) цел    wxЭлтМеню_GetKind(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_SetCheckable(ЦелУкз сам, бул checkable);
static extern (C) бул   wxЭлтМеню_IsCheckable(ЦелУкз сам);
static extern (C) бул   wxЭлтМеню_IsSubMenu(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_SetSubMenu(ЦелУкз сам, ЦелУкз меню);
static extern (C) ЦелУкз wxЭлтМеню_GetSubMenu(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_Enable(ЦелУкз сам, бул вкл);
static extern (C) бул   wxЭлтМеню_IsEnabled(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_Check(ЦелУкз сам, бул check);
static extern (C) бул   wxЭлтМеню_IsChecked(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_Toggle(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_SetHelp(ЦелУкз сам, ткст стр);
static extern (C) ЦелУкз wxЭлтМеню_GetHelp(ЦелУкз сам);
static extern (C) ЦелУкз wxЭлтМеню_GetAccel(ЦелУкз сам);
static extern (C) проц   wxЭлтМеню_SetAccel(ЦелУкз сам, ЦелУкз accel);
static extern (C) проц   wxЭлтМеню_SetName(ЦелУкз сам, ткст стр);
static extern (C) ЦелУкз wxЭлтМеню_GetName(ЦелУкз сам);
static extern (C) ЦелУкз wxЭлтМеню_NewCheck(ЦелУкз parentMenu, цел ид, ткст текст, ткст help, бул isCheckable, ЦелУкз subMenu);
static extern (C) ЦелУкз wxЭлтМеню_New(ЦелУкз parentMenu, цел ид, ткст текст, ткст help, цел kind, ЦелУкз subMenu);
//static extern (C) проц   wxЭлтМеню_SetBitmap(ЦелУкз сам, ЦелУкз битмап);
//static extern (C) ЦелУкз wxЭлтМеню_GetBitmap(ЦелУкз сам);
static extern (C) ЦелУкз wxЭлтМеню_ctor(ЦелУкз parentMenu, цел ид, ткст текст, ткст help, цел kind, ЦелУкз subMenu);
//! \endcond

//-----------------------------------------------------------------------------

alias ЭлтМеню wxЭлтМеню;
public class ЭлтМеню : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this(Меню parentMenu = null, цел ид =  wxID_SEPARATOR, ткст текст = "", ткст help = "", ItemKind kind = ItemKind.wxITEM_NORMAL, Меню subMenu = null)
    {
        this(wxЭлтМеню_ctor(wxObject.SafePtr(parentMenu), ид, текст, help, cast(цел)kind, wxObject.SafePtr(subMenu)));
    }

    public static wxObject New2(ЦелУкз ptr)
    {
        return new ЭлтМеню(ptr);
    }
    //-----------------------------------------------------------------------------

    public static ЭлтМеню Нов(Меню parentMenu = null, цел ид = wxID_SEPARATOR, ткст текст = "", ткст help = "", ItemKind kind=ItemKind.wxITEM_NORMAL, Меню subMenu = null)
    {
        return new ЭлтМеню(wxЭлтМеню_New(wxObject.SafePtr(parentMenu), ид, текст, help, cast(цел)kind, wxObject.SafePtr(subMenu)));
    }
    /* OLD API
    	public static ЭлтМеню Нов(Меню parentMenu, цел ид, ткст текст, ткст help, бул isCheckable, Меню subMenu)
    	{
    		return new ЭлтМеню(wxЭлтМеню_NewCheck(wxObject.SafePtr(parentMenu), ид, текст, help, isCheckable, wxObject.SafePtr(subMenu)));
    	}

    */	//-----------------------------------------------------------------------------

    public Меню меню()
    {
        return cast(Меню)НайдиОбъект(wxЭлтМеню_GetMenu(wxobj), &Меню.Нов);
    }
    public проц меню(Меню значение)
    {
        wxЭлтМеню_SetMenu(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public цел ИД()
    {
        return wxЭлтМеню_GetId(wxobj);
    }
    public проц ИД(цел значение)
    {
        wxЭлтМеню_SetId(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул IsSeparator()
    {
        return wxЭлтМеню_IsSeparator(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Text(ткст значение)
    {
        wxЭлтМеню_SetText(wxobj, значение);
    }
    public ткст Text()
    {
        return cast(ткст) new wxString(wxЭлтМеню_GetText(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ткст Ярлык()
    {
        return cast(ткст) new wxString(wxЭлтМеню_GetLabel(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ткст GetLabelFromText(ткст текст)
    {
        return cast(ткст) new wxString(wxЭлтМеню_GetLabelFromText(wxobj, текст), да);
    }

    //-----------------------------------------------------------------------------

    public ItemKind Kind()
    {
        return cast(ItemKind)wxЭлтМеню_GetKind(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Checkable(бул значение)
    {
        wxЭлтМеню_SetCheckable(wxobj, значение);
    }
    public бул Checkable()
    {
        return wxЭлтМеню_IsCheckable(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул IsSubMenu()
    {
        return wxЭлтМеню_IsSubMenu(wxobj);
    }

    public проц SubMenu(Меню значение)
    {
        wxЭлтМеню_SetSubMenu(wxobj, wxObject.SafePtr(значение));
    }
    public Меню SubMenu()
    {
        return cast(Меню)НайдиОбъект(wxЭлтМеню_GetSubMenu(wxobj), &Меню.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц Активен(бул значение)
    {
        wxЭлтМеню_Enable(wxobj, значение);
    }
    public бул Активен()
    {
        return wxЭлтМеню_IsEnabled(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Checked(бул значение)
    {
        wxЭлтМеню_Check(wxobj, значение);
    }
    public бул Checked()
    {
        return wxЭлтМеню_IsChecked(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Toggle()
    {
        wxЭлтМеню_Toggle(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Help(ткст значение)
    {
        wxЭлтМеню_SetHelp(wxobj, значение);
    }
    public ткст Help()
    {
        return cast(ткст) new wxString(wxЭлтМеню_GetHelp(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ЗаписьАкселератора Accel()
    {
        return cast(ЗаписьАкселератора)НайдиОбъект(wxЭлтМеню_GetAccel(wxobj), &ЗаписьАкселератора.Нов);
    }
    public проц Accel(ЗаписьАкселератора значение)
    {
        wxЭлтМеню_SetAccel(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public проц Имя(ткст значение)
    {
        wxЭлтМеню_SetName(wxobj, значение);
    }
    public ткст Имя()
    {
        return cast(ткст) new wxString(wxЭлтМеню_GetName(wxobj), да);
    }

    //-----------------------------------------------------------------------------
    /+
    public проц битмап(Битмап значение)
    {
        wxЭлтМеню_SetBitmap(wxobj, wxObject.SafePtr(значение));
    }
    public Битмап битмап()
    {
        return cast(Битмап)НайдиОбъект(wxЭлтМеню_GetBitmap(wxobj), &Битмап.Нов);
    }
    +/
    //---------------------------------------------------------------------

    public проц Click_Add(ДатчикСобытий значение)
    {
        this.меню.AddEvent(ИД, значение, this);
    }
    public проц Click_Remove(ДатчикСобытий значение) { }

    public проц Select_Add(ДатчикСобытий значение)
    {
        this.меню.AddEvent(ИД, значение, this);
    }
    public проц Select_Remove(ДатчикСобытий значение) { }
}

