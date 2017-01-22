//-----------------------------------------------------------------------------
// wxD - ChoiceDialog.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ChoiceDialog.cs
//
/// The wxChoiceDialog wrapper classes.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ChoiceDialog.d,v 1.11 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.ChoiceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ClientData;
public import wx.ArrayInt;

		//! \cond EXTERN
        static extern (C) ЦУк wxSingleChoiceDialog_ctor(ЦУк родитель, ткст message, ткст caption, цел n, ткст* choices, ЦУк clientData, бцел стиль, inout Точка поз);
        static extern (C) проц wxSingleChoiceDialog_SetSelection(ЦУк сам, цел sel);
        static extern (C) цел wxSingleChoiceDialog_GetSelection(ЦУк сам);
        static extern (C) ЦУк wxSingleChoiceDialog_GetStringSelection(ЦУк сам);
        static extern (C) ЦУк wxSingleChoiceDialog_GetSelectionClientData(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SingleChoiceDialog wxSingleChoiceDialog;
    public class SingleChoiceDialog : Dialog
    {
        enum {
            wxCHOICEDLG_STYLE	= (wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER | wxOK | wxCANCEL | wxCENTRE)
        }
	public const цел wxCHOICE_HEIGHT = 150;
	public const цел wxCHOICE_WIDTH  = 200;


        // TODO: ClientData... !?!

        public this(ЦУк шхобъ)
            { super(шхобъ);}

        public  this(Окно родитель, ткст message, ткст caption, ткст[] choices, ClientData clientData = пусто, цел стиль =  wxCHOICEDLG_STYLE, Точка поз = wxDefaultPosition)
            { super(wxSingleChoiceDialog_ctor(wxObject.SafePtr(родитель), message, caption, choices.length, choices.ptr, wxObject.SafePtr(clientData), стиль, поз));}

        //-----------------------------------------------------------------------------

        public проц Selection(цел sel)
        {
            wxSingleChoiceDialog_SetSelection(шхобъ, sel);
        }

        //-----------------------------------------------------------------------------

        public цел Selection()
        {
            return wxSingleChoiceDialog_GetSelection(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public ткст StringSelection()
        {
            return cast(ткст) new wxString(wxSingleChoiceDialog_GetStringSelection(шхобъ), да);
        }

        //-----------------------------------------------------------------------------

        public ClientData SelectionClientData()
        {
            return cast(ClientData)FindObject(wxSingleChoiceDialog_GetSelectionClientData(шхобъ));
        }
    }

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxMultiChoiceDialog_ctor(ЦУк родитель, ткст message, ткст caption, цел n, ткст* choices, бцел стиль, inout Точка поз);
        static extern (C) проц wxMultiChoiceDialog_SetSelections(ЦУк сам, цел* sel, цел numsel);
        static extern (C) ЦУк wxMultiChoiceDialog_GetSelections(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias MultiChoiceDialog wxMultiChoiceDialog;
    public class MultiChoiceDialog : Dialog
    {
        public this(ЦУк шхобъ)
            { super(шхобъ);}

        public  this(Окно родитель, ткст message, ткст caption, ткст[] choices, цел стиль = SingleChoiceDialog.wxCHOICEDLG_STYLE, Точка поз = wxDefaultPosition)
            { super(wxMultiChoiceDialog_ctor(wxObject.SafePtr(родитель), message, caption, choices.length, choices.ptr, стиль, поз));}

        //-----------------------------------------------------------------------------

        public проц SetSelections(цел[] sel)
        {
            wxMultiChoiceDialog_SetSelections(шхобъ, sel.ptr, sel.length);
        }

        //-----------------------------------------------------------------------------
	
        public цел[] GetSelections()
        {
            return (new МассивЦел(wxMultiChoiceDialog_GetSelections(шхобъ), да)).вМассив();
        }
        
    }

	//-----------------------------------------------------------------------------

	//! \cond EXTERN
	static extern (C) ЦУк wxGetSingleChoice_func(ткст message, ткст caption, цел n, ткст* choices, ЦУк родитель, цел x, цел y, бул centre, цел ширина, цел высота);
	static extern (C) цел wxGetSingleChoiceIndex_func(ткст message, ткст caption, цел n, ткст* choices, ЦУк родитель, цел x, цел y, бул centre, цел ширина, цел высота);
	static extern (C) проц* wxGetSingleChoiceData_func(ткст message, ткст caption, цел n, ткст* choices, проц **client_data, ЦУк родитель, цел x, цел y, бул centre, цел ширина, цел высота);
	static extern (C) бцел wxGetMultipleChoices_func(ЦУк selections,ткст message, ткст caption, цел n, ткст* choices, ЦУк родитель, цел x, цел y, бул centre, цел ширина, цел высота);
	//! \endcond

	public ткст GetSingleChoice(ткст message, ткст caption, ткст[] choices, Окно родитель = пусто, цел x = -1, цел y= -1, бул centre = да, цел ширина = SingleChoiceDialog.wxCHOICE_WIDTH, цел высота = SingleChoiceDialog.wxCHOICE_HEIGHT)
	{
		return cast(ткст) new wxString(wxGetSingleChoice_func(message, caption, choices.length, choices.ptr, wxObject.SafePtr(родитель), x, y, centre, ширина, высота), да);
	}

	public цел GetSingleChoiceIndex(ткст message, ткст caption, ткст[] choices, Окно родитель = пусто, цел x = -1, цел y= -1, бул centre = да, цел ширина = SingleChoiceDialog.wxCHOICE_WIDTH, цел высота = SingleChoiceDialog.wxCHOICE_HEIGHT)
	{
		return wxGetSingleChoiceIndex_func(message, caption, choices.length, choices.ptr, wxObject.SafePtr(родитель), x, y, centre, ширина, высота);
	}

	public проц* GetSingleChoiceData(ткст message, ткст caption, ткст[] choices, проц **client_data, Окно родитель = пусто, цел x = -1, цел y= -1, бул centre = да, цел ширина = SingleChoiceDialog.wxCHOICE_WIDTH, цел высота = SingleChoiceDialog.wxCHOICE_HEIGHT)
	{
		return wxGetSingleChoiceData_func(message, caption, choices.length, choices.ptr, client_data, wxObject.SafePtr(родитель), x, y, centre, ширина, высота);
	}

	public цел[] GetMultipleChoices(ткст message, ткст caption, ткст[] choices, Окно родитель = пусто, цел x = -1, цел y= -1, бул centre = да, цел ширина = SingleChoiceDialog.wxCHOICE_WIDTH, цел высота = SingleChoiceDialog.wxCHOICE_HEIGHT)
	{
		МассивЦел ari = new МассивЦел();
		бцел sz = wxGetMultipleChoices_func(wxObject.SafePtr(ari), message, caption, choices.length, choices.ptr, wxObject.SafePtr(родитель), x, y, centre, ширина, высота);
		return ari.вМассив();
	}
