//-----------------------------------------------------------------------------
// wxD - ColourDialog.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ColourDialog.cs
//
/// The wxColourDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ColourDialog.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ColourDialog;
public import wx.common;
public import wx.Colour;
public import wx.Dialog;

		//! \cond EXTERN
		static extern (C) ЦУк wxColourData_ctor();

		static extern (C) проц   wxColourData_SetChooseFull(ЦУк сам, бул flag);
		static extern (C) бул   wxColourData_GetChooseFull(ЦУк сам);

		static extern (C) проц   wxColourData_SetColour(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxColourData_GetColour(ЦУк сам);

		static extern (C) проц   wxColourData_SetCustomColour(ЦУк сам, цел i, ЦУк colour);
		static extern (C) ЦУк wxColourData_GetCustomColour(ЦУк сам, цел i);
		//! \endcond

		//---------------------------------------------------------------------
        
	alias ColourData wxColourData;
	public class ColourData : wxObject
	{
		private this(ЦУк шхобъ) 
			{ super(шхобъ); }

		public this()
			{ super(wxColourData_ctor()); }

		//---------------------------------------------------------------------

		public бул ChooseFull() 
			{
				return wxColourData_GetChooseFull(шхобъ);
			}
		public проц ChooseFull(бул значение) 
			{
				wxColourData_SetChooseFull(шхобъ, значение);
			}

		//---------------------------------------------------------------------
	
		public Цвет colour() 
			{
				return cast(Цвет)FindObject(wxColourData_GetColour(шхобъ), &Цвет.Нов);
			}
		public проц colour(Цвет значение) 
			{
				wxColourData_SetColour(шхобъ, wxObject.SafePtr(значение));
			}
		
		//---------------------------------------------------------------------
	
		public Цвет GetCustomColour(цел i) 
		{
			return new Цвет(wxColourData_GetCustomColour(шхобъ, i), да);
		}
	
		public проц SetCustomColour(цел i, Цвет colour)
		{
			wxColourData_SetCustomColour(шхобъ, i, wxObject.SafePtr(colour));
		}
		
		public static wxObject Нов(ЦУк ptr) { return new ColourData(ptr); }
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxColourDialog_ctor();
		static extern (C) бул   wxColourDialog_Create(ЦУк сам, ЦУк родитель, ЦУк данные);
		static extern (C) ЦУк wxColourDialog_GetColourData(ЦУк сам);
		static extern (C) цел    wxColourDialog_ShowModal(ЦУк сам);
		
		static extern (C) ЦУк wxColourDialog_GetColourFromUser(ЦУк родитель, ЦУк colInit);
		//! \endcond
	
		//---------------------------------------------------------------------
	
	alias ColourDialog wxColourDialog;
	public class ColourDialog : Dialog
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ); }
	
		public this()
			{ super(wxColourDialog_ctor()); }
	
		public this(Окно родитель, ColourData данные = пусто)
		{
			super(wxColourDialog_ctor());
			if (!Create(родитель, данные)) 
			{
				throw new InvalidOperationException("Failed to create ColourDialog");
			}
		}
	
		public бул Create(Окно родитель, ColourData данные = пусто)
		{
			return wxColourDialog_Create(шхобъ, wxObject.SafePtr(родитель),
							wxObject.SafePtr(данные));
		}
	
		//---------------------------------------------------------------------
	
		public ColourData colourData() 
			{
				return cast(ColourData)FindObject(wxColourDialog_GetColourData(шхобъ), &ColourData.Нов);
			}
	
		//---------------------------------------------------------------------
	
		public override цел ShowModal()
		{
			return wxColourDialog_ShowModal(шхобъ);
		}
		
		//---------------------------------------------------------------------

	}

		public static Цвет GetColourFromUser(Окно родитель=пусто, Цвет colInit=пусто)
		{
			return new Цвет(wxColourDialog_GetColourFromUser(wxObject.SafePtr(родитель), wxObject.SafePtr(colInit)));
		}
