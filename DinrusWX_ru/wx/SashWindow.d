//-----------------------------------------------------------------------------
// wxD - SashWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SashWindow.cs
//
/// The wxSashWindow wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SashWindow.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SashWindow;
public import wx.common;
public import wx.Window;
public import wx.CommandEvent;

public enum SashEdgePosition
{
    wxSASH_TOP = 0,
    wxSASH_RIGHT,
    wxSASH_BOTTOM,
    wxSASH_LEFT,
    wxSASH_NONE = 100
}

//-----------------------------------------------------------------------------

public enum SashDragStatus
{
    wxSASH_STATUS_OK,
    wxSASH_STATUS_OUT_OF_RANGE
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSashEdge_ctor();
static extern (C) проц wxSashEdge_dtor(ЦелУкз сам);
static extern (C) бул wxSashEdge_m_show(ЦелУкз сам);
static extern (C) бул wxSashEdge_m_border(ЦелУкз сам);
static extern (C) цел wxSashEdge_m_margin(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias SashEdge wxSashEdge;
public class SashEdge : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxSashEdge_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxSashEdge_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул m_show()
    {
        return wxSashEdge_m_show(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул m_border()
    {
        return wxSashEdge_m_border(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел m_margin()
    {
        return wxSashEdge_m_margin(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSashWindow_ctor();
static extern (C) бул wxSashWindow_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц wxSashWindow_SetSashVisible(ЦелУкз сам, SashEdgePosition edge, бул sash);
static extern (C) бул wxSashWindow_GetSashVisible(ЦелУкз сам, SashEdgePosition edge);
static extern (C) проц wxSashWindow_SetSashBorder(ЦелУкз сам, SashEdgePosition edge, бул бордюр);
static extern (C) бул wxSashWindow_HasBorder(ЦелУкз сам, SashEdgePosition edge);
static extern (C) цел wxSashWindow_GetEdgeMargin(ЦелУкз сам, SashEdgePosition edge);
static extern (C) проц wxSashWindow_SetDefaultBorderSize(ЦелУкз сам, цел ширь);
static extern (C) цел wxSashWindow_GetDefaultBorderSize(ЦелУкз сам);
static extern (C) проц wxSashWindow_SetExtraBorderSize(ЦелУкз сам, цел ширь);
static extern (C) цел wxSashWindow_GetExtraBorderSize(ЦелУкз сам);
static extern (C) проц wxSashWindow_SetMinimumSizeX(ЦелУкз сам, цел min);
static extern (C) проц wxSashWindow_SetMinimumSizeY(ЦелУкз сам, цел min);
static extern (C) цел wxSashWindow_GetMinimumSizeX(ЦелУкз сам);
static extern (C) цел wxSashWindow_GetMinimumSizeY(ЦелУкз сам);
static extern (C) проц wxSashWindow_SetMaximumSizeX(ЦелУкз сам, цел max);
static extern (C) проц wxSashWindow_SetMaximumSizeY(ЦелУкз сам, цел max);
static extern (C) цел wxSashWindow_GetMaximumSizeX(ЦелУкз сам);
static extern (C) цел wxSashWindow_GetMaximumSizeY(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias SashWindow wxSashWindow;
public class SashWindow : Окно
{
    enum
    {
        wxSW_NOBORDER	= 0x0000,
        wxSW_BORDER	= 0x0020,
        wxSW_3DSASH	= 0x0040,
        wxSW_3DBORDER	= 0x0080,
        wxSW_3D	= wxSW_3DSASH | wxSW_3DBORDER,
    }
    enum
    {
        wxSASH_DRAG_NONE	= 0,
        wxSASH_DRAG_DRAGGING	= 1,
        wxSASH_DRAG_LEFT_DOWN	= 2,
    }

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxSashWindow_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя="sashWindow")
    {
        super(wxSashWindow_ctor());
        if (!создай(родитель, ид, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать SashWindow");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя="sashWindow")
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxSashWindow_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public проц УстSashVisible(SashEdgePosition edge, бул sash)
    {
        wxSashWindow_SetSashVisible(wxobj, edge, sash);
    }

    //-----------------------------------------------------------------------------

    public бул GetSashVisible(SashEdgePosition edge)
    {
        return wxSashWindow_GetSashVisible(wxobj, edge);
    }

    //-----------------------------------------------------------------------------

    public проц УстSashBorder(SashEdgePosition edge, бул бордюр)
    {
        wxSashWindow_SetSashBorder(wxobj, edge, бордюр);
    }

    //-----------------------------------------------------------------------------

    public цел GetEdgeMargin(SashEdgePosition edge)
    {
        return wxSashWindow_GetEdgeMargin(wxobj, edge);
    }

    //-----------------------------------------------------------------------------

    public цел DefaultBorderSize()
    {
        return wxSashWindow_GetDefaultBorderSize(wxobj);
    }
    public проц DefaultBorderSize(цел значение)
    {
        wxSashWindow_SetDefaultBorderSize(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел ExtraBorderSize()
    {
        return wxSashWindow_GetExtraBorderSize(wxobj);
    }
    public проц ExtraBorderSize(цел значение)
    {
        wxSashWindow_SetExtraBorderSize(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел MinimumSizeX()
    {
        return wxSashWindow_GetMinimumSizeX(wxobj);
    }
    public проц MinimumSizeX(цел значение)
    {
        wxSashWindow_SetMinimumSizeX(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел MinimumSizeY()
    {
        return wxSashWindow_GetMinimumSizeY(wxobj);
    }
    public проц MinimumSizeY(цел значение)
    {
        wxSashWindow_SetMinimumSizeY(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел MaximumSizeX()
    {
        return wxSashWindow_GetMaximumSizeX(wxobj);
    }
    public проц MaximumSizeX(цел значение)
    {
        wxSashWindow_SetMaximumSizeX(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел MaximumSizeY()
    {
        return wxSashWindow_GetMaximumSizeY(wxobj);
    }
    public проц MaximumSizeY(цел значение)
    {
        wxSashWindow_SetMaximumSizeY(wxobj, значение);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSashEvent_ctor(цел ид, SashEdgePosition edge);
static extern (C) проц wxSashEvent_SetEdge(ЦелУкз сам, SashEdgePosition edge);
static extern (C) SashEdgePosition wxSashEvent_GetEdge(ЦелУкз сам);
static extern (C) проц wxSashEvent_SetDragRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) проц wxSashEvent_GetDragRect(ЦелУкз сам, out Прямоугольник прям);
static extern (C) проц wxSashEvent_SetDragStatus(ЦелУкз сам, SashDragStatus status);
static extern (C) SashDragStatus wxSashEvent_GetDragStatus(ЦелУкз сам);
//! \endcond

alias SashEvent wxSashEvent;
public class SashEvent : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(0, SashEdgePosition.wxSASH_NONE);
    }

    public this(цел ид)
    {
        this(ид, SashEdgePosition.wxSASH_NONE);
    }

    public this(цел ид, SashEdgePosition edge)
    {
        super(wxSashEvent_ctor(ид, edge));
    }

    //-----------------------------------------------------------------------------

    public SashEdgePosition Edge()
    {
        return wxSashEvent_GetEdge(wxobj);
    }
    public проц Edge(SashEdgePosition значение)
    {
        wxSashEvent_SetEdge(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public Прямоугольник DragRect()
    {
        Прямоугольник прям;
        wxSashEvent_GetDragRect(wxobj, прям);
        return прям;
    }
    public проц DragRect(Прямоугольник значение)
    {
        wxSashEvent_SetDragRect(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public SashDragStatus DragStatus()
    {
        return wxSashEvent_GetDragStatus(wxobj);
    }
    public проц DragStatus(SashDragStatus значение)
    {
        wxSashEvent_SetDragStatus(wxobj, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new SashEvent(объ);
    }

    static this()
    {
        wxEVT_SASH_DRAGGED = wxEvent_EVT_SASH_DRAGGED();

        ДобавьТипСоб(wxEVT_SASH_DRAGGED,                    &SashEvent.Нов);
    }
}
