module wx.common;

version = Unicode;
version = __WXMSW__;

public import base: wchar_t;

interface IDisposable
{
	проц Dispose();
}

interface ICloneable
{
	Объект Clone();
}

	/// An implementation-specific тип that is used to represent a pointer or a handle.
	typedef проц* IntPtr;

version(Unicode)
	alias wchar_t wxChar;
else //version(ANSI)
	alias ubyte wxChar;

ткст assumeUnique(char[] s) { return s; } // DMD 2.006


class NullPointerException : Exception
{
	this(ткст msg) ;
}

class NullReferenceException : Exception
{
	this(ткст msg) ;
}

class ArgumentException : Exception
{
	this(ткст msg);
}

class InvalidOperationException : Exception
{
	this(ткст msg);
}

class ArgumentNullException : Exception
{
	this(ткст msg) ;
}

public import wx.wxObject;
public import wx.wxString;


alias Точка wxPoint;
struct Точка
{
	цел X,Y;

	/** struct constructor */
	static Точка opCall(цел x,цел y);
}

alias Размер wxSize;
struct Размер
{
	цел Ширь,Высь;

	/** struct constructor */
	static Размер opCall(цел w,цел h) ;
}

alias Прямоугольник wxRectangle;
struct Прямоугольник
{
	цел X,Y,Ширь,Высь;
	цел  Лево();
	проц Лево(цел значение);
	цел  Верх();
	проц Верх(цел значение) ;

	цел  Право() ;
	проц Право(цел значение);
	цел  Низ();
	проц Низ(цел значение);

	/** struct constructor */
	static Прямоугольник opCall(цел x,цел y,цел w,цел h);
}

alias Прям wxRect;
alias Прямоугольник Прям;

alias new_Rectangle new_Rect;


deprecated Точка new_Point(цел x,цел y);
deprecated Размер new_Size(цел w,цел h);
deprecated Прямоугольник new_Rectangle(цел x,цел y,цел w,цел h);


