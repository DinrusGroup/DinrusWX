//-----------------------------------------------------------------------------
// wxD - StaticLine.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticLine.cs
//
/// The wxStaticLine wrapper class.
//
// Written by Robert Roebling
// (C) 2003 by Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StaticLine.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticLine;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxStaticLine_ctor();
static extern (C) бул wxStaticLine_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) бул wxStaticLine_IsVertical(ЦелУкз сам);
static extern (C) цел  wxStaticLine_GetDefaultSize(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias StaticLine wxStaticLine;
public class StaticLine : Control
{
    enum
    {
        wxLI_HORIZONTAL	= Ориентация.wxHORIZONTAL,
        wxLI_VERTICAL		= Ориентация.wxVERTICAL,
    }

    public const ткст wxStaticTextNameStr = "message";
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxStaticLine_ctor());
    }

    public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxLI_HORIZONTAL, ткст имя = wxStaticTextNameStr)
    {
        super(wxStaticLine_ctor());
        if (!создай(родитель, ид, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать StaticText");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new StaticLine(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxLI_HORIZONTAL, ткст имя = wxStaticTextNameStr)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxStaticLine_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул вертикален()
    {
        return wxStaticLine_IsVertical(wxobj);
    }

    //---------------------------------------------------------------------

    public цел DefaultSize()
    {
        return wxStaticLine_GetDefaultSize(wxobj);
    }
}
