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
        static extern (C) ЦУк wxPageSetupDialog_ctor(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPageSetupDialog_GetPageSetupData(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PageSetupDialog wxPageSetupDialog;
    public class PageSetupDialog : Dialog
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель)
            { this(родитель, пусто); }
        public this(Окно родитель, PageSetupDialogData данные)
            { this(wxPageSetupDialog_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public PageSetupDialogData PageSetupData() { return cast(PageSetupDialogData)FindObject(wxPageSetupDialog_GetPageSetupData(шхобъ), &PageSetupDialogData.Нов); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPrintDialog_ctor(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPrintDialog_ctorPrintData(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPrintDialog_GetPrintData(ЦУк сам);
        static extern (C) ЦУк wxPrintDialog_GetPrintDialogData(ЦУк сам);
        static extern (C) ЦУк wxPrintDialog_GetPrintDC(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintDialog wxPrintDialog;
    public class PrintDialog : Dialog
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель)
            { this(родитель, cast(PrintDialogData)пусто); }
        public this(Окно родитель, PrintDialogData данные)
            { this(wxPrintDialog_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        public this(Окно родитель, PrintData данные)
            { this(wxPrintDialog_ctorPrintData(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public PrintData printData() { return cast(PrintData)FindObject(wxPrintDialog_GetPrintData(шхобъ), &PrintData.Нов); }

        //-----------------------------------------------------------------------------

        public PrintDialogData printDialogData() { return cast(PrintDialogData)FindObject(wxPrintDialog_GetPrintDialogData(шхобъ), &PrintDialogData.Нов); }

        //-----------------------------------------------------------------------------

        public DC PrintDC() { return cast(DC)FindObject(wxPrintDialog_GetPrintDC(шхобъ), &DC.Нов); }
    }

//! \cond VERSION
version(none) /*(__WXGTK__)*/{
    
		//! \cond EXTERN
        static extern (C) ЦУк wxPrintSetupDialog_ctor(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPrintSetupDialog_ctorPrintData(ЦУк родитель, ЦУк данные);
        static extern (C) проц wxPrintSetupDialog_Init(ЦУк сам, ЦУк данные);
        static extern (C) ЦУк wxPrintSetupDialog_GetPrintData(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintSetupDialog wxPrintSetupDialog;
    public class PrintSetupDialog : Dialog
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель) 
            { this(родитель, cast(PrintDialogData)пусто); }
        public this(Окно родитель, PrintDialogData данные)
            { this(wxPrintSetupDialog_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        public this(Окно родитель, PrintData данные)
            { this(wxPrintSetupDialog_ctorPrintData(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public проц Init(PrintData данные)
        {
            wxPrintSetupDialog_Init(шхобъ, wxObject.SafePtr(данные));
        }

        //-----------------------------------------------------------------------------

        public PrintData printData() { return cast(PrintData)FindObject(wxPrintSetupDialog_GetPrintData(шхобъ), &PrintData.Нов); }
    }

} // __WXGTK__
//! \endcond
