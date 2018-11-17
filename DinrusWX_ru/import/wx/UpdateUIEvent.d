module wx.UpdateUIEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxUpdateUIEvent_ctor(цел commandId);
		static extern (C) проц   wxUpdUIEvt_Enable(IntPtr сам, бул вкл);
		static extern (C) проц   wxUpdUIEvt_Check(IntPtr сам, бул check);
		static extern (C) бул   wxUpdateUIEvent_CanUpdate(IntPtr окно);
		static extern (C) бул   wxUpdateUIEvent_GetChecked(IntPtr сам);
		static extern (C) бул   wxUpdateUIEvent_GetEnabled(IntPtr сам);
		static extern (C) бул   wxUpdateUIEvent_GetУстChecked(IntPtr сам);
		static extern (C) бул   wxUpdateUIEvent_GetУстEnabled(IntPtr сам);
		static extern (C) бул   wxUpdateUIEvent_GetУстText(IntPtr сам);
		static extern (C) IntPtr wxUpdateUIEvent_GetText(IntPtr сам);
		static extern (C) цел    wxUpdateUIEvent_GetMode();
		static extern (C) бцел   wxUpdateUIEvent_GetUpdateInterval();
		static extern (C) проц   wxUpdateUIEvent_ResetUpdateTime();
		static extern (C) проц   wxUpdateUIEvent_SetMode(цел mode);
		static extern (C) проц   wxUpdateUIEvent_SetText(IntPtr сам, ткст текст);
		static extern (C) проц   wxUpdateUIEvent_SetUpdateInterval(бцел updateInterval);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias UpdateUIEvent wxUpdateUIEvent;
	public class UpdateUIEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj);
		public this(цел commandId = 0) ;
		public проц Активен(бул значение);
		public проц Check(бул значение);
		public static бул CanUpdate(Окно окно);
		public бул Checked() ;
		public бул GetEnabled();
		public бул УстChecked() ;
		public бул УстEnabled();
		public бул УстText() ;
		public ткст Text();
		public проц Text(ткст значение) ;
		static UpdateUIMode Mode() ;
		static проц Mode(UpdateUIMode значение);
		static цел UpdateInterval() ;
		static проц UpdateInterval(цел значение) ;
		public static проц ResetUpdateTime();
		private static Событие Нов(IntPtr объ) ;
		static this();
	}
