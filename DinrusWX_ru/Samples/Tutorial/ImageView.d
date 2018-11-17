
import wx.wx;
import ImageViewer;

    /**
     * This is the application.
     */
    public class ImageViewApp : Апп
    {
        /**
         * The overrided ПоИниц is where the main form should be created and
         * shown.  Application start-up logic can also be placed here.
         */
        public override бул ПоИниц()
        {
            // Создай the main frame
            ImageViewFrame frame = new ImageViewFrame();

            // Покажи it
            frame.Покажи(да);

            // Return да, to indicate that everything was initialized 
            // properly.
            return да;
        }

        
        public static проц Main()
        {
            // Создай an instance of our application class
            ImageViewApp app = new ImageViewApp();

            // Пуск the application
            app.Пуск();
        }
    }

    /**
     * This is the main frame.  All user interaction will start here.
     */
    public class ImageViewFrame : Frame
    {
        // Every control that we want to handle events for will need an 
        // integer ИД, these IDs are listed below.

        // File меню IDs
        private const цел ID_FileOpenDir    = 1;
        private const цел ID_FileExit       = 2;

        // Help меню IDs
        private const цел ID_HelpAbout      = 3;

        // String to hold the directory we're browsing
        private ткст m_directory = "";

        // The рисунок list
        private ImageList m_list;

        // The рисунок viewer
        private ImageViewer m_viewer;

        /**
         * The base class is passed the title of the frame, the default 
         * position for its position, and an arbitrary Размер.
         *
         * All the components inside the frame are created and initialized 
         * here.
         */
        public this()
        {
            super("ImageView", вхДефПоз, Размер(500, 500));
            // The меню bar is the bar where all the menus will be attached 
            // to.
            MenuBar menuBar = new MenuBar();

            // The File меню
            Меню fileMenu = new Меню();

            // The first элт we append is the "Open" command.  The ИД for 
            // the меню элт is passed, as cast(two)well strings.
            //
            // The first ткст is the меню элт текст.  The stuff after '\t'
            // tells wxWidgets to use cast(a)this short-cut key for the элт.
            // An '&' will underline the next character on the меню, for 
            // easy access.
            //
            // The second ткст is the help текст for the меню элт.  When a
            // users mouse hovers over the элт, the status bar текст will
            // change to this.
            fileMenu.Append(ID_FileOpenDir, "&Open Directory...\tCtrl+O",
                            "Open a directory with images");

            // Append a меню seperator.
            fileMenu.AppendSeparator();

            // Exit меню элт.
            fileMenu.Append(ID_FileExit, "E&xit\tCtrl+Shift+W", 
                            "Exit this fine application");

            // Attach the file меню to the меню bar
            menuBar.Append(fileMenu, "&File");

            // The Help меню
            Меню helpMenu = new Меню();

            helpMenu.Append(ID_HelpAbout, "&About...",
                            "About this application");

            menuBar.Append(helpMenu, "&Help");

            // Next we tell the frame to use the меню bar that we've created, 
            // using the Frame.MenuBar property.
            this.menuBar = menuBar;

            // Создай a status bar with 2 fields
            CreateStatusBar(2);

            // Уст the initial status bar текст, this will set the текст in the 
            // first status bar field.
            StatusText = "Welcome to ImageView!";

            // The splitter окно allows two child windows to be displayed
            // with a bar between them.
            //
            // When there is only one child in a Frame, the child will fill
            // that frame, hence we don't need a сайзер in this frame.
            SplitterWindow split = new SplitterWindow(this, -1);

            // Создай the рисунок viewing control
            m_viewer = new ImageViewer(split);

            // Создай our рисунок list
            m_list = new ImageList(split, m_viewer);

            // We now split the окно with the two children
            split.SplitVertically(m_list, m_viewer, 150);

            // Уст some event handlers using the IDs of the controls we 
            // wish to handle events for.
            EVT_MENU(ID_FileExit,           &OnFileExit);
            EVT_MENU(ID_FileOpenDir,        &OnFileOpenDir);

            EVT_MENU(ID_HelpAbout,          &OnHelpAbout);

            // Handle when the frame is closed
            EVT_CLOSE(&OnClose);
        }

        /**
         * Exit event обработчик
         */
        protected проц OnFileExit(Объект отправитель, Событие evt)
        {
            // Закрой the frame.  Since this is the last (only) frame in the
            // application, the application will exit when it is closed.

            Закрой();
        }

	static ткст[] GetFiles(ткст path,ткст ext)
	{
		ткст[] result;
	
		//note: buggy
		бул listing(char[] filename)
		{
			if (std.ткст.find(filename,ext)>=0)
				result ~= filename;
			return да;
		}
		
		std.file.listdir(path,&listing);
		return result;
	}

        /**
         * Open Directory event обработчик
         */
        protected проц OnFileOpenDir(Объект отправитель, Событие evt)
        {
            DirDialog dlg = new DirDialog(this, "Choose an рисунок directory",
                                          m_directory);

            if (dlg.ShowModal() == Dialog.wxID_OK) {
                m_directory = dlg.Path;

                // List the images. GetFiles is not very powerful: it is
				// limited to a DOS-like wildcard match. So in our case 
				// this is case sensitive on UN*X.
                ткст[] files = GetFiles(m_directory, ".jpg");
                m_list.ListImages(files);

                Титул = dlg.Path;
            }
        }

        /**
         * About event обработчик
         */
        protected проц OnHelpAbout(Объект отправитель, Событие evt)
        {
            // Message for our about dialog.
            ткст msg = "ImageView!\n\nAn application for viewing images.";

            // Display a message box.  The message box will have an OK button
            // (wxOK), and an information пиктограмма (wxICON_INFORMATION)
            MessageBoxl(this, msg, "About ImageView", 
                                    Dialog.wxOK | Dialog.wxICON_INFORMATION);
        }

        protected проц OnClose(Объект отправитель, Событие evt)
        {
            // We can ask the user whether or not it is OK to close the frame,
            // then act appropriately.

            ткст msg = "Are you sure you'd like to exit?";

            цел result = MessageBox(this, msg, "Exit ImageView",
                                                 Dialog.wxYES_NO |
                                                 Dialog.wxICON_QUESTION);

            // Did the user click yes?
            if (result == Dialog.wxYES) {
                // They did, we tell wxWidgets to take care of closing the
                // application
                evt.Skip();
            }
        }

        /**
         * Override the base Титул, since we want to add some more intelligent
         * behaviour.
         */
        public override проц Титул(ткст значение)
        {
                ткст title = "ImageView";

                if (значение != "")
                    title ~= " (" ~ значение + ")";

                super.Титул = title;
        }
    }


проц main()
{
	ImageViewApp.Main();
}
