//-----------------------------------------------------------------------------
// wxD - Кнопка.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Кнопка.cs
//
/// The wxButton wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Кнопка.d,v 1.12 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.Button;
public import wx.common;
public import wx.Control;
public import wx.Bitmap;

		//! \cond EXTERN
		static extern (C) ЦУк wxButton_ctor();
		static extern (C) бул   wxButton_Create(ЦУк сам, ЦУк родитель, цел ид, ткст надпись, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) проц   wxButton_SetDefault(ЦУк сам);
		static extern (C) проц   wxButton_GetDefaultSize(out Размер size);
		
		//static extern (C) проц wxButton_SetImageMargins(ЦУк сам, цел x, цел y);
		//static extern (C) проц wxButton_SetImageLabel(ЦУк сам, ЦУк битмап);
		
		//static extern (C) проц wxButton_SetLabel(ЦУк сам, ткст надпись);
		//! \endcond

		//---------------------------------------------------------------------

	alias Кнопка wxButton;
	public class Кнопка : Control
	{
		public const цел wxBU_LEFT          =  0x0040;
		public const цел wxBU_TOP           =  0x0080;
		public const цел wxBU_RIGHT         =  0x0100;
		public const цел wxBU_BOTTOM        =  0x0200;
		public const цел wxBU_EXACTFIT      =  0x0001;
		
		//---------------------------------------------------------------------
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ this(wxButton_ctor()); }

		public this(Окно родитель, цел ид, ткст надпись = "", Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator validator = пусто, ткст имя = пусто)
		{
			this(wxButton_ctor());
			if (!Create(родитель, ид, надпись, поз, size, стиль, validator, имя))
			{
				throw new InvalidOperationException("Не удалось создать Кнопку");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new Кнопка(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, ткст надпись, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, Validator validator = пусто, ткст имя = пусто)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, validator, имя);}
			
		//---------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, ткст надпись, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
		{
			return wxButton_Create(шхобъ, wxObject.SafePtr(родитель), ид, надпись, поз, size, cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}

		//---------------------------------------------------------------------

		public проц SetDefault()
		{
			wxButton_SetDefault(шхобъ);
		}

		//---------------------------------------------------------------------

		public static Размер GetDefaultSize()
		{
			Размер size;
			wxButton_GetDefaultSize(size);
			return size;
		}
		
		//---------------------------------------------------------------------
	/+	
		public /+virtual+/ проц ImageLabel(Битмап значение)
		{
			wxButton_SetImageLabel(шхобъ, wxObject.SafePtr(значение));
		}
	+/	
		//---------------------------------------------------------------------
	/+	
		public /+virtual+/ проц SetImageMargins(цел x, цел y)
		{
			wxButton_SetImageMargins(шхобъ, x, y);
		}
		+/
		//---------------------------------------------------------------------
		// Do we need get also ?
	/+	
		public override проц Label(ткст значение)
		{
			wxButton_SetLabel(шхобъ, значение);
		}
		+/
		//---------------------------------------------------------------------
		
		public проц Click_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_BUTTON_CLICKED, ИД, значение, this); }
		public проц Click_Remove(EventListener значение) { RemoveHandler(значение, this); }
	}

