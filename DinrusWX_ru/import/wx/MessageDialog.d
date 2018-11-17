
module wx.MessageDialog;
public import wx.common;
public import wx.Dialog;

	// The MessageDialog class implements the interface for wxWidgets' 
	// wxMessageDialog class and wxMessageBox.

		//! \cond EXTERN

		// MessageBox function
		static extern (C) цел    wxMsgBox(IntPtr родитель, ткст msg, ткст cap, бцел стиль, inout Точка поз);

		// Message dialog methods
		static extern (C) IntPtr wxMessageDialog_ctor(IntPtr родитель, ткст message, ткст caption, бцел стиль, inout Точка поз);
		static extern (C) цел    wxMessageDialog_ShowModal(IntPtr сам);

		//! \endcond

	alias MessageDialog wxMessageDialog;
	public class MessageDialog : Dialog
	{
		public const ткст wxMessageBoxCaptionStr = "Message";
		//---------------------------------------------------------------------
	
		private this(IntPtr wxobj) ;
		public this(Окно родитель, ткст msg, ткст caption=wxMessageBoxCaptionStr, цел стиль=wxOK | wxCENTRE, Точка поз = вхДефПоз);
		public override цел ShowModal();

	}

		static extern(C) цел wxMessageBox_func(ткст msg, ткст cap, цел стиль, IntPtr родитель,цел x, цел y);

		static цел MessageBox(ткст msg,ткст caption=MessageDialog.wxMessageBoxCaptionStr,цел стиль=Dialog.wxOK | Dialog.wxCENTRE , Окно родитель=null, цел x=-1, цел y=-1);		
		static цел MessageBox(Окно родитель,ткст msg,ткст caption=MessageDialog.wxMessageBoxCaptionStr,цел стиль=Dialog.wxOK | Dialog.wxCENTRE , Точка поз=Dialog.вхДефПоз);