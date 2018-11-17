//-----------------------------------------------------------------------------
// wxD - StaticBoxSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticBoxSizer.cs
//
/// The wxStaticBoxSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: StaticBoxSizer.d,v 1.10 2007/08/20 08:39:16 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticBoxSizer;
public import wx.common;
public import wx.BoxSizer;
public import wx.StaticBox;

//! \cond EXTERN
static extern (C) ЦелУкз wxStaticBoxSizer_ctor(ЦелУкз box, цел ориент);
static extern (C) ЦелУкз wxStaticBoxSizer_GetStaticBox(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias StaticBoxSizer wxStaticBoxSizer;
public class StaticBoxSizer : БоксСайзер
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(StaticBox box, цел ориент)
    {
        super(wxStaticBoxSizer_ctor(wxObject.SafePtr(box), ориент));
    }

    public this(цел ориент, Окно родитель, ткст ярлык)
    {
        this(new StaticBox(родитель, -1, ярлык), ориент);
    }

    //---------------------------------------------------------------------

    public StaticBox staticBox()
    {
        return cast(StaticBox)НайдиОбъект(
                   wxStaticBoxSizer_GetStaticBox(wxobj)
               );
    }

    //---------------------------------------------------------------------
}
