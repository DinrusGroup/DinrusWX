//-----------------------------------------------------------------------------
// wxD - Accelerator.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Accelerator.cs
//
/// The wxAcceleratorEntry and wxAcceleratorTable wrapper classes
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Accelerator.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Accelerator;
public import wx.common;
public import wx.MenuItem;

//! \cond EXTERN
static extern (C) ЦелУкз wxAcceleratorEntry_ctor(цел флаги, цел кодКл, цел кмд, ЦелУкз элт);
static extern (C) проц   wxAcceleratorEntry_dtor(ЦелУкз сам);
static extern (C) проц   wxAcceleratorEntry_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxAcceleratorEntry_Set(ЦелУкз сам, цел флаги, цел кодКл, цел кмд, ЦелУкз элт);
static extern (C) проц   wxAcceleratorEntry_SetMenuItem(ЦелУкз сам, ЦелУкз элт);
static extern (C) цел    wxAcceleratorEntry_GetFlags(ЦелУкз сам);
static extern (C) цел    wxAcceleratorEntry_GetKeyCode(ЦелУкз сам);
static extern (C) цел    wxAcceleratorEntry_GetCommand(ЦелУкз сам);
static extern (C) ЦелУкз wxAcceleratorEntry_GetMenuItem(ЦелУкз сам);

static extern (C) ЦелУкз wxAcceleratorEntry_GetAccelFromString(ткст ярлык);
//! \endcond

//-----------------------------------------------------------------------------

alias ЗаписьАкселератора wxAcceleratorEntry;
public class ЗаписьАкселератора : wxObject
{
    public const цел wxACCEL_NORMAL	= 0x0000;
    public const цел wxACCEL_ALT	= 0x0001;
    public const цел wxACCEL_CTRL	= 0x0002;
    public const цел wxACCEL_SHIFT	= 0x0004;

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(0, 0, 0, null);
    }

    public this(цел флаги)
    {
        this(флаги, 0, 0, null);
    }

    public this(цел флаги, цел кодКл)
    {
        this(флаги, кодКл, 0, null);
    }

    public this(цел флаги, цел кодКл, цел кмд)
    {
        this(флаги, кодКл, кмд, null);
    }

    public this(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт)
    {
        this(wxAcceleratorEntry_ctor(флаги, кодКл, кмд, wxObject.SafePtr(элт)), да);
        wxAcceleratorEntry_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //-----------------------------------------------------------------------------

    public проц Уст(цел флаги, цел кодКл, цел кмд)
    {
        Уст(флаги, кодКл, кмд);
    }

    public проц Уст(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт)
    {
        wxAcceleratorEntry_Set(wxobj, флаги, кодКл, кмд, wxObject.SafePtr(элт));
    }

    //-----------------------------------------------------------------------------

    public ЭлтМеню элтМеню()
    {
        return cast(ЭлтМеню)НайдиОбъект(wxAcceleratorEntry_GetMenuItem(wxobj), &ЭлтМеню.New2);
    }
    //-----------------------------------------------------------------------------

    public цел Флаги()
    {
        return wxAcceleratorEntry_GetFlags(wxobj);
    }
    //-----------------------------------------------------------------------------

    public цел КодКл()
    {
        return wxAcceleratorEntry_GetKeyCode(wxobj);
    }
    //-----------------------------------------------------------------------------

    public цел Команда()
    {
        return wxAcceleratorEntry_GetCommand(wxobj);
    }
    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxAcceleratorEntry_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public static ЗаписьАкселератора ДайАксельИзТкст(ткст ярлык)
    {
        return cast(ЗаписьАкселератора)НайдиОбъект(wxAcceleratorEntry_GetAccelFromString(ярлык), &ЗаписьАкселератора.Нов);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ЗаписьАкселератора(ptr);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxAcceleratorTable_ctor();
static extern (C) бул   wxAcceleratorTable_Ok(ЦелУкз сам);
//static extern (C) проц   wxAcceleratorTable_Add(ЦелУкз сам, ЦелУкз entry);
//static extern (C) проц   wxAcceleratorTable_Remove(ЦелУкз сам, ЦелУкз entry);
//static extern (C) ЦелУкз wxAcceleratorTable_GetMenuItem(ЦелУкз сам, ЦелУкз evt);
//static extern (C) цел    wxAcceleratorTable_GetCommand(ЦелУкз сам, ЦелУкз evt);
//static extern (C) ЦелУкз wxAcceleratorTable_GetEntry(ЦелУкз сам, ЦелУкз evt);
//! \endcond

//-----------------------------------------------------------------------------

alias ТаблицаАкселераторов wxAcceleratorTable;
public class ТаблицаАкселераторов : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxAcceleratorTable_ctor());
    }

    //! \cond VERSION
    version(__WXMAC__) {} else
    {
        //! \endcond
        //-----------------------------------------------------------------------------

        /*public проц Добавь(ЗаписьАкселератора entry)
        {
        	wxAcceleratorTable_Add(wxobj, wxObject.SafePtr(entry));
        }*/

        //-----------------------------------------------------------------------------

        /*public проц Удали(ЗаписьАкселератора entry)
        {
        	wxAcceleratorTable_Remove(wxobj, wxObject.SafePtr(entry));
        }*/

        //-----------------------------------------------------------------------------

        /*public ЭлтМеню GetЭлтМеню(KeyEvent evt)
        {
        	return cast(ЭлтМеню)НайдиОбъект(wxAcceleratorTable_GetMenuItem(wxobj, wxObject.SafePtr(evt)),&ЭлтМеню.Нов);
        }*/

        //-----------------------------------------------------------------------------

        /*public ЗаписьАкселератора GetEntry(KeyEvent evt)
        {
        	return cast(ЗаписьАкселератора)НайдиОбъект(wxAcceleratorTable_GetEntry(wxobj, wxObject.SafePtr(evt)),&ЗаписьАкселератора.Нов);
        }*/
        //! \cond VERSION
    } // version(__WXMAC__)
    //! \endcond

    //-----------------------------------------------------------------------------

    /*public цел GetCommand(KeyEvent evt)
    {
    	return wxAcceleratorTable_GetCommand(wxobj, wxObject.SafePtr(evt));
    }*/

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxAcceleratorTable_Ok(wxobj);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ТаблицаАкселераторов(ptr);
    }
}

