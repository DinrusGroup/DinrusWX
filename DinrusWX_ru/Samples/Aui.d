
///////////////////////////////////////////////////////////////////////////////
// Имя:    wxauitest.cpp
// Purpose:   wxaui: wx advanced user interface - sample/test program
// Author:    Benjamin I. Williams
// Modified by: David Gileadi: converted to D code
// Created:   2005-10-03
// RCS-ИД:
// Copyright:   (C) Copyright 2005, Kirix Corporation, All Rights Reserved.
// Licence:   wxWindows Library Licence, Version 3.1
///////////////////////////////////////////////////////////////////////////////

import wx.wx;
import wx.Defs;
import wx.Grid;
import wx.TreeCtrl;
import wx.SpinCtrl;
import wx.ArtProvider;
import wx.Clipboard;
import wx.Image;
import wx.ColourDialog;
import wx.HTML;
import wx.Window;
import wx.aui.aui;
import stdrus;


// -- application --

class MyApp : Апп
{
  public бул ПоИниц()
  {
    Frame frame = new MyFrame(null,
                   wxID_ANY,
                   "wxAUI 0.9.2 Test Application",
                   Окно.вхДефПоз,
                   Размер(800, 600));
    //УстTopWindow(frame);
    frame.Покажи();

    return да;
  }

  static проц Main()
  {
    MyApp app = new MyApp();
    app.Пуск();
  }
}

цел main()
{
  MyApp.Main();
  return 0;
}


// -- frame --

