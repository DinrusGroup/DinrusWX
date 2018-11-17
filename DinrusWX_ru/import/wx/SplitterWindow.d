module wx.SplitterWindow;
public import wx.common;
public import wx.Window;

	public enum SplitMode
	{
		wxSPLIT_HORIZONTAL	= 1,
		wxSPLIT_VERTICAL
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias проц function(SplitterWindow объ, цел x, цел y) Virtual_OnDoubleClickSash;
		alias проц function(SplitterWindow объ, IntPtr removed) Virtual_OnUnsplit;
		alias бул function(SplitterWindow объ, цел newSashPosition) Virtual_OnSashPositionChange;
		}
		
		static extern (C) IntPtr wxSplitWnd_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) проц   wxSplitWnd_RegisterVirtual(IntPtr сам, SplitterWindow объ, Virtual_OnDoubleClickSash onDoubleClickSash, Virtual_OnUnsplit onUnsplit, Virtual_OnSashPositionChange onSashPositionChange);
		static extern (C) проц   wxSplitWnd_OnDoubleClickSash(IntPtr сам, цел x, цел y);
		static extern (C) проц   wxSplitWnd_OnUnsplit(IntPtr сам, IntPtr removed);
		static extern (C) бул   wxSplitWnd_OnSashPositionChange(IntPtr сам, цел newSashPosition);
		static extern (C) цел    wxSplitWnd_GetSplitMode(IntPtr сам);
		static extern (C) бул   wxSplitWnd_IsSplit(IntPtr сам);
		static extern (C) бул   wxSplitWnd_SplitHorizontally(IntPtr сам, IntPtr wnd1, IntPtr wnd2, цел sashPos);
		static extern (C) бул   wxSplitWnd_SplitVertically(IntPtr сам, IntPtr wnd1, IntPtr wnd2, цел sashPos);
		static extern (C) бул   wxSplitWnd_Unsplit(IntPtr сам, IntPtr toRemove);
		static extern (C) проц   wxSplitWnd_SetSashPosition(IntPtr сам, цел position, бул redraw);
		static extern (C) цел    wxSplitWnd_GetSashPosition(IntPtr сам);
		
		static extern (C) цел    wxSplitWnd_GetMinimumPaneSize(IntPtr сам);
		static extern (C) IntPtr wxSplitWnd_GetWindow1(IntPtr сам);
		static extern (C) IntPtr wxSplitWnd_GetWindow2(IntPtr сам);
		static extern (C) проц   wxSplitWnd_Initialize(IntPtr сам, IntPtr окно);
		static extern (C) бул   wxSplitWnd_ReplaceWindow(IntPtr сам, IntPtr winOld, IntPtr winNew);
		static extern (C) проц   wxSplitWnd_SetMinimumPaneSize(IntPtr сам, цел paneSize);
		static extern (C) проц   wxSplitWnd_SetSplitMode(IntPtr сам, цел mode);
		static extern (C) проц   wxSplitWnd_UpdateSize(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias SplitterWindow wxSplitterWindow;
	public class SplitterWindow : Окно
	{
		enum {
			wxSP_3DBORDER		= 0x00000200,
			wxSP_LIVE_UPDATE	= 0x00000080,
			wxSP_3DSASH		= 0x00000100,
			wxSP_3D			= (wxSP_3DBORDER | wxSP_3DSASH),
		}
		
		//---------------------------------------------------------------------

		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxSP_3D, ткст имя="splitter");
		public this(Окно родитель, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxSP_3D, ткст имя="splitter");
		static extern(C) private проц staticOnDoubleClickSash(SplitterWindow объ, цел x, цел y);
		public  проц OnDoubleClickSash(цел x, цел y);
		static extern(C) private проц staticDoOnUnsplit(SplitterWindow объ, IntPtr removed);
		public  проц OnUnsplit(Окно removed);
		static extern(C) private бул staticOnSashPositionChange(SplitterWindow объ, цел newSashPosition);
		public  бул OnSashPositionChange(цел newSashPosition);
		public бул IsSplit() ;
		public бул SplitHorizontally(Окно wnd1, Окно wnd2, цел sashPos=0);
		public SplitMode splitMode() ;
		public проц splitMode(SplitMode значение);
		public бул SplitVertically(Окно wnd1, Окно wnd2, цел sashPos=0);
		public бул Unsplit(Окно toRemove=null);
		public проц SashPosition(цел значение);
		public цел SashPosition();
		public проц УстSashPosition(цел position, бул redraw=да);
		public цел MinimumPaneSize();
		public проц MinimumPaneSize(цел значение) ;
		public static wxObject myNew(IntPtr ptr) ;
		public Окно Window1() ;
		public Окно Window2();
		public проц Инициализируй(Окно окно);
		public бул ReplaceWindow(Окно winOld, Окно winNew);
		public проц UpdateSize();
	}
