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

//! \cond STD
version (Tango)
{
}
version(Phobos)
{
private import std.stream;
private import std.regexp;
}

version(Dinrus)
{
import stdrus;
}
//! \endcond

	public enum XmlResourceFlags : цел
	{
		XRC_USE_LOCALE     = 1,
		XRC_NO_SUBCLASSING = 2
	};

		//! \cond EXTERN
		static extern (C) проц wxXmlResource_InitAllHandlers(ЦУк сам);
		static extern (C) бул wxXmlResource_Load(ЦУк сам, ткст filemask);
		static extern (C) бул wxXmlResource_LoadFromByteArray(ЦУк сам, ткст filemask, ЦУк данные, цел length);
		static extern (C) ЦУк wxXmlResource_LoadDialog(ЦУк сам, ЦУк родитель, ткст имя);
		static extern (C) бул wxXmlResource_LoadDialogDlg(ЦУк сам, ЦУк dlg, ЦУк родитель, ткст имя);
		static extern (C) цел wxXmlResource_GetXRCID(ткст str_id);
		static extern (C) ЦУк wxXmlResource_ctorByFilemask(ткст filemask, цел флаги);
		static extern (C) ЦУк wxXmlResource_ctor(цел флаги);
		static extern (C) бцел wxXmlResource_GetVersion(ЦУк сам);
		static extern (C) бул wxXmlResource_LoadFrameWithFrame(ЦУк сам, ЦУк frame, ЦУк родитель, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadFrame(ЦУк сам, ЦУк родитель, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadBitmap(ЦУк сам, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadIcon(ЦУк сам, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadMenu(ЦУк сам, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadMenuBarWithParent(ЦУк сам, ЦУк родитель, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadMenuBar(ЦУк сам, ткст имя);
		static extern (C) бул wxXmlResource_LoadPanelWithPanel(ЦУк сам, ЦУк panel, ЦУк родитель, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadPanel(ЦУк сам, ЦУк родитель, ткст имя);
		static extern (C) ЦУк wxXmlResource_LoadToolBar(ЦУк сам, ЦУк родитель, ткст имя);
		static extern (C) цел wxXmlResource_SetFlags(ЦУк сам, цел флаги);
		static extern (C) цел wxXmlResource_GetFlags(ЦУк сам);
		static extern (C) проц wxXmlResource_UpdateResources(ЦУк сам);
		static extern (C) цел wxXmlResource_CompareVersion(ЦУк сам, цел major, цел minor, цел release, цел revision);
		static extern (C) бул wxXmlResource_AttachUnknownControl(ЦУк сам, ткст имя, ЦУк control, ЦУк родитель);

		//---------------------------------------------------------------------

		extern (C) {
		alias ЦУк function(ткст className) XmlSubclassCreate;
		}

		static extern (C) бул wxXmlSubclassFactory_ctor(XmlSubclassCreate create);
		//! \endcond

	alias XmlResource wxXmlResource;
	public class XmlResource : wxObject
	{
		public static XmlResource globalXmlResource = пусто;
	
		//---------------------------------------------------------------------
    
		static this()
		{
			m_create = cast(XmlSubclassCreate)&XmlSubclassCreateCS;
			wxXmlSubclassFactory_ctor(m_create);
		}
		private static проц SetSubclassDefaults() {}

/+
		// Sets the default assembly/namespace based on the assembly from
		// which this method is called (i.e. your assembly!).
		//
		// Determines these by walking a stack trace. Normally 
		// Assembly.GetCallingAssembly should work but in my tests it 
		// returned the current assembly in the static constructor above.
		private static проц SetSubclassDefaults()
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
					stdout.writeLine("Setting sub-class default assembly to {0}, namespace to {1}", _CallerAssembly, _CallerNamespace);
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

		public this()
			{ this(XmlResourceFlags.XRC_USE_LOCALE);}

		public this(ЦУк шхобъ)
			{ super(шхобъ); }
 
		public this(XmlResourceFlags флаги)
			{ this(wxXmlResource_ctor(cast(цел)флаги)); }

		public this(ткст filemask, XmlResourceFlags флаги)
			{ this(wxXmlResource_ctorByFilemask(filemask,cast(цел)флаги)); }
	    
		//---------------------------------------------------------------------
	
		public static XmlResource Get()
		{
			if (globalXmlResource is пусто)
			{
				globalXmlResource = new XmlResource();
			}
		
			return globalXmlResource;
		}
	
		//---------------------------------------------------------------------	
	
		public static XmlResource Установи(XmlResource res)
		{ 
			XmlResource old = globalXmlResource;
			globalXmlResource = res;
			return old; 
		}
	
		//---------------------------------------------------------------------

		public проц ИницВсеОбработчики()
		{
			wxXmlResource_InitAllHandlers(шхобъ);
		}
	
		//---------------------------------------------------------------------

		public бул Load(ткст filemask)
		{
			return wxXmlResource_Load(шхобъ,filemask);
		}
	
		//---------------------------------------------------------------------

		public Диалог LoadDialog(Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadDialog(шхобъ,wxObject.SafePtr(родитель),имя);
			if (ptr != ЦУк.init)
				return new Диалог(ptr);
			else
				return пусто;
		}
	
		//---------------------------------------------------------------------
        
		public бул LoadDialog(Диалог dlg, Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			return wxXmlResource_LoadDialogDlg(шхобъ,wxObject.SafePtr(dlg),wxObject.SafePtr(родитель),имя);
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

		public цел Version() { return wxXmlResource_GetVersion(шхобъ); }
	
		//---------------------------------------------------------------------

		public бул LoadFrame(Фрейм frame, Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			return wxXmlResource_LoadFrameWithFrame(шхобъ, wxObject.SafePtr(frame), wxObject.SafePtr(родитель), имя);
		}
	
		//---------------------------------------------------------------------

		public Фрейм LoadFrame(Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadFrame(шхобъ,wxObject.SafePtr(родитель),имя);
			if (ptr != ЦУк.init)
				return new Фрейм(ptr);
			else
				return пусто;
		}
	
		//---------------------------------------------------------------------

		public Меню LoadMenu(ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadMenu(шхобъ, имя);
			if (ptr != ЦУк.init)
				return new Меню(ptr);
			else
				return пусто;
		}
	
		//---------------------------------------------------------------------

		public MenuBar LoadMenuBar(Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadMenuBarWithParent(шхобъ, wxObject.SafePtr(родитель), имя);
			if (ptr != ЦУк.init)
				return new MenuBar(ptr);
			else
				return пусто;
		}
	
		//---------------------------------------------------------------------

		public MenuBar LoadMenuBar(ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadMenuBar(шхобъ, имя);
			if (ptr != ЦУк.init)
				return new MenuBar(ptr);
			else
				return пусто;
		}
	
		//---------------------------------------------------------------------

		public бул LoadPanel(Panel panel, Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			return wxXmlResource_LoadPanelWithPanel(шхобъ, wxObject.SafePtr(panel), wxObject.SafePtr(родитель), имя);
		}
	
		//---------------------------------------------------------------------

		public Panel LoadPanel(Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadPanel(шхобъ, wxObject.SafePtr(родитель), имя);
			if (ptr != ЦУк.init)
				return new Panel(ptr);
			else
				return пусто;
		}
	
		//---------------------------------------------------------------------
/+
		public ToolBar LoadToolBar(Окно родитель, ткст имя)
		{
			SetSubclassDefaults();
			ЦУк ptr = wxXmlResource_LoadToolBar(шхобъ, wxObject.SafePtr(родитель), имя);
			if (ptr != ЦУк.init)
				return new ToolBar(ptr);
			else
				return пусто;
		}
	+/
		//---------------------------------------------------------------------

		public проц Флаги(XmlResourceFlags значение) { wxXmlResource_SetFlags(шхобъ, cast(цел)значение); }
		public XmlResourceFlags Флаги() { return cast(XmlResourceFlags)wxXmlResource_GetFlags(шхобъ); }
	
		//---------------------------------------------------------------------
	/+
		public проц UpdateResources()
		{
			wxXmlResource_UpdateResources(шхобъ);
		}
	+/
		//---------------------------------------------------------------------
	
		public Битмап LoadBitmap(ткст имя)
		{
			return new Битмап(wxXmlResource_LoadBitmap(шхобъ, имя));
		}
	
		//---------------------------------------------------------------------
	
		public Icon LoadIcon(ткст имя)
		{
			return new Icon(wxXmlResource_LoadIcon(шхобъ, имя));
		}
	
		//---------------------------------------------------------------------
	
		public цел CompareVersion(цел major, цел minor, цел release, цел revision)
		{
			return wxXmlResource_CompareVersion(шхобъ, major, minor, release, revision);
		}
	
		//---------------------------------------------------------------------
	
		public бул AttachUnknownControl(ткст имя, Окно control)
		{
			return AttachUnknownControl(имя, control, пусто);
		}
	
		public бул AttachUnknownControl(ткст имя, Окно control, Окно родитель)
		{
			return wxXmlResource_AttachUnknownControl(шхобъ, имя, wxObject.SafePtr(control), wxObject.SafePtr(родитель));
		}
	
		//---------------------------------------------------------------------
 
		public static wxObject XRCCTRL(Окно окно, ткст ид, newfunc func)
		{
			return окно.FindWindow(XRCID(ид), func);
		}

        public static wxObject GetControl(Окно окно, ткст ид, newfunc func)
        { 
            return XRCCTRL(окно, ид, func); 
        }
		//---------------------------------------------------------------------
		// XmlResource control subclassing
        
		private static XmlSubclassCreate m_create; // = cast(XmlSubclassCreate)&XmlSubclassCreateCS;
		//private static ЦУк function(ткст className) m_create = &XmlSubclassCreateCS;

		extern(C) private static ЦУк XmlSubclassCreateCS(ткст className)
		{
/+
			ткст имя = className;
			ткст assembly = пусто;
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
			if ((assembly == пусто) || (assembly == ""))
				assembly = _CallerAssembly;

			// Tack on any namespace prefix to the class? Only if the 
			// class does not already have a "." in it
			if (имя.IndexOf(".") == -1)
			{
				ткст ns = "";
				// Use caller's namespace?
				if ((_SubclassNamespace == пусто) || (_SubclassNamespace == ""))
					ns = _CallerNamespace;
				else
					ns = _SubclassNamespace;
				имя = ns + "." + имя;
			}

			try 
			{
				stdout.writeLine("Attempting to create " ~ имя ~ " from assembly " ~ assembly);
			//	ObjectHandle handle = Activator.CreateInstance(assembly, имя);

				if (handle === пусто) 
				{
					return ЦУк.init;
				}

				wxObject o = cast(wxObject)handle.Unwrap();
				return o.шхобъ;
			} 
			catch (Exception e) 
			{
				stdout.writeLine(e);

				return ЦУк.init;
			}
+/
			return ЦУк.init;
		}

	}
