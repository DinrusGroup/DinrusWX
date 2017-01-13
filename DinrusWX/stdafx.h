// stdafx.h: включаемый файл дл€ стандартных системных включаемых файлов
// или включаемых файлов дл€ конкретного проекта, которые часто используютс€, но
// не часто измен€ютс€
//

#pragma once

#include "targetver.h"

#define WIN32_LEAN_AND_MEAN             // »сключите редко используемые компоненты из заголовков Windows
// ‘айлы заголовков Windows:
#include <windows.h>
#include <stdio.h>

#define _CRT_SECURE_NO_WARNINGS

#pragma warning( push )
#pragma warning (disable : 4996)

// TODO: ”становите здесь ссылки на дополнительные заголовки, требующиес€ дл€ программы
#include <wx/config.h>
#include <wx/wx.h>
#include "common.h"
#include "local_events.h"
#include <wx/button.h>
#include <wx/msw/button.h>
#include <wx/bmpbuttn.h>
#include <wx/bitmap.h>
#include <wx/msw/bitmap.h>
#include <wx/image.h>
#include <wx/artprov.h>
#include <wx/control.h>
#include <wx/msw/control.h>
#include <wx/combobox.h>
#include <wx/msw/combobox.h>
#include <wx/colordlg.h>
#include <wx/msw/colordlg.h>
#include <wx/clipbrd.h>
#include <wx/msw/clipbrd.h>
#include <wx/textctrl.h>
#include <wx/msw/textctrl.h>
#include <wx/choicdlg.h>
#include <wx/choice.h>
#include <wx/caret.h>
#include <wx/calctrl.h>
#include <wx/generic/calctrlg.h>
#pragma warning( pop )