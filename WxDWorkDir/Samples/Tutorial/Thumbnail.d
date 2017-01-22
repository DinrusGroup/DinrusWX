
import wx.wx;
    /**
     * Class to display a thumbnail рисунок.
     */
    public class Thumbnail : Panel, IDisposable
    {
        // Delegate to handle thumnail events
        public delegate проц ThumbnailClick(ткст file, Битмап bmp);

        // Delegate for external classes to hook into click events
        public ThumbnailClick ThumbnailClicked;

        // The битмап on this thumbnail
        private Битмап m_bitmap;
        
        // Filename of the битмап to use
        private ткст m_fileName;

        // A битмап button used to display the рисунок
        private BitmapButton m_bitmapBtn;

        // A текст надпись for the file имя
        private StaticText m_label;

        public this(Окно родитель, ткст fileName)
        {
            super(родитель);
            m_fileName = fileName;

            // A box sizer to arrange the controls vertically 
            BoxSizer sizer = new BoxSizer(Ориентация.wxVERTICAL);

            // The битмап constructor can load the рисунок files directly
            Рисунок рисунок = new Рисунок(m_fileName);
            m_bitmap = new Битмап(рисунок);
            //m_bitmap = new Битмап(m_fileName, 
            //                         ТипБитмапа.wxBITMAP_TYPE_BMP);

            Битмап smallBmp = m_bitmap;

            // Масштабируй the битмап to иконка size, retaining the aspec ratio
            цел max = Math.Max(m_bitmap.Ширина, m_bitmap.Высота);
            if (max > 100) {

                дво scale = 100.0 / (дво)max;
                цел ширина = ((дво)m_bitmap.Ширина * scale), 
                    высота = ((дво)m_bitmap.Высота * scale);
                
                Рисунок img = m_bitmap.ConvertToImage();
                img.Ремасштабируй(ширина, высота);
                smallBmp = new Битмап(img);
            }

            // Create the битмап button with the small битмап
            m_bitmapBtn = new BitmapButton(this, -1, smallBmp);

            // Добавь it to the sizer, centered, with a small border
            sizer.Добавь(m_bitmapBtn, 1, Alignment.wxALIGN_CENTRE | 
                      Direction.wxALL, 3);

            // Create our static текст надпись with the file cast(the)имя надпись
            m_label = new StaticText(this, -1, "");

            ткст lbl = m_fileName.Substring(m_fileName.LastIndexOf('/') + 1);
            lbl = lbl.Substring(0, lbl.LastIndexOf('.'));
            m_label.Label = lbl;

            // Добавь the надпись to the sizer, centered, with a small border
            sizer.Добавь(m_label, 0, Alignment.wxALIGN_CENTRE | 
                      Direction.wxALL, 3);

            // Установи the sizer
            Sizer = sizer;
            sizer.SetSizeHints(this);

            // Catch the битмап button click event, a '-1' is used, since our
            // panel control has only one битмап button, so the event can only
            // come from one place.
            EVT_BUTTON(-1, &OnBitmapButtonClicked);
        }

        protected проц OnBitmapButtonClicked(Объект sender, Событие evt)
        {
            // Notify our listeners
            if (ThumbnailClicked != пусто) {
                ThumbnailClicked(m_fileName, m_bitmap);
            }
        }
    }
}
