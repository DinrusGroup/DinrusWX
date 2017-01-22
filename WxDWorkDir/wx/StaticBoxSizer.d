//-----------------------------------------------------------------------------
// wxD - StaticBoxSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticBoxSizer.cs
//
/// The wxStaticBoxSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: StaticBoxSizer.d,v 1.10 2007/08/20 08:39:16 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticBoxSizer;
public import wx.common;
public import wx.BoxSizer;
public import wx.StaticBox;

		//! \cond EXTERN
		static extern (C) ЦУк wxStaticBoxSizer_ctor(ЦУк box, цел orient);
		static extern (C) ЦУк wxStaticBoxSizer_GetStaticBox(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias StaticBoxSizer wxStaticBoxSizer;
	public class StaticBoxSizer : BoxSizer
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}

		public this(StaticBox box, цел orient)
		{
			super(wxStaticBoxSizer_ctor(wxObject.SafePtr(box), orient));
		}

		public this(цел orient, Окно родитель, ткст надпись)
		{
			this(new StaticBox(родитель, -1, надпись), orient);
		}

		//---------------------------------------------------------------------

		public StaticBox staticBox() 
			{
				return cast(StaticBox)FindObject(
                                    wxStaticBoxSizer_GetStaticBox(шхобъ)
                                );
			}

		//---------------------------------------------------------------------
	}
