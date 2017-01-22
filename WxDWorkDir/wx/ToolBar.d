//-----------------------------------------------------------------------------
// wxD - ToolBar.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - ToolBar.cs
//
/// The wxToolBar wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ToolBar.d,v 1.10 2007/01/28 23:06:37 afb Exp $
//-----------------------------------------------------------------------------

module wx.ToolBar;
public import wx.common;
public import wx.Bitmap;
public import wx.Control;
public import wx.ClientData;
/+
		//! \cond EXTERN
		static extern (C) ЦУк wxToolBarToolBase_ctor(ЦУк tbar, цел toolid, ткст надпись, ЦУк bmpNormal, ЦУк bmpDisabled, цел вид, ЦУк clientData, ткст shortHelpString, ткст longHelpString);
		static extern (C) ЦУк wxToolBarToolBase_ctorCtrl(ЦУк tbar, ЦУк control);
		static extern (C) цел    wxToolBarToolBase_GetId(ЦУк сам);
		static extern (C) ЦУк wxToolBarToolBase_GetControl(ЦУк сам);
		static extern (C) ЦУк wxToolBarToolBase_GetToolBar(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_IsButton(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_IsControl(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_IsSeparator(ЦУк сам);
		static extern (C) цел    wxToolBarToolBase_GetStyle(ЦУк сам);
		static extern (C) цел    wxToolBarToolBase_GetKind(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_IsEnabled(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_IsToggled(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_CanBeToggled(ЦУк сам);
		static extern (C) ЦУк wxToolBarToolBase_GetLabel(ЦУк сам);
		static extern (C) ЦУк wxToolBarToolBase_GetShortHelp(ЦУк сам);
		static extern (C) ЦУк wxToolBarToolBase_GetLongHelp(ЦУк сам);
		static extern (C) ЦУк wxToolBarToolBase_GetClientData(ЦУк сам);
		static extern (C) бул   wxToolBarToolBase_Enable(ЦУк сам, бул enable);
		static extern (C) бул   wxToolBarToolBase_Toggle(ЦУк сам, бул toggle);
		static extern (C) бул   wxToolBarToolBase_SetToggle(ЦУк сам, бул toggle);
		static extern (C) бул   wxToolBarToolBase_SetShortHelp(ЦУк сам, ткст справка);
		static extern (C) бул   wxToolBarToolBase_SetLongHelp(ЦУк сам, ткст справка);
		static extern (C) проц   wxToolBarToolBase_Toggle(ЦУк сам);
		static extern (C) проц   wxToolBarToolBase_SetNormalBitmap(ЦУк сам, ЦУк bmp);
		static extern (C) проц   wxToolBarToolBase_SetDisabledBitmap(ЦУк сам, ЦУк bmp);
		static extern (C) проц   wxToolBarToolBase_SetLabel(ЦУк сам, ткст надпись);
		static extern (C) проц   wxToolBarToolBase_SetClientData(ЦУк сам, ЦУк clientData);
		static extern (C) проц   wxToolBarToolBase_Detach(ЦУк сам);
		static extern (C) проц   wxToolBarToolBase_Attach(ЦУк сам, ЦУк tbar);
		//! \endcond

       //---------------------------------------------------------------------
        
	alias ToolBarTool wxToolBarTool;
	public class ToolBarTool : wxObject
	{
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(ToolBar tbar = пусто, цел toolid = wxID_SEPARATOR, ткст надпись = "", Битмап bmpNormal = Битмап.wxNullBitmap, Битмап bmpDisabled = Битмап.wxNullBitmap, ItemKind вид = ItemKind.wxITEM_NORMAL, ClientData clientData = пусто, ткст shortHelpString = "", ткст longHelpString = "")
            { this(wxToolBarToolBase_ctor(wxObject.SafePtr(tbar), toolid, надпись, wxObject.SafePtr(bmpNormal), wxObject.SafePtr(bmpDisabled), cast(цел)вид, wxObject.SafePtr(clientData), shortHelpString, longHelpString)); }

        public this(ToolBar tbar, Control control)
            { this(wxToolBarToolBase_ctorCtrl(wxObject.SafePtr(tbar), wxObject.SafePtr(control))); }


	public static wxObject Нов(ЦУк ptr) { return new ToolBarTool(ptr); }
        //---------------------------------------------------------------------

		public цел ИД() {return wxToolBarToolBase_GetId(шхобъ); }

		public Control control() { return cast(Control)FindObject(wxToolBarToolBase_GetControl(шхобъ)); }

		public ToolBar toolBar() { return cast(ToolBar)FindObject(wxToolBarToolBase_GetToolBar(шхобъ), &ToolBar.Нов); }

        //---------------------------------------------------------------------

		public бул IsButton() { return wxToolBarToolBase_IsButton(шхобъ); }

		бул IsControl() { return wxToolBarToolBase_IsControl(шхобъ); }

		бул Разделитель_ли() { return wxToolBarToolBase_IsSeparator(шхобъ); }

        //---------------------------------------------------------------------

		public цел Style() { return wxToolBarToolBase_GetStyle(шхобъ); }

		public ItemKind Вид() { return cast(ItemKind)wxToolBarToolBase_GetKind(шхобъ); }

        //---------------------------------------------------------------------

		бул CanBeToggled()
        {
            return wxToolBarToolBase_CanBeToggled(шхобъ);
        }

        //---------------------------------------------------------------------

		public ткст Label() { return cast(ткст) new wxString(wxToolBarToolBase_GetLabel(шхобъ), да); }
		public проц Label(ткст значение) { wxToolBarToolBase_SetLabel(шхобъ, значение); }

		public ткст ShortHelp() { return cast(ткст) new wxString(wxToolBarToolBase_GetShortHelp(шхобъ), да); }
		public проц ShortHelp(ткст значение) { wxToolBarToolBase_SetShortHelp(шхобъ, значение); }

		public ткст LongHelp() { return cast(ткст) new wxString(wxToolBarToolBase_GetLongHelp(шхобъ), да); }
		public проц LongHelp(ткст значение) { wxToolBarToolBase_SetLongHelp(шхобъ, значение); }

        //---------------------------------------------------------------------
        
		public ClientData clientData() { return cast(ClientData)FindObject(wxToolBarToolBase_GetClientData(шхобъ)); }
		public проц clientData(ClientData значение) { wxToolBarToolBase_SetClientData(шхобъ, wxObject.SafePtr(значение)); }

        //---------------------------------------------------------------------

		public проц Enabled(бул значение) { wxToolBarToolBase_Enable(шхобъ, значение); }
		public бул Enabled() {return wxToolBarToolBase_IsEnabled(шхобъ); }

		public проц Toggled(бул значение) { wxToolBarToolBase_SetToggle(шхобъ, значение); }
		public бул Toggled() { return wxToolBarToolBase_IsToggled(шхобъ); }

        //---------------------------------------------------------------------

		public проц NormalBitmap(Битмап значение) { wxToolBarToolBase_SetNormalBitmap(шхобъ, wxObject.SafePtr(значение)); }

		public проц DisabledBitmap(Битмап значение) { wxToolBarToolBase_SetDisabledBitmap(шхобъ, wxObject.SafePtr(значение)); }

        //---------------------------------------------------------------------

		проц Detach()
        {
            wxToolBarToolBase_Detach(шхобъ);
        }

		проц Attach(ToolBar tbar)
        {
            wxToolBarToolBase_Attach(шхобъ, wxObject.SafePtr(tbar));
        }

        //---------------------------------------------------------------------
	}

		//! \cond EXTERN
		static extern (C) ЦУк wxToolBar_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль);
		static extern (C) ЦУк wxToolBar_AddTool1(ЦУк сам, цел toolid, ткст надпись, ЦУк битмап, ЦУк bmpDisabled, цел вид, ткст shortHelp, ткст longHelp, ЦУк данные);
		static extern (C) ЦУк wxToolBar_AddTool2(ЦУк сам, цел toolid, ткст надпись, ЦУк битмап, ткст shortHelp, цел вид);
		static extern (C) ЦУк wxToolBar_AddCheckTool(ЦУк сам, цел toolid, ткст надпись, ЦУк битмап, ЦУк bmpDisabled, ткст shortHelp, ткст longHelp, ЦУк данные);
		static extern (C) ЦУк wxToolBar_AddRadioTool(ЦУк сам, цел toolid, ткст надпись, ЦУк битмап, ЦУк bmpDisabled, ткст shortHelp, ткст longHelp, ЦУк данные);
		static extern (C) ЦУк wxToolBar_AddControl(ЦУк сам, ЦУк control);
		static extern (C) ЦУк wxToolBar_InsertControl(ЦУк сам, цел поз, ЦУк control);
		static extern (C) ЦУк wxToolBar_FindControl(ЦУк сам, цел toolid);
		static extern (C) ЦУк wxToolBar_AddSeparator(ЦУк сам);
		static extern (C) ЦУк wxToolBar_InsertSeparator(ЦУк сам, цел поз);
		static extern (C) ЦУк wxToolBar_RemoveTool(ЦУк сам, цел toolid);
		static extern (C) бул   wxToolBar_DeleteToolByPos(ЦУк сам, цел поз);
		static extern (C) бул   wxToolBar_DeleteTool(ЦУк сам, цел toolid);
		static extern (C) проц   wxToolBar_ClearTools(ЦУк сам);
		static extern (C) бул   wxToolBar_Realize(ЦУк сам);
		static extern (C) проц   wxToolBar_EnableTool(ЦУк сам, цел toolid, бул enable);
		static extern (C) проц   wxToolBar_ToggleTool(ЦУк сам, цел toolid, бул toggle);
		static extern (C) ЦУк wxToolBar_GetToolClientData(ЦУк сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolClientData(ЦУк сам, цел toolid, ЦУк clientData);
		static extern (C) бул   wxToolBar_GetToolState(ЦУк сам, цел toolid);
		static extern (C) бул   wxToolBar_GetToolEnabled(ЦУк сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolShortHelp(ЦУк сам, цел toolid, ткст helpString);
		static extern (C) ЦУк wxToolBar_GetToolShortHelp(ЦУк сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolLongHelp(ЦУк сам, цел toolid, ткст helpString);
		static extern (C) ЦУк wxToolBar_GetToolLongHelp(ЦУк сам, цел toolid);
		static extern (C) проц   wxToolBar_SetMargins(ЦУк сам, цел x, цел y);
		static extern (C) проц   wxToolBar_SetToolPacking(ЦУк сам, цел packing);
		static extern (C) проц   wxToolBar_SetToolSeparation(ЦУк сам, цел separation);
		static extern (C) проц   wxToolBar_GetToolMargins(ЦУк сам, inout Размер size);
		static extern (C) цел    wxToolBar_GetToolPacking(ЦУк сам);
		static extern (C) цел    wxToolBar_GetToolSeparation(ЦУк сам);
		static extern (C) проц   wxToolBar_SetRows(ЦУк сам, цел nRows);
		static extern (C) проц   wxToolBar_SetMaxRowsCols(ЦУк сам, цел rows, цел cols);
		static extern (C) цел    wxToolBar_GetMaxRows(ЦУк сам);
		static extern (C) цел    wxToolBar_GetMaxCols(ЦУк сам);
		static extern (C) проц   wxToolBar_SetToolBitmapSize(ЦУк сам, inout Размер size);
		static extern (C) проц   wxToolBar_GetToolBitmapSize(ЦУк сам, inout Размер size);
		static extern (C) проц   wxToolBar_GetToolSize(ЦУк сам, inout Размер size);
		static extern (C) ЦУк wxToolBar_FindToolForPosition(ЦУк сам, цел x, цел y);
		static extern (C) бул   wxToolBar_IsVertical(ЦУк сам);
		static extern (C) ЦУк wxToolBar_AddTool3(ЦУк сам, цел toolid, ЦУк битмап, ЦУк bmpDisabled, бул toggle, ЦУк clientData, ткст shortHelpString, ткст longHelpString);
		static extern (C) ЦУк wxToolBar_AddTool4(ЦУк сам, цел toolid, ЦУк битмап, ткст shortHelpString, ткст longHelpString);
		static extern (C) ЦУк wxToolBar_AddTool5(ЦУк сам, цел toolid, ЦУк битмап, ЦУк bmpDisabled, бул toggle, цел xPos, цел yPos, ЦУк clientData, ткст shortHelp, ткст longHelp);
		static extern (C) ЦУк wxToolBar_InsertTool(ЦУк сам, цел поз, цел toolid, ЦУк битмап, ЦУк bmpDisabled, бул toggle, ЦУк clientData, ткст shortHelp, ткст longHelp);
		static extern (C) бул   wxToolBar_AcceptsFocus(ЦУк сам);
		//! \endcond

        //---------------------------------------------------------------------

	alias ToolBar wxToolBar;
	public class ToolBar : Control
	{
		enum {
			wxTB_HORIZONTAL   = Ориентация.wxHORIZONTAL,
			wxTB_VERTICAL     = Ориентация.wxVERTICAL,
			wxTB_3DBUTTONS    = 0x0010,
			wxTB_FLAT         = 0x0020,
			wxTB_DOCKABLE     = 0x0040,
			wxTB_NOICONS      = 0x0080,
			wxTB_TEXT         = 0x0100,
			wxTB_NODIVIDER    = 0x0200,
			wxTB_NOALIGN      = 0x0400,
			wxTB_HORZ_LAYOUT  = 0x0800,
			wxTB_HORZ_TEXT    = wxTB_HORZ_LAYOUT | wxTB_TEXT
		}
	
		//---------------------------------------------------------------------

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(Окно родитель, цел ид, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxNO_BORDER|wxTB_HORIZONTAL)
            { this(wxToolBar_ctor(wxObject.SafePtr(родитель), ид, поз, size, стиль)); }
	    
	//---------------------------------------------------------------------
	// ctors with сам created ид
	    
        public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxNO_BORDER|wxTB_HORIZONTAL)
	    { this(родитель, Окно.UniqueID, поз, size, стиль);}

        //---------------------------------------------------------------------

        public ToolBarTool AddTool(цел toolid, ткст надпись, Битмап битмап)
        {
            return AddTool(toolid, надпись, битмап, "", cast(ItemKind)0);
        }

        public ToolBarTool AddTool(цел toolid, ткст надпись, Битмап битмап, Битмап bmpDisabled, ItemKind вид, ткст shortHelp, ткст longHelp, ClientData clientData)
        {
            return new ToolBarTool(wxToolBar_AddTool1(шхобъ, toolid, надпись, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), cast(цел)вид, shortHelp, longHelp, wxObject.SafePtr(clientData)));
        }

        public ToolBarTool AddTool(цел toolid, ткст надпись, Битмап битмап, ткст shortHelp, ItemKind вид = ItemKind.wxITEM_NORMAL)
        {
            return new ToolBarTool(wxToolBar_AddTool2(шхобъ, toolid, надпись, wxObject.SafePtr(битмап), shortHelp, cast(цел)вид));
        }

        public ToolBarTool AddTool(цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, ClientData clientData, ткст shortHelpString, ткст longHelpString)
        {
            return new ToolBarTool(wxToolBar_AddTool3(шхобъ, toolid, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), toggle, wxObject.SafePtr(clientData), shortHelpString, longHelpString));
        }

        public ToolBarTool AddTool(цел toolid, Битмап битмап, ткст shortHelpString)
            { return AddTool(toolid, битмап, shortHelpString, ""); }
        public ToolBarTool AddTool(цел toolid, Битмап битмап, ткст shortHelpString, ткст longHelpString)
        {
            return new ToolBarTool(wxToolBar_AddTool4(шхобъ, toolid, wxObject.SafePtr(битмап), shortHelpString, longHelpString));
        }

        public ToolBarTool AddTool(цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, цел xPos, цел yPos, ClientData clientData, ткст shortHelp, ткст longHelp)
        {
            return new ToolBarTool(wxToolBar_AddTool5(шхобъ, toolid, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), toggle, xPos, yPos, wxObject.SafePtr(clientData), shortHelp, longHelp));
        }

        //---------------------------------------------------------------------
        
        public ToolBarTool InsertTool(цел поз, цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, ClientData clientData, ткст shortHelp, ткст longHelp)
        {
            return new ToolBarTool(wxToolBar_InsertTool(шхобъ, поз, toolid, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), toggle, wxObject.SafePtr(clientData), shortHelp, longHelp));
        }

        //---------------------------------------------------------------------

        public ToolBarTool AddCheckTool(цел toolid, ткст надпись, Битмап битмап, Битмап bmpDisabled, ткст shortHelp, ткст longHelp)
        {
            return new ToolBarTool(wxToolBar_AddCheckTool(шхобъ, toolid, надпись, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), shortHelp, longHelp, wxObject.SafePtr(пусто)));
        }

        public ToolBarTool AddRadioTool(цел toolid, ткст надпись, Битмап битмап, Битмап bmpDisabled, ткст shortHelp, ткст longHelp)
        {
            return new ToolBarTool(wxToolBar_AddRadioTool(шхобъ, toolid, надпись, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), shortHelp, longHelp, wxObject.SafePtr(пусто)));
        }

        //---------------------------------------------------------------------

        public ToolBarTool AddControl(Control ctrl)
        {
            return new ToolBarTool(wxToolBar_AddControl(шхобъ, wxObject.SafePtr(ctrl)));
        }

        public ToolBarTool InsertControl(цел поз, Control ctrl)
        {
            return new ToolBarTool(wxToolBar_InsertControl(шхобъ, поз, wxObject.SafePtr(ctrl)));
        }

        public ToolBarTool FindControl(цел toolid)
        {
            return cast(ToolBarTool)FindObject(wxToolBar_FindControl(шхобъ, toolid), &ToolBarTool.Нов);
        }

        //---------------------------------------------------------------------

        public ToolBarTool AddSeparator()
        {
            return new ToolBarTool(wxToolBar_AddSeparator(шхобъ));
        }

        public ToolBarTool InsertSeparator(цел поз)
        {
            return new ToolBarTool(wxToolBar_InsertSeparator(шхобъ, поз));
        }

        //---------------------------------------------------------------------

        public ToolBarTool RemoveTool(цел toolid)
        {
            return cast(ToolBarTool)FindObject(wxToolBar_RemoveTool(шхобъ, toolid), &ToolBarTool.Нов);
        }

        public бул DeleteToolByPos(цел поз)
        {
            return wxToolBar_DeleteToolByPos(шхобъ, поз);
        }

        public бул DeleteTool(цел toolid)
        {
            return wxToolBar_DeleteTool(шхобъ, toolid);
        }

        public проц ClearTools()
        {
            wxToolBar_ClearTools(шхобъ);
        }

        //---------------------------------------------------------------------

        public бул Realize()
        {
            return wxToolBar_Realize(шхобъ);
        }

        //---------------------------------------------------------------------

        public проц EnableTool(цел toolid, бул enable)
        {
            wxToolBar_EnableTool(шхобъ, toolid, enable);
        }

        public проц ToggleTool(цел toolid, бул toggle)
        {
            wxToolBar_ToggleTool(шхобъ, toolid, toggle);
        }

        //---------------------------------------------------------------------

        public проц SetToolClientData(цел toolid, ClientData clientData)
        {
            wxToolBar_SetToolClientData(шхобъ, toolid, wxObject.SafePtr(clientData));
        }

        public ClientData GetToolClientData(цел toolid)
        {
            return cast(ClientData)wxObject.FindObject(wxToolBar_GetToolClientData(шхобъ, toolid));
        }

        //---------------------------------------------------------------------
        
        public бул GetToolState(цел toolid)
        {
            return wxToolBar_GetToolState(шхобъ, toolid);
        }

        public бул GetToolEnable(цел toolid)
        {
            return wxToolBar_GetToolEnabled(шхобъ, toolid);
        }

        //---------------------------------------------------------------------

        public ткст GetToolShortHelp(цел toolid)
        {
            return cast(ткст) new wxString(wxToolBar_GetToolShortHelp(шхобъ, toolid), да);
        }

        public проц SetToolShortHelp(цел toolid, ткст helpString)
        {
            wxToolBar_SetToolShortHelp(шхобъ, toolid, helpString);
        }

        //---------------------------------------------------------------------

        public ткст GetToolLongHelp(цел toolid)
        {
            return cast(ткст) new wxString(wxToolBar_GetToolLongHelp(шхобъ, toolid), да);
        }

        public проц SetToolLongHelp(цел toolid, ткст helpString)
        {
            wxToolBar_SetToolLongHelp(шхобъ, toolid, helpString);
        }

        //---------------------------------------------------------------------

        public проц SetMargins(цел x, цел y) { wxToolBar_SetMargins(шхобъ, x, y); }

        public Размер Margins()
        { 
		Размер size;
		wxToolBar_GetToolMargins(шхобъ, size);
		return size;
	}
        public проц Margins(Размер значение) { wxToolBar_SetMargins(шхобъ, значение.Ширина, значение.Высота); }

        //---------------------------------------------------------------------

        public цел ToolPacking() { return wxToolBar_GetToolPacking(шхобъ); }
        public проц ToolPacking(цел значение) { wxToolBar_SetToolPacking(шхобъ, значение); }

        //---------------------------------------------------------------------

        public цел Separation() { return wxToolBar_GetToolSeparation(шхобъ); }
        public проц Separation(цел значение) { wxToolBar_SetToolSeparation(шхобъ, значение); }

        //---------------------------------------------------------------------

        public проц Rows(цел значение) { wxToolBar_SetRows(шхобъ, значение); }

        public цел MaxRows() { return wxToolBar_GetMaxRows(шхобъ); }

        public цел MaxCols() { return wxToolBar_GetMaxCols(шхобъ); }

        //---------------------------------------------------------------------

        public проц SetMaxRowsCols(цел rows, цел cols)
        {
            wxToolBar_SetMaxRowsCols(шхобъ, rows, cols);
        }

        //---------------------------------------------------------------------

        public Размер ToolBitmapSize() { 
                Размер size;
                wxToolBar_GetToolBitmapSize(шхобъ, size); 
                return size;
            }
        public проц ToolBitmapSize(Размер значение) { wxToolBar_SetToolBitmapSize(шхобъ, значение); }

        //---------------------------------------------------------------------

        public Размер ToolSize() { 
                Размер size;
                wxToolBar_GetToolSize(шхобъ, size); 
                return size;
            }

        //---------------------------------------------------------------------

        public ToolBarTool FindToolForPosition(цел x, цел y)
        {
            return cast(ToolBarTool)FindObject(wxToolBar_FindToolForPosition(шхобъ, x, y), &ToolBarTool.Нов);
        }

        //---------------------------------------------------------------------

        public бул IsVertical() { return wxToolBar_IsVertical(шхобъ); }

        //---------------------------------------------------------------------

        public override бул AcceptsFocus()
        {
            return wxToolBar_AcceptsFocus(шхобъ); 
        }

	}

+/