
import wx.wx;

    /**
     * A class to view an рисунок.
     *
     * A scrolled окно is used so that large images can be viewed.
     */
    public class ImageViewer : ScrolledWindow
    {
        private Битмап m_bitmap, m_defaultBmp;

        public this(Окно родитель)
        {
            super(родитель);
            // Load a default рисунок (logo)
            m_defaultBmp = new Битмап("../Samples/Tutorial/ImageView.bmp", 
                                         BitmapType.wxBITMAP_TYPE_BMP);

            // Our panel will have a white background, the цвет contructor
            // accepts strings for several common colours.
            ЦветФона = new Цвет("White");

            // Уст our битмап
            Битмап = m_defaultBmp;
        }

        /**
         * The битмап to be displayed.
         */
        public проц битмап(Битмап значение)
        {
                if (значение == null) {
                    // Use the default
                    m_bitmap = m_defaultBmp;
                }
                else {
                    m_bitmap = значение; 
                }

                // Инициализируй the scrollbars
                УстScrollbars(1, 1, m_bitmap.Ширь, m_bitmap.Высь,
                              0, 0, да);

                // Redraw the окно
                Освежи();
        }

        /**
         * Override the OnDraw method so we can draw the битмап.
         */
        public override проц OnDraw(DC dc)
        {
            // Draw the битмап onto the device context
            dc.DrawBitmap(m_bitmap, 0, 0 , false);
        }
    }

