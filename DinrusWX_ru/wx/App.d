//-----------------------------------------------------------------------------
// wxD - Апп.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// (C) 2006 afb <afb@users.sourceforge.net>
// based on
// wx.NET - Апп.cs
//
/// The wxApp wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Апп.d,v 1.18 2008/09/26 09:28:28 afb Exp $
//-----------------------------------------------------------------------------

module wx.App;
public import wx.common;
public import wx.EvtHandler;
public import wx.Window;
public import wx.GdiCommon;
public import wx.Clipboard;
public import wx.FontMisc;
private import stdrus;


//! \cond EXTERN
extern (C)
{
    alias бул function(Апп o) Virtual_OnInit;
    alias цел  function(Апп o) Virtual_OnRun;
    alias цел  function(Апп o) Virtual_OnExit;
    alias бул function(Апп o,inout цел argc,char** argv) Virtual_Initialize;
}

static extern (C) ЦелУкз wxApp_ctor();
static extern (C) проц wxApp_RegisterVirtual(ЦелУкз сам, Апп o, Virtual_OnInit onInit, Virtual_OnRun onRun, Virtual_OnExit onExit, Virtual_Initialize initalize);
static extern (C) бул wxApp_Initialize(ЦелУкз сам,inout цел argc,char** argv);
static extern (C) бул wxApp_OnInit(ЦелУкз сам);
static extern (C) бул wxApp_OnRun(ЦелУкз сам);
static extern (C) цел wxApp_OnExit(ЦелУкз сам);

static extern (C) проц   wxApp_Run(цел argc, char** argv);

static extern (C) проц   wxApp_SetVendorName(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxApp_GetVendorName(ЦелУкз сам);

static extern (C) проц   wxApp_SetAppName(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxApp_GetAppName(ЦелУкз сам);

static extern (C) проц   wxApp_SetTopWindow(ЦелУкз сам, ЦелУкз окно);
static extern (C) ЦелУкз wxApp_GetTopWindow(ЦелУкз сам);

static extern (C) бул   wxApp_SafeYield(ЦелУкз win, бул толькоПриНеобх);
static extern (C) бул   wxApp_Yield(ЦелУкз сам, бул толькоПриНеобх);
static extern (C) проц   wxApp_WakeUpIdle();
static extern (C) проц   wxApp_ExitMainLoop(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Апп wxApp;
/// The wxApp class represents the application itself.
/**
  * It is used to:
  * - set and get application-wide properties;
  * - implement the windowing system message or event loop;
  * - initiate application processing via wxApp::ПоИниц;
  * - allow default processing of events not handled by other objects in the application.
  **/
public abstract class Апп : ОбработчикСоб
{

    private static Апп app;
    private Объект m_caughtException=null;
    public проц ловиИскл(Объект e)
    {
        m_caughtException=e;
    }

    //---------------------------------------------------------------------

    protected this()
    {
        super(wxApp_ctor());
        app = this;

        FontMapper.initialize();

        wxApp_RegisterVirtual(wxobj, this, &staticOnInit, &staticOnRun, &staticOnExit, &staticInitialize);
    }

    //---------------------------------------------------------------------

    extern (C) private static бул staticInitialize(Апп o,inout цел argc,char** argv)
    {
        return o.Инициализируй(argc,argv);
    }

    extern (C) private static бул staticOnInit(Апп o)
    {
        Clipboard.initialize();
        try return o.ПоИниц();
        catch(Объект e) o.ловиИскл(e);
        return false;
    }

    extern (C) private static цел  staticOnRun(Апп o)
    {
        return o.ПоПуску();
    }

    extern (C) private static цел  staticOnExit(Апп o)
    {
        return o.ПоВыходу();
    }

    private бул Инициализируй(inout цел argc,char** argv)
    {
        бул ret = wxApp_Initialize(wxobj, argc,argv);
        InitializeStockObjects();
        return ret;
    }

    public  бул ПоИниц()
    {
        return wxApp_OnInit(wxobj);
    }

    public  цел ПоПуску()
    {
        return wxApp_OnRun(wxobj);
    }

    public  цел ПоВыходу()
    {
        return wxApp_OnExit(wxobj);
    }

    //---------------------------------------------------------------------

    public static Апп ДайАпп()
    {
        return app;
    }

    //---------------------------------------------------------------------

    public проц Пуск()
    {
        char[][] арги; // = Environment.GetCommandLineArgs();
        арги.length = 1;
        арги[0] = "wx".dup;
        Пуск(арги);
    }

    public проц Пуск(char[][] арги)
    {
        char*[] c_args = new char*[арги.length];
        foreach (цел i, char[] arg; арги)
        {
            ткст стр = assumeUnique(arg);
            c_args[i] = cast(char*) вТкст0(вЮ8(стр));
        }

        wxApp_Run(c_args.length, c_args.ptr);

        if(m_caughtException)
        {
            Объект e=m_caughtException;
            //Maybe the user catches this exception and runs
            //the app again, so we have to clean up
            m_caughtException=null;
            throw e;
        }
    }

    //---------------------------------------------------------------------

    public ткст ИмяВендора()
    {
        return cast(ткст) new wxString(wxApp_GetVendorName(wxobj), да);
    }
    public проц ИмяВендора(ткст имя)
    {
        wxApp_SetVendorName(wxobj, имя);
    }
    public ткст ИмяАпп()
    {
        return cast(ткст) new wxString(wxApp_GetAppName(wxobj), да);
    }
    public проц ИмяАпп(ткст имя)
    {
        wxApp_SetAppName(wxobj, имя);
    }

    //---------------------------------------------------------------------

    public Окно ТопОкно()
    {
        return cast(Окно) НайдиОбъект(wxApp_GetTopWindow(wxobj));
    }
    public проц ТопОкно(Окно окно)
    {
        wxApp_SetTopWindow(wxobj, окно.wxobj);
    }

    //---------------------------------------------------------------------

    public static бул БезопЙилд()
    {
        return wxApp_SafeYield(wxObject.SafePtr(null), false);
    }
    public static бул БезопЙилд(Окно win)
    {
        return wxApp_SafeYield(wxObject.SafePtr(win), false);
    }
    public static бул БезопЙилд(Окно win, бул толькоПриНеобх)
    {
        return wxApp_SafeYield(wxObject.SafePtr(win), толькоПриНеобх);
    }

    public бул Йилд()
    {
        return wxApp_Yield(wxobj, false);
    }
    public бул Йилд(бул толькоПриНеобх)
    {
        return wxApp_Yield(wxobj, толькоПриНеобх);
    }

    //---------------------------------------------------------------------

    public static проц WakeUpIdle()
    {
        wxApp_WakeUpIdle();
    }

    public проц ВыйдиИзГлавнЦикла()
    {
        wxApp_ExitMainLoop(wxobj);
    }

    //---------------------------------------------------------------------
}
