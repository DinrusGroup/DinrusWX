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
private import stdrus;



//! \cond EXTERN
static extern (C) ЦелУкз wxLog_ctor();
static extern (C) бул wxLog_IsEnabled();
static extern (C) проц wxLog_FlushActive();
static extern (C) ЦелУкз wxLog_SetActiveTargetTextCtrl(ЦелУкз pLogger);
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

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxLog_ctor());
    }


    static бул IsEnabled()
    {
        return wxLog_IsEnabled();
    }

    public static проц FlushActive()
    {
        wxLog_FlushActive();
    }

    // at the moment only TextCtrl
    public static проц УстActiveTarget(TextCtrl pLogger)
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
        char[] s;

        version (Tango)
        {
            char[] fmts = "";
            for(цел i=0; i < arguments.length; i++)
            {
                fmts ~= "{}";
            }
            s = Format.convert(arguments, argptr, fmts);
        }
        else // Phobos
        {
            проц putc(dchar c)
            {
                кодируйЮ(s, c);
            }

            форматДелай(&putc, arguments, argptr);
        }

        return assumeUnique(s);
    }

//! \cond VERSION
    version (none)
    {
        /* C# compatible */
        private static ткст stringFormat(char[] стр,va_list argptr,TypeInfo[] arguments)
        {
            if (arguments.length==0) return стр;

            ткст[] арги = new ткст[arguments.length];

            for(бцел i=0; i<arguments.length; i++)
            {
                TypeInfo ид = arguments[i];
                char[] значение;
                if (ид == typeid(цел))
                {
                    значение = .вТкст(*cast(цел*)argptr);
                    argptr += цел.sizeof;
                }
                else if (ид == typeid(long))
                {
                    значение = .вТкст(*cast(long*)argptr);
                    argptr += long.sizeof;
                }
                else if (ид == typeid(float))
                {
                    значение = .вТкст(*cast(long*)argptr);
                    argptr += long.sizeof;
                }
                else if (ид == typeid(double))
                {
                    значение = .вТкст(*cast(long*)argptr);
                    argptr += long.sizeof;
                }
                else if (ид == typeid(ткст))
                {
                    значение = *cast(ткст*)argptr;
                    argptr += ткст.sizeof;
                }
                арги[i] = значение;
            }

            ткст ret;
            while(1)
            {
                цел start,end;
                start = find(стр,'{');
                if (start<0) break;

                ret ~= стр[0..start];
                стр = стр[start+1..стр.length];

                end = find(стр,'}');
                assert(end>0);
                цел idx = atoi(стр[0..end]);
                assert(idx<арги.length);

                ret ~= арги[idx];
                стр = стр[end+1..стр.length];
            }
            ret ~= стр;

            return ret;
        }

    }
//! \endcond
}