class MyFrame : public Frame
{
  enum
  {
    ID_CreateTree = MenuIDs.wxID_HIGHEST+1,
    ID_CreateGrid,
    ID_CreateText,
    ID_CreateHTML,
    ID_CreateSizeReport,
    ID_GridContent,
    ID_TextContent,
    ID_TreeContent,
    ID_HTMLContent,
    ID_SizeReportContent,
    ID_CreatePerspective,
    ID_CopyPerspectiveCode,
    ID_AllowFloating,
    ID_AllowActivePane,
    ID_TransparentHint,
    ID_TransparentHintFade,
    ID_TransparentDrag,
    ID_NoGradient,
    ID_VerticalGradient,
    ID_HorizontalGradient,
    ID_Settings,
    ID_About,
    ID_FirstPerspective = ID_CreatePerspective+1000
  };

public:
  this(wxWindow родитель,
      цел ид,
      char[] title,
      Точка поз = Окно.вхДефПоз,
      Размер Размер = вхДефРазм,
      long стиль = wxDEFAULT_FRAME_STYLE | wxSUNKEN_BORDER)
  {
    super(родитель, ид, title, поз, Размер, стиль);

    m_mgr = new FrameManager();

    // tell wxFrameManager to manage this frame
    m_mgr.УстFrame(this);

    // set frame пиктограмма
    пиктограмма = new Пиктограмма("./data/mondrian.png");

    // create меню
    MenuBar mb = new MenuBar;

    Меню file_menu = new Меню;
    file_menu.Append(MenuIDs.wxID_EXIT, "Exit");

    Меню view_menu = new Меню;
    view_menu.Append(ID_CreateText, "Создай Text Control");
    view_menu.Append(ID_CreateHTML, "Создай HTML Control");
    view_menu.Append(ID_CreateTree, "Создай Tree");
    view_menu.Append(ID_CreateGrid, "Создай Grid");
    view_menu.Append(ID_CreateSizeReport, "Создай Размер Reporter");
    view_menu.AppendSeparator();
    view_menu.Append(ID_GridContent, "Use a Grid for the Content Pane");
    view_menu.Append(ID_TextContent, "Use a Text Control for the Content Pane");
    view_menu.Append(ID_HTMLContent, "Use an HTML Control for the Content Pane");
    view_menu.Append(ID_TreeContent, "Use a Tree Control for the Content Pane");
    view_menu.Append(ID_SizeReportContent, "Use a Размер Reporter for the Content Pane");

    Меню options_menu = new Меню;
    options_menu.AppendCheckItem(ID_AllowFloating, "Allow Floating");
    options_menu.AppendCheckItem(ID_TransparentHint, "Transparent Hint");
    options_menu.AppendCheckItem(ID_TransparentHintFade, "Transparent Hint Fade-in");
    options_menu.AppendCheckItem(ID_TransparentDrag, "Transparent Drag");
    options_menu.AppendCheckItem(ID_AllowActivePane, "Allow Активен Pane");
    options_menu.AppendSeparator();
    options_menu.AppendRadioItem(ID_NoGradient, "No Caption Gradient");
    options_menu.AppendRadioItem(ID_VerticalGradient, "Vertical Caption Gradient");
    options_menu.AppendRadioItem(ID_HorizontalGradient, "Horizontal Caption Gradient");
    options_menu.AppendSeparator();
    options_menu.Append(ID_Settings, "Устtings Pane");

    m_perspectives_menu = new Меню;
    m_perspectives_menu.Append(ID_CreatePerspective, "Создай Perspective");
    m_perspectives_menu.Append(ID_CopyPerspectiveCode, "Copy Perspective Data To Clipboard");
    m_perspectives_menu.AppendSeparator();
    m_perspectives_menu.Append(ID_FirstPerspective+0, "Default Startup");
    m_perspectives_menu.Append(ID_FirstPerspective+1, "All Panes");

    Меню help_menu = new Меню;
    help_menu.Append(ID_About, "About...");

    mb.Append(file_menu, "File");
    mb.Append(view_menu, "View");
    mb.Append(m_perspectives_menu, "Perspectives");
    mb.Append(options_menu, "Options");
    mb.Append(help_menu, "Help");

    menuBar = mb;

    CreateStatusBar();
    statusBar.StatusText = "Ready";


    // min Размер for the frame itself isn't completely done.
    // see the end up wxFrameManager::Обнови() for the test
    // code. For now, just hard code a frame minimum Размер
    УстРазмПодсказ(400,300);

    // create some toolbars
    ToolBar tb1 = new ToolBar(this, -1, Окно.вхДефПоз, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb1.ToolBitmapSize = Размер(48,48);
    tb1.AddTool(101, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_ERROR));
    tb1.AddSeparator();
    tb1.AddTool(102, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_QUESTION));
    tb1.AddTool(103, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_INFORMATION));
    tb1.AddTool(103, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_WARNING));
    tb1.AddTool(103, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_MISSING_IMAGE));
    tb1.Realize();



    ToolBar tb2 = new ToolBar(this, -1, Окно.вхДефПоз, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb2.ToolBitmapSize = Размер(16,16);

    Битмап tb2_bmp1 = АртПровайдер.ДайБитмап(ПАртИД.wxART_QUESTION, ПАртКлиент.wxART_OTHER, Размер(16,16));
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddSeparator();
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddSeparator();
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.Realize();


    ToolBar tb3 = new ToolBar(this, -1, Окно.вхДефПоз, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb3.ToolBitmapSize = Размер(16,16);
    Битмап tb3_bmp1 = АртПровайдер.ДайБитмап(ПАртИД.wxART_FOLDER, ПАртКлиент.wxART_OTHER, Размер(16,16));
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddSeparator();
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.Realize();

    ToolBar tb4 = new ToolBar(this, -1, Окно.вхДефПоз, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER | /*ToolBar.wxTB_HORZ_LAYOUT*/0x0800 | ToolBar.wxTB_TEXT);
    tb4.ToolBitmapSize = Размер(16,16);
    Битмап tb4_bmp1 = АртПровайдер.ДайБитмап(ПАртИД.wxART_NORMAL_FILE, ПАртКлиент.wxART_OTHER, Размер(16,16));
    tb4.AddTool(101, "Элемент 1", tb4_bmp1);
    tb4.AddTool(101, "Элемент 2", tb4_bmp1);
    tb4.AddTool(101, "Элемент 3", tb4_bmp1);
    tb4.AddTool(101, "Элемент 4", tb4_bmp1);
    tb4.AddSeparator();
    tb4.AddTool(101, "Элемент 5", tb4_bmp1);
    tb4.AddTool(101, "Элемент 6", tb4_bmp1);
    tb4.AddTool(101, "Элемент 7", tb4_bmp1);
    tb4.AddTool(101, "Элемент 8", tb4_bmp1);
    tb4.Realize();


    // Уст up the event table

    EVT_ERASE_BACKGROUND(&OnEraseBackground);
    EVT_SIZE(&OnSize);
    EVT_MENU(ID_CreateTree, &OnCreateTree);
    EVT_MENU(ID_CreateGrid, &OnCreateGrid);
    EVT_MENU(ID_CreateText, &OnCreateText);
    EVT_MENU(ID_CreateHTML, &OnCreateHTML);
    EVT_MENU(ID_CreateSizeReport, &OnCreateSizeReport);
    EVT_MENU(ID_CreatePerspective, &OnCreatePerspective);
    EVT_MENU(ID_CopyPerspectiveCode, &OnCopyPerspectiveCode);
    EVT_MENU(ID_AllowFloating, &OnManagerFlag);
    EVT_MENU(ID_TransparentHint, &OnManagerFlag);
    EVT_MENU(ID_TransparentHintFade, &OnManagerFlag);
    EVT_MENU(ID_TransparentDrag, &OnManagerFlag);
    EVT_MENU(ID_AllowActivePane, &OnManagerFlag);
    EVT_MENU(ID_NoGradient, &OnGradient);
    EVT_MENU(ID_VerticalGradient, &OnGradient);
    EVT_MENU(ID_HorizontalGradient, &OnGradient);
    EVT_MENU(ID_Settings, &OnУстtings);
    EVT_MENU(ID_GridContent, &OnChangeContentPane);
    EVT_MENU(ID_TreeContent, &OnChangeContentPane);
    EVT_MENU(ID_TextContent, &OnChangeContentPane);
    EVT_MENU(ID_SizeReportContent, &OnChangeContentPane);
    EVT_MENU(ID_HTMLContent, &OnChangeContentPane);
    EVT_UPDATE_UI(ID_AllowFloating, &OnUpdateUI);
    EVT_UPDATE_UI(ID_TransparentHint, &OnUpdateUI);
    EVT_UPDATE_UI(ID_TransparentHintFade, &OnUpdateUI);
    EVT_UPDATE_UI(ID_TransparentDrag, &OnUpdateUI);
    EVT_UPDATE_UI(ID_NoGradient, &OnUpdateUI);
    EVT_UPDATE_UI(ID_VerticalGradient, &OnUpdateUI);
    EVT_UPDATE_UI(ID_HorizontalGradient, &OnUpdateUI);
    for (цел i = 0; i < 1000; i++)
      EVT_MENU(ID_FirstPerspective + i, &OnRestorePerspective);


    // add a bunch of panes
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test1").Caption("Pane Caption").
            Верх());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test2").Caption("Client Размер Reporter").
            Низ().Позиция(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test3").Caption("Client Размер Reporter").
            Низ());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test4").Caption("Pane Caption").
            Лево());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test5").Caption("Pane Caption").
            Право());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test6").Caption("Client Размер Reporter").
            Право().Row(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test7").Caption("Client Размер Reporter").
            Лево().Layer(1));
