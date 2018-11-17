
module wx.Listbook;
public import wx.common;
public import wx.Control;
public import wx.ImageList;

		//! \cond EXTERN
		static extern (C) IntPtr wxListbookEvent_ctor(цел типКоманды, цел ид, цел nSel, цел nOldSel);
		static extern (C) цел    wxListbookEvent_GetSelection(IntPtr сам);
		static extern (C) проц   wxListbookEvent_SetSelection(IntPtr сам, цел nSel);
		static extern (C) цел    wxListbookEvent_GetOldSelection(IntPtr сам);
		static extern (C) проц   wxListbookEvent_SetOldSelection(IntPtr сам, цел nOldSel);
		static extern (C) проц wxListbookEvent_Veto(IntPtr сам);
		static extern (C) проц wxListbookEvent_Allow(IntPtr сам);
		static extern (C) бул wxListbookEvent_IsAllowed(IntPtr сам);		
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ListbookEvent wxListbookEvent;
	public class ListbookEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(EventType типКоманды, цел ид, цел nSel, цел nOldSel);
		static Событие Нов(IntPtr ptr);
		public цел Выбор() ;
		public проц Выбор(цел значение) ;
		public цел OldSelection();
		public проц OldSelection(цел значение);
		public проц Veto();
		public проц Allow();
		public бул Allowed() ;
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
		static extern (C) IntPtr wxListbook_ctor();
		static extern (C) бул wxListbook_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) цел wxListbook_GetSelection(IntPtr сам);
		static extern (C) бул wxListbook_SetPageText(IntPtr сам, цел n, ткст strText);
		static extern (C) IntPtr wxListbook_GetPageText(IntPtr сам, цел n);
		static extern (C) цел wxListbook_GetPageImage(IntPtr сам, цел n);
		static extern (C) бул wxListbook_SetPageImage(IntPtr сам, цел n, цел imageId);
		static extern (C) проц wxListbook_CalcSizeFromPage(IntPtr сам, inout Размер sizePage, out Размер outSize);
		static extern (C) бул wxListbook_InsertPage(IntPtr сам, цел n, IntPtr page, ткст текст, бул bSelect, цел imageId);
		static extern (C) цел wxListbook_SetSelection(IntPtr сам, цел n);
		static extern (C) проц wxListbook_SetImageList(IntPtr сам, IntPtr imageList);
		static extern (C) бул wxListbook_IsVertical(IntPtr сам);
		static extern (C) цел wxListbook_GetPageCount(IntPtr сам);
		static extern (C) IntPtr wxListbook_GetPage(IntPtr сам, цел n);
		static extern (C) проц wxListbook_AssignImageList(IntPtr сам, IntPtr imageList);
		static extern (C) IntPtr wxListbook_GetImageList(IntPtr сам);
		static extern (C) проц wxListbook_SetPageSize(IntPtr сам, inout Размер разм);
		static extern (C) бул wxListbook_DeletePage(IntPtr сам, цел nPage);
		static extern (C) бул wxListbook_RemovePage(IntPtr сам, цел nPage);
		static extern (C) бул wxListbook_DeleteAllPages(IntPtr сам);
		static extern (C) бул wxListbook_AddPage(IntPtr сам, IntPtr page, ткст текст, бул bselect, цел imageId);
		static extern (C) проц wxListbook_AdvanceSelection(IntPtr сам, бул forward);
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

		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = "");
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = 0, ткст имя = "");
		public цел Выбор();
		public проц Выбор(цел значение) ;
		public бул УстPageText(цел n, ткст strText);
		public ткст GetPageText(цел n);
		public цел GetPageImage(цел n);
		public бул УстPageImage(цел n, цел imageId);
		public Размер CalcSizeFromPage(Размер sizePage);		
		public бул InsertPage(цел n, Окно page, ткст текст);
		public бул InsertPage(цел n, Окно page, ткст текст, бул bSelect);
		public бул InsertPage(цел n, Окно page, ткст текст, бул bSelect, цел imageId);
		public проц imageList(ImageList значение) ;
		public ImageList imageList() ;
		public бул Vertical() ;
		public цел PageCount() ;
		public Окно GetPage(цел n);
		public проц AssignImageList(ImageList imageList);
		public проц PageSize(Размер значение);
		public бул DeletePage(цел nPage);
		public бул RemovePage(цел nPage);
		public бул DeleteAllPages();
		public бул AddPage(Окно page, ткст текст, бул bSelect, цел imageId);
		public проц AdvanceSelection(бул forward);
		public проц PageChange_Add(ДатчикСобытий значение);
		public проц PageChange_Remove(ДатчикСобытий значение) ;
		public проц PageChanging_Add(ДатчикСобытий значение);
		public проц PageChanging_Remove(ДатчикСобытий значение);
	}
