//-----------------------------------------------------------------------------
// wxD - PrintDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - PrintDialog.cs
//
/// The wxPrintDialog wrapper classes.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: PrintDialog.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.PrintDialog;
public import wx.common;
public import wx.Dialog;
public import wx.PrintData;

//! \cond EXTERN
static extern (C) ЦелУкз wxPageУстupDialog_ctor(ЦелУкз родитель, ЦелУкз data);
static extern (C) ЦелУкз wxPageУстupDialog_GetPageУстupData(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PageУстupDialog wxPageУстupDialog;
public class PageУстupDialog : Dialog
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель)
    {
        this(родитель, null);
    }
    public this(Окно родитель, PageУстupDialogData data)
    {
        this(wxPageУстupDialog_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(data)));
    }

    //-----------------------------------------------------------------------------

    public PageУстupDialogData PageУстupData()
    {
        return cast(PageУстupDialogData)НайдиОбъект(wxPageУстupDialog_GetPageУстupData(wxobj), &PageУстupDialogData.Нов);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxPrintDialog_ctor(ЦелУкз родитель, ЦелУкз data);
static extern (C) ЦелУкз wxPrintDialog_ctorPrintData(ЦелУкз родитель, ЦелУкз data);
static extern (C) ЦелУкз wxPrintDialog_GetPrintData(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintDialog_GetPrintDialogData(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintDialog_GetPrintDC(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PrintDialog wxPrintDialog;
public class PrintDialog : Dialog
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель)
    {
        this(родитель, cast(PrintDialogData)null);
    }
    public this(Окно родитель, PrintDialogData data)
    {
        this(wxPrintDialog_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(data)));
    }

    public this(Окно родитель, PrintData data)
    {
        this(wxPrintDialog_ctorPrintData(wxObject.SafePtr(родитель), wxObject.SafePtr(data)));
    }

    //-----------------------------------------------------------------------------

    public PrintData printData()
    {
        return cast(PrintData)НайдиОбъект(wxPrintDialog_GetPrintData(wxobj), &PrintData.Нов);
    }

    //-----------------------------------------------------------------------------

    public PrintDialogData printDialogData()
    {
        return cast(PrintDialogData)НайдиОбъект(wxPrintDialog_GetPrintDialogData(wxobj), &PrintDialogData.Нов);
    }

    //-----------------------------------------------------------------------------

    public DC PrintDC()
    {
        return cast(DC)НайдиОбъект(wxPrintDialog_GetPrintDC(wxobj), &DC.Нов);
    }
}

//! \cond VERSION
version(none) /*(__WXGTK__)*/
{

    //! \cond EXTERN
    static extern (C) ЦелУкз wxPrintУстupDialog_ctor(ЦелУкз родитель, ЦелУкз data);
    static extern (C) ЦелУкз wxPrintУстupDialog_ctorPrintData(ЦелУкз родитель, ЦелУкз data);
    static extern (C) проц wxPrintУстupDialog_Init(ЦелУкз сам, ЦелУкз data);
    static extern (C) ЦелУкз wxPrintУстupDialog_GetPrintData(ЦелУкз сам);
    //! \endcond

    //-----------------------------------------------------------------------------

    alias PrintУстupDialog wxPrintУстupDialog;
    public class PrintУстupDialog : Dialog
    {
        private this(ЦелУкз wxobj)
        {
            super(wxobj);
        }

        public this(Окно родитель)
        {
            this(родитель, cast(PrintDialogData)null);
        }
        public this(Окно родитель, PrintDialogData data)
        {
            this(wxPrintУстupDialog_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(data)));
        }

        public this(Окно родитель, PrintData data)
        {
            this(wxPrintУстupDialog_ctorPrintData(wxObject.SafePtr(родитель), wxObject.SafePtr(data)));
        }

        //-----------------------------------------------------------------------------

        public проц Init(PrintData data)
        {
            wxPrintУстupDialog_Init(wxobj, wxObject.SafePtr(data));
        }

        //-----------------------------------------------------------------------------

        public PrintData printData()
        {
            return cast(PrintData)НайдиОбъект(wxPrintУстupDialog_GetPrintData(wxobj), &PrintData.Нов);
        }
    }

} // __WXGTK__
//! \endcond
