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
		
		private HtmlHelpController справка;
		
		public this( Окно родитель, ткст title, Точка поз, Размер size ) 
		{
			super( родитель, -1, title, поз, size )
;
			Меню menuFile = new Меню();
			
			menuFile.AppendWL( Cmd.HtmlHelp_Help, "&Справка", "Test Справка...", & OnHelp ) ;
			menuFile.AppendWL( Cmd.HtmlHelp_About, "&About", "About the sample...", & OnAbout ) ;
			menuFile.AppendWL( Cmd.HtmlHelp_Quit, "E&xit\tAlt-X", "Quit this program", & OnQuit ) ;
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			
			this.menuBar = menuBar;
			
			справка = new HtmlHelpController( HtmlHelpController.wxHF_DEFAULT_STYLE | HtmlHelpController.wxHF_OPEN_FILES) ;
			
			справка.UseConfig( Config.Get() );
			
			справка.TempDir = "." ;
			
			бул ret = справка.AddBook( "../Samples/HtmlHelp/helpfiles/testing.hhp" );
			if ( !ret )
				MessageBox( "Failed adding book ../Samples/HtmlHelp/helpfiles/testing.hhp" );
				
			ret = справка.AddBook( "../Samples/HtmlHelp/helpfiles/another.hhp" );
			if ( !ret )
				MessageBox( "Failed adding book ../Samples/HtmlHelp/helpfiles/another.hhp" );
				
			this.Closing_Add(&OnClosing);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект sender, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnHelp( Объект sender, Событие e )
		{
			справка.Display( "Test HELPFILE" );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnClosing( Объект sender, Событие e )
		{
			if ( справка.frame )
				справка.frame.Закрой();
			e.Пропусти();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект sender, Событие e )
		{
			MessageBox( this, "HtmlHelpController class sample.\n" 
				"\n" 
				"Ported to wxD by BERO", "About HtmlHelpController", Диалог.wxOK | Диалог.wxICON_INFORMATION );
		}
	}
	
	//---------------------------------------------------------------------

	public class HtmlHelp : Прил
	{
		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame( пусто, "HtmlHelpController sample", Окно.wxDefaultPosition, Окно.wxDefaultSize );
			frame.Show( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			HtmlHelp прил = new HtmlHelp();
			прил.Пуск();
		}
	}		



проц main()
{
	HtmlHelp.Main();
}
