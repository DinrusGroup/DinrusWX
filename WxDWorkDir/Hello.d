//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/index.php/Hello_World
//-----------------------------------------------------------------------------

import io.Stdout, wx.wx;

 /**
  * This class shows a window containing a statusbar with the text 'Hello World'
  */
public class HelloWorldApp : App
{
	public override bool OnInit()
	{
        wxFrame frame = new wxFrame(null, wxID_ANY, "Hello wxWidgets World");
        //frame.CreateStatusBar();
       // frame.StatusText = "Hello World";
        frame.Show(true);
       // TopWindow = frame;
        return true;
	}
}


int main()
{

Стдвыв("Проверка работы Стдвыв").нс;
HelloWorldApp app = new HelloWorldApp();

Стдвыв(app.VendorName()).нс;

	
	app.Run();
	return 0;
}
