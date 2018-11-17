module wx.ChoiceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ClientData;
public import wx.ArrayInt;

		//! \cond EXTERN
        static extern (C) IntPtr wxSingleChoiceDialog_ctor(IntPtr родитель, ткст message, ткст caption, цел n, ткст* choices, IntPtr clientData, бцел стиль, inout Точка поз);
        static extern (C) проц wxSingleChoiceDialog_SetSelection(IntPtr сам, цел sel);
        static extern (C) цел wxSingleChoiceDialog_GetSelection(IntPtr сам);
        static extern (C) IntPtr wxSingleChoiceDialog_GetStringSelection(IntPtr сам);
        static extern (C) IntPtr wxSingleChoiceDialog_GetSelectionClientData(IntPtr сам);
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


        public this(IntPtr wxobj);
        public  this(Окно родитель, ткст message, ткст caption, ткст[] choices, ClientData clientData = null, цел стиль =  wxCHOICEDLG_STYLE, Точка поз = вхДефПоз);
        public проц Выбор(цел sel);
        public цел Выбор();
        public ткст StringSelection();
        public ClientData SelectionClientData();
    }

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxMultiChoiceDialog_ctor(IntPtr родитель, ткст message, ткст caption, цел n, ткст* choices, бцел стиль, inout Точка поз);
        static extern (C) проц wxMultiChoiceDialog_SetSelections(IntPtr сам, цел* sel, цел numsel);
        static extern (C) IntPtr wxMultiChoiceDialog_GetSelections(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias MultiChoiceDialog wxMultiChoiceDialog;
    public class MultiChoiceDialog : Dialog
    {
        public this(IntPtr wxobj);
        public  this(Окно родитель, ткст message, ткст caption, ткст[] choices, цел стиль = SingleChoiceDialog.wxCHOICEDLG_STYLE, Точка поз = вхДефПоз);
        public проц УстSelections(цел[] sel);
        public цел[] GetSelections();
    }

	//-----------------------------------------------------------------------------

	//! \cond EXTERN
	static extern (C) IntPtr wxGetSingleChoice_func(ткст message, ткст caption, цел n, ткст* choices, IntPtr родитель, цел x, цел y, бул centre, цел ширь, цел высь);
	static extern (C) цел wxGetSingleChoiceIndex_func(ткст message, ткст caption, цел n, ткст* choices, IntPtr родитель, цел x, цел y, бул centre, цел ширь, цел высь);
	static extern (C) проц* wxGetSingleChoiceData_func(ткст message, ткст caption, цел n, ткст* choices, проц **client_data, IntPtr родитель, цел x, цел y, бул centre, цел ширь, цел высь);
	static extern (C) бцел wxGetMultipleChoices_func(IntPtr selections,ткст message, ткст caption, цел n, ткст* choices, IntPtr родитель, цел x, цел y, бул centre, цел ширь, цел высь);
	//! \endcond

	public ткст GetSingleChoice(ткст message, ткст caption, ткст[] choices, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT);
	public цел GetSingleChoiceIndex(ткст message, ткст caption, ткст[] choices, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT);
	public проц* GetSingleChoiceData(ткст message, ткст caption, ткст[] choices, проц **client_data, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT);
	public цел[] GetMultipleChoices(ткст message, ткст caption, ткст[] choices, Окно родитель = null, цел x = -1, цел y= -1, бул centre = да, цел ширь = SingleChoiceDialog.wxCHOICE_WIDTH, цел высь = SingleChoiceDialog.wxCHOICE_HEIGHT);