module wx.RadioBox;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) IntPtr wxRadioBox_ctor();
		static extern (C) бул   wxRadioBox_Create(IntPtr сам, IntPtr родитель, цел ид,
		                                                           ткст ярлык, inout Точка поз, inout Размер разм,
		                                                           цел n, ткст* choices, цел majorDimension,
		                                                           бцел стиль, IntPtr val, ткст имя);

		static extern (C) проц   wxRadioBox_SetSelection(IntPtr сам, цел n);
		static extern (C) цел    wxRadioBox_GetSelection(IntPtr сам);

		static extern (C) IntPtr wxRadioBox_GetStringSelection(IntPtr сам);
		static extern (C) бул   wxRadioBox_SetStringSelection(IntPtr сам, ткст s);

		static extern (C) цел    wxRadioBox_GetCount(IntPtr сам);
		static extern (C) цел    wxRadioBox_FindString(IntPtr сам, ткст s);

		static extern (C) IntPtr wxRadioBox_GetString(IntPtr сам, цел n);
		static extern (C) проц   wxRadioBox_SetString(IntPtr сам, цел n, ткст ярлык);

		static extern (C) проц   wxRadioBox_Enable(IntPtr сам, цел n, бул вкл);
		static extern (C) проц   wxRadioBox_Show(IntPtr сам, цел n, бул покажи);
		
		static extern (C) IntPtr wxRadioBox_GetLabel(IntPtr сам);
		static extern (C) проц   wxRadioBox_SetLabel(IntPtr сам, ткст ярлык);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias RadioBox wxRadioBox;
	public class RadioBox : Control
	{
		enum {
			wxRA_LEFTTORIGHT    = 0x0001,
			wxRA_TOPTOBOTTOM    = 0x0002,
			wxRA_SPECIFY_COLS   = Ориентация.wxHORIZONTAL,
			wxRA_SPECIFY_ROWS   = Ориентация.wxVERTICAL,
			wxRA_HORIZONTAL     = Ориентация.wxHORIZONTAL,
			wxRA_VERTICAL       = Ориентация.wxVERTICAL,
		}

		public const ткст wxRadioBoxNameStr = "radioBox";
		//---------------------------------------------------------------------
        
		public this(IntPtr wxobj);
		public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст[] choices = null, цел majorDimension = 0, цел стиль = wxRA_HORIZONTAL, Оценщик val = null, ткст имя = wxRadioBoxNameStr);
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст[] choices = null, цел majorDimension = 0, цел стиль = wxRA_HORIZONTAL, Оценщик val = null, ткст имя = wxRadioBoxNameStr);
		public проц Выбор(цел значение);
		public цел Выбор() ;
		public проц StringSelection(ткст значение) ;
		public ткст StringSelection() ;
		public цел Счёт() ;
		public цел FindString(ткст s);
		public ткст GetString(цел n);
		public проц УстString(цел n, ткст ярлык);
		public проц Включи(цел n, бул вкл);
		public проц Покажи(цел n, бул покажи);
		public override ткст Ярлык() ;
		public override проц Ярлык(ткст значение) ;
		public проц Select_Add(ДатчикСобытий значение) ;
		public проц Select_Remove(ДатчикСобытий значение) ;
	}
