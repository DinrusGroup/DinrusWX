//-----------------------------------------------------------------------------
// wxD/Samples - Wizard.d
//
// A wxD version of the wxWidgets "wizard" sample.
//
// Written by Jason Perkins (jason@379.com)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Wizard.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

    enum Cmd
    {
        About,
        Quit,
        RunWizard
    }

    public class MyApp : Прил
    {
        //---------------------------------------------------------------------

        public override бул ПриИниц()
        {
            MyFrame frame = new MyFrame("wxWizard Sample");
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


    public class MyFrame : Frame
    {
        //---------------------------------------------------------------------

        public this(ткст title)
        {
            super(title);
            Меню fileMenu = new Меню();
            fileMenu.Append(Cmd.RunWizard, "&Пуск wizard...\tCtrl-R");
            fileMenu.AppendSeparator();
            fileMenu.Append(Cmd.Quit, "E&xit\tAlt-X", "Quit this program");

            Меню helpMenu = new Меню();
            helpMenu.Append(Cmd.About, "&About...\tF1", "Show about dialog");

            MenuBar menuBar = new MenuBar();
            menuBar.Append(fileMenu, "&File");
            menuBar.Append(helpMenu, "&Справка");
            this.menuBar = menuBar;

            CreateStatusBar();

            // Добавь event listeners

            EVT_MENU(Cmd.About,        &OnAbout);
            EVT_MENU(Cmd.Quit,         &OnQuit);
            EVT_MENU(Cmd.RunWizard,    &OnRunWizard);
        }

        //---------------------------------------------------------------------

        public проц OnQuit(Объект sender, Событие e)
        {
            Закрой(да);
        }

        //---------------------------------------------------------------------

        public проц OnAbout(Объект sender, Событие e)
        {
            ткст msg = "Demo of wxWizard class\n(c) 1999, 2000 Vadim Zeitlin\n ported for D by BERO";
            MessageBox(this, msg, "About wxWizard Sample", Dialog.wxOK | Dialog.wxICON_INFORMATION);
        }

        //---------------------------------------------------------------------

        public проц OnRunWizard(Объект sender, Событие e)
        {
            Wizard wizard = new Wizard(this, -1, "Absolutely Useless Wizard",
                                             new Битмап("../Samples/Wizard/wiztest.png"));

            WizardPageSimple page1 = new WizardPageSimple(wizard);
            StaticText текст = new StaticText(page1, -1,
                                                   "This wizard doesn't справка you do anything at all.\n\n" ~
                                                   "The next pages will present you with more useless controls.");

            RadioBoxPage   page3 = new RadioBoxPage(wizard);
            ValidationPage page4 = new ValidationPage(wizard);

            WizardPageSimple.Chain(page1, page3);
            WizardPageSimple.Chain(page3, page4);

            wizard.PageSize = текст.BestSize;
            wizard.RunWizard(page1);
        }

        //---------------------------------------------------------------------

        public проц OnWizardCancel(Объект sender, Событие e)
        {
        }
    }


    public class ValidationPage : WizardPageSimple
    {
        private CheckBox checkbox;

        //---------------------------------------------------------------------

        public this(Wizard родитель)
        {
            super(родитель);
            checkbox = new CheckBox(this, -1, "Check Me");
        }

        //---------------------------------------------------------------------

        public override бул TransferDataFromWindow()
        {
            if (!checkbox.Value)
            {
                ткст msg = "Check the checkbox first!";
                MessageBox(this, msg, "No way", Dialog.wxOK | Dialog.wxICON_WARNING);
                return нет;
            }

            return да;
        }

        //---------------------------------------------------------------------
    }


    public class RadioBoxPage : WizardPageSimple
    {
        private RadioBox radio;

        //---------------------------------------------------------------------

        public this(Wizard родитель)
        {
            super(родитель);
            static ткст[] choices = [ "Forward", "Backward", "Both", "Neither" ];

            radio = new RadioBox(this, -1, "Allow to proceed:", Точка(5,5),
                                    wxDefaultSize, choices,
                                    1, 0);
            radio.Selection = 2;
        }

        //---------------------------------------------------------------------
    }


проц main()
{
	MyApp.Main();
}
