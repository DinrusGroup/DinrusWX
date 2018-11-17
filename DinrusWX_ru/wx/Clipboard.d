//-----------------------------------------------------------------------------
// wxD - Clipboard.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// (C) 2005 afb <afb@users.sourceforge.net>
// based on
// wx.NET - Clipboard.cs
//
/// The wxClipboard wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Clipboard.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.Clipboard;
public import wx.common;
public import wx.DataFormat;
public import wx.DataObject;

//! \cond EXTERN
static extern (C) ЦелУкз wxClipboard_ctor();
static extern (C) бул   wxClipboard_Open(ЦелУкз сам);
static extern (C) проц   wxClipboard_Close(ЦелУкз сам);
static extern (C) бул   wxClipboard_IsOpened(ЦелУкз сам);
static extern (C) бул   wxClipboard_AddData(ЦелУкз сам, ЦелУкз data);
static extern (C) бул   wxClipboard_SetData(ЦелУкз сам, ЦелУкз data);
static extern (C) бул   wxClipboard_IsSupported(ЦелУкз сам, ЦелУкз format);
static extern (C) бул   wxClipboard_GetData(ЦелУкз сам, ЦелУкз data);
static extern (C) проц   wxClipboard_Clear(ЦелУкз сам);
static extern (C) бул   wxClipboard_Flush(ЦелУкз сам);
static extern (C) проц   wxClipboard_UsePrimarySelection(ЦелУкз сам, бул primary);
static extern (C) ЦелУкз wxClipboard_Get();
//! \endcond

//-----------------------------------------------------------------------------

alias Clipboard wxClipboard;
public class Clipboard : wxObject
{
    static Clipboard TheClipboard = null;

    // this crashed in GTK+, since it needs a valid context first
    // so it's called by Апп in the ПоИниц() обработчик now
    static проц initialize()
    {
        if(!TheClipboard)
            TheClipboard = new Clipboard(wxClipboard_Get());
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this()
    {
        super(wxClipboard_ctor());
    }

    //-----------------------------------------------------------------------------

    public бул Open()
    {
        return wxClipboard_Open(wxobj);
    }

    public проц Закрой()
    {
        wxClipboard_Close(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул IsOpened()
    {
        return wxClipboard_IsOpened(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул AddData(ОбъектДанные data)
    {
        return wxClipboard_AddData(wxobj, wxObject.SafePtr(data));
    }

    public бул УстData(ОбъектДанные data)
    {
        return wxClipboard_SetData(wxobj, wxObject.SafePtr(data));
    }

    public бул GetData(ОбъектДанные data)
    {
        return wxClipboard_GetData(wxobj, wxObject.SafePtr(data));
    }

    //-----------------------------------------------------------------------------

    public бул IsSupported(ФорматДаты format)
    {
        return wxClipboard_IsSupported(wxobj, wxObject.SafePtr(format));
    }

    //-----------------------------------------------------------------------------

    public проц очисть()
    {
        wxClipboard_Clear(wxobj);
    }

    public бул Flush()
    {
        return wxClipboard_Flush(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  проц UsePrimarySelection(бул primary)
    {
        wxClipboard_UsePrimarySelection(wxobj, primary);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxClipboardLocker_ctor(ЦелУкз clipboard);
static extern (C) проц   wxClipboardLocker_dtor(ЦелУкз сам);
static extern (C) бул   wxClipboardLocker_IsOpen(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

/* re-implement using D */
public scope class ClipboardLocker // not wxObject
{
    public this(Clipboard clipboard = null)
    {
        if (clipboard is null)
        {
            if (Clipboard.TheClipboard is null)
                Clipboard.TheClipboard = new Clipboard(wxClipboard_Get());

            m_clipboard = Clipboard.TheClipboard;
        }
        else
        {
            m_clipboard = clipboard;
        }
        if (m_clipboard)
        {
            m_clipboard.Open();
        }
    }

    public ~this()
    {
        if (m_clipboard)
        {
            m_clipboard.Закрой();
        }
    }

    private Clipboard m_clipboard;
    /*
    		private ЦелУкз wxobj;

    		public this()
    			{ this(null);}

    		public this(Clipboard clipboard)
    			{ wxobj = wxClipboardLocker_ctor(wxObject.SafePtr(clipboard)); }


    		public ~this()
    		{
    			wxClipBoardLocker_dtor(wxobj);
    		}

    		//-----------------------------------------------------------------------------

    		public бул IsOpen() { return wxClipboardLocker_IsOpen(wxobj); }
    */
}
