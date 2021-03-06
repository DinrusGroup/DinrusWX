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

import derelict.opengl.gl;

	public class TestGLCanvas : GLCanvas
	{
		public this(Окно родитель, TestGLCanvas other, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя="TestGLCanvas")
		{
			super(родитель, other ? other.context : null, ид, поз, Размер, стиль, имя);

			EVT_SIZE(&OnSize);
			EVT_PAINT(&OnPaint);
			EVT_ERASE_BACKGROUND(&OnEraseBackground);
			EVT_ENTER_WINDOW(&OnEnterWindow);
		}

		public this(Окно родитель, цел ид, Точка поз=вхДефПоз, Размер Размер=вхДефРазм, цел стиль=0, ткст имя="TestGLCanvas")
		{
			this(родитель, null, ид, поз, Размер, стиль, имя);
		}

		private бцел gllist = 0;

		private проц Render()
		{
		    if (!context()) return;

			// This is a dummy, to avoid an endless succession of paint messages.
			// OnPaint handlers must always create a wxPaintDC.
			scope wxPaintDC dc = new wxPaintDC(this);

			УстCurrent();

			// Init OpenGL once, but after УстCurrent
			if (!init)
			{
				InitGL();
				init = да;
			}

			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();
			glFrustum(-0.5f, 0.5f, -0.5f, 0.5f, 1.0f, 3.0f);
			glMatrixMode(GL_MODELVIEW);
		
			/* clear color and глубь buffers */
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
		
		private бул init = false;

		private проц InitGL()
		{
		    УстCurrent();
		
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

		проц OnEnterWindow(Объект отправитель, Событие e)
		{
    		УстФокус();
		}

		проц OnPaint(Объект отправитель, Событие e)
		{
    		e.Skip();
    		Render();
		}

		проц OnSize(Объект отправитель, Событие e)
		{
			// set GL viewport (not called by wxGLCanvas::OnSize on all platforms...)
			Размер Размер = РазмерКлиента();
		
			if (context())
			{
				УстCurrent();
				glViewport(0, 0, cast(GLint) Размер.Ширь, cast(GLint) Размер.Высь);
			}
		}

		проц OnEraseBackground(Объект отправитель, Событие e)
		{
 		  // Do nothing, to avoid flashing.
		}
    }

	public class MyFrame : Frame
	{
		enum Cmd { Quit = 1 }

		//---------------------------------------------------------------------

		public this(Окно родитель, ткст title, Точка поз, Размер Размер, цел стиль=wxDEFAULT_FRAME_STYLE)
		{
			super(родитель, wxID_ANY, title, поз, Размер, стиль);
			canvas = null;

			// Уст the окно пиктограмма

			пиктограмма = new Пиктограмма("./data/mondrian.png");

			// Уст up the event table

    		EVT_MENU( MenuIDs.wxID_EXIT, &ПоВыходу);
    		EVT_MENU( Cmd.Quit, &ПоВыходу);
    		EVT_MENU( MenuIDs.wxID_NEW, &OnNewWindow);
		}
		
		public static MyFrame CreateWindow(MyFrame parentFrame = null, бул isCloneWindow = false)
		{
			ткст стр = "wxWidgets OpenGL Cube Sample";
   			if (isCloneWindow) стр ~= " - Clone";
 
 		    MyFrame frame = new MyFrame(null, стр, вхДефПоз,
 		    	/* Размер(400, 300) */ вхДефРазм);

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
					wxID_ANY, вхДефПоз, вхДефРазм );
			}
			else
			{
				frame.canvas = new TestGLCanvas(frame, wxID_ANY,
					вхДефПоз, вхДефРазм);
			}
   
			// moved the Frame sizing to after canvas was added,
			// since otherwise the frame showed empty on wxMac ?
			frame.Размер = Размер(400, 300);

   			// Покажи the frame
    		frame.Покажи(да);

			return frame;
		}

		//---------------------------------------------------------------------

		public проц ПоВыходу(Объект отправитель, Событие e)
		{
    		// да is to сила the frame to close
			Закрой();
		}

		//---------------------------------------------------------------------

		public проц OnNewWindow(Объект отправитель, Событие e)
		{
			CreateWindow(this, да);
		}

		//---------------------------------------------------------------------
	
	
		TestGLCanvas canvas;
	}

	public class GLCube : Апп
	{
		//---------------------------------------------------------------------

		public override бул ПоИниц()
		{
   			 // Создай the main frame окно
			MyFrame.CreateWindow(null);

			return да;
		}

		//---------------------------------------------------------------------

		static проц Main()
		{
			GLCube app = new GLCube();
			app.Пуск();
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	GLCube.Main();
	return 0;
}
