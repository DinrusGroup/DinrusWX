//-----------------------------------------------------------------------------
// wxD - LayoutWin.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - LayoutWin.cs
//
/// The wxSashLayoutWindow proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: LayoutWin.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.LayoutWin;
public import wx.common;
public import wx.SashWindow;
public import wx.Event;
public import wx.Frame;
public import wx.MDI;

public enum LayoutOrientation
{
    wxLAYOUT_HORIZONTAL,
    wxLAYOUT_VERTICAL
}

//-----------------------------------------------------------------------------

public enum LayoutAlignment
{
    wxLAYOUT_NONE,
    wxLAYOUT_TOP,
    wxLAYOUT_LEFT,
    wxLAYOUT_RIGHT,
    wxLAYOUT_BOTTOM
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxSashLayoutWindow_ctor();
static extern (C) бул wxSashLayoutWindow_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) LayoutAlignment wxSashLayoutWindow_GetAlignment(ЦелУкз сам);
static extern (C) LayoutOrientation wxSashLayoutWindow_GetOrientation(ЦелУкз сам);
static extern (C) проц wxSashLayoutWindow_SetAlignment(ЦелУкз сам, LayoutAlignment alignment);
static extern (C) проц wxSashLayoutWindow_SetOrientation(ЦелУкз сам, LayoutOrientation ориент);
static extern (C) проц wxSashLayoutWindow_SetDefaultSize(ЦелУкз сам, inout Размер Размер);
//! \endcond

//-----------------------------------------------------------------------------

