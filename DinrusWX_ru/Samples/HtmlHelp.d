//-----------------------------------------------------------------------------
// wxD/Samples - HtmlHelp.cs
//
// wxD "HtmlHelpController" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HtmlHelp.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	public class MyFrame : Frame
	{
		public enum Cmd 
		{ 
			HtmlHelp_Quit,
			HtmlHelp_About,
			HtmlHelp_Help
		}
		
		private HtmlHelpController help;
		
		public this( Окно родитель, ткст title, Точка поз, Размер Размер ) 
		{
			super( родитель, -1, title, поз, Размер )
;
			Меню menuFile = new Меню();
			
			menuFile.AppendWL( Cmd.HtmlHelp_Help, "&Help", "Test Help...", & OnHelp ) ;
			menuFile.AppendWL( Cmd.HtmlHelp_About, "&About", "About the sample...", & OnAbout ) ;
			menuFile.AppendWL( Cmd.HtmlHelp_Quit, "E&xit\tAlt-X", "Quit this program", & OnQuit ) ;
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			
			this.menuBar = menuBar;
			
			help = new HtmlHelpController( HtmlHelpController.wxHF_DEFAULT_STYLE | HtmlHelpController.wxHF_OPEN_FILES) ;
			
			help.UseConfig( Config.Get() );
			
			help.TempDir = "." ;
			
			бул ret = help.AddBook( "./helpfiles/testing.hhp" );
			if ( !ret )
				MessageBox( "Failed adding book ./helpfiles/testing.hhp" );
				
			ret = help.AddBook( "./helpfiles/another.hhp" );
			if ( !ret )
				MessageBox( "Failed adding book ./helpfiles/another.hhp" );
				
			this.Closing_Add(&OnClosing);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnHelp( Объект отправитель, Событие e )
		{
			help.Display( "Test HELPFILE" );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnClosing( Объект отправитель, Событие e )
		{
			if ( help.frame )
				help.frame.Закрой();
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( this, "HtmlHelpController class sample.\n" 
				"\n" 
				"Ported to wxD by BERO", "About HtmlHelpController", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}
	}
	
	//---------------------------------------------------------------------

	public class HtmlHelp : Апп
	{
		public override бул ПоИниц()
		{
			MyFrame frame = new MyFrame( null, "HtmlHelpController sample", Окно.вхДефПоз, Окно.вхДефРазм );
			frame.Покажи( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			HtmlHelp app = new HtmlHelp();
			app.Пуск();
		}
	}		



проц main()
{
	HtmlHelp.Main();
}
