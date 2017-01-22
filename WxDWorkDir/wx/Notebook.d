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
		static extern (C) ЦУк wxNotebookEvent_ctor(цел commandType, цел ид, цел nSel, цел nOldSel);
		static extern (C) цел    wxNotebookEvent_GetSelection(ЦУк сам);
		static extern (C) проц   wxNotebookEvent_SetSelection(ЦУк сам, цел nSel);
		static extern (C) цел    wxNotebookEvent_GetOldSelection(ЦУк сам);
		static extern (C) проц   wxNotebookEvent_SetOldSelection(ЦУк сам, цел nOldSel);
		static extern (C) проц wxNotebookEvent_Veto(ЦУк сам);
		static extern (C) проц wxNotebookEvent_Allow(ЦУк сам);
		static extern (C) бул wxNotebookEvent_IsAllowed(ЦУк сам);		
		//! \endcond

		//-----------------------------------------------------------------------------

	alias NotebookEvent wxNotebookEvent;
	public class NotebookEvent : Событие
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this(цел commandType, цел ид, цел nSel, цел nOldSel)
			{ super(wxNotebookEvent_ctor(commandType, ид, nSel, nOldSel)); }

		//-----------------------------------------------------------------------------

		public цел Selection() { return wxNotebookEvent_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxNotebookEvent_SetSelection(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public цел OldSelection() { return wxNotebookEvent_GetOldSelection(шхобъ); }
		public проц OldSelection(цел значение) { wxNotebookEvent_SetOldSelection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------		
		
		public проц Veto()
		{
			wxNotebookEvent_Veto(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Allow()
		{
			wxNotebookEvent_Allow(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Allowed() { return wxNotebookEvent_IsAllowed(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new NotebookEvent(объ); }

		static this()
		{
			wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGED();
			wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGING();

			ДобавьТипСоб(wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED,   &NotebookEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING,  &NotebookEvent.Нов);
		}
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxNotebook_ctor();
		static extern (C) бул   wxNotebook_AddPage(ЦУк сам, ЦУк page, ткст текст, бул select, цел imageId);
		static extern (C) бул   wxNotebook_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) цел    wxNotebook_GetPageCount(ЦУк сам);
		static extern (C) ЦУк wxNotebook_GetPage(ЦУк сам, цел nPage);
		static extern (C) цел    wxNotebook_GetSelection(ЦУк сам);
		static extern (C) бул   wxNotebook_SetPageText(ЦУк сам, цел nPage, ткст strText);
		static extern (C) ЦУк wxNotebook_GetPageText(ЦУк сам, цел nPage);
		static extern (C) проц   wxNotebook_SetImageList(ЦУк сам, ЦУк imageList);
		static extern (C) проц   wxNotebook_AssignImageList(ЦУк сам, ЦУк imageList);
		static extern (C) ЦУк wxNotebook_GetImageList(ЦУк сам);
		static extern (C) цел    wxNotebook_GetPageImage(ЦУк сам, цел nPage);
		static extern (C) бул   wxNotebook_SetPageImage(ЦУк сам, цел nPage, цел nImage);
		static extern (C) цел    wxNotebook_GetRowCount(ЦУк сам);
		static extern (C) проц   wxNotebook_SetPageSize(ЦУк сам, inout Размер size);
		static extern (C) проц   wxNotebook_SetPadding(ЦУк сам, inout Размер padding);
		static extern (C) проц   wxNotebook_SetTabSize(ЦУк сам, inout Размер sz);
		static extern (C) бул   wxNotebook_DeletePage(ЦУк сам, цел nPage);
		static extern (C) бул   wxNotebook_RemovePage(ЦУк сам, цел nPage);
		static extern (C) бул   wxNotebook_DeleteAllPages(ЦУк сам);
		static extern (C) бул   wxNotebook_InsertPage(ЦУк сам, цел nPage, ЦУк pPage, ткст strText, бул bSelect, цел imageId);
		static extern (C) цел    wxNotebook_SetSelection(ЦУк сам, цел nPage);
		static extern (C) проц   wxNotebook_AdvanceSelection(ЦУк сам, бул forward);
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

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxNotebook_ctor()); }

		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxNOTEBOOK_NAME)
		{
			super(wxNotebook_ctor());
			if (!wxNotebook_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, стиль, имя)) 
			{
				throw new InvalidOperationException("Failed to create Notebook");
			}
		}

		public static wxObject Нов(ЦУк шхобъ) { return new Notebook(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
			
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxNOTEBOOK_NAME)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
        
		//---------------------------------------------------------------------

		// TODO: Switch окно with NotebookPage

		public бул AddPage(Окно page, ткст текст)
		{ return AddPage(page, текст, нет, -1); }
		
		public бул AddPage(Окно page, ткст текст, бул select)
		{ return AddPage(page, текст, select, -1); }
		
		public бул AddPage(Окно page, ткст текст, бул select, цел imageId)
		{
			return wxNotebook_AddPage(шхобъ, wxObject.SafePtr(page), текст, select, imageId);
		}

		//---------------------------------------------------------------------

		public проц Images(ImageList значение) { wxNotebook_SetImageList(шхобъ, wxObject.SafePtr(значение)); }
		public ImageList Images() { return cast(ImageList)FindObject(wxNotebook_GetImageList(шхобъ)); }

		//---------------------------------------------------------------------

		public цел PageCount() { return wxNotebook_GetPageCount(шхобъ); }

		// TODO: Switch окно with NotebookPage
		public Окно GetPage(цел page)
		{
			return cast(Окно)FindObject(wxNotebook_GetPage(шхобъ, page));
		}

		//---------------------------------------------------------------------

		public цел Selection() { return wxNotebook_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxNotebook_SetSelection(шхобъ, значение); }

		public проц AdvanceSelection(бул forward)
		{
			wxNotebook_AdvanceSelection(шхобъ, forward);
		}

		//---------------------------------------------------------------------

		public бул SetPageText(цел page, ткст текст)
		{
			return wxNotebook_SetPageText(шхобъ, page, текст);
		}

		public ткст GetPageText(цел page)
		{
			return cast(ткст) new wxString(wxNotebook_GetPageText(шхобъ, page), да);
		}

		//---------------------------------------------------------------------

		public проц AssignImageList(ImageList imageList)
		{
			wxNotebook_AssignImageList(шхобъ, wxObject.SafePtr(imageList));
		}

		//---------------------------------------------------------------------

		public цел GetPageImage(цел page)
		{
			return wxNotebook_GetPageImage(шхобъ, page);
		}

		public бул SetPageImage(цел page, цел рисунок)
		{
			return wxNotebook_SetPageImage(шхобъ, page, рисунок);
		}

		//---------------------------------------------------------------------

		public цел RowCount() { return wxNotebook_GetRowCount(шхобъ); }

		//---------------------------------------------------------------------

		public проц PageSize(Размер значение) { wxNotebook_SetPageSize(шхобъ, значение); }

		public проц Padding(Размер значение) { wxNotebook_SetPadding(шхобъ, значение); }

		public проц TabSize(Размер значение) { wxNotebook_SetTabSize(шхобъ, значение); }

		//---------------------------------------------------------------------

		public бул DeletePage(цел page)
		{
			return wxNotebook_DeletePage(шхобъ, page);
		}

		public бул RemovePage(цел page)
		{
			return wxNotebook_RemovePage(шхобъ, page);
		}

		public бул DeleteAllPages()
		{
			return wxNotebook_DeleteAllPages(шхобъ);
		}

		//---------------------------------------------------------------------

		// TODO: Switch окно with NotebookPage
		public бул InsertPage(цел page, Окно окно, ткст текст,
							   бул select, цел рисунок)
		{
			return wxNotebook_InsertPage(шхобъ, page,
										 wxObject.SafePtr(окно), текст, select,
										 рисунок);
		}

		//---------------------------------------------------------------------

		public проц PageChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED, ИД, значение, this); }
		public проц PageChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц PageChanging_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING, ИД, значение, this); }
		public проц PageChanging_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
