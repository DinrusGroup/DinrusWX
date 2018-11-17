module wx.TabCtrl;

//! \cond VERSION
version(none) {
//! \endcond

public import wx.common;
public import wx.Event;
public import wx.Control;
public import wx.ImageList;
public import wx.wxString;

		//! \cond EXTERN
		static extern (C) IntPtr wxTabEvent_ctor(цел типКоманды, цел ид, цел nSel, цел nOldSel);
		static extern (C) цел    wxTabEvent_GetSelection(IntPtr сам);
		static extern (C) проц   wxTabEvent_SetSelection(IntPtr сам, цел nSel);
		static extern (C) цел    wxTabEvent_GetOldSelection(IntPtr сам);
		static extern (C) проц   wxTabEvent_SetOldSelection(IntPtr сам, цел nOldSel);
		static extern (C) проц wxTabEvent_Veto(IntPtr сам);
		static extern (C) проц wxTabEvent_Allow(IntPtr сам);
		static extern (C) бул wxTabEvent_IsAllowed(IntPtr сам);		
		//! \endcond

		//-----------------------------------------------------------------------------

	alias TabEvent wxTabEvent;
	public class TabEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(цел типКоманды, цел ид, цел nSel, цел nOldSel);
		public цел Выбор();
		public проц Выбор(цел значение) ;
		public цел OldSelection() ;
		public проц OldSelection(цел значение) ;
		public проц Veto();
		public проц Allow();
		public бул Allowed();
		private static Событие Нов(IntPtr объ);
		static this();
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxTabCtrl_ctor();
		static extern (C) IntPtr wxTabCtrl_ctor2(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) цел wxTabCtrl_GetSelection(IntPtr сам);
		static extern (C) цел wxTabCtrl_GetCurFocus(IntPtr сам);
		static extern (C) IntPtr wxTabCtrl_GetImageList(IntPtr сам);
		static extern (C) цел wxTabCtrl_GetItemCount(IntPtr сам);
		static extern (C) бул wxTabCtrl_GetItemRect(IntPtr сам, цел элт, out Прямоугольник прям);
		static extern (C) цел wxTabCtrl_GetRowCount(IntPtr сам);
		static extern (C) IntPtr wxTabCtrl_GetItemText(IntPtr сам, цел элт);
		static extern (C) цел wxTabCtrl_GetItemImage(IntPtr сам, цел элт);
		static extern (C) IntPtr wxTabCtrl_GetItemData(IntPtr сам, цел элт);
		static extern (C) цел wxTabCtrl_SetSelection(IntPtr сам, цел элт);
		static extern (C) проц wxTabCtrl_SetImageList(IntPtr сам, IntPtr imageList);
		static extern (C) бул wxTabCtrl_SetItemText(IntPtr сам, цел элт, ткст текст);
		static extern (C) бул wxTabCtrl_SetItemImage(IntPtr сам, цел элт, цел рисунок);
		static extern (C) бул wxTabCtrl_SetItemData(IntPtr сам, цел элт, IntPtr data);
		static extern (C) проц wxTabCtrl_SetItemSize(IntPtr сам, inout Размер разм);
		static extern (C) бул wxTabCtrl_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц wxTabCtrl_SetPadding(IntPtr сам, inout Размер padding);
		static extern (C) бул wxTabCtrl_DeleteAllItems(IntPtr сам);
		static extern (C) бул wxTabCtrl_DeleteItem(IntPtr сам, цел элт);
		static extern (C) цел wxTabCtrl_HitTest(IntPtr сам, inout Точка тчк, out цел флаги);
		static extern (C) бул wxTabCtrl_InsertItem(IntPtr сам, цел элт, ткст текст, цел imageId, IntPtr data);
		//! \endcond

	alias TabCtrl wxTabCtrl;
	public class TabCtrl : Control
	{
		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль =0, ткст имя = "tabCtrl");
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль =0, ткст имя = "tabCtrl");
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public цел Выбор() ;
		public проц Выбор(цел значение);
		public цел CurFocus() ;
		public wxImageList ImageList();
		public проц ImageList(wxImageList значение);
		public цел ItemCount() ;
		public бул GetItemRect(цел элт, out Прямоугольник прям);
		public цел RowCount();
		public ткст GetItemText(цел элт);
		public цел GetItemImage(цел элт);
		public IntPtr GetItemData(цел элт);
		public бул УстItemText(цел элт, ткст текст);
		public бул УстItemImage(цел элт, цел рисунок);
		public бул УстItemData(цел элт, IntPtr data);
		public проц ItemSize(Размер значение) ;
		public проц Padding(Размер значение) ;
		public бул DeleteAllItems();
		public бул DeleteItem(цел элт);
		public цел ТестНажатия(Точка тчк, out цел флаги);
		public бул InsertItem(цел элт, ткст текст);
		public бул InsertItem(цел элт, ткст текст, цел imageId);
		public бул InsertItem(цел элт, ткст текст, цел imageId, IntPtr data);
		public проц SelectionChange_Add(ДатчикСобытий значение);
		public проц SelectionChange_Remove(ДатчикСобытий значение) ;
		public проц SelectionChanging_Add(ДатчикСобытий значение);
		public проц SelectionChanging_Remove(ДатчикСобытий значение) ;
	}

//! \cond VERSION
} // version(__WXMSW__)
//! \endcond
