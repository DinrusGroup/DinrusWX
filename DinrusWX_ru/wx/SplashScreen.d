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
static extern (C) ЦелУкз wxSplashScreen_ctor(ЦелУкз битмап, бцел splashStyle, цел milliseconds, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль);
static extern (C) цел    wxSplashScreen_GetSplashStyle(ЦелУкз сам);
static extern (C) ЦелУкз wxSplashScreen_GetSplashWindow(ЦелУкз сам);
static extern (C) цел    wxSplashScreen_GetTimeout(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias SplashScreen wxSplashScreen;
public class SplashScreen : Frame
{
    enum
    {
        wxSPLASH_CENTRE_ON_PARENT   = 0x01,
        wxSPLASH_CENTRE_ON_SCREEN   = 0x02,
        wxSPLASH_NO_CENTRE          = 0x00,
        wxSPLASH_TIMEOUT            = 0x04,
        wxSPLASH_NO_TIMEOUT         = 0x00,

        wxSPLASH_DEFAULT =  wxSIMPLE_BORDER | wxFRAME_NO_TASKBAR | wxSTAY_ON_TOP,
    }

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Битмап битмап, цел splashStyle, цел milliseconds, Окно родитель, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxSPLASH_DEFAULT)
    {
        super(wxSplashScreen_ctor(wxObject.SafePtr(битмап), splashStyle, milliseconds, wxObject.SafePtr(родитель), ид, поз, Размер, стиль));
    }

    //-----------------------------------------------------------------------------

    public цел SplashStyle()
    {
        return wxSplashScreen_GetSplashStyle(wxobj);
    }

    //-----------------------------------------------------------------------------

    public SplashScreenWindow SplashWindow()
    {
        return cast(SplashScreenWindow)НайдиОбъект(wxSplashScreen_GetSplashWindow(wxobj), &SplashScreenWindow.Нов);
    }

    //-----------------------------------------------------------------------------

    public цел Timeout()
    {
        return wxSplashScreen_GetTimeout(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSplashScreenWindow_ctor(ЦелУкз битмап, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль);
static extern (C) проц   wxSplashScreenWindow_SetBitmap(ЦелУкз сам, ЦелУкз битмап);
static extern (C) ЦелУкз wxSplashScreenWindow_GetBitmap(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias SplashScreenWindow wxSplashScreenWindow;
public class SplashScreenWindow : Окно
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Битмап битмап, Окно родитель, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxNO_BORDER)
    {
        super(wxSplashScreenWindow_ctor(wxObject.SafePtr(битмап), wxObject.SafePtr(родитель), ид, поз, Размер, стиль));
    }

    //-----------------------------------------------------------------------------

    public проц битмап(Битмап значение)
    {
        wxSplashScreenWindow_SetBitmap(wxobj, wxObject.SafePtr(значение));
    }
    public Битмап битмап()
    {
        return cast(Битмап)НайдиОбъект(wxSplashScreenWindow_GetBitmap(wxobj));
    }
}

