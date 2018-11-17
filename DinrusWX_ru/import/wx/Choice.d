module wx.Choice;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.IControlWithItems;
public import wx.ArrayString;

		//! \cond EXTERN
		static extern (C) IntPtr wxChoice_ctor();
		static extern (C) бул   wxChoice_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, цел n, ткст* choices, цел стиль, IntPtr оценщик, ткст имя);
		static extern (C) проц   wxChoice_dtor(IntPtr сам);

		static extern (C) проц   wxChoice_SetSelection(IntPtr сам, цел n);
		static extern (C) бул   wxChoice_SetStringSelection(IntPtr сам, ткст s);
		static extern (C) IntPtr wxChoice_GetStringSelection(IntPtr сам);

		static extern (C) проц   wxChoice_SetColumns(IntPtr сам, цел n);
		static extern (C) цел    wxChoice_GetColumns(IntPtr сам);

		static extern (C) проц   wxChoice_Команда(IntPtr сам, IntPtr evt);
		static extern (C) цел    wxChoice_GetCount(IntPtr сам);
		static extern (C) IntPtr wxChoice_GetString(IntPtr сам, цел n);
		static extern (C) цел    wxChoice_GetSelection(IntPtr сам);

		static extern (C) IntPtr wxChoice_GetClientData(IntPtr сам, цел n);
		static extern (C) проц   wxChoice_SetClientData(IntPtr сам, цел n, IntPtr data);

		static extern (C) цел    wxChoice_FindString(IntPtr сам, ткст стр);
		
		static extern (C) проц   wxChoice_Delete(IntPtr сам, цел n);
		static extern (C) проц   wxChoice_Clear(IntPtr сам);

		static extern (C) цел   wxChoice_Append(IntPtr сам, ткст элт);
		static extern (C) цел   wxChoice_AppendData(IntPtr сам, ткст элт, IntPtr data);
		
		static extern (C)	проц wxChoice_AppendString(IntPtr сам, ткст элт);
		
		static extern (C)	проц wxChoice_AppendArrayString(IntPtr сам, цел n, ткст* strings);
		
		static extern (C)	цел wxChoice_Insert(IntPtr сам, ткст элт, цел поз);
		static extern (C)	цел wxChoice_InsertClientData(IntPtr сам, ткст элт, цел поз, IntPtr clientData);
		
		static extern (C)	IntPtr wxChoice_GetStrings(IntPtr сам);
		
		static extern (C)	проц wxChoice_SetClientObject(IntPtr сам, цел n, IntPtr clientData);
		static extern (C)	IntPtr wxChoice_GetClientObject(IntPtr сам, цел n);
		static extern (C)	бул wxChoice_HasClientObjectData(IntPtr сам);
		static extern (C)	бул wxChoice_HasClientUntypedData(IntPtr сам);
		
		static extern (C) проц wxChoice_SetString(IntPtr сам, цел n, ткст текст);
		
		static extern (C) проц wxChoice_Select(IntPtr сам, цел n);
		
		static extern (C)	бул wxChoice_ShouldInheritColours(IntPtr сам);
		
		static extern (C)	бул wxChoice_IsEmpty(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias Choice wxChoice;
	public class Choice : Control , IControlWithItems
	{
		public const ткст wxChoiceNameStr = "choice";
	
		public this(IntPtr wxobj) ;
		public this();
		public this(Окно родитель, цел ид, Точка поз, Размер разм, ткст[] choices = null, цел стиль = 0, Оценщик val = null,ткст имя = wxChoiceNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, Точка поз, Размер разм, ткст[] choices = null, цел стиль = 0, Оценщик val = null,ткст имя = wxChoiceNameStr);
		public бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм,
						   ткст[] choices, цел стиль, Оценщик оценщик,
						   ткст имя);
		public цел Append(ткст элт);
		public цел Append(ткст элт, ClientData clientData);
		public проц AppendString(ткст элт);
		public проц Append(ткст[] strings);
		public цел Insert(ткст элт, цел поз);
		public цел Insert(ткст элт, цел поз, ClientData clientData);
		public ткст[] GetStrings();
		public проц УстClientObject(цел n, ClientData clientData);
		public ClientData GetClientObject(цел n);
		public бул HasClientObjectData();
		public бул HasClientUntypedData();
		public цел Выбор() { return wxChoice_GetSelection(wxobj); }
		public проц Выбор(цел значение);
		public цел GetSelection();
		public ткст StringSelection();
		public проц StringSelection(ткст значение) ;
		public цел Columns() ;
		public проц Columns(цел значение) ;
		public проц Команда(Событие evt);
		public цел Счёт();
		public ткст GetString(цел n);
		public ClientData GetClientData(цел n);
		public проц УстClientData(цел n, ClientData data);
		public цел FindString(ткст стр);
		public проц Delete(цел n);
		public проц Clear();
		public проц УстString(цел n, ткст стр);
		public проц Select(цел n);
		public override бул НаследоватьЦвета();
		public бул Empty() ;
		public проц Selected_Add(ДатчикСобытий значение) ;
		public проц Selected_Remove(ДатчикСобытий значение) ;

	}
