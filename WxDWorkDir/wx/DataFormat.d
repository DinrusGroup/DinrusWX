//-----------------------------------------------------------------------------
// wxD - ФорматДанных.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ФорматДанных.cs
// 
/// The wxDataFormat wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ФорматДанных.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.ФорматДанных;
public import wx.common;

    public enum ИдФорматаДанных
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
        static extern (C) ЦУк wxDataFormat_ctor();
	static extern (C) проц   wxDataFormat_dtor(ЦУк сам);
        static extern (C) ЦУк wxDataFormat_ctorByType(цел тип);
        static extern (C) ЦУк wxDataFormat_ctorById(ткст ид);

        static extern (C) ЦУк wxDataFormat_GetId(ЦУк сам);
        static extern (C) проц   wxDataFormat_SetId(ЦУк сам, ткст ид);

        static extern (C) цел    wxDataFormat_GetType(ЦУк сам);
        static extern (C) проц   wxDataFormat_SetType(ЦУк сам, цел тип);
		//! \endcond
	
        //-----------------------------------------------------------------------------
	
    alias ФорматДанных wxDataFormat;
    public class ФорматДанных : wxObject
    {
	public this(ЦУк шхобъ)
	{ 
		super(шхобъ);
	}
			
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}

        public  this()
            { this(wxDataFormat_ctor(), да); }

        public this(ИдФорматаДанных тип)
            { this(wxDataFormat_ctorByType(cast(цел)тип), да); }

        public this(ткст ид)
            { this(wxDataFormat_ctorById(ид), да); }
	    
	//---------------------------------------------------------------------
	
	override protected проц dtor() { wxDataFormat_dtor(шхобъ); }

        //-----------------------------------------------------------------------------

        public ткст Ид() { return cast(ткст) new wxString(wxDataFormat_GetId(шхобъ), да); }
        public проц Ид(ткст значение) { wxDataFormat_SetId(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ИдФорматаДанных Тип() { return cast(ИдФорматаДанных)wxDataFormat_GetType(шхобъ); }
        public проц Тип(ИдФорматаДанных значение) { wxDataFormat_SetType(шхобъ, cast(цел)значение); }
    }

