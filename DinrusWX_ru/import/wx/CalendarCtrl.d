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
        static extern (C) IntPtr wxCalendarCtrl_ctor();
        static extern (C) бул   wxCalendarCtrl_Create(IntPtr сам, IntPtr родитель, цел ид, IntPtr дата, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
        static extern (C) бул   wxCalendarCtrl_SetDate(IntPtr сам, IntPtr дата);
        static extern (C) IntPtr wxCalendarCtrl_GetDate(IntPtr сам);
        static extern (C) бул   wxCalendarCtrl_SetLowerDateLimit(IntPtr сам, IntPtr дата);
        static extern (C) IntPtr wxCalendarCtrl_GetLowerDateLimit(IntPtr сам);
        static extern (C) бул   wxCalendarCtrl_SetUpperDateLimit(IntPtr сам, IntPtr дата);
        static extern (C) IntPtr wxCalendarCtrl_GetUpperDateLimit(IntPtr сам);
        static extern (C) бул   wxCalendarCtrl_SetDateRange(IntPtr сам, IntPtr lowerdate, IntPtr upperdate);
        static extern (C) проц   wxCalendarCtrl_EnableYearChange(IntPtr сам, бул вкл);
        static extern (C) проц   wxCalendarCtrl_EnableMonthChange(IntPtr сам, бул вкл);
        static extern (C) проц   wxCalendarCtrl_EnableHolidayDisplay(IntPtr сам, бул display);
        static extern (C) проц   wxCalendarCtrl_SetHeaderColours(IntPtr сам, IntPtr цветПП, IntPtr цветЗП);
        static extern (C) IntPtr wxCalendarCtrl_GetHeaderColourFg(IntPtr сам);
        static extern (C) IntPtr wxCalendarCtrl_GetHeaderColourBg(IntPtr сам);
        static extern (C) проц   wxCalendarCtrl_SetHighlightColours(IntPtr сам, IntPtr цветПП, IntPtr цветЗП);
        static extern (C) IntPtr wxCalendarCtrl_GetHighlightColourFg(IntPtr сам);
        static extern (C) IntPtr wxCalendarCtrl_GetHighlightColourBg(IntPtr сам);
        static extern (C) проц   wxCalendarCtrl_SetHolidayColours(IntPtr сам, IntPtr цветПП, IntPtr цветЗП);
        static extern (C) IntPtr wxCalendarCtrl_GetHolidayColourFg(IntPtr сам);
        static extern (C) IntPtr wxCalendarCtrl_GetHolidayColourBg(IntPtr сам);
        static extern (C) IntPtr wxCalendarCtrl_GetAttr(IntPtr сам, цел day);
        static extern (C) проц   wxCalendarCtrl_SetAttr(IntPtr сам, цел day, IntPtr attr);
        static extern (C) проц   wxCalendarCtrl_SetHoliday(IntPtr сам, цел day);
        static extern (C) проц   wxCalendarCtrl_ResetAttr(IntPtr сам, цел day);
        static extern (C) цел    wxCalendarCtrl_HitTest(IntPtr сам, inout Точка поз, IntPtr дата, inout ДеньНед wd);
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

        public this(IntPtr wxobj);
        public this();
        public this(Окно родитель, цел ид, wxDateTime дата = null /*wxDefaultDateTime*/, Точка поз = вхДефПоз, Размер разм =вхДефРазм , цел стиль = wxCAL_SHOW_HOLIDAYS | wxWANTS_CHARS, ткст имя = вхСтрИмяКалендаря);
	//-----------------------------------------------------------------------------
	// ctors with сам created ид

        public this(Окно родитель, ДатаВремя дата = null, Точка поз = вхДефПоз, Размер разм =вхДефРазм , цел стиль = wxCAL_SHOW_HOLIDAYS | wxWANTS_CHARS, ткст имя = вхСтрИмяКалендаря);
	//-----------------------------------------------------------------------------

        public бул Создай(Окно родитель, цел ид, wxDateTime дата, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
        //-----------------------------------------------------------------------------

        public проц Дата(ДатаВремя значение);
        public ДатаВремя Дата() ;
        public проц НижнийПределДаты(ДатаВремя значение) ;
        public ДатаВремя НижнийПределДаты();

        public проц ВерхнийПределДаты(ДатаВремя значение);
        public ДатаВремя ВерхнийПределДаты() ;
        public бул УстДиапазонДат(ДатаВремя lowerdate, ДатаВремя upperdate);
        public проц ВклСменуГода(бул значение);
        public проц ВклСменуМесяца(бул значение);
        public проц ВклПоказПраздников(бул значение);
        public проц УстЦветаЗаголовка(Цвет цветПП, Цвет цветЗП);
        public Цвет ЦветЗаголовкаПП() ;
        public Цвет ЦветЗаголовкаЗП() ;
        public проц УстЦветаПодсветки(Цвет цветПП, Цвет цветЗП);
        public Цвет ЦветПодсветкиПП();
        public Цвет ЦветПодсветкиЗП() ;
        public проц УстЦветаПраздников(Цвет цветПП, Цвет цветЗП);
        public Цвет ЦветПраздниковПП();
        public Цвет ЦветПраздниковЗП();
        public АтрДатыКалендаря ДайАтр(цел day);
        public проц УстАтр(цел day, АтрДатыКалендаря attr);
        public проц УстПраздник(цел day);
        public проц СбросьАтр(цел day);
        public ПРезТестаНажатияКалендаря ТестНажатия(Точка поз, inout ДатаВремя дата, inout ДеньНед wd);
		public проц SelectionChange_Add(ДатчикСобытий значение) ;
		public проц SelectionChange_Remove(ДатчикСобытий значение);
		public проц DayChange_Add(ДатчикСобытий значение) ;
		public проц DayChange_Remove(ДатчикСобытий значение) ;
		public проц MonthChange_Add(ДатчикСобытий значение) ;
		public проц MonthChange_Remove(ДатчикСобытий значение) ;
		public проц YearChange_Add(ДатчикСобытий значение) ;
		public проц YearChange_Remove(ДатчикСобытий значение);
		public проц DoubleClick_Add(ДатчикСобытий значение) ;
		public проц DoubleClick_Remove(ДатчикСобытий значение);
		public проц WeekdayClick_Add(ДатчикСобытий значение);
		public проц WeekdayClick_Remove(ДатчикСобытий значение) ;
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxCalendarDateAttr_ctor();
        static extern (C) IntPtr wxCalendarDateAttr_ctor2(IntPtr colText, IntPtr colBack, IntPtr colBorder, IntPtr шрифт, ПБордюрКалендарнойДаты бордюр);
        static extern (C) IntPtr wxCalendarDateAttr_ctor3(ПБордюрКалендарнойДаты бордюр, IntPtr colBorder);
	static extern (C) проц   wxCalendarDateAttr_dtor(IntPtr сам);
	static extern (C) проц   wxCalendarDateAttr_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
        static extern (C) проц   wxCalendarDateAttr_SetTextColour(IntPtr сам, IntPtr colText);
        static extern (C) проц   wxCalendarDateAttr_SetBackgroundColour(IntPtr сам, IntPtr colBack);
        static extern (C) проц   wxCalendarDateAttr_SetBorderColour(IntPtr сам, IntPtr col);
        static extern (C) проц   wxCalendarDateAttr_SetFont(IntPtr сам, IntPtr шрифт);
        static extern (C) проц   wxCalendarDateAttr_SetBorder(IntPtr сам, цел бордюр);
        static extern (C) проц   wxCalendarDateAttr_SetHoliday(IntPtr сам, бул holiday);
        static extern (C) бул   wxCalendarDateAttr_HasTextColour(IntPtr сам);
        static extern (C) бул   wxCalendarDateAttr_HasBackgroundColour(IntPtr сам);
        static extern (C) бул   wxCalendarDateAttr_HasBorderColour(IntPtr сам);
        static extern (C) бул   wxCalendarDateAttr_HasFont(IntPtr сам);
        static extern (C) бул   wxCalendarDateAttr_HasBorder(IntPtr сам);
        static extern (C) бул   wxCalendarDateAttr_IsHoliday(IntPtr сам);
        static extern (C) IntPtr wxCalendarDateAttr_GetTextColour(IntPtr сам);
        static extern (C) IntPtr wxCalendarDateAttr_GetBackgroundColour(IntPtr сам);
        static extern (C) IntPtr wxCalendarDateAttr_GetBorderColour(IntPtr сам);
        static extern (C) IntPtr wxCalendarDateAttr_GetFont(IntPtr сам);
        static extern (C) цел    wxCalendarDateAttr_GetBorder(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias АтрДатыКалендаря wxCalendarDateAttr;
    public class АтрДатыКалендаря : wxObject
    {
        public this(IntPtr wxobj);
    	private this(IntPtr wxobj, бул memOwn);
        public this();
        public this(Цвет colText, Цвет colBack = Цвет.wxNullColour, Цвет colBorder = Цвет.wxNullColour, Шрифт шрифт = Шрифт.wxNullFont, ПБордюрКалендарнойДаты бордюр = ПБордюрКалендарнойДаты.wxCAL_BORDER_NONE);
        public  this(ПБордюрКалендарнойДаты бордюр, Цвет colBorder);
    	override protected проц dtor() ;
        public проц ЦветТекста(Цвет значение);
        public Цвет ЦветТекста() ;
        public проц ЦветФона(Цвет значение) { wxCalendarDateAttr_SetBackgroundColour(wxobj, wxObject.SafePtr(значение)); }
        public Цвет ЦветФона();
        public проц ЦветБордюра(Цвет значение);
        public Цвет ЦветБордюра() ;
        public проц шрифт(Шрифт значение) ;
        public Шрифт шрифт();
        public проц ПБордюр(ПБордюрКалендарнойДаты значение) ;
        public ПБордюрКалендарнойДаты ПБордюр() ;
        public проц Праздник(бул значение) ;
        public бул Праздник() ;
        public бул ЕстьЦветТекста();
        public бул ЕстьЦветФона();
        public бул ЕстьЦветБордюра() ;
        public бул ЕстьШрифт();
        public бул ЕстьБордюр() ;
	public static wxObject Нов(IntPtr ptr);
    }

		//! \cond EXTERN
        static extern (C) IntPtr wxCalendarEvent_ctor();
        static extern (C) IntPtr wxCalendarEvent_ctor2(IntPtr cal, цел тип);
        static extern (C) IntPtr wxCalendarEvent_GetDate(IntPtr сам);
        static extern (C) цел    wxCalendarEvent_GetWeekDay(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias СобытиеКалендаря wxCalendarEvent;
    public class СобытиеКалендаря : СобытиеКоманда
    {
	public this(IntPtr wxobj);
        public this();
        public this(КалендарьКтрл cal, EventType тип);
        public ДатаВремя Дата() ;
        public ДеньНед ДеньНедели() ;
		private static Событие Нов(IntPtr объ) ;
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

