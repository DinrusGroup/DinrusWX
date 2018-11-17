//-----------------------------------------------------------------------------
// wxD - StaticBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticBox.cs
//
/// The wxStaticBox wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: StaticBox.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticBox;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxStaticBox_ctor();
static extern (C) бул wxStaticBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
//! \endcond

//---------------------------------------------------------------------

alias StaticBox wxStaticBox;
public class StaticBox : Control
{
    public const ткст wxStaticBoxNameStr = "groupBox";

    public this()
    {
        super(wxStaticBox_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно окно, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBoxNameStr)
    {
        this();
        if (!создай(окно, ид, ярлык, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать StaticBox");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new StaticBox(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно окно, ткст ярлык, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxStaticBoxNameStr)
    {
        this(окно, Окно.УникИД, ярлык, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно окно, цел ид, ткст ярлык, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxStaticBox_Create(wxobj, wxObject.SafePtr(окно),
                                  ид, ярлык, поз, Размер,
                                  cast(бцел)стиль, имя);
    }
}
