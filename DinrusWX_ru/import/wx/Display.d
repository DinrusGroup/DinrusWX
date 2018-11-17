module wx.Display;
public import wx.common;

public import wx.VideoMode;
public import wx.Window;

//version(LDC) { pragma(ldc, "verbose") }

		//! \cond EXTERN
		static extern (C) IntPtr wxDisplay_ctor(цел index);
		//static extern (C) IntPtr wxDisplay_ctor(inout VideoMode mode);
		static extern (C) цел wxDisplay_GetCount();
		static extern (C) цел wxDisplay_GetFromPoint(inout Точка тчк);
		static extern (C) цел wxDisplay_GetFromWindow(IntPtr окно);
		static extern (C) проц wxDisplay_GetGeometry(IntPtr сам, out Прямоугольник прям);
		static extern (C) IntPtr wxDisplay_GetName(IntPtr сам);
		static extern (C) бул wxDisplay_IsPrimary(IntPtr сам);
		static extern (C) проц wxDisplay_GetCurrentMode(IntPtr сам, out VideoMode mode);
		static extern (C) бул wxDisplay_ChangeMode(IntPtr сам, VideoMode mode);


		static extern (C) цел wxDisplay_GetNumModes(IntPtr сам, VideoMode mode);
		static extern (C) проц wxDisplay_GetModes(IntPtr сам, VideoMode mode, inout VideoMode[] modes);

		
		static extern (C) проц wxDisplay_ResetMode(IntPtr сам);
		static extern (C) проц wxDisplay_dtor(IntPtr сам);
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
		
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this(цел index);
		override protected проц dtor() ;
		static цел Счёт() ;
		public static Display[] GetDisplays();
		 public VideoMode[] GetModes();
		 public VideoMode[] GetModes(VideoMode mode);
		public static цел GetFromPoint(Точка тчк);
		 public цел GetFromWindow(Окно окно);
		 public Прямоугольник Geometry();
		 public ткст Имя();
		 public бул IsPrimary();
		 public VideoMode CurrentMode();
		 public бул ChangeMode(VideoMode mode);
		 public проц ResetMode();
	}

