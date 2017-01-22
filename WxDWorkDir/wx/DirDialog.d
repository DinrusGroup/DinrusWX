//-----------------------------------------------------------------------------
// wxD - DirDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DirDialog.cs
//
/// The wxDirDialog wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DirDialog.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.DirDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) ЦУк wxDirDialog_ctor(ЦУк родитель, ткст message, ткст defaultPath, бцел стиль, inout Точка поз, inout Размер size, ткст имя);

        static extern (C) проц   wxDirDialog_SetPath(ЦУк сам, ткст путь);
        static extern (C) ЦУк wxDirDialog_GetPath(ЦУк сам);

        static extern (C) цел    wxDirDialog_GetStyle(ЦУк сам);
        static extern (C) проц   wxDirDialog_SetStyle(ЦУк сам, цел стиль);

        static extern (C) проц   wxDirDialog_SetMessage(ЦУк сам, ткст message);
        static extern (C) ЦУк wxDirDialog_GetMessage(ЦУк сам);

        static extern (C) цел    wxDirDialog_ShowModal(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias DirDialog wxDirDialog;
    public class DirDialog : Dialog
    {
	enum {  wxDD_NEW_DIR_BUTTON  = 0x0080 }
	enum {  wxDD_DEFAULT_STYLE = (wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER | wxDD_NEW_DIR_BUTTON) }

	public const ткст wxDirSelectorPromptStr = "Select a directory";
	public const ткст wxDirDialogNameStr = "DirDialog";
	
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(Окно родитель, ткст title = wxDirSelectorPromptStr, ткст defaultPath = "", цел стиль = wxDD_DEFAULT_STYLE, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст имя = wxDirDialogNameStr)
            { this(wxDirDialog_ctor(wxObject.SafePtr(родитель), title, defaultPath, стиль, поз, size, имя)); }

        //-----------------------------------------------------------------------------

        public проц Путь(ткст значение) { wxDirDialog_SetPath(шхобъ, значение); }
        public ткст Путь() { return cast(ткст) new wxString(wxDirDialog_GetPath(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц Message(ткст значение) { wxDirDialog_SetMessage(шхобъ, значение); }
        public ткст Message() { return cast(ткст) new wxString(wxDirDialog_GetMessage(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public override цел ShowModal()
        {
            return wxDirDialog_ShowModal(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц Style(цел значение) { wxDirDialog_SetStyle(шхобъ, значение); }
        public цел Style() { return wxDirDialog_GetStyle(шхобъ); }

        //-----------------------------------------------------------------------------
    }

	//! \cond EXTERN
	extern (C) ткст wxDirSelector_func(ткст message,
              ткст defaultPath,
              цел стиль,
              inout Точка поз,
              ЦУк родитель);
	//! \endcond

	ткст DirSelector(ткст message = пусто,
              ткст defaultPath = пусто,
              цел стиль = DirDialog.wxDD_DEFAULT_STYLE ,
              Точка поз = Dialog.wxDefaultPosition,
              Окно родитель = пусто)
	{
		return wxDirSelector_func(message,defaultPath,стиль,поз,wxObject.SafePtr(родитель));
	}
