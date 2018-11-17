//-----------------------------------------------------------------------------
// wxD - MiniFrame.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MiniFrame.cs
//
/// The wxMiniFrame wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MiniFrame.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.MiniFrame;
public import wx.common;
public import wx.Frame;

//! \cond EXTERN
static extern (C) ЦелУкз wxMiniFrame_ctor();
static extern (C) бул   wxMiniFrame_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
//! \endcond

//-----------------------------------------------------------------------------

alias MiniFrame wxMiniFrame;
public class MiniFrame : Frame
{
    enum { wxDEFAULT_MINIFRAME_STYLE = wxCAPTION | wxCLIP_CHILDREN | wxRESIZE_BORDER }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxMiniFrame_ctor());
    }

    public this(Окно родитель, цел ид, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_MINIFRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this();
        if (!создай(родитель, ид, титул, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Could not create MiniFrame");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_MINIFRAME_STYLE, ткст имя=wxFrameNameStr)
    {
        this(родитель, Окно.УникИД, титул, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public override бул создай(Окно родитель, цел ид, ткст титул, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxMiniFrame_Create(wxobj, wxObject.SafePtr(родитель), ид, титул, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    // Helper constructors

    public this(ткст титул, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxDEFAULT_MINIFRAME_STYLE)
    {
        this(null, -1, титул, поз, Размер, стиль);
    }

    //-----------------------------------------------------------------------------
}

