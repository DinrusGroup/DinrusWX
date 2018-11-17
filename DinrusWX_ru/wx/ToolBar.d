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

		//! \cond EXTERN
		static extern (C) ЦелУкз wxToolBarToolBase_ctor(ЦелУкз tbar, цел toolid, ткст ярлык, ЦелУкз bmpNormal, ЦелУкз bmpDisabled, цел kind, ЦелУкз clientData, ткст shortHelpString, ткст longHelpString);
		static extern (C) ЦелУкз wxToolBarToolBase_ctorCtrl(ЦелУкз tbar, ЦелУкз control);
		static extern (C) цел    wxToolBarToolBase_GetId(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBarToolBase_GetControl(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBarToolBase_GetToolBar(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_IsButton(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_IsControl(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_IsSeparator(ЦелУкз сам);
		static extern (C) цел    wxToolBarToolBase_GetStyle(ЦелУкз сам);
		static extern (C) цел    wxToolBarToolBase_GetKind(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_IsEnabled(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_IsToggled(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_CanBeToggled(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBarToolBase_GetLabel(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBarToolBase_GetShortHelp(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBarToolBase_GetLongHelp(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBarToolBase_GetClientData(ЦелУкз сам);
		static extern (C) бул   wxToolBarToolBase_Enable(ЦелУкз сам, бул вкл);
		static extern (C) бул   wxToolBarToolBase_Toggle(ЦелУкз сам, бул toggle);
		static extern (C) бул   wxToolBarToolBase_SetToggle(ЦелУкз сам, бул toggle);
		static extern (C) бул   wxToolBarToolBase_SetShortHelp(ЦелУкз сам, ткст help);
		static extern (C) бул   wxToolBarToolBase_SetLongHelp(ЦелУкз сам, ткст help);
		static extern (C) проц   wxToolBarToolBase_Toggle(ЦелУкз сам);
		static extern (C) проц   wxToolBarToolBase_SetNormalBitmap(ЦелУкз сам, ЦелУкз bmp);
		static extern (C) проц   wxToolBarToolBase_SetDisabledBitmap(ЦелУкз сам, ЦелУкз bmp);
		static extern (C) проц   wxToolBarToolBase_SetLabel(ЦелУкз сам, ткст ярлык);
		static extern (C) проц   wxToolBarToolBase_SetClientData(ЦелУкз сам, ЦелУкз clientData);
		static extern (C) проц   wxToolBarToolBase_Detach(ЦелУкз сам);
		static extern (C) проц   wxToolBarToolBase_Attach(ЦелУкз сам, ЦелУкз tbar);
		//! \endcond

       //---------------------------------------------------------------------

	alias ИнструментТулбар wxToolBarTool;
	public class ИнструментТулбар : wxObject
	{
        public this(ЦелУкз wxobj)
            { super(wxobj); }

        public this(ТулБар tbar = null, цел toolid = wxID_SEPARATOR, ткст ярлык = "", Битмап bmpNormal = Битмап.wxNullBitmap, Битмап bmpDisabled = Битмап.wxNullBitmap, ItemKind kind = ItemKind.wxITEM_NORMAL, ClientData clientData = null, ткст shortHelpString = "", ткст longHelpString = "")
            { this(wxToolBarToolBase_ctor(wxObject.SafePtr(tbar), toolid, ярлык, wxObject.SafePtr(bmpNormal), wxObject.SafePtr(bmpDisabled), cast(цел)kind, wxObject.SafePtr(clientData), shortHelpString, longHelpString)); }

        public this(ТулБар tbar, Control control)
            { this(wxToolBarToolBase_ctorCtrl(wxObject.SafePtr(tbar), wxObject.SafePtr(control))); }


	public static wxObject Нов(ЦелУкз ptr) { return new ИнструментТулбар(ptr); }
        //---------------------------------------------------------------------

		public цел ИД() {return wxToolBarToolBase_GetId(wxobj); }

		public Control control() { return cast(Control)НайдиОбъект(wxToolBarToolBase_GetControl(wxobj)); }

		public ТулБар тулБар() { return cast(ТулБар)НайдиОбъект(wxToolBarToolBase_GetToolBar(wxobj), &ТулБар.Нов); }

        //---------------------------------------------------------------------

		public бул IsButton() { return wxToolBarToolBase_IsButton(wxobj); }

		бул IsControl() { return wxToolBarToolBase_IsControl(wxobj); }

		бул IsSeparator() { return wxToolBarToolBase_IsSeparator(wxobj); }

        //---------------------------------------------------------------------

		public цел Стиль() { return wxToolBarToolBase_GetStyle(wxobj); }

		public ItemKind Kind() { return cast(ItemKind)wxToolBarToolBase_GetKind(wxobj); }

        //---------------------------------------------------------------------

		бул CanBeToggled()
        {
            return wxToolBarToolBase_CanBeToggled(wxobj);
        }

        //---------------------------------------------------------------------

		public ткст Ярлык() { return cast(ткст) new wxString(wxToolBarToolBase_GetLabel(wxobj), да); }
		public проц Ярлык(ткст значение) { wxToolBarToolBase_SetLabel(wxobj, значение); }

		public ткст ShortHelp() { return cast(ткст) new wxString(wxToolBarToolBase_GetShortHelp(wxobj), да); }
		public проц ShortHelp(ткст значение) { wxToolBarToolBase_SetShortHelp(wxobj, значение); }

		public ткст LongHelp() { return cast(ткст) new wxString(wxToolBarToolBase_GetLongHelp(wxobj), да); }
		public проц LongHelp(ткст значение) { wxToolBarToolBase_SetLongHelp(wxobj, значение); }

        //---------------------------------------------------------------------

		public ClientData clientData() { return cast(ClientData)НайдиОбъект(wxToolBarToolBase_GetClientData(wxobj)); }
		public проц clientData(ClientData значение) { wxToolBarToolBase_SetClientData(wxobj, wxObject.SafePtr(значение)); }

        //---------------------------------------------------------------------

		public проц Активен(бул значение) { wxToolBarToolBase_Enable(wxobj, значение); }
		public бул Активен() {return wxToolBarToolBase_IsEnabled(wxobj); }

		public проц Toggled(бул значение) { wxToolBarToolBase_SetToggle(wxobj, значение); }
		public бул Toggled() { return wxToolBarToolBase_IsToggled(wxobj); }

        //---------------------------------------------------------------------

		public проц NormalBitmap(Битмап значение) { wxToolBarToolBase_SetNormalBitmap(wxobj, wxObject.SafePtr(значение)); }

		public проц DisabledBitmap(Битмап значение) { wxToolBarToolBase_SetDisabledBitmap(wxobj, wxObject.SafePtr(значение)); }

        //---------------------------------------------------------------------

		проц Detach()
        {
            wxToolBarToolBase_Detach(wxobj);
        }

		проц Attach(ТулБар tbar)
        {
            wxToolBarToolBase_Attach(wxobj, wxObject.SafePtr(tbar));
        }

        //---------------------------------------------------------------------
	}

		//! \cond EXTERN
		static extern (C) ЦелУкз wxToolBar_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль);
		static extern (C) ЦелУкз wxToolBar_AddTool1(ЦелУкз сам, цел toolid, ткст ярлык, ЦелУкз битмап, ЦелУкз bmpDisabled, цел kind, ткст shortHelp, ткст longHelp, ЦелУкз data);
		static extern (C) ЦелУкз wxToolBar_AddTool2(ЦелУкз сам, цел toolid, ткст ярлык, ЦелУкз битмап, ткст shortHelp, цел kind);
		static extern (C) ЦелУкз wxToolBar_AddCheckTool(ЦелУкз сам, цел toolid, ткст ярлык, ЦелУкз битмап, ЦелУкз bmpDisabled, ткст shortHelp, ткст longHelp, ЦелУкз data);
		static extern (C) ЦелУкз wxToolBar_AddRadioTool(ЦелУкз сам, цел toolid, ткст ярлык, ЦелУкз битмап, ЦелУкз bmpDisabled, ткст shortHelp, ткст longHelp, ЦелУкз data);
		static extern (C) ЦелУкз wxToolBar_AddControl(ЦелУкз сам, ЦелУкз control);
		static extern (C) ЦелУкз wxToolBar_InsertControl(ЦелУкз сам, цел поз, ЦелУкз control);
		static extern (C) ЦелУкз wxToolBar_FindControl(ЦелУкз сам, цел toolid);
		static extern (C) ЦелУкз wxToolBar_AddSeparator(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBar_InsertSeparator(ЦелУкз сам, цел поз);
		static extern (C) ЦелУкз wxToolBar_RemoveTool(ЦелУкз сам, цел toolid);
		static extern (C) бул   wxToolBar_DeleteToolByPos(ЦелУкз сам, цел поз);
		static extern (C) бул   wxToolBar_DeleteTool(ЦелУкз сам, цел toolid);
		static extern (C) проц   wxToolBar_ClearTools(ЦелУкз сам);
		static extern (C) бул   wxToolBar_Realize(ЦелУкз сам);
		static extern (C) проц   wxToolBar_EnableTool(ЦелУкз сам, цел toolid, бул вкл);
		static extern (C) проц   wxToolBar_ToggleTool(ЦелУкз сам, цел toolid, бул toggle);
		static extern (C) ЦелУкз wxToolBar_GetToolClientData(ЦелУкз сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolClientData(ЦелУкз сам, цел toolid, ЦелУкз clientData);
		static extern (C) бул   wxToolBar_GetToolState(ЦелУкз сам, цел toolid);
		static extern (C) бул   wxToolBar_GetToolEnabled(ЦелУкз сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolShortHelp(ЦелУкз сам, цел toolid, ткст helpString);
		static extern (C) ЦелУкз wxToolBar_GetToolShortHelp(ЦелУкз сам, цел toolid);
		static extern (C) проц   wxToolBar_SetToolLongHelp(ЦелУкз сам, цел toolid, ткст helpString);
		static extern (C) ЦелУкз wxToolBar_GetToolLongHelp(ЦелУкз сам, цел toolid);
		static extern (C) проц   wxToolBar_SetMargins(ЦелУкз сам, цел x, цел y);
		static extern (C) проц   wxToolBar_SetToolPacking(ЦелУкз сам, цел packing);
		static extern (C) проц   wxToolBar_SetToolSeparation(ЦелУкз сам, цел separation);
		static extern (C) проц   wxToolBar_GetToolMargins(ЦелУкз сам, inout Размер Размер);
		static extern (C) цел    wxToolBar_GetToolPacking(ЦелУкз сам);
		static extern (C) цел    wxToolBar_GetToolSeparation(ЦелУкз сам);
		static extern (C) проц   wxToolBar_SetRows(ЦелУкз сам, цел nRows);
		static extern (C) проц   wxToolBar_SetMaxRowsCols(ЦелУкз сам, цел rows, цел cols);
		static extern (C) цел    wxToolBar_GetMaxRows(ЦелУкз сам);
		static extern (C) цел    wxToolBar_GetMaxCols(ЦелУкз сам);
		static extern (C) проц   wxToolBar_SetToolBitmapSize(ЦелУкз сам, inout Размер Размер);
		static extern (C) проц   wxToolBar_GetToolBitmapSize(ЦелУкз сам, inout Размер Размер);
		static extern (C) проц   wxToolBar_GetToolSize(ЦелУкз сам, inout Размер Размер);
		static extern (C) ЦелУкз wxToolBar_FindToolForPosition(ЦелУкз сам, цел x, цел y);
		static extern (C) бул   wxToolBar_IsVertical(ЦелУкз сам);
		static extern (C) ЦелУкз wxToolBar_AddTool3(ЦелУкз сам, цел toolid, ЦелУкз битмап, ЦелУкз bmpDisabled, бул toggle, ЦелУкз clientData, ткст shortHelpString, ткст longHelpString);
		static extern (C) ЦелУкз wxToolBar_AddTool4(ЦелУкз сам, цел toolid, ЦелУкз битмап, ткст shortHelpString, ткст longHelpString);
		static extern (C) ЦелУкз wxToolBar_AddTool5(ЦелУкз сам, цел toolid, ЦелУкз битмап, ЦелУкз bmpDisabled, бул toggle, цел xPos, цел yPos, ЦелУкз clientData, ткст shortHelp, ткст longHelp);
		static extern (C) ЦелУкз wxToolBar_InsertTool(ЦелУкз сам, цел поз, цел toolid, ЦелУкз битмап, ЦелУкз bmpDisabled, бул toggle, ЦелУкз clientData, ткст shortHelp, ткст longHelp);
		static extern (C) бул   wxToolBar_AcceptsFocus(ЦелУкз сам);
		//! \endcond

        //---------------------------------------------------------------------

	alias ТулБар wxToolBar;
	public class ТулБар : Control
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

        public this(ЦелУкз wxobj)
            { super(wxobj); }

        public this(Окно родитель, цел ид, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxNO_BORDER|wxTB_HORIZONTAL)
            { this(wxToolBar_ctor(wxObject.SafePtr(родитель), ид, поз, Размер, стиль)); }

	//---------------------------------------------------------------------
	// ctors with сам created ид

        public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxNO_BORDER|wxTB_HORIZONTAL)
	    { this(родитель, Окно.УникИД, поз, Размер, стиль);}

        //---------------------------------------------------------------------

        public ИнструментТулбар добавьИнструмент(цел toolid, ткст ярлык, Битмап битмап)
        {
            return добавьИнструмент(toolid, ярлык, битмап, "", cast(ItemKind)0);
        }

        public ИнструментТулбар добавьИнструмент(цел toolid, ткст ярлык, Битмап битмап, Битмап bmpDisabled, ItemKind kind, ткст shortHelp, ткст longHelp, ClientData clientData)
        {
            return new ИнструментТулбар(wxToolBar_AddTool1(wxobj, toolid, ярлык, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), cast(цел)kind, shortHelp, longHelp, wxObject.SafePtr(clientData)));
        }

        public ИнструментТулбар добавьИнструмент(цел toolid, ткст ярлык, Битмап битмап, ткст shortHelp, ItemKind kind = ItemKind.wxITEM_NORMAL)
        {
            return new ИнструментТулбар(wxToolBar_AddTool2(wxobj, toolid, ярлык, wxObject.SafePtr(битмап), shortHelp, cast(цел)kind));
        }

        public ИнструментТулбар добавьИнструмент(цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, ClientData clientData, ткст shortHelpString, ткст longHelpString)
        {
            return new ИнструментТулбар(wxToolBar_AddTool3(wxobj, toolid, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), toggle, wxObject.SafePtr(clientData), shortHelpString, longHelpString));
        }

        public ИнструментТулбар добавьИнструмент(цел toolid, Битмап битмап, ткст shortHelpString)
            { return добавьИнструмент(toolid, битмап, shortHelpString, ""); }
        public ИнструментТулбар добавьИнструмент(цел toolid, Битмап битмап, ткст shortHelpString, ткст longHelpString)
        {
            return new ИнструментТулбар(wxToolBar_AddTool4(wxobj, toolid, wxObject.SafePtr(битмап), shortHelpString, longHelpString));
        }

        public ИнструментТулбар добавьИнструмент(цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, цел xPos, цел yPos, ClientData clientData, ткст shortHelp, ткст longHelp)
        {
            return new ИнструментТулбар(wxToolBar_AddTool5(wxobj, toolid, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), toggle, xPos, yPos, wxObject.SafePtr(clientData), shortHelp, longHelp));
        }

        //---------------------------------------------------------------------

        public ИнструментТулбар InsertTool(цел поз, цел toolid, Битмап битмап, Битмап bmpDisabled, бул toggle, ClientData clientData, ткст shortHelp, ткст longHelp)
        {
            return new ИнструментТулбар(wxToolBar_InsertTool(wxobj, поз, toolid, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), toggle, wxObject.SafePtr(clientData), shortHelp, longHelp));
        }

        //---------------------------------------------------------------------

        public ИнструментТулбар AddCheckTool(цел toolid, ткст ярлык, Битмап битмап, Битмап bmpDisabled, ткст shortHelp, ткст longHelp)
        {
            return new ИнструментТулбар(wxToolBar_AddCheckTool(wxobj, toolid, ярлык, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), shortHelp, longHelp, wxObject.SafePtr(null)));
        }

        public ИнструментТулбар AddRadioTool(цел toolid, ткст ярлык, Битмап битмап, Битмап bmpDisabled, ткст shortHelp, ткст longHelp)
        {
            return new ИнструментТулбар(wxToolBar_AddRadioTool(wxobj, toolid, ярлык, wxObject.SafePtr(битмап), wxObject.SafePtr(bmpDisabled), shortHelp, longHelp, wxObject.SafePtr(null)));
        }

        //---------------------------------------------------------------------

        public ИнструментТулбар AddControl(Control ctrl)
        {
            return new ИнструментТулбар(wxToolBar_AddControl(wxobj, wxObject.SafePtr(ctrl)));
        }

        public ИнструментТулбар InsertControl(цел поз, Control ctrl)
        {
            return new ИнструментТулбар(wxToolBar_InsertControl(wxobj, поз, wxObject.SafePtr(ctrl)));
        }

        public ИнструментТулбар FindControl(цел toolid)
        {
            return cast(ИнструментТулбар)НайдиОбъект(wxToolBar_FindControl(wxobj, toolid), &ИнструментТулбар.Нов);
        }

        //---------------------------------------------------------------------

        public ИнструментТулбар добавьРазделитель()
        {
            return new ИнструментТулбар(wxToolBar_AddSeparator(wxobj));
        }

        public ИнструментТулбар вставьРазделитель(цел поз)
        {
            return new ИнструментТулбар(wxToolBar_InsertSeparator(wxobj, поз));
        }

        //---------------------------------------------------------------------

        public ИнструментТулбар RemoveTool(цел toolid)
        {
            return cast(ИнструментТулбар)НайдиОбъект(wxToolBar_RemoveTool(wxobj, toolid), &ИнструментТулбар.Нов);
        }

        public бул DeleteToolByPos(цел поз)
        {
            return wxToolBar_DeleteToolByPos(wxobj, поз);
        }

        public бул DeleteTool(цел toolid)
        {
            return wxToolBar_DeleteTool(wxobj, toolid);
        }

        public проц ClearTools()
        {
            wxToolBar_ClearTools(wxobj);
        }

        //---------------------------------------------------------------------

        public бул Realize()
        {
            return wxToolBar_Realize(wxobj);
        }

        //---------------------------------------------------------------------

        public проц EnableTool(цел toolid, бул вкл)
        {
            wxToolBar_EnableTool(wxobj, toolid, вкл);
        }

        public проц ToggleTool(цел toolid, бул toggle)
        {
            wxToolBar_ToggleTool(wxobj, toolid, toggle);
        }

        //---------------------------------------------------------------------

        public проц УстToolClientData(цел toolid, ClientData clientData)
        {
            wxToolBar_SetToolClientData(wxobj, toolid, wxObject.SafePtr(clientData));
        }

        public ClientData GetToolClientData(цел toolid)
        {
            return cast(ClientData)wxObject.НайдиОбъект(wxToolBar_GetToolClientData(wxobj, toolid));
        }

        //---------------------------------------------------------------------

        public бул GetToolState(цел toolid)
        {
            return wxToolBar_GetToolState(wxobj, toolid);
        }

        public бул GetToolEnable(цел toolid)
        {
            return wxToolBar_GetToolEnabled(wxobj, toolid);
        }

        //---------------------------------------------------------------------

        public ткст GetToolShortHelp(цел toolid)
        {
            return cast(ткст) new wxString(wxToolBar_GetToolShortHelp(wxobj, toolid), да);
        }

        public проц УстToolShortHelp(цел toolid, ткст helpString)
        {
            wxToolBar_SetToolShortHelp(wxobj, toolid, helpString);
        }

        //---------------------------------------------------------------------

        public ткст GetToolLongHelp(цел toolid)
        {
            return cast(ткст) new wxString(wxToolBar_GetToolLongHelp(wxobj, toolid), да);
        }

        public проц УстToolLongHelp(цел toolid, ткст helpString)
        {
            wxToolBar_SetToolLongHelp(wxobj, toolid, helpString);
        }

        //---------------------------------------------------------------------

        public проц УстMargins(цел x, цел y) { wxToolBar_SetMargins(wxobj, x, y); }

        public Размер Margins()
        {
		Размер размер;
		wxToolBar_GetToolMargins(wxobj, размер);
		return размер;
	}
        public проц Margins(Размер значение) { wxToolBar_SetMargins(wxobj, значение.Ширь, значение.Высь); }

        //---------------------------------------------------------------------

        public цел ToolPacking() { return wxToolBar_GetToolPacking(wxobj); }
        public проц ToolPacking(цел значение) { wxToolBar_SetToolPacking(wxobj, значение); }

        //---------------------------------------------------------------------

        public цел Separation() { return wxToolBar_GetToolSeparation(wxobj); }
        public проц Separation(цел значение) { wxToolBar_SetToolSeparation(wxobj, значение); }

        //---------------------------------------------------------------------

        public проц Ряды(цел значение) { wxToolBar_SetRows(wxobj, значение); }

        public цел максРядов() { return wxToolBar_GetMaxRows(wxobj); }

        public цел максКолонок() { return wxToolBar_GetMaxCols(wxobj); }

        //---------------------------------------------------------------------

        public проц устМаксРядовИКолонок(цел rows, цел cols)
        {
            wxToolBar_SetMaxRowsCols(wxobj, rows, cols);
        }

        //---------------------------------------------------------------------

        public Размер размерБитмапаИнструмента() {
                Размер размер;
                wxToolBar_GetToolBitmapSize(wxobj, размер);
                return размер;
            }
        public проц размерБитмапаИнструмента(Размер значение) { wxToolBar_SetToolBitmapSize(wxobj, значение); }

        //---------------------------------------------------------------------

        public Размер размерИнструмента() {
                Размер размер;
                wxToolBar_GetToolSize(wxobj, размер);
                return размер;
            }

        //---------------------------------------------------------------------

        public ИнструментТулбар найдиИнструментПоПозиции(цел x, цел y)
        {
            return cast(ИнструментТулбар)НайдиОбъект(wxToolBar_FindToolForPosition(wxobj, x, y), &ИнструментТулбар.Нов);
        }

        //---------------------------------------------------------------------

        public бул вертикален() { return wxToolBar_IsVertical(wxobj); }

        //---------------------------------------------------------------------

        public override бул фокусируем()
        {
            return wxToolBar_AcceptsFocus(wxobj);
        }

	}

