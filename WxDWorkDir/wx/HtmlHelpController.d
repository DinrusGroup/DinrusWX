//-----------------------------------------------------------------------------
// wxD - HtmlHelpController.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - HtmlHelpController.cs
//
/// The wxHtmlHelpController wrapper class
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HtmlHelpController.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.HtmlHelpController;
public import wx.common;

public import wx.Config;
public import wx.Frame;

		//! \cond EXTERN
		static extern (C) ЦУк wxHtmlHelpController_ctor(цел стиль);
		static extern (C) проц   wxHtmlHelpController_SetTitleFormat(ЦУк сам, ткст format);
		static extern (C) проц   wxHtmlHelpController_SetTempDir(ЦУк сам, ткст путь);
		static extern (C) бул   wxHtmlHelpController_AddBook(ЦУк сам, ткст book_url);
		static extern (C) бул   wxHtmlHelpController_Display(ЦУк сам, ткст x);
		static extern (C) бул   wxHtmlHelpController_DisplayInt(ЦУк сам, цел ид);
		static extern (C) бул   wxHtmlHelpController_DisplayContents(ЦУк сам);
		static extern (C) бул   wxHtmlHelpController_DisplayIndex(ЦУк сам);
		static extern (C) бул   wxHtmlHelpController_KeywordSearch(ЦУк сам, ткст keyword, цел mode);
		static extern (C) проц   wxHtmlHelpController_UseConfig(ЦУк сам, ЦУк config, ткст rootpath);
		static extern (C) проц   wxHtmlHelpController_ReadCustomization(ЦУк сам, ЦУк cfg, ткст путь);
		static extern (C) проц   wxHtmlHelpController_WriteCustomization(ЦУк сам, ЦУк cfg, ткст путь);
		static extern (C) ЦУк wxHtmlHelpController_GetFrame(ЦУк сам);
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
	
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this(цел стиль = wxHF_DEFAULT_STYLE)
			{ super(wxHtmlHelpController_ctor(стиль));}
			
		//-----------------------------------------------------------------------------
		
		public проц TitleFormat(ткст значение) { wxHtmlHelpController_SetTitleFormat(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public проц TempDir(ткст значение) { wxHtmlHelpController_SetTempDir(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public бул AddBook(ткст book_url)
		{
			return wxHtmlHelpController_AddBook(шхобъ, book_url);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Display(ткст x)
		{
			return wxHtmlHelpController_Display(шхобъ, x);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул Display(цел ид)
		{
			return wxHtmlHelpController_DisplayInt(шхобъ, ид); 
		}
		
		//-----------------------------------------------------------------------------
		
		public бул DisplayContents()
		{
			return wxHtmlHelpController_DisplayContents(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул DisplayIndex()
		{
			return wxHtmlHelpController_DisplayIndex(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул KeywordSearch(ткст keyword)
		{
			return KeywordSearch(keyword, HelpSearchMode.wxHELP_SEARCH_ALL);
		}
		
		public бул KeywordSearch(ткст keyword, HelpSearchMode mode)
		{
			return wxHtmlHelpController_KeywordSearch(шхобъ, keyword, cast(цел)mode);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц UseConfig(Config config)
		{
			UseConfig(config, "");
		}
		
		public проц UseConfig(Config config, ткст rootpath)
		{
			wxHtmlHelpController_UseConfig(шхобъ, wxObject.SafePtr(config), rootpath);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц ReadCustomization(Config cfg)
		{
			ReadCustomization(cfg, "");
		}
		
		public проц ReadCustomization(Config cfg, ткст путь)
		{
			wxHtmlHelpController_ReadCustomization(шхобъ, wxObject.SafePtr(cfg), путь);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц WriteCustomization(Config cfg)
		{
			WriteCustomization(cfg, "");
		}
		
		public проц WriteCustomization(Config cfg, ткст путь)
		{
			wxHtmlHelpController_WriteCustomization(шхобъ, wxObject.SafePtr(cfg), путь);
		}
		
		//-----------------------------------------------------------------------------
		
		public Frame frame() { 
				ЦУк tmp = wxHtmlHelpController_GetFrame(шхобъ); 
				if ( tmp != ЦУк.init )
					return new Frame(tmp);
				else
					return пусто;
			}
	}
