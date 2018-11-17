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

		//! \cond EXTERN
		extern (C) {
		alias цел function(VListBox объ, цел n) Virtual_IntInt;
		alias проц function(VListBox объ, ЦелУкз dc, Прямоугольник прям, цел n) Virtual_VoidDcRectSizeT;
		}

		static extern (C) ЦелУкз wxVListBox_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
		static extern (C) проц wxVListBox_RegisterVirtual(ЦелУкз сам, VListBox объ,
			Virtual_VoidDcRectSizeT onDrawItem,
			Virtual_IntInt onMeasureItem,
			Virtual_VoidDcRectSizeT onDrawSeparator,
			Virtual_VoidDcRectSizeT onDrawBackground,
			Virtual_IntInt onGetLineHeight);
		static extern (C) бул wxVListBox_Create(ЦелУкз сам,ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя);
		static extern (C) проц wxVListBox_OnDrawSeparator(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, цел n);
		static extern (C) проц wxVListBox_OnDrawBackground(ЦелУкз сам, ЦелУкз dc, inout Прямоугольник прям, цел n);
		static extern (C) цел wxVListBox_OnGetLineHeight(ЦелУкз сам, цел line);
		static extern (C) цел wxVListBox_GetItemCount(ЦелУкз сам);
		static extern (C) бул wxVListBox_HasMultipleSelection(ЦелУкз сам);
		static extern (C) цел wxVListBox_GetSelection(ЦелУкз сам);
		static extern (C) бул wxVListBox_IsCurrent(ЦелУкз сам, цел элт);
		static extern (C) бул wxVListBox_IsSelected(ЦелУкз сам, цел элт);
		static extern (C) цел wxVListBox_GetSelectedCount(ЦелУкз сам);
		static extern (C) цел wxVListBox_GetFirstSelected(ЦелУкз сам, out бцел cookie);
		static extern (C) цел wxVListBox_GetNextSelected(ЦелУкз сам, inout бцел cookie);
		static extern (C) проц wxVListBox_GetMargins(ЦелУкз сам, out Точка тчк);
		static extern (C) ЦелУкз wxVListBox_GetSelectionBackground(ЦелУкз сам);
		static extern (C) проц wxVListBox_SetItemCount(ЦелУкз сам, цел count);
		static extern (C) проц wxVListBox_Clear(ЦелУкз сам);
		static extern (C) проц wxVListBox_SetSelection(ЦелУкз сам, цел selection);
		static extern (C) бул wxVListBox_Select(ЦелУкз сам, цел элт, бул select);
		static extern (C) бул wxVListBox_SelectRange(ЦелУкз сам, цел from, цел to);
		static extern (C) проц wxVListBox_Toggle(ЦелУкз сам, цел элт);
		static extern (C) бул wxVListBox_SelectAll(ЦелУкз сам);
		static extern (C) бул wxVListBox_DeselectAll(ЦелУкз сам);
		static extern (C) проц wxVListBox_SetMargins(ЦелУкз сам, inout Точка тчк);
		static extern (C) проц wxVListBox_SetMargins2(ЦелУкз сам, цел x, цел y);
		static extern (C) проц wxVListBox_SetSelectionBackground(ЦелУкз сам, ЦелУкз col);
		//! \endcond

	public abstract class VListBox : VScrolledWindow
	{
		const ткст wxVListBoxNameStr = "wxVListBox";

		public this(ЦелУкз wxobj)
			{ super(wxobj);}

		public this()
			{ this(null, Окно.УникИД, вхДефПоз, вхДефРазм, 0, "");}

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxVListBoxNameStr)
		{
			this(wxVListBox_ctor(wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя));
			wxVListBox_RegisterVirtual(wxobj, this,
				&staticDoOnDrawItem,
				&staticOnMeasureItem,
				&staticDoOnDrawSeparator,
				&staticDoOnDrawBackground,
				&staticOnGetLineHeight);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = 0, ткст имя = wxVListBoxNameStr)
			{ this(родитель, Окно.УникИД, поз, Размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		public override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
		{
			return wxVListBox_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя);
		}

		//-----------------------------------------------------------------------------

		protected abstract проц OnDrawItem(DC dc, Прямоугольник прям, цел n);

		static extern(C) private проц staticDoOnDrawItem(VListBox объ, ЦелУкз dc, Прямоугольник прям, цел n)
		{
			объ.OnDrawItem(cast(DC)НайдиОбъект(dc, &DC.Нов), прям, n);
		}

		//-----------------------------------------------------------------------------

		protected abstract цел OnMeasureItem(цел n);

		static extern(C) private цел staticOnMeasureItem(VListBox объ, цел n)
		{
			return объ.OnMeasureItem(n);
		}

		//-----------------------------------------------------------------------------

		protected  проц OnDrawSeparator(DC dc, Прямоугольник прям, цел n)
		{
			wxVListBox_OnDrawSeparator(wxobj, wxObject.SafePtr(dc), прям, n);
		}

		static extern(C) private проц staticDoOnDrawSeparator(VListBox объ, ЦелУкз dc, Прямоугольник прям, цел n)
		{
			объ.OnDrawSeparator(cast(DC)НайдиОбъект(dc, &DC.Нов), прям, n);
		}

		//-----------------------------------------------------------------------------

		protected  проц OnDrawBackground(DC dc, Прямоугольник прям, цел n)
		{
			wxVListBox_OnDrawBackground(wxobj, wxObject.SafePtr(dc), прям, n);
		}

		static extern(C) private проц staticDoOnDrawBackground(VListBox объ, ЦелУкз dc, Прямоугольник прям, цел n)
		{
			объ.OnDrawBackground(cast(DC)НайдиОбъект(dc, &DC.Нов), прям, n);
		}

		//-----------------------------------------------------------------------------

		protected override цел OnGetLineHeight(цел line)
		{
			return wxVListBox_OnGetLineHeight(wxobj, line);
		}

		static extern(C) private override цел staticOnGetLineHeight(VListBox объ, цел line)
		{
			return объ.OnGetLineHeight(line);
		}

		//-----------------------------------------------------------------------------

		public цел ItemCount() { return wxVListBox_GetItemCount(wxobj); }
		public проц ItemCount(цел значение) { wxVListBox_SetItemCount(wxobj, значение); }

		//-----------------------------------------------------------------------------

		public бул HasMultipleSelection() { return wxVListBox_HasMultipleSelection(wxobj); }

		//-----------------------------------------------------------------------------

		public цел Selection() { return wxVListBox_GetSelection(wxobj); }
		public проц Selection(цел значение) { wxVListBox_SetSelection(wxobj, значение); }

		//-----------------------------------------------------------------------------

		public бул IsCurrent(цел элт)
		{
			return wxVListBox_IsCurrent(wxobj, элт);
		}

		//-----------------------------------------------------------------------------

		public бул IsSelected(цел элт)
		{
			return wxVListBox_IsSelected(wxobj, элт);
		}

		//-----------------------------------------------------------------------------

		public цел SelectedCount() { return wxVListBox_GetSelectedCount(wxobj); }

		//-----------------------------------------------------------------------------

		public цел GetFirstSelected(out бцел cookie)
		{
			return wxVListBox_GetFirstSelected(wxobj, cookie);
		}

		//-----------------------------------------------------------------------------

		public цел GetNextSelected(inout бцел cookie)
		{
			return wxVListBox_GetNextSelected(wxobj, cookie);
		}

		//-----------------------------------------------------------------------------

		public Точка Margins() {
				Точка тчк;
				wxVListBox_GetMargins(wxobj, тчк);
				return тчк;
			}

		public проц Margins(Точка значение) { wxVListBox_SetMargins(wxobj, значение); }

		public проц УстMargins(цел x, цел y)
		{
			wxVListBox_SetMargins2(wxobj, x, y);
		}

		//-----------------------------------------------------------------------------

		public Цвет SelectionBackground() { return new Цвет(wxVListBox_GetSelectionBackground(wxobj), да); }
		public проц SelectionBackground(Цвет значение) { wxVListBox_SetSelectionBackground(wxobj, wxObject.SafePtr(значение)); }

		//-----------------------------------------------------------------------------

		public проц очисть()
		{
			wxVListBox_Clear(wxobj);
		}

		//-----------------------------------------------------------------------------

		public бул Select(цел элт)
		{
			return Select(элт, да);
		}

		public бул Select(цел элт, бул select)
		{
			return wxVListBox_Select(wxobj, элт, select);
		}

		//-----------------------------------------------------------------------------

		public бул SelectRange(цел from, цел to)
		{
			return wxVListBox_SelectRange(wxobj, from, to);
		}

		//-----------------------------------------------------------------------------

		public проц Toggle(цел элт)
		{
			wxVListBox_Toggle(wxobj, элт);
		}

		//-----------------------------------------------------------------------------

		public бул SelectAll()
		{
			return wxVListBox_SelectAll(wxobj);
		}

		//-----------------------------------------------------------------------------

		public бул DeselectAll()
		{
			return wxVListBox_DeselectAll(wxobj);
		}
	}
