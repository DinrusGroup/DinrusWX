//-----------------------------------------------------------------------------
// wxD - CalendarCtrl.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - CalendarCtrl.cs
//
/// The wxCalendarCtrl wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: CalendarCtrl.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.CalendarCtrl;
public import wx.common;
public import wx.wxDateTime;
public import wx.Colour;
public import wx.Font;
public import wx.Control;
public import wx.CommandEvent;

    public enum CalendarHitTestResult
    {
        wxCAL_HITTEST_NOWHERE,
        wxCAL_HITTEST_HEADER,
        wxCAL_HITTEST_DAY,
        wxCAL_HITTEST_INCMONTH,
        wxCAL_HITTEST_DECMONTH,
        wxCAL_HITTEST_SURROUNDING_WEEK
    }

    public enum CalendarDateBorder
    {
        wxCAL_BORDER_NONE,
        wxCAL_BORDER_SQUARE,
        wxCAL_BORDER_ROUND
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxCalendarCtrl_ctor();
        static extern (C) бул   wxCalendarCtrl_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк date, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
        static extern (C) бул   wxCalendarCtrl_SetDate(ЦУк сам, ЦУк date);
        static extern (C) ЦУк wxCalendarCtrl_GetDate(ЦУк сам);
        static extern (C) бул   wxCalendarCtrl_SetLowerDateLimit(ЦУк сам, ЦУк date);
        static extern (C) ЦУк wxCalendarCtrl_GetLowerDateLimit(ЦУк сам);
        static extern (C) бул   wxCalendarCtrl_SetUpperDateLimit(ЦУк сам, ЦУк date);
        static extern (C) ЦУк wxCalendarCtrl_GetUpperDateLimit(ЦУк сам);
        static extern (C) бул   wxCalendarCtrl_SetDateRange(ЦУк сам, ЦУк lowerdate, ЦУк upperdate);
        static extern (C) проц   wxCalendarCtrl_EnableYearChange(ЦУк сам, бул enable);
        static extern (C) проц   wxCalendarCtrl_EnableMonthChange(ЦУк сам, бул enable);
        static extern (C) проц   wxCalendarCtrl_EnableHolidayDisplay(ЦУк сам, бул display);
        static extern (C) проц   wxCalendarCtrl_SetHeaderColours(ЦУк сам, ЦУк цветПП, ЦУк цветЗП);
        static extern (C) ЦУк wxCalendarCtrl_GetHeaderColourFg(ЦУк сам);
        static extern (C) ЦУк wxCalendarCtrl_GetHeaderColourBg(ЦУк сам);
        static extern (C) проц   wxCalendarCtrl_SetHighlightColours(ЦУк сам, ЦУк цветПП, ЦУк цветЗП);
        static extern (C) ЦУк wxCalendarCtrl_GetHighlightColourFg(ЦУк сам);
        static extern (C) ЦУк wxCalendarCtrl_GetHighlightColourBg(ЦУк сам);
        static extern (C) проц   wxCalendarCtrl_SetHolidayColours(ЦУк сам, ЦУк цветПП, ЦУк цветЗП);
        static extern (C) ЦУк wxCalendarCtrl_GetHolidayColourFg(ЦУк сам);
        static extern (C) ЦУк wxCalendarCtrl_GetHolidayColourBg(ЦУк сам);
        static extern (C) ЦУк wxCalendarCtrl_GetAttr(ЦУк сам, цел day);
        static extern (C) проц   wxCalendarCtrl_SetAttr(ЦУк сам, цел day, ЦУк attr);
        static extern (C) проц   wxCalendarCtrl_SetHoliday(ЦУк сам, цел day);
        static extern (C) проц   wxCalendarCtrl_ResetAttr(ЦУк сам, цел day);
        static extern (C) цел    wxCalendarCtrl_HitTest(ЦУк сам, inout Точка поз, ЦУк date, inout DayOfWeek wd);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias CalendarCtrl wxCalendarCtrl;
    public class CalendarCtrl : Control
    {
        enum
        {
            // show Sunday as the first day of the week (default)
            wxCAL_SUNDAY_FIRST               = 0x0000,

            // show Monday as the first day of the week
            wxCAL_MONDAY_FIRST               = 0x0001,

            // highlight holidays
            wxCAL_SHOW_HOLIDAYS              = 0x0002,

            // disable the year change control, show only the month change one
            wxCAL_NO_YEAR_CHANGE             = 0x0004,

            // don't allow changing neither month nor year (implies
            // wxCAL_NO_YEAR_CHANGE)
            wxCAL_NO_MONTH_CHANGE            = 0x000c,

            // use MS-стиль month-selection instead of combo-spin combination
            wxCAL_SEQUENTIAL_MONTH_SELECTION = 0x0010,

            // show the neighbouring weeks in the previous and next month
            wxCAL_SHOW_SURROUNDING_WEEKS     = 0x0020
        }
        
	public const ткст wxCalendarNameStr  = "CalendarCtrl";
        //-----------------------------------------------------------------------------

        public this(ЦУк шхобъ)
            { super(шхобъ); }
	    
        public this()
            { this(wxCalendarCtrl_ctor()); }

        public this(Окно родитель, цел ид, wxDateTime date = пусто /*wxDefaultDateTime*/, Точка поз = wxDefaultPosition, Размер size =wxDefaultSize , цел стиль = wxCAL_SHOW_HOLIDAYS | wxWANTS_CHARS, ткст имя = wxCalendarNameStr)
        {
        	this(wxCalendarCtrl_ctor());
            if (!Create(родитель, ид, date, поз, size, стиль, имя))
            {
				throw new InvalidOperationException("Failed to create CalendarCtrl");
            }
        }
	
	//-----------------------------------------------------------------------------
	// ctors with сам created ид
	
        public this(Окно родитель, DateTime date = пусто, Точка поз = wxDefaultPosition, Размер size =wxDefaultSize , цел стиль = wxCAL_SHOW_HOLIDAYS | wxWANTS_CHARS, ткст имя = wxCalendarNameStr)
		{ this(родитель, Окно.UniqueID, date, поз, size, стиль, имя);}
		
	//-----------------------------------------------------------------------------

        public бул Create(Окно родитель, цел ид, wxDateTime date, inout Точка поз, inout Размер size, цел стиль, ткст имя)
        {
            return wxCalendarCtrl_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(date), поз, size, cast(бцел)стиль, имя);
        }

        //-----------------------------------------------------------------------------

        public проц Date(DateTime значение) { wxCalendarCtrl_SetDate(шхобъ, wxObject.SafePtr(cast(wxDateTime)значение)); }
        public DateTime Date() { return new wxDateTime(wxCalendarCtrl_GetDate(шхобъ)); }

        //-----------------------------------------------------------------------------

        public проц LowerDateLimit(DateTime значение) { wxCalendarCtrl_SetLowerDateLimit(шхобъ, wxObject.SafePtr(cast(wxDateTime)значение)); }
        public DateTime LowerDateLimit() { return new wxDateTime(wxCalendarCtrl_GetLowerDateLimit(шхобъ)); }

        public проц UpperDateLimit(DateTime значение) { wxCalendarCtrl_SetUpperDateLimit(шхобъ, wxObject.SafePtr(cast(wxDateTime)значение)); }
        public DateTime UpperDateLimit() { return new wxDateTime(wxCalendarCtrl_GetUpperDateLimit(шхобъ)); }

        //-----------------------------------------------------------------------------

        public бул SetDateRange(DateTime lowerdate, DateTime upperdate)
        {
            return wxCalendarCtrl_SetDateRange(шхобъ, wxObject.SafePtr(cast(wxDateTime)lowerdate), wxObject.SafePtr(cast(wxDateTime)upperdate));
        }

        //-----------------------------------------------------------------------------

        public проц EnableYearChange(бул значение) { wxCalendarCtrl_EnableYearChange(шхобъ, значение); }

        public проц EnableMonthChange(бул значение) { wxCalendarCtrl_EnableMonthChange(шхобъ, значение); }

        public проц EnableHolidayDisplay(бул значение) { wxCalendarCtrl_EnableHolidayDisplay(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public проц SetHeaderColours(Цвет цветПП, Цвет цветЗП)
        {
            wxCalendarCtrl_SetHeaderColours(шхобъ, wxObject.SafePtr(цветПП), wxObject.SafePtr(цветЗП));
        }

        public Цвет HeaderColourFg() { return new Цвет(wxCalendarCtrl_GetHeaderColourFg(шхобъ), да); }

        public Цвет HeaderColourBg() { return new Цвет(wxCalendarCtrl_GetHeaderColourBg(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц SetHighlightColours(Цвет цветПП, Цвет цветЗП)
        {
            wxCalendarCtrl_SetHighlightColours(шхобъ, wxObject.SafePtr(цветПП), wxObject.SafePtr(цветЗП));
        }

        public Цвет HighlightColourFg() { return new Цвет(wxCalendarCtrl_GetHighlightColourFg(шхобъ)); }

        public Цвет HighlightColourBg() { return new Цвет(wxCalendarCtrl_GetHighlightColourBg(шхобъ)); }

        //-----------------------------------------------------------------------------

        public проц SetHolidayColours(Цвет цветПП, Цвет цветЗП)
        {
            wxCalendarCtrl_SetHolidayColours(шхобъ, wxObject.SafePtr(цветПП), wxObject.SafePtr(цветЗП));
        }

        public Цвет HolidayColourFg() { return new Цвет(wxCalendarCtrl_GetHolidayColourFg(шхобъ)); }

        public Цвет HolidayColourBg() { return new Цвет(wxCalendarCtrl_GetHolidayColourBg(шхобъ)); }

        //-----------------------------------------------------------------------------

        public CalendarDateAttr GetAttr(цел day)
        {
            return cast(CalendarDateAttr)FindObject(wxCalendarCtrl_GetAttr(шхобъ, day), &CalendarDateAttr.Нов);
        }

        public проц SetAttr(цел day, CalendarDateAttr attr)
        {
            wxCalendarCtrl_SetAttr(шхобъ, day, wxObject.SafePtr(attr));
        }

        //-----------------------------------------------------------------------------

        public проц SetHoliday(цел day)
        {
            wxCalendarCtrl_SetHoliday(шхобъ, day);
        }

        //-----------------------------------------------------------------------------

        public проц ResetAttr(цел day)
        {
            wxCalendarCtrl_ResetAttr(шхобъ, day);
        }

        //-----------------------------------------------------------------------------

        public CalendarHitTestResult HitTest(Точка поз, inout DateTime date, inout DayOfWeek wd)
        {
            wxDateTime dt = date;
            CalendarHitTestResult res = cast(CalendarHitTestResult)wxCalendarCtrl_HitTest(шхобъ, поз, wxObject.SafePtr(dt), wd);
            date = dt;

            return res;
        }

        //-----------------------------------------------------------------------------

		public проц SelectionChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CALENDAR_SEL_CHANGED, ИД, значение, this); }
		public проц SelectionChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DayChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CALENDAR_DAY_CHANGED, ИД, значение, this); }
		public проц DayChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц MonthChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CALENDAR_MONTH_CHANGED, ИД, значение, this); }
		public проц MonthChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц YearChange_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CALENDAR_YEAR_CHANGED, ИД, значение, this); }
		public проц YearChange_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц DoubleClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CALENDAR_DOUBLECLICKED, ИД, значение, this); }
		public проц DoubleClick_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц WeekdayClick_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_CALENDAR_WEEKDAY_CLICKED, ИД, значение, this); }
		public проц WeekdayClick_Remove(EventListener значение) { RemoveHandler(значение, this); }
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxCalendarDateAttr_ctor();
        static extern (C) ЦУк wxCalendarDateAttr_ctor2(ЦУк colText, ЦУк colBack, ЦУк colBorder, ЦУк шрифт, CalendarDateBorder border);
        static extern (C) ЦУк wxCalendarDateAttr_ctor3(CalendarDateBorder border, ЦУк colBorder);
	static extern (C) проц   wxCalendarDateAttr_dtor(ЦУк сам);
	static extern (C) проц   wxCalendarDateAttr_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
        static extern (C) проц   wxCalendarDateAttr_SetTextColour(ЦУк сам, ЦУк colText);
        static extern (C) проц   wxCalendarDateAttr_SetBackgroundColour(ЦУк сам, ЦУк colBack);
        static extern (C) проц   wxCalendarDateAttr_SetBorderColour(ЦУк сам, ЦУк col);
        static extern (C) проц   wxCalendarDateAttr_SetFont(ЦУк сам, ЦУк шрифт);
        static extern (C) проц   wxCalendarDateAttr_SetBorder(ЦУк сам, цел border);
        static extern (C) проц   wxCalendarDateAttr_SetHoliday(ЦУк сам, бул holiday);
        static extern (C) бул   wxCalendarDateAttr_HasTextColour(ЦУк сам);
        static extern (C) бул   wxCalendarDateAttr_HasBackgroundColour(ЦУк сам);
        static extern (C) бул   wxCalendarDateAttr_HasBorderColour(ЦУк сам);
        static extern (C) бул   wxCalendarDateAttr_HasFont(ЦУк сам);
        static extern (C) бул   wxCalendarDateAttr_HasBorder(ЦУк сам);
        static extern (C) бул   wxCalendarDateAttr_IsHoliday(ЦУк сам);
        static extern (C) ЦУк wxCalendarDateAttr_GetTextColour(ЦУк сам);
        static extern (C) ЦУк wxCalendarDateAttr_GetBackgroundColour(ЦУк сам);
        static extern (C) ЦУк wxCalendarDateAttr_GetBorderColour(ЦУк сам);
        static extern (C) ЦУк wxCalendarDateAttr_GetFont(ЦУк сам);
        static extern (C) цел    wxCalendarDateAttr_GetBorder(ЦУк сам);
		//! \endcond
	
        //-----------------------------------------------------------------------------

    alias CalendarDateAttr wxCalendarDateAttr;
    public class CalendarDateAttr : wxObject
    {
        public this(ЦУк шхобъ)
	{ 
		super(шхобъ);
	}
	
	private this(ЦУк шхобъ, бул memOwn)
	{ 
		super(шхобъ);
		this.memOwn = memOwn;
	}

        public this()
	{ 
		this(wxCalendarDateAttr_ctor(), да);
		wxCalendarDateAttr_RegisterDisposable(шхобъ, &VirtualDispose);
	}

        public this(Цвет colText, Цвет colBack = Цвет.wxNullColour, Цвет colBorder = Цвет.wxNullColour, Шрифт шрифт = Шрифт.wxNullFont, CalendarDateBorder border = CalendarDateBorder.wxCAL_BORDER_NONE)
        {
        	this(wxCalendarDateAttr_ctor2(wxObject.SafePtr(colText), wxObject.SafePtr(colBack), wxObject.SafePtr(colBorder), wxObject.SafePtr(шрифт), border),да);
		wxCalendarDateAttr_RegisterDisposable(шхобъ, &VirtualDispose);
        }

        public  this(CalendarDateBorder border, Цвет colBorder)
        {
        	this(wxCalendarDateAttr_ctor3(border, wxObject.SafePtr(colBorder)),да);
		wxCalendarDateAttr_RegisterDisposable(шхобъ, &VirtualDispose);
        }
	
	//---------------------------------------------------------------------
				
	override protected проц dtor() { wxCalendarDateAttr_dtor(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц TextColour(Цвет значение) { wxCalendarDateAttr_SetTextColour(шхобъ, wxObject.SafePtr(значение)); }
        public Цвет TextColour() { return new Цвет(wxCalendarDateAttr_GetTextColour(шхобъ)); }

        //-----------------------------------------------------------------------------

        public проц ЦветЗП(Цвет значение) { wxCalendarDateAttr_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
        public Цвет ЦветЗП() { return new Цвет(wxCalendarDateAttr_GetBackgroundColour(шхобъ)); }

        //-----------------------------------------------------------------------------

        public проц BorderColour(Цвет значение) { wxCalendarDateAttr_SetBorderColour(шхобъ, wxObject.SafePtr(значение)); }
        public Цвет BorderColour() { return new Цвет(wxCalendarDateAttr_GetBorderColour(шхобъ)); }

        //-----------------------------------------------------------------------------

        public проц шрифт(Шрифт значение) { wxCalendarDateAttr_SetFont(шхобъ, wxObject.SafePtr(значение)); }
        public Шрифт шрифт() { return new Шрифт(wxCalendarDateAttr_GetFont(шхобъ)); }

        //-----------------------------------------------------------------------------

        public проц Border(CalendarDateBorder значение) { wxCalendarDateAttr_SetBorder(шхобъ, cast(цел)значение); }
        public CalendarDateBorder Border() { return cast(CalendarDateBorder)wxCalendarDateAttr_GetBorder(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц IsHoliday(бул значение) { wxCalendarDateAttr_SetHoliday(шхобъ, значение); }
        public бул IsHoliday() { return wxCalendarDateAttr_IsHoliday(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул HasTextColour() { return wxCalendarDateAttr_HasTextColour(шхобъ); }

        public бул HasBackgroundColour() { return wxCalendarDateAttr_HasBackgroundColour(шхобъ); }

        public бул HasBorderColour() { return wxCalendarDateAttr_HasBorderColour(шхобъ); }

        public бул HasFont() { return wxCalendarDateAttr_HasFont(шхобъ); }

        public бул HasBorder() { return wxCalendarDateAttr_HasBorder(шхобъ); }


	public static wxObject Нов(ЦУк ptr) { return new CalendarDateAttr(ptr); }
        //-----------------------------------------------------------------------------
    }

		//! \cond EXTERN
        static extern (C) ЦУк wxCalendarEvent_ctor();
        static extern (C) ЦУк wxCalendarEvent_ctor2(ЦУк cal, цел тип);
        static extern (C) ЦУк wxCalendarEvent_GetDate(ЦУк сам);
        static extern (C) цел    wxCalendarEvent_GetWeekDay(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------
	
    alias CalendarEvent wxCalendarEvent;
    public class CalendarEvent : CommandEvent
    {
	public this(ЦУк шхобъ)
		{ super(шхобъ);}

        public this()
            { super(wxCalendarEvent_ctor()); }

        //-----------------------------------------------------------------------------

        public this(CalendarCtrl cal, ТипСобытия тип)
            { super(wxCalendarEvent_ctor2(wxObject.SafePtr(cal), тип)); }

        //-----------------------------------------------------------------------------

        public DateTime Date() { return new wxDateTime(wxCalendarEvent_GetDate(шхобъ)); }

        public DayOfWeek WeekDay() { return cast(DayOfWeek)wxCalendarEvent_GetWeekDay(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new CalendarEvent(объ); }

		static this()
		{
			wxEVT_CALENDAR_SEL_CHANGED = wxEvent_EVT_CALENDAR_SEL_CHANGED();
			wxEVT_CALENDAR_DAY_CHANGED = wxEvent_EVT_CALENDAR_DAY_CHANGED();
			wxEVT_CALENDAR_MONTH_CHANGED = wxEvent_EVT_CALENDAR_MONTH_CHANGED();
			wxEVT_CALENDAR_YEAR_CHANGED = wxEvent_EVT_CALENDAR_YEAR_CHANGED();
			wxEVT_CALENDAR_DOUBLECLICKED = wxEvent_EVT_CALENDAR_DOUBLECLICKED();
			wxEVT_CALENDAR_WEEKDAY_CLICKED = wxEvent_EVT_CALENDAR_WEEKDAY_CLICKED();
	
			ДобавьТипСоб(wxEVT_CALENDAR_SEL_CHANGED,            &CalendarEvent.Нов);
			ДобавьТипСоб(wxEVT_CALENDAR_DAY_CHANGED,            &CalendarEvent.Нов);
			ДобавьТипСоб(wxEVT_CALENDAR_MONTH_CHANGED,          &CalendarEvent.Нов);
			ДобавьТипСоб(wxEVT_CALENDAR_YEAR_CHANGED,           &CalendarEvent.Нов);
			ДобавьТипСоб(wxEVT_CALENDAR_DOUBLECLICKED,          &CalendarEvent.Нов);
			ДобавьТипСоб(wxEVT_CALENDAR_WEEKDAY_CLICKED,        &CalendarEvent.Нов);
		}
    }

