//-----------------------------------------------------------------------------
// wxD - MiniFrame.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MiniFrame.cs
//
/// The wxMiniFrame wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MiniFrame.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.MiniFrame;
public import wx.common;
public import wx.Frame;

		//! \cond EXTERN
        static extern (C) ЦУк wxMiniFrame_ctor();
        static extern (C) бул   wxMiniFrame_Create(ЦУк сам, ЦУк родитель, цел ид, ткст title, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias MiniFrame wxMiniFrame;
    public class MiniFrame : Frame
    {
        enum { wxDEFAULT_MINIFRAME_STYLE = wxCAPTION | wxCLIP_CHILDREN | wxRESIZE_BORDER }
    
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { this(wxMiniFrame_ctor()); }

        public this(Окно родитель, цел ид, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_MINIFRAME_STYLE, ткст имя=wxFrameNameStr)
        {
        	this();
            if (!Create(родитель, ид, title, поз, size, стиль, имя))
            {
                throw new InvalidOperationException("Could not create MiniFrame");
            }
        }
	
	//---------------------------------------------------------------------
		// ctors with сам created ид
	
        public this(Окно родитель, ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_MINIFRAME_STYLE, ткст имя=wxFrameNameStr)
	    { this(родитель, Окно.UniqueID, title, поз, size, стиль, имя);}
	
	//-----------------------------------------------------------------------------

        public override бул Create(Окно родитель, цел ид, ткст title, inout Точка поз, inout Размер size, цел стиль, ткст имя)
        {
            return wxMiniFrame_Create(шхобъ, wxObject.SafePtr(родитель), ид, title, поз, size, стиль, имя);
        }

        //-----------------------------------------------------------------------------

        // Helper constructors

        public this(ткст title, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=wxDEFAULT_MINIFRAME_STYLE)
            { this(пусто, -1, title, поз, size, стиль); }

        //-----------------------------------------------------------------------------
    }

