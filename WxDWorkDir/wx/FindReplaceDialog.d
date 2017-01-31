//-----------------------------------------------------------------------------
// wxD - FindReplaceДиалог.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - FindReplaceДиалог.cs
//
/// The wxFindReplaceДиалог wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: FindReplaceДиалог.d,v 1.10 2007/01/28 23:06:36 afb Exp $
//-----------------------------------------------------------------------------

module wx.FindReplaceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.CommandEvent;

		//! \cond EXTERN
        static extern (C) ЦУк wxFindReplaceДиалог_ctor();
        static extern (C) бул   wxFindReplaceДиалог_Create(ЦУк сам, ЦУк родитель, ЦУк данные, ткст title, бцел стиль);

        static extern (C) ЦУк wxFindReplaceДиалог_GetData(ЦУк сам);
        static extern (C) проц   wxFindReplaceДиалог_SetData(ЦУк сам, ЦУк данные);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias FindReplaceДиалог wxFindReplaceДиалог;
    public class FindReplaceДиалог : Диалог
    {
        public const цел wxFR_DOWN       = 1;
        public const цел wxFR_WHOLEWORD  = 2;
        public const цел wxFR_MATCHCASE  = 4;

        public const цел wxFR_REPLACEDIALOG = 1;
        public const цел wxFR_NOUPDOWN      = 2;
        public const цел wxFR_NOMATCHCASE   = 4;
        public const цел wxFR_NOWHOLEWORD   = 8;

        //-----------------------------------------------------------------------------

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { super(wxFindReplaceДиалог_ctor()); }

        public this(Окно родитель, FindReplaceData данные, ткст title, цел стиль = 0)
        {
        	super(wxFindReplaceДиалог_ctor());
            if (!Create(родитель, данные, title, стиль))
            {
                throw new InvalidOperationException("Could not create FindReplaceДиалог");
            }
        }

        public бул Create(Окно родитель, FindReplaceData данные, ткст title, цел стиль = 0)
        {
            return wxFindReplaceДиалог_Create(шхобъ, wxObject.SafePtr(родитель), wxObject.SafePtr(данные), title, cast(бцел)стиль);
        }

        //-----------------------------------------------------------------------------

        public FindReplaceData Data() { return cast(FindReplaceData)FindObject(wxFindReplaceДиалог_GetData(шхобъ), &FindReplaceData.Нов); }
        public проц Data(FindReplaceData значение) { wxFindReplaceДиалог_SetData(шхобъ, wxObject.SafePtr(значение)); } 

        //-----------------------------------------------------------------------------

		public проц Find_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_FIND, ИД, значение, this); }
		public проц Find_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц FindNext_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_FIND_NEXT, ИД, значение, this); }
		public проц FindNext_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц FindReplace_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_FIND_REPLACE, ИД, значение, this); }
		public проц FindReplace_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц FindReplaceAll_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_FIND_REPLACE_ALL, ИД, значение, this); }
		public проц FindReplaceAll_Remove(EventListener значение) { RemoveHandler(значение, this); }

		public проц FindClose_Add(EventListener значение) { AddCommandListener(Событие.wxEVT_COMMAND_FIND_CLOSE, ИД, значение, this); }
		public проц FindClose_Remove(EventListener значение) { RemoveHandler(значение, this); }
    }

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxFindДиалогEvent_ctor(цел commandType, цел ид);

        static extern (C) цел    wxFindДиалогEvent_GetFlags(ЦУк сам);
        static extern (C) проц   wxFindДиалогEvent_SetFlags(ЦУк сам, цел флаги);

        static extern (C) ЦУк wxFindДиалогEvent_GetFindString(ЦУк сам);
        static extern (C) проц   wxFindДиалогEvent_SetFindString(ЦУк сам, ткст str);

        static extern (C) ЦУк wxFindДиалогEvent_GetReplaceString(ЦУк сам);
        static extern (C) проц   wxFindДиалогEvent_SetReplaceString(ЦУк сам, ткст str);

        static extern (C) ЦУк wxFindДиалогEvent_GetДиалог(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias FindДиалогEvent wxFindДиалогEvent;
    public class FindДиалогEvent : CommandEvent
    {
	static this()
	{
			wxEVT_COMMAND_FIND = wxEvent_EVT_COMMAND_FIND();
			wxEVT_COMMAND_FIND_NEXT = wxEvent_EVT_COMMAND_FIND_NEXT();
			wxEVT_COMMAND_FIND_REPLACE = wxEvent_EVT_COMMAND_FIND_REPLACE();
			wxEVT_COMMAND_FIND_REPLACE_ALL = wxEvent_EVT_COMMAND_FIND_REPLACE_ALL();
			wxEVT_COMMAND_FIND_CLOSE = wxEvent_EVT_COMMAND_FIND_CLOSE();

			ДобавьТипСоб(wxEVT_COMMAND_FIND,	&FindДиалогEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_NEXT,	&FindДиалогEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_REPLACE,	&FindДиалогEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_REPLACE_ALL,	&FindДиалогEvent.Нов);
			ДобавьТипСоб(wxEVT_COMMAND_FIND_CLOSE,	&FindДиалогEvent.Нов);
	
	}

        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(цел commandType, цел ид)
            { super(wxFindДиалогEvent_ctor(commandType, ид)); }

	public static Событие Нов(ЦУк ptr) { return new FindДиалогEvent(ptr); }

        //-----------------------------------------------------------------------------

        public цел Флаги() { return wxFindДиалогEvent_GetFlags(шхобъ); }
        public проц Флаги(цел значение) { wxFindДиалогEvent_SetFlags(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст FindString() { return cast(ткст) new wxString(wxFindДиалогEvent_GetFindString(шхобъ), да); }
        public проц FindString(ткст значение) { wxFindДиалогEvent_SetFindString(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст ReplaceString() { return cast(ткст) new wxString(wxFindДиалогEvent_GetReplaceString(шхобъ), да); }
        public проц ReplaceString(ткст значение) { wxFindДиалогEvent_SetReplaceString(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public FindReplaceДиалог Диалог() { return cast(FindReplaceДиалог)FindObject(wxFindДиалогEvent_GetДиалог(шхобъ)); }
    }

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxFindReplaceData_ctor(бцел флаги);

        static extern (C) ЦУк wxFindReplaceData_GetFindString(ЦУк сам);
        static extern (C) проц   wxFindReplaceData_SetFindString(ЦУк сам, ткст str);

        static extern (C) цел    wxFindReplaceData_GetFlags(ЦУк сам);
        static extern (C) проц   wxFindReplaceData_SetFlags(ЦУк сам, цел флаги);

        static extern (C) проц   wxFindReplaceData_SetReplaceString(ЦУк сам, ткст str);
        static extern (C) ЦУк wxFindReplaceData_GetReplaceString(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias FindReplaceData wxFindReplaceData;
    public class FindReplaceData : wxObject
    {
        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this()
            { this(0); }

        public this(цел флаги)
            { super(wxFindReplaceData_ctor(cast(бцел)флаги));}

        //-----------------------------------------------------------------------------

        public ткст FindString() { return cast(ткст) new wxString(wxFindReplaceData_GetFindString(шхобъ), да); }
        public проц FindString(ткст значение) { wxFindReplaceData_SetFindString(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public ткст ReplaceString() { return cast(ткст) new wxString(wxFindReplaceData_GetReplaceString(шхобъ), да); }
        public проц ReplaceString(ткст значение) { wxFindReplaceData_SetReplaceString(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Флаги() { return wxFindReplaceData_GetFlags(шхобъ); }
        public проц Флаги(цел значение) { wxFindReplaceData_SetFlags(шхобъ, значение); }
        
        public static wxObject Нов(ЦУк ptr) { return new FindReplaceData(ptr); }
    }

