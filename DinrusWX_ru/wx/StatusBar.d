//-----------------------------------------------------------------------------
// wxD - statusbr.h
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - statusbr.h
//
/// The wxStatusBar wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StatusBar.d,v 1.11 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.StatusBar;
public import wx.common;
public import wx.Window;


public const цел wxST_SIZEGRIP         = 0x0010;
public const цел wxST_NO_AUTORESIZE    = 0x0001;

public const цел wxSB_NORMAL	= 0x000;
public const цел wxSB_FLAT	= 0x001;
public const цел wxSB_RAISED	= 0x002;

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxStatusBar_ctor();
static extern (C) бул   wxStatusBar_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, бцел стиль, ткст имя);

static extern (C) проц   wxStatusBar_SetFieldsCount(ЦелУкз сам, цел number, цел* widths);
static extern (C) бул   wxStatusBar_GetFieldRect(ЦелУкз сам, цел i, inout Прямоугольник прям);
static extern (C) цел    wxStatusBar_GetBorderY(ЦелУкз сам);
static extern (C) ЦелУкз wxStatusBar_GetStatusText(ЦелУкз сам, цел number);
static extern (C) цел    wxStatusBar_GetBorderX(ЦелУкз сам);
static extern (C) проц   wxStatusBar_SetStatusText(ЦелУкз сам, ткст текст, цел number);
static extern (C) проц   wxStatusBar_SetStatusWidths(ЦелУкз сам, цел n, цел* widths);

static extern (C) цел    wxStatusBar_GetFieldsCount(ЦелУкз сам);
static extern (C) проц   wxStatusBar_PopStatusText(ЦелУкз сам, цел field);
static extern (C) проц   wxStatusBar_PushStatusText(ЦелУкз сам, ткст xstring, цел field);
static extern (C) проц   wxStatusBar_SetMinHeight(ЦелУкз сам, цел высь);
static extern (C) проц   wxStatusBar_SetStatusStyles(ЦелУкз сам, цел n, цел* styles);
//! \endcond

//-----------------------------------------------------------------------------

alias StatusBar wxStatusBar;
public class StatusBar : Окно
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxStatusBar_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, цел стиль = wxST_SIZEGRIP, ткст имя="")
    {
        this();
        if (!создай(родитель, ид, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать StatusBar");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, цел стиль = wxST_SIZEGRIP, ткст имя="")
    {
        this(родитель, Окно.УникИД, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, цел стиль, ткст имя)
    {
        return wxStatusBar_Create(wxobj, wxObject.SafePtr(родитель), ид, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public проц УстFieldsCount(цел number, цел[] widths)
    {
        wxStatusBar_SetFieldsCount(wxobj, number, widths.ptr);
    }

    public цел FieldsCount()
    {
        return wxStatusBar_GetFieldsCount(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел BorderY()
    {
        return wxStatusBar_GetBorderY(wxobj);
    }

    public цел BorderX()
    {
        return wxStatusBar_GetBorderX(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул GetFieldRect(цел i, inout Прямоугольник прям)
    {
        return wxStatusBar_GetFieldRect(wxobj, i, прям);
    }

    //-----------------------------------------------------------------------------

    public проц StatusText(ткст значение)
    {
        УстStatusText(значение);
    }
    public ткст StatusText()
    {
        return GetStatusText(0);
    }

    public проц УстStatusText(ткст текст)
    {
        УстStatusText(текст, 0);
    }

    public проц УстStatusText(ткст текст, цел number)
    {
        wxStatusBar_SetStatusText(wxobj, текст, number);
    }

    public ткст GetStatusText(цел number)
    {
        return cast(ткст) new wxString(wxStatusBar_GetStatusText(wxobj, number), да);
    }

    //-----------------------------------------------------------------------------

    public проц StatusWidths(цел[] значение)
    {
        УстStatusWidths(значение.length, значение.ptr);
    }

    public проц УстStatusWidths(цел n, цел* widths)
    {
        wxStatusBar_SetStatusWidths(wxobj, n, widths);
    }

    //-----------------------------------------------------------------------------

    public проц PopStatusText()
    {
        PopStatusText(0);
    }

    public проц PopStatusText(цел field)
    {
        wxStatusBar_PopStatusText(wxobj, field);
    }

    //-----------------------------------------------------------------------------

    public проц PushStatusText(ткст xstring)
    {
        PushStatusText(xstring, 0);
    }

    public проц PushStatusText(ткст xstring, цел field)
    {
        wxStatusBar_PushStatusText(wxobj, xstring, field);
    }

    //-----------------------------------------------------------------------------

    public проц МинВысь(цел значение)
    {
        wxStatusBar_SetMinHeight(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц StatusStyles(цел[] значение)
    {
        wxStatusBar_SetStatusStyles(wxobj, значение.length, значение.ptr);
    }

}