alias SashLayoutWindow wxSashLayoutWindow;
public class SashLayoutWindow : SashWindow
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxSashLayoutWindow_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя = "layoutWindow")
    {
        super(wxSashLayoutWindow_ctor());
        if (!создай(родитель, ид, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать SashLayoutWindow");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль=wxSW_3D|wxCLIP_CHILDREN, ткст имя = "layoutWindow")
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxSashLayoutWindow_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public LayoutAlignment Alignment()
    {
        return wxSashLayoutWindow_GetAlignment(wxobj);
    }
    public проц Alignment(LayoutAlignment значение)
    {
        wxSashLayoutWindow_SetAlignment(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public LayoutOrientation Ориентация()
    {
        return wxSashLayoutWindow_GetOrientation(wxobj);
    }
    public проц Ориентация(LayoutOrientation значение)
    {
        wxSashLayoutWindow_SetOrientation(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц DefaultSize(Размер значение)
    {
        wxSashLayoutWindow_SetDefaultSize(wxobj, значение);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxLayoutAlgorithm_ctor();
static extern (C) бул wxLayoutAlgorithm_LayoutMDIFrame(ЦелУкз сам, ЦелУкз frame, inout Прямоугольник прям);
static extern (C) бул wxLayoutAlgorithm_LayoutFrame(ЦелУкз сам, ЦелУкз frame, ЦелУкз mainWindow);
static extern (C) бул wxLayoutAlgorithm_LayoutWindow(ЦелУкз сам, ЦелУкз frame, ЦелУкз mainWindow);
//! \endcond

//-----------------------------------------------------------------------------

alias LayoutAlgorithm wxLayoutAlgorithm;
public class LayoutAlgorithm : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxLayoutAlgorithm_ctor());
    }

    //-----------------------------------------------------------------------------

    public бул LayoutMDIFrame(MDIParentFrame frame)
    {
        // FIXME
        Прямоугольник dummy;
        return LayoutMDIFrame(frame, dummy);
    }

    public бул LayoutMDIFrame(MDIParentFrame frame, Прямоугольник прям)
    {
        return wxLayoutAlgorithm_LayoutMDIFrame(wxobj, wxObject.SafePtr(frame), прям);
    }

    //-----------------------------------------------------------------------------

    public бул LayoutFrame(Frame frame)
    {
        return LayoutFrame(frame, null);
    }

    public бул LayoutFrame(Frame frame, Окно mainWindow)
    {
        return wxLayoutAlgorithm_LayoutFrame(wxobj, wxObject.SafePtr(frame), wxObject.SafePtr(mainWindow));
    }

    //-----------------------------------------------------------------------------

    public бул LayoutWindow(Окно frame)
    {
        return LayoutWindow(frame, null);
    }

    public бул LayoutWindow(Окно frame, Окно mainWindow)
    {
        return wxLayoutAlgorithm_LayoutWindow(wxobj, wxObject.SafePtr(frame), wxObject.SafePtr(mainWindow));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxQueryLayoutInfoEvent_ctor(цел ид);
static extern (C) проц wxQueryLayoutInfoEvent_SetRequestedLength(ЦелУкз сам, цел length);
static extern (C) цел wxQueryLayoutInfoEvent_GetRequestedLength(ЦелУкз сам);
static extern (C) проц wxQueryLayoutInfoEvent_SetФлаги(ЦелУкз сам, цел флаги);
static extern (C) цел wxQueryLayoutInfoEvent_GetFlags(ЦелУкз сам);
static extern (C) проц wxQueryLayoutInfoEvent_SetSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц wxQueryLayoutInfoEvent_GetSize(ЦелУкз сам, out Размер Размер);
static extern (C) проц wxQueryLayoutInfoEvent_SetOrientation(ЦелУкз сам, LayoutOrientation ориент);
static extern (C) LayoutOrientation wxQueryLayoutInfoEvent_GetOrientation(ЦелУкз сам);
static extern (C) проц wxQueryLayoutInfoEvent_SetAlignment(ЦелУкз сам, LayoutAlignment alignment);
static extern (C) LayoutAlignment wxQueryLayoutInfoEvent_GetAlignment(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias QueryLayoutInfoEvent wxQueryLayoutInfoEvent;
public class QueryLayoutInfoEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(0);
    }

    public this(цел ид)
    {
        super(wxQueryLayoutInfoEvent_ctor(ид));
    }

    //-----------------------------------------------------------------------------

    public цел RequestedLength()
    {
        return wxQueryLayoutInfoEvent_GetRequestedLength(wxobj);
    }
    public проц RequestedLength(цел значение)
    {
        wxQueryLayoutInfoEvent_SetRequestedLength(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел Флаги()
    {
        return wxQueryLayoutInfoEvent_GetFlags(wxobj);
    }
    public проц Флаги(цел значение)
    {
        wxQueryLayoutInfoEvent_SetФлаги(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public Размер размер()
    {
        Размер размер;
        wxQueryLayoutInfoEvent_GetSize(wxobj, размер);
        return размер;
    }
    public проц размер(Размер значение)
    {
        wxQueryLayoutInfoEvent_SetSize(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public LayoutOrientation Ориентация()
    {
        return wxQueryLayoutInfoEvent_GetOrientation(wxobj);
    }
    public проц Ориентация(LayoutOrientation значение)
    {
        wxQueryLayoutInfoEvent_SetOrientation(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public LayoutAlignment Alignment()
    {
        return wxQueryLayoutInfoEvent_GetAlignment(wxobj);
    }
    public проц Alignment(LayoutAlignment значение)
    {
        wxQueryLayoutInfoEvent_SetAlignment(wxobj, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new QueryLayoutInfoEvent(объ);
    }

    static this()
    {
        wxEVT_QUERY_LAYOUT_INFO = wxEvent_EVT_QUERY_LAYOUT_INFO();

        ДобавьТипСоб(wxEVT_QUERY_LAYOUT_INFO,               &QueryLayoutInfoEvent.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxCalculateLayoutEvent_ctor(цел ид);
static extern (C) проц wxCalculateLayoutEvent_SetФлаги(ЦелУкз сам, цел флаги);
static extern (C) цел wxCalculateLayoutEvent_GetFlags(ЦелУкз сам);
static extern (C) проц wxCalculateLayoutEvent_SetRect(ЦелУкз сам, inout Прямоугольник прям);
static extern (C) проц wxCalculateLayoutEvent_GetRect(ЦелУкз сам, out Прямоугольник прям);
//! \endcond

//-----------------------------------------------------------------------------

alias CalculateLayoutEvent wxCalculateLayoutEvent;
public class CalculateLayoutEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(0);
    }

    public this(цел ид)
    {
        super(wxCalculateLayoutEvent_ctor(ид));
    }

    //-----------------------------------------------------------------------------

    public цел Флаги()
    {
        return wxCalculateLayoutEvent_GetFlags(wxobj);
    }
    public проц Флаги(цел значение)
    {
        wxCalculateLayoutEvent_SetФлаги(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public Прямоугольник Прям()
    {
        Прямоугольник прям;
        wxCalculateLayoutEvent_GetRect(wxobj, прям);
        return прям;
    }

    public проц Прям(Прямоугольник значение)
    {
        wxCalculateLayoutEvent_SetRect(wxobj, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new CalculateLayoutEvent(объ);
    }

    static this()
    {
        wxEVT_CALCULATE_LAYOUT = wxEvent_EVT_CALCULATE_LAYOUT();

        ДобавьТипСоб(wxEVT_CALCULATE_LAYOUT,                &CalculateLayoutEvent.Нов);
    }
}
