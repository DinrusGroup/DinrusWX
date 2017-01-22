module wx.Document;
public import wx.common;
public import wx.EvtHandler;

//! \cond VERSION
version(NOT_READY_YET){

		//! \cond EXTERN
        static extern (C) ЦУк wxDocument_ctor(ЦУк родитель);
        static extern (C) проц   wxDocument_SetFilename(ЦУк сам, ткст фимя, бул notifyViews);
        static extern (C) ЦУк wxDocument_GetFilename(ЦУк сам);
        static extern (C) проц   wxDocument_SetTitle(ЦУк сам, ткст title);
        static extern (C) ЦУк wxDocument_GetTitle(ЦУк сам);
        static extern (C) проц   wxDocument_SetDocumentName(ЦУк сам, ткст имя);
        static extern (C) ЦУк wxDocument_GetDocumentName(ЦУк сам);
        static extern (C) бул   wxDocument_GetDocumentSaved(ЦУк сам);
        static extern (C) проц   wxDocument_SetDocumentSaved(ЦУк сам, бул saved);
        static extern (C) бул   wxDocument_Close(ЦУк сам);
        static extern (C) бул   wxDocument_Save(ЦУк сам);
        static extern (C) бул   wxDocument_SaveAs(ЦУк сам);
        static extern (C) бул   wxDocument_Revert(ЦУк сам);
        //static extern (C) ЦУк wxDocument_SaveObject(ЦУк сам, ЦУк stream);
        //static extern (C) ЦУк wxDocument_LoadObject(ЦУк сам, ЦУк stream);
        static extern (C) ЦУк wxDocument_GetCommandProcessor(ЦУк сам);
        static extern (C) проц   wxDocument_SetCommandProcessor(ЦУк сам, ЦУк proc);
        static extern (C) бул   wxDocument_DeleteContents(ЦУк сам);
        static extern (C) бул   wxDocument_Draw(ЦУк сам, ЦУк wxDC);
        static extern (C) бул   wxDocument_IsModified(ЦУк сам);
        static extern (C) проц   wxDocument_Modify(ЦУк сам, бул mod);
        static extern (C) бул   wxDocument_AddView(ЦУк сам, ЦУк view);
        static extern (C) бул   wxDocument_RemoveView(ЦУк сам, ЦУк view);
        static extern (C) ЦУк wxDocument_GetViews(ЦУк сам);
        static extern (C) ЦУк wxDocument_GetFirstView(ЦУк сам);
        static extern (C) проц   wxDocument_UpdateAllViews(ЦУк сам, ЦУк sender, ЦУк hint);
        static extern (C) проц   wxDocument_NotifyClosing(ЦУк сам);
        static extern (C) бул   wxDocument_DeleteAllViews(ЦУк сам);
        static extern (C) ЦУк wxDocument_GetDocumentManager(ЦУк сам);
        static extern (C) ЦУк wxDocument_GetDocumentTemplate(ЦУк сам);
        static extern (C) проц   wxDocument_SetDocumentTemplate(ЦУк сам, ЦУк temp);
        static extern (C) бул   wxDocument_GetPrintableName(ЦУк сам, ЦУк buf);
        static extern (C) ЦУк wxDocument_GetDocumentWindow(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias Document wxDocument;
    public class Document : EvtHandler
    {
        public  this(Document родитель)
            { super(wxDocument_ctor(wxObject.SafePtr(родитель))); }

        //-----------------------------------------------------------------------------

        public проц SetFilename(ткст фимя, бул notifyViews)
        {
            wxDocument_SetFilename(шхобъ, фимя, notifyViews);
        }

        public проц Filename(ткст значение) { SetFilename(значение, да); }
        public ткст Filename() { return cast(ткст) new wxString(wxDocument_GetFilename(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц Title(ткст значение) { wxDocument_SetTitle(шхобъ, значение); }
        public ткст Title() { return cast(ткст) new wxString(wxDocument_GetTitle(шхобъ), да); }

        public проц DocumentName(ткст значение) { wxDocument_SetDocumentName(шхобъ, значение); }
        public ткст DocumentName() { return cast(ткст) new wxString(wxDocument_GetDocumentName(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public бул DocumentSaved() { return wxDocument_GetDocumentSaved(шхобъ); }
        public проц DocumentSaved(бул значение) { wxDocument_SetDocumentSaved(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public бул Закрой()
        {
            return wxDocument_Close(шхобъ);
        }

        public бул Save()
        {
            return wxDocument_Save(шхобъ);
        }

        public бул SaveAs()
        {
            return wxDocument_SaveAs(шхобъ);
        }

        public бул Revert()
        {
            return wxDocument_Revert(шхобъ);
        }

        //-----------------------------------------------------------------------------

        /*
        public OutputStream SaveObject(OutputStream stream)
        {
            return wxDocument_SaveObject(шхобъ, wxObject.SafePtr(stream));
        }

        public InputStream LoadObject(InputStream stream)
        {
            return wxDocument_LoadObject(шхобъ, wxObject.SafePtr(stream));
        }*/

        //-----------------------------------------------------------------------------

        /*public CommandProcessor CommandProcessor
        {
            get { return FindObject(wxDocument_GetCommandProcessor(шхобъ)); }
            set { wxDocument_SetCommandProcessor(шхобъ, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        public бул DeleteContents()
        {
            return wxDocument_DeleteContents(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public бул Draw(DC dc)
        {
            return wxDocument_Draw(шхобъ, wxObject.SafePtr(dc));
        }

        //-----------------------------------------------------------------------------

        public бул IsModified() { return wxDocument_IsModified(шхобъ); }
        public проц IsModified(бул значение) { Modify(значение); }

        public проц Modify(бул mod)
        {
            wxDocument_Modify(шхобъ, mod);
        }

        //-----------------------------------------------------------------------------

        /*public бул AddView(View view)
        {
            return wxDocument_AddView(шхобъ, wxObject.SafePtr(view));
        }

        public бул RemoveView(View view)
        {
            return wxDocument_RemoveView(шхобъ, wxObject.SafePtr(view));
        }*/

        /*
        public List GetViews()
        {
            return wxDocument_GetViews(шхобъ);
        }

        public View FirstView() { return wxDocument_GetFirstView(шхобъ); }

        public проц UpdateAllViews(View sender, wxObject hint)
        {
            wxDocument_UpdateAllViews(шхобъ, wxObject.SafePtr(sender), wxObject.SafePtr(hint));
        }*/

        //-----------------------------------------------------------------------------

        public проц NotifyClosing()
        {
            wxDocument_NotifyClosing(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public бул DeleteAllViews()
        {
            return wxDocument_DeleteAllViews(шхобъ);
        }

        //-----------------------------------------------------------------------------

        /*public DocManager DocumentManager
        {
            get { return (DocManager)FindObject(wxDocument_GetDocumentManager(шхобъ), DocManager); }
        }

        //-----------------------------------------------------------------------------

        public DocTemplate DocumentTemplate() { return (DocTemplate)FindObject(return wxDocument_GetDocumentTemplate(шхобъ), DocTemplate);
        public проц DocumentTemplate(DocTemplate значение) { wxDocument_SetDocumentTemplate(шхобъ, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------
/+
        public бул GetPrintableName(out ткст buf)
        {
            wxString имя = "";
            бул ret = wxDocument_GetPrintableName(шхобъ, wxObject.SafePtr(имя));
            buf = имя;

            return ret;
        }
+/
        //-----------------------------------------------------------------------------

        public Окно DocumentWindow() { return cast(Окно)FindObject(wxDocument_GetDocumentWindow(шхобъ)); }
    }
} // version(NOT_READY_YET)
//! \endcond
