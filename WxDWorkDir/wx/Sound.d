//-----------------------------------------------------------------------------
// wxD - Sound.d
// (C) 2006 afb <afb@users.sourceforge.net>
// 
/// The wxSound wrapper classes. (Optional on non-Windows platforms)
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Sound.d,v 1.4 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

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
		static extern (C) ЦУк wxSound_ctor();
		static extern (C) ЦУк wxSound_ctor2(ткст fileName, бул isResource);
		static extern (C) ЦУк wxSound_ctor3(цел size, ббайт* данные);
		static extern (C) ЦУк wxSound_dtor(ЦУк сам);

		static extern (C) бул wxSound_Play(ЦУк сам, бцел флаги);
		static extern (C) проц wxSound_Stop(ЦУк сам);
		static extern (C) бул wxSound_IsOk(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias Sound wxSound;
	public class Sound : wxObject
	{

		public this()
			{ this(wxSound_ctor(), да); }
		
		public this(ткст fileName, бул isResource=нет)
			{ this(wxSound_ctor2(fileName, isResource), да); }
		
		public this(ббайт[] данные)
			{ this(wxSound_ctor3(данные.length, данные.ptr), да); }

		public this(ЦУк шхобъ) 
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		override protected проц dtor() { wxSound_dtor(шхобъ); }

		//---------------------------------------------------------------------
				
		public бул Play(бцел флаги=wxSOUND_ASYNC)
		{
			return wxSound_Play(шхобъ, флаги);
		}

		public проц Stop()
		{
			wxSound_Stop(шхобъ);
		}
		
		public бул IsOk()
		{
			return wxSound_IsOk(шхобъ);
		}
		
		//---------------------------------------------------------------------

	    // Plays sound from фимя:
		static бул Play(ткст фимя, бцел флаги=wxSOUND_ASYNC)
		{
		    Sound snd = new Sound(фимя);
		    return snd.IsOk() ? snd.Play(флаги) : нет;
		}

	}
