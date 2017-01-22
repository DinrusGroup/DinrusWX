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
extern (C) alias проц function(DockArt объ, цел ид, ЦУк шрифт) Virtual_SetFont;
extern (C) alias ЦУк function(DockArt объ, цел ид) Virtual_GetFont;
extern (C) alias ЦУк function(DockArt объ, цел ид) Virtual_GetColour;
extern (C) alias проц function(DockArt объ, цел ид, ЦУк colour) Virtual_SetColour;
extern (C) alias ЦУк function(DockArt объ, цел ид) Virtual_GetColor;
extern (C) alias проц function(DockArt объ, цел ид, ЦУк color) Virtual_SetColor;
extern (C) alias проц function(DockArt объ, ЦУк dc, цел orientation, inout Прямоугольник прям) Virtual_DrawSash;
extern (C) alias проц function(DockArt объ, ЦУк dc, цел orientation, inout Прямоугольник прям) Virtual_DrawBackground;
extern (C) alias проц function(DockArt объ, ЦУк dc, ткст текст, inout Прямоугольник прям, ЦУк pane) Virtual_DrawCaption;
extern (C) alias проц function(DockArt объ, ЦУк dc, inout Прямоугольник прям, ЦУк pane) Virtual_DrawGripper;
extern (C) alias проц function(DockArt объ, ЦУк dc, inout Прямоугольник прям, ЦУк pane) Virtual_DrawBorder;
extern (C) alias проц function(DockArt объ, ЦУк dc, цел button, цел button_state, inout Прямоугольник прям, ЦУк pane) Virtual_DrawPaneButton;

//-----------------------------------------------------------------------------

