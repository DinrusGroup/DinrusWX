//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/index.php/Hello_World
//-----------------------------------------------------------------------------

import io.Stdout, wx.wx;

 /**
  * Класс показывает окно, в строке состояния которого написан текст 'Hello World'
  */
public class ПриветМир : Прил
{
	public override бул ПриИниц()
	{
        Фрейм фрейм = new Фрейм(пусто, wxID_ANY, "Hello wxWidgets World");
        //фрейм.CreateStatusBar();
       // фрейм.StatusText = "Hello World";
        фрейм.ShowFullScreen(да);
       // ТопОкно = фрейм;
        return да;
	}
}


цел main()
{

Стдвыв("Проверка работы Стдвыв").нс;
ПриветМир прил = new ПриветМир();

Стдвыв(прил.ИмяПроизводителя()).нс;

	
	прил.Пуск();
	return 0;
}
