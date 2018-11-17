//-----------------------------------------------------------------------------
// wxD - PrintPreview.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - PrintPreview.cs
//
/// The wxPrintPreview wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: PrintPreview.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.PrintPreview;
public import wx.common;
public import wx.Panel;
public import wx.Frame;
public import wx.ScrolledWindow;
public import wx.PrintData;
public import wx.Printer;

//! \cond EXTERN
static extern (C) ЦелУкз wxPrintPreview_ctor(ЦелУкз printout, ЦелУкз printoutForPrinting, ЦелУкз data);
static extern (C) ЦелУкз wxPrintPreview_ctorPrintData(ЦелУкз printout, ЦелУкз printoutForPrinting, ЦелУкз data);
static extern (C) бул   wxPrintPreview_SetCurrentPage(ЦелУкз сам, цел pageNum);
static extern (C) цел    wxPrintPreview_GetCurrentPage(ЦелУкз сам);
static extern (C) проц   wxPrintPreview_SetPrintout(ЦелУкз сам, ЦелУкз printout);
static extern (C) ЦелУкз wxPrintPreview_GetPrintout(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintPreview_GetPrintoutForPrinting(ЦелУкз сам);
static extern (C) проц   wxPrintPreview_SetFrame(ЦелУкз сам, ЦелУкз frame);
static extern (C) проц   wxPrintPreview_SetCanvas(ЦелУкз сам, ЦелУкз canvas);
static extern (C) ЦелУкз wxPrintPreview_GetFrame(ЦелУкз сам);
static extern (C) ЦелУкз wxPrintPreview_GetCanvas(ЦелУкз сам);
static extern (C) бул   wxPrintPreview_PaintPage(ЦелУкз сам, ЦелУкз canvas, ЦелУкз dc);
static extern (C) бул   wxPrintPreview_DrawBlankPage(ЦелУкз сам, ЦелУкз canvas, ЦелУкз dc);
static extern (C) бул   wxPrintPreview_RenderPage(ЦелУкз сам, цел pageNum);
static extern (C) ЦелУкз wxPrintPreview_GetPrintDialogData(ЦелУкз сам);
static extern (C) проц   wxPrintPreview_SetZoom(ЦелУкз сам, цел percent);
static extern (C) цел    wxPrintPreview_GetZoom(ЦелУкз сам);
static extern (C) цел    wxPrintPreview_GetMaxPage(ЦелУкз сам);
static extern (C) цел    wxPrintPreview_GetMinPage(ЦелУкз сам);
static extern (C) бул   wxPrintPreview_Ok(ЦелУкз сам);
static extern (C) проц   wxPrintPreview_SetOk(ЦелУкз сам, бул ok);
static extern (C) бул   wxPrintPreview_Print(ЦелУкз сам, бул interactive);
static extern (C) проц   wxPrintPreview_DetermineScaling(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PrintPreview wxPrintPreview;
public class PrintPreview : wxObject
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Printout printout, Printout printoutForPrinting, PrintDialogData data)
    {
        this(wxPrintPreview_ctor(wxObject.SafePtr(printout), wxObject.SafePtr(printoutForPrinting), wxObject.SafePtr(data)));
    }

    public this(Printout printout, Printout printoutForPrinting)
    {
        this(printout, printoutForPrinting, cast(PrintData)null);
    }
    public this(Printout printout, Printout printoutForPrinting, PrintData data)
    {
        this(wxPrintPreview_ctor(wxObject.SafePtr(printout), wxObject.SafePtr(printoutForPrinting), wxObject.SafePtr(data)));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new PrintPreview(ptr);
    }
    //-----------------------------------------------------------------------------

    public бул УстCurrentPage(цел pageNum)
    {
        return wxPrintPreview_SetCurrentPage(wxobj, pageNum);
    }

    public цел CurrentPage()
    {
        return wxPrintPreview_GetCurrentPage(wxobj);
    }
    public проц CurrentPage(цел значение)
    {
        УстCurrentPage(значение);
    }

    //-----------------------------------------------------------------------------

    public проц printout(Printout значение)
    {
        wxPrintPreview_SetPrintout(wxobj, wxObject.SafePtr(значение));
    }
    public Printout printout()
    {
        return cast(Printout)НайдиОбъект(wxPrintPreview_GetPrintout(wxobj)/*, &Printout.Нов*/);
    }

    //-----------------------------------------------------------------------------

    public Printout PrintoutForPrinting()
    {
        return cast(Printout)НайдиОбъект(wxPrintPreview_GetPrintoutForPrinting(wxobj)/*, &Printout.Нов*/);
    }

    //-----------------------------------------------------------------------------

    public проц frame(Frame значение)
    {
        wxPrintPreview_SetFrame(wxobj, wxObject.SafePtr(значение));
    }
    public Frame frame()
    {
        return cast(Frame)НайдиОбъект(wxPrintPreview_GetFrame(wxobj), &Frame.Нов);
    }

    //-----------------------------------------------------------------------------

    public Окно Canvas()
    {
        return cast(Окно)НайдиОбъект(wxPrintPreview_GetCanvas(wxobj), &Окно.Нов);
    }
    public проц Canvas(Окно значение)
    {
        wxPrintPreview_SetCanvas(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public бул PaintPage(Окно canvas, inout DC dc)
    {
        return wxPrintPreview_PaintPage(wxobj, wxObject.SafePtr(canvas), wxObject.SafePtr(dc));
    }

    //-----------------------------------------------------------------------------

    public бул DrawBlankPage(Окно canvas, inout DC dc)
    {
        return wxPrintPreview_DrawBlankPage(wxobj, wxObject.SafePtr(canvas), wxObject.SafePtr(dc));
    }

    //-----------------------------------------------------------------------------

    public бул RenderPage(цел pageNum)
    {
        return wxPrintPreview_RenderPage(wxobj, pageNum);
    }

    //-----------------------------------------------------------------------------

    public PrintDialogData printDialogData()
    {
        return cast(PrintDialogData)НайдиОбъект(wxPrintPreview_GetPrintDialogData(wxobj), &PrintDialogData.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц Zoom(цел значение)
    {
        wxPrintPreview_SetZoom(wxobj, значение);
    }
    public цел Zoom()
    {
        return wxPrintPreview_GetZoom(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел MaxPage()
    {
        return wxPrintPreview_GetMaxPage(wxobj);
    }

    public цел MinPage()
    {
        return wxPrintPreview_GetMinPage(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Ок()
    {
        return wxPrintPreview_Ok(wxobj);
    }
    public проц Ок(бул значение)
    {
        wxPrintPreview_SetOk(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул Print(бул interactive)
    {
        return wxPrintPreview_Print(wxobj, interactive);
    }

    //-----------------------------------------------------------------------------

    public проц DetermineScaling()
    {
        wxPrintPreview_DetermineScaling(wxobj);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxPreviewFrame_ctor(ЦелУкз preview, ЦелУкз родитель, ткст титул, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц   wxPreviewFrame_Initialize(ЦелУкз сам);
static extern (C) проц   wxPreviewFrame_CreateCanvas(ЦелУкз сам);
static extern (C) проц   wxPreviewFrame_CreateControlBar(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PreviewFrame wxPreviewFrame;
public class PreviewFrame : Frame
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(PrintPreview preview, Окно родитель, ткст титул = "Print Preview", Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxDEFAULT_FRAME_STYLE, ткст имя = "frame")
    {
        this(wxPreviewFrame_ctor(wxObject.SafePtr(preview), wxObject.SafePtr(родитель), титул, поз, Размер, cast(бцел)стиль, имя));
    }

    //-----------------------------------------------------------------------------

    public проц Инициализируй()
    {
        wxPreviewFrame_Initialize(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц CreateCanvas()
    {
        wxPreviewFrame_CreateCanvas(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц CreateControlBar()
    {
        wxPreviewFrame_CreateControlBar(wxobj);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxPreviewControlBar_ctor(ЦелУкз preview, цел buttons, ЦелУкз родитель, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) проц   wxPreviewControlBar_CreateButtons(ЦелУкз сам);
static extern (C) проц   wxPreviewControlBar_SetZoomControl(ЦелУкз сам, цел zoom);
static extern (C) цел    wxPreviewControlBar_GetZoomControl(ЦелУкз сам);
static extern (C) ЦелУкз wxPreviewControlBar_GetPrintPreview(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias PreviewControlBar wxPreviewControlBar;
public class PreviewControlBar : Panel
{
    const цел wxPREVIEW_PRINT       =  1;
    const цел wxPREVIEW_PREVIOUS    =  2;
    const цел wxPREVIEW_NEXT        =  4;
    const цел wxPREVIEW_ZOOM        =  8;
    const цел wxPREVIEW_FIRST       = 16;
    const цел wxPREVIEW_LAST        = 32;
    const цел wxPREVIEW_GOTO        = 64;

    const цел wxPREVIEW_DEFAULT     = wxPREVIEW_PREVIOUS|wxPREVIEW_NEXT|wxPREVIEW_ZOOM
                                      |wxPREVIEW_FIRST|wxPREVIEW_GOTO|wxPREVIEW_LAST;

    // Ids for controls
    const цел wxID_PREVIEW_CLOSE      = 1;
    const цел wxID_PREVIEW_NEXT       = 2;
    const цел wxID_PREVIEW_PREVIOUS   = 3;
    const цел wxID_PREVIEW_PRINT      = 4;
    const цел wxID_PREVIEW_ZOOM       = 5;
    const цел wxID_PREVIEW_FIRST      = 6;
    const цел wxID_PREVIEW_LAST       = 7;
    const цел wxID_PREVIEW_GOTO       = 8;

    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(PrintPreview preview, цел buttons, Окно родитель, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=wxTAB_TRAVERSAL, ткст имя="panel")
    {
        this(wxPreviewControlBar_ctor(wxObject.SafePtr(preview), buttons, wxObject.SafePtr(родитель), поз, Размер, cast(бцел)стиль, имя));
    }

    //-----------------------------------------------------------------------------

    public проц CreateButtons()
    {
        wxPreviewControlBar_CreateButtons(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел ZoomControl()
    {
        return wxPreviewControlBar_GetZoomControl(wxobj);
    }
    public проц ZoomControl(цел значение)
    {
        wxPreviewControlBar_SetZoomControl(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public PrintPreview printPreview()
    {
        return cast(PrintPreview)НайдиОбъект(wxPreviewControlBar_GetPrintPreview(wxobj), &PrintPreview.Нов);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxPreviewCanvas_ctor(ЦелУкз preview, ЦелУкз родитель, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
//! \endcond

//-----------------------------------------------------------------------------

alias PreviewCanvas wxPreviewCanvas;
public class PreviewCanvas : ScrolledWindow
{
    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(PrintPreview preview, Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = "canvas")
    {
        this(wxPreviewCanvas_ctor(wxObject.SafePtr(preview), wxObject.SafePtr(родитель), поз, Размер, cast(бцел)стиль, имя));
    }
}
