//-----------------------------------------------------------------------------
// wxD - БуферОбмена.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// (C) 2005 afb <afb@users.sourceforge.net>
// based on
// wx.NET - БуферОбмена.cs
//
/// The wxClipboard wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: БуферОбмена.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Clipboard;
public import wx.common;
public import wx.DataFormat;
public import wx.DataObject;

		//! \cond EXTERN
		static extern (C) ЦУк wxClipboard_ctor();
		static extern (C) бул   wxClipboard_Open(ЦУк сам);
		static extern (C) проц   wxClipboard_Close(ЦУк сам);
		static extern (C) бул   wxClipboard_IsOpened(ЦУк сам);
		static extern (C) бул   wxClipboard_AddData(ЦУк сам, ЦУк данные);
		static extern (C) бул   wxClipboard_SetData(ЦУк сам, ЦУк данные);
		static extern (C) бул   wxClipboard_IsSupported(ЦУк сам, ЦУк format);
		static extern (C) бул   wxClipboard_GetData(ЦУк сам, ЦУк данные);
		static extern (C) проц   wxClipboard_Clear(ЦУк сам);
		static extern (C) бул   wxClipboard_Flush(ЦУк сам);
		static extern (C) проц   wxClipboard_UsePrimarySelection(ЦУк сам, бул primary);
		static extern (C) ЦУк wxClipboard_Get();
		//! \endcond

		//-----------------------------------------------------------------------------
		
	alias БуферОбмена wxClipboard;
	public class БуферОбмена : wxObject
	{
		static БуферОбмена TheClipboard = пусто;

		// this crashed in GTK+, since it needs a valid context first
		// so it's called by Прил in the ПриИниц() handler now
		static проц инициализуй()
		{
			if(!TheClipboard)
				TheClipboard = new БуферОбмена(wxClipboard_Get());
		}

		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public  this()
			{ super(wxClipboard_ctor()); }
		
		//-----------------------------------------------------------------------------

		public бул Открой()
		{
			return wxClipboard_Open(шхобъ);
		}

		public проц Закрой()
		{
			wxClipboard_Close(шхобъ);
		}

		//-----------------------------------------------------------------------------

		public бул Открыт()
		{
			return wxClipboard_IsOpened(шхобъ);
		}

		//-----------------------------------------------------------------------------

		public бул ДобавьДанные(ОбъектДанных данные)
		{
			return wxClipboard_AddData(шхобъ, wxObject.SafePtr(данные));
		}

		public бул УстДанные(ОбъектДанных данные)
		{
			return wxClipboard_SetData(шхобъ, wxObject.SafePtr(данные));
		}

		public бул ДайДанные(ОбъектДанных данные)
		{
			return wxClipboard_GetData(шхобъ, wxObject.SafePtr(данные));
		}

		//-----------------------------------------------------------------------------

		public бул Поддерживается(ФорматДанных format)
		{
			return wxClipboard_IsSupported(шхобъ, wxObject.SafePtr(format));
		}

		//-----------------------------------------------------------------------------

		public проц Очисть()
		{
			wxClipboard_Clear(шхобъ);
		}

		public бул Flush()
		{
			return wxClipboard_Flush(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
	
		public /+virtual+/ проц UsePrimarySelection(бул primary)
		{
			wxClipboard_UsePrimarySelection(шхобъ, primary);
		}
	}
		
	//-----------------------------------------------------------------------------
	
		//! \cond EXTERN
		static extern (C) ЦУк wxClipboardLocker_ctor(ЦУк clipboard);
		static extern (C) проц   wxClipboardLocker_dtor(ЦУк сам);
		static extern (C) бул   wxClipboardLocker_IsOpen(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------
		
	/* re-implement using D */
	public scope class ClipboardLocker // not wxObject
	{
		public this(БуферОбмена clipboard = пусто)
		{
			if (clipboard is пусто)
			{
				if (БуферОбмена.TheClipboard is пусто)
					БуферОбмена.TheClipboard = new БуферОбмена(wxClipboard_Get());
			
				m_clipboard = БуферОбмена.TheClipboard;
			}
			else
			{
			    m_clipboard = clipboard;
			}
			if (m_clipboard) {
				m_clipboard.Открой();
			}
		}
		
		public ~this()
		{
			if (m_clipboard) {
				m_clipboard.Закрой();
			}
		}
		
		private БуферОбмена m_clipboard;
/*
		private ЦУк шхобъ;
	
		public this()
			{ this(пусто);}
			
		public this(БуферОбмена clipboard)
			{ шхобъ = wxClipboardLocker_ctor(wxObject.SafePtr(clipboard)); }
			

		public ~this()
		{
			wxClipBoardLocker_dtor(шхобъ);
		}
			
		//-----------------------------------------------------------------------------
			
		public бул IsOpen() { return wxClipboardLocker_IsOpen(шхобъ); }
*/
	}
