//-----------------------------------------------------------------------------
// wxD - Оценщик.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Оценщик.cs
//
/// The wxValidator wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Оценщик.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.Validator;
public import wx.common;
public import wx.EvtHandler;

//! \cond EXTERN
static extern (C) ЦелУкз wxValidator_ctor();
static extern (C) ЦелУкз wxDefaultValidator_Get();
//! \endcond

//---------------------------------------------------------------------

alias Оценщик wxValidator;
public class Оценщик : ОбработчикСоб
{
    static Оценщик wxDefaultValidator;
    static this()
    {
        wxDefaultValidator = new Оценщик(wxDefaultValidator_Get());
    }

    public this()
    {
        super(wxValidator_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------
}