/*
    info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.
            Имя("test8").Caption("Tree Pane").
            Лево().Layer(1).Позиция(1));
*/
    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test9").Caption("Min Размер 200x100").
            ЛучшийРазмер(Размер(200,100)).МинРазм(Размер(200,100)).
            Низ().Layer(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.
            Имя("test10").Caption("Text Pane").
            Низ().Layer(1).Позиция(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test11").Caption("Fixed Pane").
            Низ().Layer(1).Позиция(2).Fixed());


    info = new PaneInfo();
    m_mgr.AddPane(new УстtingsPanel(this,this), info.
            Имя("settings").Caption("Dock Manager Устtings").
            Dockable(false).Float().Спрячь());

    // create some center panes

    info = new PaneInfo();
    m_mgr.AddPane(CreateGrid(), info.Имя("grid_content").
            CenterPane().Спрячь());
/*
    info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.Имя("tree_content").
            CenterPane().Спрячь());
*/
    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.Имя("sizereport_content").
            CenterPane().Спрячь());

    info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.Имя("text_content").
            CenterPane().Спрячь());

    info = new PaneInfo();
    m_mgr.AddPane(CreateHTMLCtrl(), info.Имя("html_content").
            CenterPane());

    // add the toolbars to the manager

    info = new PaneInfo();
    m_mgr.AddPane(tb1, info.
            Имя("tb1").Caption("Big Toolbar").
            ToolbarPane().Верх().
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(tb2, info.
            Имя("tb2").Caption("Toolbar 2").
            ToolbarPane().Верх().Row(1).
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(tb3, info.
            Имя("tb3").Caption("Toolbar 3").
            ToolbarPane().Верх().Row(1).Позиция(1).
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(tb4, info.
            Имя("tb4").Caption("Sample Bookmark Toolbar").
            ToolbarPane().Верх().Row(2).
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(new Кнопка(this, -1, "Test Кнопка"),
            info.Имя("tb5").
            ToolbarPane().Верх().Row(2).Позиция(1).
            LeftDockable(false).RightDockable(false));



    // make some default perspectives

    char[] perspective_all = m_mgr.SavePerspective();

    цел i, count;
    for (i = 0, count = m_mgr.GetPaneCount(); i < count; ++i)
      if (!m_mgr.GetPane(i).IsToolbar())
        m_mgr.GetPane(i).Спрячь();
    m_mgr.GetPane("tb1").Спрячь();
    m_mgr.GetPane("tb5").Спрячь();
    m_mgr.GetPane("test8").Покажи().Лево().Layer(0).Row(0).Позиция(0);
    m_mgr.GetPane("test10").Покажи().Низ().Layer(0).Row(0).Позиция(0);
    m_mgr.GetPane("html_content").Покажи();
    char[] perspective_default = m_mgr.SavePerspective();

    m_perspectives ~= perspective_default;
    m_perspectives ~= perspective_all;

    // "commit" all changes made to wxFrameManager
    m_mgr.Обнови();
  }

  ~this()
  {
    m_mgr.UnInit();
  }

  DockArt GetDockArt()
  {
    return m_mgr.GetArtProvider();
  }

  проц DoUpdate()
  {
    m_mgr.Обнови();
  }

private:
  проц OnEraseBackground(Объект отправитель, Событие event)
  {
    event.Skip();
  }

  проц OnSize(Объект отправитель, Событие event)
  {
    event.Skip();
  }

  проц OnУстtings(Объект отправитель, Событие event)
  {
    // покажи the settings pane, and float it
    PaneInfo floating_pane = m_mgr.GetPane("settings").Float().Покажи();

    if (floating_pane.floating_pos == Окно.вхДефПоз)
      floating_pane.FloatingPosition(GetStartPosition());

    m_mgr.Обнови();
  }


  проц OnGradient(Объект отправитель, Событие event)
  {
    цел gradient = 0;

    switch (event.ИД())
    {
      case ID_NoGradient:     gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_NONE; break;
      case ID_VerticalGradient:   gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_VERTICAL; break;
      case ID_HorizontalGradient: gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_HORIZONTAL; break;
    }

    m_mgr.GetArtProvider().УстMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE, gradient);
    m_mgr.Обнови();
  }

  проц OnManagerFlag(Объект отправитель, Событие event)
  {
    бцел flag = 0;

version(__WXMSW__)
{}
else
{
    if (event.ИД() == ID_TransparentDrag ||
      event.ИД() == ID_TransparentHint ||
      event.ИД() == ID_TransparentHintFade)
    {
      MessageBox("This option is presently only available on wxMSW");
      return;
    }
}

    switch (event.ИД())
    {
      case ID_AllowFloating: flag = wxFrameManagerOption.wxAUI_MGR_ALLOW_FLOATING; break;
      case ID_TransparentDrag: flag = wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_DRAG; break;
      case ID_TransparentHint: flag = wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT; break;
      case ID_TransparentHintFade: flag = wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT_FADE; break;
      case ID_AllowActivePane: flag = wxFrameManagerOption.wxAUI_MGR_ALLOW_ACTIVE_PANE; break;
    }
    m_mgr.УстФлаги(m_mgr.GetФлаги() ^ flag);
    m_mgr.Обнови();
  }

  проц OnUpdateUI(Объект отправитель, Событие event)
  {
    бцел флаги = m_mgr.GetФлаги();

    switch (event.ИД())
    {
      case ID_NoGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_NONE ? да : false);
        break;
      case ID_VerticalGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_VERTICAL ? да : false);
        break;
      case ID_HorizontalGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_HORIZONTAL ? да : false);
        break;
      case ID_AllowFloating:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_ALLOW_FLOATING ? да : false);
        break;
      case ID_TransparentDrag:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_DRAG ? да : false);
        break;
      case ID_TransparentHint:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT ? да : false);
        break;
      case ID_TransparentHintFade:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT_FADE ? да : false);
        break;
    }
  }

  проц OnCreatePerspective(Объект отправитель, Событие event)
  {
    TextEntryDialog dlg = new TextEntryDialog(this, "Enter a имя for the new perspective:",
                "wxAUI Test");

    dlg.Value = фм("Perspective %d", m_perspectives.length+1);
    if (dlg.ShowModal() != wxID_OK)
      return;

    if (m_perspectives.length == 0)
    {
      m_perspectives_menu.AppendSeparator();
    }

    m_perspectives_menu.Append(ID_FirstPerspective + m_perspectives.length, dlg.Value);
    m_perspectives ~= m_mgr.SavePerspective();
  }

  проц OnCopyPerspectiveCode(Объект отправитель, Событие event)
  {
    char[] s = m_mgr.SavePerspective();

    if (Clipboard.TheClipboard.Open())
    {
      Clipboard.TheClipboard.УстData(new TextDataObject(s));
      Clipboard.TheClipboard.Закрой();
    }
  }

  проц OnRestorePerspective(Объект отправитель, Событие event)
  {
    m_mgr.LoadPerspective(m_perspectives[event.ИД - ID_FirstPerspective]);
  }


  Точка GetStartPosition()
  {
    static цел x = 0;
    x += 20;
    Точка тчк = КлиентКЭкрану(Точка(0,0));
    return Точка(тчк.X + x, тчк.Y + x);
  }

  проц OnCreateTree(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.
            Имя("Test").Caption("Tree Control").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(150,300)));
    m_mgr.Обнови();
  }

  проц OnCreateGrid(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateGrid(), info.
            Имя("Test").Caption("Grid").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(300,200)));
    m_mgr.Обнови();
  }

  проц OnCreateHTML(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateHTMLCtrl(), info.
            Имя("Test").Caption("Grid").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(300,200)));
    m_mgr.Обнови();
  }

  проц OnCreateText(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.
            Имя("Test").Caption("Text Control").
            Float().FloatingPosition(GetStartPosition()));
    m_mgr.Обнови();
  }

  проц OnCreateSizeReport(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("Test").Caption("Client Размер Reporter").
            Float().FloatingPosition(GetStartPosition()));
    m_mgr.Обнови();
  }

  проц OnChangeContentPane(Объект отправитель, Событие event)
  {
    m_mgr.GetPane("grid_content").Покажи(event.ИД() == ID_GridContent ? да:false);
    m_mgr.GetPane("text_content").Покажи(event.ИД() == ID_TextContent ? да:false);
    m_mgr.GetPane("tree_content").Покажи(event.ИД() == ID_TreeContent ? да:false);
    m_mgr.GetPane("sizereport_content").Покажи(event.ИД() == ID_SizeReportContent ? да:false);
    m_mgr.GetPane("html_content").Покажи(event.ИД() == ID_HTMLContent ? да:false);
    m_mgr.Обнови();
  }

  TextCtrl CreateTextCtrl()
  {
    char[] текст;
    static цел n = 0;

    текст = фм("This is текст box %d", ++n);

    return new TextCtrl(this,-1, текст,
                Точка(0,0), Размер(150,90),
                wxNO_BORDER | TextCtrl.wxTE_MULTILINE);
  }


  Grid CreateGrid()
  {
    Grid grid = new Grid(this, -1,
                  Точка(0,0),
                  Размер(150,250),
                  wxNO_BORDER | wxWANTS_CHARS);
    grid.CreateGrid(50, 20);
    return grid;
  }

  TreeCtrl CreateTreeCtrl()
  {
    TreeCtrl tree = new TreeCtrl(this, -1,
                      Точка(0,0), Размер(160,250),
                      TreeCtrl.wxTR_DEFAULT_STYLE | wxNO_BORDER);

    TreeItemId root = tree.AddRoot("wxAUI Project");
    ArrayTreeItemIds элтs = new ArrayTreeItemIds();


    ImageList imglist = new ImageList(16, 16, да, 2);
    imglist.Добавь(АртПровайдер.ДайБитмап(ПАртИД.wxART_FOLDER, ПАртКлиент.wxART_OTHER, Размер(16,16)));
    imglist.Добавь(АртПровайдер.ДайБитмап(ПАртИД.wxART_NORMAL_FILE, ПАртКлиент.wxART_OTHER, Размер(16,16)));
    tree.AssignImageList(imglist);

    элтs.Добавь(tree.AppendItem(root, "Элемент 1", 0));
    элтs.Добавь(tree.AppendItem(root, "Элемент 2", 0));
    элтs.Добавь(tree.AppendItem(root, "Элемент 3", 0));
    элтs.Добавь(tree.AppendItem(root, "Элемент 4", 0));
    элтs.Добавь(tree.AppendItem(root, "Элемент 5", 0));


    цел i, count;
    for (i = 0, count = элтs.Счёт(); i < count; ++i)
    {
      TreeItemId ид = элтs.Элемент(i);
      tree.AppendItem(ид, "Subэлт 1", 1);
      tree.AppendItem(ид, "Subэлт 2", 1);
      tree.AppendItem(ид, "Subэлт 3", 1);
      tree.AppendItem(ид, "Subэлт 4", 1);
      tree.AppendItem(ид, "Subэлт 5", 1);
    }


    tree.Expand(root);

    return tree;
  }

  SizeReportCtrl CreateSizeReportCtrl(цел ширь = 80, цел высь = 80)
  {
    SizeReportCtrl ctrl = new SizeReportCtrl(this, -1,
                     Окно.вхДефПоз,
                     Размер(ширь, высь), m_mgr);
    return ctrl;
  }

  HtmlWindow CreateHTMLCtrl()
  {
    HtmlWindow ctrl = new HtmlWindow(this, -1,
                     Окно.вхДефПоз,
                     Размер(400,300));
    ctrl.УстPage(GetIntroText());
    return ctrl;
  }


  char[] GetIntroText()
  {
    return
      "<html><body>"
      "<h3>Welcome to wxAUI 0.9.2</h3>"
      "<br/><b>Overview</b><br/>"
      "<p>wxAUI is an Advanced User Interface library for the wxWidgets toolkit "
      "that allows developers to create high-quality, cross-platform user "
      "interfaces quickly and easily.</p>"
      "<p><b>Features</b></p>"
      "<p>With wxAUI version 0.9.2, developers can create application frameworks with:</p>"
      "<ul>"
      "<li>Native, dockable floating frames</li>"
      "<li>Perspective saving and loading</li>"
      "<li>Native toolbars incorporating real-time, &quot;spring-loaded&quot; dragging</li>"
      "<li>Customizable floating/docking behavior</li>"
      "<li>Completely customizable look-and-feel</li>"
      "<li>Optional transparent окно effects (while dragging or docking)</li>"
      "</ul>"
      "<p><b>What's new in 0.9.2?</b></p>"
      "<p>The following features/fixes have been added since the last version of wxAUI:</p>"
      "<ul>"
      "<li>Support for wxMac</li>"
      "<li>Updates for wxWidgets 2.6.3</li>"
      "<li>Fix to pass more unused events through</li>"
      "<li>Fix to allow floating windows to receive idle events</li>"
      "<li>Fix for minimizing/maximizing problem with transparent hint pane</li>"
      "<li>Fix to not paint empty hint rectangles</li>"
      "<li>Fix for 64-bit compilation</li>"
      "</ul>"
      "<p><b>What changed in 0.9.1?</b></p>"
      "<p>The following features/fixes were added in wxAUI 0.9.1:</p>"
      "<ul>"
      "<li>Support for MDI frames</li>"
      "<li>Gradient captions option</li>"
      "<li>Активен/Inactive panes option</li>"
      "<li>Fix for screen artifacts/paint problems</li>"
      "<li>Fix for hiding/showing floated окно problem</li>"
      "<li>Fix for floating pane sizing problem</li>"
      "<li>Fix for drop position problem when dragging around center pane margins</li>"
      "<li>LF-only текст file фмting for source code</li>"
      "</ul>"
      "<p>See README.txt for more inфмion.</p>"
      "</body></html>";
  }

  FrameManager m_mgr;
  char[][] m_perspectives;
  Меню m_perspectives_menu;
}



