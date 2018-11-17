module wx.TextDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) IntPtr wxTextEntryDialog_ctor(IntPtr родитель, ткст message, ткст caption, ткст значение, бцел стиль, inout Точка поз);
        static extern (C) проц wxTextEntryDialog_dtor(IntPtr сам);
        static extern (C) проц wxTextEntryDialog_SetValue(IntPtr сам, ткст val);
        static extern (C) IntPtr wxTextEntryDialog_GetValue(IntPtr сам);
        static extern (C) цел wxTextEntryDialog_ShowModal(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias TextEntryDialog wxTextEntryDialog;
    public class TextEntryDialog : Dialog
    {
    	enum {
        wxTextEntryDialogStyle = (wxOK | wxCANCEL | wxCENTRE),
	}
	public const ткст wxGetTextFromUserPromptStr = "Input Text";

        public this(IntPtr wxobj);
        public  this(Окно родитель, ткст message=wxGetTextFromUserPromptStr, ткст caption="", ткст значение="", цел стиль=wxTextEntryDialogStyle, Точка поз=вхДефПоз);
        public ткст Value() ;
        public проц Value(ткст значение);
        public override цел ShowModal();
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxGetPasswordFromUser_func(ткст message, ткст caption, ткст defaultValue, IntPtr родитель);
        static extern (C) IntPtr wxGetTextFromUser_func(ткст message, ткст caption, ткст defaultValue, IntPtr родитель, цел x, цел y, бул centre);
		//! \endcond

        //-----------------------------------------------------------------------------

        public ткст GetPasswordFromUser(ткст message, ткст caption=TextEntryDialog.wxGetTextFromUserPromptStr, ткст defaultValue="", Окно родитель=null);
        public ткст GetTextFromUser(ткст message, ткст caption=TextEntryDialog.wxGetTextFromUserPromptStr, ткст defaultValue="", Окно родитель=null, цел x=-1, цел y=-1, бул centre=да);