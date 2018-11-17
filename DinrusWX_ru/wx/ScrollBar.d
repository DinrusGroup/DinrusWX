//-----------------------------------------------------------------------------
// wxD - ScrollBar.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ScrollBar.cs
//
/// The wxScrollBar wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ScrollBar.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.ScrollBar;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
static extern (C) ЦелУкз wxScrollBar_ctor();
static extern (C) бул   wxScrollBar_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ЦелУкз оценщик, ткст имя);
static extern (C) цел    wxScrollBar_GetThumbPosition(ЦелУкз сам);
static extern (C) цел    wxScrollBar_GetThumbSize(ЦелУкз сам);
static extern (C) цел    wxScrollBar_GetPageSize(ЦелУкз сам);
static extern (C) цел    wxScrollBar_GetRange(ЦелУкз сам);
static extern (C) бул   wxScrollBar_IsVertical(ЦелУкз сам);
static extern (C) проц   wxScrollBar_SetThumbPosition(ЦелУкз сам, цел viewStart);
static extern (C) проц   wxScrollBar_SetScrollbar(ЦелУкз сам, цел position, цел размТумб, цел диапазон, цел pageSize, бул освежи);
//! \endcond

//-----------------------------------------------------------------------------

alias ScrollBar wxScrollBar;
public class ScrollBar : Control
{
    enum
    {
        wxSB_HORIZONTAL   = Ориентация.wxHORIZONTAL,
        wxSB_VERTICAL     = Ориентация.wxVERTICAL,
    }

    public const ткст wxScrollBarNameStr = "scrollBar";
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxScrollBar_ctor());
    }

    public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSB_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxScrollBarNameStr)
    {
        super (wxScrollBar_ctor() );
        if (!создай(родитель, ид, поз, Размер, стиль, оценщик, имя))
        {
            throw new InvalidOperationException("Не удалось создать ScrollBar");
        }
    }

    public static wxObject Нов(ЦелУкз wxobj)
    {
        return new ScrollBar(wxobj);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxSB_HORIZONTAL, Оценщик оценщик = null, ткст имя = wxScrollBarNameStr)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, оценщик, имя);
    }

    //-----------------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxScrollBar_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, wxObject.SafePtr(оценщик), имя);
    }

    //-----------------------------------------------------------------------------

    public цел ThumbPosition()
    {
        return wxScrollBar_GetThumbPosition(wxobj);
    }
    public проц ThumbPosition(цел значение)
    {
        wxScrollBar_SetThumbPosition(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел ThumbSize()
    {
        return wxScrollBar_GetThumbSize(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел PageSize()
    {
        return wxScrollBar_GetPageSize(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел Range()
    {
        return wxScrollBar_GetRange(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул вертикален()
    {
        return wxScrollBar_IsVertical(wxobj);
    }

    //-----------------------------------------------------------------------------

    public override проц УстСкроллбар(цел position, цел размТумб, цел диапазон, цел pageSize, бул освежи)
    {
        wxScrollBar_SetScrollbar(wxobj, position, размТумб, диапазон, pageSize, освежи);
    }
}
