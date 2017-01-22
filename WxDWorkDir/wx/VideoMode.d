//-----------------------------------------------------------------------------
// wxD - VidMode.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - VidMode.cs
//
/// The VideoMode class
//
// Michael S. Muegel mike _at_ muegel dot org
//
// Given this is such a simple structure I did a full port of it's C++ 
// counterpart instead of using a wrapper.
//
// Changes/Additions to C++ version:
//    + ToString() method for simple formatting of display properties
//    + Implemented IComparable to allow for simple sorting of modes
//    + Did not implement IsOK -- maybee I did not understand it but
//      it seems impossible to not be да.
//
// Note that == and the Matches method differ in how they work. == is
// да equality of all properties. Matches implements the wxWidgets
// concept of display equivalence.
//
// VideoMode is immutable: it can not be modified once created, either manually
// via it's constructor or more likely by calling a method in Display.
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: VideoMode.d,v 1.15 2009/04/28 11:11:50 afb Exp $
//-----------------------------------------------------------------------------

module wx.VideoMode;
public import wx.common;

//! \cond STD
version (Tango)
{
import tango.core.Version;
import tango.текст.convert.Integer;
}

version(Phobos)
{
private import std.ткст;
private import std.conv;
}

version(Dinrus)
{
import stdrus;
alias вТкст toString;
}
//! \endcond

//    [StructLayout(LayoutKind.Sequential)]

        deprecated public VideoMode new_VideoMode(цел ширина, цел высота, цел глубина, цел freq)
        {
            return VideoMode(ширина, высота, глубина, freq);
        }

    public struct VideoMode // : IComparable
    {
        /** struct constructor */
        public static VideoMode opCall(цел ширина, цел высота, цел глубина, цел freq)
        {
            VideoMode v;
            v.w = ширина;
            v.h = высота;
            v.bpp = глубина;
            v.refresh = freq;
            return v;
        }
/+
		public цел opCmp(VideoMode other)
		{
		//	VideoMode other = cast(VideoMode) объ;
			if (other.w > w)
				return -1;
			else if (other.w < w)
				return 1;
			else if (other.h > h)
				return -1;
			else if (other.h < h)
				return 1;
			else if (other.bpp > bpp)
				return -1;
			else if (other.bpp < bpp)
				return 1;
			else if (other.refresh > refresh)
				return -1;
			else if (other.refresh < refresh)
				return 1;
			else
				return 0;
		}

        public override цел opEquals(Объект объ)
        {
            if (объ === пусто) return нет;
            VideoMode other = cast(VideoMode) объ;
            return (w == other.w) && (h == other.h) && 
                (bpp == other.bpp) && (refresh == other.refresh);
        }

        public override бцел toHash()
        {
            return w ^ h ^ bpp ^ refresh;
        }
+/
        // returns да if this mode matches the other one in the sense that all
        // non zero fields of the other mode have the same значение in this one
        // (except for refresh which is allowed to have a greater значение)
        public бул Matches(VideoMode other)
        {
            return (other.w == 0 || w == other.w) &&
                (other.h == 0 || h == other.h) &&
                (other.bpp == 0 || bpp == other.bpp) &&
                (other.refresh == 0 || refresh >= other.refresh);
        }

        // trivial accessors
        public цел Ширина() { return w; }

        public цел Высота() { return h; }

        public цел Depth() { return bpp; }

        // This is not defined in vidmode.h
        public цел RefreshFrequency() { return refresh; }


        // returns да if the object has been initialized
        // not implemented -- seems impossible
        // бул IsOk() const { return w && h; }

	version (Tango)
	{
	  static if (Tango.Major == 0 && Tango.Minor < 994)
	  {
		public сим[] toUtf8()
		{
			сим[] s;
			s = tango.текст.convert.Integer.toUtf8(w) ~ "x" ~ tango.текст.convert.Integer.toUtf8(h);
			if ( bpp > 0 )
				s ~= ", " ~ tango.текст.convert.Integer.toUtf8(bpp) ~ "bpp";
			if ( refresh > 0 )
				s ~= ", " ~ tango.текст.convert.Integer.toUtf8(refresh) ~ "Hz";
			return s;
		}
	  }
	  else
	  {
		public ткст toString()
		{
			ткст s;
			s = tango.текст.convert.Integer.toString(w) ~ "x" ~ tango.текст.convert.Integer.toString(h);
			if ( bpp > 0 )
				s ~= ", " ~ tango.текст.convert.Integer.toString(bpp) ~ "bpp";

			if ( refresh > 0 )
				s ~= ", " ~ tango.текст.convert.Integer.toString(refresh) ~ "Hz";

			return s;
		}
	  }
	}
	else // Phobos
	{
		public ткст toString()
		{
			ткст s;
			version (D_Version2)
			{
			s = to!(ткст)(w) ~ "x" ~ to!(ткст)(h);
			if ( bpp > 0 )
				s ~= ", " ~ to!(ткст)(bpp) ~ "bpp";

			if ( refresh > 0 )
				s ~= ", " ~ to!(ткст)(refresh) ~ "Hz";
			}
			else
			{
			s = .toString(w) ~ "x" ~ .toString(h);
			if ( bpp > 0 )
				s ~= ", " ~ .toString(bpp) ~ "bpp";

			if ( refresh > 0 )
				s ~= ", " ~ .toString(refresh) ~ "Hz";
			}

			return s;
		}
	}

        // the screen size in pixels (e.з. 640*480), 0 means unspecified
        private цел w, h;

        // bits per pixel (e.з. 32), 1 is monochrome and 0 means unspecified/known
        private цел bpp;

        // refresh frequency in Hz, 0 means unspecified/unknown
        private цел refresh;
    }
