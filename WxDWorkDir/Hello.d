//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/индекс.php/Hello_World
//-----------------------------------------------------------------------------

import io.Stdout, wx.wx;

 /**
  * This class shows a окно containing a statusbar with the текст 'Hello World'
  */
public class HelloWorldApp : Прил
{
	public override бул ПриИниц()
	{
        wxFrame frame = new wxFrame(пусто, wxID_ANY, "Hello wxWidgets World");
        //frame.CreateStatusBar();
       // frame.StatusText = "Hello World";
        frame.Show(да);
       // ТопОкно = frame;
        return да;
	}
}


цел main()
{

Стдвыв("Проверка работы Стдвыв").нс;
HelloWorldApp прил = new HelloWorldApp();

Стдвыв(прил.ИмяПроизводителя()).нс;

	
	прил.Пуск();
	return 0;
}
