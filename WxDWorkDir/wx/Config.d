//-----------------------------------------------------------------------------
// wxD - Config.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - Config.cs
//
/// The wxConfig wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Config.d,v 1.11 2007/11/27 08:19:20 afb Exp $
//-----------------------------------------------------------------------------

module wx.Config;
public import wx.common;
public import wx.Шрифт;
public import wx.Colour;
public import wx.wxString;

    public enum EntryType 
    {
        Unknown,
        String,
        Boolean,
        Integer,
        Float
    }
    
    // Style флаги for constructor стиль parameter
    public enum ConfigStyleFlags
    {
    	wxCONFIG_USE_LOCAL_FILE = 1,
    	wxCONFIG_USE_GLOBAL_FILE = 2,
    	wxCONFIG_USE_RELATIVE_PATH = 4,
    	wxCONFIG_USE_NO_ESCAPE_CHARACTERS = 8
    }


		//! \cond EXTERN
        static extern (C) ЦУк wxConfigBase_Set(ЦУк pConfig);
        static extern (C) ЦУк wxConfigBase_Get(бул createOnDemand);
        static extern (C) ЦУк wxConfigBase_Create();
        static extern (C) проц   wxConfigBase_DontCreateOnDemand();
        static extern (C) проц   wxConfigBase_SetPath(ЦУк сам, ткст strPath);
        static extern (C) ЦУк wxConfigBase_GetPath(ЦУк сам);
        static extern (C) бул   wxConfigBase_GetFirstGroup(ЦУк сам, ЦУк str, inout цел lIndex);
        static extern (C) бул   wxConfigBase_GetNextGroup(ЦУк сам, ЦУк str, inout цел lIndex);
        static extern (C) бул   wxConfigBase_GetFirstEntry(ЦУк сам, ЦУк str, inout цел lIndex);
        static extern (C) бул   wxConfigBase_GetNextEntry(ЦУк сам, ЦУк str, inout цел lIndex);
        static extern (C) цел    wxConfigBase_GetNumberOfEntries(ЦУк сам, бул bRecursive);
        static extern (C) цел    wxConfigBase_GetNumberOfGroups(ЦУк сам, бул bRecursive);
        static extern (C) бул   wxConfigBase_HasGroup(ЦУк сам, ткст strName);
        static extern (C) бул   wxConfigBase_HasEntry(ЦУк сам, ткст strName);
        static extern (C) бул   wxConfigBase_Exists(ЦУк сам, ткст strName);
        static extern (C) цел    wxConfigBase_GetEntryType(ЦУк сам, ткст имя);
        static extern (C) бул   wxConfigBase_ReadStr(ЦУк сам, ткст key, ЦУк pStr);
        static extern (C) бул   wxConfigBase_ReadStrDef(ЦУк сам, ткст key, ЦУк pStr, ткст defVal);
        static extern (C) бул   wxConfigBase_ReadInt(ЦУк сам, ткст key, inout цел pl);
        static extern (C) бул   wxConfigBase_ReadIntDef(ЦУк сам, ткст key, inout цел pl, цел defVal);
        static extern (C) бул   wxConfigBase_ReadDbl(ЦУк сам, ткст key, inout дво val);
        static extern (C) бул   wxConfigBase_ReadDblDef(ЦУк сам, ткст key, inout дво val, дво defVal);
        static extern (C) бул   wxConfigBase_ReadBool(ЦУк сам, ткст key, inout бул val);
        static extern (C) бул   wxConfigBase_ReadBoolDef(ЦУк сам, ткст key, inout бул val, бул defVal);
        static extern (C) ЦУк wxConfigBase_ReadStrRet(ЦУк сам, ткст key, ткст defVal);
        static extern (C) цел    wxConfigBase_ReadIntRet(ЦУк сам, ткст key, цел defVal);
        static extern (C) бул   wxConfigBase_WriteStr(ЦУк сам, ткст key, ткст val);
        static extern (C) бул   wxConfigBase_WriteInt(ЦУк сам, ткст key, цел val);
        static extern (C) бул   wxConfigBase_WriteDbl(ЦУк сам, ткст key, дво val);
        static extern (C) бул   wxConfigBase_WriteBool(ЦУк сам, ткст key, бул val);
        static extern (C) бул   wxConfigBase_Flush(ЦУк сам, бул bCurrentOnly);
        static extern (C) бул   wxConfigBase_RenameEntry(ЦУк сам, ткст oldName, ткст newName);
        static extern (C) бул   wxConfigBase_RenameGroup(ЦУк сам, ткст oldName, ткст newName);
        static extern (C) бул   wxConfigBase_DeleteEntry(ЦУк сам, ткст key, бул bDeleteGroupIfEmpty);
        static extern (C) бул   wxConfigBase_DeleteGroup(ЦУк сам, ткст key);
        static extern (C) бул   wxConfigBase_DeleteAll(ЦУк сам);
        static extern (C) бул   wxConfigBase_IsExpandingEnvVars(ЦУк сам);
        static extern (C) проц   wxConfigBase_SetExpandEnvVars(ЦУк сам, бул bDoIt);
        static extern (C) ЦУк wxConfigBase_ExpandEnvVars(ЦУк сам, ткст str);
        static extern (C) проц   wxConfigBase_SetRecordDefaults(ЦУк сам, бул bDoIt);
        static extern (C) бул   wxConfigBase_IsRecordingDefaults(ЦУк сам);
        static extern (C) ЦУк wxConfigBase_GetAppName(ЦУк сам);
        static extern (C) проц   wxConfigBase_SetAppName(ЦУк сам, ткст appName);
        static extern (C) ЦУк wxConfigBase_GetVendorName(ЦУк сам);
        static extern (C) проц   wxConfigBase_SetVendorName(ЦУк сам, ткст vendorName);
        static extern (C) проц   wxConfigBase_SetStyle(ЦУк сам, цел стиль);
        static extern (C) цел    wxConfigBase_GetStyle(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

    // although it wxConfig is not derived from шхобъ we do not change it.
    // Use Config.Get() to get an instance.
    alias Config wxConfig;
    public class Config : wxObject
    {
        public this(ЦУк шхобъ)
            { super(шхобъ); }
	
	public static wxObject Нов(ЦУк ptr) { return new Config(ptr); }
	
        public static Config Установи(Config config)
        {
            return cast(Config)FindObject(wxConfigBase_Set(wxObject.SafePtr(config)), &Config.Нов);
        }

        public static Config Get(бул createOnDemand)
        {
            return cast(Config)FindObject(wxConfigBase_Get(createOnDemand), &Config.Нов);
        }
	
	public static Config Get()
        {
            return cast(Config)FindObject(wxConfigBase_Get(да), &Config.Нов);
        }

        public static Config Create()
        {
            return new Config(wxConfigBase_Create());
        }

		//---------------------------------------------------------------------

        public проц DontCreateOnDemand()
        {
            wxConfigBase_DontCreateOnDemand();
        }

		//---------------------------------------------------------------------

        public проц Путь(ткст значение) { wxConfigBase_SetPath(шхобъ, значение); }
        public ткст Путь() { return cast(ткст) new wxString(wxConfigBase_GetPath(шхобъ), да); }

		//---------------------------------------------------------------------

        public бул ДайПервуюГруппу(inout ткст str, inout цел lIndex)
        {
            бул ret;
            wxString wstr = new wxString(str);

            ret = wxConfigBase_GetFirstGroup(шхобъ, wxString.SafePtr(wstr), lIndex);
            str = wstr.toString();

            return ret;
        }

        public бул ДайСледщГруппу(inout ткст str, inout цел lIndex)
        {
            бул ret;
            wxString wstr = new wxString(str);

            ret = wxConfigBase_GetNextGroup(шхобъ, wxString.SafePtr(wstr), lIndex);
            str = wstr.toString();

            return ret;
        }

		//---------------------------------------------------------------------

        public бул ДайПервуюЗапись(inout ткст str, inout цел lIndex)
        {
            бул ret;
            wxString wstr = new wxString(str);

            ret = wxConfigBase_GetFirstEntry(шхобъ, wxString.SafePtr(wstr), lIndex);
            str = wstr.toString();

            return ret;
        }

        public бул ДайСледщЗапись(inout ткст str, inout цел lIndex)
        {
            бул ret;
            wxString wstr = new wxString(str);

            ret = wxConfigBase_GetNextEntry(шхобъ, wxString.SafePtr(wstr), lIndex);
            str = wstr.toString();

            return ret;
        }

		//---------------------------------------------------------------------

        public цел GetNumberOfEntries(бул bRecursive)
        {
            return wxConfigBase_GetNumberOfEntries(шхобъ, bRecursive);
        }

        public цел GetNumberOfGroups(бул bRecursive)
        {
            return wxConfigBase_GetNumberOfGroups(шхобъ, bRecursive);
        }

		//---------------------------------------------------------------------

        public бул HasGroup(ткст strName)
        {
            return wxConfigBase_HasGroup(шхобъ, strName);
        }

        public бул HasEntry(ткст strName)
        {
            return wxConfigBase_HasEntry(шхобъ, strName);
        }

		//---------------------------------------------------------------------

        public бул Exists(ткст strName)
        {
            return wxConfigBase_Exists(шхобъ, strName);
        }

        public EntryType GetEntryType(ткст имя)
        {
            return cast(EntryType)wxConfigBase_GetEntryType(шхобъ, имя);
        }

		//---------------------------------------------------------------------

        public бул Read(ткст key, inout ткст str)
        {
            бул ret;
            wxString wstr = new wxString(str);

            ret = wxConfigBase_ReadStr(шхобъ, key, wxString.SafePtr(wstr));
            str = wstr.toString();

            return ret;
        }

        public бул Read(ткст key, inout ткст str, ткст defVal)
        {
            бул ret;
            wxString wstr = new wxString(str);

            ret = wxConfigBase_ReadStrDef(шхобъ, key, wxString.SafePtr(wstr), defVal);
            str = wstr.toString();

            return ret;
        }

		//---------------------------------------------------------------------

        public бул Read(ткст key, inout цел pl)
        {
            return wxConfigBase_ReadInt(шхобъ, key, pl);
        }

        public бул Read(ткст key, inout цел pl, цел defVal)
        {
            return wxConfigBase_ReadIntDef(шхобъ, key, pl, defVal);
        }

		//---------------------------------------------------------------------

        public бул Read(ткст key, inout дво val)
        {
            return wxConfigBase_ReadDbl(шхобъ, key, val);
        }

        public бул Read(ткст key, inout дво val, дво defVal)
        {
            return wxConfigBase_ReadDblDef(шхобъ, key, val, defVal);
        }

		//---------------------------------------------------------------------

        public бул Read(ткст key, inout бул val)
        {
            return wxConfigBase_ReadBool(шхобъ, key, val);
        }

        public бул Read(ткст key, inout бул val, бул defVal)
        {
            return wxConfigBase_ReadBoolDef(шхобъ, key, val, defVal);
        }

		//---------------------------------------------------------------------

        public бул Read(ткст key, inout Шрифт val)
        {
            return Read(key, val, Шрифт.wxNORMAL_FONT);
        }

        public бул Read(ткст key, inout Шрифт val, Шрифт defVal)
        {
            бул ret = да;

            цел pointSize = 0, family = 0, стиль = 0, weight = 0, encoding = 0;
            бул underline = нет;
            ткст faceName = "";

            ret &= Read(key ~ "/PointSize", pointSize,  cast(цел)defVal.PointSize);
            ret &= Read(key ~ "/Family",    family,     cast(цел)defVal.Family);
            ret &= Read(key ~ "/Style",     стиль,      cast(цел)defVal.Style);
            ret &= Read(key ~ "/Weight",    weight,     cast(цел)defVal.Weight);
            ret &= Read(key ~ "/Underline", underline,  cast(бул)defVal.Underlined);
            ret &= Read(key ~ "/FaceName",  faceName,   defVal.FaceName);
            ret &= Read(key ~ "/Encoding",  encoding,   cast(цел)defVal.Encoding);

            val.PointSize   = pointSize;
            val.Family      = cast(FontFamily)family;
            val.Style       = cast(FontStyle)стиль;
            val.Weight      = cast(FontWeight)weight;
            val.Underlined  = underline;
            val.FaceName    = faceName;
            val.Encoding    = cast(FontEncoding)encoding;

            return ret;
        }

		//---------------------------------------------------------------------

        public бул Read(ткст key, inout Цвет val)
        {
            Цвет def = new Цвет(0, 0, 0);
            return Read(key, val, def);
        }

	private static цел hex2int(ткст str)
	{
		цел значение = 0;
		foreach(сим foo; str) {
			сим ch = foo;
			if (ch>='0' && ch<='9') ch-='0';
			else if (ch>='A' && ch<='F') ch=ch-'A'+10;
			else if (ch>='a' && ch<='f') ch=ch-'a'+10;
			else return -1;
			значение = значение*10 + ch;
		}
		return значение;
	}

        public бул Read(ткст key, inout Цвет val, Цвет defVal)
        {
            ткст str;
            бул ret = Read(key,str);
            if (!ret || !str || str[0]!='#') {
            //    val = defval;
            } else {
                бцел c = hex2int(str[1..str.length]);

                цел к = (c>>16)&255;
                цел з = (c>>8)&255;
                цел с = c&255;

                val = new Цвет(cast(ббайт)к, cast(ббайт)з, cast(ббайт)с);
            }
            return ret;
/*
            бул ret = да;
            цел к = 0, с = 0, з = 0;

            ret &= Read(key ~ "/Красный",   к, cast(цел)defVal.Красный);
            ret &= Read(key ~ "/Синий",  с, cast(цел)defVal.Синий);
            ret &= Read(key ~ "/Зелёный", з, cast(цел)defVal.Зелёный);

            val = new Цвет(cast(ббайт)к, cast(ббайт)з, cast(ббайт)с);

            return ret;
*/
        }

		//---------------------------------------------------------------------
/+
        public ткст Read(ткст key, ткст defVal)
        {
            return cast(ткст) new wxString(wxConfigBase_ReadStrRet(шхобъ, key, defVal), да);
        }
+/
        public цел Read(ткст key, цел defVal)
        {
            return wxConfigBase_ReadIntRet(шхобъ, key, defVal);
        }

        public бул Read(ткст key, бул defVal) {
            бул val = нет;
            Read(key, val, defVal);
            return val;
        }

        public Цвет Read(ткст key, Цвет defVal)
        {
            Цвет col = new Цвет();
            Read(key, col, defVal);
            return col;
        }

        public Шрифт Read(ткст key, Шрифт defVal)
        {
            Шрифт fnt = new Шрифт();
            Read(key, fnt, defVal);
            return fnt;
        }

		//---------------------------------------------------------------------

        public бул Write(ткст key, ткст val)
        {
            return wxConfigBase_WriteStr(шхобъ, key, val);
        }

        public бул Write(ткст key, цел val)
        {
            return wxConfigBase_WriteInt(шхобъ, key, val);
        }

        public бул Write(ткст key, дво val)
        {
            return wxConfigBase_WriteDbl(шхобъ, key, val);
        }

        public бул Write(ткст key, бул val)
        {
            return wxConfigBase_WriteBool(шхобъ, key, val);
        }

	private static проц tohex(сим* s,бцел значение)
	{
		const static сим[16] hexdigits = "0123456789ABCDEF";
		s[0] = hexdigits[значение>>4];
		s[1] = hexdigits[значение&15];
	}
	
        public бул Write(ткст key, Цвет col)
        {
/*
            бул ret = да;
            ret &= Write(key ~ "/Красный",   cast(цел)col.Красный);
            ret &= Write(key ~ "/Синий",  cast(цел)col.Синий);
            ret &= Write(key ~ "/Зелёный", cast(цел)col.Зелёный);
            return ret;
*/
	    сим[] buf = new сим[7];
	    buf[0] = '#';
	    tohex(&buf[1],col.Красный);
	    tohex(&buf[3],col.Зелёный);
	    tohex(&buf[5],col.Синий);
	    return Write(key, buf);//assumeUnique(buf));
        }

        public бул Write(ткст key, Шрифт val)
        {
            бул ret = да;

            ret &= Write(key ~ "/PointSize", cast(цел)val.PointSize);
            ret &= Write(key ~ "/Family",    cast(цел)val.Family);
            ret &= Write(key ~ "/Style",     cast(цел)val.Style);
            ret &= Write(key ~ "/Weight",    cast(цел)val.Weight);
            ret &= Write(key ~ "/Underline", cast(бул)val.Underlined);
            ret &= Write(key ~ "/FaceName",  val.FaceName);
            ret &= Write(key ~ "/Encoding",  cast(цел)val.Encoding);

            return ret;
        }

		//---------------------------------------------------------------------

        public бул Flush(бул bCurrentOnly)
        {
            return wxConfigBase_Flush(шхобъ, bCurrentOnly);
        }

		//---------------------------------------------------------------------

        public бул RenameEntry(ткст oldName, ткст newName)
        {
            return wxConfigBase_RenameEntry(шхобъ, oldName, newName);
        }

        public бул RenameGroup(ткст oldName, ткст newName)
        {
            return wxConfigBase_RenameGroup(шхобъ, oldName, newName);
        }

		//---------------------------------------------------------------------

        public бул DeleteEntry(ткст key, бул bDeleteGroupIfEmpty)
        {
            return wxConfigBase_DeleteEntry(шхобъ, key, bDeleteGroupIfEmpty);
        }

        public бул DeleteGroup(ткст key)
        {
            return wxConfigBase_DeleteGroup(шхобъ, key);
        }

        public бул DeleteAll()
        {
            return wxConfigBase_DeleteAll(шхобъ);
        }

		//---------------------------------------------------------------------

        public бул ExpandEnvVars() { return wxConfigBase_IsExpandingEnvVars(шхобъ); }
        public проц ExpandEnvVars(бул значение) { wxConfigBase_SetExpandEnvVars(шхобъ, значение); }

        /*public ткст ExpandEnvVars(ткст str)
        {
            return cast(ткст) new wxString(wxConfigBase_ExpandEnvVars(шхобъ, str));
        }*/

		//---------------------------------------------------------------------

        public проц RecordDefaults(бул значение) { wxConfigBase_SetRecordDefaults(шхобъ, значение); }
        public бул RecordDefaults() { return wxConfigBase_IsRecordingDefaults(шхобъ); }

		//---------------------------------------------------------------------

        public ткст ИмяПрил() { return cast(ткст) new wxString(wxConfigBase_GetAppName(шхобъ), да); }
        public проц ИмяПрил(ткст значение) { wxConfigBase_SetAppName(шхобъ, значение); }

		//---------------------------------------------------------------------

        public ткст ИмяПроизводителя() { return cast(ткст) new wxString(wxConfigBase_GetVendorName(шхобъ), да); }
        public проц ИмяПроизводителя(ткст значение) { wxConfigBase_SetVendorName(шхобъ, значение); }

		//---------------------------------------------------------------------

        public проц Style(цел значение) { wxConfigBase_SetStyle(шхобъ, значение); }
        public цел Style() { return wxConfigBase_GetStyle(шхобъ); }

		//---------------------------------------------------------------------
    }

