/////////////////////////////////////////////////////////////////////////////
// Имя:        tbtest.cpp
// Purpose:     wxTaskBarIcon demo
// Author:      Julian Smart
// Modified by: afb, ported to wxD
// Created:     01/02/97
// RCS-ИД:      $Ид: TaskBar.d,v 1.1 2007/09/08 09:30:28 afb Exp $
// Copyright:   (c)
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

import wx.wx;

// Declare two frames
MyDialog   dialog = пусто;

проц main()
{
	MyApp прил = new MyApp();
	прил.Пуск();
}

// Define a new application
class MyApp: wxApp
{
public:

бул ПриИниц()
{
    // Create the main frame окно
    dialog = new MyDialog(пусто, wxID_ANY, "wxTaskBarIcon Test Dialog", Dialog.wxDefaultPosition, wxSize(365, 290));

    dialog.Show(да);

    return да;
}

}

class MyDialog: wxDialog
{
public:

this(wxWindow родитель, цел ид, ткст title,
    wxPoint поз, wxSize size, цел windowStyle = wxDEFAULT_DIALOG_STYLE)
{
    super(родитель, ид, title, поз, size, windowStyle);

    Init();

    EVT_BUTTON(MenuIDs.wxID_OK, &OnOK);
    EVT_BUTTON(MenuIDs.wxID_EXIT, &ПриВыходе);
    EVT_CLOSE(&OnCloseWindow);
}

~this()
{
    delete m_taskBarIcon;
}

проц OnOK(Объект sender, Событие event)
{
    Show(нет);
}

проц ПриВыходе(Объект sender, Событие event)
{
    Закрой(да);
}

проц OnCloseWindow(Объект sender, Событие event)
{
    Разрушь();
}

проц Init()
{
  cast(проц)new wxStaticText(this, wxID_ANY, "Press 'Hide me' to hide me, Exit to quit.",
                         wxPoint(10, 20));

  cast(проц)new wxStaticText(this, wxID_ANY, "Double-click on the taskbar иконка to show me again.",
                         wxPoint(10, 40));

  cast(проц)new wxButton(this, MenuIDs.wxID_EXIT, "Exit", wxPoint(185, 230), wxSize(80, 25));
  (new wxButton(this, wxID_OK, "Hide me", wxPoint(100, 230), wxSize(80, 25))).SetDefault();
  Centre(Ориентация.wxBOTH);
   
  m_taskBarIcon = new MyTaskBarIcon();
  if (!m_taskBarIcon.SetIcon(new Icon("../Samples/TaskBar/mondrian.png"), "wxTaskBarIcon Sample"))
        MessageBox("Could not set иконка.");
}

protected:
    MyTaskBarIcon   m_taskBarIcon;

}

enum {
    PU_RESTORE = 10001,
    PU_NEW_ICON,
    PU_OLD_ICON,
    PU_EXIT,
    PU_CHECKMARK,
    PU_SUB1,
    PU_SUB2,
    PU_SUBMAIN
}


class MyTaskBarIcon : wxTaskBarIcon
{
public:
    this(wxTaskBarIconType iconType = wxTaskBarIconType.DEFAULT_TYPE)
    {
    super(iconType);

    EVT_MENU(PU_RESTORE, &OnMenuRestore);
    EVT_MENU(PU_EXIT,    &OnMenuExit);
    EVT_MENU(PU_NEW_ICON,&OnMenuSetNewIcon);
    EVT_MENU(PU_OLD_ICON,&OnMenuSetOldIcon);
    EVT_MENU(PU_CHECKMARK,&OnMenuCheckmark);
    EVT_UPDATE_UI(PU_CHECKMARK,&OnMenuUICheckmark);
    EVT_TASKBAR_LEFT_DCLICK  (&OnLeftButtonDClick);
    EVT_MENU(PU_SUB1, &OnMenuSub);
    EVT_MENU(PU_SUB2, &OnMenuSub);
    }


проц OnMenuRestore(Объект sender, Событие event)
{
    dialog.Show(да);
}

проц OnMenuExit(Объект sender, Событие event)
{
    dialog.Закрой(да);
}

static бул check = да;

проц OnMenuCheckmark(Объект sender, Событие event)
{
       check =!check;
}

проц OnMenuUICheckmark(Объект sender, Событие event)
{
       (cast(UpdateUIEvent)event).Check( check );
}

проц OnMenuSetNewIcon(Объект sender, Событие event)
{
    wxIcon иконка = new Icon("../Samples/TaskBar/smile.png");

    if (!SetIcon(иконка, "wxTaskBarIcon Sample - a different иконка"))
        MessageBox("Could not set new иконка.");
}

проц OnMenuSetOldIcon(Объект sender, Событие event)
{
    if (IsIconInstalled())
    {
        RemoveIcon();
    }
    else
    {
        MessageBox("wxTaskBarIcon Sample - иконка already is the old version");
    }
}

проц OnMenuSub(Объект sender, Событие event)
{
    MessageBox("You clicked on a submenu!");
}

// Overridables
wxMenu CreatePopupMenu()
{
    // Try creating menus different ways
    // TODO: Probably try calling SetBitmap with some XPMs here
    wxMenu меню = new wxMenu;
    меню.Append(PU_RESTORE, "&Restore TBTest");
    меню.AppendSeparator();
    меню.Append(PU_OLD_ICON, "&Restore Old Icon");    
    меню.Append(PU_NEW_ICON, "&Установи Нов Icon");
    меню.AppendSeparator();
    меню.Append(PU_CHECKMARK, "Checkmark","", ItemKind.wxITEM_CHECK);
    меню.AppendSeparator();
    wxMenu submenu = new wxMenu;
    submenu.Append(PU_SUB1, "One submenu");
    submenu.AppendSeparator();
    submenu.Append(PU_SUB2, "Another submenu");
    меню.Append(PU_SUBMAIN, "Submenu", submenu);
version(__WXMAC__) {} else { /*Mac has built-in quit меню*/
    меню.AppendSeparator();
    меню.Append(PU_EXIT,    "E&xit");
}
    return меню;
}

проц OnLeftButtonDClick(Объект sender, Событие event)
{
    dialog.Show(да);
}

}