// -- SizeReportCtrl --
// (a utility control that always reports it's клиент Размер)

class SizeReportCtrl : Control
{
public:

  this(wxWindow родитель, цел ид = -1,
           Точка поз = Окно.вхДефПоз,
           Размер Размер = вхДефРазм,
           FrameManager mgr = null)
  {
    super(родитель, ид, поз, Размер, wxNO_BORDER);

    m_mgr = mgr;

    EVT_PAINT(&OnPaint);
    EVT_SIZE(&OnSize);
    EVT_ERASE_BACKGROUND(&OnEraseBackground);
  }

private:

  проц OnPaint(Объект отправитель, Событие evt)
  {
    evt.Skip();

    PaintDC dc = new PaintDC(this);
    Размер Размер = РазмерКлиента;
    char[] s;
    цел h, w, высь;

    s = фм("Размер: %d x %d", Размер.Ширь, Размер.Высь);

    dc.УстFont(Шрифт.wxNORMAL_FONT);
    dc.ДайПротяженностьТекста(s, w, высь);
    высь += 3;
    dc.УстBrush(Кисть.wxWHITE_BRUSH);
    dc.УстPen(Pen.wxWHITE_PEN);
    dc.DrawRectangle(0, 0, Размер.Ширь, Размер.Высь);
    dc.УстPen(Pen.wxLIGHT_GREY_PEN);
    dc.DrawLine(0, 0, Размер.Ширь, Размер.Высь);
    dc.DrawLine(0, Размер.Высь, Размер.Ширь, 0);
    dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2));

    if (m_mgr)
    {
      PaneInfo pi = m_mgr.GetPane(this);

      s = фм("Layer: %d", pi.dock_layer);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*1));

      s = фм("Dock: %d Row: %d", pi.dock_direction, pi.dock_row);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*2));

      s = фм("Позиция: %d", pi.dock_pos);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*3));

      s = фм("Proportion: %d", pi.dock_proportion);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*4));
    }
  }

  проц OnEraseBackground(Объект отправитель, Событие evt)
  {
    // intentionally empty
  }

  проц OnSize(Объект отправитель, Событие evt)
  {
    Освежи();
  }
