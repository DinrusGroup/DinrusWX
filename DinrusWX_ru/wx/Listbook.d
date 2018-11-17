//-----------------------------------------------------------------------------
// wxD - Listbook.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Listbook.cs
//
/// The wxListbook wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Listbook.d,v 1.11 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.Listbook;
public import wx.common;
public import wx.Control;
public import wx.ImageList;

//! \cond EXTERN
static extern (C) ЦелУкз wxListbookEvent_ctor(цел типКоманды, цел ид, цел nSel, цел nOldSel);
static extern (C) цел    wxListbookEvent_GetSelection(ЦелУкз сам);
static extern (C) проц   wxListbookEvent_SetSelection(ЦелУкз сам, цел nSel);
static extern (C) цел    wxListbookEvent_GetOldSelection(ЦелУкз сам);
static extern (C) проц   wxListbookEvent_SetOldSelection(ЦелУкз сам, цел nOldSel);
static extern (C) проц wxListbookEvent_Veto(ЦелУкз сам);
static extern (C) проц wxListbookEvent_Allow(ЦелУкз сам);
static extern (C) бул wxListbookEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias ListbookEvent wxListbookEvent;
public class ListbookEvent : Событие
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ТипСобытия типКоманды, цел ид, цел nSel, цел nOldSel)
    {
        super(wxListbookEvent_ctor(типКоманды, ид, nSel, nOldSel));
    }

    static Событие Нов(ЦелУкз ptr)
    {
        return new ListbookEvent(ptr);
    }
    //-----------------------------------------------------------------------------

    public цел Selection()
    {
        return wxListbookEvent_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxListbookEvent_SetSelection(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел OldSelection()
    {
        return wxListbookEvent_GetOldSelection(wxobj);
    }
    public проц OldSelection(цел значение)
    {
        wxListbookEvent_SetOldSelection(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц Veto()
    {
        wxListbookEvent_Veto(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Allow()
    {
        wxListbookEvent_Allow(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Allowed()
    {
        return wxListbookEvent_IsAllowed(wxobj);
    }

    static this()
    {
        wxEVT_COMMAND_LISTBOOK_PAGE_CHANGED = wxEvent_EVT_COMMAND_LISTBOOK_PAGE_CHANGED();
        wxEVT_COMMAND_LISTBOOK_PAGE_CHANGING = wxEvent_EVT_COMMAND_LISTBOOK_PAGE_CHANGING();

        ДобавьТипСоб(wxEVT_COMMAND_LISTBOOK_PAGE_CHANGED,   &ListbookEvent.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LISTBOOK_PAGE_CHANGING,  &ListbookEvent.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxListbook_ctor();
static extern (C) бул wxListbook_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) цел wxListbook_GetSelection(ЦелУкз сам);
static extern (C) бул wxListbook_SetPageText(ЦелУкз сам, цел n, ткст strText);
static extern (C) ЦелУкз wxListbook_GetPageText(ЦелУкз сам, цел n);
static extern (C) цел wxListbook_GetPageImage(ЦелУкз сам, цел n);
static extern (C) бул wxListbook_SetPageImage(ЦелУкз сам, цел n, цел imageId);
static extern (C) проц wxListbook_CalcSizeFromPage(ЦелУкз сам, inout Размер sizePage, out Размер outSize);
static extern (C) бул wxListbook_InsertPage(ЦелУкз сам, цел n, ЦелУкз page, ткст текст, бул bSelect, цел imageId);
static extern (C) цел wxListbook_SetSelection(ЦелУкз сам, цел n);
static extern (C) проц wxListbook_SetImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) бул wxListbook_IsVertical(ЦелУкз сам);
static extern (C) цел wxListbook_GetPageCount(ЦелУкз сам);
static extern (C) ЦелУкз wxListbook_GetPage(ЦелУкз сам, цел n);
static extern (C) проц wxListbook_AssignImageList(ЦелУкз сам, ЦелУкз imageList);
static extern (C) ЦелУкз wxListbook_GetImageList(ЦелУкз сам);
static extern (C) проц wxListbook_SetPageSize(ЦелУкз сам, inout Размер Размер);
static extern (C) бул wxListbook_DeletePage(ЦелУкз сам, цел nPage);
static extern (C) бул wxListbook_RemovePage(ЦелУкз сам, цел nPage);
static extern (C) бул wxListbook_DeleteAllPages(ЦелУкз сам);
static extern (C) бул wxListbook_AddPage(ЦелУкз сам, ЦелУкз page, ткст текст, бул bselect, цел imageId);
static extern (C) проц wxListbook_AdvanceSelection(ЦелУкз сам, бул forward);
//! \endcond

//-----------------------------------------------------------------------------

alias Listbook wxListbook;
public class Listbook : Control
{
    public const цел wxLB_DEFAULT		= 0;
    public const цел wxLB_TOP		= 0x1;
    public const цел wxLB_BOTTOM		= 0x2;
    public const цел wxLB_LEFT		= 0x4;
    public const цел wxLB_RIGHT		= 0x8;
    public const цел wxLB_ALIGN_MASK	= 0xf;

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxListbook_ctor());
    }

    public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = "")
    {
        super(wxListbook_ctor());
        wxListbook_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя);
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new Listbook(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = "")
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public цел Selection()
    {
        return wxListbook_GetSelection(wxobj);
    }
    public проц Selection(цел значение)
    {
        wxListbook_SetSelection(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул УстPageText(цел n, ткст strText)
    {
        return wxListbook_SetPageText(wxobj, n, strText);
    }

    //-----------------------------------------------------------------------------

    public ткст GetPageText(цел n)
    {
        return cast(ткст) new wxString(wxListbook_GetPageText(wxobj, n), да);
    }

    //-----------------------------------------------------------------------------

    public цел GetPageImage(цел n)
    {
        return wxListbook_GetPageImage(wxobj, n);
    }

    //-----------------------------------------------------------------------------

    public бул УстPageImage(цел n, цел imageId)
    {
        return wxListbook_SetPageImage(wxobj, n, imageId);
    }

    //-----------------------------------------------------------------------------

    public Размер CalcSizeFromPage(Размер sizePage)
    {
        Размер s;
        wxListbook_CalcSizeFromPage(wxobj, sizePage, s);
        return s;
    }

    //-----------------------------------------------------------------------------


    public бул InsertPage(цел n, Окно page, ткст текст)
    {
        return InsertPage(n, page, текст, false, -1);
    }


    public бул InsertPage(цел n, Окно page, ткст текст, бул bSelect)
    {
        return InsertPage(n, page, текст, bSelect, -1);
    }

    public бул InsertPage(цел n, Окно page, ткст текст, бул bSelect, цел imageId)
    {
        return wxListbook_InsertPage(wxobj, n, wxObject.SafePtr(page), текст, bSelect, imageId);
    }

    //-----------------------------------------------------------------------------

    public проц imageList(ImageList значение)
    {
        wxListbook_SetImageList(wxobj, wxObject.SafePtr(значение));
    }
    public ImageList imageList()
    {
        return cast(ImageList)НайдиОбъект(wxListbook_GetImageList(wxobj), &ImageList.Нов);
    }

    //-----------------------------------------------------------------------------

    public бул Vertical()
    {
        return wxListbook_IsVertical(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел PageCount()
    {
        return wxListbook_GetPageCount(wxobj);
    }

    //-----------------------------------------------------------------------------

    public Окно GetPage(цел n)
    {
        //	return cast(Окно)НайдиОбъект(wxListbook_GetPage(wxobj, n), &Окно.Нов);
        ЦелУкз ptr = wxListbook_GetPage(wxobj, n);
        wxObject o = НайдиОбъект(ptr);
        if (o) return cast(Окно)o;
        else return new Окно(ptr);
    }

    //-----------------------------------------------------------------------------

    public проц AssignImageList(ImageList imageList)
    {
        wxListbook_AssignImageList(wxobj, wxObject.SafePtr(imageList));
    }

    //-----------------------------------------------------------------------------

    public проц PageSize(Размер значение)
    {
        wxListbook_SetPageSize(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public бул DeletePage(цел nPage)
    {
        return wxListbook_DeletePage(wxobj, nPage);
    }

    //-----------------------------------------------------------------------------

    public бул RemovePage(цел nPage)
    {
        return wxListbook_RemovePage(wxobj, nPage);
    }

    //-----------------------------------------------------------------------------

    public бул DeleteAllPages()
    {
        return wxListbook_DeleteAllPages(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул AddPage(Окно page, ткст текст, бул bSelect, цел imageId)
    {
        return wxListbook_AddPage(wxobj, wxObject.SafePtr(page), текст, bSelect, imageId);
    }

    //-----------------------------------------------------------------------------

    public проц AdvanceSelection(бул forward)
    {
        wxListbook_AdvanceSelection(wxobj, forward);
    }

    //-----------------------------------------------------------------------------

    public проц PageChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOOK_PAGE_CHANGED, ИД, значение, this);
    }
    public проц PageChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц PageChanging_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_COMMAND_LISTBOOK_PAGE_CHANGING, ИД, значение, this);
    }
    public проц PageChanging_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

