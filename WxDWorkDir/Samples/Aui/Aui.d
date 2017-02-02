
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
import std.string;


// -- application --

class MyApp : Прил
{
  public бул ПриИниц()
  {
    Фрейм frame = new MyFrame(пусто,
                   wxID_ANY,
                   "wxAUI 0.9.2 Test Application",
                   Окно.wxDefaultPosition,
                   Размер(800, 600));
    //SetTopWindow(frame);
    frame.Show();

    return да;
  }

  static проц Main()
  {
    MyApp прил = new MyApp();
    прил.Пуск();
  }
}

цел main()
{
  MyApp.Main();
  return 0;
}


// -- frame --

class MyFrame : public Фрейм
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
      сим[] title,
      Точка поз = Окно.wxDefaultPosition,
      Размер size = wxDefaultSize,
      long стиль = wxDEFAULT_FRAME_STYLE | wxSUNKEN_BORDER)
  {
    super(родитель, ид, title, поз, size, стиль);

    m_mgr = new FrameManager();

    // tell wxFrameManager to manage this frame
    m_mgr.SetFrame(this);

    // set frame иконка
    иконка = new Icon("../Samples/Aui/mondrian.png");

    // create меню
    MenuBar mb = new MenuBar;

    Меню file_menu = new Меню;
    file_menu.Append(MenuIDs.wxID_EXIT, "Exit");

    Меню view_menu = new Меню;
    view_menu.Append(ID_CreateText, "Create Текст Control");
    view_menu.Append(ID_CreateHTML, "Create HTML Control");
    view_menu.Append(ID_CreateTree, "Create Tree");
    view_menu.Append(ID_CreateGrid, "Create Grid");
    view_menu.Append(ID_CreateSizeReport, "Create Размер Reporter");
    view_menu.AppendSeparator();
    view_menu.Append(ID_GridContent, "Use a Grid for the Content Pane");
    view_menu.Append(ID_TextContent, "Use a Текст Control for the Content Pane");
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
    options_menu.Append(ID_Settings, "Settings Pane");

    m_perspectives_menu = new Меню;
    m_perspectives_menu.Append(ID_CreatePerspective, "Create Perspective");
    m_perspectives_menu.Append(ID_CopyPerspectiveCode, "Копируй Perspective Data To БуферОбмена");
    m_perspectives_menu.AppendSeparator();
    m_perspectives_menu.Append(ID_FirstPerspective+0, "Default Startup");
    m_perspectives_menu.Append(ID_FirstPerspective+1, "All Panes");

    Меню help_menu = new Меню;
    help_menu.Append(ID_About, "About...");

    mb.Append(file_menu, "File");
    mb.Append(view_menu, "View");
    mb.Append(m_perspectives_menu, "Perspectives");
    mb.Append(options_menu, "Options");
    mb.Append(help_menu, "Справка");

    menuBar = mb;

    CreateStatusBar();
    statusBar.StatusText = "Ready";


    // min size for the frame itself isn't completely done.
    // see the end up wxFrameManager::Обнови() for the test
    // code. For now, just hard code a frame minimum size
    SetSizeHints(400,300);

    // create some toolbars
    ToolBar tb1 = new ToolBar(this, -1, Окно.wxDefaultPosition, wxDefaultSize,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb1.ToolBitmapSize = Размер(48,48);
    tb1.AddTool(101, "Test", ArtProvider.GetBitmap(ArtID.wxART_ERROR));
    tb1.AddSeparator();
    tb1.AddTool(102, "Test", ArtProvider.GetBitmap(ArtID.wxART_QUESTION));
    tb1.AddTool(103, "Test", ArtProvider.GetBitmap(ArtID.wxART_INFORMATION));
    tb1.AddTool(103, "Test", ArtProvider.GetBitmap(ArtID.wxART_WARNING));
    tb1.AddTool(103, "Test", ArtProvider.GetBitmap(ArtID.wxART_MISSING_IMAGE));
    tb1.Realize();



    ToolBar tb2 = new ToolBar(this, -1, Окно.wxDefaultPosition, wxDefaultSize,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb2.ToolBitmapSize = Размер(16,16);

    Битмап tb2_bmp1 = ArtProvider.GetBitmap(ArtID.wxART_QUESTION, ArtClient.wxART_OTHER, Размер(16,16));
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


    ToolBar tb3 = new ToolBar(this, -1, Окно.wxDefaultPosition, wxDefaultSize,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb3.ToolBitmapSize = Размер(16,16);
    Битмап tb3_bmp1 = ArtProvider.GetBitmap(ArtID.wxART_FOLDER, ArtClient.wxART_OTHER, Размер(16,16));
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddSeparator();
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.Realize();

    ToolBar tb4 = new ToolBar(this, -1, Окно.wxDefaultPosition, wxDefaultSize,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER | /*ToolBar.wxTB_HORZ_LAYOUT*/0x0800 | ToolBar.wxTB_TEXT);
    tb4.ToolBitmapSize = Размер(16,16);
    Битмап tb4_bmp1 = ArtProvider.GetBitmap(ArtID.wxART_NORMAL_FILE, ArtClient.wxART_OTHER, Размер(16,16));
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


    // Установи up the event table

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
    EVT_MENU(ID_Settings, &OnSettings);
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
            Top());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test2").Caption("Client Размер Reporter").
            Bottom().Положение(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test3").Caption("Client Размер Reporter").
            Bottom());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test4").Caption("Pane Caption").
            Left());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test5").Caption("Pane Caption").
            Right());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test6").Caption("Client Размер Reporter").
            Right().Row(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test7").Caption("Client Размер Reporter").
            Left().Layer(1));
/*
    info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.
            Имя("test8").Caption("Tree Pane").
            Left().Layer(1).Положение(1));
*/
    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test9").Caption("Min Размер 200x100").
            BestSize(Размер(200,100)).MinSize(Размер(200,100)).
            Bottom().Layer(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.
            Имя("test10").Caption("Текст Pane").
            Bottom().Layer(1).Положение(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test11").Caption("Fixed Pane").
            Bottom().Layer(1).Положение(2).Fixed());


    info = new PaneInfo();
    m_mgr.AddPane(new SettingsPanel(this,this), info.
            Имя("settings").Caption("Dock Manager Settings").
            Dockable(нет).Float().Hide());

    // create some center panes

    info = new PaneInfo();
    m_mgr.AddPane(CreateGrid(), info.Имя("grid_content").
            CenterPane().Hide());
/*
    info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.Имя("tree_content").
            CenterPane().Hide());
*/
    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.Имя("sizereport_content").
            CenterPane().Hide());

    info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.Имя("text_content").
            CenterPane().Hide());

    info = new PaneInfo();
    m_mgr.AddPane(CreateHTMLCtrl(), info.Имя("html_content").
            CenterPane());

    // add the toolbars to the manager

    info = new PaneInfo();
    m_mgr.AddPane(tb1, info.
            Имя("tb1").Caption("Big Toolbar").
            ToolbarPane().Top().
            LeftDockable(нет).RightDockable(нет));

    info = new PaneInfo();
    m_mgr.AddPane(tb2, info.
            Имя("tb2").Caption("Toolbar 2").
            ToolbarPane().Top().Row(1).
            LeftDockable(нет).RightDockable(нет));

    info = new PaneInfo();
    m_mgr.AddPane(tb3, info.
            Имя("tb3").Caption("Toolbar 3").
            ToolbarPane().Top().Row(1).Положение(1).
            LeftDockable(нет).RightDockable(нет));

    info = new PaneInfo();
    m_mgr.AddPane(tb4, info.
            Имя("tb4").Caption("Sample Bookmark Toolbar").
            ToolbarPane().Top().Row(2).
            LeftDockable(нет).RightDockable(нет));

    info = new PaneInfo();
    m_mgr.AddPane(new Кнопка(this, -1, "Test Кнопка"),
            info.Имя("tb5").
            ToolbarPane().Top().Row(2).Положение(1).
            LeftDockable(нет).RightDockable(нет));



    // make some default perspectives

    сим[] perspective_all = m_mgr.SavePerspective();

    цел i, счёт;
    for (i = 0, счёт = m_mgr.GetPaneCount(); i < счёт; ++i)
      if (!m_mgr.GetPane(i).IsToolbar())
        m_mgr.GetPane(i).Hide();
    m_mgr.GetPane("tb1").Hide();
    m_mgr.GetPane("tb5").Hide();
    m_mgr.GetPane("test8").Show().Left().Layer(0).Row(0).Положение(0);
    m_mgr.GetPane("test10").Show().Bottom().Layer(0).Row(0).Положение(0);
    m_mgr.GetPane("html_content").Show();
    сим[] perspective_default = m_mgr.SavePerspective();

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
  проц OnEraseBackground(Объект sender, Событие event)
  {
    event.Пропусти();
  }

  проц OnSize(Объект sender, Событие event)
  {
    event.Пропусти();
  }

  проц OnSettings(Объект sender, Событие event)
  {
    // show the settings pane, and float it
    PaneInfo floating_pane = m_mgr.GetPane("settings").Float().Show();

    if (floating_pane.floating_pos == Окно.wxDefaultPosition)
      floating_pane.FloatingPosition(GetStartPosition());

    m_mgr.Обнови();
  }


  проц OnGradient(Объект sender, Событие event)
  {
    цел gradient = 0;

    switch (event.ИД())
    {
      case ID_NoGradient:     gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_NONE; break;
      case ID_VerticalGradient:   gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_VERTICAL; break;
      case ID_HorizontalGradient: gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_HORIZONTAL; break;
    }

    m_mgr.GetArtProvider().SetMetric(wxPaneDockArtSetting.wxAUI_ART_GRADIENT_TYPE, gradient);
    m_mgr.Обнови();
  }

  проц OnManagerFlag(Объект sender, Событие event)
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
    m_mgr.SetFlags(m_mgr.GetFlags() ^ flag);
    m_mgr.Обнови();
  }

  проц OnUpdateUI(Объект sender, Событие event)
  {
    бцел флаги = m_mgr.GetFlags();

    switch (event.ИД())
    {
      case ID_NoGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtSetting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_NONE ? да : нет);
        break;
      case ID_VerticalGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtSetting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_VERTICAL ? да : нет);
        break;
      case ID_HorizontalGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtSetting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_HORIZONTAL ? да : нет);
        break;
      case ID_AllowFloating:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_ALLOW_FLOATING ? да : нет);
        break;
      case ID_TransparentDrag:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_DRAG ? да : нет);
        break;
      case ID_TransparentHint:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT ? да : нет);
        break;
      case ID_TransparentHintFade:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT_FADE ? да : нет);
        break;
    }
  }

  проц OnCreatePerspective(Объект sender, Событие event)
  {
    TextEntryДиалог dlg = new TextEntryДиалог(this, "Enter a имя for the new perspective:",
                "wxAUI Test");

    dlg.Value = format("Perspective %d", m_perspectives.length+1);
    if (dlg.ShowModal() != wxID_OK)
      return;

    if (m_perspectives.length == 0)
    {
      m_perspectives_menu.AppendSeparator();
    }

    m_perspectives_menu.Append(ID_FirstPerspective + m_perspectives.length, dlg.Value);
    m_perspectives ~= m_mgr.SavePerspective();
  }

  проц OnCopyPerspectiveCode(Объект sender, Событие event)
  {
    сим[] s = m_mgr.SavePerspective();

    if (БуферОбмена.TheClipboard.Открой())
    {
      БуферОбмена.TheClipboard.УстДанные(new ОбъектТекстовыхДанных(s));
      БуферОбмена.TheClipboard.Закрой();
    }
  }

  проц OnRestorePerspective(Объект sender, Событие event)
  {
    m_mgr.LoadPerspective(m_perspectives[event.ИД - ID_FirstPerspective]);
  }


  Точка GetStartPosition()
  {
    static цел x = 0;
    x += 20;
    Точка pt = ClientToScreen(Точка(0,0));
    return Точка(pt.X + x, pt.Y + x);
  }

  проц OnCreateTree(Объект sender, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.
            Имя("Test").Caption("Tree Control").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(150,300)));
    m_mgr.Обнови();
  }

  проц OnCreateGrid(Объект sender, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateGrid(), info.
            Имя("Test").Caption("Grid").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(300,200)));
    m_mgr.Обнови();
  }

  проц OnCreateHTML(Объект sender, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateHTMLCtrl(), info.
            Имя("Test").Caption("Grid").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(300,200)));
    m_mgr.Обнови();
  }

  проц OnCreateText(Объект sender, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.
            Имя("Test").Caption("Текст Control").
            Float().FloatingPosition(GetStartPosition()));
    m_mgr.Обнови();
  }

  проц OnCreateSizeReport(Объект sender, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("Test").Caption("Client Размер Reporter").
            Float().FloatingPosition(GetStartPosition()));
    m_mgr.Обнови();
  }

  проц OnChangeContentPane(Объект sender, Событие event)
  {
    m_mgr.GetPane("grid_content").Show(event.ИД() == ID_GridContent ? да:нет);
    m_mgr.GetPane("text_content").Show(event.ИД() == ID_TextContent ? да:нет);
    m_mgr.GetPane("tree_content").Show(event.ИД() == ID_TreeContent ? да:нет);
    m_mgr.GetPane("sizereport_content").Show(event.ИД() == ID_SizeReportContent ? да:нет);
    m_mgr.GetPane("html_content").Show(event.ИД() == ID_HTMLContent ? да:нет);
    m_mgr.Обнови();
  }

  TextCtrl CreateTextCtrl()
  {
    сим[] текст;
    static цел n = 0;

    текст = format("This is текст box %d", ++n);

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
    ArrayTreeItemIds items = new ArrayTreeItemIds();


    ImageList imglist = new ImageList(16, 16, да, 2);
    imglist.Добавь(ArtProvider.GetBitmap(ArtID.wxART_FOLDER, ArtClient.wxART_OTHER, Размер(16,16)));
    imglist.Добавь(ArtProvider.GetBitmap(ArtID.wxART_NORMAL_FILE, ArtClient.wxART_OTHER, Размер(16,16)));
    tree.AssignImageList(imglist);

    items.Добавь(tree.AppendItem(root, "Элемент 1", 0));
    items.Добавь(tree.AppendItem(root, "Элемент 2", 0));
    items.Добавь(tree.AppendItem(root, "Элемент 3", 0));
    items.Добавь(tree.AppendItem(root, "Элемент 4", 0));
    items.Добавь(tree.AppendItem(root, "Элемент 5", 0));


    цел i, счёт;
    for (i = 0, счёт = items.Счёт(); i < счёт; ++i)
    {
      TreeItemId ид = items.Элемент(i);
      tree.AppendItem(ид, "Subitem 1", 1);
      tree.AppendItem(ид, "Subitem 2", 1);
      tree.AppendItem(ид, "Subitem 3", 1);
      tree.AppendItem(ид, "Subitem 4", 1);
      tree.AppendItem(ид, "Subitem 5", 1);
    }


    tree.Expand(root);

    return tree;
  }

  SizeReportCtrl CreateSizeReportCtrl(цел ширина = 80, цел высота = 80)
  {
    SizeReportCtrl ctrl = new SizeReportCtrl(this, -1,
                     Окно.wxDefaultPosition,
                     Размер(ширина, высота), m_mgr);
    return ctrl;
  }

  HtmlWindow CreateHTMLCtrl()
  {
    HtmlWindow ctrl = new HtmlWindow(this, -1,
                     Окно.wxDefaultPosition,
                     Размер(400,300));
    ctrl.SetPage(GetIntroText());
    return ctrl;
  }


  сим[] GetIntroText()
  {
    return
      "<html><body>"
      "<h3>Welcome to wxAUI 0.9.2</h3>"
      "<br/><с>Overview</с><br/>"
      "<p>wxAUI is an Advanced User Interface library for the wxWidgets toolkit "
      "that allows developers to create high-quality, cross-platform user "
      "interfaces quickly and easily.</p>"
      "<p><с>Features</с></p>"
      "<p>With wxAUI version 0.9.2, developers can create application frameworks with:</p>"
      "<ul>"
      "<li>Native, dockable floating frames</li>"
      "<li>Perspective saving and loading</li>"
      "<li>Native toolbars incorporating real-time, &quot;spring-loaded&quot; dragging</li>"
      "<li>Customizable floating/docking behavior</li>"
      "<li>Completely customizable look-and-feel</li>"
      "<li>Optional transparent окно effects (while dragging or docking)</li>"
      "</ul>"
      "<p><с>What's new in 0.9.2?</с></p>"
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
      "<p><с>What changed in 0.9.1?</с></p>"
      "<p>The following features/fixes were added in wxAUI 0.9.1:</p>"
      "<ul>"
      "<li>Support for MDI frames</li>"
      "<li>Gradient captions option</li>"
      "<li>Активен/Inactive panes option</li>"
      "<li>Fix for screen artifacts/paint problems</li>"
      "<li>Fix for hiding/showing floated окно problem</li>"
      "<li>Fix for floating pane sizing problem</li>"
      "<li>Fix for drop position problem when dragging around center pane margins</li>"
      "<li>LF-only текст file formatting for source code</li>"
      "</ul>"
      "<p>See README.txt for more information.</p>"
      "</body></html>";
  }

  FrameManager m_mgr;
  сим[][] m_perspectives;
  Меню m_perspectives_menu;
}



