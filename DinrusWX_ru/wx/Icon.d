//-----------------------------------------------------------------------------
// wxD - Пиктограмма.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Пиктограмма.cs
//
/// The wxIcon wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Пиктограмма.d,v 1.12 2008/07/29 06:53:22 afb Exp $
//-----------------------------------------------------------------------------

module wx.Icon;
public import wx.common;
public import wx.Bitmap;
private import stdrus;


//! \cond EXTERN
static extern (C) ЦелУкз wxIcon_ctor();
static extern (C) проц   wxIcon_CopyFromBitmap(ЦелУкз сам, ЦелУкз битмап);
static extern (C) бул   wxIcon_LoadFile(ЦелУкз сам, ткст имя, BitmapType тип);
//! \endcond

//---------------------------------------------------------------------

alias Пиктограмма wxIcon;
public class Пиктограмма : Битмап
{
    public static Пиктограмма wxNullIcon;
    public this(ткст имя)
    {
        this();
        Рисунок img = new Рисунок();
        if (!img.ЗагрузиФайл(имя))
            throw new ArgumentException("файл '" ~ вЮ8(имя) ~ "' не найден");

        Битмап bmp = new Битмап(img);
        wxIcon_CopyFromBitmap(wxobj, bmp.wxobj);
    }

    public this(ткст имя, BitmapType тип)
    {
        this();
//			if (тип == BitmapType.wxBITMAP_TYPE_RESOURCE)
//			else
        if (!wxIcon_LoadFile(wxobj, имя, тип))
            throw new ArgumentException("файл '" ~ вЮ8(имя) ~ "' не загружается");
    }

    public this()
    {
        super(wxIcon_ctor());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //---------------------------------------------------------------------

    public проц CopyFromBitmap(Битмап битмап)
    {
        wxIcon_CopyFromBitmap(wxobj, wxObject.SafePtr(битмап));
    }

    //---------------------------------------------------------------------
}
