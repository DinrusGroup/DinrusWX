//-----------------------------------------------------------------------------
// wxD - UpdateUIEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - UpdateUIEvent.cs
//
/// The wxUpdateUIEvent wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: UpdateUIEvent.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.UpdateUIEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxUpdateUIEvent_ctor(цел commandId);
		static extern (C) проц   wxUpdUIEvt_Enable(ЦУк сам, бул enable);
		static extern (C) проц   wxUpdUIEvt_Check(ЦУк сам, бул check);
		static extern (C) бул   wxUpdateUIEvent_CanUpdate(ЦУк окно);
		static extern (C) бул   wxUpdateUIEvent_GetChecked(ЦУк сам);
		static extern (C) бул   wxUpdateUIEvent_GetEnabled(ЦУк сам);
		static extern (C) бул   wxUpdateUIEvent_GetSetChecked(ЦУк сам);
		static extern (C) бул   wxUpdateUIEvent_GetSetEnabled(ЦУк сам);
		static extern (C) бул   wxUpdateUIEvent_GetSetText(ЦУк сам);
		static extern (C) ЦУк wxUpdateUIEvent_GetText(ЦУк сам);
		static extern (C) цел    wxUpdateUIEvent_GetMode();
		static extern (C) бцел   wxUpdateUIEvent_GetUpdateInterval();
		static extern (C) проц   wxUpdateUIEvent_ResetUpdateTime();
		static extern (C) проц   wxUpdateUIEvent_SetMode(цел mode);
		static extern (C) проц   wxUpdateUIEvent_SetText(ЦУк сам, ткст текст);
		static extern (C) проц   wxUpdateUIEvent_SetUpdateInterval(бцел updateInterval);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias UpdateUIEvent wxUpdateUIEvent;
	public class UpdateUIEvent : CommandEvent
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		public this(цел commandId = 0) 
			{ this(wxUpdateUIEvent_ctor(commandId)); }

		//-----------------------------------------------------------------------------

		public проц Enabled(бул значение) { wxUpdUIEvt_Enable(шхобъ, значение); }

		//-----------------------------------------------------------------------------
		
		public проц Check(бул значение) { wxUpdUIEvt_Check(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public static бул CanUpdate(Окно окно)
		{
			return wxUpdateUIEvent_CanUpdate(wxObject.SafePtr(окно));
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Checked() { return wxUpdateUIEvent_GetChecked(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public бул GetEnabled()
		{
			return wxUpdateUIEvent_GetEnabled(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул SetChecked() { return wxUpdateUIEvent_GetSetChecked(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public бул SetEnabled() { return wxUpdateUIEvent_GetSetEnabled(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public бул SetText() { return wxUpdateUIEvent_GetSetText(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public ткст Текст() { return cast(ткст) new wxString(wxUpdateUIEvent_GetText(шхобъ), да); }
		public проц Текст(ткст значение) { wxUpdateUIEvent_SetText(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		static UpdateUIMode Mode() { return cast(UpdateUIMode)wxUpdateUIEvent_GetMode(); }
		static проц Mode(UpdateUIMode значение) { wxUpdateUIEvent_SetMode(cast(цел)значение); }
		
		//-----------------------------------------------------------------------------
		
		static цел UpdateInterval() { return cast(цел)wxUpdateUIEvent_GetUpdateInterval(); }
		static проц UpdateInterval(цел значение) { wxUpdateUIEvent_SetUpdateInterval(cast(бцел)значение); }
		
		//-----------------------------------------------------------------------------
		
		public static проц ResetUpdateTime()
		{
			wxUpdateUIEvent_ResetUpdateTime();
		}

		private static Событие Нов(ЦУк объ) { return new UpdateUIEvent(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_UPDATE_UI,                       &UpdateUIEvent.Нов);
		}
	}