// -- SizeReportCtrl --
// (a utility control that always reports it's client size)

class SizeReportCtrl : Control
{
public:

  this(wxWindow родитель, цел ид = -1,
           Точка поз = Окно.wxDefaultPosition,
           Размер size = wxDefaultSize,
           FrameManager mgr = пусто)
  {
    super(родитель, ид, поз, size, wxNO_BORDER);

    m_mgr = mgr;

    EVT_PAINT(&OnPaint);
    EVT_SIZE(&OnSize);
    EVT_ERASE_BACKGROUND(&OnEraseBackground);
  }

private:

  проц OnPaint(Объект sender, Событие evt)
  {
    evt.Пропусти();

    PaintDC dc = new PaintDC(this);
    Размер size = ClientSize;
    сим[] s;
    цел h, w, высота;

    s = format("Размер: %d x %d", size.Ширина, size.Высота);

    dc.SetFont(Шрифт.wxNORMAL_FONT);
    dc.GetTextExtent(s, w, высота);
    высота += 3;
    dc.SetBrush(Кисть.wxWHITE_BRUSH);
    dc.SetPen(Перо.wxWHITE_PEN);
    dc.РисуйПрям(0, 0, size.Ширина, size.Высота);
    dc.SetPen(Перо.wxLIGHT_GREY_PEN);
    dc.РисуйЛинию(0, 0, size.Ширина, size.Высота);
    dc.РисуйЛинию(0, size.Высота, size.Ширина, 0);
    dc.РисуйТекст(s, (size.Ширина-w)/2, ((size.Высота-(высота*5))/2));

    if (m_mgr)
    {
      PaneInfo pi = m_mgr.GetPane(this);

      s = format("Layer: %d", pi.dock_layer);
      dc.GetTextExtent(s, w, h);
      dc.РисуйТекст(s, (size.Ширина-w)/2, ((size.Высота-(высота*5))/2)+(высота*1));

      s = format("Dock: %d Row: %d", pi.dock_direction, pi.dock_row);
      dc.GetTextExtent(s, w, h);
      dc.РисуйТекст(s, (size.Ширина-w)/2, ((size.Высота-(высота*5))/2)+(высота*2));

      s = format("Положение: %d", pi.dock_pos);
      dc.GetTextExtent(s, w, h);
      dc.РисуйТекст(s, (size.Ширина-w)/2, ((size.Высота-(высота*5))/2)+(высота*3));

      s = format("Proportion: %d", pi.dock_proportion);
      dc.GetTextExtent(s, w, h);
      dc.РисуйТекст(s, (size.Ширина-w)/2, ((size.Высота-(высота*5))/2)+(высота*4));
    }
  }

