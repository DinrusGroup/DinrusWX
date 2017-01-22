//-----------------------------------------------------------------------------
// wxD - ArtProvider.d
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ArtProvider.cs
//
/// The wxArtProvider wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: ArtProvider.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.ArtProvider;
public import wx.common;
public import wx.Bitmap;
public import wx.Icon;
public import wx.Window;

	public enum ArtID 
	{
		wxART_ADD_BOOKMARK = 1,
		wxART_DEL_BOOKMARK,
		wxART_HELP_SIDE_PANEL,
		wxART_HELP_SETTINGS,
		wxART_HELP_BOOK,
		wxART_HELP_FOLDER,
		wxART_HELP_PAGE,
		wxART_GO_BACK,
		wxART_GO_FORWARD,
		wxART_GO_UP,
		wxART_GO_DOWN,
		wxART_GO_TO_PARENT,
		wxART_GO_HOME,
		wxART_FILE_OPEN,
		wxART_PRINT,
		wxART_HELP,
		wxART_TIP,
		wxART_REPORT_VIEW,
		wxART_LIST_VIEW,
		wxART_NEW_DIR,
		wxART_FOLDER,
		wxART_GO_DIR_UP,
		wxART_EXECUTABLE_FILE,
		wxART_NORMAL_FILE,
		wxART_TICK_MARK,
		wxART_CROSS_MARK,
		wxART_ERROR,
		wxART_QUESTION,
		wxART_WARNING,
		wxART_INFORMATION,
		wxART_MISSING_IMAGE
	}
	
	//---------------------------------------------------------------------
	
	public enum ArtClient
	{
		wxART_TOOLBAR = 1,
		wxART_MENU,
		wxART_FRAME_ICON,
		wxART_CMN_DIALOG,
		wxART_HELP_BROWSER,
		wxART_MESSAGE_BOX,
		wxART_BUTTON,
		wxART_OTHER
	}
	
	//---------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxArtProvider_GetBitmap(цел artid, цел artclient, inout Размер size);
		static extern (C) ЦУк wxArtProvider_GetIcon(цел artid, цел artclient, inout Размер size);
		//! \endcond
		
		//---------------------------------------------------------------------
		
	alias ArtProvider wxArtProvider;
	public class ArtProvider
	{
		public static Битмап GetBitmap(ArtID ид)
		{
			return GetBitmap(ид, ArtClient.wxART_OTHER, Окно.wxDefaultSize);
		}				
		
		public static Битмап GetBitmap(ArtID ид, ArtClient client)
		{
			return GetBitmap(ид, client, Окно.wxDefaultSize);
		}		
		
		public static Битмап GetBitmap(ArtID ид, ArtClient client, Размер size)
		{
			return new Битмап(wxArtProvider_GetBitmap(cast(цел)ид, cast(цел)client, size));
		}
		
		//---------------------------------------------------------------------
		
		public static Icon GetIcon(ArtID ид)
		{
			return GetIcon(ид, ArtClient.wxART_OTHER, Окно.wxDefaultSize);
		}				
		
		public static Icon GetIcon(ArtID ид, ArtClient client)
		{
			return GetIcon(ид, client, Окно.wxDefaultSize);
		}				
		
		public static Icon GetIcon(ArtID ид, ArtClient client, Размер size)
		{
			return new Icon(wxArtProvider_GetIcon(cast(цел)ид, cast(цел)client, size));
		}
	}
