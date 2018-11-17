//-----------------------------------------------------------------------------
// wxD - ФорматДаты.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ФорматДаты.cs
//
/// The wxDataFormat wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ФорматДаты.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

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
static extern (C) ЦелУкз wxDataFormat_ctor();
static extern (C) проц   wxDataFormat_dtor(ЦелУкз сам);
static extern (C) ЦелУкз wxDataFormat_ctorByType(цел тип);
static extern (C) ЦелУкз wxDataFormat_ctorById(ткст ид);

static extern (C) ЦелУкз wxDataFormat_GetId(ЦелУкз сам);
static extern (C) проц   wxDataFormat_SetId(ЦелУкз сам, ткст ид);

static extern (C) цел    wxDataFormat_GetType(ЦелУкз сам);
static extern (C) проц   wxDataFormat_SetType(ЦелУкз сам, цел тип);
//! \endcond

//-----------------------------------------------------------------------------

alias ФорматДаты wxDataFormat;
public class ФорматДаты : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public  this()
    {
        this(wxDataFormat_ctor(), да);
    }

    public this(ПИдФорматаДаты тип)
    {
        this(wxDataFormat_ctorByType(cast(цел)тип), да);
    }

    public this(ткст ид)
    {
        this(wxDataFormat_ctorById(ид), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDataFormat_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст Ид()
    {
        return cast(ткст) new wxString(wxDataFormat_GetId(wxobj), да);
    }
    public проц Ид(ткст значение)
    {
        wxDataFormat_SetId(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public ПИдФорматаДаты Тип()
    {
        return cast(ПИдФорматаДаты)wxDataFormat_GetType(wxobj);
    }
    public проц Тип(ПИдФорматаДаты значение)
    {
        wxDataFormat_SetType(wxobj, cast(цел)значение);
    }
}

