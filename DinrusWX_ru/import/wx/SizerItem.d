module wx.SizerItem;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
        static extern (C) IntPtr wxSizerItem_ctorSpace(цел ширь, цел высь, цел proportion, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) IntPtr wxSizerItem_ctorWindow(IntPtr окно, цел proportion, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) IntPtr wxSizerItem_ctorSizer(IntPtr сайзер, цел proportion, цел флаг, цел бордюр, IntPtr userData);
        static extern (C) IntPtr wxSizerItem_ctor();
        static extern (C) проц   wxSizerItem_DeleteWindows(IntPtr сам);
        static extern (C) проц   wxSizerItem_DetachSizer(IntPtr сам);
        static extern (C) проц   wxSizerItem_GetSize(IntPtr сам, inout Размер разм);
        static extern (C) проц   wxSizerItem_CalcMin(IntPtr сам, inout Размер min);
        static extern (C) проц   wxSizerItem_SetDimension(IntPtr сам, inout Точка поз, inout Размер разм);
        static extern (C) проц   wxSizerItem_GetMinSize(IntPtr сам, inout Размер разм);
        static extern (C) проц   wxSizerItem_SetInitSize(IntPtr сам, цел x, цел y);
        static extern (C) проц   wxSizerItem_SetRatio(IntPtr сам, цел ширь, цел высь);
        static extern (C) проц   wxSizerItem_SetRatioFloat(IntPtr сам, float ratio);
        static extern (C) float  wxSizerItem_GetRatioFloat(IntPtr сам);
        static extern (C) бул   wxSizerItem_IsWindow(IntPtr сам);
        static extern (C) бул   wxSizerItem_IsSizer(IntPtr сам);
        static extern (C) бул   wxSizerItem_IsSpacer(IntPtr сам);
        static extern (C) проц   wxSizerItem_SetProportion(IntPtr сам, цел proportion);
        static extern (C) цел    wxSizerItem_GetProportion(IntPtr сам);
        static extern (C) проц   wxSizerItem_SetFlag(IntPtr сам, цел флаг);
        static extern (C) цел    wxSizerItem_GetFlag(IntPtr сам);
        static extern (C) проц   wxSizerItem_SetBorder(IntPtr сам, цел бордюр);
        static extern (C) цел    wxSizerItem_GetBorder(IntPtr сам);
        static extern (C) IntPtr wxSizerItem_GetWindow(IntPtr сам);
        static extern (C) проц   wxSizerItem_SetWindow(IntPtr сам, IntPtr окно);
        static extern (C) IntPtr wxSizerItem_GetSizer(IntPtr сам);
        static extern (C) проц   wxSizerItem_SetSizer(IntPtr сам, IntPtr сайзер);
        static extern (C) проц   wxSizerItem_GetSpacer(IntPtr сам, inout Размер разм);
        static extern (C) проц   wxSizerItem_SetSpacer(IntPtr сам, inout Размер разм);
        static extern (C) проц   wxSizerItem_Show(IntPtr сам, бул покажи);
        static extern (C) бул   wxSizerItem_IsShown(IntPtr сам);
        static extern (C) IntPtr wxSizerItem_GetUserData(IntPtr сам);
        static extern (C) проц   wxSizerItem_GetPosition(IntPtr сам, inout Точка поз);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SizerItem wxSizerItem;
    public class SizerItem : wxObject
    {
        public this(цел ширь, цел высь, цел proportion, цел флаг, цел бордюр, wxObject userData);
        public this(Окно окно, цел proportion, цел флаг, цел бордюр, wxObject userData);
        public this(Сайзер сайзер, цел proportion, цел флаг, цел бордюр, wxObject userData);
        public this();
        public this(IntPtr wxobj);
        public проц DeleteWindows();
        public проц DetachSizer();
        public Размер разм() ;
        public Размер ВычислиМин();
        public проц УстDimension(Точка поз, Размер разм);
        public Размер МинРазм() ;
        public проц УстInitSize(цел x, цел y);
        public проц УстRatio(Размер разм);
        public проц УстRatio(цел ширь, цел высь);
        public проц Ratio(float значение);
        public float Ratio() ;
        public бул IsWindow() ;
        public бул IsSizer() ;
        public бул IsSpacer() ;
        public проц Proportion(цел значение) ;
        public цел Proportion() ;
        public проц Flag(цел значение) ;
        public цел Flag() ;
        public проц ПБордюр(цел значение) ;
        public цел ПБордюр();
        public Окно окно();
        public проц окно(Окно значение) ;
        public Сайзер сайзер();
        public проц сайзер(Сайзер значение) ;
        public Размер Spacer();
        public проц Spacer(Размер значение);
        public проц Покажи(бул покажи);
        public бул Виден() ;
        public wxObject UserData();
        public Точка Позиция() ;
    }

