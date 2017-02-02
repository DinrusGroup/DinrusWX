//-----------------------------------------------------------------------------
// wxD/Samples - GLCube.d
//
// A wxD version of the wxWidgets "opengl/cube" sample.
//
// wxGLCanvas demo program
// (c) 1998 Julian Smart
//
// (C) 2006 afb <afb.sourceforge.net>
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: GLCube.d,v 1.6 2008/03/03 11:47:07 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

import wx.GLCanvas;

import gl.gl;

	public class TestGLCanvas : GLCanvas
	{
		public this(Окно родитель, TestGLCanvas other, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя="TestGLCanvas")
		{
			super(родитель, other ? other.context : пусто, ид, поз, size, стиль, имя);

			EVT_SIZE(&OnSize);
			EVT_PAINT(&OnPaint);
			EVT_ERASE_BACKGROUND(&OnEraseBackground);
			EVT_ENTER_WINDOW(&OnEnterWindow);
		}

		public this(Окно родитель, цел ид, Точка поз=wxDefaultPosition, Размер size=wxDefaultSize, цел стиль=0, ткст имя="TestGLCanvas")
		{
			this(родитель, пусто, ид, поз, size, стиль, имя);
		}

		private бцел gllist = 0;

		private проц Render()
		{
		    if (!context()) return;

			// This is a dummy, to avoid an endless succession of paint messages.
			// OnPaint handlers must always create a wxPaintDC.
			auto wxPaintDC dc = new wxPaintDC(this);

			SetCurrent();

			// Init OpenGL once, but after SetCurrent
			if (!init)
			{
				InitGL();
				init = да;
			}

			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();
			glFrustum(-0.5f, 0.5f, -0.5f, 0.5f, 1.0f, 3.0f);
			glMatrixMode(GL_MODELVIEW);
		
			/* clear color and глубина buffers */
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		
			if( gllist == 0 )
			{
				gllist = glGenLists( 1 );
				glNewList(gllist, GL_COMPILE_AND_EXECUTE );
				/* draw six faces of a cube */
				glBegin(GL_QUADS);
				glNormal3f( 0.0f, 0.0f, 1.0f);
				glVertex3f( 0.5f, 0.5f, 0.5f); glVertex3f(-0.5f, 0.5f, 0.5f);
				glVertex3f(-0.5f,-0.5f, 0.5f); glVertex3f( 0.5f,-0.5f, 0.5f);
		
				glNormal3f( 0.0f, 0.0f,-1.0f);
				glVertex3f(-0.5f,-0.5f,-0.5f); glVertex3f(-0.5f, 0.5f,-0.5f);
				glVertex3f( 0.5f, 0.5f,-0.5f); glVertex3f( 0.5f,-0.5f,-0.5f);
		
				glNormal3f( 0.0f, 1.0f, 0.0f);
				glVertex3f( 0.5f, 0.5f, 0.5f); glVertex3f( 0.5f, 0.5f,-0.5f);
				glVertex3f(-0.5f, 0.5f,-0.5f); glVertex3f(-0.5f, 0.5f, 0.5f);
		
				glNormal3f( 0.0f,-1.0f, 0.0f);
				glVertex3f(-0.5f,-0.5f,-0.5f); glVertex3f( 0.5f,-0.5f,-0.5f);
				glVertex3f( 0.5f,-0.5f, 0.5f); glVertex3f(-0.5f,-0.5f, 0.5f);
		
				glNormal3f( 1.0f, 0.0f, 0.0f);
				glVertex3f( 0.5f, 0.5f, 0.5f); glVertex3f( 0.5f,-0.5f, 0.5f);
				glVertex3f( 0.5f,-0.5f,-0.5f); glVertex3f( 0.5f, 0.5f,-0.5f);
		
				glNormal3f(-1.0f, 0.0f, 0.0f);
				glVertex3f(-0.5f,-0.5f,-0.5f); glVertex3f(-0.5f,-0.5f, 0.5f);
				glVertex3f(-0.5f, 0.5f, 0.5f); glVertex3f(-0.5f, 0.5f,-0.5f);
				glEnd();
		
				glEndList();
			}
			else
			{
				glCallList(gllist);
			}
		
	   		glFlush();
	    	SwapBuffers();
		}
		
		private бул init = нет;

		private проц InitGL()
		{
		    SetCurrent();
		
			/* set viewing projection */
			glMatrixMode(GL_PROJECTION);
			glFrustum(-0.5f, 0.5f, -0.5f, 0.5f, 1.0f, 3.0f);
		
			/* position viewer */
			glMatrixMode(GL_MODELVIEW);
			glTranslatef(0.0f, 0.0f, -2.0f);
		
			/* position object */
			glRotatef(30.0f, 1.0f, 0.0f, 0.0f);
			glRotatef(30.0f, 0.0f, 1.0f, 0.0f);
		
			glEnable(GL_DEPTH_TEST);
			glEnable(GL_LIGHTING);
			glEnable(GL_LIGHT0);
		}

		проц OnEnterWindow(Объект sender, Событие e)
		{
    		SetFocus();
		}

		проц OnPaint(Объект sender, Событие e)
		{
    		e.Пропусти();
    		Render();
		}

		проц OnSize(Объект sender, Событие e)
		{
			// set GL viewport (not called by wxGLCanvas::OnSize on all platforms...)
			Размер size = ClientSize();
		
			if (context())
			{
				SetCurrent();
				glViewport(0, 0, cast(GLint) size.Ширина, cast(GLint) size.Высота);
			}
		}

		проц OnEraseBackground(Объект sender, Событие e)
		{
 		  // Do nothing, to avoid flashing.
		}
    }

	public class MyFrame : Фрейм
	{
		enum Cmd { Quit = 1 }

		//---------------------------------------------------------------------

		public this(Окно родитель, ткст title, Точка поз, Размер size, цел стиль=wxDEFAULT_FRAME_STYLE)
		{
			super(родитель, wxID_ANY, title, поз, size, стиль);
			canvas = пусто;

			// Установи the окно иконка

			иконка = new Icon("../Samples/GLCube/mondrian.png");

			// Установи up the event table

    		EVT_MENU( MenuIDs.wxID_EXIT, &ПриВыходе);
    		EVT_MENU( Cmd.Quit, &ПриВыходе);
    		EVT_MENU( MenuIDs.wxID_NEW, &OnNewWindow);
		}
		
		public static MyFrame CreateWindow(MyFrame parentFrame = пусто, бул isCloneWindow = нет)
		{
			ткст str = "wxWidgets OpenGL Cube Sample";
   			if (isCloneWindow) str ~= " - Clone";
 
 		    MyFrame frame = new MyFrame(пусто, str, wxDefaultPosition,
 		    	/* Размер(400, 300) */ wxDefaultSize);

			// Make a menubar
			Меню winMenu = new Меню();
			winMenu.Append(MenuIDs.wxID_EXIT, "&Закрой");
			winMenu.Append(MenuIDs.wxID_NEW, "&Нов");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(winMenu, "&Окно");

			frame.menuBar = menuBar;

			if (parentFrame)
			{
				frame.canvas = new TestGLCanvas(frame, parentFrame.canvas,
					wxID_ANY, wxDefaultPosition, wxDefaultSize );
			}
			else
			{
				frame.canvas = new TestGLCanvas(frame, wxID_ANY,
					wxDefaultPosition, wxDefaultSize);
			}
   
			// moved the Фрейм sizing to after canvas was added,
			// since otherwise the frame showed empty on wxMac ?
			frame.size = Размер(400, 300);

   			// Show the frame
    		frame.Show(да);

			return frame;
		}

		//---------------------------------------------------------------------

		public проц ПриВыходе(Объект sender, Событие e)
		{
    		// да is to force the frame to close
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnNewWindow(Объект sender, Событие e)
		{
			CreateWindow(this, да);
		}

		//---------------------------------------------------------------------
	
	
		TestGLCanvas canvas;
	}

	public class GLCube : Прил
	{
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
   			 // Create the main frame окно
			MyFrame.CreateWindow(пусто);

			return да;
		}

		//---------------------------------------------------------------------

		static проц Main()
		{
			GLCube прил = new GLCube();
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	GLCube.Main();
	return 0;
}
