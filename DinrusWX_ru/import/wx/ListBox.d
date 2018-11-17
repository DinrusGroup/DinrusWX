module wx.ListBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;

		//! \cond EXTERN
		static extern (C) IntPtr wxListBox_ctor();
		static extern (C) проц   wxListBox_dtor(IntPtr сам);
		static extern (C) проц   wxListBox_Clear(IntPtr сам);
		static extern (C) бул   wxListBox_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, цел n, ткст* choices, бцел стиль, IntPtr оценщик, ткст имя);
		static extern (C) проц   wxListBox_InsertText(IntPtr сам, ткст элт, цел поз);
		static extern (C) проц   wxListBox_InsertTextData(IntPtr сам, ткст элт, цел поз, IntPtr data);
		static extern (C) проц   wxListBox_InsertTextClientData(IntPtr сам, ткст элт, цел поз, IntPtr clientData);
		static extern (C) проц   wxListBox_InsertItems(IntPtr сам, цел nItems, ткст* элтs, цел поз);
		static extern (C) проц   wxListBox_Set(IntPtr сам, цел n, ткст* элтs, IntPtr clientData);
		static extern (C) проц   wxListBox_SetSelection(IntPtr сам, цел n, бул select);
		static extern (C) проц   wxListBox_Select(IntPtr сам, цел n);
		static extern (C) проц   wxListBox_Deselect(IntPtr сам, цел n);
		static extern (C) проц   wxListBox_DeselectAll(IntPtr сам, цел элтToLeaveSelected);
		static extern (C) бул   wxListBox_SetStringSelection(IntPtr сам, ткст s, бул select);
		static extern (C) IntPtr wxListBox_GetSelections(IntPtr сам);
		static extern (C) проц   wxListBox_SetFirstItem(IntPtr сам, цел n);
		static extern (C) проц   wxListBox_SetFirstItemText(IntPtr сам, ткст s);
		static extern (C) бул   wxListBox_HasMultipleSelection(IntPtr сам);
		static extern (C) бул   wxListBox_IsSorted(IntPtr сам);
		static extern (C) проц   wxListBox_Команда(IntPtr сам, IntPtr evt);
		static extern (C) бул   wxListBox_Selected(IntPtr сам, цел n);
		static extern (C) цел    wxListBox_GetSelection(IntPtr сам);
		static extern (C) IntPtr wxListBox_GetStringSelection(IntPtr сам);
		static extern (C) проц   wxListBox_SetSingleString(IntPtr сам, цел n, ткст s);
		static extern (C) IntPtr wxListBox_GetSingleString(IntPtr сам, цел n);
		static extern (C) проц   wxListBox_Append(IntPtr сам, ткст элт);
		static extern (C) проц   wxListBox_AppendClientData(IntPtr сам, ткст элт, IntPtr cliendData);
		static extern (C) проц   wxListBox_Delete(IntPtr сам, цел n);
		static extern (C) цел    wxListBox_GetCount(IntPtr сам);
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
		
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, 
			ткст[] choices = null, цел стиль = 0, Оценщик оценщик =null, ткст имя = wxListBoxNameStr);
		public static wxObject Нов(IntPtr wxobj) ;
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, 
			ткст[] choices = null, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxListBoxNameStr);
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел n,
				ткст[] choices, цел стиль, Оценщик оценщик, ткст имя);
		public цел Выбор() ;
		public проц Выбор(цел значение) ;
		public ткст StringSelection() ;
		public проц StringSelection(ткст значение) ;
		public проц УстSelection(цел n, бул select);
		public проц УстSelection(ткст элт, бул select);
		public проц Clear();
		public ткст GetString(цел n);
		public проц УстString(цел n, ткст стр);
		public проц Append(ткст элт);
		public проц Append(ткст элт, ClientData data);
		public проц Delete(цел n);
		public проц Insert(ткст элт, цел поз);
		public проц Insert(ткст элт, цел поз, ClientData data);	
		//public проц Insert(ткст элт, цел поз, ClientData data);
		public проц InsertItems(ткст[] элтs, цел поз);
		public проц Уст(ткст[] элтs, ClientData data);
		public проц Уст(ткст[] элтs);
		public бул Selected(цел n);
		public бул Sorted();
		public бул HasMultipleSelection();
		public проц Deselect(цел n);
		public проц DeselectAll(цел элтToLeaveSelected);
		public цел[] Selections();
		public проц УстFirstItem(цел n);
		public проц УстFirstItem(ткст s);
		public проц Команда(Событие evt);
		public цел Счёт() ;
		public проц Select_Add(ДатчикСобытий значение);
		public проц Select_Remove(ДатчикСобытий значение) ;	
		public проц DoubleClick_Add(ДатчикСобытий значение) ;
		public проц DoubleClick_Remove(ДатчикСобытий значение);
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxCheckListBox_ctor1();
		static extern (C) IntPtr wxCheckListBox_ctor2(IntPtr родитель, 
			цел ид,
			inout Точка поз,
			inout Размер разм,
			цел nStrings,
			ткст* choices,
			бцел стиль,
			IntPtr оценщик,
			ткст имя);
		static extern (C) бул wxCheckListBox_IsChecked(IntPtr сам, цел index);
		static extern (C) проц wxCheckListBox_Check(IntPtr сам, цел index, бул check);
		static extern (C) цел wxCheckListBox_GetItemHeight(IntPtr сам);
		//! \endcond
				
	alias CheckListBox wxCheckListBox;
	public class CheckListBox : ListBox
	{
		const ткст wxListBoxNameStr = "listBox";

		//---------------------------------------------------------------------
	
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxListBoxNameStr);
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик оценщик = null, ткст имя = wxListBoxNameStr);
		public бул Отмечен(цел index);
		public проц Check(цел index);
		public проц Check(цел index, бул check);
		version(__WXMAC__) {} else
		public цел ItemHeight();
		public проц Checked_Add(ДатчикСобытий значение);
		public проц Checked_Remove(ДатчикСобытий значение);
	}
