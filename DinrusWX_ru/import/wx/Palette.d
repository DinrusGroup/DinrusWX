module wx.Palette;
public import wx.common;
public import wx.GDIObject;

		//! \cond EXTERN
		static extern (C) IntPtr wxPalette_ctor();
		static extern (C) проц wxPalette_dtor(IntPtr сам);
		static extern (C) бул wxPalette_Ok(IntPtr сам);
		static extern (C) бул wxPalette_Create(IntPtr сам, цел n, inout ubyte red, inout ubyte green, inout ubyte blue);
		static extern (C) цел wxPalette_GetPixel(IntPtr сам, ubyte red, ubyte green, ubyte blue);
		static extern (C) бул wxPalette_GetRGB(IntPtr сам, цел pixel, out ubyte red, out ubyte green, out ubyte blue);
		//! \endcond

	alias Палитра wxPalette;
	public class Палитра : GDIObject
	{
		public static Палитра wxNullPalette;
		//---------------------------------------------------------------------

		public this();
		public this(IntPtr wxobj);
		public this(цел n, inout ubyte r, inout ubyte g, inout ubyte b);
		public бул Создай(цел n, inout ubyte r, inout ubyte g, inout ubyte b);
		public static wxObject Нов(IntPtr ptr) ;
		public бул Ок();
		public цел GetPixel(ubyte red, ubyte green, ubyte blue);
		public бул GetRGB(цел pixel, out ubyte red, out ubyte green, out ubyte blue);
	}

