//-----------------------------------------------------------------------------
// wxD - SplashScreen.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SplashScreen.cs
//
/// The wxSplashScreen wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten 
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SplashScreen.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.SplashScreen;
public import wx.common;
public import wx.Frame;

		//! \cond EXTERN
        static extern (C) ЦУк wxSplashScreen_ctor(ЦУк битмап, бцел splashStyle, цел milliseconds, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль);
        static extern (C) цел    wxSplashScreen_GetSplashStyle(ЦУк сам);
        static extern (C) ЦУк wxSplashScreen_GetSplashWindow(ЦУк сам);
        static extern (C) цел    wxSplashScreen_GetTimeout(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SplashScreen wxSplashScreen;
    public class SplashScreen : Фрейм
    {
	enum {
        	wxSPLASH_CENTRE_ON_PARENT   = 0x01,
        	wxSPLASH_CENTRE_ON_SCREEN   = 0x02,
        	wxSPLASH_NO_CENTRE          = 0x00,
        	wxSPLASH_TIMEOUT            = 0x04,
        	wxSPLASH_NO_TIMEOUT         = 0x00,

        	wxSPLASH_DEFAULT =  wxSIMPLE_BORDER | wxFRAME_NO_TASKBAR | wxSTAY_ON_TOP,
        }

        //-----------------------------------------------------------------------------

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(Битмап битмап, цел splashStyle, цел milliseconds, Окно родитель, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxSPLASH_DEFAULT)
            { super(wxSplashScreen_ctor(wxObject.SafePtr(битмап), splashStyle, milliseconds, wxObject.SafePtr(родитель), ид, поз, size, стиль)); }

        //-----------------------------------------------------------------------------

        public цел SplashStyle() { return wxSplashScreen_GetSplashStyle(шхобъ); }

        //-----------------------------------------------------------------------------

        public SplashScreenWindow SplashWindow() { return cast(SplashScreenWindow)FindObject(wxSplashScreen_GetSplashWindow(шхобъ), &SplashScreenWindow.Нов); }

        //-----------------------------------------------------------------------------

        public цел Timeout() { return wxSplashScreen_GetTimeout(шхобъ); }
    }
    
    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxSplashScreenWindow_ctor(ЦУк битмап, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль);
        static extern (C) проц   wxSplashScreenWindow_SetBitmap(ЦУк сам, ЦУк битмап);
        static extern (C) ЦУк wxSplashScreenWindow_GetBitmap(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SplashScreenWindow wxSplashScreenWindow;
    public class SplashScreenWindow : Окно
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(Битмап битмап, Окно родитель, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxNO_BORDER)
            { super(wxSplashScreenWindow_ctor(wxObject.SafePtr(битмап), wxObject.SafePtr(родитель), ид, поз, size, стиль)); }

        //-----------------------------------------------------------------------------

        public проц битмап(Битмап значение) { wxSplashScreenWindow_SetBitmap(шхобъ, wxObject.SafePtr(значение)); }
        public Битмап битмап() { return cast(Битмап)FindObject(wxSplashScreenWindow_GetBitmap(шхобъ)); }
    }

