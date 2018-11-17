//-----------------------------------------------------------------------------
// wxD - TabCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - TabCtrl.cs
//
/// The wxTabCtrl wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TabCtrl.d,v 1.11 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.TabCtrl;

//! \cond VERSION
version(none)
{
//! \endcond

    public import wx.common;
    public import wx.Event;
    public import wx.Control;
    public import wx.ImageList;
    public import wx.wxString;

    //! \cond EXTERN
    static extern (C) ЦелУкз wxTabEvent_ctor(цел типКоманды, цел ид, цел nSel, цел nOldSel);
    static extern (C) цел    wxTabEvent_GetSelection(ЦелУкз сам);
    static extern (C) проц   wxTabEvent_SetSelection(ЦелУкз сам, цел nSel);
    static extern (C) цел    wxTabEvent_GetOldSelection(ЦелУкз сам);
    static extern (C) проц   wxTabEvent_SetOldSelection(ЦелУкз сам, цел nOldSel);
    static extern (C) проц wxTabEvent_Veto(ЦелУкз сам);
    static extern (C) проц wxTabEvent_Allow(ЦелУкз сам);
    static extern (C) бул wxTabEvent_IsAllowed(ЦелУкз сам);
    //! \endcond

    //-----------------------------------------------------------------------------

    alias TabEvent wxTabEvent;
    public class TabEvent : Событие
    {
        public this(ЦелУкз wxobj)
        {
            super(wxobj);
        }

        public this(цел типКоманды, цел ид, цел nSel, цел nOldSel)
        {
            super(wxTabEvent_ctor(типКоманды, ид, nSel, nOldSel));
        }

        //-----------------------------------------------------------------------------

        public цел Selection()
        {
            return wxTabEvent_GetSelection(wxobj);
        }
        public проц Selection(цел значение)
        {
            wxTabEvent_SetSelection(wxobj, значение);
        }

        //-----------------------------------------------------------------------------

        public цел OldSelection()
        {
            return wxTabEvent_GetOldSelection(wxobj);
        }
        public проц OldSelection(цел значение)
        {
            wxTabEvent_SetOldSelection(wxobj, значение);
        }

        //-----------------------------------------------------------------------------

        public проц Veto()
        {
            wxTabEvent_Veto(wxobj);
        }

        //-----------------------------------------------------------------------------

        public проц Allow()
        {
            wxTabEvent_Allow(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул Allowed()
        {
            return wxTabEvent_IsAllowed(wxobj);
        }

        private static Событие Нов(ЦелУкз объ)
        {
            return new TabEvent(объ);
        }

        static this()
        {
            wxEVT_COMMAND_TAB_SEL_CHANGED = wxEvent_EVT_COMMAND_TAB_SEL_CHANGED();
            wxEVT_COMMAND_TAB_SEL_CHANGING = wxEvent_EVT_COMMAND_TAB_SEL_CHANGING();

            ДобавьТипСоб(wxEVT_COMMAND_TAB_SEL_CHANGED,   &TabEvent.Нов);
            ДобавьТипСоб(wxEVT_COMMAND_TAB_SEL_CHANGING,  &TabEvent.Нов);
        }
    }

    //-----------------------------------------------------------------------------

    //! \cond EXTERN
    static extern (C) ЦелУкз wxTabCtrl_ctor();
    static extern (C) ЦелУкз wxTabCtrl_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
    static extern (C) цел wxTabCtrl_GetSelection(ЦелУкз сам);
    static extern (C) цел wxTabCtrl_GetCurFocus(ЦелУкз сам);
    static extern (C) ЦелУкз wxTabCtrl_GetImageList(ЦелУкз сам);
    static extern (C) цел wxTabCtrl_GetItemCount(ЦелУкз сам);
    static extern (C) бул wxTabCtrl_GetItemRect(ЦелУкз сам, цел элт, out Прямоугольник прям);
    static extern (C) цел wxTabCtrl_GetRowCount(ЦелУкз сам);
    static extern (C) ЦелУкз wxTabCtrl_GetItemText(ЦелУкз сам, цел элт);
    static extern (C) цел wxTabCtrl_GetItemImage(ЦелУкз сам, цел элт);
    static extern (C) ЦелУкз wxTabCtrl_GetItemData(ЦелУкз сам, цел элт);
    static extern (C) цел wxTabCtrl_SetSelection(ЦелУкз сам, цел элт);
    static extern (C) проц wxTabCtrl_SetImageList(ЦелУкз сам, ЦелУкз imageList);
    static extern (C) бул wxTabCtrl_SetItemText(ЦелУкз сам, цел элт, ткст текст);
    static extern (C) бул wxTabCtrl_SetItemImage(ЦелУкз сам, цел элт, цел рисунок);
    static extern (C) бул wxTabCtrl_SetItemData(ЦелУкз сам, цел элт, ЦелУкз data);
    static extern (C) проц wxTabCtrl_SetItemSize(ЦелУкз сам, inout Размер Размер);
    static extern (C) бул wxTabCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
    static extern (C) проц wxTabCtrl_SetPadding(ЦелУкз сам, inout Размер padding);
    static extern (C) бул wxTabCtrl_DeleteAllItems(ЦелУкз сам);
    static extern (C) бул wxTabCtrl_DeleteItem(ЦелУкз сам, цел элт);
    static extern (C) цел wxTabCtrl_HitTest(ЦелУкз сам, inout Точка тчк, out цел флаги);
    static extern (C) бул wxTabCtrl_InsertItem(ЦелУкз сам, цел элт, ткст текст, цел imageId, ЦелУкз data);
    //! \endcond

    alias TabCtrl wxTabCtrl;
    public class TabCtrl : Control
    {
        //-----------------------------------------------------------------------------

        public this(ЦелУкз wxobj)
        {
            super(wxobj);
        }

        public this()
        {
            super(wxTabCtrl_ctor());
        }

        public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль =0, ткст имя = "tabCtrl")
        {
            super(wxTabCtrl_ctor2(wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя));
        }

        public static wxObject Нов(ЦелУкз wxobj)
        {
            return new TabCtrl(wxobj);
        }

        //---------------------------------------------------------------------
        // ctors with сам created ид

        public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль =0, ткст имя = "tabCtrl")
        {
            this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
        }

        //-----------------------------------------------------------------------------

        public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
        {
            return wxTabCtrl_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя);
        }

        //-----------------------------------------------------------------------------

        public цел Selection()
        {
            return wxTabCtrl_GetSelection(wxobj);
        }
        public проц Selection(цел значение)
        {
            wxTabCtrl_SetSelection(wxobj, значение);
        }

        //-----------------------------------------------------------------------------

        public цел CurFocus()
        {
            return wxTabCtrl_GetCurFocus(wxobj);
        }

        //-----------------------------------------------------------------------------

        public wxImageList ImageList()
        {
            return cast(wxImageList)НайдиОбъект(wxTabCtrl_GetImageList(wxobj));
        }
        public проц ImageList(wxImageList значение)
        {
            wxTabCtrl_SetImageList(wxobj, wxObject.SafePtr(значение));
        }

        //-----------------------------------------------------------------------------

        public цел ItemCount()
        {
            return wxTabCtrl_GetItemCount(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул GetItemRect(цел элт, out Прямоугольник прям)
        {
            return wxTabCtrl_GetItemRect(wxobj, элт, прям);
        }

        //-----------------------------------------------------------------------------

        public цел RowCount()
        {
            return wxTabCtrl_GetRowCount(wxobj);
        }

        //-----------------------------------------------------------------------------

        public ткст GetItemText(цел элт)
        {
            wxString текст = new wxString(wxTabCtrl_GetItemText(wxobj, элт));
            return текст.вТкст();
        }

        //-----------------------------------------------------------------------------

        public цел GetItemImage(цел элт)
        {
            return wxTabCtrl_GetItemImage(wxobj, элт);
        }

        //-----------------------------------------------------------------------------

        public ЦелУкз GetItemData(цел элт)
        {
            return wxTabCtrl_GetItemData(wxobj, элт);
        }

        //-----------------------------------------------------------------------------

        public бул УстItemText(цел элт, ткст текст)
        {
            return wxTabCtrl_SetItemText(wxobj, элт, текст);
        }

        //-----------------------------------------------------------------------------

        public бул УстItemImage(цел элт, цел рисунок)
        {
            return wxTabCtrl_SetItemImage(wxobj, элт, рисунок);
        }

        //-----------------------------------------------------------------------------

        public бул УстItemData(цел элт, ЦелУкз data)
        {
            return wxTabCtrl_SetItemData(wxobj, элт, data);
        }

        //-----------------------------------------------------------------------------

        public проц ItemSize(Размер значение)
        {
            wxTabCtrl_SetItemSize(wxobj, значение);
        }

        //-----------------------------------------------------------------------------

        public проц Padding(Размер значение)
        {
            wxTabCtrl_SetPadding(wxobj, значение);
        }

        //-----------------------------------------------------------------------------

        public бул удалиВсеЭлементы()
        {
            return wxTabCtrl_DeleteAllItems(wxobj);
        }

        //-----------------------------------------------------------------------------

        public бул удалиЭлемент(цел элт)
        {
            return wxTabCtrl_DeleteItem(wxobj, элт);
        }

        //-----------------------------------------------------------------------------

        public цел ТестНажатия(Точка тчк, out цел флаги)
        {
            return wxTabCtrl_HitTest(wxobj, тчк, флаги);
        }

        //-----------------------------------------------------------------------------

        public бул InsertItem(цел элт, ткст текст)
        {
            return InsertItem(элт, текст, -1, ЦелУкз.init);
        }

        public бул InsertItem(цел элт, ткст текст, цел imageId)
        {
            return InsertItem(элт, текст, imageId, ЦелУкз.init);
        }

        public бул InsertItem(цел элт, ткст текст, цел imageId, ЦелУкз data)
        {
            return wxTabCtrl_InsertItem(wxobj, элт, текст, imageId, data);
        }

        //---------------------------------------------------------------------

        public проц SelectionChange_Add(ДатчикСобытий значение)
        {
            AddCommandListener(Событие.wxEVT_COMMAND_TAB_SEL_CHANGED, ИД, значение, this);
        }
        public проц SelectionChange_Remove(ДатчикСобытий значение)
        {
            RemoveHandler(значение, this);
        }

        public проц SelectionChanging_Add(ДатчикСобытий значение)
        {
            AddCommandListener(Событие.wxEVT_COMMAND_TAB_SEL_CHANGING, ИД, значение, this);
        }
        public проц SelectionChanging_Remove(ДатчикСобытий значение)
        {
            RemoveHandler(значение, this);
        }
    }

//! \cond VERSION
} // version(__WXMSW__)
//! \endcond
