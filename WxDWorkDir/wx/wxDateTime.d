//-----------------------------------------------------------------------------
// wxD - DateTime.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DateTime.cs
// 
/// The wxDateTime wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: wxDateTime.d,v 1.11 2007/04/19 19:44:05 afb Exp $
//-----------------------------------------------------------------------------

module wx.wxDateTime;
public import wx.common;
//private import std.date;

    alias wxDateTime DateTime;
    enum DayOfWeek
    {
        Sun, Mon, Tue, Wed, Thu, Fri, Sat, Inv_WeekDay
    };

/* wxDateTime imprementation is class { longlong } */

		//! \cond EXTERN
        static extern (C) ЦУк wxDefaultDateTime_Get();
        static extern (C) ЦУк wxDateTime_ctor();
        static extern (C) ЦУк wxDateTime_Now();
	static extern (C) проц   wxDateTime_dtor(ЦУк сам);
        static extern (C) проц   wxDateTime_Set(ЦУк сам, ushort day, цел month, цел year, ushort hour, ushort minute, ushort second, ushort millisec);
        static extern (C) ushort wxDateTime_GetYear(ЦУк сам);
        static extern (C) цел    wxDateTime_GetMonth(ЦУк сам);
        static extern (C) ushort wxDateTime_GetDay(ЦУк сам);
        static extern (C) ushort wxDateTime_GetHour(ЦУк сам);
        static extern (C) ushort wxDateTime_GetMinute(ЦУк сам);
        static extern (C) ushort wxDateTime_GetSecond(ЦУк сам);
        static extern (C) ushort wxDateTime_GetMillisecond(ЦУк сам);
		//! \endcond
	
        //-----------------------------------------------------------------------------

    /// wxDateTime class represents an absolute moment in time.
    public class wxDateTime : wxObject
    {
	static wxDateTime wxDefaultDateTime;
	static this()
	{
		wxDefaultDateTime = new wxDateTime(wxDefaultDateTime_Get());
	}

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
            { this(wxDateTime_ctor(), да); }
	    
	//---------------------------------------------------------------------
	
	override protected проц dtor() { wxDateTime_dtor(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Установи(ushort day, цел month, цел year, ushort hour, ushort minute, ushort second, ushort millisec)
        {
            wxDateTime_Set(шхобъ, day, month, year, hour, minute, second, millisec);
        }

        //-----------------------------------------------------------------------------

        public ushort Year() { return wxDateTime_GetYear(шхобъ); }

        public цел Month() { return wxDateTime_GetMonth(шхобъ); }

        public ushort Day() { return wxDateTime_GetDay(шхобъ); }

        public ushort Hour() { return wxDateTime_GetHour(шхобъ); }

        public ushort Minute() { return wxDateTime_GetMinute(шхобъ); }
        
        public ushort Second() { return wxDateTime_GetSecond(шхобъ); }

        public ushort Millisecond() { return wxDateTime_GetMillisecond(шхобъ); }

	static wxDateTime Now() { return new wxDateTime(wxDateTime_Now()); }
        //-----------------------------------------------------------------------------
/+
        public static implicit operator DateTime (wxDateTime wdt)
        {
            DateTime dt = new DateTime(wdt.Year, cast(цел)wdt.Month+1, cast(цел)wdt.Day, 
                                       cast(цел)wdt.Hour, cast(цел)wdt.Minute, 
                                       cast(цел)wdt.Second, cast(цел)wdt.Millisecond);
            return dt;
        }

        public static implicit operator wxDateTime (DateTime dt)
        {
            wxDateTime wdt = new wxDateTime();
            wdt.Установи((ushort)dt.Day, dt.Month-1, dt.Year, (ushort)dt.Hour, 
                    (ushort)dt.Minute, (ushort)dt.Second, 
                    (ushort)dt.Millisecond);
            return wdt;
        }
+/
        //-----------------------------------------------------------------------------
    }
