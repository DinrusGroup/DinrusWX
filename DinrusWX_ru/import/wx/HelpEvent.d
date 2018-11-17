module wx.HelpEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxHelpEvent_ctor(цел тип,цел идок, inout Точка поз);
		static extern (C) проц   wxHelpEvent_GetPosition(IntPtr сам, inout Точка поз);
		static extern (C) проц   wxHelpEvent_SetPosition(IntPtr сам, inout Точка поз);
		static extern (C) IntPtr wxHelpEvent_GetLink(IntPtr сам);
		static extern (C) проц   wxHelpEvent_SetLink(IntPtr сам, ткст link);
		static extern (C) IntPtr wxHelpEvent_GetTarget(IntPtr сам);
		static extern (C) проц   wxHelpEvent_SetTarget(IntPtr сам, ткст target);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias HelpEvent wxHelpEvent;
	public class HelpEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj);
		public this(EventType тип = wxEVT_NULL, цел идок = 0, Точка поз = Окно.вхДефПоз);
		public Точка Позиция();
		public проц Позиция(Точка значение);
		public ткст Link() ;
		public проц Link(ткст значение);
		public ткст Target() ;
		public проц Target(ткст значение);
		private static Событие Нов(IntPtr объ);
		static this()
		{
			ДобавьТипСоб(wxEVT_HELP,				&HelpEvent.Нов);
			ДобавьТипСоб(wxEVT_DETAILED_HELP,			&HelpEvent.Нов);
		}
	}
