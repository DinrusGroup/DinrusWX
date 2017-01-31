//-----------------------------------------------------------------------------
// wxD - DirДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DirДиалог.cs
//
/// The wxDirДиалог wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DirДиалог.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.DirDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) ЦУк wxDirДиалог_ctor(ЦУк родитель, ткст message, ткст defaultPath, бцел стиль, inout Точка поз, inout Размер size, ткст имя);

        static extern (C) проц   wxDirДиалог_SetPath(ЦУк сам, ткст путь);
        static extern (C) ЦУк wxDirДиалог_GetPath(ЦУк сам);

        static extern (C) цел    wxDirДиалог_GetStyle(ЦУк сам);
        static extern (C) проц   wxDirДиалог_SetStyle(ЦУк сам, цел стиль);

        static extern (C) проц   wxDirДиалог_SetMessage(ЦУк сам, ткст message);
        static extern (C) ЦУк wxDirДиалог_GetMessage(ЦУк сам);

        static extern (C) цел    wxDirДиалог_ShowModal(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias DirДиалог wxDirДиалог;
    public class DirДиалог : Диалог
    {
	enum {  wxDD_NEW_DIR_BUTTON  = 0x0080 }
	enum {  wxDD_DEFAULT_STYLE = (wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER | wxDD_NEW_DIR_BUTTON) }

	public const ткст wxDirSelectorPromptStr = "Select a directory";
	public const ткст wxDirДиалогNameStr = "DirДиалог";
	
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(Окно родитель, ткст title = wxDirSelectorPromptStr, ткст defaultPath = "", цел стиль = wxDD_DEFAULT_STYLE, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, ткст имя = wxDirДиалогNameStr)
            { this(wxDirДиалог_ctor(wxObject.SafePtr(родитель), title, defaultPath, стиль, поз, size, имя)); }

        //-----------------------------------------------------------------------------

        public проц Путь(ткст значение) { wxDirДиалог_SetPath(шхобъ, значение); }
        public ткст Путь() { return cast(ткст) new wxString(wxDirДиалог_GetPath(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц Message(ткст значение) { wxDirДиалог_SetMessage(шхобъ, значение); }
        public ткст Message() { return cast(ткст) new wxString(wxDirДиалог_GetMessage(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public override цел ShowModal()
        {
            return wxDirДиалог_ShowModal(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц Style(цел значение) { wxDirДиалог_SetStyle(шхобъ, значение); }
        public цел Style() { return wxDirДиалог_GetStyle(шхобъ); }

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
              цел стиль = DirДиалог.wxDD_DEFAULT_STYLE ,
              Точка поз = Диалог.wxDefaultPosition,
              Окно родитель = пусто)
	{
		return wxDirSelector_func(message,defaultPath,стиль,поз,wxObject.SafePtr(родитель));
	}
