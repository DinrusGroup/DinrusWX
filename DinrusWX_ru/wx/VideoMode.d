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

    private import stdrus;


//    [StructLayout(LayoutKind.Sequential)]

deprecated public VideoMode new_VideoMode(цел ширь, цел высь, цел глубь, цел freq)
{
    return VideoMode(ширь, высь, глубь, freq);
}

public struct VideoMode // : IComparable
{
    /** struct constructor */
    public static VideoMode opCall(цел ширь, цел высь, цел глубь, цел freq)
    {
        VideoMode v;
        v.w = ширь;
        v.h = высь;
        v.bpp = глубь;
        v.освежи = freq;
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
        else if (other.освежи > освежи)
            return -1;
        else if (other.освежи < освежи)
            return 1;
        else
            return 0;
    }

    public override цел opEquals(Объект объ)
    {
        if (объ === null) return false;
        VideoMode other = cast(VideoMode) объ;
        return (w == other.w) && (h == other.h) &&
               (bpp == other.bpp) && (освежи == other.освежи);
    }

    public override бцел toHash()
    {
        return w ^ h ^ bpp ^ освежи;
    }
    +/
    // returns да if this mode matches the other one in the sense that all
    // non zero fields of the other mode have the same значение in this one
    // (except for освежи which is allowed to have a greater значение)
    public бул Matches(VideoMode other)
    {
        return (other.w == 0 || w == other.w) &&
               (other.h == 0 || h == other.h) &&
               (other.bpp == 0 || bpp == other.bpp) &&
               (other.освежи == 0 || освежи >= other.освежи);
    }

    // trivial accessors
    public цел Ширь()
    {
        return w;
    }

    public цел Высь()
    {
        return h;
    }

    public цел Глубь()
    {
        return bpp;
    }

    // This is not defined in vidmode.h
    public цел RefreshFrequency()
    {
        return освежи;
    }


    // returns да if the object has been initialized
    // not implemented -- seems impossible
    // бул Ок() const { return w && h; }


        public ткст вТкст()
        {
            ткст s;

                s = stdrus.вТкст(w) ~ "x" ~ stdrus.вТкст(h);
                if ( bpp > 0 )
                    s ~= ", " ~ stdrus.вТкст(bpp) ~ "bpp";

                if ( освежи > 0 )
                    s ~= ", " ~ stdrus.вТкст(освежи) ~ "Hz";

            return s;
        }


    // the screen Размер in pixels (e.g. 640*480), 0 means unspecified
    private цел w, h;

    // bits per pixel (e.g. 32), 1 is monochrome and 0 means unspecified/known
    private цел bpp;

    // освежи frequency in Hz, 0 means unspecified/unknown
    private цел освежи;
}
