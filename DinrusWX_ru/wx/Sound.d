//-----------------------------------------------------------------------------
// wxD - Sound.d
// (C) 2006 afb <afb@users.sourceforge.net>
//
/// The wxSound wrapper classes. (Optional on non-Windows platforms)
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Sound.d,v 1.4 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.Sound;
public import wx.common;

//---------------------------------------------------------------------------
// Constants for Sound.Play
//---------------------------------------------------------------------------

const бцел wxSOUND_SYNC = 0U;
const бцел wxSOUND_ASYNC = 1U;
const бцел wxSOUND_LOOP = 2U;

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSound_ctor();
static extern (C) ЦелУкз wxSound_ctor2(ткст fileName, бул isResource);
static extern (C) ЦелУкз wxSound_ctor3(цел Размер, ubyte* data);
static extern (C) ЦелУкз wxSound_dtor(ЦелУкз сам);

static extern (C) бул wxSound_Play(ЦелУкз сам, бцел флаги);
static extern (C) проц wxSound_Stop(ЦелУкз сам);
static extern (C) бул wxSound_IsOk(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias Sound wxSound;
public class Sound : wxObject
{

    public this()
    {
        this(wxSound_ctor(), да);
    }

    public this(ткст fileName, бул isResource=false)
    {
        this(wxSound_ctor2(fileName, isResource), да);
    }

    public this(ubyte[] data)
    {
        this(wxSound_ctor3(data.length, data.ptr), да);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    override protected проц dtor()
    {
        wxSound_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Play(бцел флаги=wxSOUND_ASYNC)
    {
        return wxSound_Play(wxobj, флаги);
    }

    public проц Stop()
    {
        wxSound_Stop(wxobj);
    }

    public бул Ок()
    {
        return wxSound_IsOk(wxobj);
    }

    //---------------------------------------------------------------------

    // Plays sound from имяф:
    static бул Play(ткст имяф, бцел флаги=wxSOUND_ASYNC)
    {
        Sound snd = new Sound(имяф);
        return snd.Ок() ? snd.Play(флаги) : false;
    }

}
