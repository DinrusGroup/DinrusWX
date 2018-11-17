/// Common structs that do not belong to any particular class
module wx.common;

version = Unicode;
version = __WXMSW__;

interface IDisposable
{
    проц Dispose();
}

interface ICloneable
{
    Объект Clone();
}


/// An implementation-specific тип that is used to represent a pointer or a handle.
typedef проц* ЦелУкз;

version(Unicode)
alias wchar_t wxChar;
else //version(ANSI)
    alias ubyte wxChar;

ткст assumeUnique(char[] s)
{
    return s;    // DMD 2.006
}


class NullPointerException : Exception
{
    this(ткст msg)
    {
        super(msg);
    }
}

class NullReferenceException : Exception
{
    this(ткст msg)
    {
        super(msg);
    }
}

class ArgumentException : Exception
{
    this(ткст msg)
    {
        super(msg);
    }
}

class InvalidOperationException : Exception
{
    this(ткст msg)
    {
        super(msg);
    }
}

class ArgumentNullException : Exception
{
    this(ткст msg)
    {
        super(msg);
    }
}


//public import wx.Defs;
public import wx.wxObject;
public import wx.wxString;
//public import wx.Log;
//public import wx.Event;
//public import wx.EvtHandler;
//public import wx.App;
//public import wx.Utils;

alias Точка wxPoint;
struct Точка
{
    цел X,Y;

    /** struct constructor */
    static Точка opCall(цел x,цел y)
    {
        Точка тчк;
        тчк.X = x;
        тчк.Y = y;
        return тчк;
    }
}

alias Размер wxSize;
struct Размер
{
    цел Ширь,Высь;

    /** struct constructor */
    static Размер opCall(цел w,цел h)
    {
        Размер рм;
        рм.Ширь = w;
        рм.Высь = h;
        return рм;
    }
}

alias Прямоугольник wxRectangle;
struct Прямоугольник
{
    цел X,Y,Ширь,Высь;
    цел  Лево()
    {
        return X;
    }
    проц Лево(цел значение)
    {
        X = значение;
    }
    цел  Верх()
    {
        return Y;
    }
    проц Верх(цел значение)
    {
        Y = значение;
    }

    цел  Право()
    {
        return X + Ширь - 1;
    }
    проц Право(цел значение)
    {
        Ширь = значение - X + 1;
    }
    цел  Низ()
    {
        return Y + Высь - 1;
    }
    проц Низ(цел значение)
    {
        Высь = значение - Y + 1;
    }

    /** struct constructor */
    static Прямоугольник opCall(цел x,цел y,цел w,цел h)
    {
        Прямоугольник прям;
        прям.X = x;
        прям.Y = y;
        прям.Ширь = w;
        прям.Высь = h;
        return прям;
    }
}

alias Прям wxRect;
alias Прямоугольник Прям;

alias new_Rectangle new_Rect;


deprecated Точка new_Point(цел x,цел y)
{
    return Точка(x,y);
}

deprecated Размер new_Size(цел w,цел h)
{
    return Размер(w,h);
}

deprecated Прямоугольник new_Rectangle(цел x,цел y,цел w,цел h)
{
    return Прямоугольник(x,y,w,h);
}


