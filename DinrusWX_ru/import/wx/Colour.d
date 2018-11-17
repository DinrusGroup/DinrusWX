module wx.Colour;
public import wx.common;




		//! \cond EXTERN
		static extern (C) IntPtr wxColour_ctor();
		static extern (C) IntPtr wxColour_ctorByName(ткст имя);
		static extern (C) IntPtr wxColour_ctorByParts(ubyte red, ubyte green, ubyte blue);
		static extern (C) проц   wxColour_dtor(IntPtr сам);
		//static extern (C) проц   wxColour_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);

		static extern (C) ubyte   wxColour_Red(IntPtr сам);
		static extern (C) ubyte   wxColour_Blue(IntPtr сам);
		static extern (C) ubyte   wxColour_Green(IntPtr сам);

		static extern (C) бул   wxColour_Ok(IntPtr сам);
		static extern (C) проц   wxColour_Set(IntPtr сам, ubyte red, ubyte green, ubyte blue);
		
		static extern (C) IntPtr wxColour_CreateByName(ткст имя);
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

		public this(IntPtr wxobj);			
		public this(IntPtr wxobj, бул memOwn);
		public this() ;
		public this(ткст имя);
		public this(ubyte red, ubyte green, ubyte blue);
		public override проц Dispose();
		public ubyte Red() ;
		public ubyte Green();
		public ubyte Blue();
		public бул Ок();
		public проц Уст(ubyte red, ubyte green, ubyte blue);
		version(__WXGTK__){
		public static Цвет CreateByName(ткст имя);
		} // version(__WXGTK__)

		public static wxObject Нов(IntPtr ptr) ;
	}
