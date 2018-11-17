module wx.DataFormat;
public import wx.common;

    public enum ПИдФорматаДаты
    {
        wxDF_INVALID =          0,
        wxDF_TEXT =             1,
        wxDF_BITMAP =           2,
        wxDF_METAFILE =         3,
        wxDF_SYLK =             4,
        wxDF_DIF =              5,
        wxDF_TIFF =             6,
        wxDF_OEMTEXT =          7,
        wxDF_DIB =              8,
        wxDF_PALETTE =          9,
        wxDF_PENDATA =          10,
        wxDF_RIFF =             11,
        wxDF_WAVE =             12,
        wxDF_UNICODETEXT =      13,
        wxDF_ENHMETAFILE =      14,
        wxDF_FILENAME =         15,
        wxDF_LOCALE =           16,
        wxDF_PRIVATE =          20,
        wxDF_HTML =             30,
        wxDF_MAX
    }
 
		//! \cond EXTERN
        static extern (C) IntPtr wxDataFormat_ctor();
	static extern (C) проц   wxDataFormat_dtor(IntPtr сам);
        static extern (C) IntPtr wxDataFormat_ctorByType(цел тип);
        static extern (C) IntPtr wxDataFormat_ctorById(ткст ид);

        static extern (C) IntPtr wxDataFormat_GetId(IntPtr сам);
        static extern (C) проц   wxDataFormat_SetId(IntPtr сам, ткст ид);

        static extern (C) цел    wxDataFormat_GetType(IntPtr сам);
        static extern (C) проц   wxDataFormat_SetType(IntPtr сам, цел тип);
		//! \endcond
	
        //-----------------------------------------------------------------------------
	
    alias ФорматДаты wxDataFormat;
    public class ФорматДаты : wxObject
    {
	public this(IntPtr wxobj);			
	private this(IntPtr wxobj, бул memOwn);
        public  this();
        public this(ПИдФорматаДаты тип);
        public this(ткст ид);
	override protected проц dtor();
        public ткст Ид() ;
        public проц Ид(ткст значение) ;
        public ПИдФорматаДаты Тип() ;
        public проц Тип(ПИдФорматаДаты значение);
    }

