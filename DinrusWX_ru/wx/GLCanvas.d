//-----------------------------------------------------------------------------
// wxD - GLCanvas.d
// (C) 2006 afb <afb@users.sourceforge.net>
//
/// The wxGLCanvas wrapper classes. (Optional, requires OpenGL)
//
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GLCanvas.d,v 1.7 2008/09/26 09:31:17 afb Exp $
//-----------------------------------------------------------------------------

module wx.GLCanvas;
public import wx.common;
public import wx.Window;
public import wx.Palette;

//---------------------------------------------------------------------------
// Constants for attriblist
//---------------------------------------------------------------------------

// The generic GL implementation doesn't support most of these options,
// such as stereo, auxiliary buffers, alpha channel, and accum buffer.
// Other implementations may actually support them.

enum
{
    WX_GL_RGBA=1,          /* use да color палитра */
    WX_GL_BUFFER_SIZE,     /* bits for buffer if not WX_GL_RGBA */
    WX_GL_LEVEL,           /* 0 for main buffer, >0 for overlay, <0 for underlay */
    WX_GL_DOUBLEBUFFER,    /* use doublebuffer */
    WX_GL_STEREO,          /* use stereoscopic display */
    WX_GL_AUX_BUFFERS,     /* number of auxiliary buffers */
    WX_GL_MIN_RED,         /* use red buffer with most bits (> MIN_RED bits) */
    WX_GL_MIN_GREEN,       /* use green buffer with most bits (> MIN_GREEN bits) */
    WX_GL_MIN_BLUE,        /* use blue buffer with most bits (> MIN_BLUE bits) */
    WX_GL_MIN_ALPHA,       /* use blue buffer with most bits (> MIN_ALPHA bits) */
    WX_GL_DEPTH_SIZE,      /* bits for Z-buffer (0,16,32) */
    WX_GL_STENCIL_SIZE,    /* bits for stencil buffer */
    WX_GL_MIN_ACCUM_RED,   /* use red accum buffer with most bits (> MIN_ACCUM_RED bits) */
    WX_GL_MIN_ACCUM_GREEN, /* use green buffer with most bits (> MIN_ACCUM_GREEN bits) */
    WX_GL_MIN_ACCUM_BLUE,  /* use blue buffer with most bits (> MIN_ACCUM_BLUE bits) */
    WX_GL_MIN_ACCUM_ALPHA  /* use blue buffer with most bits (> MIN_ACCUM_ALPHA bits) */
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) проц wxGLContext_SetCurrent(ЦелУкз сам, ЦелУкз canvas);
static extern (C) проц wxGLContext_Update(ЦелУкз сам);
static extern (C) проц wxGLContext_SetColour(ЦелУкз сам, ткст цвет);
static extern (C) проц wxGLContext_SwapBuffers(ЦелУкз сам);
static extern (C) ЦелУкз wxGLContext_GetWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias GLContext wxGLContext;
public class GLContext : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public проц УстCurrent(GLCanvas canvas = null)
    {
        wxGLContext_SetCurrent(wxobj, wxObject.SafePtr(canvas));
    }

    public проц Обнови()
    {
        wxGLContext_Update(wxobj);
    }

    public проц УстColour(ткст цвет)
    {
        wxGLContext_SetColour(wxobj, цвет);
    }

    public проц SwapBuffers()
    {
        wxGLContext_SwapBuffers(wxobj);
    }

    public Окно окно()
    {
        return new Окно( wxGLContext_GetWindow(wxobj) );
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxGLCanvas_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);
static extern (C) ЦелУкз wxGLCanvas_ctor2(ЦелУкз родитель, ЦелУкз shared_, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);
static extern (C) ЦелУкз wxGLCanvas_ctor3(ЦелУкз родитель, ЦелУкз shared_, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);

static extern (C) проц wxGLCanvas_SetCurrent(ЦелУкз сам);
static extern (C) проц wxGLCanvas_UpdateContext(ЦелУкз сам);
static extern (C) проц wxGLCanvas_SetColour(ЦелУкз сам, ткст цвет);
static extern (C) проц wxGLCanvas_SwapBuffers(ЦелУкз сам);
static extern (C) ЦелУкз wxGLCanvas_GetContext(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias GLCanvas wxGLCanvas;
public class GLCanvas : Окно
{
    public static Палитра wxNullPalette = null;
    const ткст wxGLCanvasStr = "GLCanvas";

    public this(Окно родитель, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette)
    {
        this(wxGLCanvas_ctor(wxObject.SafePtr(родитель), ид, поз, Размер, стиль, имя, attribList, палитра), да);
    }

    public this(Окно родитель, GLContext shared_, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette)
    {
        this(wxGLCanvas_ctor2(wxObject.SafePtr(родитель), wxObject.SafePtr(shared_), ид, поз, Размер, стиль, имя, attribList, палитра), да);
    }

    public this(Окно родитель, GLCanvas shared_, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette)
    {
        this(wxGLCanvas_ctor3(wxObject.SafePtr(родитель), wxObject.SafePtr(shared_), ид, поз, Размер, стиль, имя, attribList, палитра), да);
    }

    public this(Окно родитель, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette)
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя, attribList, палитра);
    }

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public проц УстCurrent()
    {
        wxGLCanvas_SetCurrent(wxobj);
    }

    public проц UpdateContext()
    {
        wxGLCanvas_UpdateContext(wxobj);
    }

    public проц УстColour(ткст цвет)
    {
        wxGLCanvas_SetColour(wxobj, цвет);
    }

    public проц SwapBuffers()
    {
        wxGLCanvas_SwapBuffers(wxobj);
    }

    public GLContext context()
    {
        ЦелУкз wxctx = wxGLCanvas_GetContext(wxobj);
        return wxctx ? new GLContext(wxctx) : null;
    }

}
