
module wx.FindReplaceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.CommandEvent;

		//! \cond EXTERN
        static extern (C) IntPtr wxFindReplaceDialog_ctor();
        static extern (C) бул   wxFindReplaceDialog_Create(IntPtr сам, IntPtr родитель, IntPtr data, ткст title, бцел стиль);

        static extern (C) IntPtr wxFindReplaceDialog_GetData(IntPtr сам);
        static extern (C) проц   wxFindReplaceDialog_SetData(IntPtr сам, IntPtr data);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias FindReplaceDialog wxFindReplaceDialog;
    public class FindReplaceDialog : Dialog
    {
        public const цел wxFR_DOWN       = 1;
        public const цел wxFR_WHOLEWORD  = 2;
        public const цел wxFR_MATCHCASE  = 4;

        public const цел wxFR_REPLACEDIALOG = 1;
        public const цел wxFR_NOUPDOWN      = 2;
        public const цел wxFR_NOMATCHCASE   = 4;
        public const цел wxFR_NOWHOLEWORD   = 8;

        //-----------------------------------------------------------------------------

        public this(IntPtr wxobj) ;
        public this();
        public this(Окно родитель, FindReplaceData data, ткст title, цел стиль = 0);
        public бул Создай(Окно родитель, FindReplaceData data, ткст title, цел стиль = 0);
        public FindReplaceData Data() ;
        public проц Data(FindReplaceData значение);
		public проц Find_Add(ДатчикСобытий значение) ;
		public проц Find_Remove(ДатчикСобытий значение) ;
		public проц FindNext_Add(ДатчикСобытий значение) ;
		public проц FindNext_Remove(ДатчикСобытий значение) ;
		public проц FindReplace_Add(ДатчикСобытий значение) ;
		public проц FindReplace_Remove(ДатчикСобытий значение) ;
		public проц FindReplaceAll_Add(ДатчикСобытий значение) ;
		public проц FindReplaceAll_Remove(ДатчикСобытий значение) ;
		public проц FindClose_Add(ДатчикСобытий значение) ;
		public проц FindClose_Remove(ДатчикСобытий значение);
    }

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxFindDialogEvent_ctor(цел типКоманды, цел ид);

        static extern (C) цел    wxFindDialogEvent_GetFlags(IntPtr сам);
        static extern (C) проц   wxFindDialogEvent_SetФлаги(IntPtr сам, цел флаги);

        static extern (C) IntPtr wxFindDialogEvent_GetFindString(IntPtr сам);
        static extern (C) проц   wxFindDialogEvent_SetFindString(IntPtr сам, ткст стр);

        static extern (C) IntPtr wxFindDialogEvent_GetReplaceString(IntPtr сам);
        static extern (C) проц   wxFindDialogEvent_SetReplaceString(IntPtr сам, ткст стр);

        static extern (C) IntPtr wxFindDialogEvent_GetDialog(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias FindDialogEvent wxFindDialogEvent;
    public class FindDialogEvent : СобытиеКоманда
    {
	static this()
	{
			wxEVT_COMMAND_FIND = wxEvent_EVT_COMMAND_FIND();
			wxEVT_COMMAND_FIND_NEXT = wxEvent_EVT_COMMAND_FIND_NEXT();
			wxEVT_COMMAND_FIND_REPLACE = wxEvent_EVT_COMMAND_FIND_REPLACE();
			wxEVT_COMMAND_FIND_REPLACE_ALL = wxEvent_EVT_COMMAND_FIND_REPLACE_ALL();
			wxEVT_COMMAND_FIND_CLOSE = wxEvent_EVT_COMMAND_FIND_CLOSE();

			ДобавьТипСоб(wxEVT_COMMAND_FIND,	&FindDialogEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_NEXT,	&FindDialogEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_REPLACE,	&FindDialogEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_REPLACE_ALL,	&FindDialogEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_CLOSE,	&FindDialogEvent.Нов);
	
	}

        public this(IntPtr wxobj);
        public this(цел типКоманды, цел ид);
    	public static Событие Нов(IntPtr ptr) ;
        public цел Флаги();
        public проц Флаги(цел значение);
        public ткст FindString();
        public проц FindString(ткст значение) ;
        public ткст ReplaceString();
        public проц ReplaceString(ткст значение);
        public FindReplaceDialog Dialog() ;
    }

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) IntPtr wxFindReplaceData_ctor(бцел флаги);

        static extern (C) IntPtr wxFindReplaceData_GetFindString(IntPtr сам);
        static extern (C) проц   wxFindReplaceData_SetFindString(IntPtr сам, ткст стр);

        static extern (C) цел    wxFindReplaceData_GetFlags(IntPtr сам);
        static extern (C) проц   wxFindReplaceData_SetФлаги(IntPtr сам, цел флаги);

        static extern (C) проц   wxFindReplaceData_SetReplaceString(IntPtr сам, ткст стр);
        static extern (C) IntPtr wxFindReplaceData_GetReplaceString(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias FindReplaceData wxFindReplaceData;
    public class FindReplaceData : wxObject
    {
        public this(IntPtr wxobj);
        public this();
        public this(цел флаги);
        public ткст FindString();
        public проц FindString(ткст значение) ;
        public ткст ReplaceString();
        public проц ReplaceString(ткст значение) ;
        public цел Флаги() ;
        public проц Флаги(цел значение);
        public static wxObject Нов(IntPtr ptr) ;
    }

