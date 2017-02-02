//-----------------------------------------------------------------------------
// wxD/Samples - Launcher.d
//
// wxD sample "Launcher".
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Launcher.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.process;
private import std.c.process;

	public class LauncherFrame : Фрейм
	{
		private MiddleHtmlWindow middleHtmlWindow = пусто;
		private TopHtmlWindow topHtmlWindow = пусто;
		private BottomHtmlWindow bottomHtmlWindow = пусто;
		
		//---------------------------------------------------------------------

		public this( ткст title, Точка поз, Размер size )
		{
			super(title, wxDefaultPosition, size);
			иконка = new Icon( "../Samples/Launcher/mondrian.png" );

			CreateStatusBar( 1 );
			StatusText = "Welcome...";	
			
			topHtmlWindow = new TopHtmlWindow( this );
			middleHtmlWindow = new MiddleHtmlWindow( this );
			bottomHtmlWindow = new BottomHtmlWindow( this );
			
			BoxSizer bs = new BoxSizer( Ориентация.wxVERTICAL );
			
			bs.Добавь( topHtmlWindow, 0, Stretch.wxGROW );
			bs.Добавь( middleHtmlWindow, 1, Stretch.wxGROW );
			bs.Добавь( bottomHtmlWindow, 0, Stretch.wxGROW );
			
			sizer = bs;
			
			CheckEnvironment();
		}
		
		//---------------------------------------------------------------------	
		
		private проц CheckEnvironment()
		{
		/*
			// If we could determine they are running under PNET warn them
			// things probably won't work (at cast(of)least v0.6.6)
			ткст clr; //= Environment.GetEnvironmentVariable("CLR_LAUNCHER");
			if (clr == "ilrun")
			{
				MessageДиалог md = new MessageДиалог(this, 
					"There is a bug in DotGNU cast(of)Portable.NET v0.6.6 that does not allow the Launcher to work properly. Process.Start(\"ilrun example.exe\") does not work and results in a defunct process.\n\nYou may continue to use the Launcher; however, unless you have a newer version PNET samples probably won't launch when you click them.",
					"Launcher Error", Диалог.wxOK | Диалог.wxICON_WARNING);
				md.ShowModal();
			}
		*/
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class TopHtmlWindow : HtmlWindow
	{
		public this( LauncherFrame родитель )
		{
			super( родитель, -1, wxDefaultPosition, Размер( 400, 144 ) );
			LoadPage( "../Samples/Launcher/launchertop.html" );
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class BottomHtmlWindow : HtmlWindow
	{
		private LauncherFrame родитель = пусто;
	
		public this( LauncherFrame родитель )
		{
			super( родитель, -1, wxDefaultPosition, Размер( 400, 80 ) );
			this.родитель = родитель;
			LoadPage( "../Samples/Launcher/launcherbottom.html" );
		}
		
		//---------------------------------------------------------------------	
		
		public override проц OnLinkClicked(HtmlLinkInfo link)
		{
			if ( link.Href == "quit" )
			{
				родитель.Закрой();
				return;
			}
		}
	}

	//---------------------------------------------------------------------	
	
	public class MiddleHtmlWindow : HtmlWindow
	{
		private LauncherFrame родитель = пусто;
		
		//---------------------------------------------------------------------	
	
		public this( LauncherFrame родитель )
		{
			super( родитель );
			this.родитель = родитель;
		
			LoadPage( "../Samples/Launcher/wxDSamplesLauncher.html" );
		}
		
		//---------------------------------------------------------------------	
		
		public override проц OnLinkClicked(HtmlLinkInfo link)
		{
			ткст прил = link.Href;
			
			version(__WXMSW__)
			     прил ~= ".exe";
			version(__WXMAC__)
			     прил ~= ".прил";

			if ( std.file.exists( прил ) )
			{
				ткст launch_command = прил;
				ткст[] launch_args = пусто;

                            /*
                                // If we are on a Linux platform, use wxnet-run script to
                                // launch samples. This is not used to pick up environment
                                // as this gets inherited. The script ensures we use the
                                // .NET runtime the user has selected.
                                if ( std.file.exists( "wxnet-run" ) )
                                        launch_command = "./wxnet-run " ~ прил ~ ".exe";

                                // On MacOS we need to launch the appropriate bundle
                                else if ( std.file.exists( "../MacBundles" ) ) //FIXME: check directory
                                        launch_command = "open ../MacBundles/" ~ прил ~ ".прил";

                                // Everything else (Windows for now) just execute the assembly
                                else
                                        launch_command = прил ~ ".exe";
                           */

				version(__WXMAC__)
				{
				    launch_command = "/bin/sh";
				    launch_args ~= launch_command;
				    launch_args ~= "-c";
				    launch_args ~= "/usr/bin/open -a " ~ GetCwd() ~ "/" ~ прил;
				}

				try
				{
					родитель.StatusText = "Executing " ~ прил;
					std.process.spawnvp(_P_NOWAIT, launch_command, launch_args);
				}
				catch (Exception ex)
				{
					TellError("Error running command '" ~ launch_command ~ "': " ~
						ex.msg);
				}
			}
			else
			{
				TellError("The sample " ~ прил ~ " could not be found in the 'bin' directory. The sample may not be available on your operating system or it could not be built because of missing development libraries.");
			}
		}
		
		//---------------------------------------------------------------------	

		private проц TellError(ткст msg)
		{
			MessageДиалог md = new MessageДиалог(this, 
				"An error occured while trying to launch your sample:\n\n" ~ msg,
				"Sample Launch Error", Диалог.wxOK | Диалог.wxICON_WARNING);
			md.ShowModal();
		}
	}
	
	//---------------------------------------------------------------------	

	public class LauncherApp : Прил
	{
		public override бул ПриИниц()
		{
			LauncherFrame frame = new LauncherFrame( "wxD Samples Launcher", Точка( 10, 100 ), Размер( 600, 600 ) );
			frame.Show( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			LauncherApp прил = new LauncherApp();
			прил.Пуск();
		}
	}


проц main()
{
	LauncherApp.Main();
}
