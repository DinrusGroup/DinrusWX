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
		static extern (C) проц wxGLContext_SetCurrent(IntPtr сам, IntPtr canvas);
		static extern (C) проц wxGLContext_Update(IntPtr сам);
		static extern (C) проц wxGLContext_SetColour(IntPtr сам, ткст цвет);
		static extern (C) проц wxGLContext_SwapBuffers(IntPtr сам);
		static extern (C) IntPtr wxGLContext_GetWindow(IntPtr сам);
		//! \endcond

		//-----------------------------------------------------------------------------

	alias GLContext wxGLContext;
	public class GLContext : wxObject
	{
		public this(IntPtr wxobj);
		public проц УстCurrent(GLCanvas canvas = null);
		public проц Обнови();
		public проц УстColour(ткст цвет);
		public проц SwapBuffers();
		public Окно окно();
	}

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxGLCanvas_ctor(IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);
		static extern (C) IntPtr wxGLCanvas_ctor2(IntPtr родитель, IntPtr shared_, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);
		static extern (C) IntPtr wxGLCanvas_ctor3(IntPtr родитель, IntPtr shared_, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя, цел* attribList, inout Палитра палитра);

		static extern (C) проц wxGLCanvas_SetCurrent(IntPtr сам);
		static extern (C) проц wxGLCanvas_UpdateContext(IntPtr сам);
		static extern (C) проц wxGLCanvas_SetColour(IntPtr сам, ткст цвет);
		static extern (C) проц wxGLCanvas_SwapBuffers(IntPtr сам);
		static extern (C) IntPtr wxGLCanvas_GetContext(IntPtr сам);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	alias GLCanvas wxGLCanvas;
	public class GLCanvas : Окно
	{
		public static Палитра wxNullPalette = null;
		const ткст wxGLCanvasStr = "GLCanvas";

		public this(Окно родитель, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette);
		public this(Окно родитель, GLContext shared_, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette);
		public this(Окно родитель, GLCanvas shared_, цел ид, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette);
		public this(Окно родитель, Точка поз=вхДефПоз, Размер разм=вхДефРазм, цел стиль=0, ткст имя=wxGLCanvasStr,цел* attribList=null, Палитра палитра=wxNullPalette);
		public this(IntPtr wxobj) ;
		private this(IntPtr wxobj, бул memOwn);
		public проц УстCurrent();
		public проц UpdateContext();
		public проц УстColour(ткст цвет);
		public проц SwapBuffers();
		public GLContext context();
	}
