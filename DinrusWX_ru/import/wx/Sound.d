module wx.Sound;
public import wx.common;

	//---------------------------------------------------------------------------
	// Constants for Sound.Play
	//---------------------------------------------------------------------------
	
	const бцел wxSOUND_SYNC = 0U;
	const бцел wxSOUND_ASYNC = 1U;
	const бцел wxSOUND_LOOP = 2U;

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxSound_ctor();
		static extern (C) IntPtr wxSound_ctor2(ткст fileName, бул isResource);
		static extern (C) IntPtr wxSound_ctor3(цел разм, ubyte* data);
		static extern (C) IntPtr wxSound_dtor(IntPtr сам);

		static extern (C) бул wxSound_Play(IntPtr сам, бцел флаги);
		static extern (C) проц wxSound_Stop(IntPtr сам);
		static extern (C) бул wxSound_IsOk(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias Sound wxSound;
	public class Sound : wxObject
	{

		public this();
		public this(ткст fileName, бул isResource=false);
		public this(ubyte[] data);
		public this(IntPtr wxobj) ;
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor();
		public бул Play(бцел флаги=wxSOUND_ASYNC);
		public проц Stop();
		public бул Ок();
		static бул Play(ткст filename, бцел флаги=wxSOUND_ASYNC);

	}
