//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/индекс.php/Hello_World
//-----------------------------------------------------------------------------

import wx.wx;

 /**
  * This class shows a окно containing a statusbar with the текст 'Hello World'
  */
public class HelloWorldApp : wxApp
{
	public override бул ПриИниц()
	{
        wxFrame frame = new wxFrame(пусто, wxID_ANY, "Hello wxWidgets World");
        frame.CreateStatusBar();
        frame.StatusText = "Hello World";
        frame.Show(да);
        ТопОкно = frame;
        return да;
	}
}

цел main()
{
	HelloWorldApp прил = new HelloWorldApp();
	прил.Пуск();
	return 0;
}
