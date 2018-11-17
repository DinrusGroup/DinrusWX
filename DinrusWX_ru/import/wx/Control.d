module wx.Control;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) проц   wxControl_Команда(IntPtr сам, IntPtr evt);
		static extern (C) IntPtr wxControl_GetLabel(IntPtr сам);
		static extern (C) проц   wxControl_SetLabel(IntPtr сам, ткст ярлык);
		
		static extern (C) цел wxControl_GetAlignment(IntPtr сам);
		static extern (C) бул wxControl_SetFont(IntPtr сам, IntPtr шрифт);
		//! \endcond

		//---------------------------------------------------------------------

	alias Control wxControl;
	/// This is the base class for a control or "widget".
	/// A control is generally a small окно which processes user input
	/// and/or displays one or more элт of data.
	public class Control : Окно
	{
		const ткст wxControlNameStr = "control";
	
		public this(IntPtr wxobj) ;
		public this(Окно родитель, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=wxControlNameStr);
		public this(Окно родитель, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=wxControlNameStr);
		public static wxObject Нов(IntPtr wxobj) ;
		public проц Команда();
		public ткст Ярлык() ;
		public проц Ярлык(ткст значение) ;
		public цел GetAlignment();
		public бул УстFont(Шрифт шрифт);
	}

