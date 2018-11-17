module wx.Dialog;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
		static extern (C) IntPtr wxDialog_ctor();
		static extern (C) проц   wxDialog_dtor(IntPtr сам);

		static extern (C) проц   wxDialog_SetReturnCode(IntPtr сам, цел returnCode);
		static extern (C) цел    wxDialog_GetReturnCode(IntPtr сам);

		static extern (C) IntPtr wxDialog_GetTitle(IntPtr сам);
		static extern (C) проц   wxDialog_SetTitle(IntPtr сам, ткст title);

		static extern (C) бул   wxDialog_Create(IntPtr сам, IntPtr родитель, цел ид, ткст title, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);

		static extern (C) проц   wxDialog_EndModal(IntPtr сам, цел retCode);

		static extern (C) бул   wxDialog_IsModal(IntPtr сам);
		//static extern (C) проц   wxDialog_SetModal(IntPtr сам, бул modal);

		static extern (C) проц   wxDialog_SetIcon(IntPtr сам, IntPtr пиктограмма);
		static extern (C) проц   wxDialog_SetIcons(IntPtr сам, IntPtr icons);

		static extern (C) цел    wxDialog_ShowModal(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias Dialog wxDialog;
	/// A dialog box is a окно with a title bar and sometimes a
	/// system меню, which can be moved around the screen. It can contain
	/// controls and other windows and is usually used to allow the user
	/// to make some choice or to answer a question.
	public class Dialog : Окно
	{
		enum {
		wxCENTER		= 0x00000001,
		wxCENTRE		= 0x00000001,
		wxYES			= 0x00000002,
		wxOK			= 0x00000004,
		wxNO			= 0x00000008,
		wxCANCEL		= 0x00000010,
		wxYES_NO		= (wxYES | wxNO),

		wxYES_DEFAULT		= 0x00000000,
		wxNO_DEFAULT		= 0x00000080,

		wxICON_EXCLAMATION 	= 0x00000100,
		wxICON_HAND		= 0x00000200,
		wxICON_WARNING	= wxICON_EXCLAMATION,
		wxICON_ERROR		= wxICON_HAND,
		wxICON_QUESTION	= 0x00000400,
		wxICON_INFORMATION	= 0x00000800,
		wxICON_STOP		= wxICON_HAND,
		wxICON_ASTERISK	= wxICON_INFORMATION,
		wxICON_MASK		= (0x00000100|0x00000200|0x00000400|0x00000800),

		wxFORWARD		= 0x00001000,
		wxBACKWARD		= 0x00002000,
		wxRESET		= 0x00004000,
		wxHELP		= 0x00008000,
		wxMORE 		= 0x00010000,
		wxSETUP		= 0x00020000,
		}

		//---------------------------------------------------------------------
		const ткст wxDialogNameStr="dialog";

		public this(IntPtr wxobj);
		public this();
		public this(Окно родитель, цел ид, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_DIALOG_STYLE, ткст имя=wxDialogNameStr);
		public this(Окно родитель, ткст title, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=wxDEFAULT_DIALOG_STYLE, ткст имя=wxDialogNameStr);
		public бул Создай(Окно окно, цел ид, ткст title, inout Точка поз,
						   inout Размер разм, цел стиль, ткст имя);
		public цел ReturnCode() ;
		public проц ReturnCode(цел значение);
		public override ткст Титул() ;
		public override проц Титул(ткст значение) ;
		public проц EndModal(цел retCode);
		public проц УстIcon(Пиктограмма пиктограмма);
		//public проц УстIcons(IconBundle icons);
		public  цел ShowModal();
		//deprecated public проц Modal(бул значение) ;
		public бул Modal() ;
	}
