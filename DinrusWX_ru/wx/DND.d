//-----------------------------------------------------------------------------
// wxD - Dnd.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Dnd.cs
//
/// The wxDND wrapper classes.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 by Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DND.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.DND;
public import wx.common;
public import wx.DataObject;
public import wx.Window;

public enum Drag
{
    wxDrag_CopyOnly    = 0,
    wxDrag_AllowMove   = 1,
    wxDrag_DefaultMove = 3
}

//---------------------------------------------------------------------

public enum DragResult
{
    wxDragError,
    wxDragNone,
    wxDragCopy,
    wxDragMove,
    wxDragLink,
    wxDragCancel
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias цел function(DropSource объ, цел флаги) Virtual_DoDragDrop;
}

static extern (C) ЦелУкз wxDropSource_Win_ctor(ЦелУкз win);
static extern (C) ЦелУкз wxDropSource_DataObject_ctor(ЦелУкз dataObject, ЦелУкз win);
static extern (C) проц wxDropSource_dtor(ЦелУкз сам);
static extern (C) проц wxDropSource_RegisterVirtual(ЦелУкз сам, DropSource объ, Virtual_DoDragDrop doDragDrop);
static extern (C) цел wxDropSource_DoDragDrop(ЦелУкз сам, цел флаги);
static extern (C) проц wxDropSource_SetData(ЦелУкз сам, ЦелУкз dataObject);
//! \endcond

//---------------------------------------------------------------------

alias DropSource wxDropSource;
public class DropSource : wxObject
{
    protected ОбъектДанные m_dataObject = null;

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this(Окно win = null)
    {
        this(wxDropSource_Win_ctor(wxObject.SafePtr(win)), да);
        m_dataObject = null;

        wxDropSource_RegisterVirtual( wxobj, this, &staticDoDoDragDrop );
    }

    public this(ОбъектДанные dataObject, Окно win = null)
    {
        this(wxDropSource_DataObject_ctor(wxObject.SafePtr(dataObject), wxObject.SafePtr(win)), да);
        m_dataObject = dataObject;

        wxDropSource_RegisterVirtual( wxobj, this, &staticDoDoDragDrop );
    }

