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
		static extern (C) ЦУк wxListbookEvent_ctor(цел commandType, цел ид, цел nSel, цел nOldSel);
		static extern (C) цел    wxListbookEvent_GetSelection(ЦУк сам);
		static extern (C) проц   wxListbookEvent_SetSelection(ЦУк сам, цел nSel);
		static extern (C) цел    wxListbookEvent_GetOldSelection(ЦУк сам);
		static extern (C) проц   wxListbookEvent_SetOldSelection(ЦУк сам, цел nOldSel);
		static extern (C) проц wxListbookEvent_Veto(ЦУк сам);
		static extern (C) проц wxListbookEvent_Allow(ЦУк сам);
		static extern (C) бул wxListbookEvent_IsAllowed(ЦУк сам);		
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ListbookEvent wxListbookEvent;
	public class ListbookEvent : Событие
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this(ТипСобытия commandType, цел ид, цел nSel, цел nOldSel)
			{ super(wxListbookEvent_ctor(commandType, ид, nSel, nOldSel)); }

		static Событие Нов(ЦУк ptr) { return new ListbookEvent(ptr); }
		//-----------------------------------------------------------------------------

		public цел Selection() { return wxListbookEvent_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxListbookEvent_SetSelection(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public цел OldSelection() { return wxListbookEvent_GetOldSelection(шхобъ); }
		public проц OldSelection(цел значение) { wxListbookEvent_SetOldSelection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------		
		
		public проц Veto()
		{
			wxListbookEvent_Veto(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Allow()
		{
			wxListbookEvent_Allow(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Allowed() { return wxListbookEvent_IsAllowed(шхобъ); }

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
		static extern (C) ЦУк wxListbook_ctor();
		static extern (C) бул wxListbook_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) цел wxListbook_GetSelection(ЦУк сам);
		static extern (C) бул wxListbook_SetPageText(ЦУк сам, цел n, ткст strText);
		static extern (C) ЦУк wxListbook_GetPageText(ЦУк сам, цел n);
		static extern (C) цел wxListbook_GetPageImage(ЦУк сам, цел n);
		static extern (C) бул wxListbook_SetPageImage(ЦУк сам, цел n, цел imageId);
		static extern (C) проц wxListbook_CalcSizeFromPage(ЦУк сам, inout Размер sizePage, out Размер outSize);
		static extern (C) бул wxListbook_InsertPage(ЦУк сам, цел n, ЦУк page, ткст текст, бул bSelect, цел imageId);
		static extern (C) цел wxListbook_SetSelection(ЦУк сам, цел n);
		static extern (C) проц wxListbook_SetImageList(ЦУк сам, ЦУк imageList);
		static extern (C) бул wxListbook_IsVertical(ЦУк сам);
		static extern (C) цел wxListbook_GetPageCount(ЦУк сам);
		static extern (C) ЦУк wxListbook_GetPage(ЦУк сам, цел n);
		static extern (C) проц wxListbook_AssignImageList(ЦУк сам, ЦУк imageList);
		static extern (C) ЦУк wxListbook_GetImageList(ЦУк сам);
		static extern (C) проц wxListbook_SetPageSize(ЦУк сам, inout Размер size);
		static extern (C) бул wxListbook_DeletePage(ЦУк сам, цел nPage);
		static extern (C) бул wxListbook_RemovePage(ЦУк сам, цел nPage);
		static extern (C) бул wxListbook_DeleteAllPages(ЦУк сам);
		static extern (C) бул wxListbook_AddPage(ЦУк сам, ЦУк page, ткст текст, бул bselect, цел imageId);
		static extern (C) проц wxListbook_AdvanceSelection(ЦУк сам, бул forward);
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

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxListbook_ctor());}

		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = "")
		{
			super(wxListbook_ctor());
			wxListbook_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя);
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new Listbook(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = "")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------

		public цел Selection() { return wxListbook_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxListbook_SetSelection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------

		public бул SetPageText(цел n, ткст strText)
		{
			return wxListbook_SetPageText(шхобъ, n, strText);
		}
		
		//-----------------------------------------------------------------------------

		public ткст GetPageText(цел n)
		{
			return cast(ткст) new wxString(wxListbook_GetPageText(шхобъ, n), да);
		}
		
		//-----------------------------------------------------------------------------

		public цел GetPageImage(цел n)
		{
			return wxListbook_GetPageImage(шхобъ, n);
		}
		
		//-----------------------------------------------------------------------------

		public бул SetPageImage(цел n, цел imageId)
		{
			return wxListbook_SetPageImage(шхобъ, n, imageId);
		}
		
		//-----------------------------------------------------------------------------

		public Размер CalcSizeFromPage(Размер sizePage)
		{
			Размер s;
			wxListbook_CalcSizeFromPage(шхобъ, sizePage, s);
			return s;
		}
		
		//-----------------------------------------------------------------------------

		
		public бул InsertPage(цел n, Окно page, ткст текст)
		{
			return InsertPage(n, page, текст, нет, -1);
		}
		

		public бул InsertPage(цел n, Окно page, ткст текст, бул bSelect)
		{
			return InsertPage(n, page, текст, bSelect, -1);
		}
		
		public бул InsertPage(цел n, Окно page, ткст текст, бул bSelect, цел imageId)
		{
			return wxListbook_InsertPage(шхобъ, n, wxObject.SafePtr(page), текст, bSelect, imageId);
		}
		
		//-----------------------------------------------------------------------------

		public проц imageList(ImageList значение) { wxListbook_SetImageList(шхобъ, wxObject.SafePtr(значение)); }
		public ImageList imageList() { return cast(ImageList)FindObject(wxListbook_GetImageList(шхобъ), &ImageList.Нов); }
		
		//-----------------------------------------------------------------------------

		public бул Vertical() { return wxListbook_IsVertical(шхобъ); }
		
		//-----------------------------------------------------------------------------

		public цел PageCount() { return wxListbook_GetPageCount(шхобъ); }
		
		//-----------------------------------------------------------------------------

		public Окно GetPage(цел n)
		{
		//	return cast(Окно)FindObject(wxListbook_GetPage(шхобъ, n), &Окно.Нов);
			ЦУк ptr = wxListbook_GetPage(шхобъ, n);
			wxObject o = FindObject(ptr);
			if (o) return cast(Окно)o;
			else return new Окно(ptr);
		}
		
		//-----------------------------------------------------------------------------

		public проц AssignImageList(ImageList imageList)
		{
			wxListbook_AssignImageList(шхобъ, wxObject.SafePtr(imageList));
		}
		
		//-----------------------------------------------------------------------------

		public проц PageSize(Размер значение) { wxListbook_SetPageSize(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------

		public бул DeletePage(цел nPage)
		{
			return wxListbook_DeletePage(шхобъ, nPage);
		}
		
		//-----------------------------------------------------------------------------

		public бул RemovePage(цел nPage)
		{
			return wxListbook_RemovePage(шхобъ, nPage);
		}
		
		//-----------------------------------------------------------------------------

		public бул DeleteAllPages()
		{
			return wxListbook_DeleteAllPages(шхобъ);
		}
		
		//-----------------------------------------------------------------------------

		public бул AddPage(Окно page, ткст текст, бул bSelect, цел imageId)
		{
			return wxListbook_AddPage(шхобъ, wxObject.SafePtr(page), текст, bSelect, imageId);
		}
		
		//-----------------------------------------------------------------------------

		public проц AdvanceSelection(бул forward)
		{
			wxListbook_AdvanceSelection(шхобъ, forward);
		}

		//-----------------------------------------------------------------------------

		public проц PageChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LISTBOOK_PAGE_CHANGED, ИД, значение, this); }
		public проц PageChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц PageChanging_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LISTBOOK_PAGE_CHANGING, ИД, значение, this); }
		public проц PageChanging_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
		
