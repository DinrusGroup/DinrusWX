module wx.App;
public import wx.common;
public import wx.EvtHandler;
public import wx.Window;
public import wx.GdiCommon;
public import wx.Clipboard;
public import wx.FontMisc;


		//! \cond EXTERN
	extern (C) {
	alias бул function(Апп o) Virtual_OnInit;
	alias цел  function(Апп o) Virtual_OnRun;
	alias цел  function(Апп o) Virtual_OnExit;
	alias бул function(Апп o,inout цел argc,char** argv) Virtual_Initialize;
	}
	
	static extern (C) IntPtr wxApp_ctor();
	static extern (C) проц wxApp_RegisterVirtual(IntPtr сам, Апп o, Virtual_OnInit onInit, Virtual_OnRun onRun, Virtual_OnExit onExit, Virtual_Initialize initalize);
	static extern (C) бул wxApp_Initialize(IntPtr сам,inout цел argc,char** argv);
	static extern (C) бул wxApp_OnInit(IntPtr сам);
	static extern (C) бул wxApp_OnRun(IntPtr сам);
	static extern (C) цел wxApp_OnExit(IntPtr сам);
	
        static extern (C) проц   wxApp_Run(цел argc, char** argv);

        static extern (C) проц   wxApp_SetVendorName(IntPtr сам, ткст имя);
        static extern (C) IntPtr wxApp_GetVendorName(IntPtr сам);

        static extern (C) проц   wxApp_SetAppName(IntPtr сам, ткст имя);
        static extern (C) IntPtr wxApp_GetAppName(IntPtr сам);

        static extern (C) проц   wxApp_SetTopWindow(IntPtr сам, IntPtr окно);
        static extern (C) IntPtr wxApp_GetTopWindow(IntPtr сам);

        static extern (C) бул   wxApp_SafeYield(IntPtr win, бул толькоПриНеобх);
        static extern (C) бул   wxApp_Yield(IntPtr сам, бул толькоПриНеобх);
        static extern (C) проц   wxApp_WakeUpIdle();
        static extern (C) проц   wxApp_ExitMainLoop(IntPtr сам);
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
	public проц ловиИскл(Объект e) ;
        protected this() ;
	extern (C) private static бул staticInitialize(Апп o,inout цел argc,char** argv);
 	extern (C) private static бул staticOnInit(Апп o);
	extern (C) private static цел  staticOnRun(Апп o);
	extern (C) private static цел  staticOnExit(Апп o);
	private бул Инициализируй(inout цел argc,char** argv);
	public  бул ПоИниц();	
	public  цел ПоПуску();
	public  цел ПоВыходу();
        public static Апп ДайАпп() ;
        public проц Пуск();
        public проц Пуск(char[][] арги);
        public ткст ИмяВендора();
        public проц ИмяВендора(ткст имя) ;
        public ткст ИмяАпп();
        public проц ИмяАпп(ткст имя);
        public Окно ТопОкно();
        public проц ТопОкно(Окно окно) ;
        public static бул БезопЙилд() ;
        public static бул БезопЙилд(Окно win) ;
        public static бул БезопЙилд(Окно win, бул толькоПриНеобх) ;
        public бул Йилд() ;
        public бул Йилд(бул толькоПриНеобх) ;
        public static проц WakeUpIdle();
		public проц ВыйдиИзГлавнЦикла();
    }
