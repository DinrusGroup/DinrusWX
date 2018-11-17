module wx.ProgressDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) IntPtr wxProgressDialog_ctor(ткст title, ткст message, цел maximum, IntPtr родитель, бцел стиль);
	static extern (C) проц wxProgressDialog_dtor(IntPtr сам);
        static extern (C) бул wxProgressDialog_Update(IntPtr сам, цел значение, ткст newmsg);
        static extern (C) проц wxProgressDialog_Resume(IntPtr сам);
        static extern (C) бул wxProgressDialog_Show(IntPtr сам, бул покажи);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias ProgressDialog wxProgressDialog;
    public class ProgressDialog : Dialog
    {
        public const цел wxPD_CAN_ABORT      = 0x0001;
        public const цел wxPD_APP_MODAL      = 0x0002;
        public const цел wxPD_AUTO_HIDE      = 0x0004;
        public const цел wxPD_ELAPSED_TIME   = 0x0008;
        public const цел wxPD_ESTIMATED_TIME = 0x0010;
        public const цел wxPD_REMAINING_TIME = 0x0040;

        public this(IntPtr wxobj);
        public this(ткст title, ткст message, цел maximum = 100, Окно родитель = null, цел стиль = wxPD_APP_MODAL | wxPD_AUTO_HIDE);
        public бул Обнови(цел значение);
        public бул Обнови(цел значение, ткст newmsg);
        public проц Resume();
        public override бул Покажи(бул покажи=да);
	override protected проц dtor() ;
    }

