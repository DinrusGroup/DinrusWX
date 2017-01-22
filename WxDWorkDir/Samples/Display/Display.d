//-----------------------------------------------------------------------------
// NET/Samples - Display.d
//
// A D version of the Widgets "display" sample with improvements.
//
// Ported by Michael S. Muegel mike _at_ muegel dot org
//
// Licensed	under the Widgets license, see LICENSE.txt for details.
//
// $Ид: Display.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
import CompareModesDialog;
import wx.Display;

	// Client данные class for the choice	control	containing the video modes
	public class MyVideoModeClientData : ClientData
	{
		public this(VideoMode m)
		{
			mode = m;
		}
		public VideoMode mode;
	}

	// Define a	new	application	тип, each program should derive a class from Прил
	public class MyApp : Прил
	{
		public override	бул ПриИниц()
		{
			MyFrame	frame =	new	MyFrame("Display Windows Sample", 
				Точка(-1, -1), Размер(-1, -1));
			frame.Show(да);
			return да;
		}

		//---------------------------------------------------------------------

		
		static проц	Main()
		{
			MyApp прил =	new	MyApp();
			прил.Пуск();
		}
	} // MyApp

	// Define a	new	frame тип:	this is	going to be	our	main frame
	public class MyFrame : Frame
	{
		// меню items
		public const цел ID_About = 100;
		public const цел ID_Quit = 101;
		public const цел ID_FromPoint = 102;
		public const цел ID_FromPointError = 103;
		public const цел ID_VideoModeCompare = 104;
		public const цел ID_FullScreen = 105;

		// controls
		public const цел ID_ChangeMode = 106;
		public const цел ID_ResetMode = 107;
		public const цел ID_CurrentMode = 108;

		// used within event handlers
		Notebook m_notebook;

		public this(ткст title, Точка поз,	Размер size)
		{
			super(title, поз, size);

			// Установи up menus
			Меню menuDisplay = new Меню();
			menuDisplay.Append(ID_FromPoint, "Find display from &point ...");
			menuDisplay.Append(ID_FromPointError, "Simulate off screen find display from point ...");
			menuDisplay.Append(ID_VideoModeCompare, "Compare video modes for currently selected display ...");
			
			menuDisplay.AppendSeparator();
			menuDisplay.AppendCheckItem(ID_FullScreen,	"Full &screen\tF12");
			menuDisplay.AppendSeparator();
			menuDisplay.Append(ID_Quit, "E&xit\tAlt-X", "Quit this program");

			// the "About" элемент	should be in the справка меню
			Меню helpMenu =	new	Меню();
			helpMenu.Append(ID_About, "&About...\tF1",	"Show about dialog");

			// now append the freshly created меню to the меню bar...
			MenuBar	menuBar	= new MenuBar();
			menuBar.Append(menuDisplay,	"&Display");
			menuBar.Append(helpMenu, "&Справка");

			// ... and attach this меню	bar	to the frame
			MenuBar = menuBar;

			// create status bar
			CreateStatusBar();

			// create child	controls
			Panel panel	= new Panel(this, -1);
			m_notebook = new Notebook(panel, -1);

			цел счёт = Display.Счёт;
			for	( цел nDpy = 0; nDpy < счёт; nDpy++	)
			{
				Display	display	= new Display(nDpy);

				Окно page	= new Panel(m_notebook,	-1);

				// create 2	column flex	grid sizer with	growable 2nd column
				FlexGridSizer sizer	= new FlexGridSizer(2, 10, 20);
				sizer.AddGrowableCol(1);

				Прямоугольник к = display.Geometry;
				sizer.Добавь(new StaticText(page, -1, "Origin:	"));
				sizer.Добавь(new StaticText(page, -1, к.Location.ToString()));

				sizer.Добавь(new StaticText(page, -1, "Размер: "));
				sizer.Добавь(new StaticText(page, -1, к.Ширина + "," ~ к.Высота));


				sizer.Добавь(new StaticText(page, -1, "Имя: "));
				sizer.Добавь(new StaticText(page, -1, display.Имя));

				// Added this to port
				sizer.Добавь(new StaticText(page, -1, "Is Primary?: "));
				sizer.Добавь(new StaticText(page, -1, display.IsPrimary.ToString()));

				Выбор choiceModes	= new Выбор(page, ID_ChangeMode);
				VideoMode[] modes	= display.GetModes();
				for	( цел nMode = 0; nMode < modes.Length; nMode++ )
				{
					VideoMode mode = modes[nMode];

					choiceModes.Append(mode.ToString(),
						new	MyVideoModeClientData(mode));
				}

				sizer.Добавь(new StaticText(page, -1, "&Modes:	"));
				sizer.Добавь(choiceModes, 0, Stretch.wxEXPAND);

				sizer.Добавь(new StaticText(page, -1, "Current: "));
				sizer.Добавь(new StaticText(page, ID_CurrentMode,
					display.CurrentMode.ToString()));

				// add it to another sizer to have borders around it and button	below
				Sizer sizerTop	= new BoxSizer(Ориентация.wxVERTICAL);
				sizerTop.Добавь(sizer,	1, Direction.wxALL | Stretch.wxEXPAND, 10);

				sizerTop.Добавь(new Кнопка(page, ID_ResetMode, "&Reset mode"),
					0, Direction.wxALL | Dialog.wxCENTRE, 5);
				page.SetSizer(sizerTop);

				m_notebook.AddPage(page, "Display "	+ nDpy.ToString());
			}

			NotebookSizer notebookSizer	= new NotebookSizer(m_notebook);
			panel.SetSizer(notebookSizer);
			notebookSizer.Fit(this);


			// Bind	events
			EVT_MENU(ID_Quit,	new	EventListener(OnQuit));
			EVT_MENU(ID_FromPoint,	 &OnFromPoint);
			EVT_MENU(ID_FromPointError,	 &OnFromPointError);
			EVT_MENU(ID_VideoModeCompare,	 &OnCompareModes);
			EVT_MENU(ID_FullScreen, &OnFullScreen);
			EVT_MENU(ID_About,	new	EventListener(OnAbout));
			EVT_CHOICE(ID_ChangeMode, &OnChangeMode);
			EVT_BUTTON(ID_ResetMode, &OnResetMode);
			EVT_LEFT_UP(new	EventListener(OnLeftClick));
			EVT_DISPLAY_CHANGED(new	EventListener(OnDisplayChanged));

		} // MyFrame ctor

		// Меню	selection handlers
		public проц	OnQuit(Объект sender, Событие	e)
		{
			Закрой(да);
		}

		public проц	OnFromPoint(Объект sender, Событие e)
		{
			SetStatusText("Press the mouse anywhere...");
			CaptureMouse();
		}

		public проц	OnFromPointError(Объект sender, Событие e)
		{
			ShowScreenFromPoint(Точка(-9999, -9999));
		}

		public проц	OnFullScreen(Объект	sender,	Событие e)
		{
			CommandEvent ce = cast(CommandEvent)e;
			ShowFullScreen(ce.IsChecked);
		}

		public проц	OnAbout(Объект sender, Событие e)
		{
			ткст msg = "This is the wxWidgets display sample ported to C#. Port by Michael S. Muegel.";
			MessageBox(this, msg, "About Display Sample",
				Dialog.wxOK);
		}

		public проц	OnChangeMode(Объект	sender,	Событие e)
		{
			CommandEvent ce = cast(CommandEvent)e;
			Display	display	= CurrentDisplay();
			VideoMode mode = cast(VideoMode) (cast(MyVideoModeClientData)ce.ClientObject).mode;
			if (! display.ChangeMode(mode))
				MessageBox(this, "Changing video mode failed!", 
					"Error", Dialog.wxOK | Dialog.wxICON_WARNING);
		}

		public проц	OnResetMode(Объект sender, Событие e)
		{
			CurrentDisplay().ResetMode();
		}

		public проц	OnLeftClick(Объект sender, Событие e)
		{
			if ( HasCapture() )
			{
				MouseEvent me = cast(MouseEvent)e;
				// mouse events	are	in client coords, Display works	in screen ones
				Точка ptScreen = ClientToScreen(me.Положение);
				ReleaseMouse();
				ShowScreenFromPoint(ptScreen);
			}
		}

		private проц ShowScreenFromPoint(Точка ptScreen)
		{
			цел	dpy	= Display.GetFromPoint(ptScreen);

			if ( dpy ==	Display.wxNOT_FOUND )
				MessageBox(this, 
					"Mouse clicked outside of display at " ~ ptScreen.ToString(),
					"Error", Dialog.wxOK | Dialog.wxICON_WARNING);
			else
				MessageBox(this, "Mouse clicked in display #" +
					dpy.ToString() + " at " ~ ptScreen.ToString(), 
					"Click Result", Dialog.wxOK);

		}

		public проц	OnDisplayChanged(Объект	sender,	Событие e)
		{
			// update the current mode текст
			for	( цел n = 0; n < m_notebook.PageCount; n++ )
			{
				StaticText надпись = cast(StaticText) m_notebook.GetPage(n).FindWindow(ID_CurrentMode);
				if ( надпись != пусто)
					надпись.Label = (new Display(n)).CurrentMode.toString();
			}


			MessageBox(this, "EVT_DISPLAY_CHANGED fired. Display resolution has been changed.", "Resolution Changed", Dialog.wxOK);

			e.Пропусти();
		}

		public проц	OnCompareModes(Объект sender, Событие	e)
		{
			CompareModesDialog dialog = new CompareModesDialog(this, 
				-1, CurrentDisplay());
			dialog.ShowModal();
		}

		private Display CurrentDisplay()
		{
			return new Display(m_notebook.Selection);
		}

	} // MyFrame


	/*
	#ifdef __MSW__
		if ( argc == 2 && !Stricmp(argv[1],	 _T("/dx"))	)
		{
			Display::UseDirectX(да);
		}
	#endif // __MSW__
	*/

проц main()
{
	MyApp.Main();
}