static extern (C) ЦУк wxDockArt_ctor();
static extern (C) проц wxDockArt_dtor(ЦУк сам);
static extern (C) ЦУк wxDefaultDockArt_ctor();
static extern (C) проц wxDefaultDockArt_dtor(ЦУк сам);
static extern (C) проц wxDockArt_RegisterVirtual(ЦУк сам, DockArt объ,
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
static extern (C) цел wxDockArt_GetMetric(ЦУк сам, цел ид);
static extern (C) проц wxDockArt_SetMetric(ЦУк сам, цел ид, цел new_val);
static extern (C) проц wxDockArt_SetFont(ЦУк сам, цел ид, ЦУк шрифт);
static extern (C) ЦУк wxDockArt_GetFont(ЦУк сам, цел ид);
static extern (C) ЦУк wxDockArt_GetColour(ЦУк сам, цел ид);
static extern (C) проц wxDockArt_SetColour(ЦУк сам, цел ид, ЦУк colour);
static extern (C) ЦУк wxDockArt_GetColor(ЦУк сам, цел ид);
static extern (C) проц wxDockArt_SetColor(ЦУк сам, цел ид, ЦУк color);
static extern (C) проц wxDockArt_DrawSash(ЦУк сам, ЦУк dc, цел orientation, inout Прямоугольник прям);
static extern (C) проц wxDockArt_DrawBackground(ЦУк сам, ЦУк dc, цел orientation, inout Прямоугольник прям);
static extern (C) проц wxDockArt_DrawCaption(ЦУк сам, ЦУк dc, ткст текст, inout Прямоугольник прям, ЦУк pane);
static extern (C) проц wxDockArt_DrawGripper(ЦУк сам, ЦУк dc, inout Прямоугольник прям, ЦУк pane);
static extern (C) проц wxDockArt_DrawBorder(ЦУк сам, ЦУк dc, inout Прямоугольник прям, ЦУк pane);
static extern (C) проц wxDockArt_DrawPaneButton(ЦУк сам, ЦУк dc, цел button, цел button_state, inout Прямоугольник прям, ЦУк pane);
//! \endcond

//-----------------------------------------------------------------------------

alias DockArt wxDockArt;
/// dock art provider code - a dock provider provides all drawing
/// functionality to the wxAui dock manager.  This allows the dock
/// manager to have plugable look-and-feels
public class DockArt : wxObject
{
	ЦУк proxy;

    public this(ЦУк шхобъ)
    {
      super(шхобъ);
      proxy = wxDockArt_ctor();
      wxDockArt_RegisterVirtual(proxy, this,
                      &staticGetMetric,
                      &staticSetMetric,
                      &staticSetFont,
                      &staticGetFont,
                      &staticGetColour,
                      &staticSetColour,
                      &staticGetColor,
                      &staticSetColor,
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
	
    extern (C) protected static цел staticGetMetric(DockArt объ, цел ид) { return объ.GetMetric(ид); }
    extern (C) protected static проц staticSetMetric(DockArt объ, цел ид, цел new_val) { объ.SetMetric(ид, new_val); }
    extern (C) protected static проц staticSetFont(DockArt объ, цел ид, ЦУк шрифт)
    {
      wxObject o = FindObject(шрифт);
      Шрифт f = (o)? cast(Шрифт)o : new Шрифт(шрифт);
      объ.SetFont(ид, f);
    }
    extern (C) protected static ЦУк staticGetFont(DockArt объ, цел ид) { return wxObject.SafePtr(объ.GetFont(ид)); }
    extern (C) protected static ЦУк staticGetColour(DockArt объ, цел ид) { return wxObject.SafePtr(объ.GetColour(ид)); }
    extern (C) protected static проц staticSetColour(DockArt объ, цел ид, ЦУк colour)
    {
      wxObject o = FindObject(colour);
      Цвет c = (o)? cast(Цвет)o : new Цвет(colour);
      объ.УстЦвет(ид, c);
    }
    extern (C) protected static ЦУк staticGetColor(DockArt объ, цел ид) { return wxObject.SafePtr(объ.GetColor(ид)); }
    extern (C) protected static проц staticSetColor(DockArt объ, цел ид, ЦУк color)
    {
      wxObject o = FindObject(color);
      Цвет c = (o)? cast(Цвет)o : new Цвет(color);
      объ.SetColor(ид, c);
    }
    extern (C) protected static проц staticDrawSash(DockArt объ, ЦУк dc, цел orientation, inout Прямоугольник прям)
    {
      wxObject o = FindObject(dc);
      DC d = (o)? cast(DC)o : new DC(dc);
      объ.DrawSash(d, orientation, прям);
    }
    extern (C) protected static проц staticDrawBackground(DockArt объ, ЦУк dc, цел orientation, inout Прямоугольник прям)
    {
      wxObject o = FindObject(dc);
      DC d = (o)? cast(DC)o : new DC(dc);
      объ.DrawBackground(d, orientation, прям);
    }
    extern (C) protected static проц staticDrawCaption(DockArt объ, ЦУк dc, ткст текст, inout Прямоугольник прям, ЦУк pane)
    {
      wxObject o = FindObject(dc);
      DC d = (o)? cast(DC)o : new DC(dc);
      o = FindObject(pane);
      PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
      объ.DrawCaption(d, текст, прям, p);
    }
    extern (C) protected static проц staticDrawGripper(DockArt объ, ЦУк dc, inout Прямоугольник прям, ЦУк pane)
    {
      wxObject o = FindObject(dc);
      DC d = (o)? cast(DC)o : new DC(dc);
      o = FindObject(pane);
      PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
      объ.DrawGripper(d, прям, p);
    }
    extern (C) protected static проц staticDrawBorder(DockArt объ, ЦУк dc, inout Прямоугольник прям, ЦУк pane)
    {
      wxObject o = FindObject(dc);
      DC d = (o)? cast(DC)o : new DC(dc);
      o = FindObject(pane);
      PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
      объ.DrawBorder(d, прям, p);
    }
    extern (C) protected static проц staticDrawPaneButton(DockArt объ, ЦУк dc, цел button, цел button_state, inout Прямоугольник прям, ЦУк pane)
    {
      wxObject o = FindObject(dc);
      DC d = (o)? cast(DC)o : new DC(dc);
      o = FindObject(pane);
      PaneInfo p = (o)? cast(PaneInfo)o : new PaneInfo(pane);
      объ.DrawPaneButton(d, button, button_state, прям, p);
    }

    public цел GetMetric(цел ид) { return wxDockArt_GetMetric(шхобъ, ид); }
    public проц SetMetric(цел ид, цел new_val) { wxDockArt_SetMetric(шхобъ, ид, new_val); }
    public проц SetFont(цел ид, wxFont шрифт) { wxDockArt_SetFont(шхобъ, ид, wxObject.SafePtr(шрифт)); }
    public Шрифт GetFont(цел ид)
    {
      ЦУк ptr = wxDockArt_GetFont(шхобъ, ид);
      wxObject o = FindObject(ptr);
      return (o)? cast(Шрифт)o : new Шрифт(ptr);
    }
    public Цвет GetColour(цел ид)
    {
      ЦУк ptr = wxDockArt_GetColour(шхобъ, ид);
      wxObject o = FindObject(ptr);
      return (o)? cast(Цвет)o : new Цвет(ptr);
    }
    public проц УстЦвет(цел ид, Цвет colour) { wxDockArt_SetColour(шхобъ, ид, wxObject.SafePtr(colour)); }
    public Цвет GetColor(цел ид)
    {
      ЦУк ptr = wxDockArt_GetColor(шхобъ, ид);
      wxObject o = FindObject(ptr);
      return (o)? cast(Цвет)o : new Цвет(ptr);
    }
    public проц SetColor(цел ид, Цвет color) { wxDockArt_SetColor(шхобъ, ид, wxObject.SafePtr(color)); }
    public проц DrawSash(DC dc, цел orientation, Прямоугольник прям) { wxDockArt_DrawSash(шхобъ, wxObject.SafePtr(dc), orientation, прям); }
    public проц DrawBackground(DC dc, цел orientation, Прямоугольник прям) { wxDockArt_DrawBackground(шхобъ, wxObject.SafePtr(dc), orientation, прям); }
    public проц DrawCaption(DC dc, ткст текст, Прямоугольник прям, PaneInfo pane) { wxDockArt_DrawCaption(шхобъ, wxObject.SafePtr(dc), текст, прям, wxObject.SafePtr(pane)); }
    public проц DrawGripper(DC dc, Прямоугольник прям, PaneInfo pane) { wxDockArt_DrawGripper(шхобъ, wxObject.SafePtr(dc), прям, wxObject.SafePtr(pane)); }
    public проц DrawBorder(DC dc, Прямоугольник прям, PaneInfo pane) { wxDockArt_DrawBorder(шхобъ, wxObject.SafePtr(dc), прям, wxObject.SafePtr(pane)); }
    public проц DrawPaneButton(DC dc, цел button, цел button_state, Прямоугольник прям, PaneInfo pane) { wxDockArt_DrawPaneButton(шхобъ, wxObject.SafePtr(dc), button, button_state, прям, wxObject.SafePtr(pane)); }
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
      wxDefaultDockArt_dtor(шхобъ);
	}
}
