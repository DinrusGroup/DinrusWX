//-----------------------------------------------------------------------------
// wxD - Notebook.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Notebook.cs
//
/// The wxNotebook wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Notebook.d,v 1.11 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.Notebook;
public import wx.common;
public import wx.Event;
public import wx.Control;
public import wx.ImageList;

//! \cond EXTERN
static extern (C) ЦелУкз wxNotebookEvent_ctor(цел типКоманды, цел ид, цел nSel, цел nOldSel);
static extern (C) цел    wxNotebookEvent_GetSelection(ЦелУкз сам);
static extern (C) проц   wxNotebookEvent_SetSelection(ЦелУкз сам, цел nSel);
static extern (C) цел    wxNotebookEvent_GetOldSelection(ЦелУкз сам);
static extern (C) проц   wxNotebookEvent_SetOldSelection(ЦелУкз сам, цел nOldSel);
static extern (C) проц wxNotebookEvent_Veto(ЦелУкз сам);
static extern (C) проц wxNotebookEvent_Allow(ЦелУкз сам);
static extern (C) бул wxNotebookEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias NotebookEvent wxNotebookEvent;
public class NotebookEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(цел типКоманды, цел ид, цел nSel, цел nOldSel)
    {
        super(wxNotebookEvent_ctor(типКоманды, ид, nSel, nOldSel));
    }

    //-----------------------------------------------------------------------------

    public цел Selection()
    {
        return wxNotebookEvent_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxNotebookEvent_SetSelection(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел OldSelection()
    {
        return wxNotebookEvent_GetOldSelection(wxobj);
    }
    public проц OldSelection(цел значение)
    {
        wxNotebookEvent_SetOldSelection(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Veto()
    {
        wxNotebookEvent_Veto(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Allow()
    {
        wxNotebookEvent_Allow(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Allowed()
    {
        return wxNotebookEvent_IsAllowed(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new NotebookEvent(объ);
    }

    static this()
    {
        wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGED();
        wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGING();

        ДобавьТипСоб(wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED,   &NotebookEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING,  &NotebookEvent.Нов);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxNotebook_ctor();
static extern (C) бул   wxNotebook_AddPage(ЦелУкз сам, ЦелУкз page, ткст текст, бул select, цел imageId);
static extern (C) бул   wxNotebook_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) цел    wxNotebook_GetPageCount(ЦелУкз сам);
static extern (C) ЦелУкз wxNotebook_GetPage(ЦелУкз сам, цел nPage);
static extern (C) цел    wxNotebook_GetSelection(ЦелУкз сам);
static extern (C) бул   wxNotebook_SetPageText(ЦелУкз сам, цел nPage, ткст strText);
static extern (C) ЦелУкз wxNotebook_GetPageText(ЦелУкз сам, цел nPage);
static extern (C) проц   wxNotebook_SetImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) проц   wxNotebook_AssignImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) ЦелУкз wxNotebook_GetImageList(ЦелУкз сам);
static extern (C) цел    wxNotebook_GetPageImage(ЦелУкз сам, цел nPage);
static extern (C) бул   wxNotebook_SetPageImage(ЦелУкз сам, цел nPage, цел nImage);
static extern (C) цел    wxNotebook_GetRowCount(ЦелУкз сам);
static extern (C) проц   wxNotebook_SetPageSize(ЦелУкз сам, inout Размер Размер);
static extern (C) проц   wxNotebook_SetPadding(ЦелУкз сам, inout Размер padding);
static extern (C) проц   wxNotebook_SetTabSize(ЦелУкз сам, inout Размер рм);
static extern (C) бул   wxNotebook_DeletePage(ЦелУкз сам, цел nPage);
static extern (C) бул   wxNotebook_RemovePage(ЦелУкз сам, цел nPage);
static extern (C) бул   wxNotebook_DeleteAllPages(ЦелУкз сам);
static extern (C) бул   wxNotebook_InsertPage(ЦелУкз сам, цел nPage, ЦелУкз pPage, ткст strText, бул bSelect, цел imageId);
static extern (C) цел    wxNotebook_SetSelection(ЦелУкз сам, цел nPage);
static extern (C) проц   wxNotebook_AdvanceSelection(ЦелУкз сам, бул forward);
//! \endcond

//---------------------------------------------------------------------

alias Notebook wxNotebook;
public class Notebook : Control
{
    public const цел wxNB_FIXEDWIDTH       = 0x0010;
    public const цел wxNB_TOP              = 0x0000;
    public const цел wxNB_LEFT             = 0x0020;
    public const цел wxNB_RIGHT            = 0x0040;
    public const цел wxNB_BOTTOM           = 0x0080;
    public const цел wxNB_MULTILINE        = 0x0100;

    public const ткст wxNOTEBOOK_NAME = "notebook";
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxNotebook_ctor());
    }

    public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxNOTEBOOK_NAME)
    {
        super(wxNotebook_ctor());
        if (!wxNotebook_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать Notebook");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Notebook(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxNOTEBOOK_NAME)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    // TODO: Switch окно with NotebookPage

    public бул AddPage(Окно page, ткст текст)
    {
        return AddPage(page, текст, false, -1);
    }

    public бул AddPage(Окно page, ткст текст, бул select)
    {
        return AddPage(page, текст, select, -1);
    }

    public бул AddPage(Окно page, ткст текст, бул select, цел imageId)
    {
        return wxNotebook_AddPage(wxobj, wxObject.SafePtr(page), текст, select, imageId);
    }

    //---------------------------------------------------------------------

    public проц Images(ImageList значение)
    {
        wxNotebook_SetImageList(wxobj, wxObject.SafePtr(значение));
    }
    public ImageList Images()
    {
        return cast(ImageList)НайдиОбъект(wxNotebook_GetImageList(wxobj));
    }

    //---------------------------------------------------------------------

    public цел PageCount()
    {
        return wxNotebook_GetPageCount(wxobj);
    }

    // TODO: Switch окно with NotebookPage
    public Окно GetPage(цел page)
    {
        return cast(Окно)НайдиОбъект(wxNotebook_GetPage(wxobj, page));
    }

    //---------------------------------------------------------------------

    public цел Selection()
    {
        return wxNotebook_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxNotebook_SetSelection(wxobj, значение);
    }

    public проц AdvanceSelection(бул forward)
    {
        wxNotebook_AdvanceSelection(wxobj, forward);
    }

    //---------------------------------------------------------------------

    public бул УстPageText(цел page, ткст текст)
    {
        return wxNotebook_SetPageText(wxobj, page, текст);
    }

    public ткст GetPageText(цел page)
    {
        return cast(ткст) new wxString(wxNotebook_GetPageText(wxobj, page), да);
    }

    //---------------------------------------------------------------------

    public проц AssignImageList(ImageList imageList)
    {
        wxNotebook_AssignImageList(wxobj, wxObject.SafePtr(imageList));
    }

    //---------------------------------------------------------------------

    public цел GetPageImage(цел page)
    {
        return wxNotebook_GetPageImage(wxobj, page);
    }

    public бул УстPageImage(цел page, цел рисунок)
    {
        return wxNotebook_SetPageImage(wxobj, page, рисунок);
    }

    //---------------------------------------------------------------------

    public цел RowCount()
    {
        return wxNotebook_GetRowCount(wxobj);
    }

    //---------------------------------------------------------------------

    public проц PageSize(Размер значение)
    {
        wxNotebook_SetPageSize(wxobj, значение);
    }

    public проц Padding(Размер значение)
    {
        wxNotebook_SetPadding(wxobj, значение);
    }

    public проц TabSize(Размер значение)
    {
        wxNotebook_SetTabSize(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public бул DeletePage(цел page)
    {
        return wxNotebook_DeletePage(wxobj, page);
    }

    public бул RemovePage(цел page)
    {
        return wxNotebook_RemovePage(wxobj, page);
    }

    public бул DeleteAllPages()
    {
        return wxNotebook_DeleteAllPages(wxobj);
    }

    //---------------------------------------------------------------------

    // TODO: Switch окно with NotebookPage
    public бул InsertPage(цел page, Окно окно, ткст текст,
                           бул select, цел рисунок)
    {
        return wxNotebook_InsertPage(wxobj, page,
                                     wxObject.SafePtr(окно), текст, select,
                                     рисунок);
    }

    //---------------------------------------------------------------------

    public проц PageChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ИД, значение, this);
    }
    public проц PageChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц PageChanging_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING, ИД, значение, this);
    }
    public проц PageChanging_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}
