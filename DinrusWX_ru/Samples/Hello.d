//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/index.php/Hello_World
//-----------------------------------------------------------------------------

import wx.wx;

 /**
  * This class shows a окно containing a statusbar with the текст 'Hello World'
  */
public class HelloWorldApp : wxApp
{
	public override бул ПоИниц()
	{
        wxFrame frame = new wxFrame(null, wxID_ANY, "Hello wxWidgets World");
        frame.CreateStatusBar();
        frame.StatusText = "Hello World";
        frame.Покажи(да);
        ТопОкно = frame;
        return да;
	}
}

цел main()
{
	HelloWorldApp app = new HelloWorldApp();
	app.Пуск();
	return 0;
}
