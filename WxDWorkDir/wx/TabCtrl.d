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
version(none) {
//! \endcond

public import wx.common;
public import wx.Event;
public import wx.Control;
public import wx.ImageList;
public import wx.wxString;

		//! \cond EXTERN
		static extern (C) ЦУк wxTabEvent_ctor(цел commandType, цел ид, цел nSel, цел nOldSel);
		static extern (C) цел    wxTabEvent_GetSelection(ЦУк сам);
		static extern (C) проц   wxTabEvent_SetSelection(ЦУк сам, цел nSel);
		static extern (C) цел    wxTabEvent_GetOldSelection(ЦУк сам);
		static extern (C) проц   wxTabEvent_SetOldSelection(ЦУк сам, цел nOldSel);
		static extern (C) проц wxTabEvent_Veto(ЦУк сам);
		static extern (C) проц wxTabEvent_Allow(ЦУк сам);
		static extern (C) бул wxTabEvent_IsAllowed(ЦУк сам);		
		//! \endcond

		//-----------------------------------------------------------------------------

	alias TabEvent wxTabEvent;
	public class TabEvent : Событие
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this(цел commandType, цел ид, цел nSel, цел nOldSel)
			{ super(wxTabEvent_ctor(commandType, ид, nSel, nOldSel)); }

		//-----------------------------------------------------------------------------

		public цел Selection() { return wxTabEvent_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxTabEvent_SetSelection(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public цел OldSelection() { return wxTabEvent_GetOldSelection(шхобъ); }
		public проц OldSelection(цел значение) { wxTabEvent_SetOldSelection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------		
		
		public проц Veto()
		{
			wxTabEvent_Veto(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Allow()
		{
			wxTabEvent_Allow(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Allowed() { return wxTabEvent_IsAllowed(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new TabEvent(объ); }

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
		static extern (C) ЦУк wxTabCtrl_ctor();
		static extern (C) ЦУк wxTabCtrl_ctor2(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) цел wxTabCtrl_GetSelection(ЦУк сам);
		static extern (C) цел wxTabCtrl_GetCurFocus(ЦУк сам);
		static extern (C) ЦУк wxTabCtrl_GetImageList(ЦУк сам);
		static extern (C) цел wxTabCtrl_GetItemCount(ЦУк сам);
		static extern (C) бул wxTabCtrl_GetItemRect(ЦУк сам, цел элемент, out Прямоугольник прям);
		static extern (C) цел wxTabCtrl_GetRowCount(ЦУк сам);
		static extern (C) ЦУк wxTabCtrl_GetItemText(ЦУк сам, цел элемент);
		static extern (C) цел wxTabCtrl_GetItemImage(ЦУк сам, цел элемент);
		static extern (C) ЦУк wxTabCtrl_GetItemData(ЦУк сам, цел элемент);
		static extern (C) цел wxTabCtrl_SetSelection(ЦУк сам, цел элемент);
		static extern (C) проц wxTabCtrl_SetImageList(ЦУк сам, ЦУк imageList);
		static extern (C) бул wxTabCtrl_SetItemText(ЦУк сам, цел элемент, ткст текст);
		static extern (C) бул wxTabCtrl_SetItemImage(ЦУк сам, цел элемент, цел рисунок);
		static extern (C) бул wxTabCtrl_SetItemData(ЦУк сам, цел элемент, ЦУк данные);
		static extern (C) проц wxTabCtrl_SetItemSize(ЦУк сам, inout Размер size);
		static extern (C) бул wxTabCtrl_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxTabCtrl_SetPadding(ЦУк сам, inout Размер padding);
		static extern (C) бул wxTabCtrl_DeleteAllItems(ЦУк сам);
		static extern (C) бул wxTabCtrl_DeleteItem(ЦУк сам, цел элемент);
		static extern (C) цел wxTabCtrl_HitTest(ЦУк сам, inout Точка pt, out цел флаги);
		static extern (C) бул wxTabCtrl_InsertItem(ЦУк сам, цел элемент, ткст текст, цел imageId, ЦУк данные);
		//! \endcond

	alias TabCtrl wxTabCtrl;
	public class TabCtrl : Control
	{
		//-----------------------------------------------------------------------------

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxTabCtrl_ctor());}

		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль =0, ткст имя = "tabCtrl")
			{ super(wxTabCtrl_ctor2(wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя));}
			
		public static wxObject Нов(ЦУк шхобъ) { return new TabCtrl(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль =0, ткст имя = "tabCtrl")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}

		//-----------------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxTabCtrl_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя);
		}
		
		//-----------------------------------------------------------------------------

		public цел Selection() { return wxTabCtrl_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxTabCtrl_SetSelection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------

		public цел CurFocus() { return wxTabCtrl_GetCurFocus(шхобъ); }
		
		//-----------------------------------------------------------------------------

		public wxImageList ImageList() { return cast(wxImageList)FindObject(wxTabCtrl_GetImageList(шхобъ)); }
		public проц ImageList(wxImageList значение) { wxTabCtrl_SetImageList(шхобъ, wxObject.SafePtr(значение)); }
		
		//-----------------------------------------------------------------------------

		public цел ItemCount() { return wxTabCtrl_GetItemCount(шхобъ); }
		
		//-----------------------------------------------------------------------------

		public бул GetItemRect(цел элемент, out Прямоугольник прям)
		{
			return wxTabCtrl_GetItemRect(шхобъ, элемент, прям);
		}
		
		//-----------------------------------------------------------------------------

		public цел RowCount() { return wxTabCtrl_GetRowCount(шхобъ); }
		
		//-----------------------------------------------------------------------------

		public ткст GetItemText(цел элемент)
		{
			wxString текст = new wxString(wxTabCtrl_GetItemText(шхобъ, элемент));
			return текст.toString();
		}
		
		//-----------------------------------------------------------------------------

		public цел GetItemImage(цел элемент)
		{
			return wxTabCtrl_GetItemImage(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------

		public ЦУк GetItemData(цел элемент)
		{
			return wxTabCtrl_GetItemData(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------

		public бул SetItemText(цел элемент, ткст текст)
		{
			return wxTabCtrl_SetItemText(шхобъ, элемент, текст);
		}
		
		//-----------------------------------------------------------------------------

		public бул SetItemImage(цел элемент, цел рисунок)
		{
			return wxTabCtrl_SetItemImage(шхобъ, элемент, рисунок);
		}
		
		//-----------------------------------------------------------------------------

		public бул SetItemData(цел элемент, ЦУк данные)
		{
			return wxTabCtrl_SetItemData(шхобъ, элемент, данные);
		}
		
		//-----------------------------------------------------------------------------

		public проц ItemSize(Размер значение) { wxTabCtrl_SetItemSize(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------

		public проц Padding(Размер значение) { wxTabCtrl_SetPadding(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------

		public бул DeleteAllItems()
		{
			return wxTabCtrl_DeleteAllItems(шхобъ);
		}
		
		//-----------------------------------------------------------------------------

		public бул DeleteItem(цел элемент)
		{
			return wxTabCtrl_DeleteItem(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------

		public цел HitTest(Точка pt, out цел флаги)
		{
			return wxTabCtrl_HitTest(шхобъ, pt, флаги);
		}
		
		//-----------------------------------------------------------------------------

		public бул InsertItem(цел элемент, ткст текст)
		{
			return InsertItem(элемент, текст, -1, ЦУк.init);
		}
		
		public бул InsertItem(цел элемент, ткст текст, цел imageId)
		{
			return InsertItem(элемент, текст, imageId, ЦУк.init);
		}
		
		public бул InsertItem(цел элемент, ткст текст, цел imageId, ЦУк данные)
		{
			return wxTabCtrl_InsertItem(шхобъ, элемент, текст, imageId, данные);
		}

		//---------------------------------------------------------------------

		public проц SelectionChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TAB_SEL_CHANGED, ИД, значение, this); }
		public проц SelectionChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц SelectionChanging_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_TAB_SEL_CHANGING, ИД, значение, this); }
		public проц SelectionChanging_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}

//! \cond VERSION
} // version(__WXMSW__)
//! \endcond
