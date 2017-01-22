//-----------------------------------------------------------------------------
// wxD - ListBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ListBox.cs
//
/// The wxListBox wrapper class
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ListBox.d,v 1.12 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.ListBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;

		//! \cond EXTERN
		static extern (C) ЦУк wxListBox_ctor();
		static extern (C) проц   wxListBox_dtor(ЦУк сам);
		static extern (C) проц   wxListBox_Clear(ЦУк сам);
		static extern (C) бул   wxListBox_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, цел n, ткст* choices, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) проц   wxListBox_InsertText(ЦУк сам, ткст элемент, цел поз);
		static extern (C) проц   wxListBox_InsertTextData(ЦУк сам, ткст элемент, цел поз, ЦУк данные);
		static extern (C) проц   wxListBox_InsertTextClientData(ЦУк сам, ткст элемент, цел поз, ЦУк clientData);
		static extern (C) проц   wxListBox_InsertItems(ЦУк сам, цел nItems, ткст* items, цел поз);
		static extern (C) проц   wxListBox_Set(ЦУк сам, цел n, ткст* items, ЦУк clientData);
		static extern (C) проц   wxListBox_SetSelection(ЦУк сам, цел n, бул select);
		static extern (C) проц   wxListBox_Select(ЦУк сам, цел n);
		static extern (C) проц   wxListBox_Deselect(ЦУк сам, цел n);
		static extern (C) проц   wxListBox_DeselectAll(ЦУк сам, цел itemToLeaveSelected);
		static extern (C) бул   wxListBox_SetStringSelection(ЦУк сам, ткст s, бул select);
		static extern (C) ЦУк wxListBox_GetSelections(ЦУк сам);
		static extern (C) проц   wxListBox_SetFirstItem(ЦУк сам, цел n);
		static extern (C) проц   wxListBox_SetFirstItemText(ЦУк сам, ткст s);
		static extern (C) бул   wxListBox_HasMultipleSelection(ЦУк сам);
		static extern (C) бул   wxListBox_IsSorted(ЦУк сам);
		static extern (C) проц   wxListBox_Command(ЦУк сам, ЦУк evt);
		static extern (C) бул   wxListBox_Selected(ЦУк сам, цел n);
		static extern (C) цел    wxListBox_GetSelection(ЦУк сам);
		static extern (C) ЦУк wxListBox_GetStringSelection(ЦУк сам);
		static extern (C) проц   wxListBox_SetSingleString(ЦУк сам, цел n, ткст s);
		static extern (C) ЦУк wxListBox_GetSingleString(ЦУк сам, цел n);
		static extern (C) проц   wxListBox_Append(ЦУк сам, ткст элемент);
		static extern (C) проц   wxListBox_AppendClientData(ЦУк сам, ткст элемент, ЦУк cliendData);
		static extern (C) проц   wxListBox_Delete(ЦУк сам, цел n);
		static extern (C) цел    wxListBox_GetCount(ЦУк сам);
		//! \endcond
	
		//---------------------------------------------------------------------
	
	alias ListBox wxListBox;
	public class ListBox : Control
	{
		enum {
			wxLB_SORT             = 0x0010,
			wxLB_SINGLE           = 0x0020,
			wxLB_MULTIPLE         = 0x0040,
			wxLB_EXTENDED         = 0x0080,
			wxLB_OWNERDRAW        = 0x0100,
			wxLB_NEED_SB          = 0x0200,
			wxLB_ALWAYS_SB        = 0x0400,
			wxLB_HSCROLL          = wxHSCROLL,
			wxLB_INT_HEIGHT       = 0x0800,
		}
	
		public const ткст wxListBoxNameStr = "listBox";
		//---------------------------------------------------------------------
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
	
		public this()
			{ super(wxListBox_ctor()); }

		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, 
			ткст[] choices = пусто, цел стиль = 0, Validator validator =пусто, ткст имя = wxListBoxNameStr)
		{
			super(wxListBox_ctor());
			if(!wxListBox_Create(шхобъ, wxObject.SafePtr(родитель), ид,
					поз, size, choices.length, choices.ptr, cast(бцел)стиль,
					wxObject.SafePtr(validator), имя))
			{
				throw new InvalidOperationException("Failed to create ListBox");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new ListBox(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, 
			ткст[] choices = пусто, цел стиль = 0, Validator validator = пусто, ткст имя = wxListBoxNameStr)
			{ this( родитель, Окно.UniqueID, поз, size, choices, стиль, validator, имя);}
		
		//---------------------------------------------------------------------
	
		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел n,
				ткст[] choices, цел стиль, Validator validator, ткст имя)
		{
			return wxListBox_Create(шхобъ, wxObject.SafePtr(родитель), ид,
					поз, size, n, choices.ptr, cast(бцел)стиль,
					wxObject.SafePtr(validator), имя);
		}
		
		//---------------------------------------------------------------------
	
		public цел Selection() { return wxListBox_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxListBox_Select(шхобъ, значение); }
		
		//---------------------------------------------------------------------
	
		public ткст StringSelection() { return cast(ткст) new wxString(wxListBox_GetStringSelection(шхобъ), да); }
		public проц StringSelection(ткст значение) { wxListBox_SetStringSelection(шхобъ, значение, да); }
		
		//---------------------------------------------------------------------
	
		public проц SetSelection(цел n, бул select)
		{
			wxListBox_SetSelection(шхобъ, n, select);
		}
	
		public проц SetSelection(ткст элемент, бул select)
		{
			wxListBox_SetStringSelection(шхобъ, элемент, select);
		}
	
		//---------------------------------------------------------------------
	
		public проц Очисть()
		{
			wxListBox_Clear(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public ткст GetString(цел n) 
		{
			return cast(ткст) new wxString(wxListBox_GetSingleString(шхобъ, n), да);
		}
	
		public проц SetString(цел n, ткст str)
		{
			wxListBox_SetSingleString(шхобъ, n, str);
		}
	
		//---------------------------------------------------------------------
	
		public проц Append(ткст элемент)
		{
			wxListBox_Append(шхобъ, элемент);
		}
	
		public проц Append(ткст элемент, ClientData данные)
		{
			wxListBox_AppendClientData(шхобъ, элемент, wxObject.SafePtr(данные));
		}
		
		//---------------------------------------------------------------------
	
		public проц Delete(цел n)
		{
			wxListBox_Delete(шхобъ, n);
		}
	
		//---------------------------------------------------------------------
	
		public проц Insert(ткст элемент, цел поз)
		{
			wxListBox_InsertText(шхобъ, элемент, поз);
		}
	
		public проц Insert(ткст элемент, цел поз, ClientData данные)
		{
			wxListBox_InsertTextData(шхобъ, элемент, поз, wxObject.SafePtr(данные));
		}
	
		/*public проц Insert(ткст элемент, цел поз, ClientData данные)
		{
		wxListBox_InsertTextClientData(шхобъ, элемент, поз, wxObject.SafePtr(данные));
		}*/
		
		//---------------------------------------------------------------------
	
		public проц InsertItems(ткст[] items, цел поз)
		{
			wxListBox_InsertItems(шхобъ, items.length, items.ptr, поз);
		}
	
		//---------------------------------------------------------------------
	
		public проц Установи(ткст[] items, ClientData данные)
		{
			wxListBox_Set(шхобъ, items.length, items.ptr, wxObject.SafePtr(данные));
		}
	
		public проц Установи(ткст[] items)
		{
			wxListBox_Set(шхобъ, items.length, items.ptr, wxObject.SafePtr(пусто));
		}
	
		//---------------------------------------------------------------------
	
		public бул Selected(цел n)
		{
			return wxListBox_Selected(шхобъ, n);
		}
		
		//---------------------------------------------------------------------
	
		public бул Sorted() { return wxListBox_IsSorted(шхобъ); }
	
		//---------------------------------------------------------------------
	
		public бул HasMultipleSelection()
		{
			return wxListBox_HasMultipleSelection(шхобъ);
		}
	
		//---------------------------------------------------------------------
	
		public проц Deselect(цел n)
		{
			wxListBox_Deselect(шхобъ, n);
		}
	
		public проц DeselectAll(цел itemToLeaveSelected)
		{
			wxListBox_DeselectAll(шхобъ, itemToLeaveSelected);
		}
	
		//---------------------------------------------------------------------
	
		public цел[] Selections()
		{
			return (new МассивЦел(wxListBox_GetSelections(шхобъ),да)).вМассив();
		}
	
		//---------------------------------------------------------------------
	
		public проц SetFirstItem(цел n)
		{
			wxListBox_SetFirstItem(шхобъ, n);
		}
	
		public проц SetFirstItem(ткст s)
		{
			wxListBox_SetFirstItemText(шхобъ, s);
		}
	
		//---------------------------------------------------------------------
	
		public проц Command(Событие evt)
		{
			wxListBox_Command(шхобъ, wxObject.SafePtr(evt));
		}
	
		//---------------------------------------------------------------------
	
		public цел Счёт() { return wxListBox_GetCount(шхобъ); }
	
		//---------------------------------------------------------------------
	
		public проц Select_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LISTBOX_SELECTED, ИД, значение, this); }
		public проц Select_Remove(EventListener значение) { RemoveHandler(значение, this); }
	
		public проц DoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_LISTBOX_DOUBLECLICKED, ИД, значение, this); }
		public проц DoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxCheckListBox_ctor1();
		static extern (C) ЦУк wxCheckListBox_ctor2(ЦУк родитель, 
			цел ид,
			inout Точка поз,
			inout Размер size,
			цел nStrings,
			ткст* choices,
			бцел стиль,
			ЦУк validator,
			ткст имя);
		static extern (C) бул wxCheckListBox_IsChecked(ЦУк сам, цел индекс);
		static extern (C) проц wxCheckListBox_Check(ЦУк сам, цел индекс, бул check);
		//static extern (C) цел wxCheckListBox_GetItemHeight(ЦУк сам);
		//! \endcond
				
	alias CheckListBox wxCheckListBox;
	public class CheckListBox : ListBox
	{
		const ткст wxListBoxNameStr = "listBox";

		//---------------------------------------------------------------------
	
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ super(wxCheckListBox_ctor1());}
			
		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст[] choices = пусто, цел стиль = 0, Validator validator = пусто, ткст имя = wxListBoxNameStr)
			{ super(wxCheckListBox_ctor2(wxObject.SafePtr(родитель), ид, поз, size, choices.length, choices.ptr, cast(бцел)стиль, wxObject.SafePtr(validator), имя));}
			
		//---------------------------------------------------------------------
		// ctors with сам created ид
			
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст[] choices = пусто, цел стиль = 0, Validator validator = пусто, ткст имя = wxListBoxNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, choices, стиль, validator, имя);}

		//--------------------------------------------------------------------
		
		public бул IsChecked(цел индекс)
		{
			return wxCheckListBox_IsChecked(шхобъ, индекс);
		}
		
		//---------------------------------------------------------------------
		
		public проц Check(цел индекс)
		{
			Check(индекс, да);
		}
		
		public проц Check(цел индекс, бул check)
		{
			wxCheckListBox_Check(шхобъ, индекс, check);
		}
		
		//---------------------------------------------------------------------
		
		version(__WXMAC__) {} else
	//	public цел ItemHeight() { return wxCheckListBox_GetItemHeight(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public проц Checked_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_CHECKLISTBOX_TOGGLED, ИД, значение, this); }
		public проц Checked_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}
