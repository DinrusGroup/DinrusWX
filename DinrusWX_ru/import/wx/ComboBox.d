module wx.ComboBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;

		
		//! \cond EXTERN
		static extern (C) IntPtr wxComboBox_ctor();
		static extern (C) бул   wxComboBox_Create(IntPtr сам, IntPtr окно, цел ид, ткст значение, inout Точка поз, inout Размер разм, цел n, ткст* choices, бцел стиль, IntPtr оценщик, ткст имя);
		
		static extern (C) проц   wxComboBox_Append(IntPtr сам, ткст элт);
		static extern (C) проц   wxComboBox_AppendData(IntPtr сам, ткст элт, IntPtr data);
		
		static extern (C) проц   wxComboBox_Clear(IntPtr сам);
		static extern (C) проц   wxComboBox_Delete(IntPtr сам, цел n);
		
		static extern (C) цел    wxComboBox_FindString(IntPtr сам, ткст стр);
		
		static extern (C) цел    wxComboBox_GetCount(IntPtr сам);
		static extern (C) цел    wxComboBox_GetSelection(IntPtr сам);
		static extern (C) IntPtr wxComboBox_GetString(IntPtr сам, цел n);
		//static extern (C) проц   wxComboBox_SetString(IntPtr сам, цел n, ткст текст);
		
		static extern (C) IntPtr wxComboBox_GetValue(IntPtr сам);
		static extern (C) проц   wxComboBox_SetValue(IntPtr сам, ткст текст);
		
		static extern (C) IntPtr wxComboBox_GetStringSelection(IntPtr сам);
		static extern (C) проц   wxComboBox_SetStringSelection(IntPtr сам, ткст значение);
		
		static extern (C) IntPtr wxComboBox_GetClientData(IntPtr сам, цел n);
		static extern (C) проц   wxComboBox_SetClientData(IntPtr сам, цел n, IntPtr data);
		
		static extern (C) проц   wxComboBox_Copy(IntPtr сам);
		static extern (C) проц   wxComboBox_Cut(IntPtr сам);
		static extern (C) проц   wxComboBox_Paste(IntPtr сам);
		
		static extern (C) проц   wxComboBox_SetInsertionPoint(IntPtr сам, бцел поз);
		static extern (C) бцел   wxComboBox_GetInsertionPoint(IntPtr сам);
		static extern (C) проц   wxComboBox_SetInsertionPointEnd(IntPtr сам);
		static extern (C) бцел   wxComboBox_GetLastPosition(IntPtr сам);
		
		static extern (C) проц   wxComboBox_Replace(IntPtr сам, бцел from, бцел to, ткст значение);
		static extern (C) проц   wxComboBox_SetSelectionSingle(IntPtr сам, цел n);
		static extern (C) проц   wxComboBox_SetSelectionMult(IntPtr сам, бцел from, бцел to);
		static extern (C) проц   wxComboBox_SetEditable(IntPtr сам, бул editable);
		static extern (C) проц   wxComboBox_Remove(IntPtr сам, бцел from, бцел to);
		
		static extern (C) проц wxComboBox_SetSelection(IntPtr сам, цел n);
		
		static extern (C) проц wxComboBox_Select(IntPtr сам, цел n);
		//! \endcond
		
		//---------------------------------------------------------------------
	
	alias ComboBox wxComboBox;
	public class ComboBox : Control
	{
		public const цел wxCB_SIMPLE           = 0x0004;
		public const цел wxCB_SORT             = 0x0008;
		public const цел wxCB_READONLY         = 0x0010;
		public const цел wxCB_DROPDOWN         = 0x0020;
		
		public const ткст wxComboBoxNameStr = "comboBox";
		//---------------------------------------------------------------------

		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, ткст значение="", Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик val = null, ткст имя = wxComboBoxNameStr);		
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель);
		public this(Окно родитель, ткст значение="", Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст[] choices = null, цел стиль = 0, Оценщик val = null, ткст имя = wxComboBoxNameStr);
		public бул Создай(Окно родитель, цел ид, ткст значение, 
				Точка поз, Размер разм,
				ткст[] choices, цел стиль, Оценщик оценщик,
				ткст имя);
		public цел Выбор();
		public проц Выбор(цел значение) ;
		public ткст StringSelection() ;
		public проц StringSelection(ткст значение);
		public цел Счёт();
		public ткст GetString(цел n);
		public ClientData GetClientData(цел n);
		public проц УстClientData(цел n, ClientData data);
		public цел FindString(ткст стр);
		public проц Delete(цел n);
		public проц Clear();
		public проц Append(ткст элт);
		public проц Append(ткст элт, ClientData data);
		public проц Copy();
		public проц Cut();
		public проц Paste();
		public цел InsertionPoint();
		public проц InsertionPoint(цел значение);
		public проц УстInsertionPointEnd();
		public цел GetLastPosition();
		public проц Replace(цел from, цел to, ткст значение);
		public проц УстSelection(цел from, цел to);
		public проц УстSelection(цел n);
		public проц Editable(бул значение) ;
		public проц Remove(цел from, цел to);
		public ткст Value() ;
		public проц Value(ткст значение) ;
		public проц Select(цел n);
		public проц Selected_Add(ДатчикСобытий значение) ;
		public проц Selected_Remove(ДатчикСобытий значение) ;
	}

