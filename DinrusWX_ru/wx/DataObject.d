//-----------------------------------------------------------------------------
// wxD - ОбъектДанные.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Dataobj.cs
//
/// The wxDataObject wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ОбъектДанные.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.DataObject;
public import wx.common;
public import wx.ArrayString;

public abstract class ОбъектДанные : wxObject
{
    public enum DataDirection
    {
        Get = 0x01,
        Уст = 0x02,
        Both = 0x03
    }

    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    //---------------------------------------------------------------------

    override protected проц dtor() {  }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxDataObjectSimple_ctor(ЦелУкз format);
static extern (C) проц wxDataObjectSimple_dtor(ЦелУкз сам);
static extern (C) проц wxDataObjectSimple_SetFormat(ЦелУкз сам, ЦелУкз format);
static extern (C) бцел wxDataObjectSimple_GetDataSize(ЦелУкз сам);
static extern (C) бул wxDataObjectSimple_GetDataHere(ЦелУкз сам, ЦелУкз buf);
static extern (C) бул wxDataObjectSimple_SetData(ЦелУкз сам, бцел len, ЦелУкз buf);
//! \endcond

//---------------------------------------------------------------------

alias DataObjectSimple wxDataObjectSimple;
public class DataObjectSimple : ОбъектДанные
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

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDataObjectSimple_dtor(wxobj);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxTextDataObject_ctor(ткст текст);
static extern (C) проц wxTextDataObject_dtor(ЦелУкз сам);
static extern (C) проц wxTextDataObject_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) цел wxTextDataObject_GetTextLength(ЦелУкз сам);
static extern (C) ЦелУкз wxTextDataObject_GetText(ЦелУкз сам);
static extern (C) проц wxTextDataObject_SetText(ЦелУкз сам, ткст текст);
//! \endcond

//---------------------------------------------------------------------

alias TextDataObject wxTextDataObject;
public class TextDataObject : DataObjectSimple
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

    public this()
    {
        this("");
    }

    public this(ткст текст)
    {
        this(wxTextDataObject_ctor(текст), да);
        wxTextDataObject_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxTextDataObject_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public цел TextLength()
    {
        return wxTextDataObject_GetTextLength(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст Text()
    {
        return cast(ткст) new wxString(wxTextDataObject_GetText(wxobj), да);
    }
    public проц Text(ткст значение)
    {
        wxTextDataObject_SetText(wxobj, значение);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxFileDataObject_ctor();
static extern (C) проц wxFileDataObject_dtor(ЦелУкз сам);
static extern (C) проц wxFileDataObject_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц wxFileDataObject_AddFile(ЦелУкз сам, ткст имяф);
static extern (C) ЦелУкз wxFileDataObject_GetFilenames(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias FileDataObject wxFileDataObject;
public class FileDataObject : DataObjectSimple
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

    public this()
    {
        this(wxFileDataObject_ctor(), да);
        wxFileDataObject_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxFileDataObject_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public проц AddFile(ткст имяф)
    {
        wxFileDataObject_AddFile(wxobj, имяф);
    }

    public ткст[] Filenames()
    {
        ТкстМассив a=new ТкстМассив(wxFileDataObject_GetFilenames(wxobj), да);
        ткст[] res;
        res.length=a.Счёт;
        for(бцел i=0; i<a.Счёт; ++i)
            res[i]=a.Элемент(i);

        return res;
    }

}
