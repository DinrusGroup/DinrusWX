//-----------------------------------------------------------------------------
// wxD - StaticLine.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticLine.cs
//
/// The wxStaticLine wrapper class.
//
// Written by Robert Roebling
// (C) 2003 by Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StaticLine.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticLine;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxStaticLine_ctor();
		static extern (C) бул wxStaticLine_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) бул wxStaticLine_IsVertical(ЦУк сам);
		static extern (C) цел  wxStaticLine_GetDefaultSize(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias StaticLine wxStaticLine;
	public class StaticLine : Control
	{
		enum {
			wxLI_HORIZONTAL	= Ориентация.wxHORIZONTAL,
			wxLI_VERTICAL		= Ориентация.wxVERTICAL,
		}
		
		public const ткст wxStaticTextNameStr = "message";
		//---------------------------------------------------------------------
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ);}
        
		public this()
			{ super(wxStaticLine_ctor()); }

		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxLI_HORIZONTAL, ткст имя = wxStaticTextNameStr)
		{
			super(wxStaticLine_ctor());
			if (!Create(родитель, ид, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create StaticText");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new StaticLine(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxLI_HORIZONTAL, ткст имя = wxStaticTextNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxStaticLine_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя);
		}
		
		//---------------------------------------------------------------------
		
		public бул IsVertical()
		{
			return wxStaticLine_IsVertical(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public цел DefaultSize() { return wxStaticLine_GetDefaultSize(шхобъ); }
	}
