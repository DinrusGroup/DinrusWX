//-----------------------------------------------------------------------------
// wxD - CommandEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - CommandEvent.cs
//
/// The wxCommandEvent wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: CommandEvent.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.CommandEvent;
public import wx.common;
public import wx.Event;

public import wx.ClientData;

		//! \cond EXTERN
		static extern (C) ЦУк wxCommandEvent_ctor(цел тип,цел winid);
		static extern (C) цел    wxCommandEvent_GetSelection(ЦУк сам);
		static extern (C) ЦУк wxCommandEvent_GetString(ЦУк сам);
		static extern (C) проц wxCommandEvent_SetString(ЦУк сам, ткст s);
		static extern (C) бул   wxCommandEvent_IsChecked(ЦУк сам);
		static extern (C) бул   wxCommandEvent_IsSelection(ЦУк сам);
		static extern (C) цел    wxCommandEvent_GetInt(ЦУк сам);
		static extern (C) проц wxCommandEvent_SetInt(ЦУк сам, цел i);

		static extern (C) ЦУк wxCommandEvent_GetClientObject(ЦУк сам);
		static extern (C) проц   wxCommandEvent_SetClientObject(ЦУк сам, ЦУк данные);
		
		static extern (C) проц wxCommandEvent_SetExtraLong(ЦУк сам, бцел extralong);
		static extern (C) бцел wxCommandEvent_GetExtraLong(ЦУк сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias CommandEvent wxCommandEvent;
	public class CommandEvent : Событие
	{

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия commandType = wxEVT_NULL, цел winid = 0)
			{ super(wxCommandEvent_ctor(commandType,winid)); }

		//-----------------------------------------------------------------------------

		public цел Selection() { return wxCommandEvent_GetSelection(шхобъ); }

		//-----------------------------------------------------------------------------

		public ткст String() { return cast(ткст) new wxString(wxCommandEvent_GetString(шхобъ), да); }
		public проц String(ткст значение) { wxCommandEvent_SetString(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public бул IsChecked() { return wxCommandEvent_IsChecked(шхобъ); }

		//-----------------------------------------------------------------------------

		public бул IsSelection() { return wxCommandEvent_IsSelection(шхобъ); }

		//-----------------------------------------------------------------------------

		public цел Int() { return wxCommandEvent_GetInt(шхобъ); }
		public проц Int(цел значение) { wxCommandEvent_SetInt(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public ClientData ClientObject() { return cast(ClientData)FindObject(wxCommandEvent_GetClientObject(шхобъ)); }
		public проц ClientObject(ClientData значение) { wxCommandEvent_SetClientObject(шхобъ, wxObject.SafePtr(значение)); }
		
		//-----------------------------------------------------------------------------
		
		public цел ExtraLong() { return cast(цел)wxCommandEvent_GetExtraLong(шхобъ); }
		public проц ExtraLong(цел значение) { wxCommandEvent_SetExtraLong(шхобъ, cast(бцел)значение); }

		private static Событие Нов(ЦУк объ) { return new CommandEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_COMMAND_BUTTON_CLICKED,          &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_MENU_SELECTED,           &CommandEvent.Нов);
		
			ДобавьТипСоб(wxEVT_COMMAND_CHECKBOX_CLICKED,        &CommandEvent.Нов);
		
			ДобавьТипСоб(wxEVT_COMMAND_LISTBOX_SELECTED,        &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_LISTBOX_DOUBLECLICKED,   &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_CHOICE_SELECTED,         &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_COMBOBOX_SELECTED,       &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TEXT_UPDATED,            &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_TEXT_ENTER,              &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_RADIOBOX_SELECTED,       &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_RADIOBUTTON_SELECTED,    &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_SLIDER_UPDATED,          &CommandEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_SPINCTRL_UPDATED,        &CommandEvent.Нов);

			ДобавьТипСоб(wxEVT_COMMAND_TOGGLEBUTTON_CLICKED,    &CommandEvent.Нов);
			
			ДобавьТипСоб(wxEVT_COMMAND_CHECKLISTBOX_TOGGLED,    &CommandEvent.Нов);
		}
	}
