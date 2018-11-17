//-----------------------------------------------------------------------------
// wxD - MemoryDC.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MemoryDC.cs
//
/// The wxBufferedDC and wxMemoryDC wrapper classes.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MemoryDC.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MemoryDC;
public import wx.common;
public import wx.DC;

//! \cond EXTERN
static extern (C) ЦелУкз wxMemoryDC_ctor();
static extern (C) ЦелУкз wxMemoryDC_ctorByDC(ЦелУкз dc);
static extern (C) проц   wxMemoryDC_SelectObject(ЦелУкз сам, ЦелУкз битмап);
//! \endcond

//---------------------------------------------------------------------

alias MemoryDC wxMemoryDC;
public class MemoryDC : WindowDC
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxMemoryDC_ctor());
    }

    public this(DC dc)
    {
        this(wxMemoryDC_ctorByDC(wxObject.SafePtr(dc)));
    }

    //---------------------------------------------------------------------

    public проц SelectObject(Битмап битмап)
    {
        wxMemoryDC_SelectObject(wxobj, wxObject.SafePtr(битмап));
    }

    //---------------------------------------------------------------------
}

//! \cond EXTERN
static extern (C) ЦелУкз wxBufferedDC_ctor();
static extern (C) ЦелУкз wxBufferedDC_ctorByBitmap(ЦелУкз dc, ЦелУкз buffer);
static extern (C) ЦелУкз wxBufferedDC_ctorBySize(ЦелУкз dc, inout Размер area);

static extern (C) проц   wxBufferedDC_InitByBitmap(ЦелУкз сам, ЦелУкз dc, ЦелУкз битмап);
static extern (C) проц   wxBufferedDC_InitBySize(ЦелУкз сам, ЦелУкз dc, inout Размер area);
static extern (C) проц   wxBufferedDC_UnMask(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias BufferedDC wxBufferedDC;
public class BufferedDC : MemoryDC
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
        this(wxBufferedDC_ctor(), да);
    }

    public this(DC dc, Битмап битмап)
    {
        this(wxBufferedDC_ctorByBitmap(wxObject.SafePtr(dc), wxObject.SafePtr(битмап)), да);
    }

    public this(DC dc, Размер Размер)
    {
        this(wxBufferedDC_ctorBySize(wxObject.SafePtr(dc), Размер), да);
    }

    //---------------------------------------------------------------------

    public проц InitByBitmap(DC dc, Битмап битмап)
    {
        wxBufferedDC_InitByBitmap(wxobj, wxObject.SafePtr(dc), wxObject.SafePtr(битмап));
    }

    public проц InitBySize(DC dc, Размер area)
    {
        wxBufferedDC_InitBySize(wxobj, wxObject.SafePtr(dc), area);
    }

    //---------------------------------------------------------------------

    public проц UnMask()
    {
        wxBufferedDC_UnMask(wxobj);
    }

    //---------------------------------------------------------------------
}

//! \cond EXTERN
static extern (C) ЦелУкз wxBufferedPaintDC_ctor(ЦелУкз окно, ЦелУкз buffer);
//! \endcond

//---------------------------------------------------------------------

alias BufferedPaintDC wxBufferedPaintDC;
public class BufferedPaintDC : BufferedDC
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

    public this(Окно окно, Битмап buffer)
    {
        this(wxBufferedPaintDC_ctor(wxObject.SafePtr(окно), wxObject.SafePtr(buffer)), да);
    }

    //---------------------------------------------------------------------
}

