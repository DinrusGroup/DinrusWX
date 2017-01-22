//-----------------------------------------------------------------------------
// wxD - BitmapButton.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - BitMapButton.cs
//
/// The wxBitmapButton wrapper class.
//
// Written by Robert Roebling
// (C) 2003 Robert Roebling
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: BitmapButton.d,v 1.11 2007/03/13 17:02:40 afb Exp $
//-----------------------------------------------------------------------------

module wx.BitmapButton;
public import wx.common;
public import wx.Bitmap;
public import wx.Button;
public import wx.Control;

		//! \cond EXTERN
		extern (C) {
		alias проц function(BitmapButton объ) Virtual_OnSetBitmap;
		}
		
		static extern (C) ЦУк wxBitmapButton_ctor();
		static extern (C) проц   wxBitmapButton_RegisterVirtual(ЦУк сам, BitmapButton объ,Virtual_OnSetBitmap onSetBitmap);
		//static extern (C) проц   wxBitmapButton_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) бул   wxBitmapButton_Create(ЦУк сам, ЦУк родитель, цел ид, ЦУк надпись, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
	//	static extern (C) проц   wxBitmapButton_SetDefault(ЦУк сам);
		
		//static extern (C) проц wxBitmapButton_SetLabel(ЦУк сам, ткст надпись);
		//static extern (C) ЦУк wxBitmapButton_GetLabel(ЦУк сам);
		
		//static extern (C) бул wxBitmapButton_Enable(ЦУк сам, бул enable);

		//static extern (C) проц   wxBitmapButton_SetBitmapLabel(ЦУк сам, ЦУк битмап);
		//static extern (C) ЦУк wxBitmapButton_GetBitmapLabel(ЦУк сам);
		
		//static extern (C) проц wxBitmapButton_SetBitmapSelected(ЦУк сам, ЦУк битмап);
	//	static extern (C) ЦУк wxBitmapButton_GetBitmapSelected(ЦУк сам);

		//static extern (C) проц wxBitmapButton_SetBitmapFocus(ЦУк сам, ЦУк битмап);
		//static extern (C) ЦУк wxBitmapButton_GetBitmapFocus(ЦУк сам);

	//	static extern (C) проц wxBitmapButton_SetBitmapDisabled(ЦУк сам, ЦУк битмап);
	//	static extern (C) ЦУк wxBitmapButton_GetBitmapDisabled(ЦУк сам);
		
		//static extern (C) проц wxBitmapButton_OnSetBitmap(ЦУк сам);
		
		//static extern (C) проц wxBitmapButton_ApplyParentThemeBackground(ЦУк сам, ЦУк colour);
		//! \endcond

		//---------------------------------------------------------------------
		
		public const цел wxBU_AUTODRAW      =  0x0004;
		
		//---------------------------------------------------------------------
		
	alias BitmapButton wxBitmapButton;
	public class BitmapButton : Control
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

