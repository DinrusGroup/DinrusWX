
module wx.HtmlHelpController;
public import wx.common;

public import wx.Config;
public import wx.Frame;

		//! \cond EXTERN
		static extern (C) IntPtr wxHtmlHelpController_ctor(цел стиль);
		static extern (C) проц   wxHtmlHelpController_SetTitleFormat(IntPtr сам, ткст format);
		static extern (C) проц   wxHtmlHelpController_SetTempDir(IntPtr сам, ткст path);
		static extern (C) бул   wxHtmlHelpController_AddBook(IntPtr сам, ткст book_url);
		static extern (C) бул   wxHtmlHelpController_Display(IntPtr сам, ткст x);
		static extern (C) бул   wxHtmlHelpController_DisplayInt(IntPtr сам, цел ид);
		static extern (C) бул   wxHtmlHelpController_DisplayContents(IntPtr сам);
		static extern (C) бул   wxHtmlHelpController_DisplayIndex(IntPtr сам);
		static extern (C) бул   wxHtmlHelpController_KeywordSearch(IntPtr сам, ткст keyword, цел mode);
		static extern (C) проц   wxHtmlHelpController_UseConfig(IntPtr сам, IntPtr config, ткст rootpath);
		static extern (C) проц   wxHtmlHelpController_ReadCustomization(IntPtr сам, IntPtr cfg, ткст path);
		static extern (C) проц   wxHtmlHelpController_WriteCustomization(IntPtr сам, IntPtr cfg, ткст path);
		static extern (C) IntPtr wxHtmlHelpController_GetFrame(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias HtmlHelpController wxHtmlHelpController;
	public class HtmlHelpController : wxObject
	{
		enum {
			wxHF_TOOLBAR =	0x0001,
			wxHF_CONTENTS =	0x0002,
			wxHF_INDEX =		0x0004,
			wxHF_SEARCH =		0x0008,
			wxHF_BOOKMARKS =	0x0010,
			wxHF_OPEN_FILES =	0x0020,
			wxHF_PRINT = 		0x0040,
			wxHF_FLAT_TOOLBAR =	0x0080,
			wxHF_MERGE_BOOKS =	0x0100,
			wxHF_ICONS_BOOK =	0x0200,
			wxHF_ICONS_BOOK_CHAPTER = 0x0400,
			wxHF_ICONS_FOLDER = 0x0000,
			wxHF_DEFAULT_STYLE =		(wxHF_TOOLBAR | wxHF_CONTENTS | 
					wxHF_INDEX | wxHF_SEARCH | 
					wxHF_BOOKMARKS | wxHF_PRINT),
			wxHF_OPENFILES =	wxHF_OPEN_FILES,
			wxHF_FLATTOOLBAR = 	wxHF_FLAT_TOOLBAR,
			wxHF_DEFAULTSTYLE =	wxHF_DEFAULT_STYLE,
		}
		//-----------------------------------------------------------------------------
	
		public this(IntPtr wxobj);
		public this(цел стиль = wxHF_DEFAULT_STYLE);
		public проц TitleFormat(ткст значение);
		public проц TempDir(ткст значение);
		public бул AddBook(ткст book_url);
		public бул Display(ткст x);
		public бул Display(цел ид);
		public бул DisplayContents();
		public бул DisplayIndex();
		public бул KeywordSearch(ткст keyword);
		public бул KeywordSearch(ткст keyword, HelpSearchMode mode);
		public проц UseConfig(Config config);
		public проц UseConfig(Config config, ткст rootpath);
		public проц ReadCustomization(Config cfg);
		public проц ReadCustomization(Config cfg, ткст path);
		public проц WriteCustomization(Config cfg);
		public проц WriteCustomization(Config cfg, ткст path);
		public Frame frame() ;
	}
