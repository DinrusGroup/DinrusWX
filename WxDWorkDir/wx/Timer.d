//-----------------------------------------------------------------------------
// wxD - Timer.d
// (C) 2006 afb <afb@users.sourceforge.net> (thanks to Matrix for updates)
// 
/// The wxTimer wrapper classes. (Optional, requires timer)
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Timer.d,v 1.1 2007/08/21 20:58:44 afb Exp $
//-----------------------------------------------------------------------------

module wx.Timer;
public import wx.common;
public import wx.EvtHandler;

	//---------------------------------------------------------------------------
	// Constants for Timer.Play
	//---------------------------------------------------------------------------
	
	/// generate notifications periodically until the timer is stopped (default)
	const бул wxTIMER_CONTINOUS = нет;

	/// only send the notification once and then stop the timer
	const бул wxTIMER_ONE_SHOT = да;

	//-----------------------------------------------------------------------------

		extern (C) {
		alias проц function (Timer) Virtual_Notify;
		}
		
		//! \cond EXTERN
		static extern (C) ЦУк wxTimer_ctor();
		static extern (C) ЦУк wxTimer_ctor2(ЦУк owner, цел ид);
		static extern (C) проц   wxTimer_RegisterVirtual(ЦУк сам, Timer объ, 
			Virtual_Notify notify);
		static extern (C) ЦУк wxTimer_dtor(ЦУк сам);

		static extern (C) цел wxTimer_GetInterval(ЦУк сам);
		static extern (C) бул wxTimer_IsOneShot(ЦУк сам);
		static extern (C) бул wxTimer_IsRunning(ЦУк сам);
		static extern (C) проц wxTimer_BaseNotify(ЦУк сам);
		static extern (C) проц wxTimer_SetOwner(ЦУк сам, ЦУк owner, цел ид);
		static extern (C) бул wxTimer_Start(ЦУк сам, цел milliseconds, бул oneShot);
		static extern (C) проц wxTimer_Stop(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias Timer wxTimer;
	public class Timer : EvtHandler
	{

		public this()
			{ this(wxTimer_ctor(), да); }
		
		public this(EvtHandler owner, цел ид=-1)
			{ this(wxTimer_ctor2(owner.шхобъ, ид), да); }
		
		public this(ЦУк шхобъ) 
		{
			super(шхобъ);
			
			wxTimer_RegisterVirtual(шхобъ, this, &staticNotify);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
			
			wxTimer_RegisterVirtual(шхобъ, this, &staticNotify);
		}

		override protected проц dtor() { wxTimer_dtor(шхобъ); }
		
		//---------------------------------------------------------------------
		
		static extern(C) private проц staticNotify(Timer объ)
		{
			объ.Notify();
		}
		protected /+virtual+/ проц Notify()
		{
			wxTimer_BaseNotify(шхобъ);
		}

		//---------------------------------------------------------------------
				
		public цел Interval()
		{
			return wxTimer_GetInterval(шхобъ);
		}
		
		public бул IsOneShot()
		{
			return wxTimer_IsOneShot(шхобъ);
		}
		
		public бул IsRunning()
		{
			return wxTimer_IsRunning(шхобъ);
		}
		
		public проц SetOwner(EvtHandler owner, цел ид=-1)
		{
			wxTimer_SetOwner(шхобъ, owner.шхобъ, ид);
		}
		
		public бул Start(цел milliseconds=-1, бул oneShot=нет)
		{
			return wxTimer_Start(шхобъ, milliseconds, oneShot);
		}

		public проц Stop()
		{
			wxTimer_Stop(шхобъ);
		}

	}