private:

  FrameManager m_mgr;
}




class УстtingsPanel : Panel
{
  enum
  {
    ID_PaneBorderSize = MenuIDs.wxID_HIGHEST+1,
    ID_SashSize,
    ID_CaptionSize,
    ID_BackgroundColor,
    ID_SashColor,
    ID_InactiveCaptionColor,
    ID_InactiveCaptionGradientColor,
    ID_InactiveCaptionTextColor,
    ID_ActiveCaptionColor,
    ID_ActiveCaptionGradientColor,
    ID_ActiveCaptionTextColor,
    ID_BorderColor,
    ID_GripperColor
  };

public:

  this(wxWindow родитель, MyFrame frame)
  {
    super(родитель, -1, Окно.вхДефПоз, вхДефРазм);

    БоксСайзер vert = new БоксСайзер(Ориентация.wxVERTICAL);

    //vert.Добавь(1, 1, 1, Stretch.wxEXPAND);

    БоксСайзер s1 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_border_size = new SpinCtrl(this, ID_PaneBorderSize, "", Окно.вхДефПоз, Размер(50,20));
    s1.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s1.Добавь(new StaticText(this, -1, "Pane ПБордюр Размер:"));
    s1.Добавь(m_border_size);
    s1.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s1.УстItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s1, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    БоксСайзер s2 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_sash_size = new SpinCtrl(this, ID_SashSize, "", Окно.вхДефПоз, Размер(50,20));
    s2.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s2.Добавь(new StaticText(this, -1, "Sash Размер:"));
    s2.Добавь(m_sash_size);
    s2.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s2.УстItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s2, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    БоксСайзер s3 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_caption_size = new SpinCtrl(this, ID_CaptionSize, "", Окно.вхДефПоз, Размер(50,20));
    s3.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s3.Добавь(new StaticText(this, -1, "Caption Размер:"));
    s3.Добавь(m_caption_size);
    s3.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s3.УстItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s3, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    //vert.Добавь(1, 1, 1, Stretch.wxEXPAND);


    Битмап b = CreateColorBitmap(Цвет.wxBLACK);

    БоксСайзер s4 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_background_color = new КнопкаБитмап(this, ID_BackgroundColor, b, Окно.вхДефПоз, Размер(50,25));
    s4.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s4.Добавь(new StaticText(this, -1, "Background Color:"));
    s4.Добавь(m_background_color);
    s4.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s4.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s5 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_sash_color = new КнопкаБитмап(this, ID_SashColor, b, Окно.вхДефПоз, Размер(50,25));
    s5.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s5.Добавь(new StaticText(this, -1, "Sash Color:"));
    s5.Добавь(m_sash_color);
    s5.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s5.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s6 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_inactive_caption_color = new КнопкаБитмап(this, ID_InactiveCaptionColor, b, Окно.вхДефПоз, Размер(50,25));
    s6.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s6.Добавь(new StaticText(this, -1, "Normal Caption:"));
    s6.Добавь(m_inactive_caption_color);
    s6.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s6.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s7 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_inactive_caption_gradient_color = new КнопкаБитмап(this, ID_InactiveCaptionGradientColor, b, Окно.вхДефПоз, Размер(50,25));
    s7.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s7.Добавь(new StaticText(this, -1, "Normal Caption Gradient:"));
    s7.Добавь(m_inactive_caption_gradient_color);
    s7.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s7.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s8 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_inactive_caption_text_color = new КнопкаБитмап(this, ID_InactiveCaptionTextColor, b, Окно.вхДефПоз, Размер(50,25));
    s8.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s8.Добавь(new StaticText(this, -1, "Normal Caption Text:"));
    s8.Добавь(m_inactive_caption_text_color);
    s8.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s8.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s9 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_active_caption_color = new КнопкаБитмап(this, ID_ActiveCaptionColor, b, Окно.вхДефПоз, Размер(50,25));
    s9.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s9.Добавь(new StaticText(this, -1, "Активен Caption:"));
    s9.Добавь(m_active_caption_color);
    s9.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s9.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s10 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_active_caption_gradient_color = new КнопкаБитмап(this, ID_ActiveCaptionGradientColor, b, Окно.вхДефПоз, Размер(50,25));
    s10.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s10.Добавь(new StaticText(this, -1, "Активен Caption Gradient:"));
    s10.Добавь(m_active_caption_gradient_color);
    s10.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s10.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s11 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_active_caption_text_color = new КнопкаБитмап(this, ID_ActiveCaptionTextColor, b, Окно.вхДефПоз, Размер(50,25));
    s11.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s11.Добавь(new StaticText(this, -1, "Активен Caption Text:"));
    s11.Добавь(m_active_caption_text_color);
    s11.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s11.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s12 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_border_color = new КнопкаБитмап(this, ID_BorderColor, b, Окно.вхДефПоз, Размер(50,25));
    s12.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s12.Добавь(new StaticText(this, -1, "ПБордюр Color:"));
    s12.Добавь(m_border_color);
    s12.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s12.УстItemMinSize(1, Размер(180, 20));

    БоксСайзер s13 = new БоксСайзер(Ориентация.wxHORIZONTAL);
    m_gripper_color = new КнопкаБитмап(this, ID_GripperColor, b, Окно.вхДефПоз, Размер(50,25));
    s13.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s13.Добавь(new StaticText(this, -1, "Gripper Color:"));
    s13.Добавь(m_gripper_color);
    s13.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s13.УстItemMinSize(1, Размер(180, 20));

    GridSizer grid_sizer = new GridSizer(0, 2, 0, 0);
    grid_sizer.HGap = 5;
    grid_sizer.Добавь(s1);  grid_sizer.Добавь(s4);
    grid_sizer.Добавь(s2);  grid_sizer.Добавь(s5);
    grid_sizer.Добавь(s3);  grid_sizer.Добавь(s13);
    grid_sizer.Добавь(1,1); grid_sizer.Добавь(s12);
    grid_sizer.Добавь(s6);  grid_sizer.Добавь(s9);
    grid_sizer.Добавь(s7);  grid_sizer.Добавь(s10);
    grid_sizer.Добавь(s8);  grid_sizer.Добавь(s11);

    БоксСайзер cont_sizer = new БоксСайзер(Ориентация.wxVERTICAL);
    cont_sizer.Добавь(grid_sizer, 1, Stretch.wxEXPAND | Direction.wxALL, 5);
    УстСайзер(cont_sizer);
    сайзер().УстРазмПодсказ(this);

    m_frame = frame;
    m_border_size.Value = frame.GetDockArt().GetMetric(wxPaneDockArtУстting.wxAUI_ART_PANE_BORDER_SIZE);
    m_sash_size.Value = frame.GetDockArt().GetMetric(wxPaneDockArtУстting.wxAUI_ART_SASH_SIZE);
    m_caption_size.Value = frame.GetDockArt().GetMetric(wxPaneDockArtУстting.wxAUI_ART_CAPTION_SIZE);

    UpdateColors();

    EVT_SPINCTRL(ID_PaneBorderSize, &OnPaneBorderSize);
    EVT_SPINCTRL(ID_SashSize, &OnSashSize);
    EVT_SPINCTRL(ID_CaptionSize, &OnCaptionSize);
    EVT_BUTTON(ID_BackgroundColor, &OnУстColor);
    EVT_BUTTON(ID_SashColor, &OnУстColor);
    EVT_BUTTON(ID_InactiveCaptionColor, &OnУстColor);
    EVT_BUTTON(ID_InactiveCaptionGradientColor, &OnУстColor);
    EVT_BUTTON(ID_InactiveCaptionTextColor, &OnУстColor);
    EVT_BUTTON(ID_ActiveCaptionColor, &OnУстColor);
    EVT_BUTTON(ID_ActiveCaptionGradientColor, &OnУстColor);
    EVT_BUTTON(ID_ActiveCaptionTextColor, &OnУстColor);
    EVT_BUTTON(ID_BorderColor, &OnУстColor);
    EVT_BUTTON(ID_GripperColor, &OnУстColor);
  }

private:

