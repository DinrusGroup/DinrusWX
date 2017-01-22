//-----------------------------------------------------------------------------
// wxD - ScrollBar.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ScrollBar.cs
//
/// The wxScrollBar wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ScrollBar.d,v 1.10 2007/03/13 17:02:41 afb Exp $
//-----------------------------------------------------------------------------

module wx.ScrollBar;
public import wx.common;
public import wx.Control;

		//! \cond EXTERN
		static extern (C) ЦУк wxScrollBar_ctor();
		static extern (C) бул   wxScrollBar_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ЦУк validator, ткст имя);
		static extern (C) цел    wxScrollBar_GetThumbPosition(ЦУк сам);
		static extern (C) цел    wxScrollBar_GetThumbSize(ЦУк сам);
		static extern (C) цел    wxScrollBar_GetPageSize(ЦУк сам);
		static extern (C) цел    wxScrollBar_GetRange(ЦУк сам);
		static extern (C) бул   wxScrollBar_IsVertical(ЦУк сам);
		static extern (C) проц   wxScrollBar_SetThumbPosition(ЦУк сам, цел viewStart);
		static extern (C) проц   wxScrollBar_SetScrollbar(ЦУк сам, цел position, цел thumbSize, цел range, цел pageSize, бул refresh);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias ScrollBar wxScrollBar;
	public class ScrollBar : Control
	{
		enum {
			wxSB_HORIZONTAL   = Ориентация.wxHORIZONTAL,
			wxSB_VERTICAL     = Ориентация.wxVERTICAL,
		}

		public const ткст wxScrollBarNameStr = "scrollBar";
		//-----------------------------------------------------------------------------

		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public this()
			{ super(wxScrollBar_ctor()); }
	    
		public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSB_HORIZONTAL, Validator validator = пусто, ткст имя = wxScrollBarNameStr)
		{
			super (wxScrollBar_ctor() );
			if (!Create(родитель, ид, поз, size, стиль, validator, имя)) 
			{
				throw new InvalidOperationException("Failed to create ScrollBar");
			}
		}
		
		public static wxObject Нов(ЦУк шхобъ) { return new ScrollBar(шхобъ); }
	
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxSB_HORIZONTAL, Validator validator = пусто, ткст имя = wxScrollBarNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, validator, имя); }
		
		//-----------------------------------------------------------------------------

		public бул Create(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, Validator validator, ткст имя)
		{
			return wxScrollBar_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, wxObject.SafePtr(validator), имя);
		}

		//-----------------------------------------------------------------------------

		public цел ThumbPosition() { return wxScrollBar_GetThumbPosition(шхобъ); }
		public проц ThumbPosition(цел значение) { wxScrollBar_SetThumbPosition(шхобъ, значение); }

		//-----------------------------------------------------------------------------

		public цел ThumbSize() { return wxScrollBar_GetThumbSize(шхобъ); }

		//-----------------------------------------------------------------------------

		public цел PageSize() { return wxScrollBar_GetPageSize(шхобъ); }

		//-----------------------------------------------------------------------------

		public цел Range() { return wxScrollBar_GetRange(шхобъ); }

		//-----------------------------------------------------------------------------

		public бул IsVertical() { return wxScrollBar_IsVertical(шхобъ); }

		//-----------------------------------------------------------------------------

		public override проц SetScrollbar(цел position, цел thumbSize, цел range, цел pageSize, бул refresh)
		{
			wxScrollBar_SetScrollbar(шхобъ, position, thumbSize, range, pageSize, refresh);
		}
	}
