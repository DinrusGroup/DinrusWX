//-----------------------------------------------------------------------------
// wxD - Выбор.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Выбор.cs
//
/// The wxChoice wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Выбор.d,v 1.12 2007/02/10 10:48:18 afb Exp $
//-----------------------------------------------------------------------------

module wx.Choice;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.IControlWithItems;
public import wx.ArrayString;

		//! \cond EXTERN
		static extern (C) ЦУк wxChoice_ctor();
		static extern (C) бул   wxChoice_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, цел n, ткст* choices, цел стиль, ЦУк validator, ткст имя);
		static extern (C) проц   wxChoice_dtor(ЦУк сам);

		static extern (C) проц   wxChoice_SetSelection(ЦУк сам, цел n);
		static extern (C) бул   wxChoice_SetStringSelection(ЦУк сам, ткст s);
		static extern (C) ЦУк wxChoice_GetStringSelection(ЦУк сам);

		static extern (C) проц   wxChoice_SetColumns(ЦУк сам, цел n);
		static extern (C) цел    wxChoice_GetColumns(ЦУк сам);

		static extern (C) проц   wxChoice_Command(ЦУк сам, ЦУк evt);
		static extern (C) цел    wxChoice_GetCount(ЦУк сам);
		static extern (C) ЦУк wxChoice_GetString(ЦУк сам, цел n);
		static extern (C) цел    wxChoice_GetSelection(ЦУк сам);

		static extern (C) ЦУк wxChoice_GetClientData(ЦУк сам, цел n);
		static extern (C) проц   wxChoice_SetClientData(ЦУк сам, цел n, ЦУк данные);

		static extern (C) цел    wxChoice_FindString(ЦУк сам, ткст str);
		
		static extern (C) проц   wxChoice_Delete(ЦУк сам, цел n);
		static extern (C) проц   wxChoice_Clear(ЦУк сам);

		static extern (C) цел   wxChoice_Append(ЦУк сам, ткст элемент);
		static extern (C) цел   wxChoice_AppendData(ЦУк сам, ткст элемент, ЦУк данные);
		
		static extern (C)	проц wxChoice_AppendString(ЦУк сам, ткст элемент);
		
		static extern (C)	проц wxChoice_AppendArrayString(ЦУк сам, цел n, ткст* strings);
		
		static extern (C)	цел wxChoice_Insert(ЦУк сам, ткст элемент, цел поз);
		static extern (C)	цел wxChoice_InsertClientData(ЦУк сам, ткст элемент, цел поз, ЦУк clientData);
		
		static extern (C)	ЦУк wxChoice_GetStrings(ЦУк сам);
		
		static extern (C)	проц wxChoice_SetClientObject(ЦУк сам, цел n, ЦУк clientData);
		static extern (C)	ЦУк wxChoice_GetClientObject(ЦУк сам, цел n);
		static extern (C)	бул wxChoice_HasClientObjectData(ЦУк сам);
		static extern (C)	бул wxChoice_HasClientUntypedData(ЦУк сам);
		
		static extern (C) проц wxChoice_SetString(ЦУк сам, цел n, ткст текст);
		
		static extern (C) проц wxChoice_Select(ЦУк сам, цел n);
		
		static extern (C)	бул wxChoice_ShouldInheritColours(ЦУк сам);
		
		static extern (C)	бул wxChoice_IsEmpty(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias Выбор wxChoice;
	public class Выбор : Control , IControlWithItems
	{
		public const ткст wxChoiceNameStr = "choice";
	
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxChoice_ctor()); }

		public this(Окно родитель, цел ид, Точка поз, Размер size, ткст[] choices = пусто, цел стиль = 0, Validator val = пусто,ткст имя = wxChoiceNameStr)
		{
			super(wxChoice_ctor());
			if(!wxChoice_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз,
								size, choices.length, choices.ptr, стиль, 
								wxObject.SafePtr(validator), имя)) 
			{
				throw new InvalidOperationException("Failed to create ListBox");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ)
		{
			return new Выбор(шхобъ);
		}
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз, Размер size, ткст[] choices = пусто, цел стиль = 0, Validator val = пусто,ткст имя = wxChoiceNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, choices, стиль, validator, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size,
						   ткст[] choices, цел стиль, Validator validator,
						   ткст имя)
		{
			return wxChoice_Create(шхобъ, wxObject.SafePtr(родитель), ид,
								   поз, size, choices.length, choices.ptr, 
								   cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел Append(ткст элемент)
		{
			return wxChoice_Append(шхобъ, элемент);
		}
		
		public цел Append(ткст элемент, ClientData clientData)
		{
			return wxChoice_AppendData(шхобъ, элемент, wxObject.SafePtr(clientData));
		}
		
		//-----------------------------------------------------------------------------
		
		public проц AppendString(ткст элемент)
		{
			wxChoice_AppendString(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Append(ткст[] strings)
		{
			wxChoice_AppendArrayString(шхобъ, strings.length, strings.ptr);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел Insert(ткст элемент, цел поз)
		{
			return wxChoice_Insert(шхобъ, элемент, поз);
		}
		
		public цел Insert(ткст элемент, цел поз, ClientData clientData)
		{
			return wxChoice_InsertClientData(шхобъ, элемент, поз, wxObject.SafePtr(clientData));
		}
		
		//-----------------------------------------------------------------------------
		
		public ткст[] GetStrings()
		{
			return (new МасТкст(wxChoice_GetStrings(шхобъ), да)).вМассив();
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetClientObject(цел n, ClientData clientData)
		{
			wxChoice_SetClientObject(шхобъ, n, wxObject.SafePtr(clientData));
		}
		
		public ClientData GetClientObject(цел n)
		{
			return cast(ClientData)FindObject(wxChoice_GetClientObject(шхобъ, n), &ClientData.Нов);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул HasClientObjectData()
		{
			return wxChoice_HasClientObjectData(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул HasClientUntypedData()
		{
			return wxChoice_HasClientUntypedData(шхобъ);
		}

		//---------------------------------------------------------------------
		
		public цел Selection() { return wxChoice_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxChoice_SetSelection(шхобъ, значение); }
		
		public цел GetSelection()
		{
			return wxChoice_GetSelection(шхобъ);
		}

		//---------------------------------------------------------------------

		public ткст StringSelection() { return cast(ткст) new wxString(wxChoice_GetStringSelection(шхобъ), да); }
		public проц StringSelection(ткст значение) { wxChoice_SetStringSelection(шхобъ, значение); }

		//---------------------------------------------------------------------

		public цел Columns() { return wxChoice_GetColumns(шхобъ); }
		public проц Columns(цел значение) { wxChoice_SetColumns(шхобъ, значение); }
		
		//---------------------------------------------------------------------

		public проц Command(Событие evt)
		{
			wxChoice_Command(шхобъ, wxObject.SafePtr(evt));
		}

		//---------------------------------------------------------------------
		
		public цел Счёт() { return wxChoice_GetCount(шхобъ); }
		
		//---------------------------------------------------------------------

		public ткст GetString(цел n)
		{
			return cast(ткст) new wxString(wxChoice_GetString(шхобъ, n), да);
		}

		//---------------------------------------------------------------------

		// TODO: Find way to pass данные through C# object
		
		public ClientData GetClientData(цел n)
		{
			return cast(ClientData)FindObject(wxChoice_GetClientData(шхобъ, n));
		}

		public проц SetClientData(цел n, ClientData данные)
		{
			wxChoice_SetClientData(шхобъ, n, wxObject.SafePtr(данные));
		}

		//---------------------------------------------------------------------

		public цел FindString(ткст str)
		{
			return wxChoice_FindString(шхобъ, str);
		}

		//---------------------------------------------------------------------

		public проц Delete(цел n)
		{
			wxChoice_Delete(шхобъ, n);
		}
		
		//---------------------------------------------------------------------

		public проц Очисть()
		{
			wxChoice_Clear(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц SetString(цел n, ткст str)
		{
			wxChoice_SetString(шхобъ, n, str);
		}
		
		//---------------------------------------------------------------------
		
		public проц Select(цел n)
		{
			wxChoice_Select(шхобъ, n);
		}
		
		//-----------------------------------------------------------------------------
		
		public override бул ShouldInheritColours()
		{
			return wxChoice_ShouldInheritColours(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Empty() { return wxChoice_IsEmpty(шхобъ); }

		//---------------------------------------------------------------------

		public проц Selected_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_CHOICE_SELECTED, ИД, значение, this); }
		public проц Selected_Remove(EventListener значение) { RemoveHandler(значение, this); }

	}
