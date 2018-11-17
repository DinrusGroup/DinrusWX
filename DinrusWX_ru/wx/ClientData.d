//-----------------------------------------------------------------------------
// wxD - ClientData.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ClientData.cs
//
/// The wxClientData wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ClientData.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.ClientData;
public import wx.common;

//! \cond EXTERN
static extern (C) ЦелУкз wxClientData_ctor();
static extern (C) проц wxClientData_dtor(ЦелУкз сам);
static extern (C) проц wxClientData_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
//! \endcond

//---------------------------------------------------------------------

alias ClientData wxClientData;
public class ClientData : wxObject
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
        this(wxClientData_ctor(), да);
        wxClientData_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxClientData_dtor(wxobj);
    }

    static wxObject Нов(ЦелУкз ptr)
    {
        return new ClientData(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxStringClientData_ctor(ткст data);
static extern (C) проц   wxStringClientData_dtor(ЦелУкз сам);
static extern (C) проц   wxStringClientData_SetData(ЦелУкз сам, ткст data);
static extern (C) ЦелУкз wxStringClientData_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias StringClientData wxStringClientData;
public class StringClientData : ClientData
{
    public this()
    {
        this(wxStringClientData_ctor(""), да);
    }

    public this(ткст data)
    {
        this(wxStringClientData_ctor(data), да);
    }

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
        wxStringClientData_dtor(wxobj);
    }
    //---------------------------------------------------------------------

    public ткст Data()
    {
        return cast(ткст) new wxString(wxStringClientData_GetData(wxobj), да);
    }
    public проц Data(ткст значение)
    {
        wxStringClientData_SetData(wxobj, значение);
    }
}

