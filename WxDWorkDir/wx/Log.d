//-----------------------------------------------------------------------------
// wxD - Log.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Log.cs
//
/// The wxLog wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Log.d,v 1.13 2008/07/29 11:14:50 afb Exp $
//-----------------------------------------------------------------------------

module wx.Log;
public import wx.common;
public import wx.TextCtrl;

//! \cond STD
version (Tango)
{
import tango.core.Vararg;
import tango.текст.convert.Format;
}
version(Phobos)
{
private import std.format;
private import std.stdarg;
}

version(Dinrus)
{
import dinrus;
}
//! \endcond

		//! \cond EXTERN
		static extern (C) ЦУк wxLog_ctor();
		static extern (C) бул wxLog_IsEnabled();
		static extern (C) проц wxLog_FlushActive();
		static extern (C) ЦУк wxLog_SetActiveTargetTextCtrl(ЦУк pLogger);
		static extern (C) проц wxLog_Log_Function(цел what, ткст szFormat);
		static extern (C) проц wxLog_AddTraceMask(ткст tmask);
		//! \endcond
		
	alias Log wxLog;
	public class Log : wxObject
	{
		enum eLogLevel : цел
		{
			xLOG,
			xFATALERROR,
			xERROR,
			xWARNING,
			xINFO,
			xVERBOSE,
			xSTATUS,
			xSYSERROR
		}
		
		public this(ЦУк шхобъ)
		    { super(шхобъ);}

		public this()
		    { super(wxLog_ctor());}


		static бул IsEnabled() { return wxLog_IsEnabled(); }

		public static проц FlushActive()
		{
			wxLog_FlushActive();
		}

		// at the moment only TextCtrl
		public static проц SetActiveTarget(TextCtrl pLogger)
		{
			wxLog_SetActiveTargetTextCtrl(wxObject.SafePtr(pLogger));
		}

		public static проц AddTraceMask(ткст tmask)
		{
			wxLog_AddTraceMask(tmask);
		}

		public static проц LogMessage(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xLOG, stringFormat(_arguments,_argptr));
		}

		public static проц LogFatalError(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xFATALERROR, stringFormat(_arguments,_argptr));
		}

		public static проц LogError(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xERROR, stringFormat(_arguments,_argptr));
		}

		public static проц LogWarning(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xWARNING, stringFormat(_arguments,_argptr));
		}

		public static проц LogInfo(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xINFO, stringFormat(_arguments,_argptr));
		}

		public static проц LogVerbose(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xVERBOSE, stringFormat(_arguments,_argptr));
		}

		public static проц LogStatus(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xSTATUS, stringFormat(_arguments,_argptr));
		}

		public static проц LogSysError(...)
		{
			wxLog_Log_Function(cast(цел)eLogLevel.xSYSERROR, stringFormat(_arguments,_argptr));
		}

		private static ткст stringFormat(TypeInfo[] arguments, va_list argptr)
		{
			сим[] s;

		version (Tango)
		{
			сим[] fmts = "";
			for(цел i=0; i < arguments.length; i++) {
				fmts ~= "{}";
			}
			s = Format.convert(arguments, argptr, fmts);
		}
		version( Phobos)
		{
			проц putc(dchar c)
			{
				std.utf.encode(s, c);
			}

			std.format.doFormat(&putc, arguments, argptr);
		}


		version(Dinrus)
		{
			проц putc(dchar c)
			{
				кодируйЮ(s, c);
			}

			stdrus.форматДелай(&putc, arguments, argptr);		

		}
	return s;//assumeUnique(s);
	}

//! \cond VERSION
version (none) {
/* C# compatible */
private static ткст stringFormat(сим[] str,va_list argptr,TypeInfo[] arguments)
{
	if (arguments.length==0) return str;

	ткст[] args = new ткст[arguments.length];

	for(бцел i=0;i<arguments.length;i++) {
		TypeInfo ид = arguments[i];
		сим[] значение;
		if (ид == typeid(цел)) {
			значение = .toString(*cast(цел*)argptr);
			argptr += цел.sizeof;
		}
		else if (ид == typeid(long)) {
			значение = .toString(*cast(long*)argptr);
			argptr += long.sizeof;
		}
		else if (ид == typeid(float)) {
			значение = .toString(*cast(long*)argptr);
			argptr += long.sizeof;
		}
		else if (ид == typeid(дво)) {
			значение = .toString(*cast(long*)argptr);
			argptr += long.sizeof;
		}
		else if (ид == typeid(ткст)) {
			значение = *cast(ткст*)argptr;
			argptr += ткст.sizeof;
		}
		args[i] = значение;
	}

	ткст ret;
	while(1) {
		цел start,end;
		start = find(str,'{');
		if (start<0) break;

		ret ~= str[0..start];
		str = str[start+1..str.length];

		end = find(str,'}');
		assert(end>0);
		цел idx = atoi(str[0..end]);
		assert(idx<args.length);
		
		ret ~= args[idx];
		str = str[end+1..str.length];
	}
	ret ~= str;

	return ret;
}

}
//! \endcond
	}

