//-----------------------------------------------------------------------------
// wxD - SplitterWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SplitterWindow.cs
//
/// The wxSplitterWindow wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SplitterWindow.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.SplitterWindow;
public import wx.common;
public import wx.Window;

public enum SplitMode
{
    wxSPLIT_HORIZONTAL	= 1,
    wxSPLIT_VERTICAL
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(SplitterWindow объ, цел x, цел y) Virtual_OnDoubleClickSash;
    alias проц function(SplitterWindow объ, ЦелУкз removed) Virtual_OnUnsplit;
    alias бул function(SplitterWindow объ, цел newSashPosition) Virtual_OnSashPositionChange;
}

static extern (C) ЦелУкз wxSplitWnd_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц   wxSplitWnd_RegisterVirtual(ЦелУкз сам, SplitterWindow объ, Virtual_OnDoubleClickSash onDoubleClickSash, Virtual_OnUnsplit onUnsplit, Virtual_OnSashPositionChange onSashPositionChange);
static extern (C) проц   wxSplitWnd_OnDoubleClickSash(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxSplitWnd_OnUnsplit(ЦелУкз сам, ЦелУкз removed);
static extern (C) бул   wxSplitWnd_OnSashPositionChange(ЦелУкз сам, цел newSashPosition);
static extern (C) цел    wxSplitWnd_GetSplitMode(ЦелУкз сам);
static extern (C) бул   wxSplitWnd_IsSplit(ЦелУкз сам);
static extern (C) бул   wxSplitWnd_SplitHorizontally(ЦелУкз сам, ЦелУкз wnd1, ЦелУкз wnd2, цел sashPos);
static extern (C) бул   wxSplitWnd_SplitVertically(ЦелУкз сам, ЦелУкз wnd1, ЦелУкз wnd2, цел sashPos);
static extern (C) бул   wxSplitWnd_Unsplit(ЦелУкз сам, ЦелУкз toRemove);
static extern (C) проц   wxSplitWnd_SetSashPosition(ЦелУкз сам, цел position, бул redraw);
static extern (C) цел    wxSplitWnd_GetSashPosition(ЦелУкз сам);

static extern (C) цел    wxSplitWnd_GetMinimumPaneSize(ЦелУкз сам);
static extern (C) ЦелУкз wxSplitWnd_GetWindow1(ЦелУкз сам);
static extern (C) ЦелУкз wxSplitWnd_GetWindow2(ЦелУкз сам);
static extern (C) проц   wxSplitWnd_Initialize(ЦелУкз сам, ЦелУкз окно);
static extern (C) бул   wxSplitWnd_ReplaceWindow(ЦелУкз сам, ЦелУкз winOld, ЦелУкз winNew);
static extern (C) проц   wxSplitWnd_SetMinimumPaneSize(ЦелУкз сам, цел paneSize);
static extern (C) проц   wxSplitWnd_SetSplitMode(ЦелУкз сам, цел mode);
static extern (C) проц   wxSplitWnd_UpdateSize(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias SplitterWindow wxSplitterWindow;
public class SplitterWindow : Окно
{
    enum
    {
        wxSP_3DBORDER		= 0x00000200,
        wxSP_LIVE_UPDATE	= 0x00000080,
        wxSP_3DSASH		= 0x00000100,
        wxSP_3D			= (wxSP_3DBORDER | wxSP_3DSASH),
    }

    //---------------------------------------------------------------------

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSP_3D, ткст имя="splitter")
    {
        super(wxSplitWnd_ctor(wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя));

        wxSplitWnd_RegisterVirtual(wxobj, this, &staticOnDoubleClickSash, &staticDoOnUnsplit, &staticOnSashPositionChange);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxSP_3D, ткст имя="splitter")
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    static extern(C) private проц staticOnDoubleClickSash(SplitterWindow объ, цел x, цел y)
    {
        объ.OnDoubleClickSash(x, y);
    }
    public  проц OnDoubleClickSash(цел x, цел y)
    {
        wxSplitWnd_OnDoubleClickSash(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    static extern(C) private проц staticDoOnUnsplit(SplitterWindow объ, ЦелУкз removed)
    {
        объ.OnUnsplit(cast(Окно)НайдиОбъект(removed));
    }

    public  проц OnUnsplit(Окно removed)
    {
        wxSplitWnd_OnUnsplit(wxobj, wxObject.SafePtr(removed));
    }

    //---------------------------------------------------------------------

    static extern(C) private бул staticOnSashPositionChange(SplitterWindow объ, цел newSashPosition)
    {
        return объ.OnSashPositionChange(newSashPosition);
    }
    public  бул OnSashPositionChange(цел newSashPosition)
    {
        return wxSplitWnd_OnSashPositionChange(wxobj, newSashPosition);
    }

    //---------------------------------------------------------------------

    public бул IsSplit()
    {
        return wxSplitWnd_IsSplit(wxobj);
    }

    //---------------------------------------------------------------------

    public бул SplitHorizontally(Окно wnd1, Окно wnd2, цел sashPos=0)
    {
        return wxSplitWnd_SplitHorizontally(wxobj, wxObject.SafePtr(wnd1), wxObject.SafePtr(wnd2), sashPos);
    }

    //---------------------------------------------------------------------

    public SplitMode splitMode()
    {
        return cast(SplitMode)wxSplitWnd_GetSplitMode(wxobj);
    }
    public проц splitMode(SplitMode значение)
    {
        wxSplitWnd_SetSplitMode(wxobj, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    public бул SplitVertically(Окно wnd1, Окно wnd2, цел sashPos=0)
    {
        return wxSplitWnd_SplitVertically(wxobj, wxObject.SafePtr(wnd1), wxObject.SafePtr(wnd2), sashPos);
    }

    //---------------------------------------------------------------------

    public бул Unsplit(Окно toRemove=null)
    {
        return wxSplitWnd_Unsplit(wxobj, wxObject.SafePtr(toRemove));
    }

    //---------------------------------------------------------------------

    public проц SashPosition(цел значение)
    {
        УстSashPosition(значение, да);
    }
    public цел SashPosition()
    {
        return wxSplitWnd_GetSashPosition(wxobj);
    }

    public проц УстSashPosition(цел position, бул redraw=да)
    {
        wxSplitWnd_SetSashPosition(wxobj, position, redraw);
    }

    //---------------------------------------------------------------------

    public цел MinimumPaneSize()
    {
        return wxSplitWnd_GetMinimumPaneSize(wxobj);
    }
    public проц MinimumPaneSize(цел значение)
    {
        wxSplitWnd_SetMinimumPaneSize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public static wxObject myNew(ЦелУкз ptr)
    {
        return new Окно(ptr);
    }
    public Окно Window1()
    {
        return cast(Окно)НайдиОбъект(wxSplitWnd_GetWindow1(wxobj), &myNew);
    }

    //---------------------------------------------------------------------

    public Окно Window2()
    {
        return cast(Окно)НайдиОбъект(wxSplitWnd_GetWindow2(wxobj), &myNew);
    }

    //---------------------------------------------------------------------

    public проц Инициализируй(Окно окно)
    {
        wxSplitWnd_Initialize(wxobj, wxObject.SafePtr(окно));
    }

    //---------------------------------------------------------------------

    public бул ReplaceWindow(Окно winOld, Окно winNew)
    {
        return wxSplitWnd_ReplaceWindow(wxobj, wxObject.SafePtr(winOld), wxObject.SafePtr(winNew));
    }

    //---------------------------------------------------------------------

    public проц UpdateSize()
    {
        wxSplitWnd_UpdateSize(wxobj);
    }
}