/+		public this()
		{
			this(wxBitmapButton_ctor());
			wxBitmapButton_RegisterVirtual(шхобъ, this, &staticOnSetBitmap);
		}

		public this(Окно родитель, цел ид, Битмап надпись)
			{ this(родитель, ид, надпись, wxDefaultPosition, wxDefaultSize, 0, пусто, пусто); }

		public this(Окно родитель, цел ид, Битмап надпись, Точка поз)
			{ this(родитель, ид, надпись, поз, wxDefaultSize, 0, пусто, пусто); }

		public this(Окно родитель, цел ид, Битмап надпись, Точка поз, Размер size)
			{ this(родитель, ид, надпись, поз, size, 0, пусто, пусто); }

		public this(Окно родитель, цел ид, Битмап надпись, Точка поз, Размер size, цел стиль)
			{ this(родитель, ид, надпись, поз, size, стиль, пусто, пусто); }

		public this(Окно родитель, цел ид, Битмап надпись, Точка поз, Размер size, цел стиль, Validator validator)
			{ this(родитель, ид, надпись, поз, size, стиль, validator, пусто); }

		public this(Окно родитель, цел ид, Битмап надпись, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
		{
			this();
			
			if (!Create(родитель, ид, надпись, поз, size, стиль, validator, имя))
			{
				throw new InvalidOperationException("Failed to create BitmapButton");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new BitmapButton(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
			
		public this(Окно родитель, Битмап надпись)
			{ this(родитель, Окно.UniqueID, надпись, wxDefaultPosition, wxDefaultSize, 0, пусто, пусто); }

		public this(Окно родитель, Битмап надпись, Точка поз)
			{ this(родитель, Окно.UniqueID, надпись, поз, wxDefaultSize, 0, пусто, пусто); }

		public this(Окно родитель, Битмап надпись, Точка поз, Размер size)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, 0, пусто, пусто); }

		public this(Окно родитель, Битмап надпись, Точка поз, Размер size, цел стиль)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, пусто, пусто); }

		public this(Окно родитель, Битмап надпись, Точка поз, Размер size, цел стиль, Validator validator)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, validator, пусто); }

		public this(Окно родитель, Битмап надпись, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
			{ this(родитель, Окно.UniqueID, надпись, поз, size, стиль, validator, имя);}
+/
		//---------------------------------------------------------------------
		
		public бул Create(Окно родитель, цел ид, Битмап надпись, Точка поз, Размер size, бцел стиль, Validator validator, ткст имя)
		{
			return wxBitmapButton_Create(шхобъ, wxObject.SafePtr(родитель), ид, wxObject.SafePtr(надпись), поз, size, стиль, wxObject.SafePtr(validator), имя);
		}

		//---------------------------------------------------------------------		
/+
		public проц SetDefault()
		{
			wxBitmapButton_SetDefault(шхобъ);
		}
		+/
		//---------------------------------------------------------------------		
/+		
		public ткст StringLabel() { return cast(ткст) new wxString(wxBitmapButton_GetLabel(шхобъ), да); }
		public проц StringLabel(ткст значение) { wxBitmapButton_SetLabel(шхобъ, значение); }
		
		public проц SetLabel(ткст надпись)
		{
			wxBitmapButton_SetLabel(шхобъ, надпись);
		}
		
		public ткст GetLabel()
		{
			return cast(ткст) new wxString(wxBitmapButton_GetLabel(шхобъ), да);
		}
		+/
		//---------------------------------------------------------------------
/+		
		public бул Enable()
		{
			return Enable(да);
		}
		
		public бул Enable(бул enable)
		{
			return wxBitmapButton_Enable(шхобъ, enable);
		}
+/
		//---------------------------------------------------------------------
/+
		public Битмап BitmapLabel() { return cast(Битмап)FindObject(wxBitmapButton_GetBitmapLabel(шхобъ), &Битмап.Нов); }
		public проц BitmapLabel(Битмап значение) { wxBitmapButton_SetBitmapLabel(шхобъ, wxObject.SafePtr(значение)); }
		+/
/+
		public Битмап Label() { return cast(Битмап)FindObject(wxBitmapButton_GetBitmapLabel(шхобъ), &Битмап.Нов); }
		public проц Label(Битмап значение) { wxBitmapButton_SetBitmapLabel(шхобъ, wxObject.SafePtr(значение)); }
+/
		
		//---------------------------------------------------------------------
/+		
		public Битмап BitmapSelected() { return cast(Битмап)FindObject(wxBitmapButton_GetBitmapSelected(шхобъ), &Битмап.Нов); }
		public проц BitmapSelected(Битмап значение) { wxBitmapButton_SetBitmapSelected(шхобъ, wxObject.SafePtr(значение)); }
		+/
		/+
		public Битмап BitmapFocus() { return cast(Битмап)FindObject(wxBitmapButton_GetBitmapFocus(шхобъ), &Битмап.Нов); }
		public проц BitmapFocus(Битмап значение) { wxBitmapButton_SetBitmapFocus(шхобъ, wxObject.SafePtr(значение)); }

		public Битмап BitmapDisabled() { return cast(Битмап)FindObject(wxBitmapButton_GetBitmapDisabled(шхобъ), &Битмап.Нов); }
		public проц BitmapDisabled(Битмап значение) { wxBitmapButton_SetBitmapDisabled(шхобъ, wxObject.SafePtr(значение)); }
+/
		//---------------------------------------------------------------------
		//! \cond EXTERN
/+		extern(C) private static проц staticOnSetBitmap(BitmapButton объ) { return объ.OnSetBitmap(); }
		//! \endcond
		protected /+virtual+/ проц OnSetBitmap()
		{
			wxBitmapButton_OnSetBitmap(шхобъ);
		}
		+/
		//---------------------------------------------------------------------
		
		/*public /+virtual+/ проц ApplyParentThemeBackground(Цвет bg)
		{
			wxBitmapButton_ApplyParentThemeBackground(шхобъ, wxObject.SafePtr(bg));
		}*/
	}
