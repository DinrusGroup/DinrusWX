module wx.CheckBox;
public import wx.common;
public import wx.Control;

	public enum CheckBoxState
	{
		wxCHK_UNCHECKED,
		wxCHK_CHECKED,
		wxCHK_UNDETERMINED
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxCheckBox_ctor();
		static extern (C) бул   wxCheckBox_Create(IntPtr сам, IntPtr родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм, бцел стиль, IntPtr val, ткст имя);
		static extern (C) бул   wxCheckBox_GetValue(IntPtr сам);
		static extern (C) проц   wxCheckBox_SetValue(IntPtr сам, бул state);
		static extern (C) бул   wxCheckBox_IsChecked(IntPtr сам);
		
		static extern (C) CheckBoxState wxCheckBox_Get3StateValue(IntPtr сам);
		static extern (C) проц wxCheckBox_Set3StateValue(IntPtr сам, CheckBoxState state);
		static extern (C) бул wxCheckBox_Is3State(IntPtr сам);
		static extern (C) бул wxCheckBox_Is3rdStateAllowedForUser(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias CheckBox wxCheckBox;
	public class CheckBox : Control
	{
		public const цел wxCHK_2STATE           = 0x0000;
		public const цел wxCHK_3STATE           = 0x1000;
		public const цел wxCHK_ALLOW_3RD_STATE_FOR_USER           = 0x2000;
		public const ткст wxCheckBoxNameStr = "checkbox";
	
		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль =0, Оценщик val=null, ткст имя = wxCheckBoxNameStr);		
		public static wxObject Нов(IntPtr wxobj);
		public this(Окно родитель, ткст ярлык, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль =0, Оценщик val=null, ткст имя = wxCheckBoxNameStr);
		public бул Создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер разм,
			цел стиль, Оценщик val, ткст имя);
		public бул Value();
		public проц Value(бул значение);
		public бул Отмечен();
		public CheckBoxState ThreeStateValue();
		public проц ThreeStateValue(CheckBoxState значение) ;
		public бул Is3State();
		public бул Is3rdStateAllowedForUser();
		public проц Clicked_Add(ДатчикСобытий значение);
		public проц Clicked_Remove(ДатчикСобытий значение) ;
	}
