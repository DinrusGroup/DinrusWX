//-----------------------------------------------------------------------------
// wxD - DockArt.d
// (C) 2006 David Gileadi
//
/// The wxAUI wrapper class.
//
// Written by David Gileadi <gileadis@gmail.com>
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DockArt.d,v 1.4 2007/12/07 13:41:27 afb Exp $
//-----------------------------------------------------------------------------

module wx.aui.DockArt;

public import wx.aui.FrameManager;

public import wx.wx;

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) alias цел function(DockArt объ, цел ид) Virtual_GetMetric;
extern (C) alias проц function(DockArt объ, цел ид, цел new_val) Virtual_SetMetric;
extern (C) alias проц function(DockArt объ, цел ид, ЦелУкз шрифт) Virtual_SetFont;
extern (C) alias ЦелУкз function(DockArt объ, цел ид) Virtual_GetFont;
extern (C) alias ЦелУкз function(DockArt объ, цел ид) Virtual_GetColour;
extern (C) alias проц function(DockArt объ, цел ид, ЦелУкз цвет) Virtual_SetColour;
extern (C) alias ЦелУкз function(DockArt объ, цел ид) Virtual_GetColor;
extern (C) alias проц function(DockArt объ, цел ид, ЦелУкз color) Virtual_SetColor;
extern (C) alias проц function(DockArt объ, ЦелУкз dc, цел orientation, inout Прямоугольник прям) Virtual_DrawSash;
extern (C) alias проц function(DockArt объ, ЦелУкз dc, цел orientation, inout Прямоугольник прям) Virtual_DrawBackground;
extern (C) alias проц function(DockArt объ, ЦелУкз dc, ткст текст, inout Прямоугольник прям, ЦелУкз pane) Virtual_DrawCaption;
extern (C) alias проц function(DockArt объ, ЦелУкз dc, inout Прямоугольник прям, ЦелУкз pane) Virtual_DrawGripper;
extern (C) alias проц function(DockArt объ, ЦелУкз dc, inout Прямоугольник прям, ЦелУкз pane) Virtual_DrawBorder;
extern (C) alias проц function(DockArt объ, ЦелУкз dc, цел button, цел button_state, inout Прямоугольник прям, ЦелУкз pane) Virtual_DrawPaneButton;

//-----------------------------------------------------------------------------

static extern (C) ЦелУкз wxDockArt_ctor();
static extern (C) проц wxDockArt_dtor(ЦелУкз сам);
static extern (C) ЦелУкз wxDefaultDockArt_ctor();
static extern (C) проц wxDefaultDockArt_dtor(ЦелУкз сам);
static extern (C) проц wxDockArt_RegisterVirtual(ЦелУкз сам, DockArt объ,
        Virtual_GetMetric getMetric,
        Virtual_SetMetric setMetric,
        Virtual_SetFont setFont,
        Virtual_GetFont getFont,
        Virtual_GetColour getColour,
        Virtual_SetColour setColour,
        Virtual_GetColor getColor,
        Virtual_SetColor setColor,
        Virtual_DrawSash drawSash,
        Virtual_DrawBackground drawBackground,
        Virtual_DrawCaption drawCaption,
        Virtual_DrawGripper drawGripper,
        Virtual_DrawBorder drawBorder,
        Virtual_DrawPaneButton drawPaneButton);
static extern (C) цел wxDockArt_GetMetric(ЦелУкз сам, цел ид);
static extern (C) проц wxDockArt_SetMetric(ЦелУкз сам, цел ид, цел new_val);
static extern (C) проц wxDockArt_SetFont(ЦелУкз сам, цел ид, ЦелУкз шрифт);
static extern (C) ЦелУкз wxDockArt_GetFont(ЦелУкз сам, цел ид);
static extern (C) ЦелУкз wxDockArt_GetColour(ЦелУкз сам, цел ид);
static extern (C) проц wxDockArt_SetColour(ЦелУкз сам, цел ид, ЦелУкз цвет);
static extern (C) ЦелУкз wxDockArt_GetColor(ЦелУкз сам, цел ид);
static extern (C) проц wxDockArt_SetColor(ЦелУкз сам, цел ид, ЦелУкз color);
static extern (C) проц wxDockArt_DrawSash(ЦелУкз сам, ЦелУкз dc, цел orientation, inout Прямоугольник прям);
static extern (C) проц wxDockArt_DrawBackground(ЦелУкз сам, ЦелУкз dc, цел orientation, inout Прямоугольник прям);
static extern (C) проц wxDockArt_DrawCaption(ЦелУкз сам, ЦелУкз dc, ткст текст, inout Прямоугольник прям, ЦелУкз pane);
static extern (C) проц wxDockArt_DrawGripper(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, ЦелУкз pane);
static extern (C) проц wxDockArt_DrawBorder(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, ЦелУкз pane);
static extern (C) проц wxDockArt_DrawPaneButton(ЦелУкз сам, ЦелУкз dc, цел button, цел button_state, inout Прямоугольник прям, ЦелУкз pane);
//! \endcond

