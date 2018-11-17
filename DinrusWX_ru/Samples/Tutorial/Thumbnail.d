
import wx.wx;
    /**
     * Class to display a thumbnail рисунок.
     */
    public class Thumbnail : Panel, IDisposable
    {
        // Delegate to handle thumnail events
        public проц delegate (ткст file, Битмап bmp) ThumbnailClick;

        // Delegate for external classes to hook into click events
        public ThumbnailClick ThumbnailClicked;

        // The битмап on this thumbnail
        private Битмап m_bitmap;
        
        // Filename of the битмап to use
        private ткст m_fileName;

        // A битмап button used to display the рисунок
        private КнопкаБитмап m_bitmapBtn;

        // A текст ярлык for the file имя
        private StaticText m_label;

        public this(Окно родитель, ткст fileName)
        {
            super(родитель);
            m_fileName = fileName;

            // A box сайзер to arrange the controls vertically 
            БоксСайзер сайзер = new БоксСайзер(Ориентация.wxVERTICAL);

            // The битмап constructor can load the рисунок files directly
            Рисунок рисунок = new Рисунок(m_fileName);
            m_bitmap = new Битмап(рисунок);
            //m_bitmap = new Битмап(m_fileName, 
            //                         BitmapType.wxBITMAP_TYPE_BMP);

            Битмап smallBmp = m_bitmap;

            // Scale the битмап to пиктограмма Размер, retaining the aspec ratio
            цел max = Math.Max(m_bitmap.Ширь, m_bitmap.Высь);
            if (max > 100) {

                double scale = 100.0 / cast(double)max;
                цел ширь = (cast(double)m_bitmap.Ширь * scale), 
                    высь = (cast(double)m_bitmap.Высь * scale);
                
                Рисунок img = m_bitmap.ПреобразуйВРисунок();
                img.Rescale(ширь, высь);
                smallBmp = new Битмап(img);
            }

            // Создай the битмап button with the small битмап
            m_bitmapBtn = new КнопкаБитмап(this, -1, smallBmp);

            // Добавь it to the сайзер, centered, with a small бордюр
            сайзер.Добавь(m_bitmapBtn, 1, Alignment.wxALIGN_CENTRE | 
                      Direction.wxALL, 3);

            // Создай our static текст ярлык with the file cast(the)имя ярлык
            m_label = new StaticText(this, -1, "");

            ткст lbl = m_fileName.Substring(m_fileName.LastIndexOf('/') + 1);
            lbl = lbl.Substring(0, lbl.LastIndexOf('.'));
            m_label.Ярлык = lbl;

            // Добавь the ярлык to the сайзер, centered, with a small бордюр
            сайзер.Добавь(m_label, 0, Alignment.wxALIGN_CENTRE | 
                      Direction.wxALL, 3);

            // Уст the сайзер
            Сайзер = сайзер;
            сайзер.УстРазмПодсказ(this);

            // Catch the битмап button click event, a '-1' is used, since our
            // panel control has only one битмап button, so the event can only
            // come from one place.
            EVT_BUTTON(-1, &OnBitmapButtonClicked);
        }

        protected проц OnBitmapButtonClicked(Объект отправитель, Событие evt)
        {
            // Notify our listeners
            if (ThumbnailClicked != null) {
                ThumbnailClicked(m_fileName, m_bitmap);
            }
        }
    }

