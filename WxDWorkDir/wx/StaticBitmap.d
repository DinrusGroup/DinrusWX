//-----------------------------------------------------------------------------
// wxD - StaticBitmap.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticBitmap.cs
//
/// The wxStaticBitmap wrapper class.
//
// Written by Robert Roebling
// (C) 2003 Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: StaticBitmap.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticBitmap;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxStaticBitmap_ctor();
		static extern (C) бул wxStaticBitmap_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк надпись, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxStaticBitmap_SetBitmap(ЦУк сам, ЦУк битмап);
		static extern (C) ЦУк wxStaticBitmap_GetBitmap(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias StaticBitmap wxStaticBitmap;
	public class StaticBitmap : Control
	{
		public const ткст wxStaticBitmapNameStr = "message";

		public this()
			{ super(wxStaticBitmap_ctor()); }

		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this(Окно родитель, цел ид, Битмап надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxStaticBitmapNameStr)
		{
			super(wxStaticBitmap_ctor());
			if (!Create(родитель, ид, надпись, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create StaticBitmap");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new StaticBitmap(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Битмап надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxStaticBitmapNameStr)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, имя);}
		
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, Битмап надпись, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxStaticBitmap_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(надпись), поз, size, cast(бцел)стиль, имя);
		}

		//---------------------------------------------------------------------

		public проц битмап(Битмап значение) { wxStaticBitmap_SetBitmap(шхобъ, wxObject.SafePtr(значение)); }
		public Битмап битмап() { return cast(Битмап)FindObject(wxStaticBitmap_GetBitmap(шхобъ), &Битмап.Нов); }
	}
