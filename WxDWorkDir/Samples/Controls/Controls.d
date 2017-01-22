//-----------------------------------------------------------------------------
// D/Samples - Controls.d
//
// A D version of the wxWidgets "controls" sample.
//
// TODO: update to use sizers more (this is a straight port of the wxWidgets
// original, which also used absolute positioning in many places for unknown
// reasons). [t9mike]
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Controls.d,v 1.11 2009/01/13 10:13:35 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
//pragma(lib, "wxd.lib");
//pragma(lib, "wxc.lib");
version (Tango)
{
import tango.core.Version;
private import tango.текст.convert.Integer;
static if (Tango.Major == 0 && Tango.Minor < 994)
alias tango.текст.convert.Integer.toUtf8 toString;
else
alias tango.текст.convert.Integer.toString toString;
private import tango.io.Console;
проц PRINT(ткст s) { Cout(s).newline; }
}
else // Phobos
{
private import std.ткст;
private import std.stdio;
alias writefln PRINT;
}

    //-------------------------------------------------------------------------
    // Application entry class

    public class Controls : Прил
    {
        public override бул ПриИниц()
        {
            // TODO: Добавь command line processing for окно position

            MyFrame frame = new MyFrame("Controls wxWidgets Прил",
                                        Точка(50,50), Размер(500,430));
            frame.Show(да);
            return да;
        }

        //---------------------------------------------------------------------

        
        static проц Main()
        {
            Controls прил = new Controls();
            прил.Пуск();
        }
    }

    //-------------------------------------------------------------------------
    // Main application frame

    public class MyFrame : Frame
    {
        public const цел ID_ABOUT       = 100;
        public const цел ID_EXIT        = 101;
        public const цел ID_CLEAR_LOG   = 102;
        public const цел ID_SET_DELAY   = 103;
        public const цел ID_TOGGLE_TIPS = 104;
        public const цел ID_DISABLE_ALL = 105;

        //---------------------------------------------------------------------

        private MyPanel panel;
        private static бул tipsEnabled = да;
        private static цел tipDelay = 5000;
                private static бул panelEnabled = да;

        //---------------------------------------------------------------------

        public this(ткст title, Точка поз, Размер size)
        {
            super(title, поз, size);
            // Установи the окно иконка
            иконка = new Icon("../Samples/Controls/mondrian.png");

            // Create the main panel
            panel = new MyPanel(this, 10, 10, 300, 100);

            // Установи up a меню
            Меню fileMenu = new Меню();
            fileMenu.Append(ID_CLEAR_LOG, "&Очисть Log\tCtrl+L",
                            "Очисть the log окно");
            fileMenu.AppendSeparator();
            fileMenu.Append(ID_ABOUT, "&About\tF1", "About this application");
            fileMenu.AppendSeparator();
            fileMenu.Append(ID_EXIT, "E&xit\tAlt+X", "Exit this program");

            Меню tooltipMenu = new Меню();
            tooltipMenu.Append(ID_SET_DELAY, "&Установи Delay..\tCtrl+D",
                               "Установи tooltip delay");
            tooltipMenu.AppendSeparator();
            tooltipMenu.Append(ID_TOGGLE_TIPS, "&Toggle Tooltips\tCtrl+T",
                               "Enable/Disable tooltips",
                               ItemKind.wxITEM_CHECK);
            tooltipMenu.Check(ID_TOGGLE_TIPS, tipsEnabled);

            Меню panelMenu = new Меню();
            panelMenu.Append(ID_DISABLE_ALL,
                             "&Disable All\tCtrl+E",
                             "Enable/Disable all panel controls",
                             ItemKind.wxITEM_CHECK);

            MenuBar menuBar = new MenuBar();
            menuBar.Append(fileMenu, "&File");
            menuBar.Append(tooltipMenu, "&Tooltips");
            menuBar.Append(panelMenu, "&Panel");

            this.menuBar = menuBar;

            // Установи up the event table for the меню
            EVT_MENU(ID_CLEAR_LOG,      &OnClearLog);
            EVT_MENU(ID_ABOUT,          &OnAbout);
            EVT_MENU(ID_EXIT,           &OnQuit);
            EVT_MENU(ID_SET_DELAY,      &OnSetTooltipDelay);
            EVT_MENU(ID_TOGGLE_TIPS,    &OnToggleTooltips);
            EVT_MENU(ID_DISABLE_ALL,    &OnDisableAll);

            // Установи up a status bar
            CreateStatusBar(2);
            StatusText = "";
        }

        //---------------------------------------------------------------------

        public проц OnClearLog(Объект sender, Событие e)
        {
            panel.текст.Очисть();
        }

        //---------------------------------------------------------------------

        public проц OnAbout(Объект sender, Событие e)
        {
            ткст msg = "This is the wxWidgets controls sample written in D.";
            MessageBox(this, msg, "About Controls",
                                       Dialog.wxOK);
        }

        //---------------------------------------------------------------------

        public проц OnQuit(Объект sender, Событие e)
        {
            Закрой(да);
        }

        //---------------------------------------------------------------------

        public проц OnSetTooltipDelay(Объект sender, Событие e)
        {
            цел input;
            input = GetNumberFromUser("Enter delay (in milliseconds)",
                                      "Установи tooltip delay", "ToolTip Delay",
                                      tipDelay, 0, 10000, this);

            if (input != -1) {
                tipDelay = input;
                ToolTip.Delay = tipDelay;
            }

            Log.LogStatus("Tooltip delay set to %d milliseconds", input);
        }

        //---------------------------------------------------------------------

        public проц OnToggleTooltips(Объект sender, Событие e)
        {
            tipsEnabled = !tipsEnabled;
            ToolTip.Enabled = tipsEnabled;

            Log.LogStatus("Tooltips {0}abled", tipsEnabled ? "en" : "dis" );
        }

        //---------------------------------------------------------------------

        public проц OnDisableAll(Объект sender, Событие e)
        {
            panelEnabled = !panelEnabled;
            panel.Enabled = panelEnabled;
        }
    }

    //-------------------------------------------------------------------------
    // Main content panel

    public class MyPanel : Panel
    {
        private const цел ID_NOTEBOOK         = 1;

        private const цел ID_LISTBOX          = 2;
        private const цел ID_LISTBOX_SORTED   = 3;
        private const цел ID_LISTBOX_SEL_NUM  = 4;
        private const цел ID_LISTBOX_SEL_STR  = 5;
        private const цел ID_LISTBOX_APPEND   = 6;
        private const цел ID_LISTBOX_DELETE   = 7;
        private const цел ID_LISTBOX_FONT     = 8;
        private const цел ID_LISTBOX_ENABLE   = 9;
        private const цел ID_LISTBOX_CLEAR    = 10;
        private const цел ID_LISTBOX_COLOUR   = 11;

        private const цел ID_CHOICE           = 20;
        private const цел ID_CHOICE_SORTED    = 21;
        private const цел ID_CHOICE_SEL_NUM   = 22;
        private const цел ID_CHOICE_SEL_STR   = 23;
        private const цел ID_CHOICE_APPEND    = 24;
        private const цел ID_CHOICE_DELETE    = 25;
        private const цел ID_CHOICE_FONT      = 26;
        private const цел ID_CHOICE_ENABLE    = 27;
        private const цел ID_CHOICE_CLEAR     = 28;

        private const цел ID_COMBO            = 40;
        private const цел ID_COMBO_SEL_NUM    = 41;
        private const цел ID_COMBO_SEL_STR    = 42;
        private const цел ID_COMBO_APPEND     = 43;
        private const цел ID_COMBO_DELETE     = 44;
        private const цел ID_COMBO_FONT       = 45;
        private const цел ID_COMBO_ENABLE     = 46;
        private const цел ID_COMBO_CLEAR      = 47;

        private const цел ID_RADIO            = 60;
        private const цел ID_RADIO_SEL_NUM    = 61;
        private const цел ID_RADIO_SEL_STR    = 62;
        private const цел ID_RADIO_FONT       = 63;
        private const цел ID_RADIO_ENABLE     = 64;
        private const цел ID_RADIO_BUTTON1    = 65;
        private const цел ID_RADIO_BUTTON2    = 66;

        private const цел ID_SLIDER           = 80;
        private const цел ID_SPINCTRL         = 81;
        private const цел ID_SPIN             = 82;
        private const цел ID_BTNPROGRESS      = 83;
		
		private const цел ID_BITMAP_BTN = 84;
		private const цел ID_BUTTON_LABEL = 85;
		
		private const цел ID_SIZER_CHECK1 = 90;
		private const цел ID_SIZER_CHECK2 = 91;
		private const цел ID_SIZER_CHECK3 = 92;
		private const цел ID_SIZER_CHECK4 = 93;
		private const цел ID_SIZER_CHECK14 = 94;
		private const цел ID_SIZER_CHECKBIG = 95;

        private const цел ID_SETFONT          = 100;

        enum Images { List = 0, Выбор, Combo, Текст, Radio, Gauge, Max }

        //---------------------------------------------------------------------

        private Notebook notebook;
        public  TextCtrl текст;

        // ListBox sample members
        private ListBox     listbox, listboxSorted;
        private Кнопка      selectNum, selectStr;
        private CheckBox    checkbox;
        private бул        oldColour;
        private RadioBox    radiobox;

        // Выбор sample members
        private Выбор choice, choiceSorted;

        // Combo sample members
        private ComboBox combo;

        // Gauge/Slider sample members
        private Gauge gauge, gaugeVert;
        private Slider slider;
        private SpinCtrl spinctrl;
        private SpinButton spinbutton;
        private TextCtrl spintext;
        private цел initialSpinValue;
        private Кнопка btnProgress;
		
		private Кнопка fontButton;
		
		private StaticText m_label;
		
		private BoxSizer m_buttonSizer;
		private Кнопка m_sizerBtn1;
		private Кнопка m_sizerBtn2;
		private Кнопка m_sizerBtn3;
		private Кнопка m_sizerBtn4;
		private BoxSizer m_hsizer;
		private Кнопка m_bigBtn;

        //---------------------------------------------------------------------

        public this(Frame frame, цел x, цел y, цел w, цел h)
        {
            super(frame, -1, Точка(x, y), Размер(w, h));
            ткст[] choices = [
                "This", "is", "one of my", "wonderful", "examples"
            ];

            ткст[] choices2 = [
                    "First", "Second"
            ];

            oldColour = нет;

            // Create the log текст view
            текст = new TextCtrl(this, -1, "This is the log окно.\n",
                                Точка(0, 250), Размер(100, 50),
                                TextCtrl.wxTE_MULTILINE);
            текст.ЦветЗП = new Цвет("wheat");

            Log.AddTraceMask("focus");
            Log.SetActiveTarget( текст ); 

            // Create the notebook
            notebook = new Notebook(this, ID_NOTEBOOK);

            // Create the рисунок list for the notebook
            ткст imgPath = "../Samples/Controls/Icons/";
            ImageList imagelist = new ImageList(16, 16, нет,
                                                Images.Max);

            imagelist.Добавь(new Битмап(imgPath ~ "list.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "choice.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "combo.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "текст.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "radio.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "gauge.xpm"));

            notebook.Images = imagelist;

            // Добавь some panels

            // wxListBox sample panel
            Panel panel = new Panel(notebook);
            notebook.AddPage(panel, "wxListBox", да, Images.List);

            listbox = new ListBox(panel, ID_LISTBOX,
                                  Точка(10, 10), Размер(120, 70),
                                  choices, ListBox.wxLB_ALWAYS_SB);
            listboxSorted = new ListBox(panel, ID_LISTBOX_SORTED,
                                        Точка(10, 90), Размер(120, 70),
                                        choices, ListBox.wxLB_SORT);

            // TODO: Добавь in ClientData

            listbox.toolTip = "This is a List Box.";
            listboxSorted.toolTip = "This is a sorted List Box.";

            selectNum = new Кнопка(panel, -1,
                                   "Select #&2", Точка(180, 30),
                                   Размер(150, -1));
            selectStr = new Кнопка(panel, ID_LISTBOX_SEL_STR,
                                   "&Select 'This'", Точка(340, 30),
                                   Размер(150, -1));

            new Кнопка(panel, ID_LISTBOX_CLEAR, "&Очисть",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(panel, ID_LISTBOX_APPEND, "&Append 'Hi!'",
                       Точка(340, 80), Размер(150, -1));
            new Кнопка(panel, ID_LISTBOX_DELETE,
                       "Delete selected элемент",
                       Точка(180, 130), Размер(150, -1));

            Кнопка button = new Кнопка(panel, ID_LISTBOX_FONT,
                                       "Установи &Italic шрифт",
                                       Точка(340, 130),
                                       Размер(150, -1));
            button.SetDefault();
            button.ЦветПП = new Цвет("синий");
            button.toolTip = "Click here to set Italic шрифт";

            checkbox = new CheckBox(panel, ID_LISTBOX_ENABLE,
                                    "&Disable", Точка(20, 170));
            checkbox.Value = нет;
            checkbox.toolTip = "Click to disable listbox";

            new CheckBox(panel, ID_LISTBOX_COLOUR,
                         "&Toggle colour", Точка(110, 170));

            panel.cursor = new Cursor(StockCursor.wxCURSOR_HAND);

            // wxChoice sample panel
            panel = new Panel(notebook);
            notebook.AddPage(panel, "wxChoice", нет, Images.Выбор);

            choice = new Выбор(panel, ID_CHOICE, Точка(10, 10),
                                Размер(120, -1), choices);
            choiceSorted = new Выбор(panel, ID_CHOICE_SORTED,
                                      Точка(10, 70), Размер(120, -1),
                                      choices, ComboBox.wxCB_SORT);

            // TODO: Добавь in client данные

            choice.Selection = 2;
            choice.ЦветЗП = new Цвет("красный");

            new Кнопка(panel, ID_CHOICE_SEL_NUM, "Select #&2",
                       Точка(180, 30), Размер(150, -1));
            new Кнопка(panel, ID_CHOICE_SEL_STR, "&Select 'This'",
                       Точка(340, 30), Размер(150, -1));
            new Кнопка(panel, ID_CHOICE_CLEAR, "&Очисть",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(panel, ID_CHOICE_APPEND, "&Append 'Hi!'",
                       Точка(340, 80), Размер(150, -1));
            new Кнопка(panel, ID_CHOICE_DELETE, "D&elete selected элемент",
                       Точка(180, 130), Размер(150, -1));
            new Кнопка(panel, ID_CHOICE_FONT, "Установи &Italic шрифт",
                       Точка(340, 130), Размер(150, -1));
            new CheckBox(panel, ID_CHOICE_ENABLE, "&Disable",
                         Точка(20, 130));

            // wxComboBox sample panel
            panel = new Panel(notebook);
            notebook.AddPage(panel, "wxComboBox", нет, Images.Combo);

            new StaticBox(panel, -1, "&Box around combobox",
                          Точка(5, 5), Размер(150, 100));
            combo = new ComboBox(panel, ID_COMBO, "This",
                                 Точка(20, 25), Размер(120, -1),
                                 choices);
            combo.toolTip = "This is a natural\ncombobox - unbelievable";

            new Кнопка(panel, ID_COMBO_SEL_NUM, "Select #&2",
                       Точка(180, 30), Размер(150, -1));
            new Кнопка(panel, ID_COMBO_SEL_STR, "&Select 'This'",
                       Точка(340, 30), Размер(150, -1));
            new Кнопка(panel, ID_COMBO_CLEAR, "&Очисть",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(panel, ID_COMBO_APPEND, "&Append 'Hi!'",
                       Точка(340, 80), Размер(150, -1));
            new Кнопка(panel, ID_COMBO_DELETE, "D&elete selected элемент",
                       Точка(180, 130), Размер(150, -1));
            new Кнопка(panel, ID_COMBO_FONT, "Установи &Italic шрифт",
                       Точка(340, 130), Размер(150, -1));
            new CheckBox(panel, ID_COMBO_ENABLE, "&Disable",
                         Точка(20, 130));

            // wxRadioBox sample panel
            panel = new Panel(notebook);
            notebook.AddPage(panel, "wxRadioBox", нет, Images.Radio);

                        new RadioBox(panel, ID_RADIO, "&That",
                         Точка(10, 160), wxDefaultSize, choices2, 1,
                         RadioBox.wxRA_SPECIFY_ROWS);
            radiobox = new RadioBox(panel, ID_RADIO,
                                    "T&his", Точка(10, 10),
                                    wxDefaultSize, choices, 1,
                                    RadioBox.wxRA_SPECIFY_COLS);
            radiobox.toolTip = "Ever seen a radiobox?";
            radiobox.ЦветПП = new Цвет("Красный");

            new Кнопка(panel, ID_RADIO_SEL_NUM, "Select #&2",
                       Точка(180, 30), Размер(150, -1));
            fontButton = new Кнопка(panel, ID_SETFONT, "Установи &more Italic шрифт",
                       Точка(340, 30), Размер(150, -1));
            new Кнопка(panel, ID_RADIO_SEL_STR, "&Select 'This'",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(panel, ID_RADIO_FONT, "Установи &Italic Шрифт",
                       Точка(340, 80), Размер(150, -1));
            new CheckBox(panel, ID_RADIO_ENABLE, "&Disable",
                         Точка(340, 130));

                        (new RadioButton(panel, ID_RADIO_BUTTON1, "Radiobutton1",
                                                        Точка(210, 170), wxDefaultSize,
                                                        RadioButton.wxRB_GROUP)).Value = нет;
                        new RadioButton(panel, ID_RADIO_BUTTON2, "Radiobutton2",
                                                        Точка(340, 170));

            // wxGauge sample panel
            panel = new Panel(notebook);
            notebook.AddPage(panel, "wxGauge", нет, Images.Gauge);

            new StaticBox(panel, -1, "&wxGauge and wxSlider", 
                          Точка(10, 10), Размер(222, 130));
            gauge = new Gauge(panel, -1, 200, 
                              Точка(18, 50), Размер(155, 30), 
                              Gauge.wxGA_HORIZONTAL | /*Border.*/wxNO_BORDER);
            gauge.ЦветЗП = new Цвет("Зелёный");
            gauge.ЦветПП = new Цвет("Красный");

            gaugeVert = new Gauge(panel, -1, 200, 
                                  Точка(195, 35), Размер(30, 90),
                                  Gauge.wxGA_VERTICAL | Gauge.wxGA_SMOOTH |
                                  /*Border.*/wxNO_BORDER);

            slider = new Slider(panel, ID_SLIDER, 0, 0, 200, 
                                Точка(18, 90), Размер(155, -1),
                                Slider.wxSL_AUTOTICKS | Slider.wxSL_LABELS);
            slider.SetTickFreq(40, 0);
            slider.toolTip = "This is a sliding slider!";

            new StaticBox(panel, -1, "&Explanation", Точка(230, 10),
                          Размер(270, 130), Alignment.wxALIGN_CENTER);
            new StaticText(panel, -1, 
                           "In order to see the gauge (aka progress \n" ~
                           "bar) control do something, drag the \n" ~
                           "handle of the slider to the right\n" ~
                           "\n" ~
                           "This is also supposed to demonstrate\n" ~
                           "how to use static controls.",
                           Точка(250, 25), Размер(240, 110));

            spinctrl = new SpinCtrl(panel, ID_SPINCTRL, "",
                                    Точка(200, 160), Размер(80, -1));
            spinctrl.SetRange(10, 30);
            spinctrl.Value = 15;

            initialSpinValue = -5;
            spintext = new TextCtrl(panel, -1, "" ~ .toString(initialSpinValue),
                                    Точка(20, 160), Размер(80, -1));
            spinbutton = new SpinButton(panel, ID_SPIN, 
                                        Точка(103, 160), Размер(80, -1));
            spinbutton.SetRange(-40, 30);
            spinbutton.Value = initialSpinValue;

            btnProgress = new Кнопка(panel, ID_BTNPROGRESS, 
                                     "&Show progress dialog",
                                     Точка(300, 160)); 
									 
			// wxBitmapXXX sampel panel
			panel = new Panel(notebook);
			notebook.AddPage(panel, "wxBitmapXXX", нет );
			
			Icon иконка = ArtProvider.GetIcon( ArtID.wxART_INFORMATION );
			new StaticBitmap( panel, -1, иконка, Точка(10, 10) );
			
			Битмап битмап = new Битмап( 100, 100 );
			MemoryDC dc = new MemoryDC();
			dc.SelectObject( битмап );
			dc.перо = Перо.wxGREEN_PEN;
			dc.Очисть();
			dc.РисуйЭллипс( 5, 5, 90, 90 );
			dc.РисуйТекст( "Битмап", 30, 40 );
			dc.SelectObject( Битмап.wxNullBitmap );
			
			new BitmapButton( panel, ID_BITMAP_BTN, битмап, Точка( 100, 20 ) );
			
			Битмап bmp1 = ArtProvider.GetBitmap( ArtID.wxART_INFORMATION );
			Битмап bmp2 = ArtProvider.GetBitmap( ArtID.wxART_WARNING );
			Битмап bmp3 = ArtProvider.GetBitmap( ArtID.wxART_QUESTION );
			
//			BitmapButton bmpBtn = new BitmapButton( panel, -1, bmp1, Точка( 30, 70 ) );
			
//			bmpBtn.BitmapSelected = bmp2;
//			bmpBtn.BitmapFocus = bmp3;
			
			new ToggleButton( panel, ID_BUTTON_LABEL, "&Toggle надпись", Точка( 250, 20 ) );
			
			m_label = new StaticText( panel, -1, "Label with some long текст", 
									Точка ( 250, 60 ), wxDefaultSize, Alignment.wxALIGN_RIGHT );
			m_label.ЦветПП = Цвет.wxBLUE;
			
			// wxSizer sampel panel
            panel = new Panel(notebook);
            notebook.AddPage(panel, "wxSizer", нет );
			panel.AutoLayout = да;	

			BoxSizer sizer = new BoxSizer( Ориентация.wxVERTICAL );
			StaticBoxSizer csizer = new StaticBoxSizer( new StaticBox( panel, -1, "Show Buttons" ), 
															Ориентация.wxHORIZONTAL );
														
			CheckBox check1 = new CheckBox( panel, ID_SIZER_CHECK1, "1" );
			check1.Value = да;
			csizer.Добавь( check1 );
			
			CheckBox check2 = new CheckBox( panel, ID_SIZER_CHECK2, "2" );
			check2.Value = да;
			csizer.Добавь( check2 );
			
			CheckBox check3 = new CheckBox( panel, ID_SIZER_CHECK3, "3" );
			check3.Value = да;
			csizer.Добавь( check3 );
			
			CheckBox check4 = new CheckBox( panel, ID_SIZER_CHECK4, "4" );
			check4.Value = да;
			csizer.Добавь( check4 );
			
			CheckBox check14 = new CheckBox( panel, ID_SIZER_CHECK14, "14" );
			check14.Value = да;
			csizer.Добавь( check14 );
			
			CheckBox checkBig = new CheckBox( panel, ID_SIZER_CHECKBIG, "Big" );
			checkBig.Value = да;
			csizer.Добавь( checkBig );
			
			sizer.Добавь( csizer );
			
			m_hsizer = new BoxSizer( Ориентация.wxHORIZONTAL );
			
			m_buttonSizer = new BoxSizer( Ориентация.wxVERTICAL );
			
			m_sizerBtn1 = new Кнопка( panel, -1, "Test Кнопка &1" );
			m_buttonSizer.Добавь( m_sizerBtn1, 0, Direction.wxALL, 10 );
			m_sizerBtn2 = new Кнопка( panel, -1, "Test Кнопка &2" );
			m_buttonSizer.Добавь( m_sizerBtn2, 0, Direction.wxALL, 10 );
			m_sizerBtn3 = new Кнопка( panel, -1, "Test Кнопка &3" );
			m_buttonSizer.Добавь( m_sizerBtn3, 0, Direction.wxALL, 10 );			
			m_sizerBtn4 = new Кнопка( panel, -1, "Test Кнопка &4" );
			m_buttonSizer.Добавь( m_sizerBtn4, 0, Direction.wxALL, 10 );	

			m_hsizer.Добавь( m_buttonSizer );
			m_hsizer.Добавь( new BoxSizer( Ориентация.wxHORIZONTAL ), 1, Stretch.wxEXPAND, 0 );
			
			m_bigBtn = new Кнопка( panel, -1, "Multiline\nbutton" );
			m_hsizer.Добавь( m_bigBtn, 3, Stretch.wxEXPAND | Direction.wxALL, 10 );
			
			sizer.Добавь( m_hsizer, 1, Stretch.wxEXPAND );
			
			panel.sizer = sizer;

            // Установи event listeners

            EVT_SIZE(&OnSize);

            EVT_LISTBOX     (ID_LISTBOX,            &OnListBox);
            EVT_LISTBOX     (ID_LISTBOX_SORTED,     &OnListBox);
            EVT_LISTBOX_DCLICK(-1,                  &OnListBoxDoubleClick);
	    selectNum.Click_Add(& OnListBoxButtons );
	    selectNum.Click_Add(& OnClicked2 );
	    EVT_BUTTON      (-1,/*ID_LISTBOX_SEL_NUM,*/    &OnListBoxButtons);
            //EVT_BUTTON      (ID_LISTBOX_SEL_STR,    &OnListBoxButtons);
	    selectStr.Click_Add(& OnListBoxButtons );
            EVT_BUTTON      (ID_LISTBOX_CLEAR,      &OnListBoxButtons);
            EVT_BUTTON      (ID_LISTBOX_APPEND,     &OnListBoxButtons);
            EVT_BUTTON      (ID_LISTBOX_DELETE,     &OnListBoxButtons);
            //EVT_BUTTON      (ID_LISTBOX_FONT,       &OnListBoxButtons);
	    button.Click_Add(& OnListBoxButtons );
            EVT_CHECKBOX    (ID_LISTBOX_ENABLE,     &OnListBoxButtons);
            EVT_CHECKBOX    (ID_LISTBOX_COLOUR,     &OnChangeColour);

            EVT_CHOICE      (ID_CHOICE,             &OnChoice);
            EVT_CHOICE      (ID_CHOICE_SORTED,      &OnChoice);
            EVT_BUTTON      (ID_CHOICE_SEL_NUM,     &OnChoiceButtons);
            EVT_BUTTON      (ID_CHOICE_SEL_STR,     &OnChoiceButtons);
            EVT_BUTTON      (ID_CHOICE_FONT,        &OnChoiceButtons);
            EVT_BUTTON      (ID_CHOICE_DELETE,      &OnChoiceButtons);
            EVT_BUTTON      (ID_CHOICE_APPEND,      &OnChoiceButtons);
            EVT_BUTTON      (ID_CHOICE_CLEAR,       &OnChoiceButtons);
            EVT_CHECKBOX    (ID_CHOICE_ENABLE,      &OnChoiceButtons);

            EVT_COMBOBOX    (ID_COMBO,              &OnCombo);
            EVT_TEXT        (ID_COMBO,              &OnComboTextChanged);
            EVT_TEXT_ENTER  (ID_COMBO,              &OnComboTextEnter);
            EVT_BUTTON      (ID_COMBO_SEL_NUM,      &OnComboButtons);
            EVT_BUTTON      (ID_COMBO_SEL_STR,      &OnComboButtons);
            EVT_BUTTON      (ID_COMBO_FONT,         &OnComboButtons);
            EVT_BUTTON      (ID_COMBO_DELETE,       &OnComboButtons);
            EVT_BUTTON      (ID_COMBO_APPEND,       &OnComboButtons);
            EVT_BUTTON      (ID_COMBO_CLEAR,        &OnComboButtons);
            EVT_CHECKBOX    (ID_COMBO_ENABLE,       &OnComboButtons);

            EVT_RADIOBOX    (ID_RADIO,              &OnRadio);
            EVT_BUTTON      (ID_RADIO_SEL_NUM,      &OnRadioButtons);
            EVT_BUTTON      (ID_RADIO_SEL_STR,      &OnRadioButtons);
            EVT_BUTTON      (ID_RADIO_FONT,         &OnRadioButtons);
            EVT_CHECKBOX    (ID_RADIO_ENABLE,       &OnRadioButtons);
            EVT_BUTTON      (ID_SETFONT,            &OnSetFont);

            EVT_SLIDER      (ID_SLIDER,             &OnSliderUpdate);
            EVT_SPINCTRL    (ID_SPINCTRL,           &OnSpinCtrl);
            EVT_SPIN_UP     (ID_SPINCTRL,           &OnSpinCtrlUp);
            EVT_SPIN_DOWN   (ID_SPINCTRL,           &OnSpinCtrlDown);
            EVT_TEXT        (ID_SPINCTRL,           &OnSpinCtrlText);
            EVT_SPIN        (ID_SPIN,               &OnSpinUpdate);
            EVT_SPIN_UP     (ID_SPIN,               &OnSpinUp);
            EVT_SPIN_DOWN   (ID_SPIN,               &OnSpinDown);
            EVT_UPDATE_UI   (ID_BTNPROGRESS,        &OnUpdateShowProgress);
            EVT_BUTTON      (ID_BTNPROGRESS,        &OnShowProgress);
			
			EVT_TOGGLEBUTTON(ID_BUTTON_LABEL,       &OnUpdateLabel);
			EVT_BUTTON(ID_BITMAP_BTN,               &OnBmpButton);
			
			EVT_CHECKBOX(ID_SIZER_CHECK1,           &OnSizerCheck);
			EVT_CHECKBOX(ID_SIZER_CHECK2,           &OnSizerCheck);
			EVT_CHECKBOX(ID_SIZER_CHECK3,           &OnSizerCheck);
			EVT_CHECKBOX(ID_SIZER_CHECK4,           &OnSizerCheck);
			EVT_CHECKBOX(ID_SIZER_CHECK14,          &OnSizerCheck);
			EVT_CHECKBOX(ID_SIZER_CHECKBIG,         &OnSizerCheck);
			
			EVT_NOTEBOOK_PAGE_CHANGING(ID_NOTEBOOK, &OnPageChanging);
			EVT_NOTEBOOK_PAGE_CHANGED(ID_NOTEBOOK,  &OnPageChanged);
        }
	
	public проц OnClicked2( Объект sender, Событие e )
	{
		PRINT( "OnClicked2");
	}

        //---------------------------------------------------------------------

        public проц OnSize(Объект sender, Событие e)
        {
            notebook.УстРазм(2, 2, ClientSize.Ширина - 4,
                             ClientSize.Высота * 2 / 3 - 4);
            текст.УстРазм(2, ClientSize.Высота * 2 / 3 + 2,
                         ClientSize.Ширина - 4, ClientSize.Высота / 3 - 4);
        }

        //---------------------------------------------------------------------

        public проц OnListBox(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;

            if (ce.ИД == -1)
            {
                текст.AppendText("ListBox has no selections anymore.\n");
                return;
            }

            ListBox lb =
                ce.ИД == ID_LISTBOX ? listbox : listboxSorted;
            текст.AppendText("ListBox event selection ткст is: '" ~
                            ce.String ~ "'\n" ~
                            "ListBox control selection ткст is: '" ~
                            lb.StringSelection ~ "'\n");
        }

        public проц OnListBoxDoubleClick(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            текст.AppendText("ListBox event selection ткст is: '" ~
                            ce.String ~ "'\n");
        }

        public проц OnListBoxButtons(Объект sender, Событие e)
        {
            switch(e.ИД)
            {
            case ID_LISTBOX_SEL_NUM:
	    	PRINT( "OnListBoxButtons");
                listbox.Selection = 2;
                listboxSorted.Selection = 2;
                break;

            case ID_LISTBOX_SEL_STR:
		if ( listbox.Счёт > 0 )
		{
			for ( цел i = 0; i < listbox.Счёт; i++ )
			{
				if ( listbox.GetString( i ) == "This" )
				{
					listbox.StringSelection = "This";
					listboxSorted.StringSelection = "This";
				}
			}
		}
                break;

            case ID_LISTBOX_DELETE:
                if (listbox.Selection != -1)
                    listbox.Delete(listbox.Selection);
                if (listboxSorted.Selection != -1)
                    listboxSorted.Delete(listboxSorted.Selection);
                break;

            case ID_LISTBOX_ENABLE:
                текст.AppendText("CheckBox clicked.\n");

                CommandEvent ce = cast(CommandEvent)e;

                CheckBox cb = cast(CheckBox)e.ОбъСоб;

                if (ce.Int == 1)
                    cb.toolTip = "Click to enable listbox";
                else
                    cb.toolTip = "Click to disable listbox";

                listbox.Enabled = (ce.Int == 0);
                listboxSorted.Enabled = (ce.Int == 0);
                selectStr.Enabled = (ce.Int == 0);
                selectNum.Enabled = (ce.Int == 0);
                break;

            case ID_LISTBOX_CLEAR:
                listbox.Очисть();
                listboxSorted.Очисть();
                break; 

            case ID_LISTBOX_APPEND:
                listbox.Append("Hi!");
                listboxSorted.Append("Hi!");
                break;

            case ID_LISTBOX_FONT:
                listbox.шрифт = Шрифт.wxITALIC_FONT;
                listboxSorted.шрифт = Шрифт.wxITALIC_FONT;
                break;
            }
        }

        //---------------------------------------------------------------------

        public проц OnChangeColour(Объект sender, Событие e)
        {
            if(oldColour)
            {
                ЦветЗП = new Цвет("красный");
                selectStr.ЦветПП = new Цвет("красный");
                selectStr.ЦветЗП = new Цвет("white");
                oldColour = нет;
            }
            else
            {
                ЦветЗП = new Цвет("white");
                selectStr.ЦветПП = new Цвет("white");
                selectStr.ЦветЗП = new Цвет("красный");
                oldColour = да;
            }
        }

        //---------------------------------------------------------------------

        public проц OnChoiceButtons(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;

            switch(ce.ИД)
            {
            case ID_CHOICE_SEL_NUM:
                choice.Selection = 2;
                choiceSorted.Selection = 2;
                break;

            case ID_CHOICE_SEL_STR:  
                choice.StringSelection = "This";
                choiceSorted.StringSelection = "This";
                break;

            case ID_CHOICE_CLEAR:
                choice.Очисть();
                choiceSorted.Очисть();
                break;

            case ID_CHOICE_APPEND:
                choice.Append("Hi!");
                choiceSorted.Append("Hi!");
                break;

            case ID_CHOICE_DELETE:
                if(choice.Selection != -1)
                    choice.Delete(choice.Selection);
                if(choiceSorted.Selection != -1)
                    choiceSorted.Delete(choiceSorted.Selection);
                break;

            case ID_CHOICE_FONT:
                choice.шрифт = Шрифт.wxITALIC_FONT;
                choiceSorted.шрифт = Шрифт.wxITALIC_FONT;
                break;

            case ID_CHOICE_ENABLE:
                choice.Enabled = (ce.Int == 0);  
                choiceSorted.Enabled = (ce.Int == 0);
                break;
            }
        }

        public проц OnChoice(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            Выбор c = e.ИД == ID_CHOICE ? choice : choiceSorted;

            текст.AppendText("Выбор event selection is: '" ~
                            ce.String ~ "'\n" ~
                            "Выбор control selection is: '" ~
                            c.StringSelection ~ "'\n");
        }

        //---------------------------------------------------------------------

        public проц OnComboButtons(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;

            switch(ce.ИД)
            {
            case ID_COMBO_SEL_NUM:
                combo.Selection = 2;
                break;

            case ID_COMBO_SEL_STR:
                combo.StringSelection = "This";
                break;

            case ID_COMBO_CLEAR:
                combo.Очисть();
                break;

            case ID_COMBO_APPEND:
                combo.Append("Hi!");
                break;

            case ID_COMBO_DELETE:
                if(combo.Selection != -1)
                    combo.Delete(combo.Selection);
                break;

            case ID_COMBO_FONT:
                combo.шрифт = Шрифт.wxITALIC_FONT;
                combo.шрифт = Шрифт.wxITALIC_FONT;
                break;

            case ID_COMBO_ENABLE:
                combo.Enabled = (ce.Int == 0);
                break;
            }
        }

        public проц OnCombo(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;

            текст.AppendText("Combo event selection is: '" ~
                            ce.String ~ "'\n" ~
                            "Combo control selection is: '" ~
                            combo.StringSelection ~ "'\n");
        }

        public проц OnComboTextChanged(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;

	    	PRINT( ce.String );

            Log.LogMessage( "Текст in the combobox changed: now is '{0}'", ce.String);
        }

        public проц OnComboTextEnter(Объект sender, Событие e)
        {
            Log.LogMessage("Enter pressed in the combobox: значение is: '{0}'", combo.Value);
        }

        //---------------------------------------------------------------------

        public проц OnRadio(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            текст.AppendText("Radio selection ткст is: '" ~
                            ce.String ~ "'.\n");
        }

        public проц OnRadioButtons(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;

            switch(ce.ИД)
            {
            case ID_RADIO_ENABLE:
                radiobox.Enabled = (ce.Int == 0);
                break;

            case ID_RADIO_SEL_NUM:
                radiobox.Selection = 2;
                break;

            case ID_RADIO_SEL_STR:
                radiobox.StringSelection = "This";
                break;

            case ID_RADIO_FONT:
                radiobox.ЦветПП = new Цвет("Зелёный");
                radiobox.шрифт = Шрифт.wxITALIC_FONT;
                break;
            }
        }

        //---------------------------------------------------------------------

        public проц OnSetFont(Объект sender, Событие e)
        {
			fontButton.шрифт = Шрифт.wxITALIC_FONT;
			текст.шрифт = Шрифт.wxITALIC_FONT;
        }
		
		public проц OnUpdateLabel(Объект sender, Событие e)
		{
			CommandEvent ce = cast(CommandEvent) e;
			m_label.Label = ce.Int == 0 ? "Very very very very very long текст." : "Shorter текст.";
		}
		
		public проц OnBmpButton(Объект sender, Событие e)
		{
			Log.LogMessage("Битмап button clicked.");
		}
		
		public проц OnSizerCheck(Объект sender, Событие e)
		{
			CommandEvent ce = cast(CommandEvent) e;
			switch( e.ИД )
			{
				case ID_SIZER_CHECK1:
					m_buttonSizer.Show( m_sizerBtn1, ce.IsChecked );
					m_buttonSizer.Layout();
				break;
				case ID_SIZER_CHECK2:
    				m_buttonSizer.Show ( m_sizerBtn2, ce.IsChecked );
    				m_buttonSizer.Layout ();
    			break;		
 				case ID_SIZER_CHECK3:
    				m_buttonSizer.Show ( m_sizerBtn3, ce.IsChecked );
    				m_buttonSizer.Layout();
    			break;	
  				case ID_SIZER_CHECK4:
    				m_buttonSizer.Show ( m_sizerBtn4, ce.IsChecked );
    				m_buttonSizer.Layout();
    			break;	
				case ID_SIZER_CHECK14:
    				m_hsizer.Show ( m_buttonSizer, ce.IsChecked );
    				m_hsizer.Layout();
    			break;
  				case ID_SIZER_CHECKBIG:
    				m_hsizer.Show ( m_bigBtn, ce.IsChecked );
    				m_hsizer.Layout ();
    			break;				
			}
		}

        //---------------------------------------------------------------------
        
        public проц OnSliderUpdate(Объект sender, Событие e)
        {
            gauge.Value = slider.Value;
            gaugeVert.Value = slider.Value;
        }

        public проц OnSpinCtrl(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            текст.AppendText("SpinCtrl changed: now " ~ .toString(spinctrl.Value) ~ 
                            " (from event: " ~ .toString(ce.Int) ~ ")\n");
        }

        public проц OnSpinCtrlUp(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            текст.AppendText("SpinCtrl up: now " ~ .toString(spinctrl.Value) ~ 
                            " (from event: " ~ .toString(ce.Int) ~ ")\n");
        }

        public проц OnSpinCtrlDown(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            текст.AppendText("SpinCtrl down: now " ~ .toString(spinctrl.Value) ~ 
                            " (from event: " ~ .toString(ce.Int) ~ ")\n");
        }

        public проц OnSpinCtrlText(Объект sender, Событие e)
        {
            CommandEvent ce = cast(CommandEvent)e;
            текст.AppendText("SpinCtrl текст changed: now " ~ .toString(spinctrl.Value) ~ 
                            " (from event: " ~ ce.String ~ ")\n");
        } 

        public проц OnSpinUpdate(Объект sender, Событие e) 
        {
			SpinEvent se = cast(SpinEvent) e;
            spintext.Value = "" ~ .toString(se.Положение);

            текст.AppendText("Spin conntrol range: (" ~ .toString(spinbutton.Min) ~ ", " ~ 
					.toString(spinbutton.Max) ~ "), current = " ~ .toString(spinbutton.Value) ~ "\n");

        }

        public проц OnSpinUp(Объект sender, Событие e)
        {
			SpinEvent se = cast(SpinEvent) e;
            ткст str = "Spin button up: current = " ~ .toString(spinbutton.Value) ~ "\n";

            if (se.Положение > 17) {
                str ~= "Preventing spin button from going above 17.\n";

				se.Veto();
			}

			Log.LogMessage(str);
        }
        
        public проц OnSpinDown(Объект sender, Событие e)
        {
            SpinEvent se = cast(SpinEvent) e;
            ткст str = "Spin button down: current = " ~ .toString(spinbutton.Value) ~ "\n";

            if (se.Положение < -17) {
                str ~= "Preventing spin button from going below -17.\n";

				se.Veto();
            }

			Log.LogMessage(str);
        }

        public проц OnUpdateShowProgress(Объект sender, Событие e)
        {
            btnProgress.Enabled = spinbutton.Value > 0;
        }

        public проц OnShowProgress(Объект sender, Событие e)
        {
			цел max = spinbutton.Value;
			
			if ( max <= 0 )
			{
				Log.LogError("You must set positive range!");
				return;
			}
			
			ProgressDialog pd = new ProgressDialog("Progress dialog example",
													"An informative message",
													max,
													this,
													ProgressDialog.wxPD_CAN_ABORT |
													ProgressDialog.wxPD_AUTO_HIDE |
													ProgressDialog.wxPD_APP_MODAL |
													ProgressDialog.wxPD_ELAPSED_TIME |
													ProgressDialog.wxPD_ESTIMATED_TIME |
													ProgressDialog.wxPD_REMAINING_TIME );
													
			бул cont = да;
			for ( цел i = 0; i <= max; i++ )
			{
				wxSleep(1);
				if ( i == max )
				{
					cont = pd.Обнови(i, "That's all, folks!");
				}
				else if ( i == max / 2 )
				{
					cont = pd.Обнови(i, "Only a half left (very long message)!");
				}
				else
				{
					cont = pd.Обнови(i);
				}
				if ( !cont ) break;
			}
			
			if ( !cont )
			{
				текст.AppendText("Progress dialog aborted!\n");
				
				// use Dispose() or Show(нет) to close the ProgressDialog
				// otherwise the dialog won't get closed and the прил hangs
				//pd.Dispose();
				pd.Show(нет);
			}
			else
			{
				текст.AppendText("Countdown from " ~ .toString(max) ~ " finished.\n");
			}
        }
		
		public проц OnPageChanging(Объект sender, Событие e)
		{
			NotebookEvent ne = cast(NotebookEvent) e;
			цел selOld = ne.OldSelection;
			if ( selOld == 2 )
			{
				MessageDialog md = new MessageDialog(this, "This demonstrates how a program may prevent the\n" ~
									"page change from taking place - if you select\n" ~
									"[No] the current page will stay the third one\n",
									"Control sample", Dialog.wxNO_DEFAULT|Dialog.wxICON_QUESTION | Dialog.wxYES_NO);
				
				if ( md.ShowModal() != wxID_YES )
				{					
					ne.Veto();
					return;
				}	
			}
			
			текст.AppendText("Notebook selection is being changed from " ~ .toString(selOld) ~
							" to " ~  .toString(ne.Selection) ~
							" (current page from notebook is " ~
							.toString(notebook.Selection) ~ ")\n");
		}
		
		public проц OnPageChanged(Объект sender, Событие e)
		{
			NotebookEvent ne = cast(NotebookEvent) e;
			текст.AppendText("Notebook selection is now " ~ .toString(ne.Selection) ~
							" (from notebook: " ~ .toString(notebook.Selection) ~ ")\n");
		}

        //---------------------------------------------------------------------
    }


проц main()
{
	Controls.Main();
}
