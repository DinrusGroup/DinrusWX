//-----------------------------------------------------------------------------
// wxD/Samples - Шрифт.d
//
// wxD "Шрифт" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Шрифт.d,v 1.11 2008/03/03 20:04:19 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.stream;
private import std.ткст;
alias std.ткст.find indexOf;

	public class MyCanvas : Окно
	{
		private Цвет m_colour;
		private Шрифт m_font;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель )
		{
			super( родитель );
			m_colour = Цвет.wxRED;
			m_font = Шрифт.wxNORMAL_FONT;
			
			EVT_PAINT( & OnPaint ) ;
		}
		
		//---------------------------------------------------------------------
		
		public Шрифт TextFont() { return m_font; }
		public проц TextFont(Шрифт значение) { m_font = значение; }
		
		//---------------------------------------------------------------------
		
		public Цвет colour() { return m_colour; }
		public проц   colour(Цвет значение) { m_colour = значение; }
		
		//---------------------------------------------------------------------
		
		public проц OnPaint( Объект sender, Событие e )
		{
			PaintDC dc = new PaintDC( this );
			PrepareDC( dc );
			
			dc.Фон = new Кисть( "white",СтильЗаливки.wxSOLID );
			dc.Очисть();
			
			цел hLine = dc.CharHeight;
			
			цел x = 5;
			цел y = 5;
			
			ткст fontinfo = "Шрифт size is " ~ .toString(m_font.PointSize) ~ " points, family: " ~
				.toString(m_font.FamilyString.ptr) ~ ", encoding: " ~ FontMapper.GetEncodingDescription( m_font.Encoding );
				
			dc.РисуйТекст( fontinfo, x, y );
			y += hLine;
			
			fontinfo = "Style: " ~ m_font.StyleString ~ ", weight: " ~ m_font.WeightString ~
				", fixed ширина: " ~ (m_font.IsFixedWidth ? "yes" : "no");
				
			dc.РисуйТекст( fontinfo, x, y );
			y += hLine;
			
			if ( m_font.Ок )
			{
				ЦУк info = m_font.NativeFontInfo;
				if ( info != ЦУк.init )
				{
					ткст fontDesc = m_font.NativeFontInfoUserDesc;
					fontinfo = "Native шрифт info: " ~ fontDesc;
					
					dc.РисуйТекст( fontinfo, x, y );
					y += hLine;
				}
			}
			
			y += hLine;
			
			dc.шрифт = m_font;
			dc.ППланТекста = m_colour;
			
			цел maxCharWidth;
			цел maxCharHeight;
			
			dc.GetTextExtent( "W", maxCharWidth, maxCharHeight );
			
			цел w = maxCharWidth + 5;
			цел h = maxCharHeight + 4;
			
			for ( цел i = 0; i < 7; i++)
			{
				for ( цел j = 0; j < 32; j++ )
				{
					сим c = cast(сим)( 32 * ( i + 1 ) + j );
					
					цел charWidth;
					цел charHeight;
					
					ткст s = .toString(c);
					dc.GetTextExtent( s, charWidth, charHeight );
					dc.РисуйТекст( 
						s, 
						x + w * j + ( maxCharWidth - charWidth ) / 2 + 1, 
						y + h * i + ( maxCharHeight - charHeight ) / 2 
					);
				}
			}
			
			dc.перо = new Перо( new Цвет( "синий" ), 1, СтильЗаливки.wxSOLID );
			
			цел l;
			
			for ( l = 0; l < 8; l++ )
			{
				цел yl = y + h * l - 2;
				dc.РисуйЛинию( x - 2, yl, x + 32 * w - 1, yl );
			}
			
			for ( l = 0; l < 33; l++ )
			{
				цел xl = x + w * l - 2;
				dc.РисуйЛинию( xl, y - 2, xl, y + 7 * h - 1 );
			}
			
			dc.Dispose(); //needed
		}
	}
	
	//---------------------------------------------------------------------
	
	public class FontFrame : Frame
	{
		enum Cmd { Font_Quit, Font_About, Font_ViewMsg, Font_IncSize, Font_DecSize, Font_Bold,
			Font_Italic, Font_Underlined, Font_wxNORMAL_FONT, Font_wxSMALL_FONT, Font_wxITALIC_FONT,
			Font_wxSWISS_FONT, Font_Choose, Font_EnumFamiliesForEncoding, Font_EnumFamilies,
			Font_EnumFixedFamilies, Font_EnumEncodings, Font_CheckNativeToFromString, Font_Max }
		
		//---------------------------------------------------------------------
		
		protected цел m_fontSize;
		
		protected TextCtrl m_textctrl;
		protected MyCanvas m_canvas;
		
		public static ткст s_dir="";
		public static ткст s_file="";
		
		//---------------------------------------------------------------------
	
		public this( ткст title, Точка поз, Размер size )
		{
			super( title, поз, size );
			иконка = new Icon( "../Samples/Шрифт/mondrian.png" );
			
			m_fontSize = 12;
			
			Меню menuFile = new Меню();
			menuFile.Append( Cmd.Font_ViewMsg, "&View...\tCtrl-V", "View an email message file" );
			menuFile.AppendSeparator();
			menuFile.Append( Cmd.Font_About, "&About...\tCtrl-A", "Show about dialog" );
			menuFile.AppendSeparator();
			menuFile.Append( Cmd.Font_Quit, "E&xit\tAlt-X", "Quit this program" );
			
			Меню menuFont = new Меню();
			menuFont.Append( Cmd.Font_IncSize, "&Increase шрифт size by 2 points\tCtrl-I" );
			menuFont.Append( Cmd.Font_DecSize, "&Decrease шрифт size by 2 points\tCtrl-D" );
			menuFont.AppendSeparator();
			menuFont.AppendCheckItem( Cmd.Font_Bold, "&Bold\tCtrl-B", "Toggle bold state" );
			menuFont.AppendCheckItem( Cmd.Font_Italic, "&Oblique\tCtrl-O", "Toggle italic state" );
			menuFont.AppendCheckItem( Cmd.Font_Underlined, "&Underlined\tCtrl-U", "Toggle underlined state" );
			
			menuFont.AppendSeparator();
			menuFont.Append( Cmd.Font_CheckNativeToFromString, "Check Native Шрифт Info To/From String" );
			
			Меню menuSelect = new Меню();
			menuSelect.Append( Cmd.Font_Choose, "&Select шрифт...\tCtrl-S", "Select a standard шрифт" );
			
			Меню menuStdFonts = new Меню();
			menuStdFonts.Append( Cmd.Font_wxNORMAL_FONT, "wxNORMAL_FONT", "Normal шрифт used by wxWidgets" );
			menuStdFonts.Append( Cmd.Font_wxSMALL_FONT,  "wxSMALL_FONT",  "Small шрифт used by wxWidgets" );
			menuStdFonts.Append( Cmd.Font_wxITALIC_FONT, "wxITALIC_FONT", "Italic шрифт used by wxWidgets" );
			menuStdFonts.Append( Cmd.Font_wxSWISS_FONT,  "wxSWISS_FONT",  "Swiss шрифт used by wxWidgets" );
			menuSelect.Append(-2, "Standar&d fonts", menuStdFonts, "" );

			menuSelect.AppendSeparator();
			menuSelect.Append( Cmd.Font_EnumFamilies, "Enumerate шрифт &families\tCtrl-F" );
			menuSelect.Append( Cmd.Font_EnumFixedFamilies, "Enumerate fi&xed шрифт families\tCtrl-X" );
			menuSelect.Append( Cmd.Font_EnumEncodings, "Enumerate &encodings\tCtrl-E" );
			menuSelect.Append( Cmd.Font_EnumFamiliesForEncoding, "Find шрифт for en&coding...\tCtrl-C", "Find шрифт families for given encoding" );
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			menuBar.Append( menuFont, "F&ont" );
			menuBar.Append( menuSelect, "&Select" );
			
			this.menuBar = menuBar;
			
			SplitterWindow splitter = new SplitterWindow( this );
			
			m_textctrl = new TextCtrl( splitter, -1, 
				"Вставь текст here to see how it looks\nlike in the given шрифт",
				wxDefaultPosition, wxDefaultSize,
				TextCtrl.wxTE_MULTILINE );
			
			m_canvas = new MyCanvas( splitter );
			
			splitter.SplitHorizontally( m_textctrl, m_canvas, 100 );
			
			CreateStatusBar();
			StatusText = "Welcome to wxWidgets шрифт demo!";	
			
			EVT_MENU( Cmd.Font_Quit,  & OnQuit ) ;
			EVT_MENU( Cmd.Font_ViewMsg, & OnViewMsg ) ;
			EVT_MENU( Cmd.Font_About, & OnAbout ) ;

			EVT_MENU( Cmd.Font_IncSize, & OnIncFont ) ;
			EVT_MENU( Cmd.Font_DecSize, & OnDecFont ) ;
			EVT_MENU( Cmd.Font_Bold, & OnBold ) ;
			EVT_MENU( Cmd.Font_Italic, & OnItalic ) ;
			EVT_MENU( Cmd.Font_Underlined, & OnUnderline ) ;

			EVT_MENU( Cmd.Font_wxNORMAL_FONT, & OnwxPointerFont ) ;
			EVT_MENU( Cmd.Font_wxSMALL_FONT, & OnwxPointerFont ) ;
			EVT_MENU( Cmd.Font_wxITALIC_FONT, & OnwxPointerFont ) ;
			EVT_MENU( Cmd.Font_wxSWISS_FONT, & OnwxPointerFont ) ;

			EVT_MENU( Cmd.Font_CheckNativeToFromString, & OnCheckNativeToFromString ) ;

			EVT_MENU( Cmd.Font_Choose, & OnSelectFont ) ;
			EVT_MENU( Cmd.Font_EnumFamiliesForEncoding, & OnEnumerateFamiliesForEncoding ) ;
			EVT_MENU( Cmd.Font_EnumFamilies, & OnEnumerateFamilies ) ;
			EVT_MENU( Cmd.Font_EnumFixedFamilies, & OnEnumerateFixedFamilies ) ;
			EVT_MENU( Cmd.Font_EnumEncodings, & OnEnumerateEncodings ) ;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект sender, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnViewMsg( Объект sender, Событие e )
		{
			FileDialog dialog = new FileDialog( this, "Открой an email message file", s_dir, s_file, "*" );
			if ( dialog.ShowModal() != wxID_OK ) return;
			
			s_dir = dialog.Directory;
			s_file = dialog.Filename;
			
			ткст фимя = dialog.Путь;
			ткст message;

			try
			{
				message = cast(ткст)std.file.read(фимя);
			}
			catch (Exception ex)
			{
				return;
			}
						
			ткст charset;
			
			ткст prefix = "Content-Тип: текст/plain; charset=";
			
			цел поз = message.indexOf( prefix );
			
			if ( поз == -1 )
			{
				Log.LogError( "The file '%s' doesn't contain charset information.", фимя );
				return;
			}
			
			поз += prefix.length + 1; 
			
			цел pos2 = поз;
			
			while ( message[pos2] != '"' )
			{
				pos2++;
			}
						
			charset = message[поз..pos2];
			
			FontEncoding fontenc = FontMapper.Get.CharsetToEncoding( charset );
			if ( fontenc == FontEncoding.wxFONTENCODING_SYSTEM )
			{
				Log.LogError( "Charset '{0}' is unsupported.", charset );
				return;
			}
			
			m_textctrl.ЗагрузиФайл( фимя );
			
			if ( fontenc == FontEncoding.wxFONTENCODING_UTF8 || 
				!FontMapper.Get.IsEncodingAvailable(fontenc) )
			{
				FontEncoding encAlt;
				if ( FontMapper.Get.GetAltForEncoding( fontenc, encAlt ) )
				{
					EncodingConverter conv = new EncodingConverter();
					
					if ( conv.Init( fontenc, encAlt ) )
					{
						fontenc = encAlt;
						m_textctrl.Value = conv.Convert( m_textctrl.Value );
					}
					else
					{
						Log.LogWarning( "Cannot convert from '{0}' to '{1}'.",
							FontMapper.GetEncodingDescription( fontenc ),
							FontMapper.GetEncodingDescription( encAlt ) );
					}
				}
				else
				{
					Log.LogWarning( "No fonts for encoding '{0}' on this system.",
						FontMapper.GetEncodingDescription( fontenc ) );
				}
			}
			
			if ( !DoEnumerateFamilies( нет, fontenc, да ) )
			{
				Шрифт шрифт = new Шрифт( 12, FontFamily.wxDEFAULT, FontStyle.wxNORMAL,
					FontWeight.wxNORMAL, нет, "", fontenc );
				
				if ( шрифт.Ок )
				{
					DoChangeFont( шрифт );
				}
				else
				{
					Log.LogWarning( "No fonts for encoding '{0}' on this system.",
						FontMapper.GetEncodingDescription( fontenc ) );
				}
			}
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект sender, Событие e )
		{
			MessageBox( this, "wxWidgets шрифт demo\n(c) 1999 Vadim Zeitlin\nPorted to wxD by BERO",
				"About Шрифт", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnIncFont( Объект sender, Событие e )
		{
			DoResizeFont( +2 ); 
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnDecFont( Объект sender, Событие e )
		{
			DoResizeFont( -2 );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnBold( Объект sender, Событие e )
		{
			CommandEvent ce = cast(CommandEvent) e;
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.Weight = ce.IsChecked ? FontWeight.wxBOLD : FontWeight.wxNORMAL ;
			DoChangeFont( шрифт );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnItalic( Объект sender, Событие e )
		{
			CommandEvent ce = cast(CommandEvent) e;
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.Style = ce.IsChecked ? FontStyle.wxITALIC : FontStyle.wxNORMAL ;
			DoChangeFont( шрифт );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnUnderline( Объект sender, Событие e )
		{
			CommandEvent ce = cast(CommandEvent) e;
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.Underlined = ce.IsChecked;
			DoChangeFont( шрифт );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnwxPointerFont( Объект sender, Событие e )
		{
			Шрифт шрифт;
			
			switch ( e.ИД )
			{
				case Cmd.Font_wxNORMAL_FONT : шрифт = Шрифт.wxNORMAL_FONT; break;
				case Cmd.Font_wxSMALL_FONT : шрифт = Шрифт.wxSMALL_FONT; break;
				case Cmd.Font_wxITALIC_FONT : шрифт = Шрифт.wxITALIC_FONT; break;
				case Cmd.Font_wxSWISS_FONT : шрифт = Шрифт.wxSWISS_FONT; break;
				default : шрифт = Шрифт.wxNORMAL_FONT; break;
			}
			
			menuBar.Check( Cmd.Font_Bold, нет );
			menuBar.Check( Cmd.Font_Italic, нет );
			menuBar.Check( Cmd.Font_Underlined, нет );
			
			DoChangeFont( шрифт );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnCheckNativeToFromString( Объект sender, Событие e )
		{
			ткст fontinfo = m_canvas.TextFont.NativeFontInfoDesc;
			
			if ( fontinfo.length == 0 )
			{
				Log.LogError( "Native шрифт info ткст is empty!" );
			}
			else
			{
				Шрифт шрифт = Шрифт.Нов( fontinfo );
				if ( fontinfo != шрифт.NativeFontInfoDesc )
					Log.LogError( "wxNativeFontInfo toString()/FromString() broken!" );
				else
					Log.LogMessage( "wxNativeFontInfo works: " ~ fontinfo );
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelectFont( Объект sender, Событие e )
		{
			FontData данные = new FontData();
			данные.InitialFont = m_canvas.TextFont;
			данные.colour = m_canvas.colour;
			
			FontDialog dialog = new FontDialog( this, данные );
			if ( dialog.ShowModal() == wxID_OK )
			{
				FontData refData = dialog.fontData;
				Шрифт шрифт = refData.ChosenFont;
				Цвет colour = refData.colour;
				
				DoChangeFont( шрифт, colour );
				
				menuBar.Check( Cmd.Font_Bold, шрифт.Weight == FontWeight.wxBOLD );
				menuBar.Check( Cmd.Font_Italic, шрифт.Style == FontStyle.wxITALIC );
				menuBar.Check( Cmd.Font_Underlined, шрифт.Underlined );
			}
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateFamiliesForEncoding( Объект sender, Событие e )
		{
			 const FontEncoding[] encodings = 
			 [
				FontEncoding.wxFONTENCODING_ISO8859_1,
				FontEncoding.wxFONTENCODING_ISO8859_2,
				FontEncoding.wxFONTENCODING_ISO8859_5,
				FontEncoding.wxFONTENCODING_ISO8859_7,
				FontEncoding.wxFONTENCODING_ISO8859_15,
				FontEncoding.wxFONTENCODING_KOI8,
				FontEncoding.wxFONTENCODING_CP1250,
				FontEncoding.wxFONTENCODING_CP1251,
				FontEncoding.wxFONTENCODING_CP1252,
			];
			
			 ткст[] encodingNames =
			 [
				"Western European (ISO-8859-1)",
				"Central European (ISO-8859-2)",
				"Cyrillic (ISO-8859-5)",
				"Greek (ISO-8859-7)",
				"Western European with Euro (ISO-8859-15)",
				"KOI8-R",
				"Windows Central European (CP 1250)",
				"Windows Cyrillic (CP 1251)",
				"Windows Western European (CP 1252)",
			];
			
			ткст result = GetSingleChoice( "Choose an encoding", "Шрифт demo", encodingNames );

			цел n = -1;
			for ( цел i = 0; i < encodingNames.length; i++ )
				if ( encodingNames[i] == result )
					{
						n = i;
						break;
					}
					
			if ( n != -1 )
			{
				DoEnumerateFamilies( нет, encodings[n] );
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateFamilies( Объект sender, Событие e )
		{
			DoEnumerateFamilies( нет );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateFixedFamilies( Объект sender, Событие e )
		{
			DoEnumerateFamilies( да );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateEncodings( Объект sender, Событие e )
		{
			MyEncodingEnumerator fontEnumerator = new MyEncodingEnumerator();
			
			fontEnumerator.EnumerateEncodings("");
			
			Log.LogMessage( "Enumerating all available encodings:\n{0}", fontEnumerator.Текст );
		}		
		
		//---------------------------------------------------------------------
		
		protected бул DoEnumerateFamilies( бул fixedWidthOnly )
		{
			return DoEnumerateFamilies( fixedWidthOnly, FontEncoding.wxFONTENCODING_SYSTEM, нет );
		}
		
		protected бул DoEnumerateFamilies( бул fixedWidthOnly, FontEncoding encoding )
		{
			return DoEnumerateFamilies( fixedWidthOnly, encoding, нет );
		}
		
		protected бул DoEnumerateFamilies( бул fixedWidthOnly, FontEncoding encoding, бул silent)
		{
			MyFontEnumerator fontEnumerator = new MyFontEnumerator();
			
			fontEnumerator.EnumerateFacenames( encoding, fixedWidthOnly );
			
			if ( fontEnumerator.GotAny )
			{
				цел nFacenames = fontEnumerator.Facenames.length;
				if ( !silent )
				{
					Log.LogStatus( "Found {0} {1}fonts", nFacenames, 
						fixedWidthOnly ? "fixed ширина" : "" );
				}
				
				ткст facename;
				if ( silent) 
				{
					facename = fontEnumerator.Facenames[0];
				}
				else
				{
					ткст[] facenames = new ткст[nFacenames];
					цел n;
					for ( n = 0; n < nFacenames; n++ )
						facenames[n] = fontEnumerator.Facenames[n];
						
					facename = GetSingleChoice( "Choose a facename", "Шрифт demo", facenames );
					/*for ( цел i = 0; i < facenames.length; i ++ )
						if ( facenames[i].Equals( result ) )
							{
								n = i;
								break;
							}
					
					if ( n != -1 )
						facename = facename[n];*/
				}
				
				if ( !( facename.length == 0 ) )
				{
					Шрифт шрифт = new Шрифт( 12, FontFamily.wxDEFAULT, FontStyle.wxNORMAL, FontWeight.wxNORMAL, нет, facename, encoding );
					
					DoChangeFont( шрифт );
				}
				
				return да;
			}
			else if ( !silent )
			{
				Log.LogWarning( "No such fonts found." );
			}
			
			return нет;
		}
		
		//---------------------------------------------------------------------
		
		protected проц DoResizeFont( цел diff )
		{
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.PointSize = шрифт.PointSize + diff;
			DoChangeFont( шрифт );
		}
		
		//---------------------------------------------------------------------
		
		protected проц DoChangeFont( Шрифт шрифт )
		{
			DoChangeFont( шрифт, пусто );
		}
		
		protected проц DoChangeFont( Шрифт шрифт, Цвет col)
		{
			m_canvas.TextFont = шрифт;
			if ( col )
				if ( col.Ок() )
					m_canvas.colour = col;
			m_canvas.Refresh();
			m_textctrl.шрифт = шрифт;
			if ( col )
				if ( col.Ок() )
					m_textctrl.ЦветПП = col;
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyFontEnumerator : FontEnumerator
	{
		private ткст[] m_facenames;
		
		//---------------------------------------------------------------------
		
		public this()
		{
			super() ;
		}
		
		//---------------------------------------------------------------------
			
		public бул GotAny()
		{
			return ( m_facenames.length > 0 );
		}
		
		//---------------------------------------------------------------------
		
		public ткст[] Facenames()
		{
			return m_facenames;
		}
		 
		//---------------------------------------------------------------------
		
		public override бул OnFacename( ткст facename )
		{ 
			version (D_Version2)
			m_facenames ~= facename.idup;
			else
			m_facenames ~= facename.dup;
			return да;
		}
		
	}
	
	//---------------------------------------------------------------------
	
	public class MyEncodingEnumerator : FontEnumerator
	{
		private цел m_n;
		private ткст m_text;
		
		//---------------------------------------------------------------------	
		
		public this()
			
			{ super(); }
		//---------------------------------------------------------------------	
			
		public ткст Текст()
		{
			return m_text;
		}
		
		//---------------------------------------------------------------------	
		 
		public override бул OnFontEncoding( ткст facename, 
			ткст encoding )
		{
			ткст текст = "Encoding " ~ .toString(++m_n) ~ ": " ~ encoding ~ " (available in facename '" ~ facename ~ "')\n";
			
			m_text ~= текст;
			return да;
		}
	}
	
	//---------------------------------------------------------------------	

	public class FONT : Прил
	{
		public override бул ПриИниц()
		{
			FontFrame frame = new FontFrame( "Шрифт wxWidgets Прил", Точка( 50, 50 ), Размер( 600,400 ) );
			frame.Show( да );
			
			return да;
		}

	//---------------------------------------------------------------------
	
		
		static проц Main()
		{
			FONT прил = new FONT();
			прил.Пуск();
		}
	}	


проц main()
{
	FONT.Main();
}
