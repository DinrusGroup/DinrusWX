//-----------------------------------------------------------------------------
// wxD - Utils.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Utils.cs
//
/// Common Utils wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Utils.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.Utils;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxGlobal_GetHomeDir();
		static extern (C) ЦУк wxGlobal_GetCwd();
		static extern (C) проц wxSleep_func(цел num);
		static extern (C) проц wxMilliSleep_func(бцел num);
		static extern (C) проц wxMicroSleep_func(бцел num);
		static extern (C) проц wxYield_func();
		static extern (C) проц wxBeginBusyCursor_func();
		static extern (C) проц wxEndBusyCursor_func();
		static extern (C) проц wxMutexGuiEnter_func();
		static extern (C) проц wxMutexGuiLeave_func();
		//! \endcond
		
		
		public static ткст GetHomeDir()
		{
			return cast(ткст) new wxString(wxGlobal_GetHomeDir(), да);
		}
		
		public static ткст GetCwd()
		{
			return cast(ткст) new wxString(wxGlobal_GetCwd(), да);
		}
		
		//---------------------------------------------------------------------

		public static проц wxSleep(цел num)
		{
			wxSleep_func(num);
		}

		public static проц wxMilliSleep(цел num)
		{
			wxMilliSleep_func(num);
		}

		public static проц wxMicroSleep(цел num)
		{
			wxMicroSleep_func(num);
		}
		
		//---------------------------------------------------------------------

		public static проц wxYield()
		{
			wxYield_func();
		}
		
		//---------------------------------------------------------------------

		public static проц BeginBusyCursor()
		{
			wxBeginBusyCursor_func();
		}

		public static проц EndBusyCursor()
		{
			wxEndBusyCursor_func();
		}
		
		//---------------------------------------------------------------------
		
		public static проц MutexGuiEnter()
		{
			wxMutexGuiEnter_func();
		}
		
		public static проц MutexGuiLeave()
		{
			wxMutexGuiLeave_func();
		}
		
			
	//---------------------------------------------------------------------

	alias BusyCursor wxBusyCursor;
	public class BusyCursor : IDisposable
	{
		private бул disposed = нет;
		public this()
		{
			BeginBusyCursor();
		}
	
		~this()
		{
			Dispose();
		}
	
		public проц Dispose()
		{
			if (!disposed) {
				disposed = да;
				EndBusyCursor();
			}
		}
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxWindowDisabler_ctor(ЦУк winToSkip);
		static extern (C) проц wxWindowDisabler_dtor(ЦУк сам);
		//! \endcond
		
	alias WindowDisabler wxWindowDisabler;
	public scope class WindowDisabler : wxObject
	{
		//---------------------------------------------------------------------

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
			{ this(cast(Окно)пусто);}

		public this(Окно winToSkip)
			{ this(wxWindowDisabler_ctor(wxObject.SafePtr(winToSkip)), да);}
			
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxWindowDisabler_dtor(шхобъ); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxBusyInfo_ctor(ткст message, ЦУк родитель);
		static extern (C) проц   wxBusyInfo_dtor(ЦУк сам);
		//! \endcond
		
	alias BusyInfo wxBusyInfo;
	public scope class BusyInfo : wxObject
	{
		//---------------------------------------------------------------------
	
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
	
		public this(ткст message)
			{ this(message, пусто);}
	
		public this(ткст message, Окно родитель)
			{ this(wxBusyInfo_ctor(message, wxObject.SafePtr(родитель)), да);}
			
		private this(ЦУк шхобъ, бул memOwn)
		{
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------

		override protected проц dtor() { wxBusyInfo_dtor(шхобъ); }
	}
	
	//---------------------------------------------------------------------
