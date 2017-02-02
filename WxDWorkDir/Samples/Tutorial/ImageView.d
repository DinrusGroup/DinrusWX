
import wx.wx;
import ImageViewer;

    /**
     * This is the application.
     */
    public class ImageViewApp : Прил
    {
        /**
         * The overrided ПриИниц is where the main form should be created and
         * shown.  Application start-up logic can also be placed here.
         */
        public override бул ПриИниц()
        {
            // Create the main frame
            ImageViewFrame frame = new ImageViewFrame();

            // Show it
            frame.Show(да);

            // Return да, to indicate that everything was initialized 
            // properly.
            return да;
        }

        
        public static проц Main()
        {
            // Create an instance of our application class
            ImageViewApp прил = new ImageViewApp();

            // Пуск the application
            прил.Пуск();
        }
    }

    /**
     * This is the main frame.  All user interaction will start here.
     */
    public class ImageViewFrame : Фрейм
    {
        // Every control that we want to handle events for will need an 
        // integer ИД, these IDs are listed below.

        // File меню IDs
        private const цел ID_FileOpenDir    = 1;
        private const цел ID_FileExit       = 2;

        // Справка меню IDs
        private const цел ID_HelpAbout      = 3;

        // String to hold the directory we're browsing
        private ткст m_directory = "";

        // The рисунок list
        private ImageList m_list;

        // The рисунок viewer
        private ImageViewer m_viewer;

        /**
         * The base class is passed the title of the frame, the default 
         * position for its position, and an arbitrary size.
         *
         * All the components inside the frame are created and initialized 
         * here.
         */
        public this()
        {
            super("ImageView", wxDefaultPosition, Размер(500, 500));
            // The меню bar is the bar where all the menus will be attached 
            // to.
            MenuBar menuBar = new MenuBar();

            // The File меню
            Меню fileMenu = new Меню();

            // The first элемент we append is the "Открой" command.  The ИД for 
            // the меню элемент is passed, as cast(two)well strings.
            //
            // The first ткст is the меню элемент текст.  The stuff after '\t'
            // tells wxWidgets to use cast(a)this short-cut key for the элемент.
            // An '&' will underline the next character on the меню, for 
            // easy access.
            //
            // The second ткст is the справка текст for the меню элемент.  When a
            // users mouse hovers over the элемент, the status bar текст will
            // change to this.
            fileMenu.Append(ID_FileOpenDir, "&Открой Directory...\tCtrl+O",
                            "Открой a directory with images");

            // Append a меню seperator.
            fileMenu.AppendSeparator();

            // Exit меню элемент.
            fileMenu.Append(ID_FileExit, "E&xit\tCtrl+Shift+W", 
                            "Exit this fine application");

            // Attach the file меню to the меню bar
            menuBar.Append(fileMenu, "&File");

            // The Справка меню
            Меню helpMenu = new Меню();

            helpMenu.Append(ID_HelpAbout, "&About...",
                            "About this application");

            menuBar.Append(helpMenu, "&Справка");

            // Next we tell the frame to use the меню bar that we've created, 
            // using the Фрейм.MenuBar property.
            this.menuBar = menuBar;

            // Create a status bar with 2 fields
            CreateStatusBar(2);

            // Установи the initial status bar текст, this will set the текст in the 
            // first status bar field.
            StatusText = "Welcome to ImageView!";

            // The splitter окно allows two child windows to be displayed
            // with a bar between them.
            //
            // When there is only one child in a Фрейм, the child will fill
            // that frame, hence we don't need a sizer in this frame.
            SplitterWindow split = new SplitterWindow(this, -1);

            // Create the рисунок viewing control
            m_viewer = new ImageViewer(split);

            // Create our рисунок list
            m_list = new ImageList(split, m_viewer);

            // We now split the окно with the two children
            split.SplitVertically(m_list, m_viewer, 150);

            // Установи some event handlers using the IDs of the controls we 
            // wish to handle events for.
            EVT_MENU(ID_FileExit,           &OnFileExit);
            EVT_MENU(ID_FileOpenDir,        &OnFileOpenDir);

            EVT_MENU(ID_HelpAbout,          &OnHelpAbout);

            // Handle when the frame is closed
            EVT_CLOSE(&OnClose);
        }

        /**
         * Exit event handler
         */
        protected проц OnFileExit(Объект sender, Событие evt)
        {
            // Закрой the frame.  Since this is the last (only) frame in the
            // application, the application will exit when it is closed.

            Закрой();
        }

	static ткст[] GetFiles(ткст путь,ткст ext)
	{
		ткст[] result;
	
		//note: buggy
		бул listing(сим[] фимя)
		{
			if (std.string.find(фимя,ext)>=0)
				result ~= фимя;
			return да;
		}
		
		std.file.listdir(путь,&listing);
		return result;
	}

        /**
         * Открой Directory event handler
         */
        protected проц OnFileOpenDir(Объект sender, Событие evt)
        {
            DirДиалог dlg = new DirДиалог(this, "Choose an рисунок directory",
                                          m_directory);

            if (dlg.ShowModal() == Диалог.wxID_OK) {
                m_directory = dlg.Путь;

                // List the images. GetFiles is not very powerful: it is
				// limited to a DOS-like wildcard match. So in our case 
				// this is case sensitive on UN*X.
                ткст[] files = GetFiles(m_directory, ".jpg");
                m_list.ListImages(files);

                Title = dlg.Путь;
            }
        }

        /**
         * About event handler
         */
        protected проц OnHelpAbout(Объект sender, Событие evt)
        {
            // Message for our about dialog.
            ткст msg = "ImageView!\n\nAn application for viewing images.";

            // Display a message box.  The message box will have an OK button
            // (wxOK), and an information иконка (wxICON_INFORMATION)
            MessageBoxl(this, msg, "About ImageView", 
                                    Диалог.wxOK | Диалог.wxICON_INFORMATION);
        }

        protected проц OnClose(Объект sender, Событие evt)
        {
            // We can ask the user whether or not it is OK to close the frame,
            // then act appropriately.

            ткст msg = "Are you sure you'd like to exit?";

            цел result = MessageBox(this, msg, "Exit ImageView",
                                                 Диалог.wxYES_NO |
                                                 Диалог.wxICON_QUESTION);

            // Did the user click yes?
            if (result == Диалог.wxYES) {
                // They did, we tell wxWidgets to take care of closing the
                // application
                evt.Пропусти();
            }
        }

        /**
         * Override the base Title, since we want to add some more intelligent
         * behaviour.
         */
        public override проц Title(ткст значение)
        {
                ткст title = "ImageView";

                if (значение != "")
                    title ~= " (" ~ значение + ")";

                super.Title = title;
        }
    }


проц main()
{
	ImageViewApp.Main();
}
