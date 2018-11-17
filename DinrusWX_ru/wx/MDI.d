//-----------------------------------------------------------------------------
// wxD - MDI.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MDI.cs
//
/// The wxMDI* wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MDI.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.MDI;
public import wx.common;
public import wx.Frame;

//! \cond EXTERN
extern (C)
{
    alias ЦелУкз function(MDIParentFrame объ) Virtual_OnCreateClient;
}

static extern (C) ЦелУкз wxMDIParentFrame_ctor();
static extern (C) проц wxMDIParentFrame_RegisterVirtual(ЦелУкз сам, MDIParentFrame объ, Virtual_OnCreateClient onCreateClient);
static extern (C) ЦелУкз wxMDIParentFrame_OnCreateClient(ЦелУкз сам);
static extern (C) бул   wxMDIParentFrame_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);

static extern (C) ЦелУкз wxMDIParentFrame_GetActiveChild(ЦелУкз сам);
//static extern (C) проц   wxMDIParentFrame_SetActiveChild(ЦелУкз сам, ЦелУкз pChildFrame);

static extern (C) ЦелУкз wxMDIParentFrame_GetClientWindow(ЦелУкз сам);

static extern (C) проц   wxMDIParentFrame_Cascade(ЦелУкз сам);
static extern (C) проц   wxMDIParentFrame_Tile(ЦелУкз сам);

static extern (C) проц   wxMDIParentFrame_ArrangeIcons(ЦелУкз сам);

static extern (C) проц   wxMDIParentFrame_ActivateNext(ЦелУкз сам);
static extern (C) проц   wxMDIParentFrame_ActivatePrevious(ЦелУкз сам);

static extern (C) проц   wxMDIParentFrame_GetClientSize(ЦелУкз сам, out цел ширь, out цел высь);
//! \endcond

//-----------------------------------------------------------------------------

alias MDIParentFrame wxMDIParentFrame;
public class MDIParentFrame : Frame
{
    enum { wxDEFAULT_MDI_FRAME_STYLE = wxDEFAULT_FRAME_STYLE | wxVSCROLL | wxHSCROLL }

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxMDIParentFrame_ctor());
        wxMDIParentFrame_RegisterVirtual(wxobj, this, &staticDoOnCreateClient);
    }

    public this(Окно родитель, цел ид, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_MDI_FRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this();

        if (!создай(родитель, ид, титул, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Could not create MDIParentFrame");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_MDI_FRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this(родитель, Окно.УникИД, титул, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public override бул создай(Окно родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxMDIParentFrame_Create(wxobj, wxObject.SafePtr(родитель), ид, титул, поз, Размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    static extern(C) private ЦелУкз staticDoOnCreateClient(MDIParentFrame объ)
    {
        return wxObject.SafePtr(объ.OnCreateClient());
    }

    public  MDIClientWindow OnCreateClient()
    {
        return cast(MDIClientWindow)НайдиОбъект(wxMDIParentFrame_OnCreateClient(wxobj), &MDIClientWindow.Нов);
    }

    //-----------------------------------------------------------------------------

    public MDIChildFrame GetActiveChild()
    {
        return cast(MDIChildFrame)НайдиОбъект(wxMDIParentFrame_GetActiveChild(wxobj), &MDIChildFrame.Нов);
    }

    /*
    public проц УстActiveChild(MDIChildFrame pChildFrame)
    {
    	wxMDIParentFrame_SetActiveChild(wxobj, wxObject.SafePtr(pChildFrame));
    }
    */

    //-----------------------------------------------------------------------------

    public MDIClientWindow GetClientWindow()
    {
        return cast(MDIClientWindow)НайдиОбъект(wxMDIParentFrame_GetClientWindow(wxobj), &MDIClientWindow.Нов);
    }

    //-----------------------------------------------------------------------------

    public  проц Cascade()
    {
        wxMDIParentFrame_Cascade(wxobj);
    }

    public  проц Tile()
    {
        wxMDIParentFrame_Tile(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  проц ArrangeIcons()
    {
        wxMDIParentFrame_ArrangeIcons(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  проц ActivateNext()
    {
        wxMDIParentFrame_ActivateNext(wxobj);
    }

    public  проц ActivatePrevious()
    {
        wxMDIParentFrame_ActivatePrevious(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  проц GetClientSize(out цел ширь, out цел высь)
    {
        wxMDIParentFrame_GetClientSize(wxobj, ширь, высь);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxMDIChildFrame_ctor();
static extern (C) бул   wxMDIChildFrame_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout  Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц   wxMDIChildFrame_Activate(ЦелУкз сам);
static extern (C) проц   wxMDIChildFrame_Restore(ЦелУкз сам);
static extern (C) проц   wxMDIChildFrame_Maximize(ЦелУкз сам, бул maximize);
//! \endcond

//-----------------------------------------------------------------------------

alias MDIChildFrame wxMDIChildFrame;
public class MDIChildFrame : Frame
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxMDIChildFrame_ctor());
    }

    public this(MDIParentFrame родитель, цел ид, ткст титул, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        super(wxMDIChildFrame_ctor());
        if (!создай(родитель, ид, титул, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Could not create MDIChildFrame");
        }

        EVT_ACTIVATE( &OnActivate );
    }

    static wxObject Нов(ЦелУкз ptr)
    {
        return new MDIChildFrame(ptr);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(MDIParentFrame родитель, ткст титул, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль=wxDEFAULT_FRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this(родитель, Окно.УникИД, титул, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public бул создай(MDIParentFrame родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        бул ret = wxMDIChildFrame_Create(wxobj, wxObject.SafePtr(родитель), ид, титул, поз, Размер, стиль, имя);
        version(__WXMAC__)
        {
            // Bug in wxMac 2.5.2; it always returns FALSE
            return да;
        }
        else
        {
            return ret;
        } // version(__WXMAC__)
    }

    //-----------------------------------------------------------------------------

    public  проц Activate()
    {
        wxMDIChildFrame_Activate(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  проц Restore()
    {
        wxMDIChildFrame_Restore(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  проц OnActivate(Объект отправитель, Событие e)
    {
    }

    //-----------------------------------------------------------------------------

    public  проц Maximize()
    {
        wxMDIChildFrame_Maximize(wxobj, да);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxMDIClientWindow_ctor();
static extern (C) бул   wxMDIClientWindow_CreateClient(ЦелУкз сам, ЦелУкз родитель, бцел стиль);
//! \endcond

//-----------------------------------------------------------------------------

alias MDIClientWindow wxMDIClientWindow;
public class MDIClientWindow : Окно
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this()
    {
        super(wxMDIClientWindow_ctor());
    }

    public this(MDIParentFrame родитель, цел стиль=0)
    {
        super(wxMDIClientWindow_ctor());
        if (!CreateClient(родитель, стиль))
        {
            throw new InvalidOperationException("Could not create MDIClientWindow");
        }
    }

    static wxObject Нов(ЦелУкз ptr)
    {
        return new MDIClientWindow(ptr);
    }

    //-----------------------------------------------------------------------------

    public бул CreateClient(MDIParentFrame родитель, цел стиль)
    {
        return wxMDIClientWindow_CreateClient(wxobj, wxObject.SafePtr(родитель), стиль);
    }
}

