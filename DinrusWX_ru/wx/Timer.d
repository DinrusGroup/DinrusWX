//-----------------------------------------------------------------------------
// wxD - Timer.d
// (C) 2006 afb <afb@users.sourceforge.net> (thanks to Matrix for updates)
//
/// The wxTimer wrapper classes. (Optional, requires timer)
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Timer.d,v 1.1 2007/08/21 20:58:44 afb Exp $
//-----------------------------------------------------------------------------

module wx.Timer;
public import wx.common;
public import wx.EvtHandler;

//---------------------------------------------------------------------------
// Constants for Timer.Play
//---------------------------------------------------------------------------

/// generate notifications periodically until the timer is stopped (default)
const бул wxTIMER_CONTINOUS = false;

/// only send the notification once and then stop the timer
const бул wxTIMER_ONE_SHOT = да;

//-----------------------------------------------------------------------------

extern (C)
{
    alias проц function (Timer) Virtual_Notify;
}

//! \cond EXTERN
static extern (C) ЦелУкз wxTimer_ctor();
static extern (C) ЦелУкз wxTimer_ctor2(ЦелУкз owner, цел ид);
static extern (C) проц   wxTimer_RegisterVirtual(ЦелУкз сам, Timer объ,
        Virtual_Notify notify);
static extern (C) ЦелУкз wxTimer_dtor(ЦелУкз сам);

static extern (C) цел wxTimer_GetInterval(ЦелУкз сам);
static extern (C) бул wxTimer_IsOneShot(ЦелУкз сам);
static extern (C) бул wxTimer_IsRunning(ЦелУкз сам);
static extern (C) проц wxTimer_BaseNotify(ЦелУкз сам);
static extern (C) проц wxTimer_SetOwner(ЦелУкз сам, ЦелУкз owner, цел ид);
static extern (C) бул wxTimer_Start(ЦелУкз сам, цел milliseconds, бул oneShot);
static extern (C) проц wxTimer_Stop(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias Timer wxTimer;
public class Timer : ОбработчикСоб
{

    public this()
    {
        this(wxTimer_ctor(), да);
    }

    public this(ОбработчикСоб owner, цел ид=-1)
    {
        this(wxTimer_ctor2(owner.wxobj, ид), да);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);

        wxTimer_RegisterVirtual(wxobj, this, &staticNotify);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;

        wxTimer_RegisterVirtual(wxobj, this, &staticNotify);
    }

    override protected проц dtor()
    {
        wxTimer_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    static extern(C) private проц staticNotify(Timer объ)
    {
        объ.Notify();
    }
    protected  проц Notify()
    {
        wxTimer_BaseNotify(wxobj);
    }

    //---------------------------------------------------------------------

    public цел Interval()
    {
        return wxTimer_GetInterval(wxobj);
    }

    public бул IsOneShot()
    {
        return wxTimer_IsOneShot(wxobj);
    }

    public бул IsRunning()
    {
        return wxTimer_IsRunning(wxobj);
    }

    public проц УстOwner(ОбработчикСоб owner, цел ид=-1)
    {
        wxTimer_SetOwner(wxobj, owner.wxobj, ид);
    }

    public бул Start(цел milliseconds=-1, бул oneShot=false)
    {
        return wxTimer_Start(wxobj, milliseconds, oneShot);
    }

    public проц Stop()
    {
        wxTimer_Stop(wxobj);
    }

}
