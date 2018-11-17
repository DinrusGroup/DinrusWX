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
public import wx.Font;
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

// Стиль флаги for constructor стиль parameter
public enum ConfigStyleФлаги
{
    wxCONFIG_USE_LOCAL_FILE = 1,
    wxCONFIG_USE_GLOBAL_FILE = 2,
    wxCONFIG_USE_RELATIVE_PATH = 4,
    wxCONFIG_USE_NO_ESCAPE_CHARACTERS = 8
}


//! \cond EXTERN
static extern (C) ЦелУкз wxConfigBase_Set(ЦелУкз pConfig);
static extern (C) ЦелУкз wxConfigBase_Get(бул createOnDemand);
static extern (C) ЦелУкз wxConfigBase_Create();
static extern (C) проц   wxConfigBase_DontCreateOnDemand();
static extern (C) проц   wxConfigBase_SetPath(ЦелУкз сам, ткст strPath);
static extern (C) ЦелУкз wxConfigBase_GetPath(ЦелУкз сам);
static extern (C) бул   wxConfigBase_GetFirstGroup(ЦелУкз сам, ЦелУкз стр, inout цел lIndex);
static extern (C) бул   wxConfigBase_GetNextGroup(ЦелУкз сам, ЦелУкз стр, inout цел lIndex);
static extern (C) бул   wxConfigBase_GetFirstEntry(ЦелУкз сам, ЦелУкз стр, inout цел lIndex);
static extern (C) бул   wxConfigBase_GetNextEntry(ЦелУкз сам, ЦелУкз стр, inout цел lIndex);
static extern (C) цел    wxConfigBase_GetNumberOfEntries(ЦелУкз сам, бул bRecursive);
static extern (C) цел    wxConfigBase_GetNumberOfGroups(ЦелУкз сам, бул bRecursive);
static extern (C) бул   wxConfigBase_HasGroup(ЦелУкз сам, ткст strName);
static extern (C) бул   wxConfigBase_HasEntry(ЦелУкз сам, ткст strName);
static extern (C) бул   wxConfigBase_Exists(ЦелУкз сам, ткст strName);
static extern (C) цел    wxConfigBase_GetEntryType(ЦелУкз сам, ткст имя);
static extern (C) бул   wxConfigBase_ReadStr(ЦелУкз сам, ткст key, ЦелУкз pStr);
static extern (C) бул   wxConfigBase_ReadStrDef(ЦелУкз сам, ткст key, ЦелУкз pStr, ткст defVal);
static extern (C) бул   wxConfigBase_ReadInt(ЦелУкз сам, ткст key, inout цел pl);
static extern (C) бул   wxConfigBase_ReadIntDef(ЦелУкз сам, ткст key, inout цел pl, цел defVal);
static extern (C) бул   wxConfigBase_ReadDbl(ЦелУкз сам, ткст key, inout double val);
static extern (C) бул   wxConfigBase_ReadDblDef(ЦелУкз сам, ткст key, inout double val, double defVal);
static extern (C) бул   wxConfigBase_ReadBool(ЦелУкз сам, ткст key, inout бул val);
static extern (C) бул   wxConfigBase_ReadBoolDef(ЦелУкз сам, ткст key, inout бул val, бул defVal);
static extern (C) ЦелУкз wxConfigBase_ReadStrRet(ЦелУкз сам, ткст key, ткст defVal);
static extern (C) цел    wxConfigBase_ReadIntRet(ЦелУкз сам, ткст key, цел defVal);
static extern (C) бул   wxConfigBase_WriteStr(ЦелУкз сам, ткст key, ткст val);
static extern (C) бул   wxConfigBase_WriteInt(ЦелУкз сам, ткст key, цел val);
static extern (C) бул   wxConfigBase_WriteDbl(ЦелУкз сам, ткст key, double val);
static extern (C) бул   wxConfigBase_WriteBool(ЦелУкз сам, ткст key, бул val);
static extern (C) бул   wxConfigBase_Flush(ЦелУкз сам, бул bCurrentOnly);
static extern (C) бул   wxConfigBase_RenameEntry(ЦелУкз сам, ткст oldName, ткст newName);
static extern (C) бул   wxConfigBase_RenameGroup(ЦелУкз сам, ткст oldName, ткст newName);
static extern (C) бул   wxConfigBase_DeleteEntry(ЦелУкз сам, ткст key, бул bDeleteGroupIfEmpty);
static extern (C) бул   wxConfigBase_DeleteGroup(ЦелУкз сам, ткст key);
static extern (C) бул   wxConfigBase_DeleteAll(ЦелУкз сам);
static extern (C) бул   wxConfigBase_IsExpandingEnvVars(ЦелУкз сам);
static extern (C) проц   wxConfigBase_SetExpandEnvVars(ЦелУкз сам, бул bDoIt);
static extern (C) ЦелУкз wxConfigBase_ExpandEnvVars(ЦелУкз сам, ткст стр);
static extern (C) проц   wxConfigBase_SetRecordDefaults(ЦелУкз сам, бул bDoIt);
static extern (C) бул   wxConfigBase_IsRecordingDefaults(ЦелУкз сам);
static extern (C) ЦелУкз wxConfigBase_GetAppName(ЦелУкз сам);
static extern (C) проц   wxConfigBase_SetAppName(ЦелУкз сам, ткст appName);
static extern (C) ЦелУкз wxConfigBase_GetVendorName(ЦелУкз сам);
static extern (C) проц   wxConfigBase_SetVendorName(ЦелУкз сам, ткст vendorName);
static extern (C) проц   wxConfigBase_SetStyle(ЦелУкз сам, цел стиль);
static extern (C) цел    wxConfigBase_GetStyle(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

// although it wxConfig is not derived from wxobj we do not change it.
// Use Config.Get() to get an instance.
alias Config wxConfig;
public class Config : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new Config(ptr);
    }

    public static Config Уст(Config config)
    {
        return cast(Config)НайдиОбъект(wxConfigBase_Set(wxObject.SafePtr(config)), &Config.Нов);
    }

    public static Config Get(бул createOnDemand)
    {
        return cast(Config)НайдиОбъект(wxConfigBase_Get(createOnDemand), &Config.Нов);
    }

    public static Config Get()
    {
        return cast(Config)НайдиОбъект(wxConfigBase_Get(да), &Config.Нов);
    }

    public static Config создай()
    {
        return new Config(wxConfigBase_Create());
    }

    //---------------------------------------------------------------------

    public проц DontCreateOnDemand()
    {
        wxConfigBase_DontCreateOnDemand();
    }

    //---------------------------------------------------------------------

    public проц Path(ткст значение)
    {
        wxConfigBase_SetPath(wxobj, значение);
    }
    public ткст Path()
    {
        return cast(ткст) new wxString(wxConfigBase_GetPath(wxobj), да);
    }

    //---------------------------------------------------------------------

    public бул GetFirstGroup(inout ткст стр, inout цел lIndex)
    {
        бул ret;
        wxString wstr = new wxString(стр);

        ret = wxConfigBase_GetFirstGroup(wxobj, wxString.SafePtr(wstr), lIndex);
        стр = wstr.вТкст();

        return ret;
    }

    public бул GetNextGroup(inout ткст стр, inout цел lIndex)
    {
        бул ret;
        wxString wstr = new wxString(стр);

        ret = wxConfigBase_GetNextGroup(wxobj, wxString.SafePtr(wstr), lIndex);
        стр = wstr.вТкст();

        return ret;
    }

    //---------------------------------------------------------------------

    public бул GetFirstEntry(inout ткст стр, inout цел lIndex)
    {
        бул ret;
        wxString wstr = new wxString(стр);

        ret = wxConfigBase_GetFirstEntry(wxobj, wxString.SafePtr(wstr), lIndex);
        стр = wstr.вТкст();

        return ret;
    }

    public бул GetNextEntry(inout ткст стр, inout цел lIndex)
    {
        бул ret;
        wxString wstr = new wxString(стр);

        ret = wxConfigBase_GetNextEntry(wxobj, wxString.SafePtr(wstr), lIndex);
        стр = wstr.вТкст();

        return ret;
    }

    //---------------------------------------------------------------------

    public цел GetNumberOfEntries(бул bRecursive)
    {
        return wxConfigBase_GetNumberOfEntries(wxobj, bRecursive);
    }

    public цел GetNumberOfGroups(бул bRecursive)
    {
        return wxConfigBase_GetNumberOfGroups(wxobj, bRecursive);
    }

    //---------------------------------------------------------------------

    public бул HasGroup(ткст strName)
    {
        return wxConfigBase_HasGroup(wxobj, strName);
    }

    public бул HasEntry(ткст strName)
    {
        return wxConfigBase_HasEntry(wxobj, strName);
    }

    //---------------------------------------------------------------------

    public бул Exists(ткст strName)
    {
        return wxConfigBase_Exists(wxobj, strName);
    }

    public EntryType GetEntryType(ткст имя)
    {
        return cast(EntryType)wxConfigBase_GetEntryType(wxobj, имя);
    }

    //---------------------------------------------------------------------

    public бул Read(ткст key, inout ткст стр)
    {
        бул ret;
        wxString wstr = new wxString(стр);

        ret = wxConfigBase_ReadStr(wxobj, key, wxString.SafePtr(wstr));
        стр = wstr.вТкст();

        return ret;
    }

    public бул Read(ткст key, inout ткст стр, ткст defVal)
    {
        бул ret;
        wxString wstr = new wxString(стр);

        ret = wxConfigBase_ReadStrDef(wxobj, key, wxString.SafePtr(wstr), defVal);
        стр = wstr.вТкст();

        return ret;
    }

    //---------------------------------------------------------------------

    public бул Read(ткст key, inout цел pl)
    {
        return wxConfigBase_ReadInt(wxobj, key, pl);
    }

    public бул Read(ткст key, inout цел pl, цел defVal)
    {
        return wxConfigBase_ReadIntDef(wxobj, key, pl, defVal);
    }

    //---------------------------------------------------------------------

    public бул Read(ткст key, inout double val)
    {
        return wxConfigBase_ReadDbl(wxobj, key, val);
    }

    public бул Read(ткст key, inout double val, double defVal)
    {
        return wxConfigBase_ReadDblDef(wxobj, key, val, defVal);
    }

    //---------------------------------------------------------------------

    public бул Read(ткст key, inout бул val)
    {
        return wxConfigBase_ReadBool(wxobj, key, val);
    }

    public бул Read(ткст key, inout бул val, бул defVal)
    {
        return wxConfigBase_ReadBoolDef(wxobj, key, val, defVal);
    }

    //---------------------------------------------------------------------

    public бул Read(ткст key, inout Шрифт val)
    {
        return Read(key, val, Шрифт.wxNORMAL_FONT);
    }

    public бул Read(ткст key, inout Шрифт val, Шрифт defVal)
    {
        бул ret = да;

        цел pointSize = 0, семейство = 0, стиль = 0, weight = 0, кодировка = 0;
        бул underline = false;
        ткст faceName = "";

        ret &= Read(key ~ "/РазмТочки", pointSize,  cast(цел)defVal.РазмТочки);
        ret &= Read(key ~ "/Семейство",    семейство,     cast(цел)defVal.Семейство);
        ret &= Read(key ~ "/Стиль",     стиль,      cast(цел)defVal.Стиль);
        ret &= Read(key ~ "/Вес",    weight,     cast(цел)defVal.Вес);
        ret &= Read(key ~ "/Underline", underline,  cast(бул)defVal.Underlined);
        ret &= Read(key ~ "/FaceName",  faceName,   defVal.FaceName);
        ret &= Read(key ~ "/Кодировка",  кодировка,   cast(цел)defVal.Кодировка);

        val.РазмТочки   = pointSize;
        val.Семейство      = cast(СемействоШрифтов)семейство;
        val.Стиль       = cast(СтильШрифта)стиль;
        val.Вес      = cast(ВесШрифта)weight;
        val.Underlined  = underline;
        val.FaceName    = faceName;
        val.Кодировка    = cast(FontEncoding)кодировка;

        return ret;
    }

    //---------------------------------------------------------------------

    public бул Read(ткст key, inout Цвет val)
    {
        Цвет def = new Цвет(0, 0, 0);
        return Read(key, val, def);
    }

    private static цел hex2int(ткст стр)
    {
        цел значение = 0;
        foreach(char foo; стр)
        {
            char ch = foo;
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
        ткст стр;
        бул ret = Read(key,стр);
        if (!ret || !стр || стр[0]!='#')
        {
            //    val = defval;
        }
        else
        {
            бцел c = hex2int(стр[1..стр.length]);

            цел r = (c>>16)&255;
            цел g = (c>>8)&255;
            цел b = c&255;

            val = new Цвет(cast(ubyte)r, cast(ubyte)g, cast(ubyte)b);
        }
        return ret;
        /*
                    бул ret = да;
                    цел r = 0, b = 0, g = 0;

                    ret &= Read(key ~ "/Red",   r, cast(цел)defVal.Red);
                    ret &= Read(key ~ "/Blue",  b, cast(цел)defVal.Blue);
                    ret &= Read(key ~ "/Green", g, cast(цел)defVal.Green);

                    val = new Цвет(cast(ubyte)r, cast(ubyte)g, cast(ubyte)b);

                    return ret;
        */
    }

    //---------------------------------------------------------------------
    /+
    public ткст Read(ткст key, ткст defVal)
    {
        return cast(ткст) new wxString(wxConfigBase_ReadStrRet(wxobj, key, defVal), да);
    }
    +/
    public цел Read(ткст key, цел defVal)
    {
        return wxConfigBase_ReadIntRet(wxobj, key, defVal);
    }

    public бул Read(ткст key, бул defVal)
    {
        бул val = false;
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
        return wxConfigBase_WriteStr(wxobj, key, val);
    }

    public бул Write(ткст key, цел val)
    {
        return wxConfigBase_WriteInt(wxobj, key, val);
    }

    public бул Write(ткст key, double val)
    {
        return wxConfigBase_WriteDbl(wxobj, key, val);
    }

    public бул Write(ткст key, бул val)
    {
        return wxConfigBase_WriteBool(wxobj, key, val);
    }

    private static проц tohex(char* s,бцел значение)
    {
        const static char[16] hexdigits = "0123456789ABCDEF";
        s[0] = hexdigits[значение>>4];
        s[1] = hexdigits[значение&15];
    }

    public бул Write(ткст key, Цвет col)
    {
        /*
                    бул ret = да;
                    ret &= Write(key ~ "/Red",   cast(цел)col.Red);
                    ret &= Write(key ~ "/Blue",  cast(цел)col.Blue);
                    ret &= Write(key ~ "/Green", cast(цел)col.Green);
                    return ret;
        */
        char[] buf = new char[7];
        buf[0] = '#';
        tohex(&buf[1],col.Red);
        tohex(&buf[3],col.Green);
        tohex(&buf[5],col.Blue);
        return Write(key,assumeUnique(buf));
    }

    public бул Write(ткст key, Шрифт val)
    {
        бул ret = да;

        ret &= Write(key ~ "/РазмТочки", cast(цел)val.РазмТочки);
        ret &= Write(key ~ "/Семейство",    cast(цел)val.Семейство);
        ret &= Write(key ~ "/Стиль",     cast(цел)val.Стиль);
        ret &= Write(key ~ "/Вес",    cast(цел)val.Вес);
        ret &= Write(key ~ "/Underline", cast(бул)val.Underlined);
        ret &= Write(key ~ "/FaceName",  val.FaceName);
        ret &= Write(key ~ "/Кодировка",  cast(цел)val.Кодировка);

        return ret;
    }

    //---------------------------------------------------------------------

    public бул Flush(бул bCurrentOnly)
    {
        return wxConfigBase_Flush(wxobj, bCurrentOnly);
    }

    //---------------------------------------------------------------------

    public бул RenameEntry(ткст oldName, ткст newName)
    {
        return wxConfigBase_RenameEntry(wxobj, oldName, newName);
    }

    public бул RenameGroup(ткст oldName, ткст newName)
    {
        return wxConfigBase_RenameGroup(wxobj, oldName, newName);
    }

    //---------------------------------------------------------------------

    public бул DeleteEntry(ткст key, бул bDeleteGroupIfEmpty)
    {
        return wxConfigBase_DeleteEntry(wxobj, key, bDeleteGroupIfEmpty);
    }

    public бул DeleteGroup(ткст key)
    {
        return wxConfigBase_DeleteGroup(wxobj, key);
    }

    public бул DeleteAll()
    {
        return wxConfigBase_DeleteAll(wxobj);
    }

    //---------------------------------------------------------------------

    public бул ExpandEnvVars()
    {
        return wxConfigBase_IsExpandingEnvVars(wxobj);
    }
    public проц ExpandEnvVars(бул значение)
    {
        wxConfigBase_SetExpandEnvVars(wxobj, значение);
    }

    /*public ткст ExpandEnvVars(ткст стр)
    {
        return cast(ткст) new wxString(wxConfigBase_ExpandEnvVars(wxobj, стр));
    }*/

    //---------------------------------------------------------------------

    public проц RecordDefaults(бул значение)
    {
        wxConfigBase_SetRecordDefaults(wxobj, значение);
    }
    public бул RecordDefaults()
    {
        return wxConfigBase_IsRecordingDefaults(wxobj);
    }

    //---------------------------------------------------------------------

    public ткст ИмяАпп()
    {
        return cast(ткст) new wxString(wxConfigBase_GetAppName(wxobj), да);
    }
    public проц ИмяАпп(ткст значение)
    {
        wxConfigBase_SetAppName(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public ткст ИмяВендора()
    {
        return cast(ткст) new wxString(wxConfigBase_GetVendorName(wxobj), да);
    }
    public проц ИмяВендора(ткст значение)
    {
        wxConfigBase_SetVendorName(wxobj, значение);
    }

    //---------------------------------------------------------------------

    public проц Стиль(цел значение)
    {
        wxConfigBase_SetStyle(wxobj, значение);
    }
    public цел Стиль()
    {
        return wxConfigBase_GetStyle(wxobj);
    }

    //---------------------------------------------------------------------
}

