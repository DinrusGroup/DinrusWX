module wx.PrintDialog;
public import wx.common;
public import wx.Dialog;
public import wx.PrintData;

		//! \cond EXTERN
        static extern (C) IntPtr wxPageУстupDialog_ctor(IntPtr родитель, IntPtr data);
        static extern (C) IntPtr wxPageУстupDialog_GetPageУстupData(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PageУстupDialog wxPageУстupDialog;
    public class PageУстupDialog : Dialog
    {
        private this(IntPtr wxobj);
        public this(Окно родитель);
        public this(Окно родитель, PageУстupDialogData data);
        public PageУстupDialogData PageУстupData() ;
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxPrintDialog_ctor(IntPtr родитель, IntPtr data);
        static extern (C) IntPtr wxPrintDialog_ctorPrintData(IntPtr родитель, IntPtr data);
        static extern (C) IntPtr wxPrintDialog_GetPrintData(IntPtr сам);
        static extern (C) IntPtr wxPrintDialog_GetPrintDialogData(IntPtr сам);
        static extern (C) IntPtr wxPrintDialog_GetPrintDC(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintDialog wxPrintDialog;
    public class PrintDialog : Dialog
    {
        private this(IntPtr wxobj);
        public this(Окно родитель);
        public this(Окно родитель, PrintDialogData data);
        public this(Окно родитель, PrintData data);
        public PrintData printData() ;
        public PrintDialogData printDialogData();
        public DC PrintDC() ;
    }

//! \cond VERSION
version(none) /*(__WXGTK__)*/{
    
		//! \cond EXTERN
        static extern (C) IntPtr wxPrintУстupDialog_ctor(IntPtr родитель, IntPtr data);
        static extern (C) IntPtr wxPrintУстupDialog_ctorPrintData(IntPtr родитель, IntPtr data);
        static extern (C) проц wxPrintУстupDialog_Init(IntPtr сам, IntPtr data);
        static extern (C) IntPtr wxPrintУстupDialog_GetPrintData(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias PrintУстupDialog wxPrintУстupDialog;
    public class PrintУстupDialog : Dialog
    {
        private this(IntPtr wxobj);
        public this(Окно родитель);
        public this(Окно родитель, PrintDialogData data);
        public this(Окно родитель, PrintData data);
        public проц Init(PrintData data);
        public PrintData printData() ;
    }

} // __WXGTK__
//! \endcond
