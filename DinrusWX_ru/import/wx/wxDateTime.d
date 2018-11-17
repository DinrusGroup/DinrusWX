module wx.wxDateTime;
public import wx.common;
//private import std.дата;

    alias wxDateTime ДатаВремя;
    enum ДеньНед
    {
        Sun, Mon, Tue, Wed, Thu, Fri, Sat, Inv_WeekDay
    };

/* wxDateTime imprementation is class { longlong } */

		//! \cond EXTERN
        static extern (C) IntPtr wxDefaultDateTime_Get();
        static extern (C) IntPtr wxDateTime_ctor();
        static extern (C) IntPtr wxDateTime_Now();
	static extern (C) проц   wxDateTime_dtor(IntPtr сам);
        static extern (C) проц   wxDateTime_Set(IntPtr сам, ushort day, цел month, цел year, ushort hour, ushort minute, ushort second, ushort millisec);
        static extern (C) ushort wxDateTime_GetYear(IntPtr сам);
        static extern (C) цел    wxDateTime_GetMonth(IntPtr сам);
        static extern (C) ushort wxDateTime_GetDay(IntPtr сам);
        static extern (C) ushort wxDateTime_GetHour(IntPtr сам);
        static extern (C) ushort wxDateTime_GetMinute(IntPtr сам);
        static extern (C) ushort wxDateTime_GetSecond(IntPtr сам);
        static extern (C) ushort wxDateTime_GetMillisecond(IntPtr сам);
		//! \endcond
	
        //-----------------------------------------------------------------------------

    /// wxDateTime class represents an absolute moment in time.
    public class wxDateTime : wxObject
    {
	static wxDateTime wxDefaultDateTime;
	static this();
        public this(IntPtr wxobj);
	private this(IntPtr wxobj, бул memOwn);
        public this();
	override protected проц dtor();
        public проц Уст(ushort day, цел month, цел year, ushort hour, ushort minute, ushort second, ushort millisec);
        public ushort Year() ;
        public цел Month();
        public ushort Day();
        public ushort Hour() ;
        public ushort Minute() ;        
        public ushort Second();
        public ushort Millisecond() ;
	static wxDateTime Now() ;
        //-----------------------------------------------------------------------------
/+
        public static implicit operator ДатаВремя (wxDateTime wdt)
        {
            ДатаВремя dt = new ДатаВремя(wdt.Year, cast(цел)wdt.Month+1, cast(цел)wdt.Day, 
                                       cast(цел)wdt.Hour, cast(цел)wdt.Minute, 
                                       cast(цел)wdt.Second, cast(цел)wdt.Millisecond);
            return dt;
        }

        public static implicit operator wxDateTime (ДатаВремя dt)
        {
            wxDateTime wdt = new wxDateTime();
            wdt.Уст((ushort)dt.Day, dt.Month-1, dt.Year, (ushort)dt.Hour, 
                    (ushort)dt.Minute, (ushort)dt.Second, 
                    (ushort)dt.Millisecond);
            return wdt;
        }
+/
        //-----------------------------------------------------------------------------
    }
