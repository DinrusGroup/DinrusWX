module wx.ListCtrl;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.ImageList;

		//! \cond EXTERN
		static extern (C) IntPtr wxListItem_ctor();
		static extern (C) проц   wxListItem_Clear(IntPtr сам);
		static extern (C) проц   wxListItem_ClearAttributes(IntPtr сам);
		static extern (C) цел    wxListItem_GetAlign(IntPtr сам);
		static extern (C) IntPtr wxListItem_GetBackgroundColour(IntPtr сам);
		static extern (C) цел    wxListItem_GetColumn(IntPtr сам);
		static extern (C) IntPtr wxListItem_GetData(IntPtr сам);
		static extern (C) IntPtr wxListItem_GetFont(IntPtr сам);
		static extern (C) цел    wxListItem_GetId(IntPtr сам);
		static extern (C) цел    wxListItem_GetImage(IntPtr сам);
		static extern (C) цел    wxListItem_GetMask(IntPtr сам);
		static extern (C) цел    wxListItem_GetState(IntPtr сам);
		static extern (C) IntPtr wxListItem_GetText(IntPtr сам);
		static extern (C) IntPtr wxListItem_GetTextColour(IntPtr сам);
		static extern (C) цел    wxListItem_GetWidth(IntPtr сам);
		static extern (C) проц   wxListItem_SetAlign(IntPtr сам, цел alignment);
		static extern (C) проц   wxListItem_SetBackgroundColour(IntPtr сам, IntPtr col);
		static extern (C) проц   wxListItem_SetColumn(IntPtr сам, цел col);
		static extern (C) проц   wxListItem_SetData(IntPtr сам, IntPtr data);
		static extern (C) проц   wxListItem_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) проц   wxListItem_SetId(IntPtr сам, цел ид);
		static extern (C) проц   wxListItem_SetImage(IntPtr сам, цел рисунок);
		static extern (C) проц   wxListItem_SetMask(IntPtr сам, цел маска);
		static extern (C) проц   wxListItem_SetState(IntPtr сам, цел state);
		static extern (C) проц   wxListItem_SetStateMask(IntPtr сам, цел stateMask);
		static extern (C) проц   wxListItem_SetText(IntPtr сам, ткст текст);
		static extern (C) проц   wxListItem_SetTextColour(IntPtr сам, IntPtr col);
		static extern (C) проц   wxListItem_SetWidth(IntPtr сам, цел ширь);

		static extern (C) IntPtr wxListItem_GetAttributes(IntPtr сам);
		static extern (C) бул   wxListItem_HasAttributes(IntPtr сам);
		//! \endcond

	alias ListItem wxListItem;
	public class ListItem : wxObject
	{
		//---------------------------------------------------------------------

		public this(IntPtr wxobj) ;
		public this() ;
		public static wxObject Нов(IntPtr ptr);
		public проц Clear();
		public проц ClearAttributes();
		public цел Align();
		public проц Align(цел значение) ;
		public Цвет ЦветФона() ;
		public проц ЦветФона(Цвет значение) ;
		public цел Column();
		public проц Column(цел значение) ;
		public ClientData Data() ;
		public проц Data(ClientData значение) ;
		public Шрифт шрифт() ;
		public проц шрифт(Шрифт значение);
		public цел Ид() ;
		public проц Ид(цел значение);
		public цел Рисунок() ;
		public проц Рисунок(цел значение);
		public цел Маска() ;
		public проц Маска(цел значение) ;
		public цел State() ;
		public проц State(цел значение);
		public проц StateMask(цел значение);
		public ткст Text();
		public проц Text(ткст значение) ;
		public Цвет ЦветТекста();
		public проц ЦветТекста(Цвет значение) ;
		public цел Ширь();
		public проц Ширь(цел значение);
		public ListItemAttr Attributes() ;
		public бул HasAttributes();
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxListItemAttr_ctor();
		static extern (C) IntPtr wxListItemAttr_ctor2(IntPtr colText, IntPtr colBack, IntPtr шрифт);
		static extern (C) проц   wxListItemAttr_dtor(IntPtr сам);
		static extern (C) проц   wxListItemAttr_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxListItemAttr_SetTextColour(IntPtr сам, IntPtr colText);
		static extern (C) проц   wxListItemAttr_SetBackgroundColour(IntPtr сам, IntPtr colBack);
		static extern (C) проц   wxListItemAttr_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) бул   wxListItemAttr_HasTextColour(IntPtr сам);
		static extern (C) бул   wxListItemAttr_HasBackgroundColour(IntPtr сам);
		static extern (C) бул   wxListItemAttr_HasFont(IntPtr сам);
		static extern (C) IntPtr wxListItemAttr_GetTextColour(IntPtr сам);
		static extern (C) IntPtr wxListItemAttr_GetBackgroundColour(IntPtr сам);
		static extern (C) IntPtr wxListItemAttr_GetFont(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ListItemAttr wxListItemAttr;
	public class ListItemAttr : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(Цвет colText, Цвет colBack, Шрифт шрифт);
		public static wxObject Нов(IntPtr ptr);
		private override проц dtor() ;
		public Цвет ЦветТекста() ;
		public проц ЦветТекста(Цвет значение) ;
		public Цвет ЦветФона();
		public проц ЦветФона(Цвет значение);
		public Шрифт шрифт();
		public проц шрифт(Шрифт значение);
		public бул ЕстьЦветТекста();
		public бул ЕстьЦветФона();
		public бул ЕстьШрифт() ;
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias IntPtr function (ListCtrl, цел) Virtual_OnGetItemAttr;
		alias цел function (ListCtrl, цел) Virtual_OnGetItemImage;
		alias цел function (ListCtrl, цел, цел) Virtual_OnGetItemColumnImage;
		alias ткст function (ListCtrl, цел, цел) Virtual_OnGetItemText;

		alias цел function(цел элт1, цел элт2, цел sortData) wxListCtrlCompare;
		}

		static extern (C) IntPtr wxListCtrl_ctor();
		static extern (C) проц   wxListCtrl_dtor(IntPtr сам);
		static extern (C) проц   wxListCtrl_RegisterVirtual(IntPtr сам, ListCtrl объ, Virtual_OnGetItemAttr onGetItemAttr,
			Virtual_OnGetItemImage onGetItemImage,
			Virtual_OnGetItemColumnImage onGetItemColumnImage,
			Virtual_OnGetItemText onGetItemText);
		static extern (C) бул   wxListCtrl_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) бул   wxListCtrl_GetColumn(IntPtr сам, цел col, inout IntPtr элт);
		static extern (C) бул   wxListCtrl_SetColumn(IntPtr сам, цел col, IntPtr элт);
		static extern (C) цел    wxListCtrl_GetColumnWidth(IntPtr сам, цел col);
		static extern (C) бул   wxListCtrl_SetColumnWidth(IntPtr сам, цел col, цел ширь);
		static extern (C) цел    wxListCtrl_GetCountPerPage(IntPtr сам);
		static extern (C) IntPtr wxListCtrl_GetItem(IntPtr сам, IntPtr info, inout бул retval);
		static extern (C) бул   wxListCtrl_SetItem(IntPtr сам, IntPtr info);
		static extern (C) цел    wxListCtrl_SetItem_By_Row_Col(IntPtr сам, цел index, цел col, ткст ярлык, цел imageId);
		static extern (C) цел    wxListCtrl_GetItemState(IntPtr сам, цел элт, цел stateMask);
		static extern (C) бул   wxListCtrl_SetItemState(IntPtr сам, цел элт, цел state, цел stateMask);
		static extern (C) бул   wxListCtrl_SetItemImage(IntPtr сам, цел элт, цел рисунок, цел selImage);
		static extern (C) IntPtr wxListCtrl_GetItemText(IntPtr сам, цел элт);
		static extern (C) проц   wxListCtrl_SetItemText(IntPtr сам, цел элт, ткст стр);
		static extern (C) IntPtr wxListCtrl_GetItemData(IntPtr сам, цел элт);
		static extern (C) бул   wxListCtrl_SetItemData(IntPtr сам, цел элт, IntPtr data);
		static extern (C) бул   wxListCtrl_SetItemData2(IntPtr сам, цел элт, цел data);
		static extern (C) бул   wxListCtrl_GetItemRect(IntPtr сам, цел элт, out Прямоугольник прям, цел code);
		static extern (C) бул   wxListCtrl_GetItemPosition(IntPtr сам, цел элт, out Точка поз);
		static extern (C) бул   wxListCtrl_SetItemPosition(IntPtr сам, цел элт, inout Точка поз);
		static extern (C) цел    wxListCtrl_GetItemCount(IntPtr сам);
		static extern (C) цел    wxListCtrl_GetColumnCount(IntPtr сам);
		static extern (C) проц   wxListCtrl_SetItemTextColour(IntPtr сам, цел элт, IntPtr col);
		static extern (C) IntPtr wxListCtrl_GetItemTextColour(IntPtr сам, цел элт);
		static extern (C) проц   wxListCtrl_SetItemBackgroundColour(IntPtr сам, цел элт, IntPtr col);
		static extern (C) IntPtr wxListCtrl_GetItemBackgroundColour(IntPtr сам, цел элт);
		static extern (C) цел    wxListCtrl_GetSelectedItemCount(IntPtr сам);
		static extern (C) IntPtr wxListCtrl_GetTextColour(IntPtr сам);
		static extern (C) проц   wxListCtrl_SetTextColour(IntPtr сам, IntPtr col);
		static extern (C) цел    wxListCtrl_GetTopItem(IntPtr сам);
		static extern (C) проц   wxListCtrl_SetSingleStyle(IntPtr сам, бцел стиль, бул add);
		static extern (C) проц   wxListCtrl_SetWindowStyleFlag(IntPtr сам, бцел стиль);
		static extern (C) цел    wxListCtrl_GetNextItem(IntPtr сам, цел элт, цел geometry, цел state);
		static extern (C) IntPtr wxListCtrl_GetImageList(IntPtr сам, цел which);
		static extern (C) проц   wxListCtrl_SetImageList(IntPtr сам, IntPtr imageList, цел which);
		static extern (C) проц   wxListCtrl_AssignImageList(IntPtr сам, IntPtr imageList, цел which);
		static extern (C) бул   wxListCtrl_Arrange(IntPtr сам, цел флаг);
		static extern (C) проц   wxListCtrl_ClearAll(IntPtr сам);
		static extern (C) бул   wxListCtrl_DeleteItem(IntPtr сам, цел элт);
		static extern (C) бул   wxListCtrl_DeleteAllItems(IntPtr сам);
		static extern (C) бул   wxListCtrl_DeleteAllColumns(IntPtr сам);
		static extern (C) бул   wxListCtrl_DeleteColumn(IntPtr сам, цел col);
		static extern (C) проц   wxListCtrl_SetItemCount(IntPtr сам, цел count);
		static extern (C) проц   wxListCtrl_EditLabel(IntPtr сам, цел элт);
		static extern (C) бул   wxListCtrl_EnsureVisible(IntPtr сам, цел элт);
		static extern (C) цел    wxListCtrl_FindItem(IntPtr сам, цел start, ткст стр, бул partial);
		static extern (C) цел    wxListCtrl_FindItemData(IntPtr сам, цел start, IntPtr data);
		static extern (C) цел    wxListCtrl_FindItemPoint(IntPtr сам, цел start, inout Точка тчк, цел направление);
		static extern (C) цел    wxListCtrl_HitTest(IntPtr сам, inout Точка Точка, цел флаги);
		static extern (C) цел    wxListCtrl_InsertItem(IntPtr сам, IntPtr info);
		static extern (C) цел    wxListCtrl_InsertTextItem(IntPtr сам, цел index, ткст ярлык);
		static extern (C) цел    wxListCtrl_InsertImageItem(IntPtr сам, цел index, цел imageIndex);
		static extern (C) цел    wxListCtrl_InsertTextImageItem(IntPtr сам, цел index, ткст ярлык, цел imageIndex);
		static extern (C) цел    wxListCtrl_InsertColumn(IntPtr сам, цел col, IntPtr info);
		static extern (C) цел    wxListCtrl_InsertTextColumn(IntPtr сам, цел col, ткст heading, цел format, цел ширь);
		static extern (C) бул   wxListCtrl_ScrollList(IntPtr сам, цел dx, цел dy);
		static extern (C) бул   wxListCtrl_SortItems(IntPtr сам, wxListCtrlCompare fn, цел data);

		static extern (C) проц   wxListCtrl_GetViewRect(IntPtr сам, inout Прямоугольник прям);

		static extern (C) проц   wxListCtrl_RefreshItem(IntPtr сам, цел элт);
		static extern (C) проц   wxListCtrl_RefreshItems(IntPtr сам, цел элтFrom, цел элтTo);
		//! \endcond

	alias ListCtrl wxListCtrl;
	public class ListCtrl : Control
	{
		public const цел wxLC_VRULES           = 0x0001;
		public const цел wxLC_HRULES           = 0x0002;

		public const цел wxLC_ICON             = 0x0004;
		public const цел wxLC_SMALL_ICON       = 0x0008;
		public const цел wxLC_LIST             = 0x0010;
		public const цел wxLC_REPORT           = 0x0020;

		public const цел wxLC_ALIGN_TOP        = 0x0040;
		public const цел wxLC_ALIGN_LEFT       = 0x0080;
		public const цел wxLC_AUTO_ARRANGE     = 0x0100;
		public const цел wxLC_VIRTUAL          = 0x0200;
		public const цел wxLC_EDIT_LABELS      = 0x0400;
		public const цел wxLC_NO_HEADER        = 0x0800;
		public const цел wxLC_NO_SORT_HEADER   = 0x1000;
		public const цел wxLC_SINGLE_SEL       = 0x2000;
		public const цел wxLC_SORT_ASCENDING   = 0x4000;
		public const цел wxLC_SORT_DESCENDING  = 0x8000;

		public const цел wxLC_MASK_TYPE        = (wxLC_ICON | wxLC_SMALL_ICON | wxLC_LIST | wxLC_REPORT);
		public const цел wxLC_MASK_ALIGN       = (wxLC_ALIGN_TOP | wxLC_ALIGN_LEFT);
		public const цел wxLC_MASK_SORT        = (wxLC_SORT_ASCENDING | wxLC_SORT_DESCENDING);

		public const цел wxLIST_FORMAT_LEFT     = 0;
		public const цел wxLIST_FORMAT_RIGHT    = 1;
		public const цел wxLIST_FORMAT_CENTRE   = 2;
		public const цел wxLIST_FORMAT_CENTER   = wxLIST_FORMAT_CENTRE;

		public const цел wxLIST_MASK_STATE         = 0x0001;
		public const цел wxLIST_MASK_TEXT          = 0x0002;
		public const цел wxLIST_MASK_IMAGE         = 0x0004;
		public const цел wxLIST_MASK_DATA          = 0x0008;
		public const цел wxLIST_SET_ITEM           = 0x0010;
		public const цел wxLIST_MASK_WIDTH         = 0x0020;
		public const цел wxLIST_MASK_FORMAT        = 0x0040;

		public const цел wxLIST_NEXT_ABOVE     = 1;
		public const цел wxLIST_NEXT_ALL       = 2;
		public const цел wxLIST_NEXT_BELOW     = 3;
		public const цел wxLIST_NEXT_LEFT      = 4;
		public const цел wxLIST_NEXT_RIGHT     = 5;

		public const цел wxLIST_STATE_DONTCARE     = 0x0000;
		public const цел wxLIST_STATE_DROPHILITED  = 0x0001;
		public const цел wxLIST_STATE_FOCUSED      = 0x0002;
		public const цел wxLIST_STATE_SELECTED     = 0x0004;
		public const цел wxLIST_STATE_CUT          = 0x0008;

		public const цел wxLIST_HITTEST_ABOVE          = 0x0001;
		public const цел wxLIST_HITTEST_BELOW          = 0x0002;
		public const цел wxLIST_HITTEST_NOWHERE        = 0x0004;
		public const цел wxLIST_HITTEST_ONITEMICON     = 0x0020;
		public const цел wxLIST_HITTEST_ONITEMLABEL    = 0x0080;
		public const цел wxLIST_HITTEST_ONITEMRIGHT    = 0x0100;
		public const цел wxLIST_HITTEST_ONITEMSTATEICON= 0x0200;
		public const цел wxLIST_HITTEST_TOLEFT         = 0x0400;
		public const цел wxLIST_HITTEST_TORIGHT        = 0x0800;

		public const цел wxLIST_AUTOSIZE			= -1;
		public const цел wxLIST_AUTOSIZE_USEHEADER	= -2;

		//---------------------------------------------------------------------

		//---------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxLC_ICON, Оценщик оценщик = null, ткст имя = "ListCtrl");
		public static wxObject Нов(IntPtr ptr);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxLC_ICON, Оценщик оценщик = null, ткст имя = "ListCtrl");
		public бул Создай(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		static extern(C) private IntPtr staticOnGetItemAttr(ListCtrl объ, цел элт);
		protected  wxListItemAttr OnGetItemAttr(цел элт);
		static extern(C) private цел staticOnGetItemImage(ListCtrl объ, цел элт);
		protected  цел OnGetItemImage(цел элт);
		static extern(C) private цел staticOnGetItemColumnImage(ListCtrl объ, цел элт, цел column);
		protected  цел OnGetItemColumnImage(цел элт, цел column);
		static extern(C) private ткст staticOnGetItemText(ListCtrl объ, цел элт, цел column);
		protected  ткст OnGetItemText(цел элт, цел column);
		public бул GetColumn(цел col, out ListItem элт);
		public бул УстColumn(цел col, ListItem элт);
		public цел GetColumnWidth(цел col);
		public бул УстColumnWidth(цел col, цел ширь);
		public цел CountPerPage();
		public бул GetItem(inout ListItem info);
		public бул УстItem(ListItem info);
		public цел УстItem(цел index, цел col, ткст ярлык);
		public цел УстItem(цел index, цел col, ткст ярлык, цел imageId);
		public проц УстItemText(цел index, ткст ярлык);
		public ткст GetItemText(цел элт);
		public цел GetItemState(цел элт, цел stateMask);
		public бул УстItemState(цел элт, цел state, цел stateMask);
		public бул УстItemImage(цел элт, цел рисунок, цел selImage);
		public ClientData GetItemData(цел элт);
		public бул УстItemData(цел элт, ClientData data);
		public бул УстItemData(цел элт, цел data);
		public бул GetItemRect(цел элт, out Прямоугольник прям, цел code);
		public бул GetItemPosition(цел элт, out Точка поз);
		public бул УстItemPosition(цел элт, Точка поз);
		public цел ItemCount() ;
		public проц ItemCount(цел значение);
		public цел ColumnCount() ;
		public проц УстItemTextColour(цел элт, Цвет col);
		public Цвет GetItemTextColour(цел элт);
		public проц УстItemBackgroundColour(цел элт, Цвет col);
		public Цвет GetItemBackgroundColour(цел элт);
		public цел SelectedItemCount() ;
		public Цвет ЦветТекста() ;
		public проц ЦветТекста(Цвет значение);
		public цел TopItem();
		public проц УстSingleStyle(цел стиль, бул add);
		public проц WindowStyleFlag(цел значение);
		public цел GetNextItem(цел элт, цел geometry, цел state);
		public ImageList GetImageList(цел which);
		public проц УстImageList(ImageList imageList, цел which);
		public проц AssignImageList(ImageList imageList, цел which);
		public бул Arrange(цел флаг);
		public проц ClearAll();
		public бул DeleteItem(цел элт);
		public бул DeleteAllItems();
		public бул DeleteAllColumns();
		public бул DeleteColumn(цел col);
		public проц EditLabel(цел элт);
		public бул EnsureVisible(цел элт);
		public цел FindItem(цел start, ткст стр, бул partial);
		public цел FindItem(цел start, ClientData data);
		public цел FindItem(цел start, Точка тчк, цел направление);
		public цел ТестНажатия(Точка Точка, цел флаги);
		public цел InsertItem(ListItem info);
		public цел InsertItem(цел index, ткст ярлык);
		public цел InsertItem(цел index, цел imageIndex);
		public цел InsertItem(цел index, ткст ярлык, цел imageIndex);
		public цел InsertColumn(цел col, ListItem info);
		public цел InsertColumn(цел col, ткст heading);
		public цел InsertColumn(цел col, ткст heading, цел format, цел ширь);
		public бул ScrollList(цел dx, цел dy);
		public Прямоугольник ViewRect() ;
		public проц RefreshItem(цел элт);
		public проц RefreshItems(цел элтFrom, цел элтTo);
		public бул SortItems(wxListCtrlCompare fn, цел data);

		//-----------------------------------------------------------------------------

		public проц BeginDrag_Add(ДатчикСобытий значение);
		public проц BeginDrag_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц BeginRightDrag_Add(ДатчикСобытий значение);
		public проц BeginRightDrag_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц BeginLabelEdit_Add(ДатчикСобытий значение) ;
		public проц BeginLabelEdit_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц EndLabelEdit_Add(ДатчикСобытий значение) ;
		public проц EndLabelEdit_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemDelete_Add(ДатчикСобытий значение);
		public проц ItemDelete_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemDeleteAll_Add(ДатчикСобытий значение) ;
		public проц ItemDeleteAll_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц GetInfo_Add(ДатчикСобытий значение) ;
		public проц GetInfo_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц УстInfo_Add(ДатчикСобытий значение) ;
		public проц УстInfo_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemSelect_Add(ДатчикСобытий значение) ;
		public проц ItemSelect_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemDeselect_Add(ДатчикСобытий значение) ;
		public проц ItemDeselect_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemActivate_Add(ДатчикСобытий значение) ;
		public проц ItemActivate_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemFocus_Add(ДатчикСобытий значение) ;
		public проц ItemFocus_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemMiddleClick_Add(ДатчикСобытий значение);
		public проц ItemMiddleClick_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ItemRightClick_Add(ДатчикСобытий значение) ;
		public проц ItemRightClick_Remove(ДатчикСобытий значение);

		//-----------------------------------------------------------------------------

		public override проц KeyDown_Add(ДатчикСобытий значение);
		public override проц KeyDown_Remove(ДатчикСобытий значение);

		//-----------------------------------------------------------------------------

		public проц Insert_Add(ДатчикСобытий значение);
		public проц Insert_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ColumnClick_Add(ДатчикСобытий значение) ;
		public проц ColumnClick_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ColumnRightClick_Add(ДатчикСобытий значение);
		public проц ColumnRightClick_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ColumnBeginDrag_Add(ДатчикСобытий значение) ;
		public проц ColumnBeginDrag_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ColumnDragging_Add(ДатчикСобытий значение) ;
		public проц ColumnDragging_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц ColumnEndDrag_Add(ДатчикСобытий значение) ;
		public проц ColumnEndDrag_Remove(ДатчикСобытий значение) ;

		//-----------------------------------------------------------------------------

		public проц CacheHint_Add(ДатчикСобытий значение);
		public проц CacheHint_Remove(ДатчикСобытий значение);
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxListEvent_ctor(цел типКоманды, цел ид);
		static extern (C) IntPtr wxListEvent_GetItem(IntPtr сам);
		static extern (C) IntPtr wxListEvent_GetLabel(IntPtr сам);
		static extern (C) цел   wxListEvent_GetIndex(IntPtr сам);
		static extern (C) цел    wxListEvent_GetKeyCode(IntPtr сам);
		static extern (C) цел    wxListEvent_GetColumn(IntPtr сам);
		static extern (C) проц   wxListEvent_GetPoint(IntPtr сам, inout Точка тчк);
		static extern (C) IntPtr wxListEvent_GetText(IntPtr сам);
		static extern (C) цел wxListEvent_GetImage(IntPtr сам);
		static extern (C) цел wxListEvent_GetData(IntPtr сам);
		static extern (C) цел wxListEvent_GetMask(IntPtr сам);
		static extern (C) цел wxListEvent_GetCacheFrom(IntPtr сам);
		static extern (C) цел wxListEvent_GetCacheTo(IntPtr сам);
		static extern (C) бул wxListEvent_IsEditCancelled(IntPtr сам);
		static extern (C) проц wxListEvent_SetEditCanceled(IntPtr сам, бул editCancelled);
		static extern (C) проц wxListEvent_Veto(IntPtr сам);
		static extern (C) проц wxListEvent_Allow(IntPtr сам);
		static extern (C) бул wxListEvent_IsAllowed(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias ListEvent wxListEvent;
	public class ListEvent : Событие
	{
		public this(IntPtr wxobj);
		public this(цел типКоманды, цел ид);
		static Событие Нов(IntPtr ptr);
		public ткст Ярлык() ;
		public цел КодКл();
		public цел Index() ;
		public ListItem Элемент() ;
		public цел Column();
		public Точка точка() ;
		public ткст Text();
		public цел Рисунок();
		public цел Data() ;
		public цел Маска() ;
		public цел CacheFrom() ;
		public цел CacheTo();
		public бул EditCancelled() ;
		public проц EditCancelled(бул значение);
		public проц Veto();
		public проц Allow();
		public бул Allowed();

		static this()
		{


			wxEVT_COMMAND_LIST_BEGIN_DRAG = wxEvent_EVT_COMMAND_LIST_BEGIN_DRAG();
			wxEVT_COMMAND_LIST_BEGIN_RDRAG = wxEvent_EVT_COMMAND_LIST_BEGIN_RDRAG();
			wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT = wxEvent_EVT_COMMAND_LIST_BEGIN_LABEL_EDIT();
			wxEVT_COMMAND_LIST_END_LABEL_EDIT = wxEvent_EVT_COMMAND_LIST_END_LABEL_EDIT();
			wxEVT_COMMAND_LIST_DELETE_ITEM = wxEvent_EVT_COMMAND_LIST_DELETE_ITEM();
			wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS = wxEvent_EVT_COMMAND_LIST_DELETE_ALL_ITEMS();
			wxEVT_COMMAND_LIST_GET_INFO = wxEvent_EVT_COMMAND_LIST_GET_INFO();
			wxEVT_COMMAND_LIST_SET_INFO = wxEvent_EVT_COMMAND_LIST_SET_INFO();
			wxEVT_COMMAND_LIST_ITEM_SELECTED = wxEvent_EVT_COMMAND_LIST_ITEM_SELECTED();
			wxEVT_COMMAND_LIST_ITEM_DESELECTED = wxEvent_EVT_COMMAND_LIST_ITEM_DESELECTED();
			wxEVT_COMMAND_LIST_ITEM_ACTIVATED = wxEvent_EVT_COMMAND_LIST_ITEM_ACTIVATED();
			wxEVT_COMMAND_LIST_ITEM_FOCUSED = wxEvent_EVT_COMMAND_LIST_ITEM_FOCUSED();
			wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK = wxEvent_EVT_COMMAND_LIST_ITEM_MIDDLE_CLICK();
			wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK = wxEvent_EVT_COMMAND_LIST_ITEM_RIGHT_CLICK();
			wxEVT_COMMAND_LIST_KEY_DOWN = wxEvent_EVT_COMMAND_LIST_KEY_DOWN();
			wxEVT_COMMAND_LIST_INSERT_ITEM = wxEvent_EVT_COMMAND_LIST_INSERT_ITEM();
			wxEVT_COMMAND_LIST_COL_CLICK = wxEvent_EVT_COMMAND_LIST_COL_CLICK();
			wxEVT_COMMAND_LIST_COL_RIGHT_CLICK = wxEvent_EVT_COMMAND_LIST_COL_RIGHT_CLICK();
			wxEVT_COMMAND_LIST_COL_BEGIN_DRAG = wxEvent_EVT_COMMAND_LIST_COL_BEGIN_DRAG();
			wxEVT_COMMAND_LIST_COL_DRAGGING = wxEvent_EVT_COMMAND_LIST_COL_DRAGGING();
			wxEVT_COMMAND_LIST_COL_END_DRAG = wxEvent_EVT_COMMAND_LIST_COL_END_DRAG();
			wxEVT_COMMAND_LIST_CACHE_HINT = wxEvent_EVT_COMMAND_LIST_CACHE_HINT();

			ДобавьТипСоб(wxEVT_COMMAND_LIST_BEGIN_DRAG,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_BEGIN_RDRAG,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_END_LABEL_EDIT,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_DELETE_ITEM,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_GET_INFO,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_SET_INFO,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_SELECTED,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_DESELECTED,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_ACTIVATED,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_FOCUSED,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_KEY_DOWN,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_INSERT_ITEM,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_CLICK,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_RIGHT_CLICK,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_BEGIN_DRAG,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_DRAGGING,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_COL_END_DRAG,	&ListEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LIST_CACHE_HINT,	&ListEvent.Нов);
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxListView_ctor();
		static extern (C) бул wxListView_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) проц   wxListView_RegisterVirtual(IntPtr сам, ListCtrl объ, Virtual_OnGetItemAttr onGetItemAttr,
			Virtual_OnGetItemImage onGetItemImage,
			Virtual_OnGetItemColumnImage onGetItemColumnImage,
			Virtual_OnGetItemText onGetItemText);
		static extern (C) проц wxListView_Select(IntPtr сам, бцел n, бул on);
		static extern (C) проц wxListView_Focus(IntPtr сам, бцел index);
		static extern (C) бцел wxListView_GetFocusedItem(IntPtr сам);
		static extern (C) бцел wxListView_GetNextSelected(IntPtr сам, бцел элт);
		static extern (C) бцел wxListView_GetFirstSelected(IntPtr сам);
		static extern (C) бул wxListView_IsSelected(IntPtr сам, бцел index);
		static extern (C) проц wxListView_SetColumnImage(IntPtr сам, цел col, цел рисунок);
		static extern (C) проц wxListView_ClearColumnImage(IntPtr сам, цел col);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ListView wxListView;
	public class ListView : ListCtrl
	{
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель);
		public this(Окно родитель, цел ид);
		public this(Окно родитель, цел ид, Точка поз);
		public this(Окно родитель, цел ид, Точка поз, Размер разм);
		public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль);
		public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, Оценщик оценщик);
		public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public this(Окно родитель, Точка поз);
		public this(Окно родитель, Точка поз, Размер разм);
		public this(Окно родитель, Точка поз, Размер разм, цел стиль);
		public this(Окно родитель, Точка поз, Размер разм, цел стиль, Оценщик оценщик);
		public this(Окно родитель, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public override бул Создай(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, Оценщик оценщик, ткст имя);
		public проц Select(цел n);
		public проц Select(цел n, бул on);
		public проц Focus(цел index);
		public цел FocusedItem() ;
		public цел GetNextSelected(цел элт);
		public цел FirstSelected();
		public бул IsSelected(цел index);
		public проц УстColumnImage(цел col, цел рисунок);
		public проц ClearColumnImage(цел col);
	}
