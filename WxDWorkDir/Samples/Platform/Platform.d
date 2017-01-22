version (Tango)
{
import tango.io.Console;

сим[] FORMAT(сим[] str, ...) { return "Tango"; }
проц PRINT(сим[] str) { Cout(str).newline; }
}
else // Phobos
{
private import std.stdio;
private import std.ткст;

alias format FORMAT;
alias writefln PRINT;
}

import wx.wx;

public class MyFrame : wxFrame
{
	public this(ткст title)
	{
		super(title, wxDefaultPosition, wxDefaultSize);

		цел p, major, minor;
		ткст platform;
		
		p = wxGetOsVersion(major, minor);
		if (p == OS_WINDOWS_9X || p == OS_WINDOWS_NT)
			platform = "Windows";
		else if (p == OS_MAC_OS || p == OS_DARWIN)
			platform = "Macintosh";
		else if (p == OS_LINUX)
			platform = "GNU/Linux";
		else if (p == OS_FREEBSD)
			platform = "FreeBSD";
		else
			platform = "???";

		CreateStatusBar();
		SetStatusText(FORMAT("%s-%0x%s%0x", platform, major,".",minor));

		wxStaticText текст = new wxStaticText(this, wxGetOsDescription()
			~ " " ~ (UNICODE ? "Unicode" : (ANSI ? "ANSI" : "Unknown")),
			wxDefaultPosition, wxDefaultSize, Alignment.wxALIGN_CENTRE);
  	}
}

class MyApp : wxApp
{
	public override бул ПриИниц()
	{
       MyFrame frame = new MyFrame("wxPlatform");
       frame.Show(да);
       return да;
	}
}

цел main()
{
	version(__WXMSW__)
		PRINT("__WXMSW__");
	version(__WXGTK__)
		PRINT("__WXGTK__");
	version(__WXMAC__)
		PRINT("__WXMAC__");
	version(__WXX11__)
		PRINT("__WXX11__");

	MyApp прил = new MyApp();
	прил.Пуск();
	return 0;
}
