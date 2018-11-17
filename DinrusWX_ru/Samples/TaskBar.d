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
MyDialog   dialog = null;

проц main()
{
	MyApp app = new MyApp();
	app.Пуск();
}

// Define a new application
class MyApp: wxApp
{
public:

бул ПоИниц()
{
    // Создай the main frame окно
    dialog = new MyDialog(null, wxID_ANY, "wxTaskBarIcon Test Dialog", Dialog.вхДефПоз, wxSize(365, 290));

    dialog.Покажи(да);

    return да;
}

}

class MyDialog: wxDialog
{
public:

this(wxWindow родитель, цел ид, ткст title,
    wxPoint поз, wxSize Размер, цел windowStyle = wxDEFAULT_DIALOG_STYLE)
{
    super(родитель, ид, title, поз, Размер, windowStyle);

    Init();

    EVT_BUTTON(MenuIDs.wxID_OK, &OnOK);
    EVT_BUTTON(MenuIDs.wxID_EXIT, &ПоВыходу);
    EVT_CLOSE(&OnCloseWindow);
}

~this()
{
    delete m_taskBarIcon;
}

проц OnOK(Объект отправитель, Событие event)
{
    Покажи(false);
}

проц ПоВыходу(Объект отправитель, Событие event)
{
    Закрой(да);
}

проц OnCloseWindow(Объект отправитель, Событие event)
{
    Разрушь();
}

проц Init()
{
  cast(проц)new wxStaticText(this, wxID_ANY, "Press 'Спрячь me' to hide me, Exit to quit.",
                         wxPoint(10, 20));

  cast(проц)new wxStaticText(this, wxID_ANY, "Double-click on the taskbar пиктограмма to покажи me again.",
                         wxPoint(10, 40));

  cast(проц)new wxButton(this, MenuIDs.wxID_EXIT, "Exit", wxPoint(185, 230), wxSize(80, 25));
  (new wxButton(this, wxID_OK, "Спрячь me", wxPoint(100, 230), wxSize(80, 25))).УстДеф();
  Центр(Ориентация.wxBOTH);
   
  m_taskBarIcon = new MyTaskBarIcon();
  if (!m_taskBarIcon.УстIcon(new Пиктограмма("./data/mondrian.png"), "wxTaskBarIcon Sample"))
        MessageBox("Could not set пиктограмма.");
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
    EVT_MENU(PU_NEW_ICON,&OnMenuУстNewIcon);
    EVT_MENU(PU_OLD_ICON,&OnMenuУстOldIcon);
    EVT_MENU(PU_CHECKMARK,&OnMenuCheckmark);
    EVT_UPDATE_UI(PU_CHECKMARK,&OnMenuUICheckmark);
    EVT_TASKBAR_LEFT_DCLICK  (&OnLeftButtonDClick);
    EVT_MENU(PU_SUB1, &OnMenuSub);
    EVT_MENU(PU_SUB2, &OnMenuSub);
    }


проц OnMenuRestore(Объект отправитель, Событие event)
{
    dialog.Покажи(да);
}

проц OnMenuExit(Объект отправитель, Событие event)
{
    dialog.Закрой(да);
}

static бул check = да;

проц OnMenuCheckmark(Объект отправитель, Событие event)
{
       check =!check;
}

проц OnMenuUICheckmark(Объект отправитель, Событие event)
{
       (cast(UpdateUIEvent)event).Check( check );
}

проц OnMenuУстNewIcon(Объект отправитель, Событие event)
{
    wxIcon пиктограмма = new Пиктограмма("./data/smile.png");

    if (!УстIcon(пиктограмма, "wxTaskBarIcon Sample - a different пиктограмма"))
        MessageBox("Could not set new пиктограмма.");
}

проц OnMenuУстOldIcon(Объект отправитель, Событие event)
{
    if (IsIconInstalled())
    {
        RemoveIcon();
    }
    else
    {
        MessageBox("wxTaskBarIcon Sample - пиктограмма already is the old version");
    }
}

проц OnMenuSub(Объект отправитель, Событие event)
{
    MessageBox("You clicked on a submenu!");
}

// Overridables
wxMenu CreatePopupMenu()
{
    // Try creating menus different ways
    // TODO: Probably try calling УстBitmap with some XPMs here
    wxMenu меню = new wxMenu;
    меню.Append(PU_RESTORE, "&Restore TBTest");
    меню.AppendSeparator();
    меню.Append(PU_OLD_ICON, "&Restore Old Пиктограмма");    
    меню.Append(PU_NEW_ICON, "&Уст Нов Пиктограмма");
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

проц OnLeftButtonDClick(Объект отправитель, Событие event)
{
    dialog.Покажи(да);
}

}

