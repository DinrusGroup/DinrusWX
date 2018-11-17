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
        static extern (C) IntPtr wxPrinter_ctor(IntPtr data);
        static extern (C) IntPtr wxPrinter_CreateAbortWindow(IntPtr сам, IntPtr родитель, IntPtr printout);
        static extern (C) проц   wxPrinter_ReportError(IntPtr сам, IntPtr родитель, IntPtr printout, ткст message);
        static extern (C) IntPtr wxPrinter_GetPrintDialogData(IntPtr сам);
        static extern (C) бул   wxPrinter_GetAbort(IntPtr сам);
        static extern (C) цел    wxPrinter_GetLastError(IntPtr сам);
        static extern (C) бул   wxPrinter_Setup(IntPtr сам, IntPtr родитель);
        static extern (C) бул   wxPrinter_Print(IntPtr сам, IntPtr родитель, IntPtr printout, бул prompt);
        static extern (C) IntPtr wxPrinter_PrintDialog(IntPtr сам, IntPtr родитель);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias Printer wxPrinter;
    public class Printer : wxObject
    {
        private this(IntPtr wxobj) ;
        public this();
        public this(PrintDialogData data);
        public Окно CreateAbortWindow(Окно родитель, Printout printout);
        public проц ReportError(Окно родитель, Printout printout, ткст message);
        public PrintDialogData printDialogData() ;
        public бул Abort();
        public PrinterError LastError() ;
        public бул Устup(Окно родитель);
        public бул Print(Окно родитель, Printout printout, бул prompt);
        public DC PrintDialog(Окно родитель);
    }


        //-----------------------------------------------------------------------------

		//! \cond EXTERN
	extern (C) {
        alias проц function(Printout объ) Virtual_NoParams;
        alias бул function(Printout объ, цел i) Virtual_ParamsInt;
        alias бул function(Printout объ, цел startPage, цел endPage) Virtual_OnBeginDocument;
        alias проц function(Printout объ, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo) Virtual_GetPageInfo;
	}

        static extern (C) IntPtr wxPrintout_ctor(ткст title);
        static extern (C) бул   wxPrintout_OnBeginDocument(IntPtr сам, цел startPage, цел endPage);
        static extern (C) проц   wxPrintout_OnEndDocument(IntPtr сам);
        static extern (C) проц   wxPrintout_OnBeginPrinting(IntPtr сам);
        static extern (C) проц   wxPrintout_OnEndPrinting(IntPtr сам);
        static extern (C) проц   wxPrintout_OnPreparePrinting(IntPtr сам);
        static extern (C) бул   wxPrintout_HasPage(IntPtr сам, цел page);
        static extern (C) проц   wxPrintout_GetPageInfo(IntPtr сам, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo);
        static extern (C) IntPtr wxPrintout_GetTitle(IntPtr сам);
        static extern (C) IntPtr wxPrintout_GetDC(IntPtr сам);
        static extern (C) проц   wxPrintout_SetDC(IntPtr сам, IntPtr dc);
        static extern (C) проц   wxPrintout_SetPageSizePixels(IntPtr сам, цел w, цел h);
        static extern (C) проц   wxPrintout_GetPageSizePixels(IntPtr сам, inout цел w, inout цел h);
        static extern (C) проц   wxPrintout_SetPageSizeMM(IntPtr сам, цел w, цел h);
        static extern (C) проц   wxPrintout_GetPageSizeMM(IntPtr сам, inout цел w, inout цел h);
        static extern (C) проц   wxPrintout_SetPPIScreen(IntPtr сам, цел x, цел y);
        static extern (C) проц   wxPrintout_GetPPIScreen(IntPtr сам, inout цел x, inout цел y);
        static extern (C) проц   wxPrintout_SetPPIPrinter(IntPtr сам, цел x, цел y);
        static extern (C) проц   wxPrintout_GetPPIPrinter(IntPtr сам, inout цел x, inout цел y);
        static extern (C) бул   wxPrintout_IsPreview(IntPtr сам);
        static extern (C) проц   wxPrintout_SetIsPreview(IntPtr сам, бул p);

        static extern (C) проц   wxPrintout_RegisterVirtual(IntPtr сам, Printout объ, Virtual_OnBeginDocument onBeginDocument, Virtual_NoParams onEndDocument, Virtual_NoParams onBeginPrinting, Virtual_NoParams onEndPrinting, Virtual_NoParams onPreparePrinting, Virtual_ParamsInt hasPage, Virtual_ParamsInt onPrintPage, Virtual_GetPageInfo getPageInfo);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias Printout wxPrintout;
    public abstract class Printout : wxObject
    {
        private this(IntPtr wxobj) ;
        public this(ткст title);
//	public static wxObject Нов(IntPtr ptr) ;
        static extern(C) private бул staticOnBeginDocument(Printout объ, цел startPage, цел endPage);
        public  бул OnBeginDocument(цел startPage, цел endPage);
        static extern(C) private проц staticOnEndDocument(Printout объ);
        public  проц OnEndDocument();
        static extern(C) private проц staticOnBeginPrinting(Printout объ);
        public  проц OnBeginPrinting();
        static extern(C) private проц staticOnEndPrinting(Printout объ);
        public  проц OnEndPrinting();
        static extern(C) private проц staticOnPreparePrinting(Printout объ);
        public  проц OnPreparePrinting();
        static extern(C) private бул staticHasPage(Printout объ, цел page);
        public  бул HasPage(цел page);
        static extern(C) private бул staticOnPrintPage(Printout объ,цел page);
        public abstract бул OnPrintPage(цел page);
        static extern(C) private проц staticGetPageInfo(Printout объ, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo);
        public  проц GetPageInfo(inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo);
        public ткст Титул() ;
        public DC Dc();
        public проц Dc(DC значение);
        public проц УстPageSizePixels(цел w, цел h);
        public проц GetPageSizePixels(out цел w, out цел h);
        public проц УстPageSizeMM(цел w, цел h);
        public проц GetPageSizeMM(out цел w, out цел h);
        public проц УстPPIScreen(цел x, цел y);
        public проц GetPPIScreen(out цел x, out цел y);
        public проц УстPPIPrinter(цел x, цел y);
        public проц GetPPIPrinter(out цел x, out цел y);
        public бул IsPreview() ;
        public проц IsPreview(бул значение);
    }