    //---------------------------------------------------------------------
    override protected проц dtor()
    {
        wxDropSource_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    static extern (C) private цел staticDoDoDragDrop(DropSource объ,цел флаги)
    {
        return cast(цел)объ.DoDragDrop(флаги);
    }

    public  DragResult DoDragDrop(цел флаги)
    {
        return cast(DragResult)wxDropSource_DoDragDrop(wxobj, флаги);
    }

    //---------------------------------------------------------------------

    public ОбъектДанные dataObject()
    {
        return m_dataObject;
    }
    public проц dataObject(ОбъектДанные значение)
    {
        m_dataObject = значение;
        wxDropSource_SetData(wxobj, wxObject.SafePtr(значение));
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnDragOver;
    alias бул function(МишеньСброса объ, цел x, цел y) Virtual_OnDrop;
    alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnData3;
    alias бул function(МишеньСброса объ) Virtual_GetData;
    alias проц function(МишеньСброса объ) Virtual_OnLeave;
    alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnEnter;
}
//! \endcond

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxDropTarget_ctor(ЦелУкз dataObject);
static extern (C) проц wxDropTarget_dtor(ЦелУкз сам);
static extern (C) проц wxDropTarget_RegisterVirtual(ЦелУкз сам, МишеньСброса объ, Virtual_OnDragOver onDragOver, Virtual_OnDrop onDrop, Virtual_OnData3 onData, Virtual_GetData getData, Virtual_OnLeave onLeave, Virtual_OnEnter onEnter);
static extern (C) проц   wxDropTarget_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxDropTarget_SetDataObject(ЦелУкз сам, ЦелУкз dataObject);
static extern (C) цел wxDropTarget_OnEnter(ЦелУкз сам, цел x, цел y, цел def);
static extern (C) цел wxDropTarget_OnDragOver(ЦелУкз сам, цел x, цел y, цел def);
static extern (C) проц   wxDropTarget_OnLeave(ЦелУкз сам);
static extern (C) бул wxDropTarget_OnDrop(ЦелУкз сам, цел x, цел y);
static extern (C) бул wxDropTarget_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

public abstract class МишеньСброса : wxObject
{
    protected ОбъектДанные m_dataObject = null;

    public this(ОбъектДанные dataObject = null)
    {
        this(wxDropTarget_ctor(wxObject.SafePtr(dataObject)), да);
        m_dataObject = dataObject;

        wxDropTarget_RegisterVirtual( wxobj, this,
                                      &staticDoOnDragOver,
                                      &staticOnDrop,
                                      &staticDoOnData,
                                      &staticGetData,
                                      &staticOnLeave,
                                      &staticDoOnEnter);

        wxDropTarget_RegisterDisposable(wxobj, &VirtualDispose);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDropTarget_dtor(wxobj);
    }

    //---------------------------------------------------------------------

    static extern (C) private цел staticDoOnDragOver(МишеньСброса объ, цел x, цел y, цел def)
    {
        return cast(цел)объ.OnDragOver(x, y, cast(DragResult)def);
    }
    public  DragResult OnDragOver(цел x, цел y, DragResult def)
    {
        return cast(DragResult)wxDropTarget_OnDragOver(wxobj, x, y, cast(цел)def);
    }

    //---------------------------------------------------------------------

    static extern (C) private бул staticOnDrop(МишеньСброса объ, цел x, цел y)
    {
        return объ.OnDrop(x,y);
    }
    public  бул OnDrop(цел x, цел y)
    {
        return wxDropTarget_OnDrop(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    static extern (C) private цел staticDoOnData(МишеньСброса объ, цел x, цел y, цел def)
    {
        return cast(цел)объ.OnData(x, y, cast(DragResult) def);
    }
    public abstract DragResult OnData(цел x, цел y, DragResult def);

    //---------------------------------------------------------------------

    static extern (C) private бул staticGetData(МишеньСброса объ)
    {
        return объ.GetData();
    }
    public  бул GetData()
    {
        return wxDropTarget_GetData(wxobj);
    }

    //---------------------------------------------------------------------

    static extern (C) private цел staticDoOnEnter(МишеньСброса объ, цел x, цел y, цел def)
    {
        return cast(цел)объ.OnEnter(x, y, cast(DragResult) def);
    }
    public  DragResult OnEnter(цел x, цел y, DragResult def)
    {
        return cast(DragResult)wxDropTarget_OnEnter(wxobj, x, y, cast(цел)def);
    }

    //---------------------------------------------------------------------

    static extern (C) private проц staticOnLeave(МишеньСброса объ)
    {
        return объ.OnLeave();
    }
    public  проц OnLeave()
    {
        wxDropTarget_OnLeave(wxobj);
    }

    //---------------------------------------------------------------------

    public ОбъектДанные dataObject()
    {
        return m_dataObject;
    }
    public проц dataObject(ОбъектДанные значение)
    {
        m_dataObject = значение;
        wxDropTarget_SetDataObject(wxobj, wxObject.SafePtr(значение));
    }

    //	public static wxObject Нов(ЦелУкз ptr) { return new МишеньСброса(ptr); }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) бул wxTextDropTarget_OnDrop(ЦелУкз сам, цел x, цел y);
static extern (C) бул wxTextDropTarget_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

public abstract class TextDropTarget : МишеньСброса
{
    public this()
    {
        super(new TextDataObject());
    }

    public abstract бул OnDropText(цел x, цел y, ткст текст);

    //---------------------------------------------------------------------

    public override DragResult OnData(цел x, цел y, DragResult def)
    {
        if (!GetData())
            return DragResult.wxDragNone;

        TextDataObject dobj = cast(TextDataObject)m_dataObject;

        return OnDropText(x, y, dobj.Text) ? def : DragResult.wxDragNone;
    }

    //---------------------------------------------------------------------

    public override бул OnDrop(цел x, цел y)
    {
        return wxTextDropTarget_OnDrop(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public override бул GetData()
    {
        return wxTextDropTarget_GetData(wxobj);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) бул wxFileDropTarget_OnDrop(ЦелУкз сам, цел x, цел y);
static extern (C) бул wxFileDropTarget_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

public abstract class FileDropTarget : МишеньСброса
{
    public this()
    {
        super(new FileDataObject());
    }

    public abstract бул OnDropFiles(цел x, цел y, ткст[] filenames);

    //---------------------------------------------------------------------

    public override DragResult OnData(цел x, цел y, DragResult def)
    {
        if ( !GetData() )
            return DragResult.wxDragNone;

        FileDataObject dobj = cast(FileDataObject)m_dataObject;

        return OnDropFiles(x, y, dobj.Filenames) ? def : DragResult.wxDragNone;
    }

    //---------------------------------------------------------------------

    public override бул OnDrop(цел x, цел y)
    {
        return wxFileDropTarget_OnDrop(wxobj, x, y);
    }

    //---------------------------------------------------------------------

    public override бул GetData()
    {
        return wxFileDropTarget_GetData(wxobj);
    }
}

