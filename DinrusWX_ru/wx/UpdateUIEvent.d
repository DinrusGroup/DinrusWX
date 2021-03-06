//-----------------------------------------------------------------------------
// wxD - UpdateUIEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - UpdateUIEvent.cs
//
/// The wxUpdateUIEvent wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: UpdateUIEvent.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.UpdateUIEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxUpdateUIEvent_ctor(цел commandId);
static extern (C) проц   wxUpdUIEvt_Enable(ЦелУкз сам, бул вкл);
static extern (C) проц   wxUpdUIEvt_Check(ЦелУкз сам, бул check);
static extern (C) бул   wxUpdateUIEvent_CanUpdate(ЦелУкз окно);
static extern (C) бул   wxUpdateUIEvent_GetChecked(ЦелУкз сам);
static extern (C) бул   wxUpdateUIEvent_GetEnabled(ЦелУкз сам);
static extern (C) бул   wxUpdateUIEvent_GetУстChecked(ЦелУкз сам);
static extern (C) бул   wxUpdateUIEvent_GetУстEnabled(ЦелУкз сам);
static extern (C) бул   wxUpdateUIEvent_GetУстText(ЦелУкз сам);
static extern (C) ЦелУкз wxUpdateUIEvent_GetText(ЦелУкз сам);
static extern (C) цел    wxUpdateUIEvent_GetMode();
static extern (C) бцел   wxUpdateUIEvent_GetUpdateInterval();
static extern (C) проц   wxUpdateUIEvent_ResetUpdateTime();
static extern (C) проц   wxUpdateUIEvent_SetMode(цел mode);
static extern (C) проц   wxUpdateUIEvent_SetText(ЦелУкз сам, ткст текст);
static extern (C) проц   wxUpdateUIEvent_SetUpdateInterval(бцел updateInterval);
//! \endcond

//-----------------------------------------------------------------------------

alias UpdateUIEvent wxUpdateUIEvent;
public class UpdateUIEvent : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел commandId = 0)
    {
        this(wxUpdateUIEvent_ctor(commandId));
    }

    //-----------------------------------------------------------------------------

    public проц Активен(бул значение)
    {
        wxUpdUIEvt_Enable(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Check(бул значение)
    {
        wxUpdUIEvt_Check(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public static бул CanUpdate(Окно окно)
    {
        return wxUpdateUIEvent_CanUpdate(wxObject.SafePtr(окно));
    }

    //-----------------------------------------------------------------------------

    public бул Checked()
    {
        return wxUpdateUIEvent_GetChecked(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул GetEnabled()
    {
        return wxUpdateUIEvent_GetEnabled(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул УстChecked()
    {
        return wxUpdateUIEvent_GetУстChecked(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул УстEnabled()
    {
        return wxUpdateUIEvent_GetУстEnabled(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул УстText()
    {
        return wxUpdateUIEvent_GetУстText(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст Text()
    {
        return cast(ткст) new wxString(wxUpdateUIEvent_GetText(wxobj), да);
    }
    public проц Text(ткст значение)
    {
        wxUpdateUIEvent_SetText(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    static UpdateUIMode Mode()
    {
        return cast(UpdateUIMode)wxUpdateUIEvent_GetMode();
    }
    static проц Mode(UpdateUIMode значение)
    {
        wxUpdateUIEvent_SetMode(cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    static цел UpdateInterval()
    {
        return cast(цел)wxUpdateUIEvent_GetUpdateInterval();
    }
    static проц UpdateInterval(цел значение)
    {
        wxUpdateUIEvent_SetUpdateInterval(cast(бцел)значение);
    }

    //-----------------------------------------------------------------------------

    public static проц ResetUpdateTime()
    {
        wxUpdateUIEvent_ResetUpdateTime();
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new UpdateUIEvent(объ);
    }

    static this()
    {
        ДобавьТипСоб(wxEVT_UPDATE_UI,                       &UpdateUIEvent.Нов);
    }
}
