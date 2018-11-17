module wx.XmlResource;
public import wx.common;
public import wx.Dialog;
public import wx.Window;
public import wx.Frame;
public import wx.Menu;
public import wx.MenuBar;
public import wx.Panel;
public import wx.ToolBar;

	public enum XmlResourceФлаги : цел
	{
		XRC_USE_LOCALE     = 1,
		XRC_NO_SUBCLASSING = 2
	};

		//! \cond EXTERN
		static extern (C) проц wxXmlResource_InitAllHandlers(IntPtr сам);
		static extern (C) бул wxXmlResource_Load(IntPtr сам, ткст filemask);
		static extern (C) бул wxXmlResource_LoadFromByteArray(IntPtr сам, ткст filemask, IntPtr data, цел length);
		static extern (C) IntPtr wxXmlResource_LoadDialog(IntPtr сам, IntPtr родитель, ткст имя);
		static extern (C) бул wxXmlResource_LoadDialogDlg(IntPtr сам, IntPtr dlg, IntPtr родитель, ткст имя);
		static extern (C) цел wxXmlResource_GetXRCID(ткст str_id);
		static extern (C) IntPtr wxXmlResource_ctorByFilemask(ткст filemask, цел флаги);
		static extern (C) IntPtr wxXmlResource_ctor(цел флаги);
		static extern (C) бцел wxXmlResource_GetVersion(IntPtr сам);
		static extern (C) бул wxXmlResource_LoadFrameWithFrame(IntPtr сам, IntPtr frame, IntPtr родитель, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadFrame(IntPtr сам, IntPtr родитель, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadBitmap(IntPtr сам, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadIcon(IntPtr сам, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadMenu(IntPtr сам, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadMenuBarWithParent(IntPtr сам, IntPtr родитель, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadMenuBar(IntPtr сам, ткст имя);
		static extern (C) бул wxXmlResource_LoadPanelWithPanel(IntPtr сам, IntPtr panel, IntPtr родитель, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadPanel(IntPtr сам, IntPtr родитель, ткст имя);
		static extern (C) IntPtr wxXmlResource_LoadToolBar(IntPtr сам, IntPtr родитель, ткст имя);
		static extern (C) цел wxXmlResource_SetФлаги(IntPtr сам, цел флаги);
		static extern (C) цел wxXmlResource_GetFlags(IntPtr сам);
		static extern (C) проц wxXmlResource_UpdateResources(IntPtr сам);
		static extern (C) цел wxXmlResource_CompareVersion(IntPtr сам, цел major, цел minor, цел release, цел revision);
		static extern (C) бул wxXmlResource_AttachUnknownControl(IntPtr сам, ткст имя, IntPtr control, IntPtr родитель);

		//---------------------------------------------------------------------

		extern (C) {
		alias IntPtr function(ткст className) XmlSubclassCreate;
		}

		static extern (C) бул wxXmlSubclassFactory_ctor(XmlSubclassCreate create);
		//! \endcond

	alias XmlResource wxXmlResource;
	public class XmlResource : wxObject
	{
		public static XmlResource globalXmlResource = null;

		//---------------------------------------------------------------------

		static this();
		private static проц УстSubclassDefaults() ;

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
		static проц SubclassAssembly(ткст значение) { _SubclassAssembly = значение; }
		static ткст SubclassAssembly() { return _SubclassAssembly; }
		static ткст _SubclassAssembly;

		// Get/set the namespace that is pre-pended to class names in sub-classing.
		// This is only used if class имя does not have a dot (.) in it. If
		// this is not specified and the class does not already have a namespace
		// specified, the namespace of the class which invoked the LoadXXX() method
		// is used.
		static проц SubclassNamespace(ткст значение) { _SubclassNamespace = значение; }
		static ткст SubclassNamespace() { return _SubclassNamespace; }
		static ткст _SubclassNamespace;

		// Defaults set via LoadXXX() methods
		private static ткст _CallerAssembly;
		private static ткст _CallerNamespace;
+/

		//---------------------------------------------------------------------

		public this();
		public this(IntPtr wxobj);
		public this(XmlResourceФлаги флаги);
		public this(ткст filemask, XmlResourceФлаги флаги);
		public static XmlResource Get();
		public static XmlResource Уст(XmlResource res);
		public проц InitAllHandlers();
		public бул Load(ткст filemask);
		public Dialog LoadDialog(Окно родитель, ткст имя);
		public бул LoadDialog(Dialog dlg, Окно родитель, ткст имя);
		public static цел GetXRCID(ткст str_id);
		public static цел XRCID(ткст str_id);
		public цел Version() ;
		public бул LoadFrame(Frame frame, Окно родитель, ткст имя);
		public Frame LoadFrame(Окно родитель, ткст имя);
		public Меню LoadMenu(ткст имя);
		public MenuBar LoadMenuBar(Окно родитель, ткст имя);
		public MenuBar LoadMenuBar(ткст имя);
		public бул LoadPanel(Panel panel, Окно родитель, ткст имя);
		public Panel LoadPanel(Окно родитель, ткст имя);
		public ToolBar LoadToolBar(Окно родитель, ткст имя);
		public проц Флаги(XmlResourceФлаги значение);
		public XmlResourceФлаги Флаги();
		//public проц UpdateResources();
		public Битмап LoadBitmap(ткст имя);
		public Пиктограмма LoadIcon(ткст имя);
		public цел CompareVersion(цел major, цел minor, цел release, цел revision);
		public бул AttachUnknownControl(ткст имя, Окно control);
		public бул AttachUnknownControl(ткст имя, Окно control, Окно родитель);
		public static wxObject XRCCTRL(Окно окно, ткст ид, newfunc func);
		//---------------------------------------------------------------------
		// XmlResource control subclassing

		private static XmlSubclassCreate m_create; // = cast(XmlSubclassCreate)&XmlSubclassCreateCS;
		//private static IntPtr function(ткст className) m_create = &XmlSubclassCreateCS;

		extern(C) private static IntPtr XmlSubclassCreateCS(ткст className);

	}
