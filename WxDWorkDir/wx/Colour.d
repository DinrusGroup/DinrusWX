module wx.Colour;
public import wx.common;

//! \cond STD

import dinrus;

//! \endcond

		//! \cond EXTERN
		static extern (C) ЦУк wxColour_ctor();
		static extern (C) ЦУк wxColour_ctorByName(ткст имя);
		static extern (C) ЦУк wxColour_ctorByParts(ббайт красный, ббайт зелёный, ббайт синий);
		static extern (C) проц   wxColour_dtor(ЦУк сам);
		//static extern (C) проц   wxColour_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);

		static extern (C) ббайт   wxColour_Red(ЦУк сам);
		static extern (C) ббайт   wxColour_Blue(ЦУк сам);
		static extern (C) ббайт   wxColour_Green(ЦУк сам);

		static extern (C) бул   wxColour_Ok(ЦУк сам);
		static extern (C) проц   wxColour_Set(ЦУк сам, ббайт красный, ббайт зелёный, ббайт синий);
		
		static extern (C) ЦУк wxColour_CreateByName(ткст имя);
		//! \endcond

		//---------------------------------------------------------------------

	alias Цвет wxColour;
	public class Цвет : wxObject
	{
		public static Цвет wxBLACK;
		public static Цвет wxWHITE;
		public static Цвет wxRED;
		public static Цвет wxBLUE;
		public static Цвет wxGREEN;
		public static Цвет wxCYAN;
		public static Цвет wxLIGHT_GREY;
		public static Цвет wxNullColour;

		//---------------------------------------------------------------------

		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
			
		public this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this() 
		{ 
			this(wxColour_ctor(), да);
			//wxColour_RegisterDisposable(шхобъ, &VirtualDispose);
		}

		public this(ткст имя)
		{ 
			this(wxColour_ctorByName(имя), да); // toupper
			//wxColour_RegisterDisposable(шхобъ, &VirtualDispose);
		}

		public this(ббайт красный, ббайт зелёный, ббайт синий)
		{ 
			this(wxColour_ctorByParts(красный, зелёный, синий), да);
			//wxColour_RegisterDisposable(шхобъ, &VirtualDispose);
		}

		//---------------------------------------------------------------------

		public override проц Dispose()
		{
			if ((this != Цвет.wxBLACK) && (this != Цвет.wxWHITE) &&
				(this != Цвет.wxRED) && (this != Цвет.wxBLUE) &&
					(this != Цвет.wxGREEN) && (this != Цвет.wxCYAN) &&
						(this != Цвет.wxLIGHT_GREY)) 
			{
				super.Dispose(/*да*/);
			}
		}

		//---------------------------------------------------------------------

		public ббайт Красный() { return wxColour_Red(шхобъ); }

		public ббайт Зелёный() { return wxColour_Green(шхобъ); }

		public ббайт Синий() { return wxColour_Blue(шхобъ); }

		//---------------------------------------------------------------------

		public бул Ок()
		{
			return wxColour_Ok(шхобъ);
		}

		public проц Установи(ббайт красный, ббайт зелёный, ббайт синий)
		{
			wxColour_Set(шхобъ, красный, зелёный, синий);
		}

		//---------------------------------------------------------------------
		
		version(__WXGTK__){
		public static Цвет СоздайПоИмени(ткст имя)
		{
			return new Цвет(wxColour_CreateByName(имя), да);
		}
		} // version(__WXGTK__)

		public static wxObject Нов(ЦУк ptr) { return new Цвет(ptr); }
	}
