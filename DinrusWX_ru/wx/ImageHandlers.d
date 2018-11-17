//-----------------------------------------------------------------------------
// wxD - ImageHandlers.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ImageHandlers.cs
//
/// The wxImageHandlers wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ImageHandlers.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ImageHandlers;
public import wx.common;
public import wx.Image;

//! \cond EXTERN
public static extern (C) ЦелУкз BMPHandler_ctor();
public static extern (C) ЦелУкз ICOHandler_ctor();
public static extern (C) ЦелУкз CURHandler_ctor();
public static extern (C) ЦелУкз ANIHandler_ctor();
public static extern (C) ЦелУкз GIFHandler_ctor();
public static extern (C) ЦелУкз PNGHandler_ctor();
public static extern (C) ЦелУкз PCXHandler_ctor();
public static extern (C) ЦелУкз JPEGHandler_ctor();
public static extern (C) ЦелУкз XPMHandler_ctor();
public static extern (C) ЦелУкз PNMHandler_ctor();
public static extern (C) ЦелУкз TIFFHandler_ctor();
//! \endcond



alias BMPHandler wxBMPHandler;
public class BMPHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(BMPHandler_ctor());
    }
}

alias ICOHandler wxICOHandler;
public class ICOHandler : BMPHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(ICOHandler_ctor());
    }
}

alias CURHandler wxCURHandler;
public class CURHandler : ICOHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(CURHandler_ctor());
    }
}

alias ANIHandler wxANIHandler;
public class ANIHandler : CURHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(ANIHandler_ctor());
    }
}

alias PNGHandler wxPNGHandler;
public class PNGHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(PNGHandler_ctor());
    }
}

alias GIFHandler wxGIFHandler;
public class GIFHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(GIFHandler_ctor());
    }
}

alias PCXHandler wxPCXHandler;
public class PCXHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(PCXHandler_ctor());
    }
}

alias JPEGHandler wxJPEGHandler;
public class JPEGHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(JPEGHandler_ctor());
    }
}


alias PNMHandler wxPNMHandler;
public class PNMHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(PNMHandler_ctor());
    }
}

alias XPMHandler wxXPMHandler;
public class XPMHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(XPMHandler_ctor());
    }
}

alias TIFFHandler wxTIFFHandler;
public class TIFFHandler : ImageHandler
{
    public this(ЦелУкз ptr)
    {
        super(ptr);
    }

    public this()
    {
        super(TIFFHandler_ctor());
    }
}
