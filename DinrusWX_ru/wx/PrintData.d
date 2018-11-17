//-----------------------------------------------------------------------------
// wxD - PrintData.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - PrintData.cs
//
/// The wxPrint data wrapper classes.
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
static extern (C) ЦелУкз wxPageУстupDialogData_ctor();
static extern (C) ЦелУкз wxPageУстupDialogData_ctorPrintУстup(ЦелУкз dialogData);
static extern (C) ЦелУкз wxPageУстupDialogData_ctorPrintData(ЦелУкз printData);
static extern (C) проц wxPageУстupDialogData_GetPaperSize(ЦелУкз сам, inout Размер Размер);
static extern (C) цел wxPageУстupDialogData_GetPaperId(ЦелУкз сам);
static extern (C) проц wxPageУстupDialogData_GetMinMarginTopLeft(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_GetMinMarginBottomRight(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_GetMarginTopLeft(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_GetMarginBottomRight(ЦелУкз сам, inout Точка тчк);
static extern (C) бул wxPageУстupDialogData_GetDefaultMinMargins(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_GetEnableMargins(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_GetEnableOrientation(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_GetEnablePaper(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_GetEnablePrinter(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_GetDefaultInfo(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_GetEnableHelp(ЦелУкз сам);
static extern (C) бул wxPageУстupDialogData_Ok(ЦелУкз сам);
static extern (C) проц wxPageУстupDialogData_SetPaperSize(ЦелУкз сам, inout Размер рм);
static extern (C) проц wxPageУстupDialogData_SetPaperId(ЦелУкз сам, цел ид);
static extern (C) проц wxPageУстupDialogData_SetPaperSize(ЦелУкз сам, цел ид);
static extern (C) проц wxPageУстupDialogData_SetMinMarginTopLeft(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_SetMinMarginBottomRight(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_SetMarginTopLeft(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_SetMarginBottomRight(ЦелУкз сам, inout Точка тчк);
static extern (C) проц wxPageУстupDialogData_SetDefaultMinMargins(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_SetDefaultInfo(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_EnableMargins(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_EnableOrientation(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_EnablePaper(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_EnablePrinter(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_EnableHelp(ЦелУкз сам, бул flag);
static extern (C) проц wxPageУстupDialogData_CalculateIdFromPaperSize(ЦелУкз сам);
static extern (C) проц wxPageУстupDialogData_CalculatePaperSizeFromId(ЦелУкз сам);
static extern (C) ЦелУкз wxPageУстupDialogData_GetPrintData(ЦелУкз сам);
static extern (C) проц wxPageУстupDialogData_SetPrintData(ЦелУкз сам, ЦелУкз printData);
//! \endcond

//-----------------------------------------------------------------------------

alias PageУстupDialogData wxPageУстupDialogData;
public class PageУстupDialogData : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxPageУстupDialogData_ctor());
    }
    public  this(PageУстupDialogData dialogData)
    {
        this(wxPageУстupDialogData_ctorPrintУстup(wxObject.SafePtr(dialogData)));
    }
    public  this(PrintData printData)
    {
        this(wxPageУстupDialogData_ctorPrintData(wxObject.SafePtr(printData)));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new PageУстupDialogData(ptr);
    }
    //-----------------------------------------------------------------------------

    public Размер paperSize()
    {
        Размер Размер;
        wxPageУстupDialogData_GetPaperSize(wxobj, Размер);
        return Размер;
    }
    public проц paperSize(Размер значение)
    {
        wxPageУстupDialogData_SetPaperSize(wxobj, значение);
    }

    public PaperSize PaperId()
    {
        return cast(PaperSize)wxPageУстupDialogData_GetPaperId(wxobj);
    }
    public проц PaperId(PaperSize значение)
    {
        wxPageУстupDialogData_SetPaperId(wxobj, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    public Точка MinMarginTopLeft()
    {
        Точка тчк;
        wxPageУстupDialogData_GetMinMarginTopLeft(wxobj, тчк);
        return тчк;
    }
    public проц MinMarginTopLeft(Точка значение)
    {
        wxPageУстupDialogData_SetMinMarginTopLeft(wxobj, значение);
    }

    public Точка MinMarginBottomRight()
    {
        Точка тчк;
        wxPageУстupDialogData_GetMinMarginBottomRight(wxobj, тчк);
        return тчк;
    }
    public проц MinMarginBottomRight(Точка значение)
    {
        wxPageУстupDialogData_SetMinMarginBottomRight(wxobj, значение);
    }

    public Точка MarginTopLeft()
    {
        Точка тчк;
        wxPageУстupDialogData_GetMarginTopLeft(wxobj, тчк);
        return тчк;
    }
    public проц MarginTopLeft(Точка значение)
    {
        wxPageУстupDialogData_SetMarginTopLeft(wxobj, значение);
    }

    public Точка MarginBottomRight()
    {
        Точка тчк;
        wxPageУстupDialogData_GetMarginBottomRight(wxobj, тчк);
        return тчк;
    }
    public проц MarginBottomRight(Точка значение)
    {
        wxPageУстupDialogData_SetMarginBottomRight(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул DefaultMinMargins()
    {
        return wxPageУстupDialogData_GetDefaultMinMargins(wxobj);
    }
    public проц DefaultMinMargins(бул значение)
    {
        wxPageУстupDialogData_SetDefaultMinMargins(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул EnableOrientation()
    {
        return wxPageУстupDialogData_GetEnableOrientation(wxobj);
    }
    public проц EnableOrientation(бул значение)
    {
        wxPageУстupDialogData_EnableOrientation(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул EnablePaper()
    {
        return wxPageУстupDialogData_GetEnablePaper(wxobj);
    }
    public проц EnablePaper(бул значение)
    {
        wxPageУстupDialogData_EnablePaper(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул EnablePrinter()
    {
        return wxPageУстupDialogData_GetEnablePrinter(wxobj);
    }
    public проц EnablePrinter(бул значение)
    {
        wxPageУстupDialogData_EnablePrinter(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул DefaultInfo()
    {
        return wxPageУстupDialogData_GetDefaultInfo(wxobj);
    }
    public проц DefaultInfo(бул значение)
    {
        wxPageУстupDialogData_SetDefaultInfo(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул EnableHelp()
    {
        return wxPageУстupDialogData_GetEnableHelp(wxobj);
    }
    public проц EnableHelp(бул значение)
    {
        wxPageУстupDialogData_EnableHelp(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxPageУстupDialogData_Ok(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул EnableMargins()
    {
        return wxPageУстupDialogData_GetEnableMargins(wxobj);
    }
    public проц EnableMargins(бул значение)
    {
        wxPageУстupDialogData_EnableMargins(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц CalculateIdFromPaperSize()
    {
        wxPageУстupDialogData_CalculateIdFromPaperSize(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц CalculatePaperSizeFromId()
    {
        wxPageУстupDialogData_CalculatePaperSizeFromId(wxobj);
    }

    //-----------------------------------------------------------------------------

    public PrintData printData()
    {
        return cast(PrintData)НайдиОбъект(wxPageУстupDialogData_GetPrintData(wxobj), &PrintData.Нов);
    }
    public проц printData(PrintData значение)
    {
        wxPageУстupDialogData_SetPrintData(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------
    /+
    public static implicit operator PageУстupDialogData (PrintData data)
    {
        return new this(data);
    }
    +/
}

//! \cond EXTERN
static extern (C) ЦелУкз wxPrintDialogData_ctor();
static extern (C) ЦелУкз wxPrintDialogData_ctorDialogData(ЦелУкз dialogData);
static extern (C) ЦелУкз wxPrintDialogData_ctorPrintData(ЦелУкз printData);
static extern (C) цел wxPrintDialogData_GetFromPage(ЦелУкз сам);
static extern (C) цел wxPrintDialogData_GetToPage(ЦелУкз сам);
static extern (C) цел wxPrintDialogData_GetMinPage(ЦелУкз сам);
static extern (C) цел wxPrintDialogData_GetMaxPage(ЦелУкз сам);
static extern (C) цел wxPrintDialogData_GetNoCopies(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetAllPages(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetSelection(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetCollate(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetPrintToFile(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetУстupDialog(ЦелУкз сам);
static extern (C) проц wxPrintDialogData_SetFromPage(ЦелУкз сам, цел v);
static extern (C) проц wxPrintDialogData_SetToPage(ЦелУкз сам, цел v);
static extern (C) проц wxPrintDialogData_SetMinPage(ЦелУкз сам, цел v);
static extern (C) проц wxPrintDialogData_SetMaxPage(ЦелУкз сам, цел v);
static extern (C) проц wxPrintDialogData_SetNoCopies(ЦелУкз сам, цел v);
static extern (C) проц wxPrintDialogData_SetAllPages(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_SetSelection(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_SetCollate(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_SetPrintToFile(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_SetУстupDialog(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_EnablePrintToFile(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_EnableSelection(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_EnablePageNumbers(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintDialogData_EnableHelp(ЦелУкз сам, бул flag);
static extern (C) бул wxPrintDialogData_GetEnablePrintToFile(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetEnableSelection(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetEnablePageNumbers(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_GetEnableHelp(ЦелУкз сам);
static extern (C) бул wxPrintDialogData_Ok(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintDialogData_GetPrintData(ЦелУкз сам);
static extern (C) проц wxPrintDialogData_SetPrintData(ЦелУкз сам, ЦелУкз printData);
//! \endcond

alias PrintDialogData wxPrintDialogData;
public class PrintDialogData : wxObject
{
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxPrintDialogData_ctor());
    }
    public this(PrintDialogData dialogData)
    {
        this(wxPrintDialogData_ctorDialogData(wxObject.SafePtr(dialogData)));
    }
    public this(PrintData printData)
    {
        this(wxPrintDialogData_ctorPrintData(wxObject.SafePtr(printData)));
    }
    public static wxObject Нов(ЦелУкз ptr)
    {
        return new PrintDialogData(ptr);
    }

    //-----------------------------------------------------------------------------

    public цел FromPage()
    {
        return wxPrintDialogData_GetFromPage(wxobj);
    }
    public проц FromPage(цел значение)
    {
        wxPrintDialogData_SetFromPage(wxobj, значение);
    }

    public цел ToPage()
    {
        return wxPrintDialogData_GetToPage(wxobj);
    }
    public проц ToPage(цел значение)
    {
        wxPrintDialogData_SetToPage(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел MinPage()
    {
        return wxPrintDialogData_GetMinPage(wxobj);
    }
    public проц MinPage(цел значение)
    {
        wxPrintDialogData_SetMinPage(wxobj, значение);
    }

    public цел MaxPage()
    {
        return wxPrintDialogData_GetMaxPage(wxobj);
    }
    public проц MaxPage(цел значение)
    {
        wxPrintDialogData_SetMaxPage(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел NoCopies()
    {
        return wxPrintDialogData_GetNoCopies(wxobj);
    }
    public проц NoCopies(цел значение)
    {
        wxPrintDialogData_SetNoCopies(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул AllPages()
    {
        return wxPrintDialogData_GetAllPages(wxobj);
    }
    public проц AllPages(бул значение)
    {
        wxPrintDialogData_SetAllPages(wxobj, значение);
    }

    public бул Selection()
    {
        return wxPrintDialogData_GetSelection(wxobj);
    }
    public проц Selection(бул значение)
    {
        wxPrintDialogData_SetSelection(wxobj, значение);
    }

    public бул Collate()
    {
        return wxPrintDialogData_GetCollate(wxobj);
    }
    public проц Collate(бул значение)
    {
        wxPrintDialogData_SetCollate(wxobj, значение);
    }

    public бул PrintToFile()
    {
        return wxPrintDialogData_GetPrintToFile(wxobj);
    }
    public проц PrintToFile(бул значение)
    {
        wxPrintDialogData_SetPrintToFile(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул УстupDialog()
    {
        return wxPrintDialogData_GetУстupDialog(wxobj);
    }
    public проц УстupDialog(бул значение)
    {
        wxPrintDialogData_SetУстupDialog(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц EnablePrintToFile(бул значение)
    {
        wxPrintDialogData_EnablePrintToFile(wxobj, значение);
    }
    public бул EnablePrintToFile()
    {
        return wxPrintDialogData_GetEnablePrintToFile(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц EnableSelection(бул значение)
    {
        wxPrintDialogData_EnableSelection(wxobj, значение);
    }
    public бул EnableSelection()
    {
        return wxPrintDialogData_GetEnableSelection(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц EnablePageNumbers(бул значение)
    {
        wxPrintDialogData_EnablePageNumbers(wxobj, значение);
    }
    public бул EnablePageNumbers()
    {
        return wxPrintDialogData_GetEnablePageNumbers(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц EnableHelp(бул значение)
    {
        wxPrintDialogData_EnableHelp(wxobj, значение);
    }
    public бул EnableHelp()
    {
        return wxPrintDialogData_GetEnableHelp(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxPrintDialogData_Ok(wxobj);
    }

    //-----------------------------------------------------------------------------

    public PrintData printData()
    {
        return cast(PrintData)НайдиОбъект(wxPrintDialogData_GetPrintData(wxobj), &PrintData.Нов);
    }
    public проц printData(PrintData значение)
    {
        wxPrintDialogData_SetPrintData(wxobj, wxObject.SafePtr(значение));
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxPrintData_ctor();
static extern (C) ЦелУкз wxPrintData_ctorPrintData(ЦелУкз printData);
static extern (C) цел wxPrintData_GetNoCopies(ЦелУкз сам);
static extern (C) бул wxPrintData_GetCollate(ЦелУкз сам);
static extern (C) цел wxPrintData_GetOrientation(ЦелУкз сам);
static extern (C) бул wxPrintData_Ok(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintData_GetPrinterName(ЦелУкз сам);
static extern (C) бул wxPrintData_GetColour(ЦелУкз сам);
static extern (C) цел wxPrintData_GetDuplex(ЦелУкз сам);
static extern (C) цел wxPrintData_GetPaperId(ЦелУкз сам);
static extern (C) проц wxPrintData_GetPaperSize(ЦелУкз сам, inout Размер рм);
static extern (C) цел wxPrintData_GetQuality(ЦелУкз сам);
static extern (C) проц wxPrintData_SetNoCopies(ЦелУкз сам, цел v);
static extern (C) проц wxPrintData_SetCollate(ЦелУкз сам, бул flag);
static extern (C) проц wxPrintData_SetOrientation(ЦелУкз сам, цел ориент);
static extern (C) проц wxPrintData_SetPrinterName(ЦелУкз сам, ткст имя);
static extern (C) проц wxPrintData_SetColour(ЦелУкз сам, бул цвет);
static extern (C) проц wxPrintData_SetDuplex(ЦелУкз сам, цел duplex);
static extern (C) проц wxPrintData_SetPaperId(ЦелУкз сам, цел sizeId);
static extern (C) проц wxPrintData_SetPaperSize(ЦелУкз сам, inout Размер рм);
static extern (C) проц wxPrintData_SetQuality(ЦелУкз сам, цел quality);
static extern (C) ЦелУкз wxPrintData_GetPrinterCommand(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintData_GetPrinterOptions(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintData_GetPreviewCommand(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintData_GetFilename(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintData_GetFontMetricPath(ЦелУкз сам);
static extern (C) double wxPrintData_GetPrinterScaleX(ЦелУкз сам);
static extern (C) double wxPrintData_GetPrinterScaleY(ЦелУкз сам);
static extern (C) цел wxPrintData_GetPrinterTranslateX(ЦелУкз сам);
static extern (C) цел wxPrintData_GetPrinterTranslateY(ЦелУкз сам);
static extern (C) цел wxPrintData_GetPrintMode(ЦелУкз сам);
static extern (C) проц wxPrintData_SetPrinterCommand(ЦелУкз сам, ткст command);
static extern (C) проц wxPrintData_SetPrinterOptions(ЦелУкз сам, ткст options);
static extern (C) проц wxPrintData_SetPreviewCommand(ЦелУкз сам, ткст command);
static extern (C) проц wxPrintData_SetFilename(ЦелУкз сам, ткст имяф);
static extern (C) проц wxPrintData_SetFontMetricPath(ЦелУкз сам, ткст path);
static extern (C) проц wxPrintData_SetPrinterScaleX(ЦелУкз сам, double x);
static extern (C) проц wxPrintData_SetPrinterScaleY(ЦелУкз сам, double y);
static extern (C) проц wxPrintData_SetPrinterScaling(ЦелУкз сам, double x, double y);
static extern (C) проц wxPrintData_SetPrinterTranslateX(ЦелУкз сам, цел x);
static extern (C) проц wxPrintData_SetPrinterTranslateY(ЦелУкз сам, цел y);
static extern (C) проц wxPrintData_SetPrinterTranslation(ЦелУкз сам, цел x, цел y);
static extern (C) проц wxPrintData_SetPrintMode(ЦелУкз сам, цел printMode);
//! \endcond

//-----------------------------------------------------------------------------

alias PrintData wxPrintData;
public class PrintData : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxPrintData_ctor());
    }
    public this(PrintData printData)
    {
        this(wxPrintData_ctorPrintData(wxObject.SafePtr(printData)));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new PrintData(ptr);
    }

    //-----------------------------------------------------------------------------

    public цел NoCopies()
    {
        return wxPrintData_GetNoCopies(wxobj);
    }
    public проц NoCopies(цел значение)
    {
        wxPrintData_SetNoCopies(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул Collate()
    {
        return wxPrintData_GetCollate(wxobj);
    }
    public проц Collate(бул значение)
    {
        wxPrintData_SetCollate(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел Ориентация()
    {
        return wxPrintData_GetOrientation(wxobj);
    }
    public проц Ориентация(цел значение)
    {
        wxPrintData_SetOrientation(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxPrintData_Ok(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст PrinterName()
    {
        return cast(ткст) new wxString(wxPrintData_GetPrinterName(wxobj), да);
    }
    public проц PrinterName(ткст значение)
    {
        wxPrintData_SetPrinterName(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул Цвет()
    {
        return wxPrintData_GetColour(wxobj);
    }
    public проц Цвет(бул значение)
    {
        wxPrintData_SetColour(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public DuplexMode Duplex()
    {
        return cast(DuplexMode)wxPrintData_GetDuplex(wxobj);
    }
    public проц Duplex(DuplexMode значение)
    {
        wxPrintData_SetDuplex(wxobj, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    public PaperSize PaperId()
    {
        return cast(PaperSize)wxPrintData_GetPaperId(wxobj);
    }
    public проц PaperId(PaperSize значение)
    {
        wxPrintData_SetPaperId(wxobj, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    public Размер paperSize()
    {
        Размер рм;
        wxPrintData_GetPaperSize(wxobj, рм);
        return рм;
    }
    public проц paperSize(Размер значение)
    {
        wxPrintData_SetPaperSize(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public PrintQuality Quality()
    {
        return cast(PrintQuality)wxPrintData_GetQuality(wxobj);
    }
    public проц Quality(PrintQuality значение)
    {
        wxPrintData_SetQuality(wxobj, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    public ткст PrinterCommand()
    {
        return cast(ткст) new wxString(wxPrintData_GetPrinterCommand(wxobj), да);
    }
    public проц PrinterCommand(ткст значение)
    {
        wxPrintData_SetPrinterCommand(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст PrinterOptions()
    {
        return cast(ткст) new wxString(wxPrintData_GetPrinterOptions(wxobj), да);
    }
    public проц PrinterOptions(ткст значение)
    {
        wxPrintData_SetPrinterOptions(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст PreviewCommand()
    {
        return cast(ткст) new wxString(wxPrintData_GetPreviewCommand(wxobj), да);
    }
    public проц PreviewCommand(ткст значение)
    {
        wxPrintData_SetPreviewCommand(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст ИмяФайла()
    {
        return cast(ткст) new wxString(wxPrintData_GetFilename(wxobj), да);
    }
    public проц ИмяФайла(ткст значение)
    {
        wxPrintData_SetFilename(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ткст FontMetricPath()
    {
        return cast(ткст) new wxString(wxPrintData_GetFontMetricPath(wxobj), да);
    }
    public проц FontMetricPath(ткст значение)
    {
        wxPrintData_SetFontMetricPath(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public double PrinterScaleX()
    {
        return wxPrintData_GetPrinterScaleX(wxobj);
    }
    public проц PrinterScaleX(double значение)
    {
        wxPrintData_SetPrinterScaleX(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public double PrinterScaleY()
    {
        return wxPrintData_GetPrinterScaleY(wxobj);
    }
    public проц PrinterScaleY(double значение)
    {
        wxPrintData_SetPrinterScaleY(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел PrinterTranslateX()
    {
        return wxPrintData_GetPrinterTranslateX(wxobj);
    }
    public проц PrinterTranslateX(цел значение)
    {
        wxPrintData_SetPrinterTranslateX(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел PrinterTranslateY()
    {
        return wxPrintData_GetPrinterTranslateY(wxobj);
    }
    public проц PrinterTranslateY(цел значение)
    {
        wxPrintData_SetPrinterTranslateY(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public PrintMode printMode()
    {
        return cast(PrintMode)wxPrintData_GetPrintMode(wxobj);
    }
    public проц printMode(PrintMode значение)
    {
        wxPrintData_SetPrintMode(wxobj, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    public проц УстPrinterScaling(double x, double y)
    {
        wxPrintData_SetPrinterScaling(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public проц УстPrinterTranslation(цел x, цел y)
    {
        wxPrintData_SetPrinterTranslation(wxobj, x, y);
    }
}

