//-----------------------------------------------------------------------------
// wxD/Samples - HTML.cs
//
// A NET version of the wxWidgets "HTML" sample.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Copyright (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HTML.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

    public class MyFrame : Frame
    {
        enum Cmd { Открой, OpenURL, About, Quit, Dialog, Back, Forward }


        HtmlWindow m_html;

        //---------------------------------------------------------------------

        public this(ткст title, Точка поз, Размер size)
        {
            super(title, поз, size);
            // Установи the окно иконка

            this.иконка = new Icon("../Samples/HTML/mondrian.png");

            // Установи up a меню

            Меню fileMenu = new Меню();
            fileMenu.Append(Cmd.Открой, "Открой...\tCtrl+O",
                            "Открой a page");
            fileMenu.Append(Cmd.OpenURL, "Открой URL...\tCtrl+U",
                            "Открой a URL");
            fileMenu.AppendSeparator();
            fileMenu.Append(Cmd.Quit, "E&xit\tAlt-X", 
                            "Quit this program");

            Меню goMenu = new Меню();
            goMenu.Append(Cmd.Back, "&Back\tCtrl+B", 
                          "Browse back one page");
            goMenu.Append(Cmd.Forward, "&Forward\tCtrl+F", 
                          "Browse forward one page");

            Меню helpMenu = new Меню();
            helpMenu.Append(Cmd.About, "&About...\tF1", 
                            "Show about dialog");

            MenuBar menuBar = new MenuBar();
            menuBar.Append(fileMenu, "&File");
            menuBar.Append(goMenu,   "&Browse");
            menuBar.Append(helpMenu, "&Справка");

            this.menuBar = menuBar;

            // Установи up a status bar

            CreateStatusBar(2);
            StatusText = "Welcome to wxWidgets!";

            // Create the HTML окно

            m_html = new HtmlWindow(this);
            m_html.SetRelatedFrame(this, "HTML : %s");
            m_html.RelatedStatusBar = 1;
            m_html.LoadPage("../Samples/HTML/Data/test.htm");

            // Установи up the event table

            EVT_MENU(Cmd.Открой,    &OnOpen);
            EVT_MENU(Cmd.OpenURL, &OnOpenURL);
            EVT_MENU(Cmd.Quit,    &OnQuit);
            EVT_MENU(Cmd.Back,    &OnBack);
            EVT_MENU(Cmd.Forward, &OnForward);
            EVT_MENU(Cmd.About,   &OnAbout);
        }

        //---------------------------------------------------------------------

        public проц OnOpen(Объект sender, Событие e)
        {
            ткст page = FileSelector("Открой HTML document", "", "", "", 
                                           "HTML Files (*.htm)|*.htm|" ~ 
                                           "All Files (*.*)|*.*");
            if (page != "") {
                m_html.LoadPage(page);
            }
        }

        public проц OnOpenURL(Объект sender, Событие e)
        {
            TextEntryDialog dlg = 
                new TextEntryDialog(this, "Enter URL to open", "Открой URL", 
                                    "http://wxnet.sourceforge.net/news.html", 
                                    Dialog.wxOK | Dialog.wxCANCEL);
            if (dlg.ShowModal() == Dialog.wxID_OK) {
                m_html.LoadPage(dlg.Value);
            }
        }

        public проц OnQuit(Объект sender, Событие e)
        {
            Закрой();
        }

        //---------------------------------------------------------------------

        public проц OnAbout(Объект sender, Событие e)
        {
            HtmlAboutDialog dlg = new HtmlAboutDialog(this);
            dlg.ShowModal();
        }

        //---------------------------------------------------------------------

        public проц OnBack(Объект sender, Событие e)
        {
            if (!m_html.HistoryBack()) {
                MessageDialog dlg = 
                    new MessageDialog(this, "Can't go back any further", 
                                      "HTML", Dialog.wxOK | Dialog.wxCENTRE);
                dlg.ShowModal();
            }
        }

        public проц OnForward(Объект sender, Событие e)
        {
            if (!m_html.HistoryForward()) {
                MessageDialog dlg = 
                    new MessageDialog(this, "There is no forward", 
                                      "HTML", Dialog.wxOK | Dialog.wxCENTRE);
                dlg.ShowModal();
            }
        }

        //---------------------------------------------------------------------
    }

    public class HtmlAboutDialog : Dialog
    {
        //---------------------------------------------------------------------

        public this (Окно родитель)
        {
            super(родитель, -1, "About HTML");

            this.sizer = new BoxSizer(Ориентация.wxVERTICAL);

            // Create the about html окно

            HtmlWindow html = new HtmlWindow(this, -1, wxDefaultPosition,
                                             Размер(380,160), 
                                             HtmlWindow.wxHW_SCROLLBAR_NEVER);
            html.Borders = 0;
            html.LoadPage("../Samples/HTML/Data/about.htm");

            html.size = html.InternalRepresentation.size;

            sizer.Добавь(html, 1, Direction.wxALL, 5);

            // Create the OK button

            sizer.Добавь(new Кнопка(this, -1, "OK"), 0, 
                      Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
            sizer.Fit(this);

            EVT_BUTTON(-1, &OnOK);
        }

        //---------------------------------------------------------------------

        public проц OnOK(Объект sender, Событие e)
        {
            EndModal(wxID_OK);
        }

        //---------------------------------------------------------------------
    }

    public class MyApp : Прил
    {
        //---------------------------------------------------------------------

        public override бул ПриИниц()
        {
            MyFrame frame = new MyFrame("HTML Sample", Точка(50,50), Размер(450,340));

            frame.Show(да);

            return да;
        }

        //---------------------------------------------------------------------

        static проц Main()
        {
            MyApp прил = new MyApp();
            прил.Пуск();
        }

        //---------------------------------------------------------------------
    }

проц main()
{
	MyApp.Main();
}
