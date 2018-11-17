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
		enum Cmd { Print, PrintУстup, PageУстup, PrintPreview, About, Quit }

        private MyCanvas m_canvas;
        private Шрифт m_testFont;

        private PrintData m_printData;
        private PageУстupDialogData m_pageУстupData;

		public this(ткст title, Точка поз, Размер Размер)
		{
			super(title, поз, Размер);
            // Устup our canvas

            m_canvas = new MyCanvas(this);

            // Устup the меню

            MenuBar menuBar = new MenuBar();

            Меню fileMenu = new Меню();
            fileMenu.Append(Cmd.Print, "&Print...\tCtrl+P", 
                            "Print the canvas");
            fileMenu.Append(Cmd.PrintУстup, "Pr&цел Устup...", 
                            "Устup printer properties");
            fileMenu.Append(Cmd.PageУстup, "P&age Устup...",
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
            menuBar.Append(helpMenu, "&Help");

            this.menuBar = menuBar;

            EVT_MENU(Cmd.Print,        &OnPrint);
            EVT_MENU(Cmd.PrintУстup,   &OnPrintУстup);
            EVT_MENU(Cmd.PageУстup,    &OnPageУстup);
            EVT_MENU(Cmd.PrintPreview, &OnPrintPreview);
            EVT_MENU(Cmd.Quit,         &OnQuit);
            EVT_MENU(Cmd.About,        &OnAbout);

            // Misc initialization 

            m_printData     = new PrintData();
            m_pageУстupData = new PageУстupDialogData();

            пиктограмма = new Пиктограмма("./data/mondrian.png");

            CreateStatusBar(2);
            StatusText = "Welcome to the Printing Demo!";

            Центр();
        }

		public проц OnPrint(Объект отправитель, Событие e)
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

		public проц OnPrintУстup(Объект отправитель, Событие e)
        {
            PrintDialog printerDialog = new PrintDialog(this, m_printData);

            printerDialog.printDialogData.УстupDialog = да;
            printerDialog.ShowModal();

            m_printData = printerDialog.printDialogData.printData;
        }

		public проц OnPageУстup(Объект отправитель, Событие e)
        {
            m_pageУстupData = new PageУстupDialogData(m_printData);

            PageУстupDialog pageУстupDialog = 
                new PageУстupDialog(this, m_pageУстupData);
            pageУстupDialog.ShowModal();

            m_printData = pageУстupDialog.PageУстupData.printData;
            m_pageУстupData = pageУстupDialog.PageУстupData;
        }

		public проц OnPrintPreview(Объект отправитель, Событие e)
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

            frame.Центр();
            frame.Инициализируй();
            frame.Покажи(да);
        }

		public проц OnQuit(Объект отправитель, Событие e)
		{
			Закрой();
		}

		public проц OnAbout(Объект отправитель, Событие e)
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
            dc.Background = new Кисть("White");
            dc.Clear();
            // TODO dc.Шрифт = m_testFont);

            dc.BackgroundMode = FillStyle.wxTRANSPARENT;

            dc.brush = new Кисть("Cyan");
            dc.pen = new Pen("Red");

            dc.DrawRectangle(0, 30, 200, 100);
            dc.DrawText("Прямоугольник 200 by 100", 40, 40);
            dc.DrawEllipse(50, 140, 100, 50);
            dc.DrawText("Test message: this is in 10 Точка текст", 10, 180);

            ткст test = "Greek -- " ~
                          "Hebrew -- " ~
                          "Japanese ()";
            dc.DrawText(test, 10, 200); 

            dc.pen = new Pen("Black");
            dc.DrawLine(0, 0, 200, 200);
            dc.DrawLine(200, 0, 0, 200);

            // TODO
            //Пиктограмма my_icon = new Пиктограмма("../Samples/Printing/mondrian.png");
            //dc.DrawIcon(my_icon, 100, 100);
        }
	}

    public class MyCanvas : ScrolledWindow
    {
        public this(Frame frame)
        { 
            super(frame) ;
            ЦветФона = new Цвет("White");
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
                //dc.УстDeviceOrigin(0, 0);
                //dc.УстUserScale(1.0, 1.0);

                return да;
            }

            return false;
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
            // TODO: Scale graphics here 
            
            MyFrame.Draw(dc);
        }

        private проц DrawPageTwo(DC dc)
        {
            // TODO: Draw something different here
        }
    }

	public class MyApp : Апп
	{
		public override бул ПоИниц()
		{
			MyFrame frame = new MyFrame("wxD Printing Demo", 
                                        Точка(50,50), Размер(450,340));
			frame.Покажи(да);

			return да;
		}

		
		static проц Main()
		{
			MyApp app = new MyApp();
			app.Пуск();
		}
	}


проц main()
{
	MyApp.Main();
}
