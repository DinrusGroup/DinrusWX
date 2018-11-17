module wx.WizardPageSimple;
public import wx.WizardPage;
public import wx.Wizard;

		//! \cond EXTERN
		static extern (C) IntPtr wxWizardPageSimple_ctor(IntPtr родитель, IntPtr prev, IntPtr next, IntPtr битмап, ткст resource);
		static extern (C) проц   wxWizardPageSimple_Chain(IntPtr first, IntPtr second);
		//! \endcond

		//---------------------------------------------------------------------

	alias WizardPageSimple wxWizardPageSimple;
	public class WizardPageSimple : WizardPage
	{
		public this(Wizard родитель, WizardPage prev = null, WizardPage next = null, Битмап битмап = Битмап.wxNullBitmap, ткст resource = null);
		public this(IntPtr wxobj) ;
		public static проц Chain(WizardPageSimple first, WizardPageSimple second);
	}

