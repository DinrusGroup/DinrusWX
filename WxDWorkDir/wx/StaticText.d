//-----------------------------------------------------------------------------
// wxD - StaticText.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticText.cs
//
/// The wxStaticText wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StaticText.d,v 1.11 2009/02/11 08:04:29 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticText;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxStaticText_ctor();
		static extern (C) бул   wxStaticText_Create(ЦУк сам, ЦУк родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц   wxStaticText_Wrap(ЦУк сам, цел ширина);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias StaticText wxStaticText;
	public class StaticText : Control
	{
		public const цел wxST_NO_AUTORESIZE = 0x0001;
	
		public const ткст wxStaticTextNameStr = "message";
	
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		public this()
			{ super(wxStaticText_ctor()); }

		public this(Окно родитель, цел ид, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxStaticTextNameStr)
		{
			super(wxStaticText_ctor());
			if (!Create(родитель, ид, надпись, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create StaticText");
			}
		}

		public static wxObject Нов(ЦУк шхобъ) { return new StaticText(шхобъ); }
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxStaticTextNameStr)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxStaticText_Create(шхобъ, wxObject.SafePtr(родитель), ид, надпись, поз, size, cast(бцел)стиль, имя);
		}
	
		//---------------------------------------------------------------------

		public проц Wrap(цел ширина)
		{
			wxStaticText_Wrap(шхобъ, ширина);
		}
	}
