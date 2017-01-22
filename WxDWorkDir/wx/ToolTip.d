//-----------------------------------------------------------------------------
// wxD - ToolTip.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ToolTip.cs
//
/// The wxToolTip wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ToolTip.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.ToolTip;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) проц   wxToolTip_Enable(бул flag);
		static extern (C) проц   wxToolTip_SetDelay(бцел msecs);
		static extern (C) ЦУк wxToolTip_ctor(ткст tip);
		static extern (C) проц   wxToolTip_SetTip(ЦУк сам, ткст tip);
		static extern (C) ЦУк wxToolTip_GetTip(ЦУк сам);
		static extern (C) ЦУк wxToolTip_GetWindow(ЦУк сам);
		static extern (C) проц   wxToolTip_SetWindow(ЦУк сам,ЦУк окн);
		//! \endcond

        //---------------------------------------------------------------------

	alias ToolTip wxToolTip;
	public class ToolTip : wxObject
	{
        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(ткст tip)
            { super(wxToolTip_ctor(tip)); }

        //---------------------------------------------------------------------

        static проц Enabled(бул значение) 
            {
                wxToolTip_Enable(значение);
            }

        //---------------------------------------------------------------------
        
        static проц Delay(цел значение) 
            {
                wxToolTip_SetDelay(cast(бцел)значение);
            }

        //---------------------------------------------------------------------

        public ткст Tip() 
            {
                return cast(ткст) new wxString(wxToolTip_GetTip(шхобъ), да);
            }
        public проц Tip(ткст значение) 
            {
                wxToolTip_SetTip(шхобъ, значение);
            }

        //---------------------------------------------------------------------

        public Окно окно() 
            {
                return cast(Окно)FindObject(wxToolTip_GetWindow(шхобъ));
            }
        public проц окно(Окно окн) 
            {
                return wxToolTip_SetWindow(шхобъ,wxObject.SafePtr(окн));
            }

        //---------------------------------------------------------------------
	}

