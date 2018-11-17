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
static extern (C) ЦелУкз wxPrinter_ctor(ЦелУкз data);
static extern (C) ЦелУкз wxPrinter_CreateAbortWindow(ЦелУкз сам, ЦелУкз родитель, ЦелУкз printout);
static extern (C) проц   wxPrinter_ReportError(ЦелУкз сам, ЦелУкз родитель, ЦелУкз printout, ткст message);
static extern (C) ЦелУкз wxPrinter_GetPrintDialogData(ЦелУкз сам);
static extern (C) бул   wxPrinter_GetAbort(ЦелУкз сам);
static extern (C) цел    wxPrinter_GetLastError(ЦелУкз сам);
static extern (C) бул   wxPrinter_Setup(ЦелУкз сам, ЦелУкз родитель);
static extern (C) бул   wxPrinter_Print(ЦелУкз сам, ЦелУкз родитель, ЦелУкз printout, бул prompt);
static extern (C) ЦелУкз wxPrinter_PrintDialog(ЦелУкз сам, ЦелУкз родитель);
//! \endcond

//-----------------------------------------------------------------------------

alias Printer wxPrinter;
public class Printer : wxObject
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(cast(PrintDialogData)null);
    }
    public this(PrintDialogData data)
    {
        this(wxPrinter_ctor(wxObject.SafePtr(data)));
    }

    //-----------------------------------------------------------------------------

    public Окно CreateAbortWindow(Окно родитель, Printout printout)
    {
        return cast(Окно)НайдиОбъект(wxPrinter_CreateAbortWindow(wxobj, wxObject.SafePtr(родитель), wxObject.SafePtr(printout)), &Окно.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц ReportError(Окно родитель, Printout printout, ткст message)
    {
        wxPrinter_ReportError(wxobj, wxObject.SafePtr(родитель), wxObject.SafePtr(printout), message);
    }

    //-----------------------------------------------------------------------------

    public PrintDialogData printDialogData()
    {
        return cast(PrintDialogData)НайдиОбъект(wxPrinter_GetPrintDialogData(wxobj), &PrintDialogData.Нов);
    }

    //-----------------------------------------------------------------------------

    public бул Abort()
    {
        return wxPrinter_GetAbort(wxobj);
    }

    //-----------------------------------------------------------------------------

    public PrinterError LastError()
    {
        return cast(PrinterError)wxPrinter_GetLastError(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Устup(Окно родитель)
    {
        return wxPrinter_Setup(wxobj, wxObject.SafePtr(родитель));
    }

    //-----------------------------------------------------------------------------

    public бул Print(Окно родитель, Printout printout, бул prompt)
    {
        return wxPrinter_Print(wxobj, wxObject.SafePtr(родитель), wxObject.SafePtr(printout), prompt);
    }

    //-----------------------------------------------------------------------------

    public DC PrintDialog(Окно родитель)
    {
        return cast(DC)НайдиОбъект(wxPrinter_PrintDialog(wxobj, wxObject.SafePtr(родитель)), &DC.Нов);
    }
}


//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(Printout объ) Virtual_NoParams;
    alias бул function(Printout объ, цел i) Virtual_ParamsInt;
    alias бул function(Printout объ, цел startPage, цел endPage) Virtual_OnBeginDocument;
    alias проц function(Printout объ, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo) Virtual_GetPageInfo;
}

static extern (C) ЦелУкз wxPrintout_ctor(ткст титул);
static extern (C) бул   wxPrintout_OnBeginDocument(ЦелУкз сам, цел startPage, цел endPage);
static extern (C) проц   wxPrintout_OnEndDocument(ЦелУкз сам);
static extern (C) проц   wxPrintout_OnBeginPrinting(ЦелУкз сам);
static extern (C) проц   wxPrintout_OnEndPrinting(ЦелУкз сам);
static extern (C) проц   wxPrintout_OnPreparePrinting(ЦелУкз сам);
static extern (C) бул   wxPrintout_HasPage(ЦелУкз сам, цел page);
static extern (C) проц   wxPrintout_GetPageInfo(ЦелУкз сам, inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo);
static extern (C) ЦелУкз wxPrintout_GetTitle(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintout_GetDC(ЦелУкз сам);
static extern (C) проц   wxPrintout_SetDC(ЦелУкз сам, ЦелУкз dc);
static extern (C) проц   wxPrintout_SetPageSizePixels(ЦелУкз сам, цел w, цел h);
static extern (C) проц   wxPrintout_GetPageSizePixels(ЦелУкз сам, inout цел w, inout цел h);
static extern (C) проц   wxPrintout_SetPageSizeMM(ЦелУкз сам, цел w, цел h);
static extern (C) проц   wxPrintout_GetPageSizeMM(ЦелУкз сам, inout цел w, inout цел h);
static extern (C) проц   wxPrintout_SetPPIScreen(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxPrintout_GetPPIScreen(ЦелУкз сам, inout цел x, inout цел y);
static extern (C) проц   wxPrintout_SetPPIPrinter(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxPrintout_GetPPIPrinter(ЦелУкз сам, inout цел x, inout цел y);
static extern (C) бул   wxPrintout_IsPreview(ЦелУкз сам);
static extern (C) проц   wxPrintout_SetIsPreview(ЦелУкз сам, бул p);

static extern (C) проц   wxPrintout_RegisterVirtual(ЦелУкз сам, Printout объ, Virtual_OnBeginDocument onBeginDocument, Virtual_NoParams onEndDocument, Virtual_NoParams onBeginPrinting, Virtual_NoParams onEndPrinting, Virtual_NoParams onPreparePrinting, Virtual_ParamsInt hasPage, Virtual_ParamsInt onPrintPage, Virtual_GetPageInfo getPageInfo);
//! \endcond

//-----------------------------------------------------------------------------

alias Printout wxPrintout;
public abstract class Printout : wxObject
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);

        wxPrintout_RegisterVirtual(wxobj,this,
                                   &staticOnBeginDocument,
                                   &staticOnEndDocument,
                                   &staticOnBeginPrinting,
                                   &staticOnEndPrinting,
                                   &staticOnPreparePrinting,
                                   &staticHasPage,
                                   &staticOnPrintPage,
                                   &staticGetPageInfo);
    }

    public this(ткст титул)
    {
        this(wxPrintout_ctor(титул));
    }

//	public static wxObject Нов(ЦелУкз ptr) { return new Printout(ptr); }
    //-----------------------------------------------------------------------------

    static extern(C) private бул staticOnBeginDocument(Printout объ, цел startPage, цел endPage)
    {
        return объ.OnBeginDocument(startPage, endPage);
    }
    public  бул OnBeginDocument(цел startPage, цел endPage)
    {
        return wxPrintout_OnBeginDocument(wxobj, startPage, endPage);
    }

    static extern(C) private проц staticOnEndDocument(Printout объ)
    {
        объ.OnEndDocument();
    }
    public  проц OnEndDocument()
    {
        wxPrintout_OnEndDocument(wxobj);
    }

    //-----------------------------------------------------------------------------

    static extern(C) private проц staticOnBeginPrinting(Printout объ)
    {
        объ.OnBeginPrinting();
    }
    public  проц OnBeginPrinting()
    {
        wxPrintout_OnBeginPrinting(wxobj);
    }

    static extern(C) private проц staticOnEndPrinting(Printout объ)
    {
        объ.OnEndPrinting();
    }
    public  проц OnEndPrinting()
    {
        wxPrintout_OnEndPrinting(wxobj);
    }

    static extern(C) private проц staticOnPreparePrinting(Printout объ)
    {
        объ.OnPreparePrinting();
    }
    public  проц OnPreparePrinting()
    {
        wxPrintout_OnPreparePrinting(wxobj);
    }

    //-----------------------------------------------------------------------------

    static extern(C) private бул staticHasPage(Printout объ, цел page)
    {
        return объ.HasPage(page);
    }
    public  бул HasPage(цел page)
    {
        return wxPrintout_HasPage(wxobj, page);
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
    public  проц GetPageInfo(inout цел minPage, inout цел maxPage, inout цел pageFrom, inout цел pageTo)
    {
        wxPrintout_GetPageInfo(wxobj, minPage, maxPage, pageFrom, pageTo);
    }

    //-----------------------------------------------------------------------------

    public ткст Титул()
    {
        return cast(ткст) new wxString(wxPrintout_GetTitle(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public DC Dc()
    {
        return cast(DC)НайдиОбъект(wxPrintout_GetDC(wxobj), &DC.Нов);
    }
    public проц Dc(DC значение)
    {
        wxPrintout_SetDC(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public проц УстPageSizePixels(цел w, цел h)
    {
        wxPrintout_SetPageSizePixels(wxobj, w, h);
    }

    public проц GetPageSizePixels(out цел w, out цел h)
    {
        w = h = 0;
        wxPrintout_GetPageSizePixels(wxobj, w, h);
    }

    //-----------------------------------------------------------------------------

    public проц УстPageSizeMM(цел w, цел h)
    {
        wxPrintout_SetPageSizeMM(wxobj, w, h);
    }

    public проц GetPageSizeMM(out цел w, out цел h)
    {
        w = h = 0;
        wxPrintout_GetPageSizeMM(wxobj, w, h);
    }

    //-----------------------------------------------------------------------------

    public проц УстPPIScreen(цел x, цел y)
    {
        wxPrintout_SetPPIScreen(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public проц GetPPIScreen(out цел x, out цел y)
    {
        x = y = 0;
        wxPrintout_GetPPIScreen(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public проц УстPPIPrinter(цел x, цел y)
    {
        wxPrintout_SetPPIPrinter(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public проц GetPPIPrinter(out цел x, out цел y)
    {
        x = y = 0;
        wxPrintout_GetPPIPrinter(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public бул IsPreview()
    {
        return wxPrintout_IsPreview(wxobj);
    }
    public проц IsPreview(бул значение)
    {
        wxPrintout_SetIsPreview(wxobj, значение);
    }
}

