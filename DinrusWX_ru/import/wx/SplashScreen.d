module wx.SplashScreen;
public import wx.common;
public import wx.Frame;

		//! \cond EXTERN
        static extern (C) IntPtr wxSplashScreen_ctor(IntPtr битмап, бцел splashStyle, цел milliseconds, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль);
        static extern (C) цел    wxSplashScreen_GetSplashStyle(IntPtr сам);
        static extern (C) IntPtr wxSplashScreen_GetSplashWindow(IntPtr сам);
        static extern (C) цел    wxSplashScreen_GetTimeout(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SplashScreen wxSplashScreen;
    public class SplashScreen : Frame
    {
	enum {
        	wxSPLASH_CENTRE_ON_PARENT   = 0x01,
        	wxSPLASH_CENTRE_ON_SCREEN   = 0x02,
        	wxSPLASH_NO_CENTRE          = 0x00,
        	wxSPLASH_TIMEOUT            = 0x04,
        	wxSPLASH_NO_TIMEOUT         = 0x00,

        	wxSPLASH_DEFAULT =  wxSIMPLE_BORDER | wxFRAME_NO_TASKBAR | wxSTAY_ON_TOP,
        }

        public this(IntPtr wxobj) ;
        public this(Битмап битмап, цел splashStyle, цел milliseconds, Окно родитель, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxSPLASH_DEFAULT);
        public цел SplashStyle() ;
        public SplashScreenWindow SplashWindow() ;
        public цел Timeout() ;
    }
    
    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxSplashScreenWindow_ctor(IntPtr битмап, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль);
        static extern (C) проц   wxSplashScreenWindow_SetBitmap(IntPtr сам, IntPtr битмап);
        static extern (C) IntPtr wxSplashScreenWindow_GetBitmap(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SplashScreenWindow wxSplashScreenWindow;
    public class SplashScreenWindow : Окно
    {
        public this(IntPtr wxobj) ;
        public this(Битмап битмап, Окно родитель, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxNO_BORDER);
        public проц битмап(Битмап значение);
        public Битмап битмап();
    }

