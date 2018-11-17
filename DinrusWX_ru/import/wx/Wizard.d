module wx.Wizard;
public import wx.common;
public import wx.Dialog;
public import wx.Panel;
//public import wx.NotifyEvent;
public import wx.WizardPage;

		//! \cond EXTERN
		static extern (C) IntPtr wxWizard_ctor(IntPtr родитель, цел ид, ткст title, IntPtr битмап, inout Точка поз, цел стиль);
		static extern (C) бул   wxWizard_RunWizard(IntPtr сам, IntPtr firstPage);
		static extern (C) проц   wxWizard_SetPageSize(IntPtr сам, inout Размер разм);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias Wizard wxWizard;
	public class Wizard : Dialog
	{
		public this(IntPtr wxobj) ;
		public this(Окно родитель, цел ид = wxID_ANY, ткст title = "", Битмап битмап = Битмап.wxNullBitmap, Точка поз = вхДефПоз, цел стиль = wxDEFAULT_DIALOG_STYLE);
		public бул RunWizard(WizardPage firstPage);
		public проц PageSize(Размер значение) ;
	}

		//! \cond EXTERN
		static extern (C) IntPtr wxWizardEvent_ctor(цел тип,цел ид, бул направление,IntPtr page);
		static extern (C) бул   wxWizardEvent_GetDirection(IntPtr сам);
		static extern (C) IntPtr wxWizardEvent_GetPage(IntPtr сам);

		static extern (C) EventType wxEvent_WIZARD_PAGE_CHANGED();
		static extern (C) EventType wxEvent_WIZARD_PAGE_CHANGING();
		static extern (C) EventType wxEvent_WIZARD_CANCEL();
		static extern (C) EventType wxEvent_WIZARD_HELP();
		static extern (C) EventType wxEvent_WIZARD_FINISHED();
		//! \endcond

/+
	alias WizardEvent wxWizardEvent;
	public class WizardEvent : NotifyEvent
	{
		static EventType wxEVT_WIZARD_PAGE_CHANGED;
		static EventType wxEVT_WIZARD_PAGE_CHANGING;
		static EventType wxEVT_WIZARD_CANCEL;
		static EventType wxEVT_WIZARD_HELP;
		static EventType wxEVT_WIZARD_FINISHED;
	
		static this()
		{
			wxEVT_WIZARD_PAGE_CHANGED  = wxEvent_WIZARD_PAGE_CHANGED();
			wxEVT_WIZARD_PAGE_CHANGING = wxEvent_WIZARD_PAGE_CHANGING();
			wxEVT_WIZARD_CANCEL   = wxEvent_WIZARD_CANCEL();
			wxEVT_WIZARD_HELP     = wxEvent_WIZARD_HELP();
			wxEVT_WIZARD_FINISHED = wxEvent_WIZARD_FINISHED();
			
			ДобавьТипСоб(wxEVT_WIZARD_PAGE_CHANGED,  &WizardEvent.Нов);
			ДобавьТипСоб(wxEVT_WIZARD_PAGE_CHANGING, &WizardEvent.Нов);
			ДобавьТипСоб(wxEVT_WIZARD_CANCEL,   &WizardEvent.Нов);
			ДобавьТипСоб(wxEVT_WIZARD_HELP,     &WizardEvent.Нов);
			ДобавьТипСоб(wxEVT_WIZARD_FINISHED, &WizardEvent.Нов);
		}
	
		this(IntPtr ptr)
			{ super(ptr); }
	
		this(EventType тип = wxEVT_NULL, цел ид = wxID_ANY, бул направление = да, WizardPage page = null)
		{
			this(wxWizardEvent_ctor(тип,ид,направление,wxObject.SafePtr(page)));
		}

		static Событие Нов(IntPtr ptr) { return new WizardEvent(ptr); }

		бул Direction()
		{
			return wxWizardEvent_GetDirection(wxobj);
		}
		WizardPage Page()
		{
			return cast(WizardPage)НайдиОбъект(wxWizardEvent_GetPage(wxobj),&WizardPage.Нов);
		}
	}
+/
