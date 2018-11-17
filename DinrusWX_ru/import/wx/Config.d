module wx.Config;
public import wx.common;
public import wx.Font;
public import wx.Colour;
public import wx.wxString;

    public enum EntryType 
    {
        Unknown,
        Ткст,
        Boolean,
        Integer,
        Float
    }
    
    // Стиль флаги for constructor стиль parameter
    public enum ConfigStyleФлаги
    {
    	wxCONFIG_USE_LOCAL_FILE = 1,
    	wxCONFIG_USE_GLOBAL_FILE = 2,
    	wxCONFIG_USE_RELATIVE_PATH = 4,
    	wxCONFIG_USE_NO_ESCAPE_CHARACTERS = 8
    }


		//! \cond EXTERN
        static extern (C) IntPtr wxConfigBase_Set(IntPtr pConfig);
        static extern (C) IntPtr wxConfigBase_Get(бул createOnDemand);
        static extern (C) IntPtr wxConfigBase_Create();
        static extern (C) проц   wxConfigBase_DontCreateOnDemand();
        static extern (C) проц   wxConfigBase_SetPath(IntPtr сам, ткст strPath);
        static extern (C) IntPtr wxConfigBase_GetPath(IntPtr сам);
        static extern (C) бул   wxConfigBase_GetFirstGroup(IntPtr сам, IntPtr стр, inout цел lIndex);
        static extern (C) бул   wxConfigBase_GetNextGroup(IntPtr сам, IntPtr стр, inout цел lIndex);
        static extern (C) бул   wxConfigBase_GetFirstEntry(IntPtr сам, IntPtr стр, inout цел lIndex);
        static extern (C) бул   wxConfigBase_GetNextEntry(IntPtr сам, IntPtr стр, inout цел lIndex);
        static extern (C) цел    wxConfigBase_GetNumberOfEntries(IntPtr сам, бул bRecursive);
        static extern (C) цел    wxConfigBase_GetNumberOfGroups(IntPtr сам, бул bRecursive);
        static extern (C) бул   wxConfigBase_HasGroup(IntPtr сам, ткст strName);
        static extern (C) бул   wxConfigBase_HasEntry(IntPtr сам, ткст strName);
        static extern (C) бул   wxConfigBase_Exists(IntPtr сам, ткст strName);
        static extern (C) цел    wxConfigBase_GetEntryType(IntPtr сам, ткст имя);
        static extern (C) бул   wxConfigBase_ReadStr(IntPtr сам, ткст key, IntPtr pStr);
        static extern (C) бул   wxConfigBase_ReadStrDef(IntPtr сам, ткст key, IntPtr pStr, ткст defVal);
        static extern (C) бул   wxConfigBase_ReadInt(IntPtr сам, ткст key, inout цел pl);
        static extern (C) бул   wxConfigBase_ReadIntDef(IntPtr сам, ткст key, inout цел pl, цел defVal);
        static extern (C) бул   wxConfigBase_ReadDbl(IntPtr сам, ткст key, inout double val);
        static extern (C) бул   wxConfigBase_ReadDblDef(IntPtr сам, ткст key, inout double val, double defVal);
        static extern (C) бул   wxConfigBase_ReadBool(IntPtr сам, ткст key, inout бул val);
        static extern (C) бул   wxConfigBase_ReadBoolDef(IntPtr сам, ткст key, inout бул val, бул defVal);
        static extern (C) IntPtr wxConfigBase_ReadStrRet(IntPtr сам, ткст key, ткст defVal);
        static extern (C) цел    wxConfigBase_ReadIntRet(IntPtr сам, ткст key, цел defVal);
        static extern (C) бул   wxConfigBase_WriteStr(IntPtr сам, ткст key, ткст val);
        static extern (C) бул   wxConfigBase_WriteInt(IntPtr сам, ткст key, цел val);
        static extern (C) бул   wxConfigBase_WriteDbl(IntPtr сам, ткст key, double val);
        static extern (C) бул   wxConfigBase_WriteBool(IntPtr сам, ткст key, бул val);
        static extern (C) бул   wxConfigBase_Flush(IntPtr сам, бул bCurrentOnly);
        static extern (C) бул   wxConfigBase_RenameEntry(IntPtr сам, ткст oldName, ткст newName);
        static extern (C) бул   wxConfigBase_RenameGroup(IntPtr сам, ткст oldName, ткст newName);
        static extern (C) бул   wxConfigBase_DeleteEntry(IntPtr сам, ткст key, бул bDeleteGroupIfEmpty);
        static extern (C) бул   wxConfigBase_DeleteGroup(IntPtr сам, ткст key);
        static extern (C) бул   wxConfigBase_DeleteAll(IntPtr сам);
        static extern (C) бул   wxConfigBase_IsExpandingEnvVars(IntPtr сам);
        static extern (C) проц   wxConfigBase_SetExpandEnvVars(IntPtr сам, бул bDoIt);
        static extern (C) IntPtr wxConfigBase_ExpandEnvVars(IntPtr сам, ткст стр);
        static extern (C) проц   wxConfigBase_SetRecordDefaults(IntPtr сам, бул bDoIt);
        static extern (C) бул   wxConfigBase_IsRecordingDefaults(IntPtr сам);
        static extern (C) IntPtr wxConfigBase_GetAppName(IntPtr сам);
        static extern (C) проц   wxConfigBase_SetAppName(IntPtr сам, ткст appName);
        static extern (C) IntPtr wxConfigBase_GetVendorName(IntPtr сам);
        static extern (C) проц   wxConfigBase_SetVendorName(IntPtr сам, ткст vendorName);
        static extern (C) проц   wxConfigBase_SetStyle(IntPtr сам, цел стиль);
        static extern (C) цел    wxConfigBase_GetStyle(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

    // although it wxConfig is not derived from wxobj we do not change it.
    // Use Config.Get() to get an instance.
    alias Config wxConfig;
    public class Config : wxObject
    {
        public this(IntPtr wxobj);	
	    public static wxObject Нов(IntPtr ptr);
        public static Config Уст(Config config);
        public static Config Get(бул createOnDemand);
	    public static Config Get();
        public static Config Создай();
        public проц DontCreateOnDemand();
        public проц Path(ткст значение) ;
        public ткст Path();
        public бул GetFirstGroup(inout ткст стр, inout цел lIndex);
        public бул GetNextGroup(inout ткст стр, inout цел lIndex);
        public бул GetFirstEntry(inout ткст стр, inout цел lIndex);
        public бул GetNextEntry(inout ткст стр, inout цел lIndex);
        public цел GetNumberOfEntries(бул bRecursive);
        public цел GetNumberOfGroups(бул bRecursive);
        public бул HasGroup(ткст strName);
        public бул HasEntry(ткст strName);
        public бул Exists(ткст strName);
        public EntryType GetEntryType(ткст имя);
        public бул Read(ткст key, inout ткст стр);
        public бул Read(ткст key, inout ткст стр, ткст defVal);
        public бул Read(ткст key, inout цел pl);
        public бул Read(ткст key, inout цел pl, цел defVal);
        public бул Read(ткст key, inout double val);
        public бул Read(ткст key, inout double val, double defVal);
        public бул Read(ткст key, inout бул val);
        public бул Read(ткст key, inout бул val, бул defVal);
        public бул Read(ткст key, inout Шрифт val);
        public бул Read(ткст key, inout Шрифт val, Шрифт defVal);
        public бул Read(ткст key, inout Цвет val);
	   private static цел hex2int(ткст стр);
        public бул Read(ткст key, inout Цвет val, Цвет defVal);
        //public ткст Read(ткст key, ткст defVal);
        public цел Read(ткст key, цел defVal);
        public бул Read(ткст key, бул defVal) ;
        public Цвет Read(ткст key, Цвет defVal);
        public Шрифт Read(ткст key, Шрифт defVal);
        public бул Write(ткст key, ткст val);
        public бул Write(ткст key, цел val);
        public бул Write(ткст key, double val);
        public бул Write(ткст key, бул val);
    	private static проц tohex(char* s,бцел значение);
        public бул Write(ткст key, Цвет col);
        public бул Write(ткст key, Шрифт val);
        public бул Flush(бул bCurrentOnly);
        public бул RenameEntry(ткст oldName, ткст newName);
        public бул RenameGroup(ткст oldName, ткст newName);
        public бул DeleteEntry(ткст key, бул bDeleteGroupIfEmpty);
        public бул DeleteGroup(ткст key);
        public бул DeleteAll();
        public бул ExpandEnvVars();
        public проц ExpandEnvVars(бул значение) ;
        //public ткст ExpandEnvVars(ткст стр);
        public проц RecordDefaults(бул значение);
        public бул RecordDefaults() ;
        public ткст ИмяАпп();
        public проц ИмяАпп(ткст значение) ;
        public ткст ИмяВендора();
        public проц ИмяВендора(ткст значение);
        public проц Стиль(цел значение);
        public цел Стиль();
    }

