module wx.aui.DockArt;
public import wx.aui.FrameManager;
public import wx.wx;

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) alias цел function(DockArt объ, цел ид) Virtual_GetMetric;
extern (C) alias проц function(DockArt объ, цел ид, цел new_val) Virtual_SetMetric;
extern (C) alias проц function(DockArt объ, цел ид, IntPtr шрифт) Virtual_SetFont;
extern (C) alias IntPtr function(DockArt объ, цел ид) Virtual_GetFont;
extern (C) alias IntPtr function(DockArt объ, цел ид) Virtual_GetColour;
extern (C) alias проц function(DockArt объ, цел ид, IntPtr цвет) Virtual_SetColour;
extern (C) alias IntPtr function(DockArt объ, цел ид) Virtual_GetColor;
extern (C) alias проц function(DockArt объ, цел ид, IntPtr color) Virtual_SetColor;
extern (C) alias проц function(DockArt объ, IntPtr dc, цел orientation, inout Прямоугольник прям) Virtual_DrawSash;
extern (C) alias проц function(DockArt объ, IntPtr dc, цел orientation, inout Прямоугольник прям) Virtual_DrawBackground;
extern (C) alias проц function(DockArt объ, IntPtr dc, ткст текст, inout Прямоугольник прям, IntPtr pane) Virtual_DrawCaption;
extern (C) alias проц function(DockArt объ, IntPtr dc, inout Прямоугольник прям, IntPtr pane) Virtual_DrawGripper;
extern (C) alias проц function(DockArt объ, IntPtr dc, inout Прямоугольник прям, IntPtr pane) Virtual_DrawBorder;
extern (C) alias проц function(DockArt объ, IntPtr dc, цел button, цел button_state, inout Прямоугольник прям, IntPtr pane) Virtual_DrawPaneButton;

//-----------------------------------------------------------------------------

static extern (C) IntPtr wxDockArt_ctor();
static extern (C) проц wxDockArt_dtor(IntPtr сам);
static extern (C) IntPtr wxDefaultDockArt_ctor();
static extern (C) проц wxDefaultDockArt_dtor(IntPtr сам);
static extern (C) проц wxDockArt_RegisterVirtual(IntPtr сам, DockArt объ,
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
static extern (C) цел wxDockArt_GetMetric(IntPtr сам, цел ид);
static extern (C) проц wxDockArt_SetMetric(IntPtr сам, цел ид, цел new_val);
static extern (C) проц wxDockArt_SetFont(IntPtr сам, цел ид, IntPtr шрифт);
static extern (C) IntPtr wxDockArt_GetFont(IntPtr сам, цел ид);
static extern (C) IntPtr wxDockArt_GetColour(IntPtr сам, цел ид);
static extern (C) проц wxDockArt_SetColour(IntPtr сам, цел ид, IntPtr цвет);
static extern (C) IntPtr wxDockArt_GetColor(IntPtr сам, цел ид);
static extern (C) проц wxDockArt_SetColor(IntPtr сам, цел ид, IntPtr color);
static extern (C) проц wxDockArt_DrawSash(IntPtr сам, IntPtr dc, цел orientation, inout Прямоугольник прям);
static extern (C) проц wxDockArt_DrawBackground(IntPtr сам, IntPtr dc, цел orientation, inout Прямоугольник прям);
static extern (C) проц wxDockArt_DrawCaption(IntPtr сам, IntPtr dc, ткст текст, inout Прямоугольник прям, IntPtr pane);
static extern (C) проц wxDockArt_DrawGripper(IntPtr сам, IntPtr dc, inout Прямоугольник прям, IntPtr pane);
static extern (C) проц wxDockArt_DrawBorder(IntPtr сам, IntPtr dc, inout Прямоугольник прям, IntPtr pane);
static extern (C) проц wxDockArt_DrawPaneButton(IntPtr сам, IntPtr dc, цел button, цел button_state, inout Прямоугольник прям, IntPtr pane);
//! \endcond

//-----------------------------------------------------------------------------

alias DockArt wxDockArt;
/// dock art provider code - a dock provider provides all drawing
/// functionality to the wxAui dock manager.  This allows the dock
/// manager to have plugable look-and-feels
public class DockArt : wxObject
{
	IntPtr proxy;

    public this(IntPtr wxobj);
    override protected проц dtor();
    extern (C) protected static цел staticGetMetric(DockArt объ, цел ид);
    extern (C) protected static проц staticУстMetric(DockArt объ, цел ид, цел new_val) ;
    extern (C) protected static проц staticУстFont(DockArt объ, цел ид, IntPtr шрифт);
    extern (C) protected static IntPtr staticGetFont(DockArt объ, цел ид) ;
    extern (C) protected static IntPtr staticGetColour(DockArt объ, цел ид) ;
    extern (C) protected static проц staticУстColour(DockArt объ, цел ид, IntPtr цвет);
    extern (C) protected static IntPtr staticGetColor(DockArt объ, цел ид);
    extern (C) protected static проц staticУстColor(DockArt объ, цел ид, IntPtr color);
    extern (C) protected static проц staticDrawSash(DockArt объ, IntPtr dc, цел orientation, inout Прямоугольник прям);
    extern (C) protected static проц staticDrawBackground(DockArt объ, IntPtr dc, цел orientation, inout Прямоугольник прям);
    extern (C) protected static проц staticDrawCaption(DockArt объ, IntPtr dc, ткст текст, inout Прямоугольник прям, IntPtr pane);
    extern (C) protected static проц staticDrawGripper(DockArt объ, IntPtr dc, inout Прямоугольник прям, IntPtr pane);
    extern (C) protected static проц staticDrawBorder(DockArt объ, IntPtr dc, inout Прямоугольник прям, IntPtr pane);
    extern (C) protected static проц staticDrawPaneButton(DockArt объ, IntPtr dc, цел button, цел button_state, inout Прямоугольник прям, IntPtr pane);
    public цел GetMetric(цел ид);
    public проц УстMetric(цел ид, цел new_val);
    public проц УстFont(цел ид, wxFont шрифт) ;
    public Шрифт GetFont(цел ид);
    public Цвет GetColour(цел ид);
    public проц УстColour(цел ид, Цвет цвет) ;
    public Цвет GetColor(цел ид);
    public проц УстColor(цел ид, Цвет color) ;
    public проц DrawSash(DC dc, цел orientation, Прямоугольник прям) ;
    public проц DrawBackground(DC dc, цел orientation, Прямоугольник прям);
    public проц DrawCaption(DC dc, ткст текст, Прямоугольник прям, PaneInfo pane) ;
    public проц DrawGripper(DC dc, Прямоугольник прям, PaneInfo pane);
    public проц DrawBorder(DC dc, Прямоугольник прям, PaneInfo pane);
    public проц DrawPaneButton(DC dc, цел button, цел button_state, Прямоугольник прям, PaneInfo pane);
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
