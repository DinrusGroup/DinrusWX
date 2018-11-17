module wx.TipWindow;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
        static extern (C) IntPtr wxTipWindow_ctor(IntPtr родитель, ткст текст, цел maxLength, Прямоугольник* rectBound);
        //static extern (C) IntPtr wxTipWindow_ctorNoRect(IntPtr родитель, ткст текст, цел maxLength);
        //static extern (C) проц   wxTipWindow_SetTipWindowPtr(IntPtr сам, IntPtr wxTipWindow* windowPtr);
        static extern (C) проц   wxTipWindow_SetBoundingRect(IntPtr сам, inout Прямоугольник rectBound);
        static extern (C) проц   wxTipWindow_Close(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias TipWindow wxTipWindow;
    public class TipWindow : Окно
    {
        public this(IntPtr wxobj);
        public this(Окно родитель, ткст текст, цел maxLength = 100);
        public this(Окно родитель, ткст текст, цел maxLength, Прямоугольник rectBound);
        public проц BoundingRect(Прямоугольник значение) ;
    }
