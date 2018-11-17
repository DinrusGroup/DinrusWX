module wx.NumberDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) IntPtr wxNumberEntryDialog_ctor(IntPtr родитель, ткст message, ткст prompt, ткст caption, цел значение, цел min, цел max, inout Точка поз);
        static extern (C) проц wxNumberEntryDialog_dtor(IntPtr сам);
        static extern (C) цел wxNumberEntryDialog_GetValue(IntPtr сам);
        static extern (C) цел wxNumberEntryDialog_ShowModal(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias NumberEntryDialog wxNumberEntryDialog;
    public class NumberEntryDialog : Dialog
    {
        public const цел wxNumberEntryDialogStyle = (Dialog.wxOK | Dialog.wxCANCEL | Dialog.wxCENTRE );

        public this(IntPtr wxobj);
        public  this(Окно родитель, ткст message, ткст prompt, ткст caption, цел значение, цел min, цел max, Точка поз = вхДефПоз);
        public цел Value() ;
        public override цел ShowModal();
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) цел wxGetNumberFromUser_func(ткст message, ткст prompt, ткст caption, цел значение, цел min, цел max, IntPtr родитель, inout Точка поз);
		//! \endcond

        //-----------------------------------------------------------------------------

        public цел GetNumberFromUser(ткст message, ткст prompt, ткст caption, цел значение = 0, цел min = 0, цел max = 100, Окно родитель = null, Точка поз = Dialog.вхДефПоз);
