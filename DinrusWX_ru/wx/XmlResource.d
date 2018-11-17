//-----------------------------------------------------------------------------
// wxD - XmlResource.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - XmlResource.cs
//
/// The wxXmlResource wrapper class.
//
// Written by Achim Breunig (achim.breunig@web.de)
// (C) 2003 Achim Breunig
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: XmlResource.d,v 1.11 2009/03/13 08:42:11 afb Exp $
//-----------------------------------------------------------------------------

module wx.XmlResource;
public import wx.common;
public import wx.Dialog;

public import wx.Window;

public import wx.Frame;

public import wx.Menu;

public import wx.MenuBar;

public import wx.Panel;

public import wx.ToolBar;

private import stdrus;

public enum XmlResourceФлаги : цел
{
    XRC_USE_LOCALE     = 1,
    XRC_NO_SUBCLASSING = 2
};

//! \cond EXTERN
static extern (C) проц wxXmlResource_InitAllHandlers(ЦелУкз сам);
static extern (C) бул wxXmlResource_Load(ЦелУкз сам, ткст filemask);
static extern (C) бул wxXmlResource_LoadFromByteArray(ЦелУкз сам, ткст filemask, ЦелУкз data, цел length);
static extern (C) ЦелУкз wxXmlResource_LoadDialog(ЦелУкз сам, ЦелУкз родитель, ткст имя);
static extern (C) бул wxXmlResource_LoadDialogDlg(ЦелУкз сам, ЦелУкз dlg, ЦелУкз родитель, ткст имя);
static extern (C) цел wxXmlResource_GetXRCID(ткст str_id);
static extern (C) ЦелУкз wxXmlResource_ctorByFilemask(ткст filemask, цел флаги);
static extern (C) ЦелУкз wxXmlResource_ctor(цел флаги);
static extern (C) бцел wxXmlResource_GetVersion(ЦелУкз сам);
static extern (C) бул wxXmlResource_LoadFrameWithFrame(ЦелУкз сам, ЦелУкз frame, ЦелУкз родитель, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadFrame(ЦелУкз сам, ЦелУкз родитель, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadBitmap(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadIcon(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadMenu(ЦелУкз сам, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadMenuBarWithParent(ЦелУкз сам, ЦелУкз родитель, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadMenuBar(ЦелУкз сам, ткст имя);
static extern (C) бул wxXmlResource_LoadPanelWithPanel(ЦелУкз сам, ЦелУкз panel, ЦелУкз родитель, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadPanel(ЦелУкз сам, ЦелУкз родитель, ткст имя);
static extern (C) ЦелУкз wxXmlResource_LoadToolBar(ЦелУкз сам, ЦелУкз родитель, ткст имя);
static extern (C) цел wxXmlResource_SetФлаги(ЦелУкз сам, цел флаги);
static extern (C) цел wxXmlResource_GetFlags(ЦелУкз сам);
static extern (C) проц wxXmlResource_UpdateResources(ЦелУкз сам);
static extern (C) цел wxXmlResource_CompareVersion(ЦелУкз сам, цел major, цел minor, цел release, цел revision);
static extern (C) бул wxXmlResource_AttachUnknownControl(ЦелУкз сам, ткст имя, ЦелУкз control, ЦелУкз родитель);

//---------------------------------------------------------------------

extern (C)
{
    alias ЦелУкз function(ткст className) XmlSubclassCreate;
}

static extern (C) бул wxXmlSubclassFactory_ctor(XmlSubclassCreate create);
//! \endcond

alias XmlResource wxXmlResource;
public class XmlResource : wxObject
{
    public static XmlResource globalXmlResource = null;

    //---------------------------------------------------------------------

    static this()
    {
        m_create = cast(XmlSubclassCreate)&XmlSubclassCreateCS;
        wxXmlSubclassFactory_ctor(m_create);
    }
    private static проц УстSubclassDefaults() {}

    /+
    // Устs the default assembly/namespace based on the assembly from
    // which this method is called (i.e. your assembly!).
    //
    // Determines these by walking a stack trace. Normally
    // Assembly.GetCallingAssembly should work but in my tests it
    // returned the current assembly in the static constructor above.
    private static проц УстSubclassDefaults()
    {
        ткст my_assembly = Assembly.GetExecutingAssembly().GetName().Имя;
        StackTrace st = new StackTrace();

        for (цел i = 0; i < st.FrameCount; ++i)
        {
            Тип тип = st.GetFrame(i).GetMethod().ReflectedType;
            ткст st_assembly = тип.Assembly.GetName().Имя;
            if (st_assembly != my_assembly)
            {
                _CallerNamespace = тип.Namespace;
                _CallerAssembly = st_assembly;
                stdout.writeLine("Устting sub-class default assembly to {0}, namespace to {1}", _CallerAssembly, _CallerNamespace);
                break;
            }
        }
    }

    // Get/set the assembly used for sub-classing. If this is not set, the
    // assembly of the class that invokes one of the LoadXXX() methods
    // will be used. This property is only used if an assembly is not
    // specified in the XRC XML subclass property via the [assembly]class
    // syntax.
    static проц SubclassAssembly(ткст значение)
    {
        _SubclassAssembly = значение;
    }
    static ткст SubclassAssembly()
    {
        return _SubclassAssembly;
    }
    static ткст _SubclassAssembly;

    // Get/set the namespace that is pre-pended to class names in sub-classing.
    // This is only used if class имя does not have a dot (.) in it. If
    // this is not specified and the class does not already have a namespace
    // specified, the namespace of the class which invoked the LoadXXX() method
    // is used.
    static проц SubclassNamespace(ткст значение)
    {
        _SubclassNamespace = значение;
    }
    static ткст SubclassNamespace()
    {
        return _SubclassNamespace;
    }
    static ткст _SubclassNamespace;

    // Defaults set via LoadXXX() methods
    private static ткст _CallerAssembly;
    private static ткст _CallerNamespace;
    +/

    //---------------------------------------------------------------------

    public this()
    {
        this(XmlResourceФлаги.XRC_USE_LOCALE);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(XmlResourceФлаги флаги)
    {
        this(wxXmlResource_ctor(cast(цел)флаги));
    }

    public this(ткст filemask, XmlResourceФлаги флаги)
    {
        this(wxXmlResource_ctorByFilemask(filemask,cast(цел)флаги));
    }

    //---------------------------------------------------------------------

    public static XmlResource Get()
    {
        if (globalXmlResource is null)
        {
            globalXmlResource = new XmlResource();
        }

        return globalXmlResource;
    }

    //---------------------------------------------------------------------

    public static XmlResource Уст(XmlResource res)
    {
        XmlResource old = globalXmlResource;
        globalXmlResource = res;
        return old;
    }

    //---------------------------------------------------------------------

    public проц InitAllHandlers()
    {
        wxXmlResource_InitAllHandlers(wxobj);
    }

    //---------------------------------------------------------------------

    public бул Load(ткст filemask)
    {
        return wxXmlResource_Load(wxobj,filemask);
    }

    //---------------------------------------------------------------------

    public Dialog LoadDialog(Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadDialog(wxobj,wxObject.SafePtr(родитель),имя);
        if (ptr != ЦелУкз.init)
            return new Dialog(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public бул LoadDialog(Dialog dlg, Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        return wxXmlResource_LoadDialogDlg(wxobj,wxObject.SafePtr(dlg),wxObject.SafePtr(родитель),имя);
    }

    //---------------------------------------------------------------------

    public static цел GetXRCID(ткст str_id)
    {
        return wxXmlResource_GetXRCID(str_id);
    }

    //---------------------------------------------------------------------

    public static цел XRCID(ткст str_id)
    {
        return wxXmlResource_GetXRCID(str_id);
    }

    //---------------------------------------------------------------------

    public цел Version()
    {
        return wxXmlResource_GetVersion(wxobj);
    }

    //---------------------------------------------------------------------

    public бул LoadFrame(Frame frame, Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        return wxXmlResource_LoadFrameWithFrame(wxobj, wxObject.SafePtr(frame), wxObject.SafePtr(родитель), имя);
    }

    //---------------------------------------------------------------------

    public Frame LoadFrame(Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadFrame(wxobj,wxObject.SafePtr(родитель),имя);
        if (ptr != ЦелУкз.init)
            return new Frame(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public Меню LoadMenu(ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadMenu(wxobj, имя);
        if (ptr != ЦелУкз.init)
            return new Меню(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public MenuBar LoadMenuBar(Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadMenuBarWithParent(wxobj, wxObject.SafePtr(родитель), имя);
        if (ptr != ЦелУкз.init)
            return new MenuBar(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public MenuBar LoadMenuBar(ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadMenuBar(wxobj, имя);
        if (ptr != ЦелУкз.init)
            return new MenuBar(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public бул LoadPanel(Panel panel, Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        return wxXmlResource_LoadPanelWithPanel(wxobj, wxObject.SafePtr(panel), wxObject.SafePtr(родитель), имя);
    }

    //---------------------------------------------------------------------

    public Panel LoadPanel(Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadPanel(wxobj, wxObject.SafePtr(родитель), имя);
        if (ptr != ЦелУкз.init)
            return new Panel(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public ТулБар LoadToolBar(Окно родитель, ткст имя)
    {
        УстSubclassDefaults();
        ЦелУкз ptr = wxXmlResource_LoadToolBar(wxobj, wxObject.SafePtr(родитель), имя);
        if (ptr != ЦелУкз.init)
            return new ТулБар(ptr);
        else
            return null;
    }

    //---------------------------------------------------------------------

    public проц Флаги(XmlResourceФлаги значение)
    {
        wxXmlResource_SetФлаги(wxobj, cast(цел)значение);
    }
    public XmlResourceФлаги Флаги()
    {
        return cast(XmlResourceФлаги)wxXmlResource_GetFlags(wxobj);
    }

    //---------------------------------------------------------------------
    /+
    public проц UpdateResources()
    {
        wxXmlResource_UpdateResources(wxobj);
    }
    +/
    //---------------------------------------------------------------------

    public Битмап LoadBitmap(ткст имя)
    {
        return new Битмап(wxXmlResource_LoadBitmap(wxobj, имя));
    }

    //---------------------------------------------------------------------

    public Пиктограмма LoadIcon(ткст имя)
    {
        return new Пиктограмма(wxXmlResource_LoadIcon(wxobj, имя));
    }

    //---------------------------------------------------------------------

    public цел CompareVersion(цел major, цел minor, цел release, цел revision)
    {
        return wxXmlResource_CompareVersion(wxobj, major, minor, release, revision);
    }

    //---------------------------------------------------------------------

    public бул AttachUnknownControl(ткст имя, Окно control)
    {
        return AttachUnknownControl(имя, control, null);
    }

    public бул AttachUnknownControl(ткст имя, Окно control, Окно родитель)
    {
        return wxXmlResource_AttachUnknownControl(wxobj, имя, wxObject.SafePtr(control), wxObject.SafePtr(родитель));
    }

    //---------------------------------------------------------------------

    public static wxObject XRCCTRL(Окно окно, ткст ид, newfunc func)
    {
        return окно.НайдиОкно(XRCID(ид), func);
    }

    public static wxObject GetControl(Окно окно, ткст ид, newfunc func)
    {
        return XRCCTRL(окно, ид, func);
    }
    //---------------------------------------------------------------------
    // XmlResource control subclassing

    private static XmlSubclassCreate m_create; // = cast(XmlSubclassCreate)&XmlSubclassCreateCS;
    //private static ЦелУкз function(ткст className) m_create = &XmlSubclassCreateCS;

    extern(C) private static ЦелУкз XmlSubclassCreateCS(ткст className)
    {
        /+
        ткст имя = className;
        ткст assembly = null;
        // Allow these two formats for for class names:
        //   class
        //   [assembly]class (specify assembly)

        Match m = Regex.Match(имя, "\\[(.+)\\]");
        if (m.Success)
        {
            assembly = m.Result("$1");
            имя = m.Result("$'");
        }
        else
        {
            assembly = _SubclassAssembly;
        }

        // Use caller's assembly?
        if ((assembly == null) || (assembly == ""))
            assembly = _CallerAssembly;

        // Tack on any namespace prefix to the class? Only if the
        // class does not already have a "." in it
        if (имя.IndexOf(".") == -1)
        {
            ткст ns = "";
            // Use caller's namespace?
            if ((_SubclassNamespace == null) || (_SubclassNamespace == ""))
                ns = _CallerNamespace;
            else
                ns = _SubclassNamespace;
            имя = ns + "." + имя;
        }

        try
        {
            stdout.writeLine("Attempting to create " ~ имя ~ " from assembly " ~ assembly);
            //	ObjectHandle handle = Activator.CreateInstance(assembly, имя);

            if (handle === null)
            {
                return ЦелУкз.init;
            }

            wxObject o = cast(wxObject)handle.Unwrap();
            return o.wxobj;
        }
        catch (Exception e)
        {
            stdout.writeLine(e);

            return ЦелУкз.init;
        }
        +/
        return ЦелУкз.init;
    }

}
