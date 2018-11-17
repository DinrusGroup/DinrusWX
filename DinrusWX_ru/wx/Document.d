//-----------------------------------------------------------------------------
// wxD - Document.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Document.cs
//
/// The wxDocument wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Document.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.Document;
public import wx.common;
public import wx.EvtHandler;

//! \cond VERSION
version(NOT_READY_YET)
{

    //! \cond EXTERN
    static extern (C) ЦелУкз wxDocument_ctor(ЦелУкз родитель);
    static extern (C) проц   wxDocument_SetFilename(ЦелУкз сам, ткст имяф, бул notifyViews);
    static extern (C) ЦелУкз wxDocument_GetFilename(ЦелУкз сам);
    static extern (C) проц   wxDocument_SetTitle(ЦелУкз сам, ткст титул);
    static extern (C) ЦелУкз wxDocument_GetTitle(ЦелУкз сам);
    static extern (C) проц   wxDocument_SetDocumentName(ЦелУкз сам, ткст имя);
    static extern (C) ЦелУкз wxDocument_GetDocumentName(ЦелУкз сам);
    static extern (C) бул   wxDocument_GetDocumentSaved(ЦелУкз сам);
    static extern (C) проц   wxDocument_SetDocumentSaved(ЦелУкз сам, бул saved);
    static extern (C) бул   wxDocument_Close(ЦелУкз сам);
    static extern (C) бул   wxDocument_Save(ЦелУкз сам);
    static extern (C) бул   wxDocument_SaveAs(ЦелУкз сам);
    static extern (C) бул   wxDocument_Revert(ЦелУкз сам);
    //static extern (C) ЦелУкз wxDocument_SaveObject(ЦелУкз сам, ЦелУкз stream);
    //static extern (C) ЦелУкз wxDocument_LoadObject(ЦелУкз сам, ЦелУкз stream);
    static extern (C) ЦелУкз wxDocument_GetCommandProcessor(ЦелУкз сам);
    static extern (C) проц   wxDocument_SetCommandProcessor(ЦелУкз сам, ЦелУкз proc);
    static extern (C) бул   wxDocument_DeleteContents(ЦелУкз сам);
    static extern (C) бул   wxDocument_Draw(ЦелУкз сам, ЦелУкз wxDC);
    static extern (C) бул   wxDocument_IsModified(ЦелУкз сам);
    static extern (C) проц   wxDocument_Modify(ЦелУкз сам, бул mod);
    static extern (C) бул   wxDocument_AddView(ЦелУкз сам, ЦелУкз view);
    static extern (C) бул   wxDocument_RemoveView(ЦелУкз сам, ЦелУкз view);
    static extern (C) ЦелУкз wxDocument_GetViews(ЦелУкз сам);
    static extern (C) ЦелУкз wxDocument_GetFirstView(ЦелУкз сам);
    static extern (C) проц   wxDocument_UpdateAllViews(ЦелУкз сам, ЦелУкз отправитель, ЦелУкз hint);
    static extern (C) проц   wxDocument_NotifyClosing(ЦелУкз сам);
    static extern (C) бул   wxDocument_DeleteAllViews(ЦелУкз сам);
    static extern (C) ЦелУкз wxDocument_GetDocumentManager(ЦелУкз сам);
    static extern (C) ЦелУкз wxDocument_GetDocumentTemplate(ЦелУкз сам);
    static extern (C) проц   wxDocument_SetDocumentTemplate(ЦелУкз сам, ЦелУкз temp);
    static extern (C) бул   wxDocument_GetPrintableName(ЦелУкз сам, ЦелУкз buf);
    static extern (C) ЦелУкз wxDocument_GetDocumentWindow(ЦелУкз сам);
    //! \endcond

    //-----------------------------------------------------------------------------

    alias Document wxDocument;
    public class Document : ОбработчикСоб
    {
        public  this(Document родитель)
        {
            super(wxDocument_ctor(wxObject.SafePtr(родитель)));
        }

        //-----------------------------------------------------------------------------

        public проц устИмяф(ткст имяф, бул notifyViews)
        {
            wxDocument_SetFilename(wxobj, имяф, notifyViews);
        }

        public проц ИмяФайла(ткст значение)
        {
            устИмяф(значение, да);
        }
        public ткст ИмяФайла()
        {
            return cast(ткст) new wxString(wxDocument_GetFilename(wxobj), да);
        }

        //-----------------------------------------------------------------------------

        public проц Титул(ткст значение)
        {
            wxDocument_SetTitle(wxobj, значение);
        }
        public ткст Титул()
        {
            return cast(ткст) new wxString(wxDocument_GetTitle(wxobj), да);
        }

        public проц DocumentName(ткст значение)
        {
            wxDocument_SetDocumentName(wxobj, значение);
        }
        public ткст DocumentName()
        {
            return cast(ткст) new wxString(wxDocument_GetDocumentName(wxobj), да);
        }

        //-----------------------------------------------------------------------------

        public бул DocumentSaved()
        {
            return wxDocument_GetDocumentSaved(wxobj);
        }
        public проц DocumentSaved(бул значение)
        {
            wxDocument_SetDocumentSaved(wxobj, значение);
        }

        //-----------------------------------------------------------------------------

        public бул Закрой()
        {
            return wxDocument_Close(wxobj);
        }

        public бул Save()
        {
            return wxDocument_Save(wxobj);
        }

        public бул SaveAs()
        {
            return wxDocument_SaveAs(wxobj);
        }

        public бул Revert()
        {
            return wxDocument_Revert(wxobj);
        }

        //-----------------------------------------------------------------------------

        /*
        public OutputStream SaveObject(OutputStream stream)
        {
            return wxDocument_SaveObject(wxobj, wxObject.SafePtr(stream));
        }

        public InputStream LoadObject(InputStream stream)
        {
            return wxDocument_LoadObject(wxobj, wxObject.SafePtr(stream));
        }*/

        //-----------------------------------------------------------------------------

        /*public CommandProcessor CommandProcessor
        {
            get { return НайдиОбъект(wxDocument_GetCommandProcessor(wxobj)); }
            set { wxDocument_SetCommandProcessor(wxobj, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        public бул DeleteContents()
        {
            return wxDocument_DeleteContents(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул Draw(DC dc)
        {
            return wxDocument_Draw(wxobj, wxObject.SafePtr(dc));
        }

        //-----------------------------------------------------------------------------

        public бул IsModified()
        {
            return wxDocument_IsModified(wxobj);
        }
        public проц IsModified(бул значение)
        {
            Modify(значение);
        }

        public проц Modify(бул mod)
        {
            wxDocument_Modify(wxobj, mod);
        }

        //-----------------------------------------------------------------------------

        /*public бул AddView(View view)
        {
            return wxDocument_AddView(wxobj, wxObject.SafePtr(view));
        }

        public бул RemoveView(View view)
        {
            return wxDocument_RemoveView(wxobj, wxObject.SafePtr(view));
        }*/

        /*
        public List GetViews()
        {
            return wxDocument_GetViews(wxobj);
        }

        public View FirstView() { return wxDocument_GetFirstView(wxobj); }

        public проц UpdateAllViews(View отправитель, wxObject hint)
        {
            wxDocument_UpdateAllViews(wxobj, wxObject.SafePtr(отправитель), wxObject.SafePtr(hint));
        }*/

        //-----------------------------------------------------------------------------

        public проц NotifyClosing()
        {
            wxDocument_NotifyClosing(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул DeleteAllViews()
        {
            return wxDocument_DeleteAllViews(wxobj);
        }

        //-----------------------------------------------------------------------------

        /*public DocManager DocumentManager
        {
            get { return (DocManager)НайдиОбъект(wxDocument_GetDocumentManager(wxobj), DocManager); }
        }

        //-----------------------------------------------------------------------------

        public DocTemplate DocumentTemplate() { return (DocTemplate)НайдиОбъект(return wxDocument_GetDocumentTemplate(wxobj), DocTemplate);
        public проц DocumentTemplate(DocTemplate значение) { wxDocument_SetDocumentTemplate(wxobj, wxObject.SafePtr(значение)); }
        }*/

        //-----------------------------------------------------------------------------
        /+
        public бул GetPrintableName(out ткст buf)
        {
            wxString имя = "";
            бул ret = wxDocument_GetPrintableName(wxobj, wxObject.SafePtr(имя));
            buf = имя;

            return ret;
        }
        +/
        //-----------------------------------------------------------------------------

        public Окно DocumentWindow()
        {
            return cast(Окно)НайдиОбъект(wxDocument_GetDocumentWindow(wxobj));
        }
    }
} // version(NOT_READY_YET)
//! \endcond
