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
        enum Cmd { Open, OpenURL, About, Quit, Dialog, Back, Forward }


        HtmlWindow m_html;

        //---------------------------------------------------------------------

        public this(ткст title, Точка поз, Размер Размер)
        {
            super(title, поз, Размер);
            // Уст the окно пиктограмма

            this.пиктограмма = new Пиктограмма("./data/mondrian.png");

            // Уст up a меню

            Меню fileMenu = new Меню();
            fileMenu.Append(Cmd.Open, "Open...\tCtrl+O",
                            "Open a page");
            fileMenu.Append(Cmd.OpenURL, "Open URL...\tCtrl+U",
                            "Open a URL");
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
                            "Покажи about dialog");

            MenuBar menuBar = new MenuBar();
            menuBar.Append(fileMenu, "&File");
            menuBar.Append(goMenu,   "&Browse");
            menuBar.Append(helpMenu, "&Help");

            this.menuBar = menuBar;

            // Уст up a status bar

            CreateStatusBar(2);
            StatusText = "Welcome to wxWidgets!";

            // Создай the HTML окно

            m_html = new HtmlWindow(this);
            m_html.УстRelatedFrame(this, "HTML : %s");
            m_html.RelatedStatusBar = 1;
            m_html.LoadPage("./data/test.htm");

            // Уст up the event table

            EVT_MENU(Cmd.Open,    &OnOpen);
            EVT_MENU(Cmd.OpenURL, &OnOpenURL);
            EVT_MENU(Cmd.Quit,    &OnQuit);
            EVT_MENU(Cmd.Back,    &OnBack);
            EVT_MENU(Cmd.Forward, &OnForward);
            EVT_MENU(Cmd.About,   &OnAbout);
        }

        //---------------------------------------------------------------------

        public проц OnOpen(Объект отправитель, Событие e)
        {
            ткст page = FileSelector("Open HTML document", "", "", "", 
                                           "HTML Files (*.htm)|*.htm|" ~ 
                                           "All Files (*.*)|*.*");
            if (page != "") {
                m_html.LoadPage(page);
            }
        }

        public проц OnOpenURL(Объект отправитель, Событие e)
        {
            TextEntryDialog dlg = 
                new TextEntryDialog(this, "Enter URL to open", "Open URL", 
                                    "http://wxnet.sourceforge.net/news.html", 
                                    Dialog.wxOK | Dialog.wxCANCEL);
            if (dlg.ShowModal() == Dialog.wxID_OK) {
                m_html.LoadPage(dlg.Value);
            }
        }

        public проц OnQuit(Объект отправитель, Событие e)
        {
            Закрой();
        }

        //---------------------------------------------------------------------

        public проц OnAbout(Объект отправитель, Событие e)
        {
            HtmlAboutDialog dlg = new HtmlAboutDialog(this);
            dlg.ShowModal();
        }

        //---------------------------------------------------------------------

        public проц OnBack(Объект отправитель, Событие e)
        {
            if (!m_html.HistoryBack()) {
                MessageDialog dlg = 
                    new MessageDialog(this, "Can't go back any further", 
                                      "HTML", Dialog.wxOK | Dialog.wxCENTRE);
                dlg.ShowModal();
            }
        }

        public проц OnForward(Объект отправитель, Событие e)
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

            this.сайзер = new БоксСайзер(Ориентация.wxVERTICAL);

            // Создай the about html окно

            HtmlWindow html = new HtmlWindow(this, -1, вхДефПоз,
                                             Размер(380,160), 
                                             HtmlWindow.wxHW_SCROLLBAR_NEVER);
            html.Borders = 0;
            html.LoadPage("./data/about.htm");

            html.Размер = html.InternalRepresentation.Размер;

            сайзер.Добавь(html, 1, Direction.wxALL, 5);

            // Создай the OK button

            сайзер.Добавь(new Кнопка(this, -1, "OK"), 0, 
                      Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
            сайзер.Встрой(this);

            EVT_BUTTON(-1, &OnOK);
        }

        //---------------------------------------------------------------------

        public проц OnOK(Объект отправитель, Событие e)
        {
            EndModal(wxID_OK);
        }

        //---------------------------------------------------------------------
    }

    public class MyApp : Апп
    {
        //---------------------------------------------------------------------

        public override бул ПоИниц()
        {
            MyFrame frame = new MyFrame("HTML Sample", Точка(50,50), Размер(450,340));

            frame.Покажи(да);

            return да;
        }

        //---------------------------------------------------------------------

        static проц Main()
        {
            MyApp app = new MyApp();
            app.Пуск();
        }

        //---------------------------------------------------------------------
    }

проц main()
{
	MyApp.Main();
}
