//-----------------------------------------------------------------------------
// wxD/Samples - Internat.d
//
// A wxD version of the wxWidgets "internat" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Internat.d,v 1.10 2008/03/03 20:12:44 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.ткст;

	public class MyFrame : Frame
	{
		enum Cmd
		{ 
			About, 
			Quit, 
			Диалог,
			INTERNAT_TEXT,
    			INTERNAT_TEST,
    			INTERNAT_TEST_1,
    			INTERNAT_TEST_2,
    			INTERNAT_TEST_3,
    			INTERNAT_OPEN 
		}
		
		protected Locale m_locale;

		//---------------------------------------------------------------------

		public this(Locale locale)
		{
			super( пусто, -1, _("International wxWidgets Прил") );
			m_locale = locale;
			
			// Установи the окно иконка

			иконка = new Icon("../Samples/Internat/mondrian.png");

			// Установи up a меню

			Меню fileMenu = new Меню();
			fileMenu.AppendWL( Cmd.About, _("&About..."), &OnAbout) ;
			fileMenu.AppendSeparator();
			fileMenu.AppendWL( Cmd.Quit, _("E&xit"), &OnQuit) ;

			MenuBar menuBar = new MenuBar();
			menuBar.Append( fileMenu, _("&File") );

			this.menuBar = menuBar;
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект sender, Событие e)
		{
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект sender, Событие e)
		{
			ткст locale = m_locale.GetLocale();
			ткст sysname = m_locale.SysName;
			ткст canname = m_locale.CanonicalName;
			
			ткст localeInfo = std.ткст.format( _("Language: %s\nSystem locale имя:\n%s\nCanonical locale имя: %s\n"),
					locale, sysname, canname );
		
			ткст msg = _("I18n sample\n(c) 1998, 1999 Vadim Zeitlin and Julian Smart");
			msg ~= _("\nPorted 2005 to wxD by BERO\n\n");
			msg ~= localeInfo;
			MessageBox(this, msg, _("About Internat"), Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}
	}



	public class Internat : Прил
	{
		public static Language[] langIds =
		[
			Language.wxLANGUAGE_DEFAULT,
			Language.wxLANGUAGE_FRENCH,
			Language.wxLANGUAGE_GERMAN,
			Language.wxLANGUAGE_RUSSIAN,
			Language.wxLANGUAGE_BULGARIAN,
			Language.wxLANGUAGE_CZECH,
			Language.wxLANGUAGE_POLISH,
			Language.wxLANGUAGE_JAPANESE,
			Language.wxLANGUAGE_GEORGIAN,
			Language.wxLANGUAGE_ENGLISH,
			Language.wxLANGUAGE_ENGLISH_US
		];
	
		protected Locale m_locale;
		
		public ткст[] st_args;
	
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			m_locale = new Locale();

			цел lng = -1;
			
			if ( st_args.length == 1 )
			{
				lng = atoi( st_args[0] );
			}
			
			if ( lng == -1 )
			{
				ткст[] langNames =
				[
					"System default",
					"French",
					"German",
					"Russian",
					"Bulgarian",
					"Czech",
					"Polish",
					"Japanese",
					"Georgian",
					"English",
					"English (U.S.)"
				];
				
				lng = GetSingleChoiceIndex( _("Please choose language:"), _("Language"), langNames );
			}
			
			if ( lng != -1 )
				m_locale.Init(langIds[lng]);
				
			if (m_locale.AddCatalog( "../Samples/Internat/internat" )) {}
		
			MyFrame frame = new MyFrame(m_locale);
			frame.Show(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main( ткст[] args )
		{
			Internat прил = new Internat();
			прил.st_args = args;
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}


проц main(ткст[] args)
{
	Internat.Main(args);
}
