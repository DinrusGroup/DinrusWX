//-----------------------------------------------------------------------------
// wxD - MenuBar.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MenuBar.cs
//
/// The wxMenuBar wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MenuBar.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.MenuBar;
public import wx.common;
public import wx.EvtHandler;
public import wx.Menu;

		//! \cond EXTERN
		static extern (C) ЦУк wxMenuBar_ctor();
		static extern (C) ЦУк wxMenuBar_ctor2(бцел стиль);
		static extern (C) бул   wxMenuBar_Append(ЦУк сам, ЦУк меню, ткст title);
		static extern (C) проц   wxMenuBar_Check(ЦУк сам, цел ид, бул check);
		static extern (C) бул   wxMenuBar_IsChecked(ЦУк сам, цел ид);
        	static extern (C) бул   wxMenuBar_Insert(ЦУк сам, цел поз, ЦУк меню, ткст title);
        	static extern (C) ЦУк wxMenuBar_FindItem(ЦУк сам, цел ид, inout ЦУк меню);
		
		static extern (C) цел    wxMenuBar_GetMenuCount(ЦУк сам);
		static extern (C) ЦУк wxMenuBar_GetMenu(ЦУк сам, цел поз);
		
		static extern (C) ЦУк wxMenuBar_Replace(ЦУк сам, цел поз, ЦУк меню, ткст title);
		static extern (C) ЦУк wxMenuBar_Remove(ЦУк сам, цел поз);
		
		static extern (C) проц   wxMenuBar_EnableTop(ЦУк сам, цел поз, бул enable);
		
		static extern (C) проц   wxMenuBar_Enable(ЦУк сам, цел ид, бул enable);
		
		static extern (C) цел    wxMenuBar_FindMenu(ЦУк сам, ткст title);
		static extern (C) цел    wxMenuBar_FindMenuItem(ЦУк сам, ткст menustring, ткст itemString);
		
		static extern (C) ЦУк wxMenuBar_GetHelpString(ЦУк сам, цел ид);
		static extern (C) ЦУк wxMenuBar_GetLabel(ЦУк сам, цел ид);
		//static extern (C) ЦУк wxMenuBar_GetLabelTop(ЦУк сам, цел поз);
		
		static extern (C) бул   wxMenuBar_IsEnabled(ЦУк сам, цел ид);
		
		static extern (C) проц   wxMenuBar_Refresh(ЦУк сам);
		
		static extern (C) проц   wxMenuBar_SetHelpString(ЦУк сам, цел ид, ткст helpstring);
		static extern (C) проц   wxMenuBar_SetLabel(ЦУк сам, цел ид, ткст надпись);
		//static extern (C) проц   wxMenuBar_SetLabelTop(ЦУк сам, цел поз, ткст надпись);
		//! \endcond

	alias MenuBar wxMenuBar;
	public class MenuBar : EvtHandler
	{
		//---------------------------------------------------------------------

		public this()
			{ this(wxMenuBar_ctor()); }
			
		public this(цел стиль)
			{ this(wxMenuBar_ctor2(cast(бцел)стиль));}

		public this(ЦУк шхобъ)
			{ super(шхобъ); }

		public static wxObject Нов(ЦУк шхобъ)
		{
			return new MenuBar(шхобъ);
		}

		//---------------------------------------------------------------------

		public бул Append(Меню меню, ткст title)
		{
			return wxMenuBar_Append(шхобъ, меню.шхобъ, title);
		}

		//---------------------------------------------------------------------

		public проц Check(цел ид, бул check)
		{
			wxMenuBar_Check(шхобъ, ид, check);
		}

		//---------------------------------------------------------------------

		public бул IsChecked(цел ид)
		{
			return wxMenuBar_IsChecked(шхобъ, ид); 
		}

		public бул Insert(цел поз, Меню меню, ткст title)
		{
			return wxMenuBar_Insert(шхобъ, поз, wxObject.SafePtr(меню), title);
		}
		
		//-----------------------------------------------------------------------------
		
		public ЭлементМеню FindItem(цел ид)
		{ 
			Меню меню = пусто;
			return FindItem(ид, меню); 
		}
		
		public ЭлементМеню FindItem(цел ид, inout Меню меню)
		{
			ЦУк menuRef = ЦУк.init;
			if (меню) 
			{
				menuRef = wxObject.SafePtr(меню);
			}
		
			return cast(ЭлементМеню)FindObject(wxMenuBar_FindItem(шхобъ, ид, menuRef), &ЭлементМеню.New2);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел MenuCount() { return wxMenuBar_GetMenuCount(шхобъ); }
		
		//-----------------------------------------------------------------------------
		
		public Меню GetMenu(цел поз)
		{
			return cast(Меню)FindObject(wxMenuBar_GetMenu(шхобъ, поз), &Меню.Нов);
		}
		
		//-----------------------------------------------------------------------------
		
		public Меню Замени(цел поз, Меню меню, ткст title)
		{
			return cast(Меню)FindObject(wxMenuBar_Replace(шхобъ, поз, wxObject.SafePtr(меню), title), &Меню.Нов);
		}
		
		//-----------------------------------------------------------------------------
		
		public Меню Remove(цел поз)
		{
			return cast(Меню)FindObject(wxMenuBar_Remove(шхобъ, поз), &Меню.Нов);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц EnableTop(цел поз, бул enable)
		{
			wxMenuBar_EnableTop(шхобъ, поз, enable);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Enable(цел ид, бул enable)
		{
			wxMenuBar_Enable(шхобъ, ид, enable);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел FindMenu(ткст title)
		{
			return wxMenuBar_FindMenu(шхобъ, title);
		}
		
		//-----------------------------------------------------------------------------
		
		public цел FindMenuItem(ткст menustring, ткст itemString)
		{
			return wxMenuBar_FindMenuItem(шхобъ, menustring, itemString);
		}
		
		//-----------------------------------------------------------------------------
		
		public ткст GetHelpString(цел ид)
		{
			return cast(ткст) new wxString(wxMenuBar_GetHelpString(шхобъ, ид), да);
		}
		
		//-----------------------------------------------------------------------------
		
		public ткст GetLabel(цел ид)
		{
			return cast(ткст) new wxString(wxMenuBar_GetLabel(шхобъ, ид), да);
		}
		
		//-----------------------------------------------------------------------------
	/+	
		public ткст GetLabelTop(цел поз)
		{
			return cast(ткст) new wxString(wxMenuBar_GetLabelTop(шхобъ, поз), да);
		}
		+/
		//-----------------------------------------------------------------------------
		
		public бул IsEnabled(цел ид)
		{
			return wxMenuBar_IsEnabled(шхобъ, ид);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Refresh()
		{
			wxMenuBar_Refresh(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetHelpString(цел ид, ткст helpstring)
		{
			wxMenuBar_SetHelpString(шхобъ, ид, helpstring);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetLabel(цел ид, ткст надпись)
		{
			wxMenuBar_SetLabel(шхобъ, ид, надпись);
		}
		
		//-----------------------------------------------------------------------------
	/+	
		public проц SetLabelTop(цел поз, ткст надпись)
		{
			wxMenuBar_SetLabelTop(шхобъ, поз, надпись);
		}
		+/
	}
