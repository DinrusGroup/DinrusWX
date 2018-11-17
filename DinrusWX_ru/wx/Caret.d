//-----------------------------------------------------------------------------
// wxD - Каретка.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Каретка.cs
//
/// The wxCaret wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Каретка.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Caret;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
static extern (C) ЦелУкз wxCaret_ctor();
static extern (C) проц wxCaret_dtor(ЦелУкз сам);
static extern (C) бул wxCaret_Create(ЦелУкз сам, ЦелУкз окно, цел ширь, цел высь);
static extern (C) бул wxCaret_IsOk(ЦелУкз сам);
static extern (C) бул wxCaret_IsVisible(ЦелУкз сам);
static extern (C) проц wxCaret_GetPosition(ЦелУкз сам, out цел x, out цел y);
static extern (C) проц wxCaret_GetSize(ЦелУкз сам, out цел ширь, out цел высь);
static extern (C) ЦелУкз wxCaret_GetWindow(ЦелУкз сам);
static extern (C) проц wxCaret_SetSize(ЦелУкз сам, цел ширь, цел высь);
static extern (C) проц wxCaret_Move(ЦелУкз сам, цел x, цел y);
static extern (C) проц wxCaret_Show(ЦелУкз сам, бул покажи);
static extern (C) проц wxCaret_Hide(ЦелУкз сам);
static extern (C) цел wxCaret_GetBlinkTime();
static extern (C) проц wxCaret_SetBlinkTime(цел milliseconds);
//! \endcond

//---------------------------------------------------------------------

alias Каретка wxCaret;
public class Каретка : wxObject
{
    public this()
    {
        this(wxCaret_ctor(), да);
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

    public this(Окно ок, Размер рм)
    {
        this(ок, рм.Ширь, рм.Высь);
    }

    public this(Окно окно, цел ширь, цел высь)
    {
        this(wxCaret_ctor(), да);
        if (!wxCaret_Create(wxobj, wxObject.SafePtr(окно), ширь, высь))
        {
            throw new InvalidOperationException("Не удалось создать Каретку");
        }
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxCaret_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    public бул создай(Окно окно, цел ширь, цел высь)
    {
        return wxCaret_Create(wxobj, wxObject.SafePtr(окно), ширь, высь);
    }

    //---------------------------------------------------------------------

    public бул Ок()
    {
        return wxCaret_IsOk(wxobj);
    }

    public бул Виден()
    {
        return wxCaret_IsVisible(wxobj);
    }

    //---------------------------------------------------------------------

    public Точка Позиция()
    {
        Точка точка;
        wxCaret_GetPosition(wxobj, точка.X, точка.Y);
        return точка;
    }
    public проц Позиция(Точка значение)
    {
        wxCaret_Move(wxobj, значение.X, значение.Y);
    }

    //---------------------------------------------------------------------

    public Размер размер()
    {
        Размер рм;
        wxCaret_GetSize(wxobj, рм.Ширь, рм.Высь);
        return рм;
    }
    public проц размер(Размер значение)
    {
        wxCaret_SetSize(wxobj, значение.Ширь, значение.Высь);
    }

    //---------------------------------------------------------------------

    public Окно окно()
    {
        return cast(Окно)НайдиОбъект(wxCaret_GetWindow(wxobj));
    }

    //---------------------------------------------------------------------

    public проц Покажи(бул покажи)
    {
        wxCaret_Show(wxobj, покажи);
    }

    public проц Спрячь()
    {
        wxCaret_Hide(wxobj);
    }

    //---------------------------------------------------------------------

    static цел ВремяМигания()
    {
        return wxCaret_GetBlinkTime();
    }
    static проц ВремяМигания(цел значение)
    {
        wxCaret_SetBlinkTime(значение);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new Каретка(ptr);
    }
    //---------------------------------------------------------------------
}

//! \cond EXTERN
static extern (C) ЦелУкз wxCaretSuspend_ctor(ЦелУкз win);
static extern (C) проц wxCaretSuspend_dtor(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias CaretSuspend wxCaretSuspend;
public class CaretSuspend : wxObject
{
    public this(Окно win)
    {
        this(wxCaretSuspend_ctor(wxObject.SafePtr(win)), да);
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
        wxCaretSuspend_dtor(wxobj);
    }
}
