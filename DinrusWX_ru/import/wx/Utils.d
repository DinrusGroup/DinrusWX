module wx.Utils;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxGlobal_GetHomeDir();
		static extern (C) IntPtr wxGlobal_GetCwd();
		static extern (C) проц wxSleep_func(цел чис);
		static extern (C) проц wxMilliSleep_func(бцел чис);
		static extern (C) проц wxMicroSleep_func(бцел чис);
		static extern (C) проц wxYield_func();
		static extern (C) проц wxBeginBusyCursor_func();
		static extern (C) проц wxEndBusyCursor_func();
		static extern (C) проц wxMutexGuiEnter_func();
		static extern (C) проц wxMutexGuiLeave_func();
		//! \endcond


		public static ткст GetHomeDir();
		public static ткст GetCwd();
		public static проц wxSleep(цел чис);
		public static проц wxMilliSleep(цел чис);
		public static проц wxMicroSleep(цел чис);
		public static проц wxYield();
		public static проц BeginBusyCursor();
		public static проц EndBusyCursor();
		public static проц MutexGuiEnter();
		public static проц MutexGuiLeave();

	alias BusyCursor wxBusyCursor;
	public class BusyCursor : IDisposable
	{
		private бул disposed = false;
		public this();
		~this();
		public проц Dispose();
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxWindowDisabler_ctor(IntPtr winToSkip);
		static extern (C) проц wxWindowDisabler_dtor(IntPtr сам);
		//! \endcond

	alias WindowDisabler wxWindowDisabler;
	public scope class WindowDisabler : wxObject
	{
		//---------------------------------------------------------------------

		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(Окно winToSkip);
		override protected проц dtor();
	}

	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxBusyInfo_ctor(ткст message, IntPtr родитель);
		static extern (C) проц   wxBusyInfo_dtor(IntPtr сам);
		//! \endcond

	alias BusyInfo wxBusyInfo;
	public scope class BusyInfo : wxObject
	{
		//---------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this(ткст message);
		public this(ткст message, Окно родитель);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor();
	}

	//---------------------------------------------------------------------
