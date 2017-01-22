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
	// such as stereo, auxiliary buffers, альфа channel, and accum buffer.
	// Other implementations may actually support them.
	
	enum
	{
		WX_GL_RGBA=1,          /* use да color палитра */
		WX_GL_BUFFER_SIZE,     /* bits for buffer if not WX_GL_RGBA */
		WX_GL_LEVEL,           /* 0 for main buffer, >0 for overlay, <0 for underlay */
		WX_GL_DOUBLEBUFFER,    /* use doublebuffer */
		WX_GL_STEREO,          /* use stereoscopic display */
		WX_GL_AUX_BUFFERS,     /* number of auxiliary buffers */
		WX_GL_MIN_RED,         /* use красный buffer with most bits (> MIN_RED bits) */
		WX_GL_MIN_GREEN,       /* use зелёный buffer with most bits (> MIN_GREEN bits) */
		WX_GL_MIN_BLUE,        /* use синий buffer with most bits (> MIN_BLUE bits) */
		WX_GL_MIN_ALPHA,       /* use синий buffer with most bits (> MIN_ALPHA bits) */
		WX_GL_DEPTH_SIZE,      /* bits for Z-buffer (0,16,32) */
		WX_GL_STENCIL_SIZE,    /* bits for stencil buffer */
		WX_GL_MIN_ACCUM_RED,   /* use красный accum buffer with most bits (> MIN_ACCUM_RED bits) */
		WX_GL_MIN_ACCUM_GREEN, /* use зелёный buffer with most bits (> MIN_ACCUM_GREEN bits) */
		WX_GL_MIN_ACCUM_BLUE,  /* use синий buffer with most bits (> MIN_ACCUM_BLUE bits) */
		WX_GL_MIN_ACCUM_ALPHA  /* use синий buffer with most bits (> MIN_ACCUM_ALPHA bits) */
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) проц wxGLContext_SetCurrent(ЦУк сам, ЦУк canvas);
		static extern (C) проц wxGLContext_Update(ЦУк сам);
		static extern (C) проц wxGLContext_SetColour(ЦУк сам, ткст colour);
		static extern (C) проц wxGLContext_SwapBuffers(ЦУк сам);
		static extern (C) ЦУк wxGLContext_GetWindow(ЦУк сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias GLContext wxGLContext;
	public class GLContext : wxObject
	{
		public this(ЦУк шхобъ)
		{ 
			super(шхобъ);
		}
		
		public проц SetCurrent(GLCanvas canvas = пусто)
		{
			wxGLContext_SetCurrent(шхобъ, wxObject.SafePtr(canvas));
		}

		public проц Обнови()
		{
			wxGLContext_Update(шхобъ);
		}
		
		public проц УстЦвет(ткст colour)
		{
			wxGLContext_SetColour(шхобъ, colour);
		}

		public проц SwapBuffers()
		{
			wxGLContext_SwapBuffers(шхобъ);
		}

		public Окно окно()
		{
			return new Окно( wxGLContext_GetWindow(шхобъ) );
		}
	}

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) ЦУк wxGLCanvas_ctor(ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);
		static extern (C) ЦУк wxGLCanvas_ctor2(ЦУк родитель, ЦУк shared_, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);
		static extern (C) ЦУк wxGLCanvas_ctor3(ЦУк родитель, ЦУк shared_, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);

		static extern (C) проц wxGLCanvas_SetCurrent(ЦУк сам);
		static extern (C) проц wxGLCanvas_UpdateContext(ЦУк сам);
		static extern (C) проц wxGLCanvas_SetColour(ЦУк сам, ткст colour);
		static extern (C) проц wxGLCanvas_SwapBuffers(ЦУк сам);
		static extern (C) ЦУк wxGLCanvas_GetContext(ЦУк сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias GLCanvas wxGLCanvas;
	public class GLCanvas : Окно
	{
		public static Палитра wxNullPalette = пусто;
		const ткст wxGLCanvasStr = "GLCanvas";

		public this(Окно родитель, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=пусто, Палитра палитра=wxNullPalette)
			{ this(wxGLCanvas_ctor(wxObject.SafePtr(родитель), ид, поз, size, стиль, имя, attribList, палитра), да); }
		
		public this(Окно родитель, GLContext shared_, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=пусто, Палитра палитра=wxNullPalette)
			{ this(wxGLCanvas_ctor2(wxObject.SafePtr(родитель), wxObject.SafePtr(shared_), ид, поз, size, стиль, имя, attribList, палитра), да); }
		
		public this(Окно родитель, GLCanvas shared_, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=пусто, Палитра палитра=wxNullPalette)
			{ this(wxGLCanvas_ctor3(wxObject.SafePtr(родитель), wxObject.SafePtr(shared_), ид, поз, size, стиль, имя, attribList, палитра), да); }

		public this(Окно родитель, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=пусто, Палитра палитра=wxNullPalette)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя, attribList, палитра); }

		public this(ЦУк шхобъ) 
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}

		public проц SetCurrent()
		{
			wxGLCanvas_SetCurrent(шхобъ);
		}

		public проц UpdateContext()
		{
			wxGLCanvas_UpdateContext(шхобъ);
		}
		
		public проц УстЦвет(ткст colour)
		{
			wxGLCanvas_SetColour(шхобъ, colour);
		}

		public проц SwapBuffers()
		{
			wxGLCanvas_SwapBuffers(шхобъ);
		}

		public GLContext context()
		{
			ЦУк wxctx = wxGLCanvas_GetContext(шхобъ);
			return wxctx ? new GLContext(wxctx) : пусто;
		}
		
	}
