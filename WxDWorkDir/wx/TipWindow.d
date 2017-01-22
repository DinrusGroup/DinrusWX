//-----------------------------------------------------------------------------
// wxD - TipWindow.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - tipwin.h
//
/// The wxTipWindow wrapper class
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: TipWindow.d,v 1.9 2006/11/17 15:21:01 afb Exp $
//-----------------------------------------------------------------------------

module wx.TipWindow;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
        static extern (C) ЦУк wxTipWindow_ctor(ЦУк родитель, ткст текст, цел maxLength, Прямоугольник* rectBound);
        //static extern (C) ЦУк wxTipWindow_ctorNoRect(ЦУк родитель, ткст текст, цел maxLength);
        //static extern (C) проц   wxTipWindow_SetTipWindowPtr(ЦУк сам, ЦУк wxTipWindow* windowPtr);
        static extern (C) проц   wxTipWindow_SetBoundingRect(ЦУк сам, inout Прямоугольник rectBound);
        static extern (C) проц   wxTipWindow_Close(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias TipWindow wxTipWindow;
    public class TipWindow : Окно
    {
        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(Окно родитель, ткст текст, цел maxLength = 100)
            { this(wxTipWindow_ctor(wxObject.SafePtr(родитель), текст, maxLength,пусто)); }

        public this(Окно родитель, ткст текст, цел maxLength, Прямоугольник rectBound)
            { this(wxTipWindow_ctor(wxObject.SafePtr(родитель), текст, maxLength, &rectBound)); }

        //-----------------------------------------------------------------------------

        /*public проц SetTipWindowPtr( TipWindow* windowPtr)
        {
            wxTipWindow_SetTipWindowPtr(шхобъ, wxObject.SafePtr(TipWindow* windowPtr));
        }*/

        //-----------------------------------------------------------------------------

        public проц BoundingRect(Прямоугольник значение) { wxTipWindow_SetBoundingRect(шхобъ, значение); }
    }
