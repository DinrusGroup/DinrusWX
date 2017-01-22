//-----------------------------------------------------------------------------
// wxD/Samples - Printing.d
//
// A wxD version of the wxWidgets "printing" sample.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Printing.d,v 1.10 2008/04/24 07:24:52 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	public class MyFrame : Frame
	{
		enum Cmd { Print, PrintSetup, PageSetup, PrintPreview, About, Quit }

        private MyCanvas m_canvas;
        private Шрифт m_testFont;

        private PrintData m_printData;
        private PageSetupDialogData m_pageSetupData;

		public this(ткст title, Точка поз, Размер size)
		{
			super(title, поз, size);
            // Setup our canvas

            m_canvas = new MyCanvas(this);

            // Setup the меню

            MenuBar menuBar = new MenuBar();

            Меню fileMenu = new Меню();
            fileMenu.Append(Cmd.Print, "&Print...\tCtrl+P", 
                            "Print the canvas");
            fileMenu.Append(Cmd.PrintSetup, "Pr&цел Setup...", 
                            "Setup printer properties");
            fileMenu.Append(Cmd.PageSetup, "P&age Setup...",
                            "Page properties");
            fileMenu.Append(Cmd.PrintPreview, "Print P&review...",
                            "Preview the printer output");
            fileMenu.AppendSeparator();
            fileMenu.Append(Cmd.Quit, "E&xit\tCtrl+Shift+W", 
                            "Exit the printer demo");
            menuBar.Append(fileMenu, "&File");

            Меню helpMenu = new Меню();
            helpMenu.Append(Cmd.About, "About...",
                            "About this application");
            menuBar.Append(helpMenu, "&Справка");

            this.menuBar = menuBar;

            EVT_MENU(Cmd.Print,        &OnPrint);
            EVT_MENU(Cmd.PrintSetup,   &OnPrintSetup);
            EVT_MENU(Cmd.PageSetup,    &OnPageSetup);
            EVT_MENU(Cmd.PrintPreview, &OnPrintPreview);
            EVT_MENU(Cmd.Quit,         &OnQuit);
            EVT_MENU(Cmd.About,        &OnAbout);

            // Misc initialization 

            m_printData     = new PrintData();
            m_pageSetupData = new PageSetupDialogData();

            иконка = new Icon("../Samples/Printing/mondrian.png");

            CreateStatusBar(2);
            StatusText = "Welcome to the Printing Demo!";

            Centre();
        }

		public проц OnPrint(Объект sender, Событие e)
        {
            PrintDialogData printDialogData = new PrintDialogData(m_printData);
            Printer printer = new Printer(printDialogData);

            MyPrintout printout = new MyPrintout("My printout");

            if (!printer.Print(this, printout, да)) {
                if (printer.LastError == PrinterError.wxPRINTER_ERROR) {
                    MessageBox(
                            "There was a problem printing.\n" 
                            "Perhaps your current printer is not set correctly?",
                            "Printing", Dialog.wxOK
                        );
                }
                else {
                    MessageBox("You cancelled printing", 
                                            "Printing", Dialog.wxOK);
                }
            }
            else {
                m_printData = printer.printDialogData.printData;
            }
        }

		public проц OnPrintSetup(Объект sender, Событие e)
        {
            PrintDialog printerDialog = new PrintDialog(this, m_printData);

            printerDialog.printDialogData.SetupDialog = да;
            printerDialog.ShowModal();

            m_printData = printerDialog.printDialogData.printData;
        }

		public проц OnPageSetup(Объект sender, Событие e)
        {
            m_pageSetupData = new PageSetupDialogData(m_printData);

            PageSetupDialog pageSetupDialog = 
                new PageSetupDialog(this, m_pageSetupData);
            pageSetupDialog.ShowModal();

            m_printData = pageSetupDialog.PageSetupData.printData;
            m_pageSetupData = pageSetupDialog.PageSetupData;
        }

		public проц OnPrintPreview(Объект sender, Событие e)
        {
            // Pass two printout Objects: for preview, and possible printing.
            PrintDialogData printDialogData = new PrintDialogData(m_printData);

            PrintPreview preview = 
                new PrintPreview(new MyPrintout(""), new MyPrintout(""), 
                                 printDialogData);

            if (!preview.Ок)
            {
                MessageBox(
                        "There was a problem previewing.\n" ~ 
                        "Perhaps your current printer is not set correctly?",
                        "Previewing", Dialog.wxOK
                    );
                return;
            }

            PreviewFrame frame = 
                new PreviewFrame(preview, this, "Demo Print Preview", 
                                 Точка(100, 100), Размер(600, 650));

            frame.Centre();
            frame.Инициализуй();
            frame.Show(да);
        }

		public проц OnQuit(Объект sender, Событие e)
		{
			Закрой();
		}

		public проц OnAbout(Объект sender, Событие e)
		{
			ткст msg = "wxD printing demo\n" 
                         "Written by Bryan Bulten\n\n" 
                         "Ported from the wxWidgets Printing \n" 
                         "Demo by BERO ";

			MessageBox(this, msg, "About wxD Printing Demo", 
                                       Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

        public static проц Draw(DC dc)
        {
            dc.Фон = new Кисть("White");
            dc.Очисть();
            // TODO dc.Шрифт = m_testFont);

            dc.ФоновыйРежим = СтильЗаливки.wxTRANSPARENT;

            dc.кисть = new Кисть("Cyan");
            dc.перо = new Перо("Красный");

            dc.РисуйПрям(0, 30, 200, 100);
            dc.РисуйТекст("Прямоугольник 200 by 100", 40, 40);
            dc.РисуйЭллипс(50, 140, 100, 50);
            dc.РисуйТекст("Test message: this is in 10 point текст", 10, 180);

            ткст test = "Greek -- " ~
                          "Hebrew -- " ~
                          "Japanese ()";
            dc.РисуйТекст(test, 10, 200); 

            dc.перо = new Перо("Black");
            dc.РисуйЛинию(0, 0, 200, 200);
            dc.РисуйЛинию(200, 0, 0, 200);

            // TODO
            //Icon my_icon = new Icon("../Samples/Printing/mondrian.png");
            //dc.DrawIcon(my_icon, 100, 100);
        }
	}

    public class MyCanvas : ScrolledWindow
    {
        public this(Frame frame)
        { 
            super(frame) ;
            ЦветЗП = new Цвет("White");
        }

        public override проц OnDraw(DC dc)
        {
            MyFrame.Draw(dc);
        }
    }

    public class MyPrintout : Printout
    {
        public this(ткст title)

            { super(title); }
        public override бул OnPrintPage(цел page)
        {
            DC dc = this.Dc;
            if (dc) {
                if (page == 1)
                    DrawPageOne(dc);
                else 
                    DrawPageTwo(dc);

                // TODO
                //dc.SetDeviceOrigin(0, 0);
                //dc.SetUserScale(1.0, 1.0);

                return да;
            }

            return нет;
        }

        public override бул HasPage(цел page)
        {
            return (page == 1 || page == 2);
        }

        public override проц GetPageInfo(inout цел minPage, inout цел maxPage, 
                                         inout цел selPageFrom, 
                                         inout цел selPageTo)
        {
            minPage = 1; maxPage = 2;
            selPageFrom = 1; selPageTo = 2;
        }

        private проц DrawPageOne(DC dc)
        {
            // TODO: Масштабируй graphics here 
            
            MyFrame.Draw(dc);
        }

        private проц DrawPageTwo(DC dc)
        {
            // TODO: Draw something different here
        }
    }

	public class MyApp : Прил
	{
		public override бул ПриИниц()
		{
			MyFrame frame = new MyFrame("wxD Printing Demo", 
                                        Точка(50,50), Размер(450,340));
			frame.Show(да);

			return да;
		}

		
		static проц Main()
		{
			MyApp прил = new MyApp();
			прил.Пуск();
		}
	}


проц main()
{
	MyApp.Main();
}
