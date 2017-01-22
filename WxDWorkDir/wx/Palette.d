//-----------------------------------------------------------------------------
// wxD - Палитра.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Палитра.cs
//
/// The wxPalette wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//-----------------------------------------------------------------------------


module wx.Palette;
public import wx.common;
public import wx.GDIObject;

		//! \cond EXTERN
		static extern (C) ЦУк wxPalette_ctor();
		static extern (C) проц wxPalette_dtor(ЦУк сам);
		static extern (C) бул wxPalette_Ok(ЦУк сам);
		static extern (C) бул wxPalette_Create(ЦУк сам, цел n, inout ббайт красный, inout ббайт зелёный, inout ббайт синий);
		static extern (C) цел wxPalette_GetPixel(ЦУк сам, ббайт красный, ббайт зелёный, ббайт синий);
		static extern (C) бул wxPalette_GetRGB(ЦУк сам, цел pixel, out ббайт красный, out ббайт зелёный, out ббайт синий);
		//! \endcond

	alias Палитра wxPalette;
	public class Палитра : GDIObject
	{
		public static Палитра wxNullPalette;
		//---------------------------------------------------------------------

		public this()
			{ this(wxPalette_ctor());}

		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public this(цел n, inout ббайт к, inout ббайт з, inout ббайт с)
		{
			this(wxPalette_ctor());
			if (!wxPalette_Create(шхобъ, n, к, з, с))
			{
				throw new InvalidOperationException("Failed to create Палитра");
			}
		}

		public бул Create(цел n, inout ббайт к, inout ббайт з, inout ббайт с)
		{
			return wxPalette_Create(шхобъ, n, к, з, с);
		}

		public static wxObject Нов(ЦУк ptr) { return new Палитра(ptr); }
		//---------------------------------------------------------------------

		public бул Ок()
		{
			return wxPalette_Ok(шхобъ);
		}

		//---------------------------------------------------------------------

		public цел GetPixel(ббайт красный, ббайт зелёный, ббайт синий)
		{
			return wxPalette_GetPixel(шхобъ, красный, зелёный, синий);
		}

		public бул GetRGB(цел pixel, out ббайт красный, out ббайт зелёный, out ббайт синий)
		{
			return wxPalette_GetRGB(шхобъ, pixel, красный, зелёный, синий);
		}

		//---------------------------------------------------------------------
	}

