module wx.VideoMode;
public import wx.common;


//    [StructLayout(LayoutKind.Sequential)]

        deprecated public VideoMode new_VideoMode(цел ширь, цел высь, цел глубь, цел freq);

    public struct VideoMode // : IComparable
    {
        /** struct constructor */
        public static VideoMode opCall(цел ширь, цел высь, цел глубь, цел freq);

        public бул Matches(VideoMode other);
        public цел Ширь() ;
        public цел Высь() ;
        public цел Глубь() ;
        public цел RefreshFrequency() ;
		public ткст вТкст();	
    }
