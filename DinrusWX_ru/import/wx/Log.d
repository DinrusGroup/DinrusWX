module wx.Log;
public import wx.common;
public import wx.TextCtrl;


		//! \cond EXTERN
		static extern (C) IntPtr wxLog_ctor();
		static extern (C) бул wxLog_IsEnabled();
		static extern (C) проц wxLog_FlushActive();
		static extern (C) IntPtr wxLog_SetActiveTargetTextCtrl(IntPtr pLogger);
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
		
		public this(IntPtr wxobj);
		public this();
		static бул IsEnabled() ;
		public static проц FlushActive();
		public static проц УстActiveTarget(TextCtrl pLogger);
		public static проц AddTraceMask(ткст tmask);
		public static проц LogMessage(...);
		public static проц LogFatalError(...);
		public static проц LogError(...);
		public static проц LogWarning(...);
		public static проц LogInfo(...);
		public static проц LogVerbose(...);
		public static проц LogStatus(...);
		public static проц LogSysError(...);
		private static ткст stringFormat(TypeInfo[] arguments, va_list argptr);

//! \cond VERSION
version (none) {
/* C# compatible */
private static ткст stringFormat(char[] стр,va_list argptr,TypeInfo[] arguments);

}
//! \endcond
	}

