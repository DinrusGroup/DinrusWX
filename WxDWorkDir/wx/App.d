
module wx.App;
public import wx.common;
public import wx.EvtHandler;
public import wx.Window;
public import wx.GdiCommon;
public import wx.Clipboard;
public import wx.FontMisc;

//! \cond STD

import stdrus;
alias вТкст0 toStringz;
alias вТкст toString;
alias вЮ8 toUTF8;

//! \endcond

		//! \cond EXTERN
	extern (C) {
	alias бул function(Прил o) Virtual_OnInit;
	alias цел  function(Прил o) Virtual_OnRun;
	alias цел  function(Прил o) Virtual_OnExit;
	alias бул function(Прил o,inout цел argc,сим** argv) Virtual_Initialize;
	}
	
	static extern (C) ЦУк wxApp_ctor();
	static extern (C) проц wxApp_RegisterVirtual(ЦУк сам, Прил o, Virtual_OnInit onInit, Virtual_OnRun onRun, Virtual_OnExit onExit, Virtual_Initialize initalize);
	static extern (C) бул wxApp_Initialize(ЦУк сам,inout цел argc,сим** argv);
	static extern (C) бул wxApp_OnInit(ЦУк сам);
	static extern (C) бул wxApp_OnRun(ЦУк сам);
	static extern (C) цел wxApp_OnExit(ЦУк сам);
	
        static extern (C) проц   wxApp_Run(цел argc, сим** argv);

        static extern (C) проц   wxApp_SetVendorName(ЦУк сам, ткст имя);
        static extern (C) ЦУк wxApp_GetVendorName(ЦУк сам);

        static extern (C) проц   wxApp_SetAppName(ЦУк сам, ткст имя);
        static extern (C) ЦУк wxApp_GetAppName(ЦУк сам);

        static extern (C) проц   wxApp_SetTopWindow(ЦУк сам, ЦУк окно);
        static extern (C) ЦУк wxApp_GetTopWindow(ЦУк сам);

        static extern (C) бул   wxApp_SafeYield(ЦУк окн, бул толькЕслиНужно);
        static extern (C) бул   wxApp_Yield(ЦУк сам, бул толькЕслиНужно);
       // static extern (C) проц   wxApp_WakeUpIdle();
        static extern (C) проц   wxApp_ExitMainLoop(ЦУк сам);
		//! \endcond

        //---------------------------------------------------------------------

    alias Прил wxApp;
	/// The wxApp class represents the application itself.
	/**
	  * It is used to:
	  * - set and get application-wide properties;
	  * - implement the windowing system message or event loop;
	  * - initiate application processing via wxApp::ПриИниц;
	  * - allow default processing of events not handled by other objects in the application.
	  **/
    public abstract class Прил : EvtHandler
    {
        
        private static Прил прил;
	private Объект m_caughtException=пусто;
	public проц catchException(Объект e) {m_caughtException=e;}

        //---------------------------------------------------------------------

       this() 
        {
        	super(wxApp_ctor());
            прил = this;
		
		FontMapper.инициализуй();
	    
	    wxApp_RegisterVirtual(шхобъ, this, &staticOnInit, &staticOnRun, &staticOnExit, &staticInitialize);
        }

        //---------------------------------------------------------------------

	extern (C) private static бул staticInitialize(Прил o,inout цел argc,сим** argv)
 	{
		return o.Инициализуй(argc,argv);
 	}

 	extern (C) private static бул staticOnInit(Прил o)
 	{
 		БуферОбмена.инициализуй();
		try return o.ПриИниц();
		catch(Объект e) o.catchException(e);
		return нет;
 	}

	extern (C) private static цел  staticOnRun(Прил o)
 	{
		return o.ПриПуске();
 	}

	extern (C) private static цел  staticOnExit(Прил o)
 	{
		return o.ПриВыходе();
 	}

	private бул Инициализуй(inout цел argc,сим** argv)
	{
		бул ret = wxApp_Initialize(шхобъ, argc,argv);
		InitializeStockObjects();
		return ret;
	}

	public /+virtual+/ бул ПриИниц()
	{
		return wxApp_OnInit(шхобъ);
	}
	
	public /+virtual+/ цел ПриПуске()
	{
		return wxApp_OnRun(шхобъ);
	}

	public /+virtual+/ цел ПриВыходе()
	{
		return wxApp_OnExit(шхобъ);
	}

        //---------------------------------------------------------------------

        public static Прил ДайПрил() 
        {
            return прил;
        }

        //---------------------------------------------------------------------

        public проц Пуск()
        {
            сим[][] args; // = Environment.GetCommandLineArgs();
            args.length = 1;
            args[0] = "wx".dup;
            Пуск(args);
        }

        public проц Пуск(сим[][] args)
        {
			сим*[] c_args = new сим*[args.length];
			foreach (цел i, сим[] arg; args)
			{
				ткст str = arg;// assumeUnique(arg);
				c_args[i] = cast(сим*) toStringz(toUTF8(str));
			}
			
            wxApp_Run(c_args.length, c_args.ptr);
			
			if(m_caughtException)
			{
				Объект e=m_caughtException;
				//Maybe the user catches this exception and runs
				//the прил again, so we have to clean up
				m_caughtException=пусто;
				throw e;
			}
        }

        //---------------------------------------------------------------------
        
        public ткст ИмяПроизводителя() { return cast(ткст) new wxString(wxApp_GetVendorName(шхобъ), да); }
        public проц ИмяПроизводителя(ткст имя) { wxApp_SetVendorName(шхобъ, имя); }
        public ткст ИмяПрил() { return cast(ткст) new wxString(wxApp_GetAppName(шхобъ), да); }
        public проц ИмяПрил(ткст имя) { wxApp_SetAppName(шхобъ, имя); }

        //---------------------------------------------------------------------

        public Окно ТопОкно() { return cast(Окно) FindObject(wxApp_GetTopWindow(шхобъ)); }
        public проц ТопОкно(Окно окно) { wxApp_SetTopWindow(шхобъ, окно.шхобъ); }

        //---------------------------------------------------------------------

        public static бул SafeYield() 
            { return wxApp_SafeYield(wxObject.SafePtr(пусто), нет); }
        public static бул SafeYield(Окно окн) 
            { return wxApp_SafeYield(wxObject.SafePtr(окн), нет); }
        public static бул SafeYield(Окно окн, бул толькЕслиНужно) 
            { return wxApp_SafeYield(wxObject.SafePtr(окн), толькЕслиНужно); }

        public бул Yield() 
            { return wxApp_Yield(шхобъ, нет); }
        public бул Yield(бул толькЕслиНужно) 
            { return wxApp_Yield(шхобъ, толькЕслиНужно); }

        //---------------------------------------------------------------------
/+
        public static проц WakeUpIdle()
        {
            wxApp_WakeUpIdle();
        }
		+/
		public проц ВыходИзГлавнЦикла()
		{
			wxApp_ExitMainLoop(шхобъ);
		}

        //---------------------------------------------------------------------
    }
