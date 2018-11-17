module wx.CommandEvent;
public import wx.common;
public import wx.Event;

public import wx.ClientData;

		//! \cond EXTERN
		static extern (C) IntPtr wxCommandEvent_ctor(цел тип,цел идок);
		static extern (C) цел    wxCommandEvent_GetSelection(IntPtr сам);
		static extern (C) IntPtr wxCommandEvent_GetString(IntPtr сам);
		static extern (C) проц wxCommandEvent_SetString(IntPtr сам, ткст s);
		static extern (C) бул   wxCommandEvent_IsChecked(IntPtr сам);
		static extern (C) бул   wxCommandEvent_IsSelection(IntPtr сам);
		static extern (C) цел    wxCommandEvent_GetInt(IntPtr сам);
		static extern (C) проц wxCommandEvent_SetInt(IntPtr сам, цел i);

		static extern (C) IntPtr wxCommandEvent_GetClientObject(IntPtr сам);
		static extern (C) проц   wxCommandEvent_SetClientObject(IntPtr сам, IntPtr data);

		static extern (C) проц wxCommandEvent_SetExtraLong(IntPtr сам, бцел extralong);
		static extern (C) бцел wxCommandEvent_GetExtraLong(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias СобытиеКоманда wxCommandEvent;
	public class СобытиеКоманда : Событие
	{

		public this(IntPtr wxobj);
		public this(EventType типКоманды = wxEVT_NULL, цел идок = 0);
		public цел Выбор();
		public ткст Ткст();
		public проц Ткст(ткст значение) ;
		public бул Отмечен();
		public бул Выборка() ;
		public цел Цел() ;
		public проц Цел(цел значение) ;
		public ClientData ОбъектКлиент();
		public проц ОбъектКлиент(ClientData значение) ;
		public цел ЭкстраДол();
		public проц ЭкстраДол(цел значение) ;
		private static Событие Нов(IntPtr объ);
		    static this()
    {
        ДобавьТипСоб(wxEVT_COMMAND_BUTTON_CLICKED,          &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_MENU_SELECTED,           &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_CHECKBOX_CLICKED,        &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_LISTBOX_SELECTED,        &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_LISTBOX_DOUBLECLICKED,   &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_CHOICE_SELECTED,         &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_COMBOBOX_SELECTED,       &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_TEXT_UPDATED,            &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_TEXT_ENTER,              &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_RADIOBOX_SELECTED,       &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_RADIOBUTTON_SELECTED,    &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_SLIDER_UPDATED,          &СобытиеКоманда.Нов);
        ДобавьТипСоб(wxEVT_COMMAND_SPINCTRL_UPDATED,        &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_TOGGLEBUTTON_CLICKED,    &СобытиеКоманда.Нов);

        ДобавьТипСоб(wxEVT_COMMAND_CHECKLISTBOX_TOGGLED,    &СобытиеКоманда.Нов);
    }
	}
