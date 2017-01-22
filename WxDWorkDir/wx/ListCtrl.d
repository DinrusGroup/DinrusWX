//-----------------------------------------------------------------------------
// wxD - ListCtrl.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ListCtrl.cs
//
/// The wxListCtrl wrapper class
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ListCtrl.d,v 1.12 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.ListCtrl;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.ImageList;

		//! \cond EXTERN
		static extern (C) ЦУк wxListItem_ctor();
		static extern (C) проц   wxListItem_Clear(ЦУк сам);
		static extern (C) проц   wxListItem_ClearAttributes(ЦУк сам);
		static extern (C) цел    wxListItem_GetAlign(ЦУк сам);
		static extern (C) ЦУк wxListItem_GetBackgroundColour(ЦУк сам);
		static extern (C) цел    wxListItem_GetColumn(ЦУк сам);
		static extern (C) ЦУк wxListItem_GetData(ЦУк сам);
		static extern (C) ЦУк wxListItem_GetFont(ЦУк сам);
		static extern (C) цел    wxListItem_GetId(ЦУк сам);
		static extern (C) цел    wxListItem_GetImage(ЦУк сам);
		static extern (C) цел    wxListItem_GetMask(ЦУк сам);
		static extern (C) цел    wxListItem_GetState(ЦУк сам);
		static extern (C) ЦУк wxListItem_GetText(ЦУк сам);
		static extern (C) ЦУк wxListItem_GetTextColour(ЦУк сам);
		static extern (C) цел    wxListItem_GetWidth(ЦУк сам);
		static extern (C) проц   wxListItem_SetAlign(ЦУк сам, цел alignment);
		static extern (C) проц   wxListItem_SetBackgroundColour(ЦУк сам, ЦУк col);
		static extern (C) проц   wxListItem_SetColumn(ЦУк сам, цел col);
		static extern (C) проц   wxListItem_SetData(ЦУк сам, ЦУк данные);
		static extern (C) проц   wxListItem_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) проц   wxListItem_SetId(ЦУк сам, цел ид);
		static extern (C) проц   wxListItem_SetImage(ЦУк сам, цел рисунок);
		static extern (C) проц   wxListItem_SetMask(ЦУк сам, цел маска);
		static extern (C) проц   wxListItem_SetState(ЦУк сам, цел state);
		static extern (C) проц   wxListItem_SetStateMask(ЦУк сам, цел stateMask);
		static extern (C) проц   wxListItem_SetText(ЦУк сам, ткст текст);
		static extern (C) проц   wxListItem_SetTextColour(ЦУк сам, ЦУк col);
		static extern (C) проц   wxListItem_SetWidth(ЦУк сам, цел ширина);
		
		static extern (C) ЦУк wxListItem_GetAttributes(ЦУк сам);
		static extern (C) бул   wxListItem_HasAttributes(ЦУк сам);
		//! \endcond

	alias ListItem wxListItem;
	public class ListItem : wxObject
	{
		//---------------------------------------------------------------------

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this() 
			{ super(wxListItem_ctor()); }

		public static wxObject Нов(ЦУк ptr) { return new ListItem(ptr); }

		//---------------------------------------------------------------------
        
		public проц Очисть()
		{
			wxListItem_Clear(шхобъ);
		}
		
		//---------------------------------------------------------------------
        
		public проц ClearAttributes()
		{
			wxListItem_ClearAttributes(шхобъ);
		}

		//---------------------------------------------------------------------

		public цел Align() { return wxListItem_GetAlign(шхобъ); }
		public проц Align(цел значение) { wxListItem_SetAlign(шхобъ, значение); }
        
		//---------------------------------------------------------------------
        
		public Цвет ЦветЗП() { return new Цвет(wxListItem_GetBackgroundColour(шхобъ), да); }
		public проц ЦветЗП(Цвет значение) {  wxListItem_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); } 

		//---------------------------------------------------------------------
        
		public цел Column() { return wxListItem_GetColumn(шхобъ); }
		public проц Column(цел значение) { wxListItem_SetColumn(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public ClientData Data() { return cast(ClientData)FindObject(wxListItem_GetData(шхобъ)); }
		public проц Data(ClientData значение) { wxListItem_SetData(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
        
		public Шрифт шрифт() { return new Шрифт(wxListItem_GetFont(шхобъ)); }
		public проц шрифт(Шрифт значение) { wxListItem_SetFont(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------
        
		public цел Ид() { return wxListItem_GetId(шхобъ); }
		public проц Ид(цел значение) { wxListItem_SetId(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public цел Рисунок() { return wxListItem_GetImage(шхобъ); }
		public проц Рисунок(цел значение) { wxListItem_SetImage(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public цел Маска() { return wxListItem_GetMask(шхобъ); }
		public проц Маска(цел значение) { wxListItem_SetMask(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public цел State() { return wxListItem_GetState(шхобъ); }
		public проц State(цел значение) { wxListItem_SetState(шхобъ, значение); }

		public проц StateMask(цел значение) { wxListItem_SetStateMask(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public ткст Текст() { return cast(ткст) new wxString(wxListItem_GetText(шхобъ), да); }
		public проц Текст(ткст значение) { wxListItem_SetText(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public Цвет TextColour() { return new Цвет(wxListItem_GetTextColour(шхобъ), да); }
		public проц TextColour(Цвет значение) { wxListItem_SetTextColour(шхобъ, wxObject.SafePtr(значение)); } 

		//---------------------------------------------------------------------
        
		public цел Ширина() { return wxListItem_GetWidth(шхобъ); }
		public проц Ширина(цел значение) { wxListItem_SetWidth(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public ListItemAttr Attributes() { return cast(ListItemAttr)FindObject(wxListItem_GetAttributes(шхобъ), &ListItemAttr.Нов); }
		
		//---------------------------------------------------------------------
		
		public бул HasAttributes()
		{
			return wxListItem_HasAttributes(шхобъ);
		}
	}
	
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxListItemAttr_ctor();
		static extern (C) ЦУк wxListItemAttr_ctor2(ЦУк colText, ЦУк colBack, ЦУк шрифт);
		static extern (C) проц   wxListItemAttr_dtor(ЦУк сам);
		static extern (C) проц   wxListItemAttr_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxListItemAttr_SetTextColour(ЦУк сам, ЦУк colText);
		static extern (C) проц   wxListItemAttr_SetBackgroundColour(ЦУк сам, ЦУк colBack);
		static extern (C) проц   wxListItemAttr_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) бул   wxListItemAttr_HasTextColour(ЦУк сам);
		static extern (C) бул   wxListItemAttr_HasBackgroundColour(ЦУк сам);
		static extern (C) бул   wxListItemAttr_HasFont(ЦУк сам);
		static extern (C) ЦУк wxListItemAttr_GetTextColour(ЦУк сам);
		static extern (C) ЦУк wxListItemAttr_GetBackgroundColour(ЦУк сам);
		static extern (C) ЦУк wxListItemAttr_GetFont(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias ListItemAttr wxListItemAttr;
	public class ListItemAttr : wxObject
	{
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this()
		{
			this(wxListItemAttr_ctor(), да);
			wxListItemAttr_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		public this(Цвет colText, Цвет colBack, Шрифт шрифт)
		{
			this(wxListItemAttr_ctor2(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(шрифт)), да);
			wxListItemAttr_RegisterDisposable(шхобъ, &VirtualDispose);
		}
		
		public static wxObject Нов(ЦУк ptr) { return new ListItemAttr(ptr); }
		//---------------------------------------------------------------------
		
		private override проц dtor() { wxListItemAttr_dtor(шхобъ); }

		//---------------------------------------------------------------------
		
		public Цвет TextColour() { return new Цвет(wxListItemAttr_GetTextColour(шхобъ), да); }
		public проц TextColour(Цвет значение) { wxListItemAttr_SetTextColour(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public Цвет ЦветЗП() { return new Цвет(wxListItemAttr_GetBackgroundColour(шхобъ), да); }
		public проц ЦветЗП(Цвет значение) { wxListItemAttr_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public Шрифт шрифт() { return new Шрифт(wxListItemAttr_GetFont(шхобъ), да); }
		public проц шрифт(Шрифт значение) { wxListItemAttr_SetFont(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------
		
		public бул HasTextColour() { return wxListItemAttr_HasTextColour(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasBackgroundColour() { return wxListItemAttr_HasBackgroundColour(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public бул HasFont() { return wxListItemAttr_HasFont(шхобъ); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias ЦУк function (ListCtrl, цел) Virtual_OnGetItemAttr;
		alias цел function (ListCtrl, цел) Virtual_OnGetItemImage;
		alias цел function (ListCtrl, цел, цел) Virtual_OnGetItemColumnImage;
		alias ткст function (ListCtrl, цел, цел) Virtual_OnGetItemText;

		alias цел function(цел item1, цел item2, цел sortData) wxListCtrlCompare;
		}
	
		static extern (C) ЦУк wxListCtrl_ctor();
		static extern (C) проц   wxListCtrl_dtor(ЦУк сам);
		static extern (C) проц   wxListCtrl_RegisterVirtual(ЦУк сам, ListCtrl объ, Virtual_OnGetItemAttr onGetItemAttr,
			Virtual_OnGetItemImage onGetItemImage,
			Virtual_OnGetItemColumnImage onGetItemColumnImage,
			Virtual_OnGetItemText onGetItemText);
		static extern (C) бул   wxListCtrl_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) бул   wxListCtrl_GetColumn(ЦУк сам, цел col, inout ЦУк элемент);
		static extern (C) бул   wxListCtrl_SetColumn(ЦУк сам, цел col, ЦУк элемент);
		static extern (C) цел    wxListCtrl_GetColumnWidth(ЦУк сам, цел col);
		static extern (C) бул   wxListCtrl_SetColumnWidth(ЦУк сам, цел col, цел ширина);
		static extern (C) цел    wxListCtrl_GetCountPerPage(ЦУк сам);
		static extern (C) ЦУк wxListCtrl_GetItem(ЦУк сам, ЦУк info, inout бул retval);
		static extern (C) бул   wxListCtrl_SetItem(ЦУк сам, ЦУк info);
		static extern (C) цел    wxListCtrl_SetItem_By_Row_Col(ЦУк сам, цел индекс, цел col, ткст надпись, цел imageId);
		static extern (C) цел    wxListCtrl_GetItemState(ЦУк сам, цел элемент, цел stateMask);
		static extern (C) бул   wxListCtrl_SetItemState(ЦУк сам, цел элемент, цел state, цел stateMask);
		static extern (C) бул   wxListCtrl_SetItemImage(ЦУк сам, цел элемент, цел рисунок, цел selImage);
		static extern (C) ЦУк wxListCtrl_GetItemText(ЦУк сам, цел элемент);
		static extern (C) проц   wxListCtrl_SetItemText(ЦУк сам, цел элемент, ткст str);
		static extern (C) ЦУк wxListCtrl_GetItemData(ЦУк сам, цел элемент);
		static extern (C) бул   wxListCtrl_SetItemData(ЦУк сам, цел элемент, ЦУк данные);
		static extern (C) бул   wxListCtrl_SetItemData2(ЦУк сам, цел элемент, цел данные);
		static extern (C) бул   wxListCtrl_GetItemRect(ЦУк сам, цел элемент, out Прямоугольник прям, цел code);
		static extern (C) бул   wxListCtrl_GetItemPosition(ЦУк сам, цел элемент, out Точка поз);
		static extern (C) бул   wxListCtrl_SetItemPosition(ЦУк сам, цел элемент, inout Точка поз);
		static extern (C) цел    wxListCtrl_GetItemCount(ЦУк сам);
		static extern (C) цел    wxListCtrl_GetColumnCount(ЦУк сам);
		static extern (C) проц   wxListCtrl_SetItemTextColour(ЦУк сам, цел элемент, ЦУк col);
		static extern (C) ЦУк wxListCtrl_GetItemTextColour(ЦУк сам, цел элемент);
		static extern (C) проц   wxListCtrl_SetItemBackgroundColour(ЦУк сам, цел элемент, ЦУк col);
		static extern (C) ЦУк wxListCtrl_GetItemBackgroundColour(ЦУк сам, цел элемент);
		static extern (C) цел    wxListCtrl_GetSelectedItemCount(ЦУк сам);
		static extern (C) ЦУк wxListCtrl_GetTextColour(ЦУк сам);
		static extern (C) проц   wxListCtrl_SetTextColour(ЦУк сам, ЦУк col);
		static extern (C) цел    wxListCtrl_GetTopItem(ЦУк сам);
		static extern (C) проц   wxListCtrl_SetSingleStyle(ЦУк сам, бцел стиль, бул add);
		static extern (C) проц   wxListCtrl_SetWindowStyleFlag(ЦУк сам, бцел стиль);
		static extern (C) цел    wxListCtrl_GetNextItem(ЦУк сам, цел элемент, цел geometry, цел state);
		static extern (C) ЦУк wxListCtrl_GetImageList(ЦУк сам, цел which);
		static extern (C) проц   wxListCtrl_SetImageList(ЦУк сам, ЦУк imageList, цел which);
		static extern (C) проц   wxListCtrl_AssignImageList(ЦУк сам, ЦУк imageList, цел which);
		static extern (C) бул   wxListCtrl_Arrange(ЦУк сам, цел flag);
		static extern (C) проц   wxListCtrl_ClearAll(ЦУк сам);
		static extern (C) бул   wxListCtrl_DeleteItem(ЦУк сам, цел элемент);
		static extern (C) бул   wxListCtrl_DeleteAllItems(ЦУк сам);
		static extern (C) бул   wxListCtrl_DeleteAllColumns(ЦУк сам);
		static extern (C) бул   wxListCtrl_DeleteColumn(ЦУк сам, цел col);
		static extern (C) проц   wxListCtrl_SetItemCount(ЦУк сам, цел счёт);
		static extern (C) проц   wxListCtrl_EditLabel(ЦУк сам, цел элемент);
		static extern (C) бул   wxListCtrl_EnsureVisible(ЦУк сам, цел элемент);
		static extern (C) цел    wxListCtrl_FindItem(ЦУк сам, цел start, ткст str, бул partial);
		static extern (C) цел    wxListCtrl_FindItemData(ЦУк сам, цел start, ЦУк данные);
		static extern (C) цел    wxListCtrl_FindItemPoint(ЦУк сам, цел start, inout Точка pt, цел direction);
		static extern (C) цел    wxListCtrl_HitTest(ЦУк сам, inout Точка point, цел флаги);
		static extern (C) цел    wxListCtrl_InsertItem(ЦУк сам, ЦУк info);
		static extern (C) цел    wxListCtrl_InsertTextItem(ЦУк сам, цел индекс, ткст надпись);
		static extern (C) цел    wxListCtrl_InsertImageItem(ЦУк сам, цел индекс, цел imageIndex);
		static extern (C) цел    wxListCtrl_InsertTextImageItem(ЦУк сам, цел индекс, ткст надпись, цел imageIndex);
		static extern (C) цел    wxListCtrl_InsertColumn(ЦУк сам, цел col, ЦУк info);
		static extern (C) цел    wxListCtrl_InsertTextColumn(ЦУк сам, цел col, ткст heading, цел format, цел ширина);
		static extern (C) бул   wxListCtrl_ScrollList(ЦУк сам, цел dx, цел dy);
		static extern (C) бул   wxListCtrl_SortItems(ЦУк сам, wxListCtrlCompare fn, цел данные);
		
		static extern (C) проц   wxListCtrl_GetViewRect(ЦУк сам, inout Прямоугольник прям);
		
		static extern (C) проц   wxListCtrl_RefreshItem(ЦУк сам, цел элемент);
		static extern (C) проц   wxListCtrl_RefreshItems(ЦУк сам, цел itemFrom, цел itemTo);
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
        
		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this()
			{ super(wxListCtrl_ctor()); }

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxLC_ICON, Validator validator = пусто, ткст имя = "ListCtrl")
		{
			super(wxListCtrl_ctor());
			if (!Create(родитель, ид, поз, size, стиль, validator, имя))
			{
				throw new InvalidOperationException("Failed to create ListCtrl");
			}
			
			wxListCtrl_RegisterVirtual(шхобъ, this, &staticOnGetItemAttr, 
				&staticOnGetItemImage, &staticOnGetItemColumnImage, 
				&staticOnGetItemText);
		}
	
		public static wxObject Нов(ЦУк ptr) { return new ListCtrl(ptr); }
		//---------------------------------------------------------------------
		// ctors with сам created ид
	
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxLC_ICON, Validator validator = пусто, ткст имя = "ListCtrl")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, validator, имя);}
	
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
		{
			return wxListCtrl_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}
		
		//---------------------------------------------------------------------
		
		static extern(C) private ЦУк staticOnGetItemAttr(ListCtrl объ, цел элемент)
		{
			return wxObject.SafePtr(объ.OnGetItemAttr(элемент));
		}
		protected /+virtual+/ wxListItemAttr OnGetItemAttr(цел элемент)
		{
			return пусто;
		}
		
		//---------------------------------------------------------------------
		
		static extern(C) private цел staticOnGetItemImage(ListCtrl объ, цел элемент)
		{
			return объ.OnGetItemImage(элемент);
		}
		protected /+virtual+/ цел OnGetItemImage(цел элемент)
		{
			return -1;
		}
		
		//---------------------------------------------------------------------
		
		static extern(C) private цел staticOnGetItemColumnImage(ListCtrl объ, цел элемент, цел column)
		{
			return объ.OnGetItemColumnImage(элемент, column);
		}
		protected /+virtual+/ цел OnGetItemColumnImage(цел элемент, цел column)
		{
			return -1;
		}
		
		//---------------------------------------------------------------------
		
		static extern(C) private ткст staticOnGetItemText(ListCtrl объ, цел элемент, цел column)
		{
			return объ.OnGetItemText(элемент, column);
		}
		protected /+virtual+/ ткст OnGetItemText(цел элемент, цел column)
		{
			assert(0, "Generic OnGetItemText not supposed to be called");
		}
		
		//---------------------------------------------------------------------
		
		public бул GetColumn(цел col, out ListItem элемент)
		{
			элемент = new ListItem();
			return wxListCtrl_GetColumn(шхобъ, col, элемент.шхобъ);
		}
		
		//---------------------------------------------------------------------

		public бул SetColumn(цел col, ListItem элемент)
		{
			return wxListCtrl_SetColumn(шхобъ, col, wxObject.SafePtr(элемент));
		}

		//---------------------------------------------------------------------

		public цел GetColumnWidth(цел col)
		{
			return wxListCtrl_GetColumnWidth(шхобъ, col);
		}
		
		//---------------------------------------------------------------------

		public бул SetColumnWidth(цел col, цел ширина)
		{
			return wxListCtrl_SetColumnWidth(шхобъ, col, ширина);
		}

		//---------------------------------------------------------------------

		public цел CountPerPage() { return wxListCtrl_GetCountPerPage(шхобъ); }

		//---------------------------------------------------------------------

		public бул GetItem(inout ListItem info)
		{
			бул retval = нет;
			info  = cast(ListItem)FindObject(wxListCtrl_GetItem(шхобъ, wxObject.SafePtr(info), retval), &ListItem.Нов);
			return retval;
		}
		
		//---------------------------------------------------------------------

		public бул SetItem(ListItem info)
		{
			return wxListCtrl_SetItem(шхобъ, wxObject.SafePtr(info));
		}

		public цел SetItem(цел индекс, цел col, ткст надпись)
		{
			return SetItem(индекс, col, надпись, -1);
		}

		public цел SetItem(цел индекс, цел col, ткст надпись, цел imageId)
		{
			return wxListCtrl_SetItem_By_Row_Col(шхобъ, индекс, col, надпись, imageId);
		}


		//---------------------------------------------------------------------

		public проц SetItemText(цел индекс, ткст надпись)
		{
			wxListCtrl_SetItemText(шхобъ, индекс, надпись);
		}
		
		//---------------------------------------------------------------------

		public ткст GetItemText(цел элемент)
		{
			return cast(ткст) new wxString(wxListCtrl_GetItemText(шхобъ, элемент), да);
		}

		//---------------------------------------------------------------------

		public цел GetItemState(цел элемент, цел stateMask)
		{
			return wxListCtrl_GetItemState(шхобъ, элемент , stateMask);
		}

		public бул SetItemState(цел элемент, цел state, цел stateMask)
		{
			return wxListCtrl_SetItemState(шхобъ, элемент, state, stateMask);
		}

		//---------------------------------------------------------------------

		public бул SetItemImage(цел элемент, цел рисунок, цел selImage)
		{
			return wxListCtrl_SetItemImage(шхобъ, элемент, рисунок, selImage);
		}

		//---------------------------------------------------------------------

		public ClientData GetItemData(цел элемент)
		{
			return cast(ClientData)FindObject(wxListCtrl_GetItemData(шхобъ, элемент));
		}
		
		//---------------------------------------------------------------------

		public бул SetItemData(цел элемент, ClientData данные)
		{
			return wxListCtrl_SetItemData(шхобъ, элемент, wxObject.SafePtr(данные));
		}
		
		//---------------------------------------------------------------------

		public бул SetItemData(цел элемент, цел данные)
		{
			return wxListCtrl_SetItemData2(шхобъ, элемент, данные);
		}

		//---------------------------------------------------------------------

		public бул GetItemRect(цел элемент, out Прямоугольник прям, цел code)
		{
			return wxListCtrl_GetItemRect(шхобъ, элемент, прям, code);
		}

		//---------------------------------------------------------------------

		public бул GetItemPosition(цел элемент, out Точка поз)
		{
			return wxListCtrl_GetItemPosition(шхобъ, элемент, поз);
		}
		
		//---------------------------------------------------------------------

		public бул SetItemPosition(цел элемент, Точка поз)
		{
			return wxListCtrl_SetItemPosition(шхобъ, элемент, поз);
		}

		//---------------------------------------------------------------------

		public цел ItemCount() { return wxListCtrl_GetItemCount(шхобъ); }
		public проц ItemCount(цел значение) { wxListCtrl_SetItemCount(шхобъ, значение); }
		
		//---------------------------------------------------------------------

		public цел ColumnCount() { return wxListCtrl_GetColumnCount(шхобъ); }
		
		//---------------------------------------------------------------------

		public проц SetItemTextColour(цел элемент, Цвет col)
		{
			wxListCtrl_SetItemTextColour(шхобъ, элемент, wxObject.SafePtr(col));
		}
		
		//---------------------------------------------------------------------

		public Цвет GetItemTextColour(цел элемент)
		{
			return new Цвет(wxListCtrl_GetItemTextColour(шхобъ, элемент), да);
		}

		//---------------------------------------------------------------------

		public проц SetItemBackgroundColour(цел элемент, Цвет col)
		{
			wxListCtrl_SetItemBackgroundColour(шхобъ, элемент, wxObject.SafePtr(col));
		}
		
		//---------------------------------------------------------------------

		public Цвет GetItemBackgroundColour(цел элемент)
		{
			return new Цвет(wxListCtrl_GetItemBackgroundColour(шхобъ, элемент), да);
		}

		//---------------------------------------------------------------------

		public цел SelectedItemCount() { return wxListCtrl_GetSelectedItemCount(шхобъ); }

		//---------------------------------------------------------------------

		public Цвет TextColour() { return new Цвет(wxListCtrl_GetTextColour(шхобъ), да); }
		public проц TextColour(Цвет значение) { wxListCtrl_SetTextColour(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------

		public цел TopItem() { return wxListCtrl_GetTopItem(шхобъ); }

		//---------------------------------------------------------------------

		public проц SetSingleStyle(цел стиль, бул add)
		{
			wxListCtrl_SetSingleStyle(шхобъ, cast(бцел)стиль, add);
		}
		
		//---------------------------------------------------------------------

		public проц WindowStyleFlag(цел значение) { wxListCtrl_SetWindowStyleFlag(шхобъ, cast(бцел)значение); }

		//---------------------------------------------------------------------

		public цел GetNextItem(цел элемент, цел geometry, цел state)
		{
			return wxListCtrl_GetNextItem(шхобъ, элемент, geometry, state);
		}

		//---------------------------------------------------------------------

		public ImageList GetImageList(цел which)
		{
			return cast(ImageList)FindObject(wxListCtrl_GetImageList(шхобъ, which), &ImageList.Нов);
		}
		
		//---------------------------------------------------------------------

		public проц SetImageList(ImageList imageList, цел which)
		{
			wxListCtrl_SetImageList(шхобъ, wxObject.SafePtr(imageList), which);
		}
		
		//---------------------------------------------------------------------

		public проц AssignImageList(ImageList imageList, цел which)
		{
			wxListCtrl_AssignImageList(шхобъ, wxObject.SafePtr(imageList), which);
		}

		//---------------------------------------------------------------------

		public бул Arrange(цел flag)
		{
			return wxListCtrl_Arrange(шхобъ, flag);
		}

		//---------------------------------------------------------------------

		public проц ClearAll()
		{
			wxListCtrl_ClearAll(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public бул DeleteItem(цел элемент)
		{
			return wxListCtrl_DeleteItem(шхобъ, элемент);
		}
		
		//---------------------------------------------------------------------

		public бул DeleteAllItems()
		{
			return wxListCtrl_DeleteAllItems(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public бул DeleteAllColumns()
		{
			return wxListCtrl_DeleteAllColumns(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public бул DeleteColumn(цел col)
		{
			return wxListCtrl_DeleteColumn(шхобъ, col);
		}

		//---------------------------------------------------------------------

		public проц EditLabel(цел элемент)
		{
			wxListCtrl_EditLabel(шхобъ, элемент);
		}

		//---------------------------------------------------------------------

		public бул EnsureVisible(цел элемент)
		{
			return wxListCtrl_EnsureVisible(шхобъ, элемент);
		}

		//---------------------------------------------------------------------

		public цел FindItem(цел start, ткст str, бул partial)
		{
			return wxListCtrl_FindItem(шхобъ, start, str, partial);
		}

		// TODO: Verify данные
		public цел FindItem(цел start, ClientData данные)
		{
			return wxListCtrl_FindItemData(шхобъ, start, wxObject.SafePtr(данные));
		}

		public цел FindItem(цел start, Точка pt, цел direction)
		{
			return wxListCtrl_FindItemPoint(шхобъ, start, pt, direction);
		}

		//---------------------------------------------------------------------

		public цел HitTest(Точка point, цел флаги)
		{
			return wxListCtrl_HitTest(шхобъ, point, флаги);
		}

		//---------------------------------------------------------------------

		public цел InsertItem(ListItem info)
		{
			return wxListCtrl_InsertItem(шхобъ, wxObject.SafePtr(info));
		}

		public цел InsertItem(цел индекс, ткст надпись)
		{
			return wxListCtrl_InsertTextItem(шхобъ, индекс, надпись);
		}

		public цел InsertItem(цел индекс, цел imageIndex)
		{
			return wxListCtrl_InsertImageItem(шхобъ, индекс, imageIndex);
		}

		public цел InsertItem(цел индекс, ткст надпись, цел imageIndex)
		{
			return wxListCtrl_InsertTextImageItem(шхобъ, индекс, надпись, imageIndex);
		}

		//---------------------------------------------------------------------
        
		public цел InsertColumn(цел col, ListItem info)
		{
			return wxListCtrl_InsertColumn(шхобъ, col, wxObject.SafePtr(info));
		}

		public цел InsertColumn(цел col, ткст heading)
		{ 
			return InsertColumn(col, heading, wxLIST_FORMAT_LEFT, -1); 
		}
			
		public цел InsertColumn(цел col, ткст heading, цел format, цел ширина)
		{
			return wxListCtrl_InsertTextColumn(шхобъ, col, heading, format, ширина);
		}

		//---------------------------------------------------------------------

		public бул ScrollList(цел dx, цел dy)
		{
			return wxListCtrl_ScrollList(шхобъ, dx, dy);
		}
		
		//---------------------------------------------------------------------
		
		public Прямоугольник ViewRect() {
				Прямоугольник прям;
				wxListCtrl_GetViewRect(шхобъ, прям);
				return прям;
			}
		
		//---------------------------------------------------------------------
		
		public проц RefreshItem(цел элемент)
		{
			wxListCtrl_RefreshItem(шхобъ, элемент);
		}
		
		//---------------------------------------------------------------------
		
		public проц RefreshItems(цел itemFrom, цел itemTo)
		{
			wxListCtrl_RefreshItems(шхобъ, itemFrom, itemTo);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул SortItems(wxListCtrlCompare fn, цел данные)
		{
			бул retval = wxListCtrl_SortItems(шхобъ, fn, данные);
			
			fn = пусто;
			
			return retval;
		}
		
		//-----------------------------------------------------------------------------

		public проц BeginDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_DRAG, ИД, значение, this); }
		public проц BeginDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц BeginRightDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_RDRAG, ИД, значение, this); }
		public проц BeginRightDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц BeginLabelEdit_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_BEGIN_LABEL_EDIT, ИД, значение, this); }
		public проц BeginLabelEdit_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц EndLabelEdit_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_END_LABEL_EDIT, ИД, значение, this); }
		public проц EndLabelEdit_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemDelete_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_DELETE_ITEM, ИД, значение, this); }
		public проц ItemDelete_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemDeleteAll_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_DELETE_ALL_ITEMS, ИД, значение, this); }
		public проц ItemDeleteAll_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------
		
		public проц GetInfo_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_GET_INFO, ИД, значение, this); }
		public проц GetInfo_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------
		
		public проц SetInfo_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_SET_INFO, ИД, значение, this); }
		public проц SetInfo_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemSelect_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_SELECTED, ИД, значение, this); }
		public проц ItemSelect_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemDeselect_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_DESELECTED, ИД, значение, this); }
		public проц ItemDeselect_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemActivate_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_ACTIVATED, ИД, значение, this); }
		public проц ItemActivate_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemFocus_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_FOCUSED, ИД, значение, this); }
		public проц ItemFocus_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemMiddleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_MIDDLE_CLICK, ИД, значение, this); }
		public проц ItemMiddleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ItemRightClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_ITEM_RIGHT_CLICK, ИД, значение, this); }
		public проц ItemRightClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public override проц KeyDown_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_KEY_DOWN, ИД, значение, this); }
		public override проц KeyDown_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц Insert_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_INSERT_ITEM, ИД, значение, this); }
		public проц Insert_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ColumnClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_CLICK, ИД, значение, this); }
		public проц ColumnClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ColumnRightClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_RIGHT_CLICK, ИД, значение, this); }
		public проц ColumnRightClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ColumnBeginDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_BEGIN_DRAG, ИД, значение, this); }
		public проц ColumnBeginDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ColumnDragging_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_DRAGGING, ИД, значение, this); }
		public проц ColumnDragging_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц ColumnEndDrag_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_COL_END_DRAG, ИД, значение, this); }
		public проц ColumnEndDrag_Remove(EventListener значение) { RemoveHandler(значение, this); }
		
		//-----------------------------------------------------------------------------

		public проц CacheHint_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LIST_CACHE_HINT, ИД, значение, this); }
		public проц CacheHint_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxListEvent_ctor(цел commandType, цел ид);
		static extern (C) ЦУк wxListEvent_GetItem(ЦУк сам);
		static extern (C) ЦУк wxListEvent_GetLabel(ЦУк сам);
		static extern (C) цел   wxListEvent_GetIndex(ЦУк сам);
		static extern (C) цел    wxListEvent_GetKeyCode(ЦУк сам);
		static extern (C) цел    wxListEvent_GetColumn(ЦУк сам);
		static extern (C) проц   wxListEvent_GetPoint(ЦУк сам, inout Точка pt);
		static extern (C) ЦУк wxListEvent_GetText(ЦУк сам);
		static extern (C) цел wxListEvent_GetImage(ЦУк сам);
		static extern (C) цел wxListEvent_GetData(ЦУк сам);
		static extern (C) цел wxListEvent_GetMask(ЦУк сам);
		static extern (C) цел wxListEvent_GetCacheFrom(ЦУк сам);
		static extern (C) цел wxListEvent_GetCacheTo(ЦУк сам);
		static extern (C) бул wxListEvent_IsEditCancelled(ЦУк сам);
		static extern (C) проц wxListEvent_SetEditCanceled(ЦУк сам, бул editCancelled);
		static extern (C) проц wxListEvent_Veto(ЦУк сам);
		static extern (C) проц wxListEvent_Allow(ЦУк сам);
		static extern (C) бул wxListEvent_IsAllowed(ЦУк сам);			
		//! \endcond
		
		//---------------------------------------------------------------------
       
	alias ListEvent wxListEvent;
	public class ListEvent : Событие 
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this(цел commandType, цел ид)
			{ super(wxListEvent_ctor(commandType, ид)); }

		static Событие Нов(ЦУк ptr) { return new ListEvent(ptr); }
		//-----------------------------------------------------------------------------

		public ткст Label() { return cast(ткст) new wxString(wxListEvent_GetLabel(шхобъ), да); }

		//-----------------------------------------------------------------------------
       
		public цел КодКлавиши() { return wxListEvent_GetKeyCode(шхобъ); }
		
		//---------------------------------------------------------------------
	
		public цел Index() { return wxListEvent_GetIndex(шхобъ); }
		
		//---------------------------------------------------------------------
       
		public ListItem Элемент() { return new ListItem(wxListEvent_GetItem(шхобъ)); }
		
		//---------------------------------------------------------------------
    
		public цел Column() { return wxListEvent_GetColumn(шхобъ); }
		
		//---------------------------------------------------------------------
    
		public Точка point() { 
				Точка pt;
				wxListEvent_GetPoint(шхобъ, pt);
				return pt;
			}
		
		//---------------------------------------------------------------------
    
		public ткст Текст() { return cast(ткст) new wxString(wxListEvent_GetText(шхобъ), да); }
		
		//---------------------------------------------------------------------
	
		public цел Рисунок() { return wxListEvent_GetImage(шхобъ); }
		
		//---------------------------------------------------------------------
	
		public цел Data() { return wxListEvent_GetData(шхобъ); }
		
		//---------------------------------------------------------------------
	
		public цел Маска() { return wxListEvent_GetMask(шхобъ); }
		
		//---------------------------------------------------------------------
	
		public цел CacheFrom() { return wxListEvent_GetCacheFrom(шхобъ); }
		
		//---------------------------------------------------------------------
	
		public цел CacheTo() { return wxListEvent_GetCacheTo(шхобъ); }
		
		//---------------------------------------------------------------------
	
		public бул EditCancelled() { return wxListEvent_IsEditCancelled(шхобъ); }
		public проц EditCancelled(бул значение) { wxListEvent_SetEditCanceled(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------		
		
		public проц Veto()
		{
			wxListEvent_Veto(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Allow()
		{
			wxListEvent_Allow(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Allowed() { return wxListEvent_IsAllowed(шхобъ); }

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
		static extern (C) ЦУк wxListView_ctor();
		static extern (C) бул wxListView_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) проц   wxListView_RegisterVirtual(ЦУк сам, ListCtrl объ, Virtual_OnGetItemAttr onGetItemAttr,
			Virtual_OnGetItemImage onGetItemImage,
			Virtual_OnGetItemColumnImage onGetItemColumnImage,
			Virtual_OnGetItemText onGetItemText);
		static extern (C) проц wxListView_Select(ЦУк сам, бцел n, бул on);
		static extern (C) проц wxListView_Focus(ЦУк сам, бцел индекс);
		static extern (C) бцел wxListView_GetFocusedItem(ЦУк сам);
		static extern (C) бцел wxListView_GetNextSelected(ЦУк сам, бцел элемент);
		static extern (C) бцел wxListView_GetFirstSelected(ЦУк сам);
		static extern (C) бул wxListView_IsSelected(ЦУк сам, бцел индекс);
		static extern (C) проц wxListView_SetColumnImage(ЦУк сам, цел col, цел рисунок);
		static extern (C) проц wxListView_ClearColumnImage(ЦУк сам, цел col);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ListView wxListView;
	public class ListView : ListCtrl
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this()
			{ super(wxListView_ctor()); }

		public this(Окно родитель)
			{ this(родитель, Окно.UniqueID, wxDefaultPosition, wxDefaultSize, wxLC_REPORT, пусто, пусто); }

		public this(Окно родитель, цел ид)
			{ this(родитель, ид, wxDefaultPosition, wxDefaultSize, wxLC_REPORT, пусто, пусто); }

		public this(Окно родитель, цел ид, Точка поз)
			{ this(родитель, ид, поз, wxDefaultSize, wxLC_REPORT, пусто, пусто); }

		public this(Окно родитель, цел ид, Точка поз, Размер size)
			{ this(родитель, ид, поз, size, wxLC_REPORT, пусто, пусто); }

		public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль)
			{ this(родитель, ид, поз, size, стиль, пусто, пусто); }

		public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, Validator validator)
			{ this(родитель, ид, поз, size, стиль, validator, пусто); }

		public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
		{
			super(wxListView_ctor());
			if (!Create(родитель, ид, поз, size, стиль, validator, имя))
			{
				throw new InvalidOperationException("Failed to create ListView");
			}
			
			wxListView_RegisterVirtual(шхобъ, this, &staticOnGetItemAttr, 
				&staticOnGetItemImage, &staticOnGetItemColumnImage, 
				&staticOnGetItemText);
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз)
			{ this(родитель, Окно.UniqueID, поз, wxDefaultSize, wxLC_REPORT, пусто, пусто); }

		public this(Окно родитель, Точка поз, Размер size)
			{ this(родитель, Окно.UniqueID, поз, size, wxLC_REPORT, пусто, пусто); }

		public this(Окно родитель, Точка поз, Размер size, цел стиль)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, пусто, пусто); }

		public this(Окно родитель, Точка поз, Размер size, цел стиль, Validator validator)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, validator, пусто); }

		public this(Окно родитель, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, validator, имя);}

		//-----------------------------------------------------------------------------

		public override бул Create(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
		{
			return wxListView_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}

		//-----------------------------------------------------------------------------

		public проц Select(цел n)
		{
			Select(n, да);
		}

		public проц Select(цел n, бул on)
		{
			wxListView_Select(шхобъ, cast(бцел)n, on);
		}

		//-----------------------------------------------------------------------------

		public проц Focus(цел индекс)
		{
			wxListView_Focus(шхобъ, cast(бцел)индекс);
		}

		//-----------------------------------------------------------------------------

		public цел FocusedItem() { return cast(цел)wxListView_GetFocusedItem(шхобъ); }

		//-----------------------------------------------------------------------------

		public цел GetNextSelected(цел элемент)
		{
			return cast(цел)wxListView_GetNextSelected(шхобъ, cast(бцел)элемент);
		}

		//-----------------------------------------------------------------------------

		public цел FirstSelected() { return cast(цел)wxListView_GetFirstSelected(шхобъ); }

		//-----------------------------------------------------------------------------

		public бул IsSelected(цел индекс)
		{
			return wxListView_IsSelected(шхобъ, cast(бцел)индекс);
		}

		//-----------------------------------------------------------------------------

		public проц SetColumnImage(цел col, цел рисунок)
		{
			wxListView_SetColumnImage(шхобъ, col, рисунок);
		}

		//-----------------------------------------------------------------------------

		public проц ClearColumnImage(цел col)
		{
			wxListView_ClearColumnImage(шхобъ, col);
		}
	}