//-----------------------------------------------------------------------------

alias DockArt wxDockArt;
/// dock art provider code - a dock provider provides all drawing
/// functionality to the wxAui dock manager.  This allows the dock
/// manager to have plugable look-and-feels
public class DockArt : wxObject
{
    ЦелУкз proxy;

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
        proxy = wxDockArt_ctor();
        wxDockArt_RegisterVirtual(proxy, this,
                                  &staticGetMetric,
                                  &staticУстMetric,
                                  &staticУстFont,
                                  &staticGetFont,
                                  &staticGetColour,
                                  &staticУстColour,
                                  &staticGetColor,
                                  &staticУстColor,
                                  &staticDrawSash,
                                  &staticDrawBackground,
                                  &staticDrawCaption,
                                  &staticDrawGripper,
                                  &staticDrawBorder,
                                  &staticDrawPaneButton);
    }

    override protected проц dtor()
    {
        wxDockArt_dtor(proxy);
    }

    extern (C) protected static цел staticGetMetric(DockArt объ, цел ид)
    {
        return объ.GetMetric(ид);
    }
    extern (C) protected static проц staticУстMetric(DockArt объ, цел ид, цел new_val)
    {
        объ.УстMetric(ид, new_val);
    }
    extern (C) protected static проц staticУстFont(DockArt объ, цел ид, ЦелУкз шрифт)
    {
        wxObject o = НайдиОбъект(шрифт);
        Шрифт f = (o)? cast(Шрифт)o : new Шрифт(шрифт);
        объ.УстFont(ид, f);
    }
    extern (C) protected static ЦелУкз staticGetFont(DockArt объ, цел ид)
    {
        return wxObject.SafePtr(объ.GetFont(ид));
    }
    extern (C) protected static ЦелУкз staticGetColour(DockArt объ, цел ид)
    {
        return wxObject.SafePtr(объ.GetColour(ид));
    }
    extern (C) protected static проц staticУстColour(DockArt объ, цел ид, ЦелУкз цвет)
    {
        wxObject o = НайдиОбъект(цвет);
        Цвет c = (o)? cast(Цвет)o : new Цвет(цвет);
        объ.УстColour(ид, c);
    }
    extern (C) protected static ЦелУкз staticGetColor(DockArt объ, цел ид)
    {
        return wxObject.SafePtr(объ.GetColor(ид));
    }
    extern (C) protected static проц staticУстColor(DockArt объ, цел ид, ЦелУкз color)
    {
        wxObject o = НайдиОбъект(color);
        Цвет c = (o)? cast(Цвет)o : new Цвет(color);
        объ.УстColor(ид, c);
    }
    extern (C) protected static проц staticDrawSash(DockArt объ, ЦелУкз dc, цел orientation, inout Прямоугольник прям)
    {
        wxObject o = НайдиОбъект(dc);
        DC d = (o)? cast(DC)o : new DC(dc);
        объ.DrawSash(d, orientation, прям);
    }
    extern (C) protected static проц staticDrawBackground(DockArt объ, ЦелУкз dc, цел orientation, inout Прямоугольник прям)
    {
        wxObject o = НайдиОбъект(dc);
        DC d = (o)? cast(DC)o : new DC(dc);
        объ.DrawBackground(d, orientation, прям);
    }
    extern (C) protected static проц staticDrawCaption(DockArt объ, ЦелУкз dc, ткст текст, inout Прямоугольник прям, ЦелУкз pane)
    {
        wxObject o = НайдиОбъект(dc);
        DC d = (o)? cast(DC)o : new DC(dc);
        o = НайдиОбъект(pane);
        PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
        объ.DrawCaption(d, текст, прям, p);
    }
    extern (C) protected static проц staticDrawGripper(DockArt объ, ЦелУкз dc, inout Прямоугольник прям, ЦелУкз pane)
    {
        wxObject o = НайдиОбъект(dc);
        DC d = (o)? cast(DC)o : new DC(dc);
        o = НайдиОбъект(pane);
        PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
        объ.DrawGripper(d, прям, p);
    }
    extern (C) protected static проц staticDrawBorder(DockArt объ, ЦелУкз dc, inout Прямоугольник прям, ЦелУкз pane)
    {
        wxObject o = НайдиОбъект(dc);
        DC d = (o)? cast(DC)o : new DC(dc);
        o = НайдиОбъект(pane);
        PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
        объ.DrawBorder(d, прям, p);
    }
    extern (C) protected static проц staticDrawPaneButton(DockArt объ, ЦелУкз dc, цел button, цел button_state, inout Прямоугольник прям, ЦелУкз pane)
    {
        wxObject o = НайдиОбъект(dc);
        DC d = (o)? cast(DC)o : new DC(dc);
        o = НайдиОбъект(pane);
        PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
        объ.DrawPaneButton(d, button, button_state, прям, p);
    }

    public цел GetMetric(цел ид)
    {
        return wxDockArt_GetMetric(wxobj, ид);
    }
    public проц УстMetric(цел ид, цел new_val)
    {
        wxDockArt_SetMetric(wxobj, ид, new_val);
    }
    public проц УстFont(цел ид, wxFont шрифт)
    {
        wxDockArt_SetFont(wxobj, ид, wxObject.SafePtr(шрифт));
    }
    public Шрифт GetFont(цел ид)
    {
        ЦелУкз ptr = wxDockArt_GetFont(wxobj, ид);
        wxObject o = НайдиОбъект(ptr);
        return (o)? cast(Шрифт)o : new Шрифт(ptr);
    }
    public Цвет GetColour(цел ид)
    {
        ЦелУкз ptr = wxDockArt_GetColour(wxobj, ид);
        wxObject o = НайдиОбъект(ptr);
        return (o)? cast(Цвет)o : new Цвет(ptr);
    }
    public проц УстColour(цел ид, Цвет цвет)
    {
        wxDockArt_SetColour(wxobj, ид, wxObject.SafePtr(цвет));
    }
    public Цвет GetColor(цел ид)
    {
        ЦелУкз ptr = wxDockArt_GetColor(wxobj, ид);
        wxObject o = НайдиОбъект(ptr);
        return (o)? cast(Цвет)o : new Цвет(ptr);
    }
    public проц УстColor(цел ид, Цвет color)
    {
        wxDockArt_SetColor(wxobj, ид, wxObject.SafePtr(color));
    }
    public проц DrawSash(DC dc, цел orientation, Прямоугольник прям)
    {
        wxDockArt_DrawSash(wxobj, wxObject.SafePtr(dc), orientation, прям);
    }
    public проц DrawBackground(DC dc, цел orientation, Прямоугольник прям)
    {
        wxDockArt_DrawBackground(wxobj, wxObject.SafePtr(dc), orientation, прям);
    }
    public проц DrawCaption(DC dc, ткст текст, Прямоугольник прям, PaneInfo pane)
    {
        wxDockArt_DrawCaption(wxobj, wxObject.SafePtr(dc), текст, прям, wxObject.SafePtr(pane));
    }
    public проц DrawGripper(DC dc, Прямоугольник прям, PaneInfo pane)
    {
        wxDockArt_DrawGripper(wxobj, wxObject.SafePtr(dc), прям, wxObject.SafePtr(pane));
    }
    public проц DrawBorder(DC dc, Прямоугольник прям, PaneInfo pane)
    {
        wxDockArt_DrawBorder(wxobj, wxObject.SafePtr(dc), прям, wxObject.SafePtr(pane));
    }
    public проц DrawPaneButton(DC dc, цел button, цел button_state, Прямоугольник прям, PaneInfo pane)
    {
        wxDockArt_DrawPaneButton(wxobj, wxObject.SafePtr(dc), button, button_state, прям, wxObject.SafePtr(pane));
    }
}

alias DefaultDockArt wxDefaultDockArt;
/// this is the default art provider for wxFrameManager.  Dock art
/// can be customized by creating a class derived from this one.
public class DefaultDockArt : DockArt
{
    public this()
    {
        super(wxDefaultDockArt_ctor());
    }

    override protected проц dtor()
    {
        wxDefaultDockArt_dtor(wxobj);
    }
}
