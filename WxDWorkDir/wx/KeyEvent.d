//-----------------------------------------------------------------------------
// wxD - СобКлавиши.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - СобКлавиши.cs
//
/// The wxKeyEvent wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: СобКлавиши.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.KeyEvent;
public import wx.common;
public import wx.Event;

		//! \cond EXTERN
        static extern (C) ЦУк wxKeyEvent_ctor(цел тип);

        static extern (C) бул   wxKeyEvent_ControlDown(ЦУк сам);
        static extern (C) бул   wxKeyEvent_ShiftDown(ЦУк сам);
        static extern (C) бул   wxKeyEvent_AltDown(ЦУк сам);
        static extern (C) бул   wxKeyEvent_MetaDown(ЦУк сам);

        static extern (C) бцел   wxKeyEvent_GetRawKeyCode(ЦУк сам);
        static extern (C) цел    wxKeyEvent_GetKeyCode(ЦУк сам);

        static extern (C) бцел   wxKeyEvent_GetRawKeyFlags(ЦУк сам);
        static extern (C) бул   wxKeyEvent_HasModifiers(ЦУк сам);

        static extern (C) проц   wxKeyEvent_GetPosition(ЦУк сам, inout Точка pt);
        static extern (C) цел    wxKeyEvent_GetX(ЦУк сам);
        static extern (C) цел    wxKeyEvent_GetY(ЦУк сам);
	
	static extern (C) бул   wxKeyEvent_CmdDown(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias СобКлавиши wxKeyEvent;
    public class СобКлавиши : Событие
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this(ТипСобытия тип = wxEVT_NULL)
            { this(wxKeyEvent_ctor(тип)); }

        //-----------------------------------------------------------------------------

        public бул НажатКонтрол() { return wxKeyEvent_ControlDown(шхобъ); }

        public бул НажатМета() { return wxKeyEvent_MetaDown(шхобъ); }

        public бул НажатШифт() { return wxKeyEvent_ShiftDown(шхобъ); }

        public бул НажатАльт() { return wxKeyEvent_AltDown(шхобъ); }

        //-----------------------------------------------------------------------------

        /*public КодКлавиши КодКлавиши
        {
            get { return (КодКлавиши)wxKeyEvent_GetKeyCode(шхобъ); }
        }*/
	
	public цел КодКлавиши() { return wxKeyEvent_GetKeyCode(шхобъ); }

        public цел RawKeyCode() { return wxKeyEvent_GetRawKeyCode(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел RawKeyFlags() { return wxKeyEvent_GetRawKeyFlags(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул ЕстьМодификаторы() { return wxKeyEvent_HasModifiers(шхобъ); }

        //-----------------------------------------------------------------------------

        public Точка Положение() {
                Точка pt;
                wxKeyEvent_GetPosition(шхобъ, pt);
                return pt;
            }

        //-----------------------------------------------------------------------------

        public цел X() { return wxKeyEvent_GetX(шхобъ); }

        public цел Y() { return wxKeyEvent_GetY(шхобъ); }

        //-----------------------------------------------------------------------------
	
	public бул CmdDown() { return wxKeyEvent_CmdDown(шхобъ); }

		private static Событие Нов(ЦУк объ) { return new СобКлавиши(объ); }

		static this()
		{
			ДобавьТипСоб(wxEVT_KEY_DOWN,                        &СобКлавиши.Нов);
			ДобавьТипСоб(wxEVT_KEY_UP,                          &СобКлавиши.Нов);
			ДобавьТипСоб(wxEVT_CHAR,                            &СобКлавиши.Нов);
			ДобавьТипСоб(wxEVT_CHAR_HOOK,                       &СобКлавиши.Нов);
		}
    }
