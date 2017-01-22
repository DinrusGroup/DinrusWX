//-----------------------------------------------------------------------------
// wxD - FontDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Fontdlg.cs
//
/// The wxFontDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FontDialog.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.FontDialog;
public import wx.common;
public import wx.Dialog;
public import wx.Шрифт;
public import wx.GdiCommon; //for nullobject

		//! \cond EXTERN
		static extern (C) ЦУк wxFontData_ctor();
		static extern (C) проц   wxFontData_dtor(ЦУк сам);

		static extern (C) проц   wxFontData_SetAllowSymbols(ЦУк сам, бул flag);
		static extern (C) бул   wxFontData_GetAllowSymbols(ЦУк сам);

		static extern (C) проц   wxFontData_SetColour(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxFontData_GetColour(ЦУк сам);

		static extern (C) проц   wxFontData_SetShowHelp(ЦУк сам, бул flag);
		static extern (C) бул   wxFontData_GetShowHelp(ЦУк сам);

		static extern (C) проц   wxFontData_EnableEffects(ЦУк сам, бул flag);
		static extern (C) бул   wxFontData_GetEnableEffects(ЦУк сам);

		static extern (C) проц   wxFontData_SetInitialFont(ЦУк сам, ЦУк шрифт);
		static extern (C) ЦУк wxFontData_GetInitialFont(ЦУк сам);

		static extern (C) проц   wxFontData_SetChosenFont(ЦУк сам, ЦУк шрифт);
		static extern (C) ЦУк wxFontData_GetChosenFont(ЦУк сам);

		static extern (C) проц   wxFontData_SetRange(ЦУк сам, цел minRange, цел maxRange);
		//! \endcond

        //---------------------------------------------------------------------

    alias FontData wxFontData;
    public class FontData : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { super(wxFontData_ctor()); }

        //---------------------------------------------------------------------

        public бул AllowSymbols() { return wxFontData_GetAllowSymbols(шхобъ); }
        public проц AllowSymbols(бул значение) { wxFontData_SetAllowSymbols(шхобъ, значение); }

        //---------------------------------------------------------------------

        public бул EffectsEnabled() { return wxFontData_GetEnableEffects(шхобъ); }
        public проц EffectsEnabled(бул значение) { wxFontData_EnableEffects(шхобъ, значение); }

        //---------------------------------------------------------------------

        public бул ShowHelp() { return wxFontData_GetShowHelp(шхобъ); }
        public проц ShowHelp(бул значение) { wxFontData_SetShowHelp(шхобъ, значение); }

        //---------------------------------------------------------------------

        public Цвет colour() 
            {
                return new Цвет(wxFontData_GetColour(шхобъ), да);
            }
        public проц colour(Цвет значение) 
            {
                wxFontData_SetColour(шхобъ, wxObject.SafePtr(значение)); 
            }

        //---------------------------------------------------------------------
        
        public Шрифт InitialFont() 
            {
                return new Шрифт(wxFontData_GetInitialFont(шхобъ));
            }
        public проц InitialFont(Шрифт значение) 
            {
                wxFontData_SetInitialFont(шхобъ, wxObject.SafePtr(значение));
            }

        //---------------------------------------------------------------------

        public Шрифт ChosenFont() 
            {
                return new Шрифт(wxFontData_GetChosenFont(шхобъ));
            }
        public проц ChosenFont(Шрифт значение) 
            {
                wxFontData_SetChosenFont(шхобъ, wxObject.SafePtr(значение));
            }

        //---------------------------------------------------------------------

        public проц SetRange(цел min, цел max)
        {
            wxFontData_SetRange(шхобъ, min, max);
        }

        //---------------------------------------------------------------------
	public static wxObject Нов(ЦУк ptr) { return new FontData(ptr); }
    }

		//! \cond EXTERN
		static extern (C) ЦУк wxFontDialog_ctor();
		static extern (C) бул   wxFontDialog_Create(ЦУк сам, ЦУк родитель, ЦУк данные);
		static extern (C) проц   wxFontDialog_dtor(ЦУк сам);

		static extern (C) цел    wxFontDialog_ShowModal(ЦУк сам);
		static extern (C) ЦУк wxFontDialog_GetFontData(ЦУк сам);
		//! \endcond

        //---------------------------------------------------------------------

	alias FontDialog wxFontDialog;
	public class FontDialog : Dialog
	{
        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this()
            { super(wxFontDialog_ctor()); }

        public this(Окно родитель)
            { this(родитель, пусто); }

        public this(Окно родитель, FontData данные)
        {
        	this();
            if (!Create(родитель, данные)) 
            {
                throw new InvalidOperationException("Failed to create FontDialog");
            }
        }

        public бул Create(Окно родитель, FontData данные)
        {
            return wxFontDialog_Create(шхобъ, wxObject.SafePtr(родитель), wxObject.SafePtr(данные));
        }

        //---------------------------------------------------------------------

        public FontData fontData() 
        {
            return cast(FontData)FindObject(wxFontDialog_GetFontData(шхобъ), &FontData.Нов);
        }

        //---------------------------------------------------------------------

        public override цел ShowModal()
        {
            return wxFontDialog_ShowModal(шхобъ);
        }

        //---------------------------------------------------------------------
	}

	//! \cond EXTERN
	extern (C) ЦУк wxGetFontFromUser_func(ЦУк родитель, ЦУк fontInit);
	//! \endcond

	Шрифт GetFontFromUser(Окно родитель,Шрифт fontInit=пусто)
	{
		return new Шрифт(wxGetFontFromUser_func(wxObject.SafePtr(родитель),wxObject.SafePtr(fontInit)));
	}
