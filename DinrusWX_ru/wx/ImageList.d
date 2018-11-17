//-----------------------------------------------------------------------------
// wxD - ImageList.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ImageList.cs
//
/// The wxImageList wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ImageList.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.ImageList;
public import wx.common;
public import wx.Bitmap;
public import wx.DC;

// Flag values for Уст/GetImageList
enum
{
    wxIMAGE_LIST_NORMAL, // Normal icons
    wxIMAGE_LIST_SMALL,  // Small icons
    wxIMAGE_LIST_STATE   // State icons: unimplemented (see WIN32 documentation)
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxImageList_ctor(цел ширь, цел высь, бул маска, цел initialCount);
static extern (C) ЦелУкз wxImageList_ctor2();
static extern (C) цел    wxImageList_AddBitmap1(ЦелУкз сам, ЦелУкз bmp, ЦелУкз маска);
static extern (C) цел    wxImageList_AddBitmap(ЦелУкз сам, ЦелУкз bmp, ЦелУкз maskColour);
static extern (C) цел    wxImageList_AddIcon(ЦелУкз сам, ЦелУкз пиктограмма);
static extern (C) цел    wxImageList_GetImageCount(ЦелУкз сам);

static extern (C) бул   wxImageList_Draw(ЦелУкз сам, цел index, ЦелУкз dc, цел x, цел y, цел флаги, бул solidBackground);

static extern (C) бул   wxImageList_Create(ЦелУкз сам, цел ширь, цел высь, бул маска, цел initialCount);

static extern (C) бул   wxImageList_Replace(ЦелУкз сам, цел index, ЦелУкз битмап);

static extern (C) бул   wxImageList_Remove(ЦелУкз сам, цел index);
static extern (C) бул   wxImageList_RemoveAll(ЦелУкз сам);

//static extern (C) ЦелУкз wxImageList_GetBitmap(ЦелУкз сам, цел index);

static extern (C) бул   wxImageList_GetSize(ЦелУкз сам, цел index, inout цел ширь, inout цел высь);
//! \endcond

//---------------------------------------------------------------------

alias ImageList wxImageList;
public class ImageList : wxObject
{
    public const цел wxIMAGELIST_DRAW_NORMAL	= 0x0001;
    public const цел wxIMAGELIST_DRAW_TRANSPARENT	= 0x0002;
    public const цел wxIMAGELIST_DRAW_SELECTED	= 0x0004;
    public const цел wxIMAGELIST_DRAW_FOCUSED	= 0x0008;

    //---------------------------------------------------------------------

    public this(цел ширь, цел высь, бул маска = да, цел initialCount=1)
    {
        super(wxImageList_ctor(ширь, высь, маска, initialCount));
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxImageList_ctor2());
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new ImageList(ptr);
    }
    //---------------------------------------------------------------------

    public цел Добавь(Битмап битмап)
    {
        return wxImageList_AddBitmap1(wxobj, wxObject.SafePtr(битмап), ЦелУкз.init);
    }

    public цел Добавь(Битмап битмап, Битмап маска)
    {
        return wxImageList_AddBitmap1(wxobj, wxObject.SafePtr(битмап), wxObject.SafePtr(маска));
    }

    public цел Добавь(Пиктограмма пиктограмма)
    {
        return wxImageList_AddIcon(wxobj, wxObject.SafePtr(пиктограмма));
    }

    public цел Добавь(Битмап bmp, Цвет maskColour)
    {
        return wxImageList_AddBitmap(wxobj, wxObject.SafePtr(bmp), wxObject.SafePtr(maskColour));
    }

    //---------------------------------------------------------------------

    public бул создай(цел ширь, цел высь)
    {
        return создай(ширь, высь, да, 1);
    }

    public бул создай(цел ширь, цел высь, бул маска)
    {
        return создай(ширь, высь, маска, 1);
    }

    public бул создай(цел ширь, цел высь, бул маска, цел initialCount)
    {
        return wxImageList_Create(wxobj, ширь, высь, маска, initialCount);
    }

    //---------------------------------------------------------------------

    public цел ImageCount()
    {
        return wxImageList_GetImageCount(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Draw(цел index, DC dc, цел x, цел y)
    {
        return Draw(index, dc, x, y, wxIMAGELIST_DRAW_NORMAL, false);
    }

    public бул Draw(цел index, DC dc, цел x, цел y, цел флаги)
    {
        return Draw(index, dc, x, y, флаги, false);
    }

    public бул Draw(цел index, DC dc, цел x, цел y, цел флаги, бул solidBackground)
    {
        return wxImageList_Draw(wxobj, index, wxObject.SafePtr(dc), x, y, флаги, solidBackground);
    }

    //---------------------------------------------------------------------

    public бул Replace(цел index, Битмап битмап)
    {
        return wxImageList_Replace(wxobj, index, wxObject.SafePtr(битмап));
    }

    //---------------------------------------------------------------------

    public бул Удали(цел index)
    {
        return wxImageList_Remove(wxobj, index);
    }

    //---------------------------------------------------------------------

    public бул RemoveAll()
    {
        return wxImageList_RemoveAll(wxobj);
    }

    //---------------------------------------------------------------------

    /*public Битмап ДайБитмап(цел index)
    {
    	return cast(Битмап)НайдиОбъект(wxImageList_GetBitmap(wxobj, index), &Битмап.Нов);
    }*/

    //---------------------------------------------------------------------

    public бул GetSize(цел index, inout цел ширь, inout цел высь)
    {
        return wxImageList_GetSize(wxobj, index, ширь, высь);
    }
}
