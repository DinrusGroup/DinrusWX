module wx.Notebook;
public import wx.common;
public import wx.Event;
public import wx.Control;
public import wx.ImageList;

		//! \cond EXTERN
		static extern (C) IntPtr wxNotebookEvent_ctor(цел типКоманды, цел ид, цел nSel, цел nOldSel);
		static extern (C) цел    wxNotebookEvent_GetSelection(IntPtr сам);
		static extern (C) проц   wxNotebookEvent_SetSelection(IntPtr сам, цел nSel);
		static extern (C) цел    wxNotebookEvent_GetOldSelection(IntPtr сам);
		static extern (C) проц   wxNotebookEvent_SetOldSelection(IntPtr сам, цел nOldSel);
		static extern (C) проц wxNotebookEvent_Veto(IntPtr сам);
		static extern (C) проц wxNotebookEvent_Allow(IntPtr сам);
		static extern (C) бул wxNotebookEvent_IsAllowed(IntPtr сам);		
		//! \endcond

		//-----------------------------------------------------------------------------

	alias NotebookEvent wxNotebookEvent;
	public class NotebookEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(цел типКоманды, цел ид, цел nSel, цел nOldSel);
		public цел Выбор();
		public проц Выбор(цел значение);
		public цел OldSelection();
		public проц OldSelection(цел значение);
		public проц Veto();
		public проц Allow();
		public бул Allowed();
		private static Событие Нов(IntPtr объ) ;
		static this()
		{
			wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGED();
			wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGING();

			ДобавьТипСоб(wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED,   &NotebookEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING,  &NotebookEvent.Нов);
		}
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxNotebook_ctor();
		static extern (C) бул   wxNotebook_AddPage(IntPtr сам, IntPtr page, ткст текст, бул select, цел imageId);
		static extern (C) бул   wxNotebook_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) цел    wxNotebook_GetPageCount(IntPtr сам);
		static extern (C) IntPtr wxNotebook_GetPage(IntPtr сам, цел nPage);
		static extern (C) цел    wxNotebook_GetSelection(IntPtr сам);
		static extern (C) бул   wxNotebook_SetPageText(IntPtr сам, цел nPage, ткст strText);
		static extern (C) IntPtr wxNotebook_GetPageText(IntPtr сам, цел nPage);
		static extern (C) проц   wxNotebook_SetImageList(IntPtr сам, IntPtr imageList);
		static extern (C) проц   wxNotebook_AssignImageList(IntPtr сам, IntPtr imageList);
		static extern (C) IntPtr wxNotebook_GetImageList(IntPtr сам);
		static extern (C) цел    wxNotebook_GetPageImage(IntPtr сам, цел nPage);
		static extern (C) бул   wxNotebook_SetPageImage(IntPtr сам, цел nPage, цел nImage);
		static extern (C) цел    wxNotebook_GetRowCount(IntPtr сам);
		static extern (C) проц   wxNotebook_SetPageSize(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxNotebook_SetPadding(IntPtr сам, inout Размер padding);
		static extern (C) проц   wxNotebook_SetTabSize(IntPtr сам, inout Размер рм);
		static extern (C) бул   wxNotebook_DeletePage(IntPtr сам, цел nPage);
		static extern (C) бул   wxNotebook_RemovePage(IntPtr сам, цел nPage);
		static extern (C) бул   wxNotebook_DeleteAllPages(IntPtr сам);
		static extern (C) бул   wxNotebook_InsertPage(IntPtr сам, цел nPage, IntPtr pPage, ткст strText, бул bSelect, цел imageId);
		static extern (C) цел    wxNotebook_SetSelection(IntPtr сам, цел nPage);
		static extern (C) проц   wxNotebook_AdvanceSelection(IntPtr сам, бул forward);
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

		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxNOTEBOOK_NAME);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = wxNOTEBOOK_NAME);
		public бул AddPage(Окно page, ткст текст);
		public бул AddPage(Окно page, ткст текст, бул select);
		public бул AddPage(Окно page, ткст текст, бул select, цел imageId);
		public проц Images(ImageList значение);
		public ImageList Images() ;
		public цел PageCount() ;
		public Окно GetPage(цел page);
		public цел Выбор() ;
		public проц Выбор(цел значение) ;
		public проц AdvanceSelection(бул forward);
		public бул УстPageText(цел page, ткст текст);
		public ткст GetPageText(цел page);
		public проц AssignImageList(ImageList imageList);
		public цел GetPageImage(цел page);
		public бул УстPageImage(цел page, цел рисунок);
		public цел RowCount() ;
		public проц PageSize(Размер значение) ;
		public проц Padding(Размер значение) ;
		public проц TabSize(Размер значение);
		public бул DeletePage(цел page);
		public бул RemovePage(цел page);
		public бул DeleteAllPages();
		public бул InsertPage(цел page, Окно окно, ткст текст,
							   бул select, цел рисунок);
		public проц PageChange_Add(ДатчикСобытий значение) ;
		public проц PageChange_Remove(ДатчикСобытий значение) ;
		public проц PageChanging_Add(ДатчикСобытий значение);
		public проц PageChanging_Remove(ДатчикСобытий значение) ;
	}
