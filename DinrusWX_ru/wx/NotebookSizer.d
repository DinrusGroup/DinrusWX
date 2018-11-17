//-----------------------------------------------------------------------------
// wxD - NotebookSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - NotebookSizer.cs
//
/// The wxNotebookSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NotebookSizer.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NotebookSizer;
public import wx.common;
public import wx.Sizer;
public import wx.Notebook;

//! \cond EXTERN
static extern (C) ЦелУкз wxNotebookSizer_ctor(ЦелУкз nb);
static extern (C) проц wxNotebookSizer_RecalcSizes(ЦелУкз сам);
static extern (C) проц wxNotebookSizer_CalcMin(ЦелУкз сам, inout Размер Размер);
static extern (C) ЦелУкз wxNotebookSizer_GetNotebook(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias NotebookSizer wxNotebookSizer;
/*deprecated*/ public class NotebookSizer : Сайзер
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Notebook nb)
    {
        super(wxNotebookSizer_ctor(wxObject.SafePtr(nb)));
    }

    //---------------------------------------------------------------------

    public override проц пересчётРазмеров()
    {
        wxNotebookSizer_RecalcSizes(wxobj);
    }

    //---------------------------------------------------------------------

    public override Размер вычислиМин()
    {
        Размер Размер;
        wxNotebookSizer_CalcMin(wxobj, Размер);
        return Размер;
    }

    //---------------------------------------------------------------------

    public Notebook notebook()
    {
        return cast(Notebook)НайдиОбъект(
                   wxNotebookSizer_GetNotebook(wxobj)
               );
    }

    //---------------------------------------------------------------------
}
