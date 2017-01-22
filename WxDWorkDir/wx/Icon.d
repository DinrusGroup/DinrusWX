
module wx.Icon;
public import wx.common;
public import wx.Bitmap;

//! \cond STD

import stdrus;
alias вЮ8 toUTF8;

//! \endcond

		//! \cond EXTERN
		static extern (C) ЦУк wxIcon_ctor();
		static extern (C) проц   wxIcon_CopyFromBitmap(ЦУк сам, ЦУк битмап);
		static extern (C) бул   wxIcon_LoadFile(ЦУк сам, ткст имя, ТипБитмапа тип);
		//! \endcond

		//---------------------------------------------------------------------

	alias Icon wxIcon;
	public class Icon : Битмап
	{
		public static Icon wxNullIcon;
		public this(ткст имя)
		{
			this();
			Рисунок img = new Рисунок();
			if (!img.ЗагрузиФайл(имя))
				throw new ИсклАрга("файл '" ~ toUTF8(имя) ~ "' не найден");

			Битмап bmp = new Битмап(img);
			wxIcon_CopyFromBitmap(шхобъ, bmp.шхобъ);
		}

		public this(ткст имя, ТипБитмапа тип)
		{
			this();
//			if (тип == ТипБитмапа.wxBITMAP_TYPE_RESOURCE)
//			else
			if (!wxIcon_LoadFile(шхобъ, имя, тип))
				throw new ИсклАрга("файл '" ~ toUTF8(имя) ~ "' не загружается");
		}

		public this()
		{
			super(wxIcon_ctor());
		}
		
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }

		//---------------------------------------------------------------------

		public проц КопируйИзБитмапа(Битмап битмап)
		{
			wxIcon_CopyFromBitmap(шхобъ, wxObject.SafePtr(битмап));
		}

		//---------------------------------------------------------------------
	}
