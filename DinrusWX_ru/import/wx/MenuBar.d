module wx.MenuBar;
public import wx.common;
public import wx.EvtHandler;
public import wx.Menu;

		//! \cond EXTERN
		static extern (C) IntPtr wxMenuBar_ctor();
		static extern (C) IntPtr wxMenuBar_ctor2(бцел стиль);
		static extern (C) бул   wxMenuBar_Append(IntPtr сам, IntPtr меню, ткст title);
		static extern (C) проц   wxMenuBar_Check(IntPtr сам, цел ид, бул check);
		static extern (C) бул   wxMenuBar_IsChecked(IntPtr сам, цел ид);
        	static extern (C) бул   wxMenuBar_Insert(IntPtr сам, цел поз, IntPtr меню, ткст title);
        	static extern (C) IntPtr wxMenuBar_FindItem(IntPtr сам, цел ид, inout IntPtr меню);
		
		static extern (C) цел    wxMenuBar_GetMenuCount(IntPtr сам);
		static extern (C) IntPtr wxMenuBar_GetMenu(IntPtr сам, цел поз);
		
		static extern (C) IntPtr wxMenuBar_Replace(IntPtr сам, цел поз, IntPtr меню, ткст title);
		static extern (C) IntPtr wxMenuBar_Remove(IntPtr сам, цел поз);
		
		static extern (C) проц   wxMenuBar_EnableTop(IntPtr сам, цел поз, бул вкл);
		
		static extern (C) проц   wxMenuBar_Enable(IntPtr сам, цел ид, бул вкл);
		
		static extern (C) цел    wxMenuBar_FindMenu(IntPtr сам, ткст title);
		static extern (C) цел    wxMenuBar_FindЭлтМеню(IntPtr сам, ткст menustring, ткст элтString);
		
		static extern (C) IntPtr wxMenuBar_GetHelpString(IntPtr сам, цел ид);
		static extern (C) IntPtr wxMenuBar_GetLabel(IntPtr сам, цел ид);
		static extern (C) IntPtr wxMenuBar_GetLabelTop(IntPtr сам, цел поз);
		
		static extern (C) бул   wxMenuBar_IsEnabled(IntPtr сам, цел ид);
		
		static extern (C) проц   wxMenuBar_Refresh(IntPtr сам);
		
		static extern (C) проц   wxMenuBar_SetHelpString(IntPtr сам, цел ид, ткст helpstring);
		static extern (C) проц   wxMenuBar_SetLabel(IntPtr сам, цел ид, ткст ярлык);
		static extern (C) проц   wxMenuBar_SetLabelTop(IntPtr сам, цел поз, ткст ярлык);
		//! \endcond

	alias MenuBar wxMenuBar;
	public class MenuBar : ОбработчикСоб
	{
		//---------------------------------------------------------------------

		public this();
		public this(цел стиль);
		public this(IntPtr wxobj);
		public static wxObject Нов(IntPtr wxobj);
		public бул Append(Меню меню, ткст title);
		public проц Check(цел ид, бул check);
		public бул Отмечен(цел ид);
		public бул Insert(цел поз, Меню меню, ткст title);
		public ЭлтМеню FindItem(цел ид);
		public ЭлтМеню FindItem(цел ид, inout Меню меню);
		public цел MenuCount();
		public Меню GetMenu(цел поз);
		public Меню Replace(цел поз, Меню меню, ткст title);
		public Меню Remove(цел поз);
		public проц EnableTop(цел поз, бул вкл);
		public проц Включи(цел ид, бул вкл);
		public цел FindMenu(ткст title);
		public цел FindЭлтМеню(ткст menustring, ткст элтString);
		public ткст GetHelpString(цел ид);
		public ткст ДайЯрлык(цел ид);
		public ткст GetLabelTop(цел поз);
		public бул IsEnabled(цел ид);
		public проц Освежи();
		public проц УстHelpString(цел ид, ткст helpstring);
		public проц УстЯрлык(цел ид, ткст ярлык);
		public проц УстLabelTop(цел поз, ткст ярлык);
	}
