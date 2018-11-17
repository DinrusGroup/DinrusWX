/// The wxArrayInt wrapper class
module wx.ArrayInt;
public import wx.common;

//! \cond EXTERN
static extern (C) ЦелУкз wxArrayInt_ctor();
static extern (C) проц   wxArrayInt_dtor(ЦелУкз сам);
static extern (C) проц   wxArrayInt_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
static extern (C) проц   wxArrayInt_Add(ЦелУкз сам, цел доб);
static extern (C) цел    wxArrayInt_Item(ЦелУкз сам, цел чис);
static extern (C) цел    wxArrayInt_GetCount(ЦелУкз сам);
//! \endcond

alias ЦелМассив wxArrayInt;
public class ЦелМассив : wxObject
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
        this(wxArrayInt_ctor(), да);
        wxArrayInt_RegisterDisposable(wxobj, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    public цел[] вМассив()
    {
        цел count = this.Счёт;
        цел[] tmpi = new цел[count];
        for (цел i = 0; i < count; i++)
            tmpi[i] = this.Элемент(i);
        return tmpi;
    }

    public проц Добавь(цел доб)
    {
        wxArrayInt_Add(wxobj, доб);
    }

    public цел Элемент(цел чис)
    {
        return wxArrayInt_Item(wxobj, чис);
    }

    public цел Счёт()
    {
        return wxArrayInt_GetCount(wxobj);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxArrayInt_dtor(wxobj);
    }
}

