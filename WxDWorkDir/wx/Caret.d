//-----------------------------------------------------------------------------
// wxD - Caret.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - Caret.cs
//
/// The wxCaret wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Caret.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Caret;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) ЦУк wxCaret_ctor();
		static extern (C) проц wxCaret_dtor(ЦУк сам);
		static extern (C) бул wxCaret_Create(ЦУк сам, ЦУк окно, цел ширина, цел высота);
		static extern (C) бул wxCaret_IsOk(ЦУк сам);
		static extern (C) бул wxCaret_IsVisible(ЦУк сам);
		static extern (C) проц wxCaret_GetPosition(ЦУк сам, out цел x, out цел y);
		static extern (C) проц wxCaret_GetSize(ЦУк сам, out цел ширина, out цел высота);
		static extern (C) ЦУк wxCaret_GetWindow(ЦУк сам);
		static extern (C) проц wxCaret_SetSize(ЦУк сам, цел ширина, цел высота);
		static extern (C) проц wxCaret_Move(ЦУк сам, цел x, цел y);
		static extern (C) проц wxCaret_Show(ЦУк сам, бул show);
		static extern (C) проц wxCaret_Hide(ЦУк сам);
		static extern (C) цел wxCaret_GetBlinkTime();
		static extern (C) проц wxCaret_SetBlinkTime(цел milliseconds);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias Caret wxCaret;
	public class Caret : wxObject
	{
		public this()
			{ this(wxCaret_ctor(), да);}

		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public this(Окно окно, Размер size)
			{ this(окно, size.Ширина, size.Высота);}

		public this(Окно окно, цел ширина, цел высота)
		{
			this(wxCaret_ctor(), да);
			if (!wxCaret_Create(шхобъ, wxObject.SafePtr(окно), ширина, высота))
			{
				throw new InvalidOperationException("Failed to create Caret");
			}
		}
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxCaret_dtor(шхобъ); }
		
		//---------------------------------------------------------------------

		public бул Create(Окно окно, цел ширина, цел высота)
		{
			return wxCaret_Create(шхобъ, wxObject.SafePtr(окно), ширина, высота);
		}

		//---------------------------------------------------------------------

		public бул IsOk() { return wxCaret_IsOk(шхобъ); }

		public бул IsVisible() { return wxCaret_IsVisible(шхобъ); }

		//---------------------------------------------------------------------

		public Точка Положение() 
			{
				Точка point;
				wxCaret_GetPosition(шхобъ, point.X, point.Y);
				return point;
			}
		public проц Положение(Точка значение) 
			{
				wxCaret_Move(шхобъ, значение.X, значение.Y);
			}

		//---------------------------------------------------------------------

		public Размер size() 
		{
			Размер sz;
			wxCaret_GetSize(шхобъ, sz.Ширина, sz.Высота);
			return sz;
		}
		public проц size(Размер значение) 
		{
			wxCaret_SetSize(шхобъ, значение.Ширина, значение.Высота);
		}

		//---------------------------------------------------------------------

		public Окно окно() 
		{
			return cast(Окно)FindObject(wxCaret_GetWindow(шхобъ));
		}

		//---------------------------------------------------------------------

		public проц Show(бул show)
		{
			wxCaret_Show(шхобъ, show);
		}

		public проц Hide()
		{
			wxCaret_Hide(шхобъ);
		}

		//---------------------------------------------------------------------

		static цел BlinkTime()
		{
			return wxCaret_GetBlinkTime();
		}
		static проц BlinkTime(цел значение) 
		{
			wxCaret_SetBlinkTime(значение);
		}

		public static wxObject Нов(ЦУк ptr) { return new Caret(ptr); }
		//---------------------------------------------------------------------
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxCaretSuspend_ctor(ЦУк окн);
		static extern (C) проц wxCaretSuspend_dtor(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias CaretSuspend wxCaretSuspend;
	public class CaretSuspend : wxObject
	{
		public this(Окно окн)
			{ this(wxCaretSuspend_ctor(wxObject.SafePtr(окн)), да);}
		
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxCaretSuspend_dtor(шхобъ); }
	}