  Битмап CreateColorBitmap(Цвет c)
  {
    Рисунок рисунок = new Рисунок(25,14);
    for (цел x = 0; x < 25; ++x)
      for (цел y = 0; y < 14; ++y)
      {
        Цвет pixcol = c;
        if (x == 0 || x == 24 || y == 0 || y == 13)
          pixcol = Цвет.wxBLACK;
        рисунок.УстRGB(x, y, pixcol.Red(), pixcol.Green(), pixcol.Blue());
      }
    return new Битмап(рисунок);
  }

  проц UpdateColors()
  {
    Цвет bk = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_BACKGROUND_COLOUR);
    m_background_color.ЯрлыкБитмапа = CreateColorBitmap(bk);

    Цвет cap = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_COLOUR);
    m_inactive_caption_color.ЯрлыкБитмапа = CreateColorBitmap(cap);

    Цвет capgrad = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR);
    m_inactive_caption_gradient_color.ЯрлыкБитмапа = CreateColorBitmap(capgrad);

    Цвет captxt = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR);
    m_inactive_caption_text_color.ЯрлыкБитмапа = CreateColorBitmap(captxt);

    Цвет acap = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_COLOUR);
    m_active_caption_color.ЯрлыкБитмапа = CreateColorBitmap(acap);

    Цвет acapgrad = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR);
    m_active_caption_gradient_color.ЯрлыкБитмапа = CreateColorBitmap(acapgrad);

    Цвет acaptxt = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR);
    m_active_caption_text_color.ЯрлыкБитмапа = CreateColorBitmap(acaptxt);

    Цвет sash = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_SASH_COLOUR);
    m_sash_color.ЯрлыкБитмапа = CreateColorBitmap(sash);

    Цвет бордюр = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_BORDER_COLOUR);
    m_border_color.ЯрлыкБитмапа = CreateColorBitmap(бордюр);

    Цвет gripper = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_GRIPPER_COLOUR);
    m_gripper_color.ЯрлыкБитмапа = CreateColorBitmap(gripper);
  }

  проц OnPaneBorderSize(Объект отправитель, Событие event)
  {
    m_frame.GetDockArt().УстMetric(wxPaneDockArtУстting.wxAUI_ART_PANE_BORDER_SIZE,
                     m_border_size.Value);
    m_frame.DoUpdate();
  }

  проц OnSashSize(Объект отправитель, Событие event)
  {
    m_frame.GetDockArt().УстMetric(wxPaneDockArtУстting.wxAUI_ART_SASH_SIZE,
                     m_sash_size.Value);
    m_frame.DoUpdate();
  }

  проц OnCaptionSize(Объект отправитель, Событие event)
  {
    m_frame.GetDockArt().УстMetric(wxPaneDockArtУстting.wxAUI_ART_CAPTION_SIZE,
                     m_caption_size.Value);
    m_frame.DoUpdate();
  }

  проц OnУстColor(Объект отправитель, Событие event)
  {
    ColourDialog dlg = new ColourDialog(m_frame);
    dlg.Титул = "Color Picker";
    if (dlg.ShowModal() != wxID_OK)
      return;

    цел var = 0;
    switch (event.ИД)
    {
      case ID_BackgroundColor:        var = wxPaneDockArtУстting.wxAUI_ART_BACKGROUND_COLOUR; break;
      case ID_SashColor:          var = wxPaneDockArtУстting.wxAUI_ART_SASH_COLOUR; break;
      case ID_InactiveCaptionColor:     var = wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_COLOUR; break;
      case ID_InactiveCaptionGradientColor: var = wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR; break;
      case ID_InactiveCaptionTextColor:   var = wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR; break;
      case ID_ActiveCaptionColor:       var = wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_COLOUR; break;
      case ID_ActiveCaptionGradientColor:   var = wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR; break;
      case ID_ActiveCaptionTextColor:     var = wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR; break;
      case ID_BorderColor:          var = wxPaneDockArtУстting.wxAUI_ART_BORDER_COLOUR; break;
      case ID_GripperColor:         var = wxPaneDockArtУстting.wxAUI_ART_GRIPPER_COLOUR; break;
      default: return;
    }

    m_frame.GetDockArt().УстColor(var, dlg.colourData.цвет);
    m_frame.DoUpdate();
    UpdateColors();
  }

private:

  MyFrame m_frame;
  SpinCtrl m_border_size;
  SpinCtrl m_sash_size;
  SpinCtrl m_caption_size;
  КнопкаБитмап m_inactive_caption_text_color;
  КнопкаБитмап m_inactive_caption_gradient_color;
  КнопкаБитмап m_inactive_caption_color;
  КнопкаБитмап m_active_caption_text_color;
  КнопкаБитмап m_active_caption_gradient_color;
  КнопкаБитмап m_active_caption_color;
  КнопкаБитмап m_sash_color;
  КнопкаБитмап m_background_color;
  КнопкаБитмап m_border_color;
  КнопкаБитмап m_gripper_color;
}
