module wx.PrintData;
public import wx.common;

    public enum PrintMode
    {
        wxPRINT_MODE_NONE =    0,
        wxPRINT_MODE_PREVIEW = 1,   // Preview in external application
        wxPRINT_MODE_FILE =    2,   // Print to file
        wxPRINT_MODE_PRINTER = 3    // Send to printer
    }

    public enum PrintQuality
    {
        wxPRINT_QUALITY_HIGH    = -1,
        wxPRINT_QUALITY_MEDIUM  = -2,
        wxPRINT_QUALITY_LOW     = -3,
        wxPRINT_QUALITY_DRAFT   = -4
    }

    public enum DuplexMode
    {
        wxDUPLEX_SIMPLEX, 
        wxDUPLEX_HORIZONTAL,
        wxDUPLEX_VERTICAL
    }

    public enum PaperSize 
    {
        wxPAPER_NONE,               // Use specific dimensions
        wxPAPER_LETTER,             // Letter, 8 1/2 by 11 inches
        wxPAPER_LEGAL,              // Legal, 8 1/2 by 14 inches
        wxPAPER_A4,                 // A4 Sheet, 210 by 297 millimeters
        wxPAPER_CSHEET,             // C Sheet, 17 by 22 inches
        wxPAPER_DSHEET,             // D Sheet, 22 by 34 inches
        wxPAPER_ESHEET,             // E Sheet, 34 by 44 inches
        wxPAPER_LETTERSMALL,        // Letter Small, 8 1/2 by 11 inches
        wxPAPER_TABLOID,            // Tabloid, 11 by 17 inches
        wxPAPER_LEDGER,             // Ledger, 17 by 11 inches
        wxPAPER_STATEMENT,          // Statement, 5 1/2 by 8 1/2 inches
        wxPAPER_EXECUTIVE,          // Executive, 7 1/4 by 10 1/2 inches
        wxPAPER_A3,                 // A3 sheet, 297 by 420 millimeters
        wxPAPER_A4SMALL,            // A4 small sheet, 210 by 297 millimeters
        wxPAPER_A5,                 // A5 sheet, 148 by 210 millimeters
        wxPAPER_B4,                 // B4 sheet, 250 by 354 millimeters
        wxPAPER_B5,                 // B5 sheet, 182-by-257-millimeter paper
        wxPAPER_FOLIO,              // Folio, 8-1/2-by-13-inch paper
        wxPAPER_QUARTO,             // Quarto, 215-by-275-millimeter paper
        wxPAPER_10X14,              // 10-by-14-inch sheet
        wxPAPER_11X17,              // 11-by-17-inch sheet
        wxPAPER_NOTE,               // Note, 8 1/2 by 11 inches
        wxPAPER_ENV_9,              // #9 Envelope, 3 7/8 by 8 7/8 inches
        wxPAPER_ENV_10,             // #10 Envelope, 4 1/8 by 9 1/2 inches
        wxPAPER_ENV_11,             // #11 Envelope, 4 1/2 by 10 3/8 inches
        wxPAPER_ENV_12,             // #12 Envelope, 4 3/4 by 11 inches
        wxPAPER_ENV_14,             // #14 Envelope, 5 by 11 1/2 inches
        wxPAPER_ENV_DL,             // DL Envelope, 110 by 220 millimeters
        wxPAPER_ENV_C5,             // C5 Envelope, 162 by 229 millimeters
        wxPAPER_ENV_C3,             // C3 Envelope, 324 by 458 millimeters
        wxPAPER_ENV_C4,             // C4 Envelope, 229 by 324 millimeters
        wxPAPER_ENV_C6,             // C6 Envelope, 114 by 162 millimeters
        wxPAPER_ENV_C65,            // C65 Envelope, 114 by 229 millimeters
        wxPAPER_ENV_B4,             // B4 Envelope, 250 by 353 millimeters
        wxPAPER_ENV_B5,             // B5 Envelope, 176 by 250 millimeters
        wxPAPER_ENV_B6,             // B6 Envelope, 176 by 125 millimeters
        wxPAPER_ENV_ITALY,          // Italy Envelope, 110 by 230 millimeters
        wxPAPER_ENV_MONARCH,        // Monarch Envelope, 3 7/8 by 7 1/2 inches
        wxPAPER_ENV_PERSONAL,       // 6 3/4 Envelope, 3 5/8 by 6 1/2 inches
        wxPAPER_FANFOLD_US,         // US Std Fanfold, 14 7/8 by 11 inches
        wxPAPER_FANFOLD_STD_GERMAN, // German Std Fanfold, 8 1/2 by 12 inches
        wxPAPER_FANFOLD_LGL_GERMAN, // German Legal Fanfold, 8 1/2 by 13 inches

        wxPAPER_ISO_B4,             // B4 (ISO) 250 x 353 mm
        wxPAPER_JAPANESE_POSTCARD,  // Japanese Postcard 100 x 148 mm
        wxPAPER_9X11,               // 9 x 11 in
        wxPAPER_10X11,              // 10 x 11 in
        wxPAPER_15X11,              // 15 x 11 in
        wxPAPER_ENV_INVITE,         // Envelope Invite 220 x 220 mm
        wxPAPER_LETTER_EXTRA,       // Letter Extra 9 \275 x 12 in
        wxPAPER_LEGAL_EXTRA,        // Legal Extra 9 \275 x 15 in
        wxPAPER_TABLOID_EXTRA,      // Tabloid Extra 11.69 x 18 in
        wxPAPER_A4_EXTRA,           // A4 Extra 9.27 x 12.69 in
        wxPAPER_LETTER_TRANSVERSE,  // Letter Transverse 8 \275 x 11 in
        wxPAPER_A4_TRANSVERSE,      // A4 Transverse 210 x 297 mm
        wxPAPER_LETTER_EXTRA_TRANSVERSE, // Letter Extra Transverse 9\275 x 12 in
        wxPAPER_A_PLUS,             // SuperA/SuperA/A4 227 x 356 mm
        wxPAPER_B_PLUS,             // SuperB/SuperB/A3 305 x 487 mm
        wxPAPER_LETTER_PLUS,        // Letter Plus 8.5 x 12.69 in
        wxPAPER_A4_PLUS,            // A4 Plus 210 x 330 mm
        wxPAPER_A5_TRANSVERSE,      // A5 Transverse 148 x 210 mm
        wxPAPER_B5_TRANSVERSE,      // B5 (JIS) Transverse 182 x 257 mm
        wxPAPER_A3_EXTRA,           // A3 Extra 322 x 445 mm
        wxPAPER_A5_EXTRA,           // A5 Extra 174 x 235 mm
        wxPAPER_B5_EXTRA,           // B5 (ISO) Extra 201 x 276 mm
        wxPAPER_A2,                 // A2 420 x 594 mm
        wxPAPER_A3_TRANSVERSE,      // A3 Transverse 297 x 420 mm
        wxPAPER_A3_EXTRA_TRANSVERSE // A3 Extra Transverse 322 x 445 mm
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxPageУстupDialogData_ctor();
        static extern (C) IntPtr wxPageУстupDialogData_ctorPrintУстup(IntPtr dialogData);
        static extern (C) IntPtr wxPageУстupDialogData_ctorPrintData(IntPtr printData);
        static extern (C) проц wxPageУстupDialogData_GetPaperSize(IntPtr сам, inout Размер разм);
        static extern (C) цел wxPageУстupDialogData_GetPaperId(IntPtr сам);
        static extern (C) проц wxPageУстupDialogData_GetMinMarginTopLeft(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_GetMinMarginBottomRight(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_GetMarginTopLeft(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_GetMarginBottomRight(IntPtr сам, inout Точка тчк);
        static extern (C) бул wxPageУстupDialogData_GetDefaultMinMargins(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_GetEnableMargins(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_GetEnableOrientation(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_GetEnablePaper(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_GetEnablePrinter(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_GetDefaultInfo(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_GetEnableHelp(IntPtr сам);
        static extern (C) бул wxPageУстupDialogData_Ok(IntPtr сам);
        static extern (C) проц wxPageУстupDialogData_SetPaperSize(IntPtr сам, inout Размер рм);
        static extern (C) проц wxPageУстupDialogData_SetPaperId(IntPtr сам, цел ид);
        static extern (C) проц wxPageУстupDialogData_SetPaperSize(IntPtr сам, цел ид);
        static extern (C) проц wxPageУстupDialogData_SetMinMarginTopLeft(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_SetMinMarginBottomRight(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_SetMarginTopLeft(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_SetMarginBottomRight(IntPtr сам, inout Точка тчк);
        static extern (C) проц wxPageУстupDialogData_SetDefaultMinMargins(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_SetDefaultInfo(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_EnableMargins(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_EnableOrientation(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_EnablePaper(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_EnablePrinter(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_EnableHelp(IntPtr сам, бул флаг);
        static extern (C) проц wxPageУстupDialogData_CalculateIdFromPaperSize(IntPtr сам);
        static extern (C) проц wxPageУстupDialogData_CalculatePaperSizeFromId(IntPtr сам);
        static extern (C) IntPtr wxPageУстupDialogData_GetPrintData(IntPtr сам);
        static extern (C) проц wxPageУстupDialogData_SetPrintData(IntPtr сам, IntPtr printData);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PageУстupDialogData wxPageУстupDialogData;
    public class PageУстupDialogData : wxObject
    {
        public this(IntPtr wxobj);
        public this();
        public  this(PageУстupDialogData dialogData);
        public  this(PrintData printData);
	public static wxObject Нов(IntPtr ptr) ;
        public Размер paperSize();
        public проц paperSize(Размер значение);
        public PaperSize PaperId();
        public проц PaperId(PaperSize значение);
        public Точка MinMarginTopLeft();
        public проц MinMarginTopLeft(Точка значение) ;
        public Точка MinMarginBottomRight() ;
        public проц MinMarginBottomRight(Точка значение);
        public Точка MarginTopLeft();
        public проц MarginTopLeft(Точка значение);
        public Точка MarginBottomRight();
        public проц MarginBottomRight(Точка значение) ;
        public бул DefaultMinMargins();
        public проц DefaultMinMargins(бул значение);
        public бул EnableOrientation();
        public проц EnableOrientation(бул значение);
        public бул EnablePaper();
        public проц EnablePaper(бул значение) ;
        public бул EnablePrinter();
        public проц EnablePrinter(бул значение) ;
        public бул DefaultInfo() ;
        public проц DefaultInfo(бул значение);
        public бул EnableHelp() ;
        public проц EnableHelp(бул значение) ;
        public бул Ок();
        public бул EnableMargins() ;
        public проц EnableMargins(бул значение) ;
        public проц CalculateIdFromPaperSize();
        public проц CalculatePaperSizeFromId();
        public PrintData printData() ;
        public проц printData(PrintData значение);
        //public static implicit operator PageУстupDialogData (PrintData data);
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxPrintDialogData_ctor();
        static extern (C) IntPtr wxPrintDialogData_ctorDialogData(IntPtr dialogData);
        static extern (C) IntPtr wxPrintDialogData_ctorPrintData(IntPtr printData);
        static extern (C) цел wxPrintDialogData_GetFromPage(IntPtr сам);
        static extern (C) цел wxPrintDialogData_GetToPage(IntPtr сам);
        static extern (C) цел wxPrintDialogData_GetMinPage(IntPtr сам);
        static extern (C) цел wxPrintDialogData_GetMaxPage(IntPtr сам);
        static extern (C) цел wxPrintDialogData_GetNoCopies(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetAllPages(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetSelection(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetCollate(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetPrintToFile(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetУстupDialog(IntPtr сам);
        static extern (C) проц wxPrintDialogData_SetFromPage(IntPtr сам, цел v);
        static extern (C) проц wxPrintDialogData_SetToPage(IntPtr сам, цел v);
        static extern (C) проц wxPrintDialogData_SetMinPage(IntPtr сам, цел v);
        static extern (C) проц wxPrintDialogData_SetMaxPage(IntPtr сам, цел v);
        static extern (C) проц wxPrintDialogData_SetNoCopies(IntPtr сам, цел v);
        static extern (C) проц wxPrintDialogData_SetAllPages(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_SetSelection(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_SetCollate(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_SetPrintToFile(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_SetУстupDialog(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_EnablePrintToFile(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_EnableSelection(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_EnablePageNumbers(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintDialogData_EnableHelp(IntPtr сам, бул флаг);
        static extern (C) бул wxPrintDialogData_GetEnablePrintToFile(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetEnableSelection(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetEnablePageNumbers(IntPtr сам);
        static extern (C) бул wxPrintDialogData_GetEnableHelp(IntPtr сам);
        static extern (C) бул wxPrintDialogData_Ok(IntPtr сам);
        static extern (C) IntPtr wxPrintDialogData_GetPrintData(IntPtr сам);
        static extern (C) проц wxPrintDialogData_SetPrintData(IntPtr сам, IntPtr printData);
		//! \endcond

    alias PrintDialogData wxPrintDialogData;
    public class PrintDialogData : wxObject
    {
        //-----------------------------------------------------------------------------

        public this(IntPtr wxobj);
        public this();
        public this(PrintDialogData dialogData);
        public this(PrintData printData);
	public static wxObject Нов(IntPtr ptr) ;
        public цел FromPage();
        public проц FromPage(цел значение);
        public цел ToPage() ;
        public проц ToPage(цел значение) ;
        public цел MinPage() ;
        public проц MinPage(цел значение) ;
        public цел MaxPage() ;
        public проц MaxPage(цел значение);
        public цел NoCopies() ;
        public проц NoCopies(цел значение) ;
        public бул AllPages() ;
        public проц AllPages(бул значение) ;
        public бул Выбор() ;
        public проц Выбор(бул значение) ;
        public бул Collate() ;
        public проц Collate(бул значение) ;
        public бул PrintToFile() ;
        public проц PrintToFile(бул значение) ;
        public бул УстupDialog();
        public проц УстupDialog(бул значение) ;
        public проц EnablePrintToFile(бул значение) ;
        public бул EnablePrintToFile() ;
        public проц EnableSelection(бул значение);
        public бул EnableSelection() ;
        public проц EnablePageNumbers(бул значение);
        public бул EnablePageNumbers() ;
        public проц EnableHelp(бул значение) ;
        public бул EnableHelp();
        public бул Ок();
        public PrintData printData() ;
        public проц printData(PrintData значение) ;
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxPrintData_ctor();
        static extern (C) IntPtr wxPrintData_ctorPrintData(IntPtr printData);
        static extern (C) цел wxPrintData_GetNoCopies(IntPtr сам);
        static extern (C) бул wxPrintData_GetCollate(IntPtr сам);
        static extern (C) цел wxPrintData_GetOrientation(IntPtr сам);
        static extern (C) бул wxPrintData_Ok(IntPtr сам);
        static extern (C) IntPtr wxPrintData_GetPrinterName(IntPtr сам);
        static extern (C) бул wxPrintData_GetColour(IntPtr сам);
        static extern (C) цел wxPrintData_GetDuplex(IntPtr сам);
        static extern (C) цел wxPrintData_GetPaperId(IntPtr сам);
        static extern (C) проц wxPrintData_GetPaperSize(IntPtr сам, inout Размер рм);
        static extern (C) цел wxPrintData_GetQuality(IntPtr сам);
        static extern (C) проц wxPrintData_SetNoCopies(IntPtr сам, цел v);
        static extern (C) проц wxPrintData_SetCollate(IntPtr сам, бул флаг);
        static extern (C) проц wxPrintData_SetOrientation(IntPtr сам, цел ориент);
        static extern (C) проц wxPrintData_SetPrinterName(IntPtr сам, ткст имя);
        static extern (C) проц wxPrintData_SetColour(IntPtr сам, бул цвет);
        static extern (C) проц wxPrintData_SetDuplex(IntPtr сам, цел duplex);
        static extern (C) проц wxPrintData_SetPaperId(IntPtr сам, цел sizeId);
        static extern (C) проц wxPrintData_SetPaperSize(IntPtr сам, inout Размер рм);
        static extern (C) проц wxPrintData_SetQuality(IntPtr сам, цел quality);
        static extern (C) IntPtr wxPrintData_GetPrinterКоманда(IntPtr сам);
        static extern (C) IntPtr wxPrintData_GetPrinterOptions(IntPtr сам);
        static extern (C) IntPtr wxPrintData_GetPreviewКоманда(IntPtr сам);
        static extern (C) IntPtr wxPrintData_GetFilename(IntPtr сам);
        static extern (C) IntPtr wxPrintData_GetFontMetricPath(IntPtr сам);
        static extern (C) double wxPrintData_GetPrinterScaleX(IntPtr сам);
        static extern (C) double wxPrintData_GetPrinterScaleY(IntPtr сам);
        static extern (C) цел wxPrintData_GetPrinterTranslateX(IntPtr сам);
        static extern (C) цел wxPrintData_GetPrinterTranslateY(IntPtr сам);
        static extern (C) цел wxPrintData_GetPrintMode(IntPtr сам);
        static extern (C) проц wxPrintData_SetPrinterКоманда(IntPtr сам, ткст command);
        static extern (C) проц wxPrintData_SetPrinterOptions(IntPtr сам, ткст options);
        static extern (C) проц wxPrintData_SetPreviewКоманда(IntPtr сам, ткст command);
        static extern (C) проц wxPrintData_SetFilename(IntPtr сам, ткст filename);
        static extern (C) проц wxPrintData_SetFontMetricPath(IntPtr сам, ткст path);
        static extern (C) проц wxPrintData_SetPrinterScaleX(IntPtr сам, double x);
        static extern (C) проц wxPrintData_SetPrinterScaleY(IntPtr сам, double y);
        static extern (C) проц wxPrintData_SetPrinterScaling(IntPtr сам, double x, double y);
        static extern (C) проц wxPrintData_SetPrinterTranslateX(IntPtr сам, цел x);
        static extern (C) проц wxPrintData_SetPrinterTranslateY(IntPtr сам, цел y);
        static extern (C) проц wxPrintData_SetPrinterTranslation(IntPtr сам, цел x, цел y);
        static extern (C) проц wxPrintData_SetPrintMode(IntPtr сам, цел printMode);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintData wxPrintData;
    public class PrintData : wxObject
    {
        public this(IntPtr wxobj);
        public this();
        public this(PrintData printData);
        public static wxObject Нов(IntPtr ptr);
        public цел NoCopies();
        public проц NoCopies(цел значение) ;
        public бул Collate();
        public проц Collate(бул значение) ;
        public цел Ориентация();
        public проц Ориентация(цел значение) ;
        public бул Ок();
        public ткст PrinterName() ;
        public проц PrinterName(ткст значение) ;
        public бул Цвет() ;
        public проц Цвет(бул значение) ;
        public DuplexMode Duplex() ;
        public проц Duplex(DuplexMode значение) ;
        public PaperSize PaperId() ;
        public проц PaperId(PaperSize значение);
        public Размер paperSize() ;
        public проц paperSize(Размер значение) ;
        public PrintQuality Quality();
        public проц Quality(PrintQuality значение) ;
        public ткст PrinterКоманда() ;
        public проц PrinterКоманда(ткст значение);
        public ткст PrinterOptions();
        public проц PrinterOptions(ткст значение) ;
        public ткст PreviewКоманда() ;
        public проц PreviewКоманда(ткст значение) ;
        public ткст Filename();
        public проц Filename(ткст значение) ;
        public ткст FontMetricPath() ;
        public проц FontMetricPath(ткст значение) ;
        public double PrinterScaleX();
        public проц PrinterScaleX(double значение) ;
        public double PrinterScaleY();
        public проц PrinterScaleY(double значение) ;
        public цел PrinterTranslateX();
        public проц PrinterTranslateX(цел значение);
        public цел PrinterTranslateY();
        public проц PrinterTranslateY(цел значение);
        public PrintMode printMode() ;
        public проц printMode(PrintMode значение) ;
        public проц УстPrinterScaling(double x, double y);
        public проц УстPrinterTranslation(цел x, цел y);
    }

