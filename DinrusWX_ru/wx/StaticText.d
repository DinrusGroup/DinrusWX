//-----------------------------------------------------------------------------
// wxD - StaticText.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticText.cs
//
/// The wxStaticText wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StaticText.d,v 1.11 2009/02/11 08:04:29 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticText;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxStaticText_ctor();
static extern (C) бул   wxStaticText_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц   wxStaticText_Wrap(ЦелУкз сам, цел ширь);
//! \endcond

//---------------------------------------------------------------------

alias StaticText wxStaticText;
public class StaticText : Control
{
    public const цел wxST_NO_AUTORESIZE = 0x0001;

    public const ткст wxStaticTextNameStr = "message";

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxStaticText_ctor());
    }

    public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxStaticTextNameStr)
    {
        super(wxStaticText_ctor());
        if (!создай(родитель, ид, ярлык, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать StaticText");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new StaticText(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxStaticTextNameStr)
    {
        this(родитель, Окно.УникИД, ярлык, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxStaticText_Create(wxobj, wxObject.SafePtr(родитель), ид, ярлык, поз, Размер, cast(бцел)стиль, имя);
    }

    //---------------------------------------------------------------------

    public проц Wrap(цел ширь)
    {
        wxStaticText_Wrap(wxobj, ширь);
    }
}
