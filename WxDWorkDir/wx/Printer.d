//-----------------------------------------------------------------------------
// wxD - TextCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TextCtrl.cs
//
/// The wxTextCtrl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Printer.d,v 1.11 2007/01/29 21:37:32 afb Exp $
//-----------------------------------------------------------------------------

module wx.Printer;
public import wx.common;
public import wx.Window;
public import wx.PrintData;

    public enum PrinterError 
    {
        wxPRINTER_NO_ERROR = 0,
        wxPRINTER_CANCELLED,
        wxPRINTER_ERROR
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPrinter_ctor(ЦУк данные);
        static extern (C) ЦУк wxPrinter_CreateAbortWindow(ЦУк сам, ЦУк родитель, ЦУк printout);
        static extern (C) проц   wxPrinter_ReportError(ЦУк сам, ЦУк родитель, ЦУк printout, ткст message);
        static extern (C) ЦУк wxPrinter_GetPrintДиалогData(ЦУк сам);
        static extern (C) бул   wxPrinter_GetAbort(ЦУк сам);
        static extern (C) цел    wxPrinter_GetLastError(ЦУк сам);
        static extern (C) бул   wxPrinter_Setup(ЦУк сам, ЦУк родитель);
        static extern (C) бул   wxPrinter_Print(ЦУк сам, ЦУк родитель, ЦУк printout, бул prompt);
        static extern (C) ЦУк wxPrinter_PrintДиалог(ЦУк сам, ЦУк родитель);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias Printer wxPrinter;
    public class Printer : wxObject
    {
        private this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(cast(PrintДиалогData)пусто); }
        public this(PrintДиалогData данные)
            { this(wxPrinter_ctor(wxObject.SafePtr(данные))); }

        //-----------------------------------------------------------------------------

        public Окно CreateAbortWindow(Окно родитель, Printout printout)
        {
            return cast(Окно)FindObject(wxPrinter_CreateAbortWindow(шхобъ, wxObject.SafePtr(родитель), wxObject.SafePtr(printout)), &Окно.Нов);
        }

        //-----------------------------------------------------------------------------

        public проц ReportError(Окно родитель, Printout printout, ткст message)
        {
            wxPrinter_ReportError(шхобъ, wxObject.SafePtr(родитель), wxObject.SafePtr(printout), message);
        }

        //-----------------------------------------------------------------------------

        public PrintДиалогData printДиалогData() { return cast(PrintДиалогData)FindObject(wxPrinter_GetPrintДиалогData(шхобъ), &PrintДиалогData.Нов); }

        //-----------------------------------------------------------------------------

        public бул Abort() { return wxPrinter_GetAbort(шхобъ); }

        //-----------------------------------------------------------------------------

        public PrinterError LastError() { return cast(PrinterError)wxPrinter_GetLastError(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул Setup(Окно родитель)
        {
            return wxPrinter_Setup(шхобъ, wxObject.SafePtr(родитель));
        }

        //-----------------------------------------------------------------------------

        public бул Print(Окно родитель, Printout printout, бул prompt)
        {
            return wxPrinter_Print(шхобъ, wxObject.SafePtr(родитель), wxObject.SafePtr(printout), prompt);
        }

        //-----------------------------------------------------------------------------

        public DC PrintДиалог(Окно родитель)
        {
            return cast(DC)FindObject(wxPrinter_PrintДиалог(шхобъ, wxObject.SafePtr(родитель)), &DC.Нов);
        }
    }


        //-----------------------------------------------------------------------------

		//! \cond EXTERN
	extern (C) {
        alias проц function(Printout объ) Virtual_NoParams;
        alias бул function(Printout объ, цел i) Virtual_ParamsInt;
        alias бул function(Printout объ, цел startPage, цел endPage) Virtual_OnBeginDocument;
        alias проц function(Printout объ, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo) Virtual_GetPageInfo;
	}

        static extern (C) ЦУк wxPrintout_ctor(ткст title);
        static extern (C) бул   wxPrintout_OnBeginDocument(ЦУк сам, цел startPage, цел endPage);
        static extern (C) проц   wxPrintout_OnEndDocument(ЦУк сам);
        static extern (C) проц   wxPrintout_OnBeginPrinting(ЦУк сам);
        static extern (C) проц   wxPrintout_OnEndPrinting(ЦУк сам);
        static extern (C) проц   wxPrintout_OnPreparePrinting(ЦУк сам);
        static extern (C) бул   wxPrintout_HasPage(ЦУк сам, цел page);
        static extern (C) проц   wxPrintout_GetPageInfo(ЦУк сам, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo);
        static extern (C) ЦУк wxPrintout_GetTitle(ЦУк сам);
        static extern (C) ЦУк wxPrintout_GetDC(ЦУк сам);
        static extern (C) проц   wxPrintout_SetDC(ЦУк сам, ЦУк dc);
        static extern (C) проц   wxPrintout_SetPageSizePixels(ЦУк сам, цел w, цел h);
        static extern (C) проц   wxPrintout_GetPageSizePixels(ЦУк сам, inout цел w, inout цел h);
        static extern (C) проц   wxPrintout_SetPageSizeMM(ЦУк сам, цел w, цел h);
        static extern (C) проц   wxPrintout_GetPageSizeMM(ЦУк сам, inout цел w, inout цел h);
        static extern (C) проц   wxPrintout_SetPPIScreen(ЦУк сам, цел x, цел y);
        static extern (C) проц   wxPrintout_GetPPIScreen(ЦУк сам, inout цел x, inout цел y);
        static extern (C) проц   wxPrintout_SetPPIPrinter(ЦУк сам, цел x, цел y);
        static extern (C) проц   wxPrintout_GetPPIPrinter(ЦУк сам, inout цел x, inout цел y);
        static extern (C) бул   wxPrintout_IsPreview(ЦУк сам);
      //  static extern (C) проц   wxPrintout_SetIsPreview(ЦУк сам, бул p);

        static extern (C) проц   wxPrintout_RegisterVirtual(ЦУк сам, Printout объ, Virtual_OnBeginDocument onBeginDocument, Virtual_NoParams onEndDocument, Virtual_NoParams onBeginPrinting, Virtual_NoParams onEndPrinting, Virtual_NoParams onPreparePrinting, Virtual_ParamsInt hasPage, Virtual_ParamsInt onPrintPage, Virtual_GetPageInfo getPageInfo);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias Printout wxPrintout;
    public abstract class Printout : wxObject
    {
        private this(ЦУк шхобъ) 
        { 
        	super(шхобъ);

            wxPrintout_RegisterVirtual(шхобъ,this,
                    &staticOnBeginDocument,
                    &staticOnEndDocument,
                    &staticOnBeginPrinting,
                    &staticOnEndPrinting,
                    &staticOnPreparePrinting,
                    &staticHasPage,
                    &staticOnPrintPage,
                    &staticGetPageInfo);
        }

        public this(ткст title)
            { this(wxPrintout_ctor(title)); }

//	public static wxObject Нов(ЦУк ptr) { return new Printout(ptr); }
        //-----------------------------------------------------------------------------

        static extern(C) private бул staticOnBeginDocument(Printout объ, цел startPage, цел endPage)
        {
            return объ.OnBeginDocument(startPage, endPage);
        }
        public /+virtual+/ бул OnBeginDocument(цел startPage, цел endPage)
        {
            return wxPrintout_OnBeginDocument(шхобъ, startPage, endPage);
        }

        static extern(C) private проц staticOnEndDocument(Printout объ)
        {
            объ.OnEndDocument();
        }
        public /+virtual+/ проц OnEndDocument()
        {
            wxPrintout_OnEndDocument(шхобъ);
        }

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticOnBeginPrinting(Printout объ)
        {
            объ.OnBeginPrinting();
        }
        public /+virtual+/ проц OnBeginPrinting()
        {
            wxPrintout_OnBeginPrinting(шхобъ);
        }

        static extern(C) private проц staticOnEndPrinting(Printout объ)
        {
            объ.OnEndPrinting();
        }
        public /+virtual+/ проц OnEndPrinting()
        {
            wxPrintout_OnEndPrinting(шхобъ);
        }

        static extern(C) private проц staticOnPreparePrinting(Printout объ)
        {
            объ.OnPreparePrinting();
        }
        public /+virtual+/ проц OnPreparePrinting()
        {
            wxPrintout_OnPreparePrinting(шхобъ);
        }

        //-----------------------------------------------------------------------------

        static extern(C) private бул staticHasPage(Printout объ, цел page)
        {
            return объ.HasPage(page);
        }
        public /+virtual+/ бул HasPage(цел page)
        {
            return wxPrintout_HasPage(шхобъ, page);
        }

        //-----------------------------------------------------------------------------

        static extern(C) private бул staticOnPrintPage(Printout объ,цел page)
        {
            return объ.OnPrintPage(page);
        }
        public abstract бул OnPrintPage(цел page);

        //-----------------------------------------------------------------------------

        static extern(C) private проц staticGetPageInfo(Printout объ, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo)
        {
            объ.GetPageInfo(minPage, maxPage, pageFrom, pageTo);
        }
        public /+virtual+/ проц GetPageInfo(inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo)
        {
            wxPrintout_GetPageInfo(шхобъ, minPage, maxPage, pageFrom, pageTo);
        }

        //-----------------------------------------------------------------------------

        public ткст Title() { return cast(ткст) new wxString(wxPrintout_GetTitle(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public DC Dc() { return cast(DC)FindObject(wxPrintout_GetDC(шхобъ), &DC.Нов); }
        public проц Dc(DC значение) { wxPrintout_SetDC(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц SetPageSizePixels(цел w, цел h)
        {
            wxPrintout_SetPageSizePixels(шхобъ, w, h);
        }

        public проц GetPageSizePixels(out цел w, out цел h)
        {
            w = h = 0;
            wxPrintout_GetPageSizePixels(шхобъ, w, h);
        }

        //-----------------------------------------------------------------------------

        public проц SetPageSizeMM(цел w, цел h)
        {
            wxPrintout_SetPageSizeMM(шхобъ, w, h);
        }

        public проц GetPageSizeMM(out цел w, out цел h)
        {
            w = h = 0;
            wxPrintout_GetPageSizeMM(шхобъ, w, h);
        }

        //-----------------------------------------------------------------------------

        public проц SetPPIScreen(цел x, цел y)
        {
            wxPrintout_SetPPIScreen(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц GetPPIScreen(out цел x, out цел y)
        {
            x = y = 0;
            wxPrintout_GetPPIScreen(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц SetPPIPrinter(цел x, цел y)
        {
            wxPrintout_SetPPIPrinter(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц GetPPIPrinter(out цел x, out цел y)
        {
            x = y = 0;
            wxPrintout_GetPPIPrinter(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public бул IsPreview() { return wxPrintout_IsPreview(шхобъ); }
       // public проц IsPreview(бул значение) { wxPrintout_SetIsPreview(шхобъ, значение); }
    }