  проц OnEraseBackground(Объект sender, Событие evt)
  {
    // intentionally empty
  }

  проц OnSize(Объект sender, Событие evt)
  {
    Refresh();
  }
private:

  FrameManager m_mgr;
}




class SettingsPanel : Panel
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
    super(родитель, -1, Окно.wxDefaultPosition, wxDefaultSize);

    BoxSizer vert = new BoxSizer(Ориентация.wxVERTICAL);

    //vert.Добавь(1, 1, 1, Stretch.wxEXPAND);

    BoxSizer s1 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_border_size = new SpinCtrl(this, ID_PaneBorderSize, "", Окно.wxDefaultPosition, Размер(50,20));
    s1.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s1.Добавь(new StaticText(this, -1, "Pane Border Размер:"));
    s1.Добавь(m_border_size);
    s1.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s1.SetItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s1, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    BoxSizer s2 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_sash_size = new SpinCtrl(this, ID_SashSize, "", Окно.wxDefaultPosition, Размер(50,20));
    s2.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s2.Добавь(new StaticText(this, -1, "Sash Размер:"));
    s2.Добавь(m_sash_size);
    s2.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s2.SetItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s2, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    BoxSizer s3 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_caption_size = new SpinCtrl(this, ID_CaptionSize, "", Окно.wxDefaultPosition, Размер(50,20));
    s3.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s3.Добавь(new StaticText(this, -1, "Caption Размер:"));
    s3.Добавь(m_caption_size);
    s3.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s3.SetItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s3, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    //vert.Добавь(1, 1, 1, Stretch.wxEXPAND);


    Битмап с = CreateColorBitmap(Цвет.wxBLACK);

    BoxSizer s4 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_background_color = new BitmapButton(this, ID_BackgroundColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s4.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s4.Добавь(new StaticText(this, -1, "Фон Color:"));
    s4.Добавь(m_background_color);
    s4.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s4.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s5 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_sash_color = new BitmapButton(this, ID_SashColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s5.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s5.Добавь(new StaticText(this, -1, "Sash Color:"));
    s5.Добавь(m_sash_color);
    s5.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s5.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s6 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_inactive_caption_color = new BitmapButton(this, ID_InactiveCaptionColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s6.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s6.Добавь(new StaticText(this, -1, "Normal Caption:"));
    s6.Добавь(m_inactive_caption_color);
    s6.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s6.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s7 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_inactive_caption_gradient_color = new BitmapButton(this, ID_InactiveCaptionGradientColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s7.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s7.Добавь(new StaticText(this, -1, "Normal Caption Gradient:"));
    s7.Добавь(m_inactive_caption_gradient_color);
    s7.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s7.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s8 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_inactive_caption_text_color = new BitmapButton(this, ID_InactiveCaptionTextColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s8.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s8.Добавь(new StaticText(this, -1, "Normal Caption Текст:"));
    s8.Добавь(m_inactive_caption_text_color);
    s8.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s8.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s9 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_active_caption_color = new BitmapButton(this, ID_ActiveCaptionColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s9.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s9.Добавь(new StaticText(this, -1, "Активен Caption:"));
    s9.Добавь(m_active_caption_color);
    s9.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s9.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s10 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_active_caption_gradient_color = new BitmapButton(this, ID_ActiveCaptionGradientColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s10.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s10.Добавь(new StaticText(this, -1, "Активен Caption Gradient:"));
    s10.Добавь(m_active_caption_gradient_color);
    s10.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s10.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s11 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_active_caption_text_color = new BitmapButton(this, ID_ActiveCaptionTextColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s11.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s11.Добавь(new StaticText(this, -1, "Активен Caption Текст:"));
    s11.Добавь(m_active_caption_text_color);
    s11.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s11.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s12 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_border_color = new BitmapButton(this, ID_BorderColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s12.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s12.Добавь(new StaticText(this, -1, "Border Color:"));
    s12.Добавь(m_border_color);
    s12.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s12.SetItemMinSize(1, Размер(180, 20));

    BoxSizer s13 = new BoxSizer(Ориентация.wxHORIZONTAL);
    m_gripper_color = new BitmapButton(this, ID_GripperColor, с, Окно.wxDefaultPosition, Размер(50,25));
    s13.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s13.Добавь(new StaticText(this, -1, "Gripper Color:"));
    s13.Добавь(m_gripper_color);
    s13.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s13.SetItemMinSize(1, Размер(180, 20));

    GridSizer grid_sizer = new GridSizer(0, 2, 0, 0);
    grid_sizer.HGap = 5;
    grid_sizer.Добавь(s1);  grid_sizer.Добавь(s4);
    grid_sizer.Добавь(s2);  grid_sizer.Добавь(s5);
    grid_sizer.Добавь(s3);  grid_sizer.Добавь(s13);
    grid_sizer.Добавь(1,1); grid_sizer.Добавь(s12);
    grid_sizer.Добавь(s6);  grid_sizer.Добавь(s9);
    grid_sizer.Добавь(s7);  grid_sizer.Добавь(s10);
    grid_sizer.Добавь(s8);  grid_sizer.Добавь(s11);

    BoxSizer cont_sizer = new BoxSizer(Ориентация.wxVERTICAL);
    cont_sizer.Добавь(grid_sizer, 1, Stretch.wxEXPAND | Direction.wxALL, 5);
    SetSizer(cont_sizer);
    sizer().SetSizeHints(this);

    m_frame = frame;
    m_border_size.Value = frame.GetDockArt().GetMetric(wxPaneDockArtSetting.wxAUI_ART_PANE_BORDER_SIZE);
    m_sash_size.Value = frame.GetDockArt().GetMetric(wxPaneDockArtSetting.wxAUI_ART_SASH_SIZE);
    m_caption_size.Value = frame.GetDockArt().GetMetric(wxPaneDockArtSetting.wxAUI_ART_CAPTION_SIZE);

    UpdateColors();

    EVT_SPINCTRL(ID_PaneBorderSize, &OnPaneBorderSize);
    EVT_SPINCTRL(ID_SashSize, &OnSashSize);
    EVT_SPINCTRL(ID_CaptionSize, &OnCaptionSize);
    EVT_BUTTON(ID_BackgroundColor, &OnSetColor);
    EVT_BUTTON(ID_SashColor, &OnSetColor);
    EVT_BUTTON(ID_InactiveCaptionColor, &OnSetColor);
    EVT_BUTTON(ID_InactiveCaptionGradientColor, &OnSetColor);
    EVT_BUTTON(ID_InactiveCaptionTextColor, &OnSetColor);
    EVT_BUTTON(ID_ActiveCaptionColor, &OnSetColor);
    EVT_BUTTON(ID_ActiveCaptionGradientColor, &OnSetColor);
    EVT_BUTTON(ID_ActiveCaptionTextColor, &OnSetColor);
    EVT_BUTTON(ID_BorderColor, &OnSetColor);
    EVT_BUTTON(ID_GripperColor, &OnSetColor);
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
        рисунок.УстКЗС(x, y, pixcol.Красный(), pixcol.Зелёный(), pixcol.Синий());
      }
    return new Битмап(рисунок);
  }

  проц UpdateColors()
  {
    Цвет bk = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_BACKGROUND_COLOUR);
    m_background_color.BitmapLabel = CreateColorBitmap(bk);

    Цвет cap = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_INACTIVE_CAPTION_COLOUR);
    m_inactive_caption_color.BitmapLabel = CreateColorBitmap(cap);

    Цвет capgrad = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR);
    m_inactive_caption_gradient_color.BitmapLabel = CreateColorBitmap(capgrad);

    Цвет captxt = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR);
    m_inactive_caption_text_color.BitmapLabel = CreateColorBitmap(captxt);

    Цвет acap = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_ACTIVE_CAPTION_COLOUR);
    m_active_caption_color.BitmapLabel = CreateColorBitmap(acap);

    Цвет acapgrad = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR);
    m_active_caption_gradient_color.BitmapLabel = CreateColorBitmap(acapgrad);

    Цвет acaptxt = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR);
    m_active_caption_text_color.BitmapLabel = CreateColorBitmap(acaptxt);

    Цвет sash = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_SASH_COLOUR);
    m_sash_color.BitmapLabel = CreateColorBitmap(sash);

    Цвет border = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_BORDER_COLOUR);
    m_border_color.BitmapLabel = CreateColorBitmap(border);

    Цвет gripper = m_frame.GetDockArt().GetColor(wxPaneDockArtSetting.wxAUI_ART_GRIPPER_COLOUR);
    m_gripper_color.BitmapLabel = CreateColorBitmap(gripper);
  }

  проц OnPaneBorderSize(Объект sender, Событие event)
  {
    m_frame.GetDockArt().SetMetric(wxPaneDockArtSetting.wxAUI_ART_PANE_BORDER_SIZE,
                     m_border_size.Value);
    m_frame.DoUpdate();
  }

  проц OnSashSize(Объект sender, Событие event)
  {
    m_frame.GetDockArt().SetMetric(wxPaneDockArtSetting.wxAUI_ART_SASH_SIZE,
                     m_sash_size.Value);
    m_frame.DoUpdate();
  }

  проц OnCaptionSize(Объект sender, Событие event)
  {
    m_frame.GetDockArt().SetMetric(wxPaneDockArtSetting.wxAUI_ART_CAPTION_SIZE,
                     m_caption_size.Value);
    m_frame.DoUpdate();
  }

  проц OnSetColor(Объект sender, Событие event)
  {
    ColourДиалог dlg = new ColourДиалог(m_frame);
    dlg.Title = "Color Picker";
    if (dlg.ShowModal() != wxID_OK)
      return;

    цел var = 0;
    switch (event.ИД)
    {
      case ID_BackgroundColor:        var = wxPaneDockArtSetting.wxAUI_ART_BACKGROUND_COLOUR; break;
      case ID_SashColor:          var = wxPaneDockArtSetting.wxAUI_ART_SASH_COLOUR; break;
      case ID_InactiveCaptionColor:     var = wxPaneDockArtSetting.wxAUI_ART_INACTIVE_CAPTION_COLOUR; break;
      case ID_InactiveCaptionGradientColor: var = wxPaneDockArtSetting.wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR; break;
      case ID_InactiveCaptionTextColor:   var = wxPaneDockArtSetting.wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR; break;
      case ID_ActiveCaptionColor:       var = wxPaneDockArtSetting.wxAUI_ART_ACTIVE_CAPTION_COLOUR; break;
      case ID_ActiveCaptionGradientColor:   var = wxPaneDockArtSetting.wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR; break;
      case ID_ActiveCaptionTextColor:     var = wxPaneDockArtSetting.wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR; break;
      case ID_BorderColor:          var = wxPaneDockArtSetting.wxAUI_ART_BORDER_COLOUR; break;
      case ID_GripperColor:         var = wxPaneDockArtSetting.wxAUI_ART_GRIPPER_COLOUR; break;
      default: return;
    }

    m_frame.GetDockArt().SetColor(var, dlg.colourData.colour);
    m_frame.DoUpdate();
    UpdateColors();
  }

private:

  MyFrame m_frame;
  SpinCtrl m_border_size;
  SpinCtrl m_sash_size;
  SpinCtrl m_caption_size;
  BitmapButton m_inactive_caption_text_color;
  BitmapButton m_inactive_caption_gradient_color;
  BitmapButton m_inactive_caption_color;
  BitmapButton m_active_caption_text_color;
  BitmapButton m_active_caption_gradient_color;
  BitmapButton m_active_caption_color;
  BitmapButton m_sash_color;
  BitmapButton m_background_color;
  BitmapButton m_border_color;
  BitmapButton m_gripper_color;
}
