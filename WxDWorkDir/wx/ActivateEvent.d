module wx.ActivateEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
		static extern (C) ЦУк wxActivateEvent_ctor(цел тип, бул активен,цел Ид);
		static extern (C) бул wxActivateEvent_GetActive(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias СобАктивирования wxActivateEvent;
	public class СобАктивирования : Событие
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(ТипСобытия тип = wxEVT_NULL, бул активен = да, цел Ид = 0)
			{ this(wxActivateEvent_ctor(тип, да, Ид)); }

		//-----------------------------------------------------------------------------	
		
		public бул Активен() { return wxActivateEvent_GetActive(шхобъ); }


		private static Событие Нов(ЦУк объ) { return new СобАктивирования(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_ACTIVATE,                        &СобАктивирования.Нов);
		}
	}
