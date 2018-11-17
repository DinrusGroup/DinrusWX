module wx.FontDialog;
public import wx.common;
public import wx.Dialog;
public import wx.Font;
public import wx.GdiCommon; //for nullobject

		//! \cond EXTERN
		static extern (C) IntPtr wxFontData_ctor();
		static extern (C) проц   wxFontData_dtor(IntPtr сам);

		static extern (C) проц   wxFontData_SetAllowSymbols(IntPtr сам, бул флаг);
		static extern (C) бул   wxFontData_GetAllowSymbols(IntPtr сам);

		static extern (C) проц   wxFontData_SetColour(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxFontData_GetColour(IntPtr сам);

		static extern (C) проц   wxFontData_SetShowHelp(IntPtr сам, бул флаг);
		static extern (C) бул   wxFontData_GetShowHelp(IntPtr сам);

		static extern (C) проц   wxFontData_EnableEffects(IntPtr сам, бул флаг);
		static extern (C) бул   wxFontData_GetEnableEffects(IntPtr сам);

		static extern (C) проц   wxFontData_SetInitialFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxFontData_GetInitialFont(IntPtr сам);

		static extern (C) проц   wxFontData_SetChosenFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxFontData_GetChosenFont(IntPtr сам);

		static extern (C) проц   wxFontData_SetRange(IntPtr сам, цел minRange, цел maxRange);
		//! \endcond

        //---------------------------------------------------------------------

    alias FontData wxFontData;
    public class FontData : wxObject
    {
        public this(IntPtr wxobj) ;
        public this();
        public бул AllowSymbols();
        public проц AllowSymbols(бул значение);
        public бул EffectsEnabled();
        public проц EffectsEnabled(бул значение) ;
        public бул ShowHelp();
        public проц ShowHelp(бул значение);
        public Цвет цвет() ;
        public проц цвет(Цвет значение) ;
        public Шрифт InitialFont() ;
        public проц InitialFont(Шрифт значение) ;
        public Шрифт ChosenFont() ;
        public проц ChosenFont(Шрифт значение) ;
        public проц УстRange(цел min, цел max);
    	public static wxObject Нов(IntPtr ptr) ;
    }

		//! \cond EXTERN
		static extern (C) IntPtr wxFontDialog_ctor();
		static extern (C) бул   wxFontDialog_Create(IntPtr сам, IntPtr родитель, IntPtr data);
		static extern (C) проц   wxFontDialog_dtor(IntPtr сам);

		static extern (C) цел    wxFontDialog_ShowModal(IntPtr сам);
		static extern (C) IntPtr wxFontDialog_GetFontData(IntPtr сам);
		//! \endcond

        //---------------------------------------------------------------------

	alias FontDialog wxFontDialog;
	public class FontDialog : Dialog
	{
        public this(IntPtr wxobj);
        public this();
        public this(Окно родитель);
        public this(Окно родитель, FontData data);
        public бул Создай(Окно родитель, FontData data);
        public FontData fontData() ;
        public override цел ShowModal();
	}

	//! \cond EXTERN
	extern (C) IntPtr wxGetFontFromUser_func(IntPtr родитель, IntPtr fontInit);
	//! \endcond

	Шрифт GetFontFromUser(Окно родитель,Шрифт fontInit=null);
