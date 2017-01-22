//-----------------------------------------------------------------------------
// wxD - StaticBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - StaticBox.cs
//
/// The wxStaticBox wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
// $Ид: StaticBox.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.StaticBox;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxStaticBox_ctor();
		static extern (C) бул wxStaticBox_Create(ЦУк сам, ЦУк родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		//! \endcond
	
		//---------------------------------------------------------------------

	alias StaticBox wxStaticBox;
	public class StaticBox : Control
	{
		public const ткст wxStaticBoxNameStr = "groupBox";

		public this()
			{ super(wxStaticBox_ctor()); }

		public this(ЦУк шхобъ)
			{ super(шхобъ); }
			
		public this(Окно окно, цел ид, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxStaticBoxNameStr)
		{
			this();
			if (!Create(окно, ид, надпись, поз, size, стиль, имя))
			{
				throw new InvalidOperationException("Failed to create StaticBox");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new StaticBox(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно окно, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxStaticBoxNameStr)
			{ this(окно, Окно.UniqueID, надпись, поз, size, стиль, имя);}

		//---------------------------------------------------------------------

		public бул Create(Окно окно, цел ид, ткст надпись, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxStaticBox_Create(шхобъ, wxObject.SafePtr(окно), 
					ид, надпись, поз, size, 
					cast(бцел)стиль, имя);
		}
	}
