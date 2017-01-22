//-----------------------------------------------------------------------------
// wxD - ComboBox.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ComboBox.cs
//
/// The wxComboBox wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ComboBox.d,v 1.12 2007/03/13 17:02:40 afb Exp $
//-----------------------------------------------------------------------------

module wx.ComboBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;

		
		//! \cond EXTERN
		static extern (C) ЦУк wxComboBox_ctor();
		static extern (C) бул   wxComboBox_Create(ЦУк сам, ЦУк окно, цел ид, ткст значение, inout Точка поз, inout Размер size, цел n, ткст* choices, бцел стиль, ЦУк validator, ткст имя);
		
		static extern (C) проц   wxComboBox_Append(ЦУк сам, ткст элемент);
		static extern (C) проц   wxComboBox_AppendData(ЦУк сам, ткст элемент, ЦУк данные);
		
		static extern (C) проц   wxComboBox_Clear(ЦУк сам);
		static extern (C) проц   wxComboBox_Delete(ЦУк сам, цел n);
		
		static extern (C) цел    wxComboBox_FindString(ЦУк сам, ткст str);
		
		static extern (C) цел    wxComboBox_GetCount(ЦУк сам);
		static extern (C) цел    wxComboBox_GetSelection(ЦУк сам);
		static extern (C) ЦУк wxComboBox_GetString(ЦУк сам, цел n);
		//static extern (C) проц   wxComboBox_SetString(ЦУк сам, цел n, ткст текст);
		
		static extern (C) ЦУк wxComboBox_GetValue(ЦУк сам);
		static extern (C) проц   wxComboBox_SetValue(ЦУк сам, ткст текст);
		
		static extern (C) ЦУк wxComboBox_GetStringSelection(ЦУк сам);
		static extern (C) проц   wxComboBox_SetStringSelection(ЦУк сам, ткст значение);
		
		static extern (C) ЦУк wxComboBox_GetClientData(ЦУк сам, цел n);
		static extern (C) проц   wxComboBox_SetClientData(ЦУк сам, цел n, ЦУк данные);
		
		static extern (C) проц   wxComboBox_Copy(ЦУк сам);
		static extern (C) проц   wxComboBox_Cut(ЦУк сам);
		static extern (C) проц   wxComboBox_Paste(ЦУк сам);
		
		static extern (C) проц   wxComboBox_SetInsertionPoint(ЦУк сам, бцел поз);
		static extern (C) бцел   wxComboBox_GetInsertionPoint(ЦУк сам);
		static extern (C) проц   wxComboBox_SetInsertionPointEnd(ЦУк сам);
		static extern (C) бцел   wxComboBox_GetLastPosition(ЦУк сам);
		
		static extern (C) проц   wxComboBox_Replace(ЦУк сам, бцел from, бцел to, ткст значение);
		static extern (C) проц   wxComboBox_SetSelectionSingle(ЦУк сам, цел n);
		static extern (C) проц   wxComboBox_SetSelectionMult(ЦУк сам, бцел from, бцел to);
		static extern (C) проц   wxComboBox_SetEditable(ЦУк сам, бул editable);
		static extern (C) проц   wxComboBox_Remove(ЦУк сам, бцел from, бцел to);
		
		static extern (C) проц wxComboBox_SetSelection(ЦУк сам, цел n);
		
		static extern (C) проц wxComboBox_Select(ЦУк сам, цел n);
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

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxComboBox_ctor()); }

		public this(Окно родитель, цел ид, ткст значение="", Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст[] choices = пусто, цел стиль = 0, Validator val = пусто, ткст имя = wxComboBoxNameStr)
		{
			super(wxComboBox_ctor());
			if(!wxComboBox_Create(шхобъ, wxObject.SafePtr(родитель), ид, 
						значение, поз, size, 
						choices.length, choices.ptr, cast(бцел)стиль, 
						wxObject.SafePtr(validator), имя)) 
			{
				throw new InvalidOperationException("Failed to create ListBox");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new ComboBox(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель)
			{ this(родитель, Окно.UniqueID, "", wxDefaultPosition, wxDefaultSize, cast(ткст[])пусто, 0, пусто, пусто); }

		public this(Окно родитель, ткст значение="", Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст[] choices = пусто, цел стиль = 0, Validator val = пусто, ткст имя = wxComboBoxNameStr)
			{ this(родитель, Окно.UniqueID, значение, поз, size, choices, стиль, validator, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст значение, 
				Точка поз, Размер size,
				ткст[] choices, цел стиль, Validator validator,
				ткст имя)
		{
			return wxComboBox_Create(шхобъ, wxObject.SafePtr(родитель), ид,
					значение, поз, size, 
					choices.length, choices.ptr, 
					cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}

		//---------------------------------------------------------------------
        
		public цел Selection() { return wxComboBox_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxComboBox_SetSelectionSingle(шхобъ, значение); }

		//---------------------------------------------------------------------

		public ткст StringSelection() { return cast(ткст) new wxString(wxComboBox_GetStringSelection(шхобъ), да); }
		public проц StringSelection(ткст значение) { wxComboBox_SetStringSelection(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public цел Счёт() { return wxComboBox_GetCount(шхобъ); }
		
		//---------------------------------------------------------------------

		public ткст GetString(цел n)
		{
			return cast(ткст) new wxString(wxComboBox_GetString(шхобъ, n), да);
		}

		//---------------------------------------------------------------------

		public ClientData GetClientData(цел n)
		{
			return cast(ClientData)FindObject(wxComboBox_GetClientData(шхобъ, n));
		}

		public проц SetClientData(цел n, ClientData данные)
		{
			wxComboBox_SetClientData(шхобъ, n, wxObject.SafePtr(данные));
		}

		//---------------------------------------------------------------------

		public цел FindString(ткст str)
		{
			return wxComboBox_FindString(шхобъ, str);
		}

		//---------------------------------------------------------------------

		public проц Delete(цел n)
		{
			wxComboBox_Delete(шхобъ, n);
		}

		public проц Очисть()
		{
			wxComboBox_Clear(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц Append(ткст элемент)
		{
			wxComboBox_Append(шхобъ, элемент);
		}

		public проц Append(ткст элемент, ClientData данные)
		{
			wxComboBox_AppendData(шхобъ, элемент, wxObject.SafePtr(данные));
		}

		//---------------------------------------------------------------------

		public проц Копируй()
		{
			wxComboBox_Copy(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public проц Cut()
		{
			wxComboBox_Cut(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public проц Вставь()
		{
			wxComboBox_Paste(шхобъ);
		}

		//---------------------------------------------------------------------
        
		public цел InsertionPoint() { return wxComboBox_GetInsertionPoint(шхобъ); }
		public проц InsertionPoint(цел значение) { wxComboBox_SetInsertionPoint(шхобъ, cast(бцел)значение); }
		
		//---------------------------------------------------------------------

		public проц SetInsertionPointEnd()
		{
			wxComboBox_SetInsertionPointEnd(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public цел GetLastPosition()
		{
			return wxComboBox_GetLastPosition(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц Замени(цел from, цел to, ткст значение)
		{
			wxComboBox_Replace(шхобъ, cast(бцел)from, cast(бцел)to, значение);
		}

		//---------------------------------------------------------------------

		public проц SetSelection(цел from, цел to)
		{
			wxComboBox_SetSelectionMult(шхобъ, cast(бцел)from, cast(бцел)to);
		}
		
		public проц SetSelection(цел n)
		{
			wxComboBox_SetSelection(шхобъ, n);
		}

		//---------------------------------------------------------------------

		public проц Editable(бул значение) { wxComboBox_SetEditable(шхобъ, значение); }

		//---------------------------------------------------------------------
        
		public проц Remove(цел from, цел to)
		{
			wxComboBox_Remove(шхобъ, cast(бцел)from, cast(бцел)to);
		}

		//---------------------------------------------------------------------
        
		public ткст Value() { return cast(ткст) new wxString(wxComboBox_GetValue(шхобъ), да); }
		public проц Value(ткст значение) { wxComboBox_SetValue(шхобъ, значение); }
		
		public проц Select(цел n)
		{
			wxComboBox_Select(шхобъ, n);
		}

		//---------------------------------------------------------------------

		public проц Selected_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_COMBOBOX_SELECTED, ИД, значение, this); }
		public проц Selected_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}

