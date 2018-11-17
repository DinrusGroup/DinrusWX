module wx.ContextMenuEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxContextMenuEvent_ctor(цел тип,цел идок, inout Точка поз);
		static extern (C) проц   wxContextMenuEvent_GetPosition(IntPtr сам, inout Точка поз);
		static extern (C) проц   wxContextMenuEvent_SetPosition(IntPtr сам, inout Точка поз);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ContextMenuEvent wxContextMenuEvent;
	public class ContextMenuEvent : СобытиеКоманда
	{
		public this(IntPtr wxobj) ;
		public this(EventType тип = wxEVT_NULL, цел идок = 0,Точка тчк = Окно.вхДефПоз);
		public Точка Позиция() ;
		public проц Позиция(Точка значение) ;
		private static Событие Нов(IntPtr объ) ;
		    static this()
    {
        ДобавьТипСоб(wxEVT_CONTEXT_MENU,			&ContextMenuEvent.Нов);
    }
	}
