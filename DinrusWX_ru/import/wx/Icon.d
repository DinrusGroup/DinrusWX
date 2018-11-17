
module wx.Icon;
public import wx.common;
public import wx.Bitmap;


		//! \cond EXTERN
		static extern (C) IntPtr wxIcon_ctor();
		static extern (C) проц   wxIcon_CopyFromBitmap(IntPtr сам, IntPtr битмап);
		static extern (C) бул   wxIcon_LoadFile(IntPtr сам, ткст имя, BitmapType тип);
		//! \endcond

		//---------------------------------------------------------------------

	alias Пиктограмма wxIcon;
	public class Пиктограмма : Битмап
	{
		public static Пиктограмма wxNullIcon;
		public this(ткст имя);
		public this(ткст имя, BitmapType тип);
		public this();
		
		public this(IntPtr wxobj) ;
		public проц CopyFromBitmap(Битмап битмап);
	}
