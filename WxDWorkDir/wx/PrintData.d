//-----------------------------------------------------------------------------
// wxD - PrintData.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - PrintData.cs
//
/// The wxPrint данные wrapper classes.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: PrintData.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

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
        static extern (C) ЦУк wxPageSetupДиалогData_ctor();
        static extern (C) ЦУк wxPageSetupДиалогData_ctorPrintSetup(ЦУк dialogData);
        static extern (C) ЦУк wxPageSetupДиалогData_ctorPrintData(ЦУк printData);
        static extern (C) проц wxPageSetupДиалогData_GetPaperSize(ЦУк сам, inout Размер size);
        static extern (C) цел wxPageSetupДиалогData_GetPaperId(ЦУк сам);
        static extern (C) проц wxPageSetupДиалогData_GetMinMarginTopLeft(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_GetMinMarginBottomRight(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_GetMarginTopLeft(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_GetMarginBottomRight(ЦУк сам, inout Точка pt);
        static extern (C) бул wxPageSetupДиалогData_GetDefaultMinMargins(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_GetEnableMargins(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_GetEnableOrientation(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_GetEnablePaper(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_GetEnablePrinter(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_GetDefaultInfo(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_GetEnableHelp(ЦУк сам);
        static extern (C) бул wxPageSetupДиалогData_Ok(ЦУк сам);
        static extern (C) проц wxPageSetupДиалогData_SetPaperSize(ЦУк сам, inout Размер sz);
        static extern (C) проц wxPageSetupДиалогData_SetPaperId(ЦУк сам, цел ид);
        static extern (C) проц wxPageSetupДиалогData_SetPaperSize(ЦУк сам, цел ид);
        static extern (C) проц wxPageSetupДиалогData_SetMinMarginTopLeft(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_SetMinMarginBottomRight(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_SetMarginTopLeft(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_SetMarginBottomRight(ЦУк сам, inout Точка pt);
        static extern (C) проц wxPageSetupДиалогData_SetDefaultMinMargins(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_SetDefaultInfo(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_EnableMargins(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_EnableOrientation(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_EnablePaper(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_EnablePrinter(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_EnableHelp(ЦУк сам, бул flag);
        static extern (C) проц wxPageSetupДиалогData_CalculateIdFromPaperSize(ЦУк сам);
        static extern (C) проц wxPageSetupДиалогData_CalculatePaperSizeFromId(ЦУк сам);
        static extern (C) ЦУк wxPageSetupДиалогData_GetPrintData(ЦУк сам);
        static extern (C) проц wxPageSetupДиалогData_SetPrintData(ЦУк сам, ЦУк printData);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PageSetupДиалогData wxPageSetupДиалогData;
    public class PageSetupДиалогData : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(wxPageSetupДиалогData_ctor()); }
        public  this(PageSetupДиалогData dialogData)
            { this(wxPageSetupДиалогData_ctorPrintSetup(wxObject.SafePtr(dialogData))); }
        public  this(PrintData printData)
            { this(wxPageSetupДиалогData_ctorPrintData(wxObject.SafePtr(printData))); }

	public static wxObject Нов(ЦУк ptr) { return new PageSetupДиалогData(ptr); }
        //-----------------------------------------------------------------------------

        public Размер paperSize() { 
                Размер size;
                wxPageSetupДиалогData_GetPaperSize(шхобъ, size);
                return size;
            }
        public проц paperSize(Размер значение) { wxPageSetupДиалогData_SetPaperSize(шхобъ, значение); }

        public PaperSize PaperId() { return cast(PaperSize)wxPageSetupДиалогData_GetPaperId(шхобъ); }
        public проц PaperId(PaperSize значение) { wxPageSetupДиалогData_SetPaperId(шхобъ, cast(цел)значение); }

        //-----------------------------------------------------------------------------

        public Точка MinMarginTopLeft() { 
                Точка pt;
                wxPageSetupДиалогData_GetMinMarginTopLeft(шхобъ, pt);
                return pt;
            }
        public проц MinMarginTopLeft(Точка значение) { wxPageSetupДиалогData_SetMinMarginTopLeft(шхобъ, значение); }

        public Точка MinMarginBottomRight() { 
                Точка pt;
                wxPageSetupДиалогData_GetMinMarginBottomRight(шхобъ, pt);
                return pt;
            }
        public проц MinMarginBottomRight(Точка значение) { wxPageSetupДиалогData_SetMinMarginBottomRight(шхобъ, значение); }

        public Точка MarginTopLeft() { 
                Точка pt;
                wxPageSetupДиалогData_GetMarginTopLeft(шхобъ, pt);
                return pt;
            }
        public проц MarginTopLeft(Точка значение) { wxPageSetupДиалогData_SetMarginTopLeft(шхобъ, значение); }

        public Точка MarginBottomRight() {
                Точка pt;
                wxPageSetupДиалогData_GetMarginBottomRight(шхобъ, pt);
                return pt;
            } 
        public проц MarginBottomRight(Точка значение) { wxPageSetupДиалогData_SetMarginBottomRight(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул DefaultMinMargins() { return wxPageSetupДиалогData_GetDefaultMinMargins(шхобъ); }
        public проц DefaultMinMargins(бул значение) { wxPageSetupДиалогData_SetDefaultMinMargins(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул EnableOrientation() { return wxPageSetupДиалогData_GetEnableOrientation(шхобъ); }
        public проц EnableOrientation(бул значение) { wxPageSetupДиалогData_EnableOrientation(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул EnablePaper() { return wxPageSetupДиалогData_GetEnablePaper(шхобъ); }
        public проц EnablePaper(бул значение) { wxPageSetupДиалогData_EnablePaper(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул EnablePrinter() { return wxPageSetupДиалогData_GetEnablePrinter(шхобъ); }
        public проц EnablePrinter(бул значение) { wxPageSetupДиалогData_EnablePrinter(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул DefaultInfo() { return wxPageSetupДиалогData_GetDefaultInfo(шхобъ); }
        public проц DefaultInfo(бул значение) { wxPageSetupДиалогData_SetDefaultInfo(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул EnableHelp() { return wxPageSetupДиалогData_GetEnableHelp(шхобъ); }
        public проц EnableHelp(бул значение) { wxPageSetupДиалогData_EnableHelp(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Ок()
        {
            return wxPageSetupДиалогData_Ok(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public бул EnableMargins() { return wxPageSetupДиалогData_GetEnableMargins(шхобъ); }
        public проц EnableMargins(бул значение) { wxPageSetupДиалогData_EnableMargins(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц CalculateIdFromPaperSize()
        {
            wxPageSetupДиалогData_CalculateIdFromPaperSize(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц CalculatePaperSizeFromId()
        {
            wxPageSetupДиалогData_CalculatePaperSizeFromId(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public PrintData printData() { return cast(PrintData)FindObject(wxPageSetupДиалогData_GetPrintData(шхобъ), &PrintData.Нов); }
        public проц printData(PrintData значение) { wxPageSetupДиалогData_SetPrintData(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------
/+
        public static implicit operator PageSetupДиалогData (PrintData данные)
        {
            return new this(данные);
        }
+/
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPrintДиалогData_ctor();
        static extern (C) ЦУк wxPrintДиалогData_ctorДиалогData(ЦУк dialogData);
        static extern (C) ЦУк wxPrintДиалогData_ctorPrintData(ЦУк printData);
        static extern (C) цел wxPrintДиалогData_GetFromPage(ЦУк сам);
        static extern (C) цел wxPrintДиалогData_GetToPage(ЦУк сам);
        static extern (C) цел wxPrintДиалогData_GetMinPage(ЦУк сам);
        static extern (C) цел wxPrintДиалогData_GetMaxPage(ЦУк сам);
        static extern (C) цел wxPrintДиалогData_GetNoCopies(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetAllPages(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetSelection(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetCollate(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetPrintToFile(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetSetupДиалог(ЦУк сам);
        static extern (C) проц wxPrintДиалогData_SetFromPage(ЦУк сам, цел v);
        static extern (C) проц wxPrintДиалогData_SetToPage(ЦУк сам, цел v);
        static extern (C) проц wxPrintДиалогData_SetMinPage(ЦУк сам, цел v);
        static extern (C) проц wxPrintДиалогData_SetMaxPage(ЦУк сам, цел v);
        static extern (C) проц wxPrintДиалогData_SetNoCopies(ЦУк сам, цел v);
        static extern (C) проц wxPrintДиалогData_SetAllPages(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_SetSelection(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_SetCollate(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_SetPrintToFile(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_SetSetupДиалог(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_EnablePrintToFile(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_EnableSelection(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_EnablePageNumbers(ЦУк сам, бул flag);
        static extern (C) проц wxPrintДиалогData_EnableHelp(ЦУк сам, бул flag);
        static extern (C) бул wxPrintДиалогData_GetEnablePrintToFile(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetEnableSelection(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetEnablePageNumbers(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_GetEnableHelp(ЦУк сам);
        static extern (C) бул wxPrintДиалогData_Ok(ЦУк сам);
        static extern (C) ЦУк wxPrintДиалогData_GetPrintData(ЦУк сам);
        static extern (C) проц wxPrintДиалогData_SetPrintData(ЦУк сам, ЦУк printData);
		//! \endcond

    alias PrintДиалогData wxPrintДиалогData;
    public class PrintДиалогData : wxObject
    {
        //-----------------------------------------------------------------------------

        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this()
            { this(wxPrintДиалогData_ctor()); }
        public this(PrintДиалогData dialogData)
            { this(wxPrintДиалогData_ctorДиалогData(wxObject.SafePtr(dialogData))); }
        public this(PrintData printData)
            { this(wxPrintДиалогData_ctorPrintData(wxObject.SafePtr(printData))); }
	public static wxObject Нов(ЦУк ptr) { return new PrintДиалогData(ptr); }

        //-----------------------------------------------------------------------------

        public цел FromPage() { return wxPrintДиалогData_GetFromPage(шхобъ); }
        public проц FromPage(цел значение) { wxPrintДиалогData_SetFromPage(шхобъ, значение); }

        public цел ToPage() { return wxPrintДиалогData_GetToPage(шхобъ); }
        public проц ToPage(цел значение) { wxPrintДиалогData_SetToPage(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел MinPage() { return wxPrintДиалогData_GetMinPage(шхобъ); }
        public проц MinPage(цел значение) { wxPrintДиалогData_SetMinPage(шхобъ, значение); }

        public цел MaxPage() { return wxPrintДиалогData_GetMaxPage(шхобъ); }
        public проц MaxPage(цел значение) { wxPrintДиалогData_SetMaxPage(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел NoCopies() { return wxPrintДиалогData_GetNoCopies(шхобъ); }
        public проц NoCopies(цел значение) { wxPrintДиалогData_SetNoCopies(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул AllPages() { return wxPrintДиалогData_GetAllPages(шхобъ); }
        public проц AllPages(бул значение) { wxPrintДиалогData_SetAllPages(шхобъ, значение); }

        public бул Selection() { return wxPrintДиалогData_GetSelection(шхобъ); }
        public проц Selection(бул значение) { wxPrintДиалогData_SetSelection(шхобъ, значение); }

        public бул Collate() { return wxPrintДиалогData_GetCollate(шхобъ); }
        public проц Collate(бул значение) { wxPrintДиалогData_SetCollate(шхобъ, значение); }

        public бул PrintToFile() { return wxPrintДиалогData_GetPrintToFile(шхобъ); }
        public проц PrintToFile(бул значение) { wxPrintДиалогData_SetPrintToFile(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул SetupДиалог() { return wxPrintДиалогData_GetSetupДиалог(шхобъ); }
        public проц SetupДиалог(бул значение) { wxPrintДиалогData_SetSetupДиалог(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц EnablePrintToFile(бул значение) { wxPrintДиалогData_EnablePrintToFile(шхобъ, значение); }
        public бул EnablePrintToFile() { return wxPrintДиалогData_GetEnablePrintToFile(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц EnableSelection(бул значение) { wxPrintДиалогData_EnableSelection(шхобъ, значение); }
        public бул EnableSelection() { return wxPrintДиалогData_GetEnableSelection(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц EnablePageNumbers(бул значение) { wxPrintДиалогData_EnablePageNumbers(шхобъ, значение); }
        public бул EnablePageNumbers() { return wxPrintДиалогData_GetEnablePageNumbers(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц EnableHelp(бул значение) { wxPrintДиалогData_EnableHelp(шхобъ, значение); }
        public бул EnableHelp() { return wxPrintДиалогData_GetEnableHelp(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул Ок()
        {
            return wxPrintДиалогData_Ok(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public PrintData printData() { return cast(PrintData)FindObject(wxPrintДиалогData_GetPrintData(шхобъ), &PrintData.Нов); }
        public проц printData(PrintData значение) { wxPrintДиалогData_SetPrintData(шхобъ, wxObject.SafePtr(значение)); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPrintData_ctor();
        static extern (C) ЦУк wxPrintData_ctorPrintData(ЦУк printData);
        static extern (C) цел wxPrintData_GetNoCopies(ЦУк сам);
        static extern (C) бул wxPrintData_GetCollate(ЦУк сам);
        static extern (C) цел wxPrintData_GetOrientation(ЦУк сам);
        static extern (C) бул wxPrintData_Ok(ЦУк сам);
        static extern (C) ЦУк wxPrintData_GetPrinterName(ЦУк сам);
        static extern (C) бул wxPrintData_GetColour(ЦУк сам);
        static extern (C) цел wxPrintData_GetDuplex(ЦУк сам);
        static extern (C) цел wxPrintData_GetPaperId(ЦУк сам);
        static extern (C) проц wxPrintData_GetPaperSize(ЦУк сам, inout Размер sz);
        static extern (C) цел wxPrintData_GetQuality(ЦУк сам);
        static extern (C) проц wxPrintData_SetNoCopies(ЦУк сам, цел v);
        static extern (C) проц wxPrintData_SetCollate(ЦУк сам, бул flag);
       // static extern (C) проц wxPrintData_SetOrientation(ЦУк сам, цел orient);
        static extern (C) проц wxPrintData_SetPrinterName(ЦУк сам, ткст имя);
        static extern (C) проц wxPrintData_SetColour(ЦУк сам, бул colour);
        static extern (C) проц wxPrintData_SetDuplex(ЦУк сам, цел duplex);
        static extern (C) проц wxPrintData_SetPaperId(ЦУк сам, цел sizeId);
        static extern (C) проц wxPrintData_SetPaperSize(ЦУк сам, inout Размер sz);
        static extern (C) проц wxPrintData_SetQuality(ЦУк сам, цел quality);
        static extern (C) ЦУк wxPrintData_GetPrinterCommand(ЦУк сам);
        static extern (C) ЦУк wxPrintData_GetPrinterOptions(ЦУк сам);
        static extern (C) ЦУк wxPrintData_GetPreviewCommand(ЦУк сам);
        static extern (C) ЦУк wxPrintData_GetFilename(ЦУк сам);
        static extern (C) ЦУк wxPrintData_GetFontMetricPath(ЦУк сам);
        static extern (C) дво wxPrintData_GetPrinterScaleX(ЦУк сам);
        static extern (C) дво wxPrintData_GetPrinterScaleY(ЦУк сам);
        static extern (C) цел wxPrintData_GetPrinterTranslateX(ЦУк сам);
        static extern (C) цел wxPrintData_GetPrinterTranslateY(ЦУк сам);
        static extern (C) цел wxPrintData_GetPrintMode(ЦУк сам);
        static extern (C) проц wxPrintData_SetPrinterCommand(ЦУк сам, ткст command);
        static extern (C) проц wxPrintData_SetPrinterOptions(ЦУк сам, ткст options);
        static extern (C) проц wxPrintData_SetPreviewCommand(ЦУк сам, ткст command);
        static extern (C) проц wxPrintData_SetFilename(ЦУк сам, ткст фимя);
        static extern (C) проц wxPrintData_SetFontMetricPath(ЦУк сам, ткст путь);
        static extern (C) проц wxPrintData_SetPrinterScaleX(ЦУк сам, дво x);
        static extern (C) проц wxPrintData_SetPrinterScaleY(ЦУк сам, дво y);
        static extern (C) проц wxPrintData_SetPrinterScaling(ЦУк сам, дво x, дво y);
        static extern (C) проц wxPrintData_SetPrinterTranslateX(ЦУк сам, цел x);
        static extern (C) проц wxPrintData_SetPrinterTranslateY(ЦУк сам, цел y);
        static extern (C) проц wxPrintData_SetPrinterTranslation(ЦУк сам, цел x, цел y);
        static extern (C) проц wxPrintData_SetPrintMode(ЦУк сам, цел printMode);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintData wxPrintData;
    public class PrintData : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(wxPrintData_ctor()); }
        public this(PrintData printData)
            { this(wxPrintData_ctorPrintData(wxObject.SafePtr(printData))); }

        public static wxObject Нов(ЦУк ptr) { return new PrintData(ptr); }

        //-----------------------------------------------------------------------------

        public цел NoCopies() { return wxPrintData_GetNoCopies(шхобъ); }
        public проц NoCopies(цел значение) { wxPrintData_SetNoCopies(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Collate() { return wxPrintData_GetCollate(шхобъ); }
        public проц Collate(бул значение) { wxPrintData_SetCollate(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Ориентация() { return wxPrintData_GetOrientation(шхобъ); }
       // public проц Ориентация(цел значение) { wxPrintData_SetOrientation(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Ок()
        {
            return wxPrintData_Ok(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public ткст PrinterName() { return cast(ткст) new wxString(wxPrintData_GetPrinterName(шхобъ), да); }
        public проц PrinterName(ткст значение) { wxPrintData_SetPrinterName(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Цвет() { return wxPrintData_GetColour(шхобъ); }
        public проц Цвет(бул значение) { wxPrintData_SetColour(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public DuplexMode Duplex() { return cast(DuplexMode)wxPrintData_GetDuplex(шхобъ); }
        public проц Duplex(DuplexMode значение) { wxPrintData_SetDuplex(шхобъ, cast(цел)значение); }

        //-----------------------------------------------------------------------------

        public PaperSize PaperId() { return cast(PaperSize)wxPrintData_GetPaperId(шхобъ); }
        public проц PaperId(PaperSize значение) { wxPrintData_SetPaperId(шхобъ, cast(цел)значение); }

        //-----------------------------------------------------------------------------

        public Размер paperSize() { 
                Размер sz;
                wxPrintData_GetPaperSize(шхобъ, sz);
                return sz;
            }
        public проц paperSize(Размер значение) { wxPrintData_SetPaperSize(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public PrintQuality Quality() { return cast(PrintQuality)wxPrintData_GetQuality(шхобъ); }
        public проц Quality(PrintQuality значение) { wxPrintData_SetQuality(шхобъ, cast(цел)значение); }

        //-----------------------------------------------------------------------------

        public ткст PrinterCommand() { return cast(ткст) new wxString(wxPrintData_GetPrinterCommand(шхобъ), да); }
        public проц PrinterCommand(ткст значение) { wxPrintData_SetPrinterCommand(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст PrinterOptions() { return cast(ткст) new wxString(wxPrintData_GetPrinterOptions(шхобъ), да); }
        public проц PrinterOptions(ткст значение) { wxPrintData_SetPrinterOptions(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст PreviewCommand() { return cast(ткст) new wxString(wxPrintData_GetPreviewCommand(шхобъ), да); }
        public проц PreviewCommand(ткст значение) { wxPrintData_SetPreviewCommand(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст Filename() { return cast(ткст) new wxString(wxPrintData_GetFilename(шхобъ), да); }
        public проц Filename(ткст значение) { wxPrintData_SetFilename(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст FontMetricPath() { return cast(ткст) new wxString(wxPrintData_GetFontMetricPath(шхобъ), да); }
        public проц FontMetricPath(ткст значение) { wxPrintData_SetFontMetricPath(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public дво PrinterScaleX() { return wxPrintData_GetPrinterScaleX(шхобъ); }
        public проц PrinterScaleX(дво значение) { wxPrintData_SetPrinterScaleX(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public дво PrinterScaleY() { return wxPrintData_GetPrinterScaleY(шхобъ); }
        public проц PrinterScaleY(дво значение) { wxPrintData_SetPrinterScaleY(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел PrinterTranslateX() { return wxPrintData_GetPrinterTranslateX(шхобъ); }
        public проц PrinterTranslateX(цел значение) { wxPrintData_SetPrinterTranslateX(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел PrinterTranslateY() { return wxPrintData_GetPrinterTranslateY(шхобъ); }
        public проц PrinterTranslateY(цел значение) { wxPrintData_SetPrinterTranslateY(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public PrintMode printMode() { return cast(PrintMode)wxPrintData_GetPrintMode(шхобъ); }
        public проц printMode(PrintMode значение) { wxPrintData_SetPrintMode(шхобъ, cast(цел)значение); }

        //-----------------------------------------------------------------------------

        public проц SetPrinterScaling(дво x, дво y)
        {
            wxPrintData_SetPrinterScaling(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц SetPrinterTranslation(цел x, цел y)
        {
            wxPrintData_SetPrinterTranslation(шхобъ, x, y);
        }
    }

