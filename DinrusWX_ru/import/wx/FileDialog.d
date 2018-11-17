module wx.FileDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ArrayString;


		//! \cond EXTERN
        static extern (C) IntPtr wxFileDialog_ctor(IntPtr родитель, ткст message, ткст defaultDir, ткст defaultFile, ткст wildcard, бцел стиль, inout Точка поз);
        static extern (C) проц   wxFileDialog_dtor(IntPtr сам);

        static extern (C) IntPtr wxFileDialog_GetDirectory(IntPtr сам);
        static extern (C) проц   wxFileDialog_SetDirectory(IntPtr сам, ткст dir);

        static extern (C) IntPtr wxFileDialog_GetFilename(IntPtr сам);
        static extern (C) проц   wxFileDialog_SetFilename(IntPtr сам, ткст filename);

        static extern (C) IntPtr wxFileDialog_GetPath(IntPtr сам);
        static extern (C) проц   wxFileDialog_SetPath(IntPtr сам, ткст path);

        static extern (C) проц   wxFileDialog_SetFilterIndex(IntPtr сам, цел filterIndex);
        static extern (C) цел    wxFileDialog_GetFilterIndex(IntPtr сам);

        static extern (C) IntPtr wxFileDialog_GetWildcard(IntPtr сам);
        static extern (C) проц   wxFileDialog_SetWildcard(IntPtr сам, ткст wildcard);

        static extern (C) проц   wxFileDialog_SetMessage(IntPtr сам, ткст message);
        static extern (C) IntPtr wxFileDialog_GetMessage(IntPtr сам);

        static extern (C) цел    wxFileDialog_ShowModal(IntPtr сам);

        static extern (C) цел    wxFileDialog_GetStyle(IntPtr сам);
        static extern (C) проц   wxFileDialog_SetStyle(IntPtr сам, цел стиль);

        static extern (C) IntPtr wxFileDialog_GetPaths(IntPtr сам);
        static extern (C) IntPtr wxFileDialog_GetFilenames(IntPtr сам);
		//! \endcond

        //---------------------------------------------------------------------

    alias FileDialog wxFileDialog;
    public class FileDialog : Dialog
    {
        public const цел wxOPEN              = 0x0001;
        public const цел wxSAVE              = 0x0002;
        public const цел wxOVERWRITE_PROMPT  = 0x0004;
        public const цел wxHIDE_READONLY     = 0x0008;
        public const цел wxFILE_MUST_EXIST   = 0x0010;
        public const цел wxMULTIPLE          = 0x0020;
        public const цел wxCHANGE_DIR        = 0x0040;

	public const ткст wxFileSelectorPromptStr = "Выберите файл";
	version(__WXMSW__) {
		public const ткст wxFileSelectorDefaultWildcardStr = "*.*";
	} else {
		public const ткст wxFileSelectorDefaultWildcardStr = "*";
	}

        public this(IntPtr wxobj);
        public this(Окно родитель, ткст message = wxFileSelectorPromptStr, ткст defaultDir = "", ткст defaultFile = "", ткст wildcard = wxFileSelectorDefaultWildcardStr , цел стиль = 0, Точка поз = вхДефПоз);
        public ткст Directory();
        public проц Directory(ткст значение) ;
        public ткст Filename();
        public проц Filename(ткст значение);
        public ткст Path() ;
        public проц Path(ткст значение) ;
        public проц FilterIndex(цел значение) ;
		public цел FilterIndex() ;
        public проц Message(ткст значение);
        public ткст Message() ;
        public override цел ShowModal();
        public ткст Wildcard();
        public проц Wildcard(ткст значение) ;
        public цел Стиль() ;
        public проц Стиль(цел значение) ;
        public ткст[] Paths() ;
        public ткст[] Filenames() ;
    }

	//! \cond EXTERN
	static extern (C) IntPtr wxFileSelector_func(ткст message, ткст default_path, ткст default_filename, ткст default_extension, ткст wildcard, цел флаги, IntPtr родитель, цел x, цел y);
	static extern (C) IntPtr wxFileSelectorEx_func(ткст message, ткст default_path, ткст default_filename,цел *indexDefaultExtension, ткст wildcard, цел флаги, IntPtr родитель, цел x, цел y);
	static extern (C) IntPtr wxLoadFileSelector_func(ткст what, ткст extension, ткст default_name, IntPtr родитель);
	static extern (C) IntPtr wxSaveFileSelector_func(ткст what, ткст extension, ткст default_name, IntPtr родитель);
	//! \endcond

ткст FileSelector(
	ткст message = FileDialog.wxFileSelectorPromptStr,
	ткст default_path = null,
	ткст default_filename = null,
	ткст default_extension = null,
	ткст wildcard = FileDialog.wxFileSelectorDefaultWildcardStr,
	цел флаги = 0,
	Окно родитель = null, цел x = -1, цел y = -1);

ткст FileSelectorEx(
	ткст message = FileDialog.wxFileSelectorPromptStr,
	ткст default_path = null,
	ткст default_filename = null,
	цел *indexDefaultExtension = null,
	ткст wildcard = FileDialog.wxFileSelectorDefaultWildcardStr,
	цел флаги = 0,
	Окно родитель = null, цел x = -1, цел y = -1);

ткст LoadFileSelector(
	ткст what,
	ткст extension,
	ткст default_name = null,
	Окно родитель = null);

ткст SaveFileSelector(
	ткст what,
	ткст extension,
	ткст default_name = null,
	Окно родитель = null);

