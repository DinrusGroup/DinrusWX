module wx.ToolBar;
public import wx.common;
public import wx.Bitmap;
public import wx.Control;
public import wx.ClientData;

		//! \cond EXTERN
		static extern (C) IntPtr wxToolBarToolBase_ctor(IntPtr tbar, цел toolid, ткст ярлык, IntPtr bmpNormal, IntPtr bmpDisabled, цел kind, IntPtr clientData, ткст shortHelpString, ткст longHelpString);
		static extern (C) IntPtr wxToolBarToolBase_ctorCtrl(IntPtr tbar, IntPtr control);
		static extern (C) цел    wxToolBarToolBase_GetId(IntPtr сам);
		static extern (C) IntPtr wxToolBarToolBase_GetControl(IntPtr сам);
		static extern (C) IntPtr wxToolBarToolBase_GetToolBar(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_IsButton(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_IsControl(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_IsSeparator(IntPtr сам);
		static extern (C) цел    wxToolBarToolBase_GetStyle(IntPtr сам);
		static extern (C) цел    wxToolBarToolBase_GetKind(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_IsEnabled(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_IsToggled(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_CanBeToggled(IntPtr сам);
		static extern (C) IntPtr wxToolBarToolBase_GetLabel(IntPtr сам);
		static extern (C) IntPtr wxToolBarToolBase_GetShortHelp(IntPtr сам);
		static extern (C) IntPtr wxToolBarToolBase_GetLongHelp(IntPtr сам);
		static extern (C) IntPtr wxToolBarToolBase_GetClientData(IntPtr сам);
		static extern (C) бул   wxToolBarToolBase_Enable(IntPtr сам, бул вкл);
		static extern (C) бул   wxToolBarToolBase_Toggle(IntPtr сам, бул toggle);
		static extern (C) бул   wxToolBarToolBase_SetToggle(IntPtr сам, бул toggle);
		static extern (C) бул   wxToolBarToolBase_SetShortHelp(IntPtr сам, ткст help);
		static extern (C) бул   wxToolBarToolBase_SetLongHelp(IntPtr сам, ткст help);
		static extern (C) проц   wxToolBarToolBase_Toggle(IntPtr сам);
		static extern (C) проц   wxToolBarToolBase_SetNormalBitmap(IntPtr сам, IntPtr bmp);
		static extern (C) проц   wxToolBarToolBase_SetDisabledBitmap(IntPtr сам, IntPtr bmp);
		static extern (C) проц   wxToolBarToolBase_SetLabel(IntPtr сам, ткст ярлык);
		static extern (C) проц   wxToolBarToolBase_SetClientData(IntPtr сам, IntPtr clientData);
		static extern (C) проц   wxToolBarToolBase_Detach(IntPtr сам);
		static extern (C) проц   wxToolBarToolBase_Attach(IntPtr сам, IntPtr tbar);
		//! \endcond

       //---------------------------------------------------------------------
        
	alias ToolBarTool wxToolBarTool;
	public class ToolBarTool : wxObject
	{
        public this(IntPtr wxobj);
        public this(ToolBar tbar = null, цел toolid = wxID_SEPARATOR, ткст ярлык = "", Битмап bmpNormal = Битмап.wxNullBitmap, Битмап bmpDisabled = Битмап.wxNullBitmap, ItemKind kind = ItemKind.wxITEM_NORMAL, ClientData clientData = null, ткст shortHelpString = "", ткст longHelpString = "");
        public this(ToolBar tbar, Control control);
	public static wxObject Нов(IntPtr ptr);
		public цел ИД() ;
		public Control control() ;
		public ToolBar toolBar() ;
		public бул IsButton() ;
		бул IsControl() ;
		бул IsSeparator() ;
		public цел Стиль() ;
		public ItemKind Kind() ;
		бул CanBeToggled();
		public ткст Ярлык() ;
		public проц Ярлык(ткст значение) ;
		public ткст ShortHelp() ;
		public проц ShortHelp(ткст значение) ;
		public ткст LongHelp() ;
		public проц LongHelp(ткст значение) ;
		public ClientData clientData();
		public проц clientData(ClientData значение) ;
		public проц Активен(бул значение) ;
		public бул Активен() ;
		public проц Toggled(бул значение) ;
		public бул Toggled() ;
		public проц NormalBitmap(Битмап значение) ;
		public проц DisabledBitmap(Битмап значение) ;
		проц Detach();
		проц Attach(ToolBar tbar);
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxToolBar_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль);
		static extern (C) IntPtr wxToolBar_AddTool1(IntPtr сам, цел toolid, ткст ярлык, IntPtr битмап, IntPtr bmpDisabled, цел kind, ткст shortHelp, ткст longHelp, IntPtr data);
		static extern (C) IntPtr wxToolBar_AddTool2(IntPtr сам, цел toolid, ткст ярлык, IntPtr битмап, ткст shortHelp, цел kind);
		static extern (C) IntPtr wxToolBar_AddCheckTool(IntPtr сам, цел toolid, ткст ярлык, IntPtr битмап, IntPtr bmpDisabled, ткст shortHelp, ткст longHelp, IntPtr data);
		static extern (C) IntPtr wxToolBar_AddRadioTool(IntPtr сам, цел toolid, ткст ярлык, IntPtr битмап, IntPtr bmpDisabled, ткст shortHelp, ткст longHelp, IntPtr data);
		static extern (C) IntPtr wxToolBar_AddControl(IntPtr сам, IntPtr control);
		static extern (C) IntPtr wxToolBar_InsertControl(IntPtr сам, цел поз, IntPtr control);
		static extern (C) IntPtr wxToolBar_FindControl(IntPtr сам, цел toolid);
		static extern (C) IntPtr wxToolBar_AddSeparator(IntPtr сам);
		static extern (C) IntPtr wxToolBar_InsertSeparator(IntPtr сам, цел поз);
		static extern (C) IntPtr wxToolBar_RemoveTool(IntPtr сам, цел toolid);
		static extern (C) бул   wxToolBar_DeleteToolByPos(IntPtr сам, цел поз);
		static extern (C) бул   wxToolBar_DeleteTool(IntPtr сам, цел toolid);
		static extern (C) проц   wxToolBar_ClearTools(IntPtr сам);
		static extern (C) бул   wxToolBar_Realize(IntPtr сам);
		static extern (C) проц   wxToolBar_EnableTool(IntPtr сам, цел toolid, бул вкл);
		static extern (C) проц   wxToolBar_ToggleTool(IntPtr сам, цел toolid, бул toggle);
		static extern (C) IntPtr wxToolBar_GetToolClientData(IntPtr сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolClientData(IntPtr сам, цел toolid, IntPtr clientData);
		static extern (C) бул   wxToolBar_GetToolState(IntPtr сам, цел toolid);
		static extern (C) бул   wxToolBar_GetToolEnabled(IntPtr сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolShortHelp(IntPtr сам, цел toolid, ткст helpString);
		static extern (C) IntPtr wxToolBar_GetToolShortHelp(IntPtr сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolLongHelp(IntPtr сам, цел toolid, ткст helpString);
		static extern (C) IntPtr wxToolBar_GetToolLongHelp(IntPtr сам, цел toolid);
		static extern (C) проц   wxToolBar_SetMargins(IntPtr сам, цел x, цел y);
		static extern (C) проц   wxToolBar_SetToolPacking(IntPtr сам, цел packing);
		static extern (C) проц   wxToolBar_SetToolSeparation(IntPtr сам, цел separation);
		static extern (C) проц   wxToolBar_GetToolMargins(IntPtr сам, inout Размер разм);
		static extern (C) цел    wxToolBar_GetToolPacking(IntPtr сам);
		static extern (C) цел    wxToolBar_GetToolSeparation(IntPtr сам);
		static extern (C) проц   wxToolBar_SetRows(IntPtr сам, цел nRows);
		static extern (C) проц   wxToolBar_SetMaxRowsCols(IntPtr сам, цел rows, цел cols);
		static extern (C) цел    wxToolBar_GetMaxRows(IntPtr сам);
		static extern (C) цел    wxToolBar_GetMaxCols(IntPtr сам);
		static extern (C) проц   wxToolBar_SetToolBitmapSize(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxToolBar_GetToolBitmapSize(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxToolBar_GetToolSize(IntPtr сам, inout Размер разм);
		static extern (C) IntPtr wxToolBar_FindToolForPosition(IntPtr сам, цел x, цел y);
		static extern (C) бул   wxToolBar_IsVertical(IntPtr сам);
		static extern (C) IntPtr wxToolBar_AddTool3(IntPtr сам, цел toolid, IntPtr битмап, IntPtr bmpDisabled, бул toggle, IntPtr clientData, ткст shortHelpString, ткст longHelpString);
		static extern (C) IntPtr wxToolBar_AddTool4(IntPtr сам, цел toolid, IntPtr битмап, ткст shortHelpString, ткст longHelpString);
		static extern (C) IntPtr wxToolBar_AddTool5(IntPtr сам, цел toolid, IntPtr битмап, IntPtr bmpDisabled, бул toggle, цел xPos, цел yPos, IntPtr clientData, ткст shortHelp, ткст longHelp);
		static extern (C) IntPtr wxToolBar_InsertTool(IntPtr сам, цел поз, цел toolid, IntPtr битмап, IntPtr bmpDisabled, бул toggle, IntPtr clientData, ткст shortHelp, ткст longHelp);
		static extern (C) бул   wxToolBar_AcceptsFocus(IntPtr сам);
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

        public this(IntPtr wxobj) ;
        public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxNO_BORDER|wxTB_HORIZONTAL);
        public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxNO_BORDER|wxTB_HORIZONTAL);
        public ToolBarTool AddTool(цел toolid, ткст ярлык, Битмап битмап);
        public ToolBarTool AddTool(цел toolid, ткст ярлык, Битмап битмап, Битмап bmpDisabled, ItemKind kind, ткст shortHelp, ткст longHelp, ClientData clientData);
        public ToolBarTool AddTool(цел toolid, ткст ярлык, Битмап битмап, ткст shortHelp, ItemKind kind = ItemKind.wxITEM_NORMAL);
        public ToolBarTool AddTool(цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, ClientData clientData, ткст shortHelpString, ткст longHelpString);
        public ToolBarTool AddTool(цел toolid, Битмап битмап, ткст shortHelpString);
        public ToolBarTool AddTool(цел toolid, Битмап битмап, ткст shortHelpString, ткст longHelpString);
        public ToolBarTool AddTool(цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, цел xPos, цел yPos, ClientData clientData, ткст shortHelp, ткст longHelp);
        public ToolBarTool InsertTool(цел поз, цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, ClientData clientData, ткст shortHelp, ткст longHelp);
        public ToolBarTool AddCheckTool(цел toolid, ткст ярлык, Битмап битмап, Битмап bmpDisabled, ткст shortHelp, ткст longHelp);
        public ToolBarTool AddRadioTool(цел toolid, ткст ярлык, Битмап битмап, Битмап bmpDisabled, ткст shortHelp, ткст longHelp);
        public ToolBarTool AddControl(Control ctrl);
        public ToolBarTool InsertControl(цел поз, Control ctrl);
        public ToolBarTool FindControl(цел toolid);
        public ToolBarTool AddSeparator();
        public ToolBarTool InsertSeparator(цел поз);
        public ToolBarTool RemoveTool(цел toolid);
        public бул DeleteToolByPos(цел поз);
        public бул DeleteTool(цел toolid);
        public проц ClearTools();
        public бул Realize();
        public проц EnableTool(цел toolid, бул вкл);
        public проц ToggleTool(цел toolid, бул toggle);
        public проц УстToolClientData(цел toolid, ClientData clientData);
        public ClientData GetToolClientData(цел toolid);
        public бул GetToolState(цел toolid);
        public бул GetToolEnable(цел toolid);
        public ткст GetToolShortHelp(цел toolid);
        public проц УстToolShortHelp(цел toolid, ткст helpString);
        public ткст GetToolLongHelp(цел toolid);
        public проц УстToolLongHelp(цел toolid, ткст helpString);
        public проц УстMargins(цел x, цел y) ;
        public Размер Margins();
        public проц Margins(Размер значение) ;
        public цел ToolPacking() ;
        public проц ToolPacking(цел значение);
        public цел Separation() ;
        public проц Separation(цел значение) ;
        public проц Rows(цел значение) ;
        public цел MaxRows() ;
        public цел MaxCols() ;
        public проц УстMaxRowsCols(цел rows, цел cols);
        public Размер ToolBitmapSize() ;
        public проц ToolBitmapSize(Размер значение) ;
        public Размер ToolSize() ;
        public ToolBarTool FindToolForPosition(цел x, цел y);
        public бул IsVertical();
        public override бул ПринимаетФокус();

	}

