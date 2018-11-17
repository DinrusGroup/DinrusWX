module wx.Document;
public import wx.common;
public import wx.EvtHandler;

//! \cond VERSION
version(NOT_READY_YET){

		//! \cond EXTERN
        static extern (C) IntPtr wxDocument_ctor(IntPtr родитель);
        static extern (C) проц   wxDocument_SetFilename(IntPtr сам, ткст filename, бул notifyViews);
        static extern (C) IntPtr wxDocument_GetFilename(IntPtr сам);
        static extern (C) проц   wxDocument_SetTitle(IntPtr сам, ткст title);
        static extern (C) IntPtr wxDocument_GetTitle(IntPtr сам);
        static extern (C) проц   wxDocument_SetDocumentName(IntPtr сам, ткст имя);
        static extern (C) IntPtr wxDocument_GetDocumentName(IntPtr сам);
        static extern (C) бул   wxDocument_GetDocumentSaved(IntPtr сам);
        static extern (C) проц   wxDocument_SetDocumentSaved(IntPtr сам, бул saved);
        static extern (C) бул   wxDocument_Close(IntPtr сам);
        static extern (C) бул   wxDocument_Save(IntPtr сам);
        static extern (C) бул   wxDocument_SaveAs(IntPtr сам);
        static extern (C) бул   wxDocument_Revert(IntPtr сам);
        //static extern (C) IntPtr wxDocument_SaveObject(IntPtr сам, IntPtr stream);
        //static extern (C) IntPtr wxDocument_LoadObject(IntPtr сам, IntPtr stream);
        static extern (C) IntPtr wxDocument_GetCommandProcessor(IntPtr сам);
        static extern (C) проц   wxDocument_SetКомандаProcessor(IntPtr сам, IntPtr proc);
        static extern (C) бул   wxDocument_DeleteContents(IntPtr сам);
        static extern (C) бул   wxDocument_Draw(IntPtr сам, IntPtr wxDC);
        static extern (C) бул   wxDocument_IsModified(IntPtr сам);
        static extern (C) проц   wxDocument_Modify(IntPtr сам, бул mod);
        static extern (C) бул   wxDocument_AddView(IntPtr сам, IntPtr view);
        static extern (C) бул   wxDocument_RemoveView(IntPtr сам, IntPtr view);
        static extern (C) IntPtr wxDocument_GetViews(IntPtr сам);
        static extern (C) IntPtr wxDocument_GetFirstView(IntPtr сам);
        static extern (C) проц   wxDocument_UpdateAllViews(IntPtr сам, IntPtr отправитель, IntPtr hint);
        static extern (C) проц   wxDocument_NotifyClosing(IntPtr сам);
        static extern (C) бул   wxDocument_DeleteAllViews(IntPtr сам);
        static extern (C) IntPtr wxDocument_GetDocumentManager(IntPtr сам);
        static extern (C) IntPtr wxDocument_GetDocumentTemplate(IntPtr сам);
        static extern (C) проц   wxDocument_SetDocumentTemplate(IntPtr сам, IntPtr temp);
        static extern (C) бул   wxDocument_GetPrintableName(IntPtr сам, IntPtr buf);
        static extern (C) IntPtr wxDocument_GetDocumentWindow(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias Document wxDocument;
    public class Document : ОбработчикСоб
    {
        public  this(Document родитель);
        public проц УстFilename(ткст filename, бул notifyViews);
        public проц Filename(ткст значение);
        public ткст Filename() ;
        public проц Титул(ткст значение);
        public ткст Титул();
        public проц DocumentName(ткст значение);
        public ткст DocumentName();
        public бул DocumentSaved() ;
        public проц DocumentSaved(бул значение);
        public бул Закрой();
        public бул Save();
        public бул SaveAs();
        public бул Revert();
        public бул DeleteContents();
        public бул Draw(DC dc);
        public бул IsModified();
        public проц IsModified(бул значение) ;
        public проц Modify(бул mod);
        public проц NotifyClosing();
        public бул DeleteAllViews();
        public Окно DocumentWindow() ;
    }
} // version(NOT_READY_YET)
//! \endcond
