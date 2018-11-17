//------------------------------------------------------------------------
// wxD - Display.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Display.cs
//
/// The wxDisplay wrapper class
//
// Michael S. Muegel mike _at_ muegel dot org
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// TODO:
//    + Memory management review
//
// wxWidgets-based quirks of note:
//    + Display resolution did not change on my Fedora1 test system
//      under both wxWidgets display sample and my port.
//    + IsPrimary is wrong, at least on WIN32: assumes display #0
//      is primary, which may not be the case. For example, I have
//      three horizontally aligned displays. wxWidgets numbers them
//      0, 1, 2. But it's #1 is actually the primary, not 0. Note also
//      that the numbering scheme differs from how windows numbers
//      them, which has more to do with the display adapter used. This
//      is not an issue really, but something to be aware of should
//      you be expecting them to match.
//------------------------------------------------------------------------

module wx.Display;
public import wx.common;

public import wx.VideoMode;
public import wx.Window;

//version(LDC) { pragma(ldc, "verbose") }

//! \cond EXTERN
static extern (C) ЦелУкз wxDisplay_ctor(цел index);
//static extern (C) ЦелУкз wxDisplay_ctor(inout VideoMode mode);
static extern (C) цел wxDisplay_GetCount();
static extern (C) цел wxDisplay_GetFromPoint(inout Точка тчк);
static extern (C) цел wxDisplay_GetFromWindow(ЦелУкз окно);
static extern (C) проц wxDisplay_GetGeometry(ЦелУкз сам, out Прямоугольник прям);
static extern (C) ЦелУкз wxDisplay_GetName(ЦелУкз сам);
static extern (C) бул wxDisplay_IsPrimary(ЦелУкз сам);
static extern (C) проц wxDisplay_GetCurrentMode(ЦелУкз сам, out VideoMode mode);
static extern (C) бул wxDisplay_ChangeMode(ЦелУкз сам, VideoMode mode);


static extern (C) цел wxDisplay_GetNumModes(ЦелУкз сам, VideoMode mode);
static extern (C) проц wxDisplay_GetModes(ЦелУкз сам, VideoMode mode, inout VideoMode[] modes);


static extern (C) проц wxDisplay_ResetMode(ЦелУкз сам);
static extern (C) проц wxDisplay_dtor(ЦелУкз сам);
//! \endcond

alias Display wxDisplay;
public class Display : wxObject
{
    //------------------------------------------------------------------------

    // Symbolic constant used by all Find()-like functions returning positive
    // integer on success as failure indicator. While this is global in
    // wxWidgets it makes more sense to be in each class that uses it???
    // Or maybe move it to Окно.cs.
    public const цел wxNOT_FOUND = -1;

    //------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    //------------------------------------------------------------------------

    public this(цел index)
    {
        this(wxDisplay_ctor(index), да);
    }

    //------------------------------------------------------------------------

    //public this(VideoMode mode)
    //	{ this(wxDisplay_ctor(mode), да); }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDisplay_dtor(wxobj);
    }

    //------------------------------------------------------------------------
    static цел Счёт()
    {
        return wxDisplay_GetCount();
    }

    // an массив of all Displays indexed by display number
    public static Display[] GetDisplays()
    {
        цел count = Счёт;
        Display[] displays = new Display[count];
        for (цел i = 0; i < count; i++)
        {
            displays[i] = new Display(i);
        }
        return displays;
    }

    //------------------------------------------------------------------------
    // An массив of available VideoModes for this display.
     public VideoMode[] GetModes()
    {
        return GetModes(VideoMode(0,0,0,0));
    }

    // An массив of the VideoModes that match mode. A match occurs when
    // the resolution and глубь matches and the освежи frequency in
    // equal to or greater than mode.RefreshFrequency.
     public VideoMode[] GetModes(VideoMode mode)
    {
        цел num_modes = wxDisplay_GetNumModes(wxobj, mode);
        VideoMode[] modes = new VideoMode[num_modes];
        wxDisplay_GetModes(wxobj, mode, modes);
        return modes;
    }


    //------------------------------------------------------------------------

    public static цел GetFromPoint(Точка тчк)
    {
        return wxDisplay_GetFromPoint(тчк);
    }

    //------------------------------------------------------------------------

     public цел GetFromWindow(Окно окно)
    {
        version(__WXMSW__)
        {
            return wxDisplay_GetFromWindow(wxObject.SafePtr(окно));
        }
        else
        {
            throw new Exception("Display.GetFromWindow доступен только на WIN32");
        } // version(__WXMSW__)
    }

    //------------------------------------------------------------------------

     public Прямоугольник Geometry()
    {
        Прямоугольник прям;
        wxDisplay_GetGeometry(wxobj, прям);
        return прям;
    }

    //------------------------------------------------------------------------

     public ткст Имя()
    {
        return cast(ткст) new wxString(wxDisplay_GetName(wxobj), да);
    }

    //------------------------------------------------------------------------

     public бул IsPrimary()
    {
        return wxDisplay_IsPrimary(wxobj);
    }

    //------------------------------------------------------------------------


     public VideoMode CurrentMode()
    {
        VideoMode mode;
        wxDisplay_GetCurrentMode(wxobj, mode);
        return mode;
    }

    //------------------------------------------------------------------------

     public бул ChangeMode(VideoMode mode)
    {
        return wxDisplay_ChangeMode(wxobj, mode);
    }

    //------------------------------------------------------------------------

     public проц ResetMode()
    {
        wxDisplay_ResetMode(wxobj);
    }

    //------------------------------------------------------------------------

}

