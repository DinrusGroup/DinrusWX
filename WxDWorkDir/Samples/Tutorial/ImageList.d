
import wx.wx;

    /**
     * Class to display a list of images.  The scrolled окно helps us with
     * managing scrollbars when the окно's contents are too large to be
     * displayed.
     */
    public class ImageList : ScrolledWindow
    {
        private ImageViewer m_viewer;

        /**
         * Sets up the рисунок list.
         *
         * The base class is initialized with a default окно position,
         * and a static size of ширина = 150, The '-1' for высота means that
         * the высота of the окно is unconstrained.
         */
        public this(Окно родитель, ImageViewer viewer)
        {
            super(родитель, -1, wxDefaultPosition, Размер(140, -1));
            m_viewer = viewer;

            // A flex grid sizer will be used to align the images горизонтально.
            // This is used, because the flex grid allows for entries to be
            // of various sizes.
            FlexGridSizer sizer = new FlexGridSizer(1, 0, 0);

            // For now, our sizer will remain empty until images are loaded.

            Sizer = sizer;

            // Инициализуй the scrollbars
            SetScrollbars(0, 1, 0, 0);
        }

        /**
         * Lists the images in the given list of рисунок file names.
         */
        public проц ListImages(ткст[] images)
        {
            // Очисть our list
            ClearImages();

            // Добавь the images
		    Console.WriteLine("Adding images ...");
            foreach(ткст imageFile in images) {

				Console.WriteLine("   + " ~ imageFile);
                // Create a thumbnail will display the рисунок
                Thumbnail thumb = new Thumbnail(this, imageFile);
                
                // Hook in our event handler
                thumb.ThumbnailClicked = 
                    new Thumbnail.ThumbnailClick(OnThumbnailClicked);

                // Добавь the битмап button to the sizer.
                Sizer.Добавь(thumb, 1, Stretch.wxEXPAND);

                // A horizontal static line is used to справка seperate the 
                // images in the list.
                StaticLine line = new StaticLine(this, -1, wxDefaultPosition, 
                                                 wxDefaultSize, 
                                                 StaticLine.wxLI_HORIZONTAL);

                // The static line is added with a small border on the bottom
                Sizer.Добавь(line, 0, Stretch.wxEXPAND | Direction.wxBOTTOM, 3);

                // Fit inside tells the scrolled окно to reset the scrollbars,
                // so that the entire окно's contents can be scrolled.
                FitInside();
            }

            m_viewer.Битмап = пусто;
        }

        /**
         * Очисть all the images in the list.
         */
        private проц ClearImages()
        {
            // This will remove all the windows (images) that are in the sizer.
            // 
            // The 'да' parameter tells the sizer to delete the windows as
            // well.  If 'нет' were given, we would have to manually do 
            // this.
            Sizer.Очисть(да);

            System.GC.Collect();
        }

        public проц OnThumbnailClicked(ткст fileName, Битмап bmp)
        {
            m_viewer.Битмап = bmp;

            // Установи the main frame's title
            Parent.Parent.Title = fileName;
        }
    }
