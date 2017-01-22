//------------------------------------------------------------------------
// wxD - Display.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Display.cs
//
/// The wxDisplay wrapper class
//
// Michael S. Muegel mike _at_ muegel dot org
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// TODO:
//    + Memory management review
//
// wxWidgets-based quirks of note:
//    + Display resolution did not change on my Fedora1 test system
//      under both wxWidgets display sample and my port.
//    + IsPrimary is wrong, at least on WIN32: assumes display #0
//      is primary, which may not be the case. For example, I have
//      three горизонтально aligned displays. wxWidgets numbers them
//      0, 1, 2. But it's #1 is actually the primary, not 0. Note also
//      that the numbering scheme differs from how windows numbers
//      them, which has more to do with the display adapter used. This
//      is not an issue really, but something to be aware of should
//      you be expecting them to match.
//------------------------------------------------------------------------

module wx.Display;
public import wx.common;

public import wx.VideoMode;
public import wx.Window;

//version(LDC) { pragma(ldc, "verbose") }

		//! \cond EXTERN
		static extern (C) ЦУк wxDisplay_ctor(цел индекс);
		//static extern (C) ЦУк wxDisplay_ctor(inout VideoMode mode);
		static extern (C) цел wxDisplay_GetCount();
		static extern (C) цел wxDisplay_GetFromPoint(inout Точка pt);
		static extern (C) цел wxDisplay_GetFromWindow(ЦУк окно);
		static extern (C) проц wxDisplay_GetGeometry(ЦУк сам, out Прямоугольник прям);
		static extern (C) ЦУк wxDisplay_GetName(ЦУк сам);
		static extern (C) бул wxDisplay_IsPrimary(ЦУк сам);
		static extern (C) проц wxDisplay_GetCurrentMode(ЦУк сам, out VideoMode mode);
		static extern (C) бул wxDisplay_ChangeMode(ЦУк сам, VideoMode mode);


		static extern (C) цел wxDisplay_GetNumModes(ЦУк сам, VideoMode mode);
		static extern (C) проц wxDisplay_GetModes(ЦУк сам, VideoMode mode, inout VideoMode[] modes);

		
		static extern (C) проц wxDisplay_ResetMode(ЦУк сам);
		static extern (C) проц wxDisplay_dtor(ЦУк сам);
		//! \endcond

	alias Display wxDisplay;
	public class Display : wxObject
	{
		//------------------------------------------------------------------------

		// Symbolic constant used by all Find()-like functions returning positive
		// integer on success as failure indicator. While this is global in
		// wxWidgets it makes more sense to be in each class that uses it??? 
		// Or maybe move it to Окно.cs.
		public const цел wxNOT_FOUND = -1;
		
		//------------------------------------------------------------------------
		
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		//------------------------------------------------------------------------

		public this(цел индекс)
			{ this(wxDisplay_ctor(индекс), да); }

		//------------------------------------------------------------------------

		//public this(VideoMode mode)
		//	{ this(wxDisplay_ctor(mode), да); }
			
		//---------------------------------------------------------------------

		override protected проц dtor() { wxDisplay_dtor(шхобъ); }

		//------------------------------------------------------------------------
		static цел Счёт() { return wxDisplay_GetCount(); }

		// an array of all Displays indexed by display number
		public static Display[] GetDisplays()
		{
			цел счёт = Счёт;
			Display[] displays = new Display[счёт];
			for (цел i = 0; i < счёт; i++)
			{
				displays[i] = new Display(i);
			}
			return displays;
		}

		//------------------------------------------------------------------------
		// An array of available VideoModes for this display.
		/+virtual+/ public VideoMode[] GetModes()
		{
			return GetModes(VideoMode(0,0,0,0));
		}

		// An array of the VideoModes that match mode. A match occurs when
		// the resolution and глубина matches and the refresh frequency in 
		// equal to or greater than mode.RefreshFrequency.
		/+virtual+/ public VideoMode[] GetModes(VideoMode mode)
		{
			цел num_modes = wxDisplay_GetNumModes(шхобъ, mode);
			VideoMode[] modes = new VideoMode[num_modes];
			wxDisplay_GetModes(шхобъ, mode, modes);
			return modes;
		}


		//------------------------------------------------------------------------

		public static цел GetFromPoint(Точка pt)
		{
			return wxDisplay_GetFromPoint(pt);
		}

		//------------------------------------------------------------------------

		/+virtual+/ public цел GetFromWindow(Окно окно)
		{
			version(__WXMSW__){
				return wxDisplay_GetFromWindow(wxObject.SafePtr(окно));
			} else {
				throw new Exception("Display.GetFromWindow is only available on WIN32");
			} // version(__WXMSW__)
		}

		//------------------------------------------------------------------------

		/+virtual+/ public Прямоугольник Geometry()
		{
			Прямоугольник прям;
			wxDisplay_GetGeometry(шхобъ, прям);
			return прям;
		}

		//------------------------------------------------------------------------

		/+virtual+/ public ткст Имя()
		{
			return cast(ткст) new wxString(wxDisplay_GetName(шхобъ), да);
		}

		//------------------------------------------------------------------------

		/+virtual+/ public бул IsPrimary()
		{
			return wxDisplay_IsPrimary(шхобъ);
		}

		//------------------------------------------------------------------------


		/+virtual+/ public VideoMode CurrentMode()
		{
			VideoMode mode;
			wxDisplay_GetCurrentMode(шхобъ, mode);
			return mode;
		}

		//------------------------------------------------------------------------

		/+virtual+/ public бул ChangeMode(VideoMode mode)
		{
			return wxDisplay_ChangeMode(шхобъ, mode);
		}

		//------------------------------------------------------------------------

		/+virtual+/ public проц ResetMode()
		{
			wxDisplay_ResetMode(шхобъ);
		}

		//------------------------------------------------------------------------

	}

