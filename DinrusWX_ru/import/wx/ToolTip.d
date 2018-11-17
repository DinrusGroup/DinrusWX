module wx.ToolTip;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) проц   wxToolTip_Enable(бул флаг);
		static extern (C) проц   wxToolTip_SetDelay(бцел msecs);
		static extern (C) IntPtr wxToolTip_ctor(ткст tip);
		static extern (C) проц   wxToolTip_SetTip(IntPtr сам, ткст tip);
		static extern (C) IntPtr wxToolTip_GetTip(IntPtr сам);
		static extern (C) IntPtr wxToolTip_GetWindow(IntPtr сам);
		static extern (C) проц   wxToolTip_SetWindow(IntPtr сам,IntPtr win);
		//! \endcond

        //---------------------------------------------------------------------

	alias ToolTip wxToolTip;
	public class ToolTip : wxObject
	{
        public this(IntPtr wxobj);
        public this(ткст tip);
        static проц Активен(бул значение) ;
        static проц Delay(цел значение) ;
        public ткст Tip() ;
        public проц Tip(ткст значение) ;
        public Окно окно() ;
        public проц окно(Окно win) ;
	}

