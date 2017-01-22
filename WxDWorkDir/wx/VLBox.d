//-----------------------------------------------------------------------------
// wxD - VLBox.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - VLBox.cs
//
/// The wxVListBox wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: VLBox.d,v 1.10 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.VLBox;
public import wx.common;
public import wx.VScroll;
/+
		//! \cond EXTERN
		extern (C) {
		alias цел function(VListBox объ, цел n) Virtual_IntInt;
		alias проц function(VListBox объ, ЦУк dc, Прямоугольник прям, цел n) Virtual_VoidDcRectSizeT;
		}

		static extern (C) ЦУк wxVListBox_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) проц wxVListBox_RegisterVirtual(ЦУк сам, VListBox объ, 
			Virtual_VoidDcRectSizeT onDrawItem, 
			Virtual_IntInt onMeasureItem, 
			Virtual_VoidDcRectSizeT onDrawSeparator,
			Virtual_VoidDcRectSizeT onDrawBackground,
			Virtual_IntInt onGetLineHeight);
		static extern (C) бул wxVListBox_Create(ЦУк сам,ЦУк родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя);		
		static extern (C) проц wxVListBox_OnDrawSeparator(ЦУк сам, ЦУк dc, inout Прямоугольник прям, цел n);
		static extern (C) проц wxVListBox_OnDrawBackground(ЦУк сам, ЦУк dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxVListBox_OnGetLineHeight(ЦУк сам, цел line);
		static extern (C) цел wxVListBox_GetItemCount(ЦУк сам);
		static extern (C) бул wxVListBox_HasMultipleSelection(ЦУк сам);
		static extern (C) цел wxVListBox_GetSelection(ЦУк сам);
		static extern (C) бул wxVListBox_IsCurrent(ЦУк сам, цел элемент);
		static extern (C) бул wxVListBox_IsSelected(ЦУк сам, цел элемент);
		static extern (C) цел wxVListBox_GetSelectedCount(ЦУк сам);
		static extern (C) цел wxVListBox_GetFirstSelected(ЦУк сам, out бцел cookie);
		static extern (C) цел wxVListBox_GetNextSelected(ЦУк сам, inout бцел cookie);
		static extern (C) проц wxVListBox_GetMargins(ЦУк сам, out Точка pt);
		static extern (C) ЦУк wxVListBox_GetSelectionBackground(ЦУк сам);
		static extern (C) проц wxVListBox_SetItemCount(ЦУк сам, цел счёт);
		static extern (C) проц wxVListBox_Clear(ЦУк сам);
		static extern (C) проц wxVListBox_SetSelection(ЦУк сам, цел selection);
		static extern (C) бул wxVListBox_Select(ЦУк сам, цел элемент, бул select);
		static extern (C) бул wxVListBox_SelectRange(ЦУк сам, цел from, цел to);
		static extern (C) проц wxVListBox_Toggle(ЦУк сам, цел элемент);
		static extern (C) бул wxVListBox_SelectAll(ЦУк сам);
		static extern (C) бул wxVListBox_DeselectAll(ЦУк сам);
		static extern (C) проц wxVListBox_SetMargins(ЦУк сам, inout Точка pt);
		static extern (C) проц wxVListBox_SetMargins2(ЦУк сам, цел x, цел y);
		static extern (C) проц wxVListBox_SetSelectionBackground(ЦУк сам, ЦУк col);
		//! \endcond
		
	public abstract class VListBox : VScrolledWindow
	{
		const ткст wxVListBoxNameStr = "wxVListBox";
	
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this(пусто, Окно.UniqueID, wxDefaultPosition, wxDefaultSize, 0, "");}
			
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxVListBoxNameStr)
		{
			this(wxVListBox_ctor(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя));
			wxVListBox_RegisterVirtual(шхобъ, this,
				&staticDoOnDrawItem,
				&staticOnMeasureItem,
				&staticDoOnDrawSeparator,
				&staticDoOnDrawBackground,
				&staticOnGetLineHeight);
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = 0, ткст имя = wxVListBoxNameStr)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------
		
		public override бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxVListBox_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, стиль, имя); 
		}
		
		//-----------------------------------------------------------------------------
		
		protected abstract проц OnDrawItem(DC dc, Прямоугольник прям, цел n);
		
		static extern(C) private проц staticDoOnDrawItem(VListBox объ, ЦУк dc, Прямоугольник прям, цел n)
		{
			объ.OnDrawItem(cast(DC)FindObject(dc, &DC.Нов), прям, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected abstract цел OnMeasureItem(цел n);
		
		static extern(C) private цел staticOnMeasureItem(VListBox объ, цел n)
		{
			return объ.OnMeasureItem(n);
		}

		//-----------------------------------------------------------------------------
		
		protected /+virtual+/ проц OnDrawSeparator(DC dc, Прямоугольник прям, цел n)
		{
			wxVListBox_OnDrawSeparator(шхобъ, wxObject.SafePtr(dc), прям, n);
		}
		
		static extern(C) private проц staticDoOnDrawSeparator(VListBox объ, ЦУк dc, Прямоугольник прям, цел n)
		{
			объ.OnDrawSeparator(cast(DC)FindObject(dc, &DC.Нов), прям, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected /+virtual+/ проц OnDrawBackground(DC dc, Прямоугольник прям, цел n)
		{
			wxVListBox_OnDrawBackground(шхобъ, wxObject.SafePtr(dc), прям, n);
		}
		
		static extern(C) private проц staticDoOnDrawBackground(VListBox объ, ЦУк dc, Прямоугольник прям, цел n)
		{
			объ.OnDrawBackground(cast(DC)FindObject(dc, &DC.Нов), прям, n);
		}
		
		//-----------------------------------------------------------------------------
		
		protected override цел OnGetLineHeight(цел line)
		{
			return wxVListBox_OnGetLineHeight(шхобъ, line);
		}
		
		static extern(C) private override цел staticOnGetLineHeight(VListBox объ, цел line)
		{
			return объ.OnGetLineHeight(line);
		}

		//-----------------------------------------------------------------------------
		
		public цел ItemCount() { return wxVListBox_GetItemCount(шхобъ); }
		public проц ItemCount(цел значение) { wxVListBox_SetItemCount(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public бул HasMultipleSelection() { return wxVListBox_HasMultipleSelection(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public цел Selection() { return wxVListBox_GetSelection(шхобъ); }
		public проц Selection(цел значение) { wxVListBox_SetSelection(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public бул IsCurrent(цел элемент)
		{
			return wxVListBox_IsCurrent(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул IsSelected(цел элемент)
		{
			return wxVListBox_IsSelected(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел SelectedCount() { return wxVListBox_GetSelectedCount(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public цел GetFirstSelected(out бцел cookie)
		{
			return wxVListBox_GetFirstSelected(шхобъ, cookie);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел GetNextSelected(inout бцел cookie)
		{
			return wxVListBox_GetNextSelected(шхобъ, cookie);
		}
		
		//-----------------------------------------------------------------------------
		
		public Точка Margins() { 
				Точка pt;
				wxVListBox_GetMargins(шхобъ, pt);
				return pt;
			}
			
		public проц Margins(Точка значение) { wxVListBox_SetMargins(шхобъ, значение); }
		
		public проц SetMargins(цел x, цел y)
		{
			wxVListBox_SetMargins2(шхобъ, x, y);
		}
		
		//-----------------------------------------------------------------------------
		
		public Цвет SelectionBackground() { return new Цвет(wxVListBox_GetSelectionBackground(шхобъ), да); }
		public проц SelectionBackground(Цвет значение) { wxVListBox_SetSelectionBackground(шхобъ, wxObject.SafePtr(значение)); }
		
		//-----------------------------------------------------------------------------
		
		public проц Очисть()
		{
			wxVListBox_Clear(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Select(цел элемент)
		{
			return Select(элемент, да);
		}
		
		public бул Select(цел элемент, бул select)
		{
			return wxVListBox_Select(шхобъ, элемент, select);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул SelectRange(цел from, цел to)
		{
			return wxVListBox_SelectRange(шхобъ, from, to);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Toggle(цел элемент)
		{
			wxVListBox_Toggle(шхобъ, элемент);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул SelectAll()
		{
			return wxVListBox_SelectAll(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул DeselectAll()
		{
			return wxVListBox_DeselectAll(шхобъ);
		}
	}
+/