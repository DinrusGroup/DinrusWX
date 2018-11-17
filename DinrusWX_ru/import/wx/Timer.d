module wx.Timer;
public import wx.common;
public import wx.EvtHandler;

	//---------------------------------------------------------------------------
	// Constants for Timer.Play
	//---------------------------------------------------------------------------
	
	/// generate notifications periodically until the timer is stopped (default)
	const бул wxTIMER_CONTINOUS = false;

	/// only send the notification once and then stop the timer
	const бул wxTIMER_ONE_SHOT = да;

	//-----------------------------------------------------------------------------

		extern (C) {
		alias проц function (Timer) Virtual_Notify;
		}
		
		//! \cond EXTERN
		static extern (C) IntPtr wxTimer_ctor();
		static extern (C) IntPtr wxTimer_ctor2(IntPtr owner, цел ид);
		static extern (C) проц   wxTimer_RegisterVirtual(IntPtr сам, Timer объ, 
			Virtual_Notify notify);
		static extern (C) IntPtr wxTimer_dtor(IntPtr сам);

		static extern (C) цел wxTimer_GetInterval(IntPtr сам);
		static extern (C) бул wxTimer_IsOneShot(IntPtr сам);
		static extern (C) бул wxTimer_IsRunning(IntPtr сам);
		static extern (C) проц wxTimer_BaseNotify(IntPtr сам);
		static extern (C) проц wxTimer_SetOwner(IntPtr сам, IntPtr owner, цел ид);
		static extern (C) бул wxTimer_Start(IntPtr сам, цел milliseconds, бул oneShot);
		static extern (C) проц wxTimer_Stop(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias Timer wxTimer;
	public class Timer : ОбработчикСоб
	{

		public this();
		public this(ОбработчикСоб owner, цел ид=-1);
		public this(IntPtr wxobj) ;
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
		static extern(C) private проц staticNotify(Timer объ);
		protected  проц Notify();
		public цел Interval();
		public бул IsOneShot();
		public бул IsRunning();
		public проц УстOwner(ОбработчикСоб owner, цел ид=-1);
		public бул Start(цел milliseconds=-1, бул oneShot=false);
		public проц Stop();

	}
