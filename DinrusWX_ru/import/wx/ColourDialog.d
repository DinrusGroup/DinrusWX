module wx.ColourDialog;
public import wx.common;
public import wx.Colour;
public import wx.Dialog;

		//! \cond EXTERN
		static extern (C) IntPtr wxColourData_ctor();

		static extern (C) проц   wxColourData_SetChooseFull(IntPtr сам, бул флаг);
		static extern (C) бул   wxColourData_GetChooseFull(IntPtr сам);

		static extern (C) проц   wxColourData_SetColour(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxColourData_GetColour(IntPtr сам);

		static extern (C) проц   wxColourData_SetCustomColour(IntPtr сам, цел i, IntPtr цвет);
		static extern (C) IntPtr wxColourData_GetCustomColour(IntPtr сам, цел i);
		//! \endcond

		//---------------------------------------------------------------------
        
	alias ColourData wxColourData;
	public class ColourData : wxObject
	{
		private this(IntPtr wxobj) ;
		public this();
		public бул ChooseFull() ;
		public проц ChooseFull(бул значение);
		public Цвет цвет() ;
		public проц цвет(Цвет значение) ;
		public Цвет GetCustomColour(цел i);
		public проц УстCustomColour(цел i, Цвет цвет);
		public static wxObject Нов(IntPtr ptr) ;
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) IntPtr wxColourDialog_ctor();
		static extern (C) бул   wxColourDialog_Create(IntPtr сам, IntPtr родитель, IntPtr data);
		static extern (C) IntPtr wxColourDialog_GetColourData(IntPtr сам);
		static extern (C) цел    wxColourDialog_ShowModal(IntPtr сам);
		
		static extern (C) IntPtr wxColourDialog_GetColourFromUser(IntPtr родитель, IntPtr colInit);
		//! \endcond
	
		//---------------------------------------------------------------------
	
	alias ColourDialog wxColourDialog;
	public class ColourDialog : Dialog
	{
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, ColourData data = null);
		public бул Создай(Окно родитель, ColourData data = null);
		public ColourData colourData() ;
		public override цел ShowModal();
	}

		public static Цвет GetColourFromUser(Окно родитель=null, Цвет colInit=null);
