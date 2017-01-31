//-----------------------------------------------------------------------------
// wxD - PrintДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - PrintДиалог.cs
//
/// The wxPrintДиалог wrapper classes.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: PrintДиалог.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.PrintDialog;
public import wx.common;
public import wx.Dialog;
public import wx.PrintData;

		//! \cond EXTERN
        static extern (C) ЦУк wxPageSetupДиалог_ctor(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPageSetupДиалог_GetPageSetupData(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PageSetupДиалог wxPageSetupДиалог;
    public class PageSetupДиалог : Диалог
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель)
            { this(родитель, пусто); }
        public this(Окно родитель, PageSetupДиалогData данные)
            { this(wxPageSetupДиалог_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public PageSetupДиалогData PageSetupData() { return cast(PageSetupДиалогData)FindObject(wxPageSetupДиалог_GetPageSetupData(шхобъ), &PageSetupДиалогData.Нов); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPrintДиалог_ctor(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPrintДиалог_ctorPrintData(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPrintДиалог_GetPrintData(ЦУк сам);
        static extern (C) ЦУк wxPrintДиалог_GetPrintДиалогData(ЦУк сам);
        static extern (C) ЦУк wxPrintДиалог_GetPrintDC(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintДиалог wxPrintДиалог;
    public class PrintДиалог : Диалог
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель)
            { this(родитель, cast(PrintДиалогData)пусто); }
        public this(Окно родитель, PrintДиалогData данные)
            { this(wxPrintДиалог_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        public this(Окно родитель, PrintData данные)
            { this(wxPrintДиалог_ctorPrintData(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public PrintData printData() { return cast(PrintData)FindObject(wxPrintДиалог_GetPrintData(шхобъ), &PrintData.Нов); }

        //-----------------------------------------------------------------------------

        public PrintДиалогData printДиалогData() { return cast(PrintДиалогData)FindObject(wxPrintДиалог_GetPrintДиалогData(шхобъ), &PrintДиалогData.Нов); }

        //-----------------------------------------------------------------------------

        public DC PrintDC() { return cast(DC)FindObject(wxPrintДиалог_GetPrintDC(шхобъ), &DC.Нов); }
    }

//! \cond VERSION
version(none) /*(__WXGTK__)*/{
    
		//! \cond EXTERN
        static extern (C) ЦУк wxPrintSetupДиалог_ctor(ЦУк родитель, ЦУк данные);
        static extern (C) ЦУк wxPrintSetupДиалог_ctorPrintData(ЦУк родитель, ЦУк данные);
        static extern (C) проц wxPrintSetupДиалог_Init(ЦУк сам, ЦУк данные);
        static extern (C) ЦУк wxPrintSetupДиалог_GetPrintData(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintSetupДиалог wxPrintSetupДиалог;
    public class PrintSetupДиалог : Диалог
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель) 
            { this(родитель, cast(PrintДиалогData)пусто); }
        public this(Окно родитель, PrintДиалогData данные)
            { this(wxPrintSetupДиалог_ctor(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        public this(Окно родитель, PrintData данные)
            { this(wxPrintSetupДиалог_ctorPrintData(wxObject.SafePtr(родитель), wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public проц Init(PrintData данные)
        {
            wxPrintSetupДиалог_Init(шхобъ, wxObject.SafePtr(данные));
        }

        //-----------------------------------------------------------------------------

        public PrintData printData() { return cast(PrintData)FindObject(wxPrintSetupДиалог_GetPrintData(шхобъ), &PrintData.Нов); }
    }

} // __WXGTK__
//! \endcond
