//-----------------------------------------------------------------------------
// wxD - ToolTip.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ToolTip.cs
//
/// The wxToolTip wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ToolTip.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.ToolTip;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
static extern (C) проц   wxToolTip_Enable(бул flag);
static extern (C) проц   wxToolTip_SetDelay(бцел msecs);
static extern (C) ЦелУкз wxToolTip_ctor(ткст tip);
static extern (C) проц   wxToolTip_SetTip(ЦелУкз сам, ткст tip);
static extern (C) ЦелУкз wxToolTip_GetTip(ЦелУкз сам);
static extern (C) ЦелУкз wxToolTip_GetWindow(ЦелУкз сам);
static extern (C) проц   wxToolTip_SetWindow(ЦелУкз сам,ЦелУкз win);
//! \endcond

//---------------------------------------------------------------------

alias ToolTip wxToolTip;
public class ToolTip : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ткст tip)
    {
        super(wxToolTip_ctor(tip));
    }

    //---------------------------------------------------------------------

    static проц Активен(бул значение)
    {
        wxToolTip_Enable(значение);
    }

    //---------------------------------------------------------------------

    static проц Delay(цел значение)
    {
        wxToolTip_SetDelay(cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    public ткст Tip()
    {
        return cast(ткст) new wxString(wxToolTip_GetTip(wxobj), да);
    }
    public проц Tip(ткст значение)
    {
        wxToolTip_SetTip(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public Окно окно()
    {
        return cast(Окно)НайдиОбъект(wxToolTip_GetWindow(wxobj));
    }
    public проц окно(Окно win)
    {
        return wxToolTip_SetWindow(wxobj,wxObject.SafePtr(win));
    }

    //---------------------------------------------------------------------
}

