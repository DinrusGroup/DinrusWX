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
        static extern (C) ЦУк wxPrintPreview_ctor(ЦУк printout, ЦУк printoutForPrinting, ЦУк данные);
        static extern (C) ЦУк wxPrintPreview_ctorPrintData(ЦУк printout, ЦУк printoutForPrinting, ЦУк данные);
        static extern (C) бул   wxPrintPreview_SetCurrentPage(ЦУк сам, цел pageNum);
        static extern (C) цел    wxPrintPreview_GetCurrentPage(ЦУк сам);
        static extern (C) проц   wxPrintPreview_SetPrintout(ЦУк сам, ЦУк printout);
        static extern (C) ЦУк wxPrintPreview_GetPrintout(ЦУк сам);
        static extern (C) ЦУк wxPrintPreview_GetPrintoutForPrinting(ЦУк сам);
        static extern (C) проц   wxPrintPreview_SetFrame(ЦУк сам, ЦУк frame);
        static extern (C) проц   wxPrintPreview_SetCanvas(ЦУк сам, ЦУк canvas);
        static extern (C) ЦУк wxPrintPreview_GetFrame(ЦУк сам);
        static extern (C) ЦУк wxPrintPreview_GetCanvas(ЦУк сам);
        static extern (C) бул   wxPrintPreview_PaintPage(ЦУк сам, ЦУк canvas, ЦУк dc);
        static extern (C) бул   wxPrintPreview_DrawBlankPage(ЦУк сам, ЦУк canvas, ЦУк dc);
        static extern (C) бул   wxPrintPreview_RenderPage(ЦУк сам, цел pageNum);
        static extern (C) ЦУк wxPrintPreview_GetPrintДиалогData(ЦУк сам);
        static extern (C) проц   wxPrintPreview_SetZoom(ЦУк сам, цел percent);
        static extern (C) цел    wxPrintPreview_GetZoom(ЦУк сам);
        static extern (C) цел    wxPrintPreview_GetMaxPage(ЦУк сам);
        static extern (C) цел    wxPrintPreview_GetMinPage(ЦУк сам);
        static extern (C) бул   wxPrintPreview_Ok(ЦУк сам);
        static extern (C) проц   wxPrintPreview_SetOk(ЦУк сам, бул ok);
        static extern (C) бул   wxPrintPreview_Print(ЦУк сам, бул interactive);
        static extern (C) проц   wxPrintPreview_DetermineScaling(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintPreview wxPrintPreview;
    public class PrintPreview : wxObject
    {
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Printout printout, Printout printoutForPrinting, PrintДиалогData данные)
            { this(wxPrintPreview_ctor(wxObject.SafePtr(printout), wxObject.SafePtr(printoutForPrinting), wxObject.SafePtr(данные))); }

        public this(Printout printout, Printout printoutForPrinting)
            { this(printout, printoutForPrinting, cast(PrintData)пусто); }
        public this(Printout printout, Printout printoutForPrinting, PrintData данные)
            { this(wxPrintPreview_ctor(wxObject.SafePtr(printout), wxObject.SafePtr(printoutForPrinting), wxObject.SafePtr(данные))); }

	public static wxObject Нов(ЦУк ptr) { return new PrintPreview(ptr); }
        //-----------------------------------------------------------------------------

        public бул SetCurrentPage(цел pageNum)
        {
            return wxPrintPreview_SetCurrentPage(шхобъ, pageNum);
        }

        public цел CurrentPage() { return wxPrintPreview_GetCurrentPage(шхобъ); }
        public проц CurrentPage(цел значение) { SetCurrentPage(значение); }

        //-----------------------------------------------------------------------------

        public проц printout(Printout значение) { wxPrintPreview_SetPrintout(шхобъ, wxObject.SafePtr(значение)); }
        public Printout printout() { return cast(Printout)FindObject(wxPrintPreview_GetPrintout(шхобъ)/*, &Printout.Нов*/); }

        //-----------------------------------------------------------------------------

        public Printout PrintoutForPrinting() { return cast(Printout)FindObject(wxPrintPreview_GetPrintoutForPrinting(шхобъ)/*, &Printout.Нов*/); }

        //-----------------------------------------------------------------------------

        public проц frame(Frame значение) { wxPrintPreview_SetFrame(шхобъ, wxObject.SafePtr(значение)); }
        public Frame frame() { return cast(Frame)FindObject(wxPrintPreview_GetFrame(шхобъ), &Frame.Нов); }

        //-----------------------------------------------------------------------------

        public Окно Canvas() { return cast(Окно)FindObject(wxPrintPreview_GetCanvas(шхобъ), &Окно.Нов); }
        public проц Canvas(Окно значение) { wxPrintPreview_SetCanvas(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public бул PaintPage(Окно canvas, inout DC dc)
        {
            return wxPrintPreview_PaintPage(шхобъ, wxObject.SafePtr(canvas), wxObject.SafePtr(dc));
        }

        //-----------------------------------------------------------------------------

        public бул DrawBlankPage(Окно canvas, inout DC dc)
        {
            return wxPrintPreview_DrawBlankPage(шхобъ, wxObject.SafePtr(canvas), wxObject.SafePtr(dc));
        }

        //-----------------------------------------------------------------------------

        public бул RenderPage(цел pageNum)
        {
            return wxPrintPreview_RenderPage(шхобъ, pageNum);
        }

        //-----------------------------------------------------------------------------

        public PrintДиалогData printДиалогData() { return cast(PrintДиалогData)FindObject(wxPrintPreview_GetPrintДиалогData(шхобъ), &PrintДиалогData.Нов); }

        //-----------------------------------------------------------------------------

        public проц Zoom(цел значение) { wxPrintPreview_SetZoom(шхобъ, значение); }
        public цел Zoom() { return wxPrintPreview_GetZoom(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел MaxPage() { return wxPrintPreview_GetMaxPage(шхобъ); }

        public цел MinPage() { return wxPrintPreview_GetMinPage(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул Ок() { return wxPrintPreview_Ok(шхобъ); }
        public проц Ок(бул значение) { wxPrintPreview_SetOk(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Print(бул interactive)
        {
            return wxPrintPreview_Print(шхобъ, interactive);
        }

        //-----------------------------------------------------------------------------

        public проц DetermineScaling()
        {
            wxPrintPreview_DetermineScaling(шхобъ);
        }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPreviewFrame_ctor(ЦУк preview, ЦУк родитель, ткст title, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
        static extern (C) проц   wxPreviewFrame_Initialize(ЦУк сам);
        static extern (C) проц   wxPreviewFrame_CreateCanvas(ЦУк сам);
        static extern (C) проц   wxPreviewFrame_CreateControlBar(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PreviewFrame wxPreviewFrame;
    public class PreviewFrame : Frame
    {
        private this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(PrintPreview preview, Окно родитель, ткст title = "Print Preview", Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxDEFAULT_FRAME_STYLE, ткст имя = "frame")
            { this(wxPreviewFrame_ctor(wxObject.SafePtr(preview), wxObject.SafePtr(родитель), title, поз, size, cast(бцел)стиль, имя)); }

        //-----------------------------------------------------------------------------

        public проц Инициализуй()
        {
            wxPreviewFrame_Initialize(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц CreateCanvas()
        {
            wxPreviewFrame_CreateCanvas(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц CreateControlBar()
        {
            wxPreviewFrame_CreateControlBar(шхобъ);
        }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPreviewControlBar_ctor(ЦУк preview, цел buttons, ЦУк родитель, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
        static extern (C) проц   wxPreviewControlBar_CreateButtons(ЦУк сам);
        static extern (C) проц   wxPreviewControlBar_SetZoomControl(ЦУк сам, цел zoom);
        static extern (C) цел    wxPreviewControlBar_GetZoomControl(ЦУк сам);
        static extern (C) ЦУк wxPreviewControlBar_GetPrintPreview(ЦУк сам);
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
    
        private this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(PrintPreview preview, цел buttons, Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxTAB_TRAVERSAL, ткст имя="panel")
            { this(wxPreviewControlBar_ctor(wxObject.SafePtr(preview), buttons, wxObject.SafePtr(родитель), поз, size, cast(бцел)стиль, имя)); }

        //-----------------------------------------------------------------------------

        public проц CreateButtons()
        {
            wxPreviewControlBar_CreateButtons(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public цел ZoomControl() { return wxPreviewControlBar_GetZoomControl(шхобъ); }
        public проц ZoomControl(цел значение) { wxPreviewControlBar_SetZoomControl(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public PrintPreview printPreview() { return cast(PrintPreview)FindObject(wxPreviewControlBar_GetPrintPreview(шхобъ), &PrintPreview.Нов); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxPreviewCanvas_ctor(ЦУк preview, ЦУк родитель, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PreviewCanvas wxPreviewCanvas;
    public class PreviewCanvas : ScrolledWindow
    {
        private this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(PrintPreview preview, Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = "canvas")
            { this(wxPreviewCanvas_ctor(wxObject.SafePtr(preview), wxObject.SafePtr(родитель), поз, size, cast(бцел)стиль, имя)); }
    }
