/// The wxArrayString wrapper class
module wx.ArrayString;
public import wx.common;

//! \cond EXTERN
static extern (C) ЦелУкз wxArrayString_ctor();
static extern (C) проц   wxArrayString_dtor(ЦелУкз сам);
static extern (C) проц   wxArrayString_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxArrayString_Add(ЦелУкз сам, ткст доб);
static extern (C) ЦелУкз wxArrayString_Item(ЦелУкз сам, цел чис);
static extern (C) цел    wxArrayString_GetCount(ЦелУкз сам);
//! \endcond

alias ТкстМассив wxArrayString;
public class ТкстМассив : wxObject
{
    //---------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxArrayString_ctor(), да);
        wxArrayString_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    public ткст[] вМассив()
    {
        цел count = this.Счёт;
        ткст[] tmps = new ткст[count];
        for (цел i = 0; i < count; i++)
            tmps[i] = this.Элемент(i);
        return tmps;
    }

    public ткст Элемент(цел чис)
    {
        return cast(ткст) new wxString(wxArrayString_Item(wxobj, чис), да);
    }

    public проц Добавь(ткст доб)
    {
        wxArrayString_Add(wxobj, доб);
    }

    public цел Счёт()
    {
        return wxArrayString_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxArrayString_dtor(wxobj);
    }
}

