//-----------------------------------------------------------------------------
// wxD - Sizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Sizer.cs
//
/// The wxSizer wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Sizer.d,v 1.10 2007/08/20 08:38:46 afb Exp $
//-----------------------------------------------------------------------------

module wx.Sizer;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) проц wxSizer_AddWindow(ЦУк сам, ЦУк окно, цел proportion, цел flag, цел border, ЦУк userData);
		static extern (C) проц wxSizer_AddSizer(ЦУк сам, ЦУк sizer, цел proportion, цел flag, цел border, ЦУк userData);
		static extern (C) проц wxSizer_Add(ЦУк сам, цел ширина, цел высота, цел proportion, цел flag, цел border, ЦУк userData);

		static extern (C) проц wxSizer_Fit(ЦУк сам, ЦУк окно, inout Размер size);
		static extern (C) проц wxSizer_FitInside(ЦУк сам, ЦУк окно);
		static extern (C) проц wxSizer_Layout(ЦУк сам);

		static extern (C) проц wxSizer_InsertWindow(ЦУк сам, цел before, ЦУк окно, цел option, бцел flag, цел border, ЦУк userData);
		static extern (C) проц wxSizer_InsertSizer(ЦУк сам, цел before, ЦУк sizer, цел option, бцел flag, цел border, ЦУк userData);
		static extern (C) проц wxSizer_Insert(ЦУк сам, цел before, цел ширина, цел высота, цел option, бцел flag, цел border, ЦУк userData);

		static extern (C) проц wxSizer_PrependWindow(ЦУк сам, ЦУк окно, цел option, бцел flag, цел border, ЦУк userData);
		static extern (C) проц wxSizer_PrependSizer(ЦУк сам, ЦУк sizer, цел option, бцел flag, цел border, ЦУк userData);
		static extern (C) проц wxSizer_Prepend(ЦУк сам, цел ширина, цел высота, цел option, бцел flag, цел border, ЦУк userData);

	//	static extern (C) бул wxSizer_RemoveWindow(ЦУк сам, ЦУк окно);
		static extern (C) бул wxSizer_RemoveSizer(ЦУк сам, ЦУк sizer);
		static extern (C) бул wxSizer_Remove(ЦУк сам, цел поз);

		static extern (C) проц wxSizer_Clear(ЦУк сам, бул delete_windows);
		static extern (C) проц wxSizer_DeleteWindows(ЦУк сам);

		static extern (C) проц wxSizer_SetMinSize(ЦУк сам, inout Размер size);

		static extern (C) бул wxSizer_SetItemMinSizeWindow(ЦУк сам, ЦУк окно, inout Размер size);
		static extern (C) бул wxSizer_SetItemMinSizeSizer(ЦУк сам, ЦУк sizer, inout Размер size);
		static extern (C) бул wxSizer_SetItemMinSize(ЦУк сам, цел поз, inout Размер size);

		static extern (C) проц wxSizer_GetSize(ЦУк сам, out Размер size);
		static extern (C) проц wxSizer_GetPosition(ЦУк сам, out Точка pt);
		static extern (C) проц wxSizer_GetMinSize(ЦУк сам, out Размер size);

		static extern (C) проц wxSizer_RecalcSizes(ЦУк сам);
		static extern (C) проц wxSizer_CalcMin(ЦУк сам, out Размер size);

		static extern (C) проц wxSizer_SetSizeHints(ЦУк сам, ЦУк окно);
		//static extern (C) проц wxSizer_SetVirtualSizeHints(ЦУк сам, ЦУк окно);
		static extern (C) проц wxSizer_SetDimension(ЦУк сам, цел x, цел y, цел ширина, цел высота);

		static extern (C) проц wxSizer_ShowWindow(ЦУк сам, ЦУк окно, бул show);
		static extern (C) проц wxSizer_HideWindow(ЦУк сам, ЦУк окно);
		static extern (C) проц wxSizer_ShowSizer(ЦУк сам, ЦУк sizer, бул show);
		static extern (C) проц wxSizer_HideSizer(ЦУк сам, ЦУк sizer);

		static extern (C) бул wxSizer_IsShownWindow(ЦУк сам, ЦУк окно);
		static extern (C) бул wxSizer_IsShownSizer(ЦУк сам, ЦУк sizer);
		
		static extern (C) бул wxSizer_DetachWindow(ЦУк сам, ЦУк окно);
		static extern (C) бул wxSizer_DetachSizer(ЦУк сам, ЦУк sizer);
		static extern (C) бул wxSizer_Detach(ЦУк сам, цел индекс);
		//! \endcond

		//---------------------------------------------------------------------

	public abstract class Sizer : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		//---------------------------------------------------------------------

		public проц Добавь(Окно окно, цел proportion=0, цел flag=0, цел border=0, wxObject userData=пусто)
		{
			wxSizer_AddWindow(шхобъ, wxObject.SafePtr(окно), proportion, flag,
							  border, wxObject.SafePtr(userData));
		}

		public проц Добавь(Sizer sizer, цел proportion=0, цел flag=0, цел border=0, wxObject userData=пусто)
		{
			wxSizer_AddSizer(шхобъ, wxObject.SafePtr(sizer), proportion, cast(цел)flag,
							 border, wxObject.SafePtr(userData));
		}

		public проц Добавь(цел ширина, цел высота, цел proportion=0, цел flag=0, цел border=0, wxObject userData=пусто)
		{
			wxSizer_Add(шхобъ, ширина, высота, proportion, cast(цел)flag, border,
						wxObject.SafePtr(userData));
		}

		//---------------------------------------------------------------------

		public проц AddSpacer(цел size)
		{
			Добавь(size, size, 0);
		}

		public проц AddStretchSpacer(цел proportion = 1)
		{
			Добавь(0, 0, proportion);
		}

		//---------------------------------------------------------------------

		public Размер Fit(Окно окно)
		{
			Размер size;
			wxSizer_Fit(шхобъ, wxObject.SafePtr(окно), size);
			return size;
		}

		public проц FitInside(Окно окно)
		{
			wxSizer_FitInside(шхобъ, wxObject.SafePtr(окно));
		}

		public проц Layout()
		{
			wxSizer_Layout(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц Insert(бцел индекс, Окно окно, цел proportion=0, цел flag=0,
						   цел border=0, wxObject userData=пусто)
		{
			wxSizer_InsertWindow(шхобъ, индекс, wxObject.SafePtr(окно),
								 proportion, flag, border,
								 wxObject.SafePtr(userData));
		}

		public проц Insert(бцел индекс, Sizer sizer, цел proportion=0, цел flag=0,
						   цел border=0, wxObject userData=пусто)
		{
			wxSizer_InsertSizer(шхобъ, индекс, wxObject.SafePtr(sizer),
								proportion, flag, border,
								wxObject.SafePtr(userData));
		}

		public проц Insert(бцел индекс, цел ширина, цел высота, цел proportion=0,
						   цел flag=0, цел border=0, wxObject userData=пусто)
		{
			wxSizer_Insert(шхобъ, индекс, ширина, высота, proportion, flag,
						   border, wxObject.SafePtr(userData));
		}

		//---------------------------------------------------------------------

		public проц Prepend(Окно окно, цел proportion=0, цел flag=0, цел border=0,
							wxObject userData=пусто)
		{
			wxSizer_PrependWindow(шхобъ, wxObject.SafePtr(окно), proportion,
								flag, border, wxObject.SafePtr(userData));
		}

		public проц Prepend(Sizer sizer, цел proportion=0, цел flag=0, цел border=0,
							wxObject userData=пусто)
		{
			wxSizer_PrependSizer(шхобъ, wxObject.SafePtr(sizer), proportion,
								 flag, border, wxObject.SafePtr(userData));
		}

		public проц Prepend(цел ширина, цел высота, цел proportion=0, цел flag=0,
						    цел border=0, wxObject userData=пусто)
		{
			wxSizer_Prepend(шхобъ, ширина, высота, proportion,
							flag, border, wxObject.SafePtr(userData));
		}

		//---------------------------------------------------------------------

		public проц PrependSpacer(цел size)
		{
			Prepend(size, size, 0);
		}

		public проц PrependStretchSpacer(цел proportion = 1)
		{
			Prepend(0, 0, proportion);
		}

		//---------------------------------------------------------------------
/+
		public бул Remove(Окно окно)
		{
			return wxSizer_RemoveWindow(шхобъ, wxObject.SafePtr(окно));
		}
+/
		public бул Remove(Sizer sizer)
		{
			return wxSizer_RemoveSizer(шхобъ, wxObject.SafePtr(sizer));
		}

		public бул Remove(цел поз)
		{
			return wxSizer_Remove(шхобъ, поз);
		}

		//---------------------------------------------------------------------

		public проц SetMinSize(Размер size)
		{
			wxSizer_SetMinSize(шхобъ, size);
		}

		//---------------------------------------------------------------------

		public бул SetItemMinSize(Окно окно, Размер size)
		{
			return wxSizer_SetItemMinSizeWindow(шхобъ, wxObject.SafePtr(окно),size);
		}

		public бул SetItemMinSize(Sizer sizer, Размер size)
		{
			return wxSizer_SetItemMinSizeSizer(шхобъ, wxObject.SafePtr(sizer),size);
		}

		public бул SetItemMinSize(цел поз, Размер size)
		{
			return wxSizer_SetItemMinSize(шхобъ, поз, size);
		}

		//---------------------------------------------------------------------

		public Размер size() 
			{
				Размер size;
				wxSizer_GetSize(шхобъ, size);
				return size;
			}

		public Точка Положение() 
			{
				Точка pt;
				wxSizer_GetPosition(шхобъ, pt);
				return pt;
			}

		public Размер MinSize() 
			{
				Размер size;
				wxSizer_GetMinSize(шхобъ, size);
				return size;
			}

		//---------------------------------------------------------------------

		public /+virtual+/ проц RecalcSizes()
		{
			wxSizer_RecalcSizes(шхобъ);
		}

		//---------------------------------------------------------------------

		public /+virtual+/ Размер CalcMin()
		{
			Размер size;
			wxSizer_CalcMin(шхобъ, size);
			return size;
		}

		//---------------------------------------------------------------------

		public проц SetSizeHints(Окно окно)
		{
			wxSizer_SetSizeHints(шхобъ, wxObject.SafePtr(окно));
		}
/+
		public проц SetVirtualSizeHints(Окно окно)
		{
			wxSizer_SetVirtualSizeHints(шхобъ, wxObject.SafePtr(окно));
		}
+/
		public проц SetDimension(цел x, цел y, цел ширина, цел высота)
		{
			wxSizer_SetDimension(шхобъ, x, y, ширина, высота);
		}

		//---------------------------------------------------------------------

		public проц Show(Окно окно, бул show)
		{
			wxSizer_ShowWindow(шхобъ, wxObject.SafePtr(окно), show);
		}

		public проц Show(Sizer sizer, бул show)
		{
			wxSizer_ShowSizer(шхобъ, wxObject.SafePtr(sizer), show);
		}

		// Нов to wx.NET
		public проц Show(бул show)
		{
			Show(this, show);
		}


		//---------------------------------------------------------------------

		public проц Очисть(бул delete_windows)
		{
			wxSizer_Clear(шхобъ, delete_windows);
		}

		public проц DeleteWindows()
		{
			wxSizer_DeleteWindows(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц Hide(Окно окно)
		{
			wxSizer_HideWindow(шхобъ, wxObject.SafePtr(окно));
		}

		public проц Hide(Sizer sizer)
		{
			wxSizer_HideSizer(шхобъ, wxObject.SafePtr(sizer));
		}

		//---------------------------------------------------------------------

		public бул IsShown(Окно окно)
		{
			return wxSizer_IsShownWindow(шхобъ, wxObject.SafePtr(окно));
		}

		public бул IsShown(Sizer sizer)
		{
			return wxSizer_IsShownSizer(шхобъ, wxObject.SafePtr(sizer));
		}

		//---------------------------------------------------------------------
		
		public бул Detach(Окно окно)
		{
			return wxSizer_DetachWindow(шхобъ, wxObject.SafePtr(окно));
		}
		
		public бул Detach(Sizer sizer)
		{
			return wxSizer_DetachSizer(шхобъ, wxObject.SafePtr(sizer));
		}
		
		public бул Detach(цел индекс)
		{
			return wxSizer_Detach(шхобъ, индекс);
		}
		
		//---------------------------------------------------------------------
	}
