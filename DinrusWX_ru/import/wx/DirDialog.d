module wx.DirDialog;
public import wx.common;
public import wx.Dialog;

		//! \cond EXTERN
        static extern (C) IntPtr wxDirDialog_ctor(IntPtr родитель, ткст message, ткст defaultPath, бцел стиль, inout Точка поз, inout Размер разм, ткст имя);

        static extern (C) проц   wxDirDialog_SetPath(IntPtr сам, ткст path);
        static extern (C) IntPtr wxDirDialog_GetPath(IntPtr сам);

        static extern (C) цел    wxDirDialog_GetStyle(IntPtr сам);
        static extern (C) проц   wxDirDialog_SetStyle(IntPtr сам, цел стиль);

        static extern (C) проц   wxDirDialog_SetMessage(IntPtr сам, ткст message);
        static extern (C) IntPtr wxDirDialog_GetMessage(IntPtr сам);

        static extern (C) цел    wxDirDialog_ShowModal(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias DirDialog wxDirDialog;
    public class DirDialog : Dialog
    {
	enum {  wxDD_NEW_DIR_BUTTON  = 0x0080 }
	enum {  wxDD_DEFAULT_STYLE = (wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER | wxDD_NEW_DIR_BUTTON) }

	public const ткст wxDirSelectorPromptStr = "Выберите папку";
	public const ткст wxDirDialogNameStr = "DirDialog";
	
        public this(IntPtr wxobj) ;
        public this(Окно родитель, ткст title = wxDirSelectorPromptStr, ткст defaultPath = "", цел стиль = wxDD_DEFAULT_STYLE, Точка поз = вхДефПоз, Размер разм = вхДефРазм, ткст имя = wxDirDialogNameStr);
        public проц Path(ткст значение);
        public ткст Path() ;
        public проц Message(ткст значение);
        public ткст Message() ;
        public override цел ShowModal();
        public проц Стиль(цел значение);
        public цел Стиль() ;
    }

	//! \cond EXTERN
	extern (C) ткст wxDirSelector_func(ткст message,
              ткст defaultPath,
              цел стиль,
              inout Точка поз,
              IntPtr родитель);
	//! \endcond

	ткст DirSelector(ткст message = null,
              ткст defaultPath = null,
              цел стиль = DirDialog.wxDD_DEFAULT_STYLE ,
              Точка поз = Dialog.вхДефПоз,
              Окно родитель = null);
