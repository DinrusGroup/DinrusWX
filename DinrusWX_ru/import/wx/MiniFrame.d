module wx.MiniFrame;
public import wx.common;
public import wx.Frame;

		//! \cond EXTERN
        static extern (C) IntPtr wxMiniFrame_ctor();
        static extern (C) бул   wxMiniFrame_Create(IntPtr сам, IntPtr родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias MiniFrame wxMiniFrame;
    public class MiniFrame : Frame
    {
        enum { wxDEFAULT_MINIFRAME_STYLE = wxCAPTION | wxCLIP_CHILDREN | wxRESIZE_BORDER }
    
        public this(IntPtr wxobj) ;
        public this();
        public this(Окно родитель, цел ид, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_MINIFRAME_STYLE, ткст имя=wxFrameNameStr);
        public this(Окно родитель, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_MINIFRAME_STYLE, ткст имя=wxFrameNameStr);
        public override бул Создай(Окно родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
        public this(ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_MINIFRAME_STYLE);
    }

