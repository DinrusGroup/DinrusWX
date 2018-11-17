//-----------------------------------------------------------------------------
// wxD - КалендарьКтрл.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - КалендарьКтрл.cs
//
/// The wxCalendarCtrl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: КалендарьКтрл.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.CalendarCtrl;
public import wx.common;
public import wx.wxDateTime;
public import wx.Colour;
public import wx.Font;
public import wx.Control;
public import wx.CommandEvent;

public enum ПРезТестаНажатияКалендаря
{
    wxCAL_HITTEST_NOWHERE,
    wxCAL_HITTEST_HEADER,
    wxCAL_HITTEST_DAY,
    wxCAL_HITTEST_INCMONTH,
    wxCAL_HITTEST_DECMONTH,
    wxCAL_HITTEST_SURROUNDING_WEEK
}

public enum ПБордюрКалендарнойДаты
{
    wxCAL_BORDER_NONE,
    wxCAL_BORDER_SQUARE,
    wxCAL_BORDER_ROUND
}

//! \cond EXTERN
static extern (C) ЦелУкз wxCalendarCtrl_ctor();
static extern (C) бул   wxCalendarCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз дата, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) бул   wxCalendarCtrl_SetDate(ЦелУкз сам, ЦелУкз дата);
static extern (C) ЦелУкз wxCalendarCtrl_GetDate(ЦелУкз сам);
static extern (C) бул   wxCalendarCtrl_SetLowerDateLimit(ЦелУкз сам, ЦелУкз дата);
static extern (C) ЦелУкз wxCalendarCtrl_GetLowerDateLimit(ЦелУкз сам);
static extern (C) бул   wxCalendarCtrl_SetUpperDateLimit(ЦелУкз сам, ЦелУкз дата);
static extern (C) ЦелУкз wxCalendarCtrl_GetUpperDateLimit(ЦелУкз сам);
static extern (C) бул   wxCalendarCtrl_SetDateRange(ЦелУкз сам, ЦелУкз lowerdate, ЦелУкз upperdate);
static extern (C) проц   wxCalendarCtrl_EnableYearChange(ЦелУкз сам, бул вкл);
static extern (C) проц   wxCalendarCtrl_EnableMonthChange(ЦелУкз сам, бул вкл);
static extern (C) проц   wxCalendarCtrl_EnableHolidayDisplay(ЦелУкз сам, бул display);
static extern (C) проц   wxCalendarCtrl_SetHeaderColours(ЦелУкз сам, ЦелУкз цветПП, ЦелУкз цветЗП);
static extern (C) ЦелУкз wxCalendarCtrl_GetHeaderColourFg(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarCtrl_GetHeaderColourBg(ЦелУкз сам);
static extern (C) проц   wxCalendarCtrl_SetHighlightColours(ЦелУкз сам, ЦелУкз цветПП, ЦелУкз цветЗП);
static extern (C) ЦелУкз wxCalendarCtrl_GetHighlightColourFg(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarCtrl_GetHighlightColourBg(ЦелУкз сам);
static extern (C) проц   wxCalendarCtrl_SetHolidayColours(ЦелУкз сам, ЦелУкз цветПП, ЦелУкз цветЗП);
static extern (C) ЦелУкз wxCalendarCtrl_GetHolidayColourFg(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarCtrl_GetHolidayColourBg(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarCtrl_GetAttr(ЦелУкз сам, цел day);
static extern (C) проц   wxCalendarCtrl_SetAttr(ЦелУкз сам, цел day, ЦелУкз attr);
static extern (C) проц   wxCalendarCtrl_SetHoliday(ЦелУкз сам, цел day);
static extern (C) проц   wxCalendarCtrl_ResetAttr(ЦелУкз сам, цел day);
static extern (C) цел    wxCalendarCtrl_HitTest(ЦелУкз сам, inout Точка поз, ЦелУкз дата, inout ДеньНед wd);
//! \endcond

//-----------------------------------------------------------------------------

alias КалендарьКтрл wxCalendarCtrl;
public class КалендарьКтрл : Control
{
    enum
    {
        // покажи Sunday as the first day of the week (default)
        wxCAL_SUNDAY_FIRST               = 0x0000,

        // покажи Monday as the first day of the week
        wxCAL_MONDAY_FIRST               = 0x0001,

        // highlight holidays
        wxCAL_SHOW_HOLIDAYS              = 0x0002,

        // disable the year change control, покажи only the month change one
        wxCAL_NO_YEAR_CHANGE             = 0x0004,

        // don't allow changing neither month nor year (implies
        // wxCAL_NO_YEAR_CHANGE)
        wxCAL_NO_MONTH_CHANGE            = 0x000c,

        // use MS-стиль month-selection instead of combo-spin combination
        wxCAL_SEQUENTIAL_MONTH_SELECTION = 0x0010,

        // покажи the neighbouring weeks in the previous and next month
        wxCAL_SHOW_SURROUNDING_WEEKS     = 0x0020
    }

    public const ткст вхСтрИмяКалендаря  = "КалендарьКтрл";
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this(wxCalendarCtrl_ctor());
    }

    public this(Окно родитель, цел ид, wxDateTime дата = null /*wxDefaultDateTime*/, Точка поз = вхДефПоз, Размер Размер =вхДефРазм, цел стиль = wxCAL_SHOW_HOLIDAYS | wxWANTS_CHARS, ткст имя = вхСтрИмяКалендаря)
    {
        this(wxCalendarCtrl_ctor());
        if (!создай(родитель, ид, дата, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать КалендарьКтрл");
        }
    }

    //-----------------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, ДатаВремя дата = null, Точка поз = вхДефПоз, Размер Размер =вхДефРазм, цел стиль = wxCAL_SHOW_HOLIDAYS | wxWANTS_CHARS, ткст имя = вхСтрИмяКалендаря)
    {
        this(родитель, Окно.УникИД, дата, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public бул создай(Окно родитель, цел ид, wxDateTime дата, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxCalendarCtrl_Create(wxobj, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(дата), поз, Размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public проц Дата(ДатаВремя значение)
    {
        wxCalendarCtrl_SetDate(wxobj, wxObject.SafePtr(cast(wxDateTime)значение));
    }
    public ДатаВремя Дата()
    {
        return new wxDateTime(wxCalendarCtrl_GetDate(wxobj));
    }

    //-----------------------------------------------------------------------------

    public проц НижнийПределДаты(ДатаВремя значение)
    {
        wxCalendarCtrl_SetLowerDateLimit(wxobj, wxObject.SafePtr(cast(wxDateTime)значение));
    }
    public ДатаВремя НижнийПределДаты()
    {
        return new wxDateTime(wxCalendarCtrl_GetLowerDateLimit(wxobj));
    }

    public проц ВерхнийПределДаты(ДатаВремя значение)
    {
        wxCalendarCtrl_SetUpperDateLimit(wxobj, wxObject.SafePtr(cast(wxDateTime)значение));
    }
    public ДатаВремя ВерхнийПределДаты()
    {
        return new wxDateTime(wxCalendarCtrl_GetUpperDateLimit(wxobj));
    }

    //-----------------------------------------------------------------------------

    public бул УстДиапазонДат(ДатаВремя lowerdate, ДатаВремя upperdate)
    {
        return wxCalendarCtrl_SetDateRange(wxobj, wxObject.SafePtr(cast(wxDateTime)lowerdate), wxObject.SafePtr(cast(wxDateTime)upperdate));
    }

    //-----------------------------------------------------------------------------

    public проц ВклСменуГода(бул значение)
    {
        wxCalendarCtrl_EnableYearChange(wxobj, значение);
    }

    public проц ВклСменуМесяца(бул значение)
    {
        wxCalendarCtrl_EnableMonthChange(wxobj, значение);
    }

    public проц ВклПоказПраздников(бул значение)
    {
        wxCalendarCtrl_EnableHolidayDisplay(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц УстЦветаЗаголовка(Цвет цветПП, Цвет цветЗП)
    {
        wxCalendarCtrl_SetHeaderColours(wxobj, wxObject.SafePtr(цветПП), wxObject.SafePtr(цветЗП));
    }

    public Цвет ЦветЗаголовкаПП()
    {
        return new Цвет(wxCalendarCtrl_GetHeaderColourFg(wxobj), да);
    }

    public Цвет ЦветЗаголовкаЗП()
    {
        return new Цвет(wxCalendarCtrl_GetHeaderColourBg(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public проц УстЦветаПодсветки(Цвет цветПП, Цвет цветЗП)
    {
        wxCalendarCtrl_SetHighlightColours(wxobj, wxObject.SafePtr(цветПП), wxObject.SafePtr(цветЗП));
    }

    public Цвет ЦветПодсветкиПП()
    {
        return new Цвет(wxCalendarCtrl_GetHighlightColourFg(wxobj));
    }

    public Цвет ЦветПодсветкиЗП()
    {
        return new Цвет(wxCalendarCtrl_GetHighlightColourBg(wxobj));
    }

    //-----------------------------------------------------------------------------

    public проц УстЦветаПраздников(Цвет цветПП, Цвет цветЗП)
    {
        wxCalendarCtrl_SetHolidayColours(wxobj, wxObject.SafePtr(цветПП), wxObject.SafePtr(цветЗП));
    }

    public Цвет ЦветПраздниковПП()
    {
        return new Цвет(wxCalendarCtrl_GetHolidayColourFg(wxobj));
    }

    public Цвет ЦветПраздниковЗП()
    {
        return new Цвет(wxCalendarCtrl_GetHolidayColourBg(wxobj));
    }

    //-----------------------------------------------------------------------------

    public АтрДатыКалендаря ДайАтр(цел day)
    {
        return cast(АтрДатыКалендаря)НайдиОбъект(wxCalendarCtrl_GetAttr(wxobj, day), &АтрДатыКалендаря.Нов);
    }

    public проц УстАтр(цел day, АтрДатыКалендаря attr)
    {
        wxCalendarCtrl_SetAttr(wxobj, day, wxObject.SafePtr(attr));
    }

    //-----------------------------------------------------------------------------

    public проц УстПраздник(цел day)
    {
        wxCalendarCtrl_SetHoliday(wxobj, day);
    }

    //-----------------------------------------------------------------------------

    public проц СбросьАтр(цел day)
    {
        wxCalendarCtrl_ResetAttr(wxobj, day);
    }

    //-----------------------------------------------------------------------------

    public ПРезТестаНажатияКалендаря ТестНажатия(Точка поз, inout ДатаВремя дата, inout ДеньНед wd)
    {
        wxDateTime dt = дата;
        ПРезТестаНажатияКалендаря res = cast(ПРезТестаНажатияКалендаря)wxCalendarCtrl_HitTest(wxobj, поз, wxObject.SafePtr(dt), wd);
        дата = dt;

        return res;
    }

    //-----------------------------------------------------------------------------

    public проц SelectionChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_SEL_CHANGED, ИД, значение, this);
    }
    public проц SelectionChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц DayChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_DAY_CHANGED, ИД, значение, this);
    }
    public проц DayChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц MonthChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_MONTH_CHANGED, ИД, значение, this);
    }
    public проц MonthChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц YearChange_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_YEAR_CHANGED, ИД, значение, this);
    }
    public проц YearChange_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц DoubleClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_DOUBLECLICKED, ИД, значение, this);
    }
    public проц DoubleClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }

    public проц WeekdayClick_Add(ДатчикСобытий значение)
    {
        AddCommandListener(Событие.wxEVT_CALENDAR_WEEKDAY_CLICKED, ИД, значение, this);
    }
    public проц WeekdayClick_Remove(ДатчикСобытий значение)
    {
        RemoveHandler(значение, this);
    }
}

//! \cond EXTERN
static extern (C) ЦелУкз wxCalendarDateAttr_ctor();
static extern (C) ЦелУкз wxCalendarDateAttr_ctor2(ЦелУкз colText, ЦелУкз colBack, ЦелУкз colBorder, ЦелУкз шрифт, ПБордюрКалендарнойДаты бордюр);
static extern (C) ЦелУкз wxCalendarDateAttr_ctor3(ПБордюрКалендарнойДаты бордюр, ЦелУкз colBorder);
static extern (C) проц   wxCalendarDateAttr_dtor(ЦелУкз сам);
static extern (C) проц   wxCalendarDateAttr_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxCalendarDateAttr_SetTextColour(ЦелУкз сам, ЦелУкз colText);
static extern (C) проц   wxCalendarDateAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз colBack);
static extern (C) проц   wxCalendarDateAttr_SetBorderColour(ЦелУкз сам, ЦелУкз col);
static extern (C) проц   wxCalendarDateAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
static extern (C) проц   wxCalendarDateAttr_SetBorder(ЦелУкз сам, цел бордюр);
static extern (C) проц   wxCalendarDateAttr_SetHoliday(ЦелУкз сам, бул holiday);
static extern (C) бул   wxCalendarDateAttr_HasTextColour(ЦелУкз сам);
static extern (C) бул   wxCalendarDateAttr_HasBackgroundColour(ЦелУкз сам);
static extern (C) бул   wxCalendarDateAttr_HasBorderColour(ЦелУкз сам);
static extern (C) бул   wxCalendarDateAttr_HasFont(ЦелУкз сам);
static extern (C) бул   wxCalendarDateAttr_HasBorder(ЦелУкз сам);
static extern (C) бул   wxCalendarDateAttr_IsHoliday(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarDateAttr_GetTextColour(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarDateAttr_GetBackgroundColour(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarDateAttr_GetBorderColour(ЦелУкз сам);
static extern (C) ЦелУкз wxCalendarDateAttr_GetFont(ЦелУкз сам);
static extern (C) цел    wxCalendarDateAttr_GetBorder(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias АтрДатыКалендаря wxCalendarDateAttr;
public class АтрДатыКалендаря : wxObject
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
        this(wxCalendarDateAttr_ctor(), да);
        wxCalendarDateAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public this(Цвет colText, Цвет colBack = Цвет.wxNullColour, Цвет colBorder = Цвет.wxNullColour, Шрифт шрифт = Шрифт.wxNullFont, ПБордюрКалендарнойДаты бордюр = ПБордюрКалендарнойДаты.wxCAL_BORDER_NONE)
    {
        this(wxCalendarDateAttr_ctor2(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(colBorder), wxObject.SafePtr(шрифт), бордюр),да);
        wxCalendarDateAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public  this(ПБордюрКалендарнойДаты бордюр, Цвет colBorder)
    {
        this(wxCalendarDateAttr_ctor3(бордюр, wxObject.SafePtr(colBorder)),да);
        wxCalendarDateAttr_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxCalendarDateAttr_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц цветТекста(Цвет значение)
    {
        wxCalendarDateAttr_SetTextColour(wxobj, wxObject.SafePtr(значение));
    }
    public Цвет цветТекста()
    {
        return new Цвет(wxCalendarDateAttr_GetTextColour(wxobj));
    }

    //-----------------------------------------------------------------------------

    public проц цветФона(Цвет значение)
    {
        wxCalendarDateAttr_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }
    public Цвет цветФона()
    {
        return new Цвет(wxCalendarDateAttr_GetBackgroundColour(wxobj));
    }

    //-----------------------------------------------------------------------------

    public проц ЦветБордюра(Цвет значение)
    {
        wxCalendarDateAttr_SetBorderColour(wxobj, wxObject.SafePtr(значение));
    }
    public Цвет ЦветБордюра()
    {
        return new Цвет(wxCalendarDateAttr_GetBorderColour(wxobj));
    }

    //-----------------------------------------------------------------------------

    public проц шрифт(Шрифт значение)
    {
        wxCalendarDateAttr_SetFont(wxobj, wxObject.SafePtr(значение));
    }
    public Шрифт шрифт()
    {
        return new Шрифт(wxCalendarDateAttr_GetFont(wxobj));
    }

    //-----------------------------------------------------------------------------

    public проц ПБордюр(ПБордюрКалендарнойДаты значение)
    {
        wxCalendarDateAttr_SetBorder(wxobj, cast(цел)значение);
    }
    public ПБордюрКалендарнойДаты ПБордюр()
    {
        return cast(ПБордюрКалендарнойДаты)wxCalendarDateAttr_GetBorder(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Праздник(бул значение)
    {
        wxCalendarDateAttr_SetHoliday(wxobj, значение);
    }
    public бул Праздник()
    {
        return wxCalendarDateAttr_IsHoliday(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул ЕстьЦветТекста()
    {
        return wxCalendarDateAttr_HasTextColour(wxobj);
    }

    public бул ЕстьЦветФона()
    {
        return wxCalendarDateAttr_HasBackgroundColour(wxobj);
    }

    public бул ЕстьЦветБордюра()
    {
        return wxCalendarDateAttr_HasBorderColour(wxobj);
    }

    public бул ЕстьШрифт()
    {
        return wxCalendarDateAttr_HasFont(wxobj);
    }

    public бул ЕстьБордюр()
    {
        return wxCalendarDateAttr_HasBorder(wxobj);
    }


    public static wxObject Нов(ЦелУкз ptr)
    {
        return new АтрДатыКалендаря(ptr);
    }
    //-----------------------------------------------------------------------------
}

//! \cond EXTERN
static extern (C) ЦелУкз wxCalendarEvent_ctor();
static extern (C) ЦелУкз wxCalendarEvent_ctor2(ЦелУкз cal, цел тип);
static extern (C) ЦелУкз wxCalendarEvent_GetDate(ЦелУкз сам);
static extern (C) цел    wxCalendarEvent_GetWeekDay(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias СобытиеКалендаря wxCalendarEvent;
public class СобытиеКалендаря : СобытиеКоманда
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxCalendarEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    public this(КалендарьКтрл cal, ТипСобытия тип)
    {
        super(wxCalendarEvent_ctor2(wxObject.SafePtr(cal), тип));
    }

    //-----------------------------------------------------------------------------

    public ДатаВремя Дата()
    {
        return new wxDateTime(wxCalendarEvent_GetDate(wxobj));
    }

    public ДеньНед ДеньНедели()
    {
        return cast(ДеньНед)wxCalendarEvent_GetWeekDay(wxobj);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеКалендаря(объ);
    }

    static this()
    {
        wxEVT_CALENDAR_SEL_CHANGED = wxEvent_EVT_CALENDAR_SEL_CHANGED();
        wxEVT_CALENDAR_DAY_CHANGED = wxEvent_EVT_CALENDAR_DAY_CHANGED();
        wxEVT_CALENDAR_MONTH_CHANGED = wxEvent_EVT_CALENDAR_MONTH_CHANGED();
        wxEVT_CALENDAR_YEAR_CHANGED = wxEvent_EVT_CALENDAR_YEAR_CHANGED();
        wxEVT_CALENDAR_DOUBLECLICKED = wxEvent_EVT_CALENDAR_DOUBLECLICKED();
        wxEVT_CALENDAR_WEEKDAY_CLICKED = wxEvent_EVT_CALENDAR_WEEKDAY_CLICKED();

        ДобавьТипСоб(wxEVT_CALENDAR_SEL_CHANGED,            &СобытиеКалендаря.Нов);
        ДобавьТипСоб(wxEVT_CALENDAR_DAY_CHANGED,            &СобытиеКалендаря.Нов);
        ДобавьТипСоб(wxEVT_CALENDAR_MONTH_CHANGED,          &СобытиеКалендаря.Нов);
        ДобавьТипСоб(wxEVT_CALENDAR_YEAR_CHANGED,           &СобытиеКалендаря.Нов);
        ДобавьТипСоб(wxEVT_CALENDAR_DOUBLECLICKED,          &СобытиеКалендаря.Нов);
        ДобавьТипСоб(wxEVT_CALENDAR_WEEKDAY_CLICKED,        &СобытиеКалендаря.Нов);
    }
}

